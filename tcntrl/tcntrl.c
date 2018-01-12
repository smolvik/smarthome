#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <signal.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/resource.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <pthread.h>
#include <syslog.h>
#include <fcntl.h>
#include <math.h>

#define CTRL_PORT 12345
#define NLISTENQ 4

#define IP_DAT1SERV "192.168.61.220"
#define IP_DAT2SERV "192.168.61.222"
#define IP_DAT3SERV "192.168.61.223"
#define IP_PWRSERV  "192.168.61.221"
#define DATSERV_PORT 12345
#define PWRSERV_PORT 12345
#define MY_NAME "WiMeter"
#define PIDFILE "/var/run/WiMeter.pid"

struct equitherm_desc
{
	int Tnin;
	float K;
	int Tu0;
	int Tk0;
	int Tkmax;
	int Tkmin;
};

struct esp_serv_desc
{
	struct sockaddr_in addr;
	int in;
	int out;
	struct esp_serv_desc *next;
};

static struct esp_serv_desq *esp_serv_first = 0;
static struct equitherm_desc descEquitherm = {25, 1, 25, 25, 80, 30};

char *serverip;
int port = 1502;
char *comname;
int boderate = 115200;

uint8_t pwr_state = '0';

int8_t temperature[3] = {0, 0, 0};
int8_t esp_link[4] = {'0', '0', '0', '0'};
struct   sockaddr_in serv_addr_list[4];
uint8_t  *serv_mess_list[4];
uint32_t serv_meslen_list[4];

uint32_t comp_controller = 0;
int threshold = 28;

pthread_mutex_t status_mutex = PTHREAD_MUTEX_INITIALIZER;

static int parse_command(int argc, char** argv);

int pidFilehandle;
int pleaseDie = 0;

void signal_handler(int sig)
{
	switch(sig)
	{
		case SIGHUP:
			syslog(LOG_WARNING, "Received SIGHUP signal.");
			break;
		case SIGINT:
		case SIGTERM:
			syslog(LOG_INFO, "Daemon exiting");
			pleaseDie = 1;
			break;
		default:
			syslog(LOG_WARNING, "Unhandled signal %s", strsignal(sig));
			break;
	}
}

int start_server(char *hname)
{
        struct sockaddr_in local;
        int s,rc;
        int yes = 1;

        local.sin_family = AF_INET;
        local.sin_port = htons(CTRL_PORT);

        if(hname != 0){
                inet_aton(hname, &local.sin_addr);
        }else{
                local.sin_addr.s_addr = htonl(INADDR_ANY);
        }

        s = socket(AF_INET, SOCK_STREAM, 0);

        if(s <0)
        {
                perror("socket error");
                syslog(LOG_ERR, "create socket error");
                exit(1);
        }

        if ( setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(int)) == -1 )
        {
                perror("setsockopt");
                syslog(LOG_ERR, "setting socket error");
                exit(1);
        }

        rc = bind(s, (struct sockaddr*) &local, sizeof(local));
        if(rc < 0)
        {
                perror("bind error");
                syslog(LOG_ERR, "bind error");
                exit(1);
        }

        rc = listen(s, NLISTENQ);
        if(rc < 0)
        {
                //perror("listen error");
                syslog(LOG_ERR, "listen error");
                exit(1);
        }

        return s;
}

