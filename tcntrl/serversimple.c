#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <netdb.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/poll.h>
#include <termios.h>
#include <fcntl.h>
#include <math.h>
#include <signal.h>

//#define DEBUG_STDIN

#define MAXMESSAGESIZE 10*1024
#define PACKSIZE 180
#define BUFSIZE 32*1024
#define POSTMAXSIZE 1024

// com port parameters
//#define COMDEVICE "/dev/ttyS0"
#define BODERATE B9600

// network parameters
char* myserver = "www.trajectory.ho.ua";
char host[128];
int port;

int sockfd;
int comfd;
FILE* logfd;

int pleaseDieNow = 0;

char *script_name = "/write_dgnss.cgi";
//char *script_name = "/cgi-bin/write_dgnss.cgi";

void serial_init(char *name);
void send_http_message(char *buf, int nb);

void handleSignal(int signal)
{
	pleaseDieNow = 1;
}

int add_meshdr(char *message, char *script_name, char *host, int len)
{
	int j=snprintf(message, MAXMESSAGESIZE-1,
"POST %s HTTP/1.0\n\
Host: %s\n\
Content-Length: %d\n\n",
	script_name, host, len);

	return j;
}

int main(int argc, char **argv)
{
	int i, j, ret, numbytes;
	char message[MAXMESSAGESIZE];
	struct termios oldtio, newtio;
	struct pollfd fds[2];
	char buf[BUFSIZE];

	char bufin[BUFSIZE];
	int ird = 0;
	int iwr = 0;
	int fask = 1;

	signal(SIGHUP,  handleSignal);
	signal(SIGINT,  handleSignal);
	signal(SIGQUIT, handleSignal);
	signal(SIGTERM, handleSignal);
	signal(SIGALRM, handleSignal);

	//logfd = fopen("server.log", "w+");
	logfd = stderr;

	if(logfd == NULL) return 1;

	fprintf(logfd, "********************************\ndgnss server\n");

	if(argc >= 2)
	{
		if(2 == sscanf(argv[1], "%[0-9.a-zA-Z]:%d", host, &port))
		{
			fprintf(logfd, "destination host: %s:%d\n", host, port);
		}
		else
		{
			fprintf(logfd, "invalid arguments\n");
			exit(1);
		}
		if(argc == 3)
		{
			serial_init(argv[2]);
			fprintf(logfd, "input device: %s\n", argv[2]);
		}
		else
		{
			comfd = STDIN_FILENO;
			fprintf(logfd, "input device: stdin\n");
		}
	}
	else
	{
		fprintf(logfd, "invalid arguments\n");
		exit(1);
	}

	// prepare for polling
	fds[0].fd = comfd;
	fds[0].events = POLLIN;

	fds[1].fd = -1;
	fds[1].events = POLLIN;

	fask = 1;

	while(pleaseDieNow == 0)
	{
		//printf("start poll\n");
		ret = poll(fds, 2, 3000);
		//printf("exit poll %d\n", ret);

		if(ret > 0)
		{
			if(fds[1].revents & POLLIN)
			{
				numbytes=recv(sockfd, buf, BUFSIZE, 0);
				if(numbytes < 0)
				{
					perror("recv:");
					exit(1);
				}
				else if(numbytes == 0) // EOF test
				{
					fprintf(logfd, "eof received\n\n");
					close(sockfd);
					fds[1].fd = -1;
				}
				else if(numbytes > 0)
				{	// we have response...
					// logging it
					fprintf(logfd, "we have response %u bytes\n", numbytes);
					write(STDOUT_FILENO, buf, numbytes);
					fask = 1;
				}
			}
			if(fds[0].revents & POLLIN)
			{
				numbytes = read(comfd, buf, BUFSIZE);
				if(numbytes < 0)
				{
					perror("serial read:");
					exit(1);
				}

				//write(STDOUT_FILENO, buf, numbytes);
				fprintf(logfd, "read from input device %u bytes\n", numbytes);

				for(i = 0; i < numbytes; i++)
				{
					bufin[iwr] = buf[i];
					iwr = (iwr+1)&(BUFSIZE-1);
					if(iwr == ird)
						fprintf(logfd, "BUFFER OVERFLOW!!!\n");
				}
			}

		}else if(ret == -1)
		{
			perror("poll");
			break;
		}else if(ret == 0) // timeout test
		{
			static int cnt = 0;
			cnt ++;
			fprintf(logfd, "timeout elapsed %d\n", cnt);
		}

		if(fds[1].fd < 0)
		{
			static int lstmessz = 0;

			if(iwr >= ird)	numbytes = iwr-ird;
			else numbytes = iwr-ird+BUFSIZE;

			fprintf(logfd, "buffer size=%u\n", numbytes);

			//fask = 1;

			if(fask)
			{
				if(numbytes)
				{
					if(numbytes > POSTMAXSIZE) numbytes = POSTMAXSIZE;

					// send message to http server
					j = add_meshdr(message, script_name, host, numbytes);
					//fprintf(logfd, "send request:\n%s", message);
					fprintf(logfd, "send request:\n");
					fwrite(message, 1, j, logfd);

					for(i = 0; i < numbytes; i++)
					{
						message[j+i] = bufin[ird];
						ird = (ird+1)&(BUFSIZE-1);
					}

					send_http_message(message, j+numbytes);
					fds[1].fd = sockfd;
					lstmessz = j+numbytes;
					fask = 0;

					// logging for debug purposes
					//write(STDOUT_FILENO, message, j); // header of message
					//write(STDOUT_FILENO, message+j, numbytes); // data of message
				}
			}
			else
			{
				//fprintf(logfd, "repeat request:\n%s", message);
				fprintf(logfd, "repeat last request:\n");
				send_http_message(message, lstmessz);
				fds[1].fd = sockfd;
			}
		}
	}

	fprintf(logfd, "the end\n");

	close(sockfd);

	fflush(logfd);
	fclose(logfd);

	return 0;
}

