#include "stdint.h"

char *strstr(const char *s1, const char *s2)
{
        register const char *s = s1;
        register const char *p = s2;

        do {
                if (!*p) {
                        return (char *) s1;
                }
                if (*p == *s) {
                        ++p;
                        ++s;
                } else {
                        p = s2;
                        if (!*s) {
                                return 0;
                        }
                        s = ++s1;
                }
        } while (1);
}

int strncmp(const char *s1, const char *s2, int n)
{
	int r = 0;

	while ( n-- && ((r = ((int)(*((char *)s1))) - *((char *)s2++))== 0) && *s1++ );

	return r;
}

int strlen(const char *s)
{
        register const char *p;

        for (p=s ; *p ; p++);

        return (p - s);
}

uint32_t itoa(uint8_t *p, uint32_t n)
{
	uint8_t a[4];
	uint32_t i,j;
	
	for(i = 3; i >= 0; i--){
		uint32_t r;
		r = n%10;
		n = n/10;		
		a[i] = r;
		if(n == 0) break;
	}
	
	j =0;
	for(;i < 4; i++){
		p[j++] = a[i] + 0x30;
	}
	p[j] = 0;
	
	return j;	
}

int atoi(const char *s)
{
	int sign = 0, val = 0; 
	
	if(s) while( ((*s == ' ')||(*s == '\t')) && *(++s) ); else return 0;
	sign = ((*s == '-') && *s++)?-1:(((*s == '+') && (*s++)),1);
	while((*s >= '0') && (*s <= '9')) {	val *= 10; val += *s++ - '0';}
	return sign*val;
}

uint32_t tohex(uint32_t a, uint8_t* p, uint32_t n)
{                    
    uint8_t tet;
    uint32_t i;
    
    for(i = 0; i < n; i++)
    {
        tet =  (a >> 4*i) & 0x0F;            
        
        if(tet < 10)      
            p[n-1-i] = 0x30 + tet; 
        else
            p[n-1-i] = 0x37 + tet;
            
     }
     
     p[i] = 0;
     return i;
}

uint32_t hextob(uint8_t* p, uint32_t n)
{
    uint32_t i;
    uint32_t res = 0;
    uint8_t num;
    uint32_t wt = 1 << (4*(n-1));
        
    for(i = 0; i < n; i ++)
    {
        if( (p[i] < 0x30) || (p[i] > 0x46) ) break;
        if( (p[i] > 0x39) && (p[i] < 0x41) ) break;        
        
        if(p[i] <= 0x39) num = p[i] - 0x30;
        else num = p[i] - 0x37;        
			
        res += wt*num;
        wt = wt >> 4;
    }         
    
    return res;
}

uint8_t* unc_to_utf(uint16_t unc, uint8_t *p)
{
	if(unc <= 0x007f) {	
		*p++ = (uint8_t)unc;
	}
	else{		
		uint16_t utf = ((unc << 2) & 0x1f00) | (unc & 0x3f) | 0xc080;
		*p++ = (uint8_t)((utf & 0xff00) >> 8);
		*p++ = (uint8_t)(utf & 0x00ff);
	}
	
	return p;		
}

uint32_t utf_to_unc(uint8_t *utf, uint16_t *unc)
{
	if((utf[0] & 0x80) == 0) {
		*unc = (uint16_t)utf[0];
		return 1;
	}
	else
	if((utf[0] & 0xe0) == 0xc0) {
		*unc = (uint16_t)(((utf[0] & 0x1f) << 6) | (0x3f & utf[1]));
		return 2;
	}
	
	return 0;		
}