int send_query(struct sockaddr_in* psaddr, char* mess, int n)
{
 	int s, flag, error, rc;
	struct sockaddr_in saddr;
    fd_set rset, wset;    
    struct timeval tv;	
	
	s = socket(AF_INET, SOCK_STREAM, 0);
	if(s == -1) {
		perror("send_query socket error");
		syslog(LOG_ERR, "send_query socket error");
		return -1;
	}
	
	// set nonblock mode on socket
	flag = fcntl(s, F_GETFL, 0);
	flag = fcntl(s, F_SETFL, flag | O_NONBLOCK);

	if(flag < 0 )
	{
		perror("send_query fcntl error");
		syslog(LOG_ERR, "send_query fcntl error");
		close(s);
		return -1;		
	}

	error = 0;
	
	// connect should return EINPROGRESS
	if( (rc = connect(s, (struct sockaddr*) psaddr, sizeof(saddr))) < 0){
		if(errno != EINPROGRESS) {
			perror("send_query connect error");
			syslog(LOG_ERR, "send_query connect error");
			close(s);
			return -1;					
		}
	}
	
	if(rc != 0)
	{
		FD_ZERO(&rset);
		FD_SET(s, &rset);		
		FD_ZERO(&wset);
		FD_SET(s, &wset);		
		tv.tv_sec = 3;
		tv.tv_usec = 0;
		
		if( (rc = select(s+1, &rset, &wset, 0, &tv)) == 0)
		{
			// timeout
			printf("connect timeout\n");
			close(s);
			return -1;
		} 		
		
		if( (FD_ISSET(s, &rset)) || (FD_ISSET(s, &wset)) )
		{
			int len = sizeof(error);
			if(getsockopt(s, SOL_SOCKET, SO_ERROR, &error, &len) < 0)
			{
				perror("send_query getsockopt error");
				syslog(LOG_ERR, "send_query getsockopt error");
				close(s);
				return -1;
			}
		}else{
			perror("send_query select error");
			syslog(LOG_ERR, "send_query select error");
			close(s);
			return -1;
		}
		
		// restore flags
		flag = fcntl(s, F_SETFL, flag);
				
	}

	if(error)
	{
		close(s);
		return -1;		
	}
	
	if(n > 0){
		if(send(s, mess, n, 0) < 0)
		{
			perror("");
		}
	}
	
	//close(s);
	return s;
}

void init_esp_addr(char *hname, struct sockaddr_in* psaddr)
{
	struct sockaddr_in saddr;
	
	bzero(&saddr, sizeof(saddr));

	inet_aton(hname, &saddr.sin_addr);

	saddr.sin_family = AF_INET;
	saddr.sin_port = htons(CTRL_PORT);	
	
	*psaddr = saddr;	
}

void* server_loop(void *s)
{
	int server_socket = *((int*)s);
	int master_socket;
    fd_set refset;
    fd_set rdset;    
   	uint8_t buf[128];

    /* Maximum file descriptor number */
    int fdmax;  
    int rc;  

    FD_ZERO(&refset);
    FD_SET(server_socket, &refset);

    fdmax = server_socket;

    while(1)
    {
        rdset = refset;
        rc = select(fdmax+1, &rdset, 0, 0, 0);
        if (rc == -1) 
        {
            //perror("Server select() failure.");
            syslog(LOG_ERR, "server select error");
        }

        /* Run through the existing connections looking for data to be
         * read */
        for (master_socket = 0; master_socket <= fdmax; master_socket++) 
        {
			//printf("socket %d\n", master_socket);
            if (FD_ISSET(master_socket, &rdset))
            {				
                if (master_socket == server_socket) 
                {
                    /* A client is asking a new connection */
                    socklen_t addrlen;
                    struct sockaddr_in clientaddr;
                    int newfd;

                    /* Handle new connections */
                    addrlen = sizeof(clientaddr);
                    memset(&clientaddr, 0, sizeof(clientaddr));
                    newfd = accept(server_socket, (struct sockaddr *)&clientaddr, &addrlen);
                    if (newfd == -1) 
                    {
                        //perror("Server accept() error");
                        syslog(LOG_ERR, "server accept error");
                    } else 
                    {
                        FD_SET(newfd, &refset);

                        if (newfd > fdmax) 
                        {
                            /* Keep track of the maximum */
                            fdmax = newfd;
                        }
                        // printf("New connection from %s:%d on socket %d\n",
                        // inet_ntoa(clientaddr.sin_addr), clientaddr.sin_port, newfd);
						
						pthread_mutex_lock(&status_mutex);
							sprintf(buf, "{\"esp_link\":[%d,%d,%d,%d],\"temperature\":[%d,%d,%d],\"pwr_state\":\"%c\",\"Tnin\":\"%d\",\"K\":\"%1.2f\",\"Tu0\":\"%d\",\"Tk0\":\"%d\",\"Tkmax\":\"%d\",\"Tkmin\":\"%d\"}", 
							esp_link[0], esp_link[1], esp_link[2], esp_link[3], temperature[0], temperature[1], temperature[2], pwr_state,
							descEquitherm.Tnin, descEquitherm.K, descEquitherm.Tu0, descEquitherm.Tk0, descEquitherm.Tkmax, descEquitherm.Tkmin);
						pthread_mutex_unlock(&status_mutex);

                        // send status to client
                        send(newfd, buf, strlen(buf), 0);
                    }
                } else
                {
                    /* An already connected client has sent a new message to us*/
					rc=recv(master_socket, buf, 128, 0);
                    if (rc > 0) 
                    {						
						// we've got the mesage
						if(rc < 128){
							buf[rc] = 0;
							printf("%s\n", buf);																						
						}

						//printf("we've got the query len=%d\n", rc);
						// it's query for our server
						pthread_mutex_lock(&status_mutex);
							char *ps = strstr(buf, "K=");
							(ps) && (descEquitherm.K = atof(ps+2));
							
							ps = strstr(buf, "Tu0=");
							(ps) &&  (descEquitherm.Tu0 = atoi(ps+4));
							
							ps = strstr(buf, "Tk0=");
							(ps) &&  (descEquitherm.Tk0 = atoi(ps+4));
							
							ps = strstr(buf, "Tkmax=");
							(ps) &&  (descEquitherm.Tkmax = atoi(ps+6));
							
							ps = strstr(buf, "Tkmin=");
							(ps) &&  (descEquitherm.Tkmin = atoi(ps+6));							
							
							ps = strstr(buf, "Tnin=");
							(ps) &&  (descEquitherm.Tnin = atoi(ps+5));
						pthread_mutex_unlock(&status_mutex);
									
                        //printf("close connection on socket %d\n", master_socket);
                        close(master_socket);

                        // Remove from reference set 
                        FD_CLR(master_socket, &refset);
                        if (master_socket == fdmax) 
                        {
                            fdmax--;
                        }										
						
                    } else 
                    {
                        // Connection closed by the client, end of server 
                        //printf("Connection closed on socket by client %d\n", master_socket);
                        close(master_socket);

                        // Remove from reference set 
                        FD_CLR(master_socket, &refset);
                        if (master_socket == fdmax) 
                        {
                            fdmax--;
                        }
                    }
                }
            }
        } //for
    }

    //printf("Quit the server thread\n");
    return 0;
}