void send_http_message(char *buf, int nb)
{
	struct hostent *he;
	struct sockaddr_in their_addr; // connector's address information
	int myport = 80;

	if(!(he=gethostbyname(host)))
	{
		perror("gethostbyname");
		exit(1);
	}

	their_addr.sin_family = AF_INET; // host byte order
	their_addr.sin_port = htons(port); // short, network byte order
	their_addr.sin_addr = *((struct in_addr *)he->h_addr);
	memset(&(their_addr.sin_zero), '\0', 8);

	if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
	{
		perror("socket");
		exit(1);
	}
	if(connect(sockfd, (struct sockaddr *)&their_addr, sizeof(struct sockaddr)) == -1)
	{
		perror("connect");
		exit(1);
	}

	if(send(sockfd, buf, nb, 0) != nb)
	{
		perror("send");
		exit(1);
	}

}
//---------------------------------------------------------------------------
void serial_init(char *name)
{
	struct termios oldtio, newtio;

	comfd = open(name, O_RDWR | O_NOCTTY);
	if (comfd == -1)
	{
	  // Could not open the port.
	  perror("Unable to open com port - ");
	  exit(1);
	}
	// setting port
	tcgetattr(comfd, &oldtio);
	bzero(&newtio, sizeof(newtio));
	newtio.c_cflag = BODERATE | CS8 | CLOCAL | CREAD;
	newtio.c_iflag = IGNPAR;// | ICRNL;
	newtio.c_oflag = 0;
	newtio.c_lflag = 0; //ICANON;

	newtio.c_cc[VTIME] = 30;
	newtio.c_cc[VMIN] = PACKSIZE;

	tcflush(comfd, TCIFLUSH);
	tcsetattr(comfd, TCSANOW, &newtio);
}
//---------------------------------------------------------------------------
