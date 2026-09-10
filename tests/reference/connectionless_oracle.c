#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <ctype.h>
typedef unsigned char byte;typedef struct{int type;byte ip[4];unsigned short port;}netadr_t;typedef struct{byte data[512];int cursize,readcount,bit;}msg_t;
static char tokens[8][128];static int argc;static char event[256];
static void MSG_BeginReadingOOB(msg_t*m){m->readcount=0;m->bit=0;}static int MSG_ReadLong(msg_t*m){m->readcount+=4;return -1;}static char*MSG_ReadStringLine(msg_t*m){char*s=(char*)&m->data[m->readcount];m->readcount=m->cursize;return s;}
static void Huff_Decompress(msg_t*m,int o){(void)m;sprintf(event,"decompress:%d,",o);}static int Q_strncmp(const char*a,const char*b,int n){return strncmp(a,b,n);}static int Q_stricmp(const char*a,const char*b){while(*a&&*b){int d=tolower(*a++)-tolower(*b++);if(d)return d;}return *a-*b;}
static void Cmd_TokenizeString(const char*s){argc=0;while(*s){while(*s==' ')s++;if(!*s)break;int n=0;while(*s&&*s!=' ')tokens[argc][n++]=*s++;tokens[argc][n]=0;argc++;}}static char*Cmd_Argv(int n){return n<argc?tokens[n]:"";}
static char*NET_AdrToString(netadr_t a){(void)a;return "addr";}static void Com_DPrintf(const char*f,...){(void)f;}
static void mark(const char*s){strcat(event,s);}static void SVC_Status(netadr_t a){(void)a;mark("status");}static void SVC_Info(netadr_t a){(void)a;mark("info");}static void SV_GetChallenge(netadr_t a){(void)a;mark("challenge");}static void SV_DirectConnect(netadr_t a){(void)a;mark("connect");}static void SV_AuthorizeIpPacket(netadr_t a){(void)a;mark("authorize");}static void SVC_RemoteCommand(netadr_t a,msg_t*m){(void)a;(void)m;mark("rcon");}
#include "connectionless_under_test.inc"
static void run(const char*s){msg_t m;netadr_t a;memset(&m,0,sizeof(m));memset(&a,0,sizeof(a));memset(m.data,255,4);strcpy((char*)m.data+4,s);m.cursize=5+(int)strlen(s);event[0]=0;SV_ConnectionlessPacket(a,&m);printf("%s|%s\n",s,event);}
int main(void){run("getstatus x");run("GETINFO x");run("getchallenge");run("connect \\protocol\\68");run("ipAuthorize x");run("rcon p status");run("disconnect");run("unknown");return 0;}