void *sensor_loop(void* s)
{
    int esp_socket;
    int espidx = *((int*)s);
    
    fd_set rdset;    
    int fdmax;  
    int rc;      
    struct timeval tv;
    uint8_t buf[128];

	while(1)
	{
		sleep(1);
		//printf("socket %d\n", espidx);

		//printf("\ntimeout elapsed\n");
				
		esp_socket = send_query((struct sockaddr_in*)(serv_addr_list+espidx), 
						serv_mess_list[espidx], serv_meslen_list[espidx]);

		//printf("socket %d:%d\n", espidx, esp_socket);
		if(esp_socket < 0)
		{
			pthread_mutex_lock(&status_mutex);
				esp_link[espidx] = '0';
			pthread_mutex_unlock(&status_mutex);
			
			continue;
		}

		FD_ZERO(&rdset);						
		FD_SET(esp_socket, &rdset);
		fdmax = esp_socket;

		tv.tv_sec = 1;
		tv.tv_usec = 0;
		rc = select(fdmax+1, &rdset, 0, NULL, &tv);

		if(rc > 0)
		{
			pthread_mutex_lock(&status_mutex);
				esp_link[espidx] = '1';
			pthread_mutex_unlock(&status_mutex);
			
			if (FD_ISSET(esp_socket, &rdset))
			{				
				socklen_t len;
				struct sockaddr_storage addr;
				char ipstr[INET6_ADDRSTRLEN];
				int port;

				len = sizeof addr;
				getpeername(esp_socket, (struct sockaddr*)&addr, &len);
				
				// deal with both IPv4 and IPv6:
				if (addr.ss_family == AF_INET) {
					struct sockaddr_in *s = (struct sockaddr_in *)&addr;
					port = ntohs(s->sin_port);
					inet_ntop(AF_INET, &s->sin_addr, ipstr, sizeof ipstr);
				} else { // AF_INET6
					struct sockaddr_in6 *s = (struct sockaddr_in6 *)&addr;
					port = ntohs(s->sin6_port);
					inet_ntop(AF_INET6, &s->sin6_addr, ipstr, sizeof ipstr);
				}
				//printf("Peer IP address: %s\n", ipstr);
					
				rc=recv(esp_socket, buf, 128, 0);
				if (rc > 0) 
				{						
					// we've got the mesage
					if(rc < 128){
						buf[rc] = 0;
						//printf("%s\n", buf);																						
					}

					struct sockaddr_in *s = (struct sockaddr_in *)&addr;
					if(s->sin_addr.s_addr == serv_addr_list[0].sin_addr.s_addr){
						// got response from power server
						//printf("got response from power server\n");							
					}else
					if(s->sin_addr.s_addr == serv_addr_list[1].sin_addr.s_addr){
						pthread_mutex_lock(&status_mutex);
							temperature[0] = atoi(buf);
						pthread_mutex_unlock(&status_mutex);
						//printf("got response from sensor1\n");
					}else
					if(s->sin_addr.s_addr == serv_addr_list[2].sin_addr.s_addr){
						pthread_mutex_lock(&status_mutex);
							temperature[1] = atoi(buf);
						pthread_mutex_unlock(&status_mutex);
						//printf("got response from sensor2\n");
					}else
					if(s->sin_addr.s_addr == serv_addr_list[3].sin_addr.s_addr){
						pthread_mutex_lock(&status_mutex);
							temperature[2] = atoi(buf);
						pthread_mutex_unlock(&status_mutex);
						//printf("got response from sensor2\n");
					}
				}				
			}
			
		}else if(rc == 0){
			// timeout
			pthread_mutex_lock(&status_mutex);
				esp_link[espidx] = '0';
			pthread_mutex_unlock(&status_mutex);
		}
				
		close(esp_socket);					
	}
		
    //printf("Quit the sensor loop");
    return 0;
}

// proc for creating daemon
void make_daemon(void)
{
	int fd0, fd1, fd2, i;
	struct rlimit flim;
	char str[16];

	signal(SIGTTOU, SIG_IGN);
	signal(SIGTTIN, SIG_IGN);
	signal(SIGTSTP, SIG_IGN);
	
	signal(SIGHUP, signal_handler);
	signal(SIGINT, signal_handler);
	signal(SIGTERM, signal_handler);
	
	if(fork() != 0)
	{
	  exit(0);
	}

	umask(027); // Set file permissions 750 

	setsid();

	// close all handles
	getrlimit(RLIMIT_NOFILE, &flim);
	for(i = 0; i < flim.rlim_max; i ++)
	{
	  close(i);
	}

	chdir("/");

	//setlogmask(LOG_UPTO(LOG_INFO));
	openlog(MY_NAME, 0, LOG_USER);

	fd0 = open("/dev/null", O_RDWR);
	fd1 = dup(0);
	fd2 = dup(0);
	if(fd0 != 0 || fd1 != 1 || fd2 != 2)
	{
	  syslog(LOG_ERR, "error descriptors");
	  exit(1);
	}		
	
	pidFilehandle = open(PIDFILE, O_RDWR|O_CREAT, 0600);	
	
	if (pidFilehandle == -1 )
	{
		/* Couldn't open lock file */
		syslog(LOG_INFO, "Could not open PID lock file %s, exiting", PIDFILE);
		exit(EXIT_FAILURE);
	}
         
	/* Try to lock file */
	if (lockf(pidFilehandle,F_TLOCK,0) == -1)
	{
		/* Couldn't get lock on lock file */
		syslog(LOG_INFO, "Could not lock PID lock file %s, exiting", PIDFILE);
		exit(EXIT_FAILURE);
	}
        
	/* Get and format PID */
	sprintf(str,"%d\n",getpid());
	 
	/* write pid to lockfile */
	write(pidFilehandle, str, strlen(str));	
}
/*
int get_tboiler(int t)
{
	int x[13] = {-30, -25, -20, -15, -10, -5, 0, 5, 10, 15, 20, 25, 30};
	float y[13] = {80.0, 78.7, 71.6, 64.6, 57.5, 50.4, 43.4, 36.3, 30.0, 30.0, 0.0, 0.0, 0.0};
	int i;
	
	for(i = 0; i < 13; i++)
	{
		if(t > x[i]) continue;
		if(t == x[i]) return y[i];
		break;
	}			
		
	return round( y[i-1] + ((y[i]-y[i-1])/(x[i]-x[i-1]))*(t-x[i-1]) );
}
*/

int get_tboiler(int tu)
{
	int tk = (descEquitherm.Tu0-tu)*descEquitherm.K + descEquitherm.Tk0;
	(tk > descEquitherm.Tkmax) && (tk = descEquitherm.Tkmax);
	(tk < descEquitherm.Tkmin) && (tk = descEquitherm.Tkmin);
	return round(tk);
}

int main(int argc, char*argv[])
{
    pthread_t serv_thread_id;
    pthread_t sens_thread_id;
    int server_socket;
    int n1 = 0, n2 = 1, n3 = 2 ,n4 = 3;
	int tinhist = 0;
	int touthist = 0;    

	init_esp_addr(IP_PWRSERV, &serv_addr_list[0]);
	init_esp_addr(IP_DAT1SERV, &serv_addr_list[1]);
	init_esp_addr(IP_DAT2SERV, &serv_addr_list[2]);
	init_esp_addr(IP_DAT3SERV, &serv_addr_list[3]);

	serv_mess_list[0] = &pwr_state;
	serv_mess_list[1] = 0;
	serv_mess_list[2] = 0;
	serv_mess_list[3] = 0;

	serv_meslen_list[0] = 1;
	serv_meslen_list[1] = 0;
	serv_meslen_list[2] = 0;
	serv_meslen_list[3] = 0;

/*
	parse_command(argc, argv);
	printf("%u\n", boderate);
	printf("%s\n", comname);
	printf("%s\n", serverip);
	printf("%u\n", port);
*/

    make_daemon();

	server_socket = start_server(0);

	pthread_create(&serv_thread_id, 0, &server_loop, &server_socket);
	//pthread_create(&sens_thread_id, 0, &sensor_loop, 0);

	pthread_create(&sens_thread_id, 0, &sensor_loop, &n1);
	pthread_create(&sens_thread_id, 0, &sensor_loop, &n2);
	pthread_create(&sens_thread_id, 0, &sensor_loop, &n3);
	pthread_create(&sens_thread_id, 0, &sensor_loop, &n4);

	while(1)
	{
		int sw;
		int th;
		int t1,t2;
		
		usleep(500000);
/*
		pthread_mutex_lock(&status_mutex);				
			t1 = temperature[0];
			t2 = temperature[1];
			sw = (comp_controller < 3)?comp_controller:0;
			th = threshold;
			pwr_state = (temperature[sw] > th)?'1':'0';											
		pthread_mutex_unlock(&status_mutex);
*/

		pthread_mutex_lock(&status_mutex);
			int toutdoor = temperature[0]; // температура снаружи
			int tboiler = temperature[1];  // температура теплоносителя в котле		
			int tindoor = temperature[2];  // температура внутри
			int tboil_lim = get_tboiler(toutdoor) + touthist;
			
			if(tindoor > descEquitherm.Tnin + tinhist) {
				pwr_state = '0'; 
				//tinhist = -10;
				}
			else {
				tinhist = 0;
				if(tboiler > tboil_lim)
				{
					touthist = -2;
					 pwr_state = '0';
				}
				  else {
					  touthist = 0;
					  pwr_state = '1';
				  }
			  }
		
		//printf("%d:%d:%c\n", tboiler, touthist, pwr_state);
		pthread_mutex_unlock(&status_mutex);

				/*		
		printf("threshold=%d:comp_controller=%d:pwr_state=%c:T1=%d:T2=%d:link=%c:%c:%c\n", 
		th, sw,pwr_state,t1,t2,esp_link[0],esp_link[1],esp_link[2]);
		*/
/*		
pthread_mutex_lock(&status_mutex);
		printf("K=%f:Tu0=%d:Tk0=%d:Tkmax=%d:Tkmin=%d:tk=%d\n", 
		descEquitherm.K, descEquitherm.Tu0, descEquitherm.Tk0, descEquitherm.Tkmax, descEquitherm.Tkmin,
		get_tboiler(temperature[0]));
pthread_mutex_unlock(&status_mutex);
*/		
		if(pleaseDie) break;		
	}

    //printf("Quit the loop");
    syslog(LOG_INFO, "terminate");
    return 0;
}

int parse_command(int argc, char** argv)
{
  int i = 0;

  if(argc < 5) return 0;

  for(i = 1; i < argc; i++)
  {
	  if(argv[i][0]=='-')
	  {
			switch(argv[i][1])
			{
				case 'd':
					comname = argv[i]+2;
					break;
					
				case 'b':
					boderate = atoi(&argv[i][2]);
					break;	
									
				case 'i':
					serverip = argv[i]+2;
					break;
					
				case 'p':
					port = atoi(&argv[i][2]);
					break;					
															
				default:
					return 0;
			}
	 	}

 	}/* for(i = 1; i < argc; i++) */

  return 1;
}
