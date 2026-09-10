/* Host for unchanged CL_DisconnectPacket and CL_ConnectionlessPacket. */
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
typedef unsigned char byte;typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define MAX_STRING_TOKENS 1024
#define MAX_INFO_STRING 1024
#define NS_CLIENT 0
#define RETRANSMIT_TIMEOUT 3000
#define PROTOCOL_VERSION 68
#define CVAR_USERINFO 2
#define ERR_FATAL 0
enum {CA_UNINITIALIZED,CA_DISCONNECTED,CA_AUTHORIZING,CA_CONNECTING,CA_CHALLENGING,CA_CONNECTED,CA_LOADING,CA_PRIMED,CA_ACTIVE,CA_CINEMATIC};
typedef struct {int type;byte ip[4];unsigned short port;} netadr_t;
typedef struct {netadr_t remoteAddress;int qport;} netchan_t;
typedef struct {qboolean allowoverflow,overflowed,oob;byte*data;int maxsize,cursize,readcount,bit;} msg_t;
typedef struct {int state,realtime;} clientStatic_t;
typedef struct {int lastPacketSentTime,connectTime,connectPacketCount,challenge;char serverMessage[MAX_STRING_TOKENS];netadr_t serverAddress;netchan_t netchan;int lastPacketTime,demoplaying;} clientConnection_t;
static clientStatic_t cls;static clientConnection_t clc;static char events[4096],tokens[16][1024];static int argcnt,cvar_modifiedFlags=CVAR_USERINFO;
static void add(const char*s){if(events[0])strcat(events,",");strcat(events,s);}static int same(netadr_t a,netadr_t b,int port){return a.type==b.type&&!memcmp(a.ip,b.ip,4)&&(!port||a.port==b.port);}
static void MSG_BeginReadingOOB(msg_t*m){m->readcount=0;m->bit=0;m->oob=1;}static int MSG_ReadLong(msg_t*m){unsigned v=(unsigned)m->data[m->readcount]|((unsigned)m->data[m->readcount+1]<<8)|((unsigned)m->data[m->readcount+2]<<16)|((unsigned)m->data[m->readcount+3]<<24);m->readcount+=4;m->bit=m->readcount*8;return(int)v;}
static char readbuf[2048];static char*readtext(msg_t*m,int line){int n=0,c;while(m->readcount<m->cursize&&n<(int)sizeof(readbuf)-1){c=m->data[m->readcount++];m->bit=m->readcount*8;if(!c||(line&&c=='\n'))break;readbuf[n++]=(char)c;}readbuf[n]=0;return readbuf;}static char*MSG_ReadStringLine(msg_t*m){return readtext(m,1);}static char*MSG_ReadString(msg_t*m){return readtext(m,0);}
static void Cmd_TokenizeString(const char*s){argcnt=0;while(*s&&argcnt<16){while(*s&&((unsigned char)*s<=32))s++;if(!*s)break;{int n=0;while(*s&&(unsigned char)*s>32&&n<1023)tokens[argcnt][n++]=*s++;tokens[argcnt][n]=0;argcnt++;}}}static char*Cmd_Argv(int i){return i>=0&&i<argcnt?tokens[i]:"";}
static int Q_stricmp(const char*a,const char*b){for(;;a++,b++){int x=*a,y=*b;if(x>='A'&&x<='Z')x+=32;if(y>='A'&&y<='Z')y+=32;if(x!=y||!x||!y)return x-y;}}static int Q_strncmp(const char*a,const char*b,int n){return strncmp(a,b,(size_t)n);}static void Q_strncpyz(char*d,const char*s,int n){if(n<1)return;strncpy(d,s,(size_t)n-1);d[n-1]=0;}
static int NET_CompareAdr(netadr_t a,netadr_t b){return same(a,b,1);}static int NET_CompareBaseAdr(netadr_t a,netadr_t b){return same(a,b,0);}static const char*NET_AdrToString(netadr_t a){(void)a;return"adr";}
static void Com_Printf(const char*f,...){if(strstr(f,"Server disconnected"))add("warn");else if(!strcmp(f,"%s")){va_list a;const char*s;va_start(a,f);s=va_arg(a,const char*);va_end(a);strcat(events,"print:");strcat(events,s);}}static void Com_DPrintf(const char*f,...){(void)f;}static void Cvar_Set(const char*n,const char*v){(void)n;(void)v;add("cvar");}static float Cvar_VariableValue(const char*n){(void)n;return 4242;}
static void Com_Error(int c,const char*f,...){(void)c;(void)f;abort();}static const char*Cvar_InfoString(int f){(void)f;return "\\name\\p";}static char vabuf[32];static char*va(const char*f,...){va_list a;va_start(a,f);vsnprintf(vabuf,sizeof(vabuf),f,a);va_end(a);return vabuf;}
static void Info_SetValueForKey(char*s,const char*k,const char*v){char old[1024];strcpy(old,s);snprintf(s,1024,"\\%s\\%s%s",k,v,old);}static int Sys_IsLANAddress(netadr_t a){return a.ip[3]==1;}static void CL_RequestAuthorization(void){add("auth");}
static void CL_Disconnect(qboolean show){(void)show;cls.state=CA_DISCONNECTED;add("drop");}static void Netchan_Setup(int sock,netchan_t*n,netadr_t a,int q){(void)sock;n->remoteAddress=a;n->qport=q;}
static void CL_ServerInfoPacket(netadr_t a,msg_t*m){char tmp[1100];(void)a;snprintf(tmp,sizeof(tmp),"info:%s",MSG_ReadString(m));add(tmp);}static void CL_ServerStatusResponse(netadr_t a,msg_t*m){char tmp[1100];(void)a;snprintf(tmp,sizeof(tmp),"status:%s",MSG_ReadStringLine(m));add(tmp);}static void CL_MotdPacket(netadr_t a){(void)a;add("motd");}static void CL_ServersResponsePacket(netadr_t a,msg_t*m){(void)a;(void)m;add("servers");}
static void NET_OutOfBandPrint(int s,netadr_t a,const char*f,...){char tmp[1100];va_list v;(void)s;(void)a;va_start(v,f);vsnprintf(tmp,sizeof(tmp),f,v);va_end(v);if(events[0])strcat(events,",");strcat(events,"oob:");strcat(events,tmp);}static void NET_OutOfBandData(int s,netadr_t a,const byte*d,int n){char tmp[1300];(void)s;(void)a;snprintf(tmp,sizeof(tmp),"data:%.*s:%d",n,d,n);add(tmp);}
#include "client_connectionless_under_test.inc"
static netadr_t adr(int a,int port){netadr_t n={4,{1,2,3,(byte)a},(unsigned short)port};return n;}static void reset(void){memset(&cls,0,sizeof(cls));memset(&clc,0,sizeof(clc));events[0]=0;clc.serverAddress=adr(4,27960);clc.netchan.remoteAddress=clc.serverAddress;clc.lastPacketTime=0;cls.realtime=5000;}
static void run(const char*tag,int state,netadr_t from,const char*line,const char*tail){byte b[4096]={255,255,255,255};msg_t m;int n=(int)strlen(line);reset();cls.state=state;memcpy(b+4,line,(size_t)n);b[4+n++]='\n';if(tail){memcpy(b+4+n,tail,strlen(tail)+1);n+=(int)strlen(tail)+1;}memset(&m,0,sizeof(m));m.data=b;m.cursize=4+n;m.maxsize=sizeof(b);CL_ConnectionlessPacket(from,&m);printf("%s|%d|%d|%d|%d|%d|%d|%s|%s\n",tag,cls.state,clc.challenge,clc.connectPacketCount,clc.connectTime,clc.serverAddress.port,clc.netchan.qport,clc.serverMessage,events);}
static void resend(const char*t,int state,int now,int then,int demo,int last){reset();cls.state=state;cls.realtime=now;clc.connectTime=then;clc.demoplaying=demo;clc.serverAddress.ip[3]=(byte)last;clc.challenge=765;cvar_modifiedFlags=CVAR_USERINFO;CL_CheckForResend();printf("%s|%d|%d|%d|%d|%s\n",t,clc.connectPacketCount,clc.connectTime,cls.state,cvar_modifiedFlags,events);}
int main(void){run("challenge",CA_CONNECTING,adr(9,3000),"challengeResponse 12345",NULL);run("challenge_bad",CA_CONNECTED,adr(9,3000),"CHALLENGERESPONSE 8",NULL);run("connect",CA_CHALLENGING,adr(4,3001),"connectResponse",NULL);run("connect_wrong",CA_CHALLENGING,adr(8,3001),"connectResponse",NULL);run("connect_dup",CA_CONNECTED,adr(4,3001),"connectResponse",NULL);run("info",CA_DISCONNECTED,adr(2,1),"infoResponse","\\protocol\\68");run("status",CA_DISCONNECTED,adr(2,1),"statusResponse","\\sv_hostname\\Q3\n");run("disconnect",CA_ACTIVE,adr(4,27960),"disconnect",NULL);reset();cls.state=CA_ACTIVE;cls.realtime=1000;{byte b[64]={255,255,255,255};msg_t m={0};memcpy(b+4,"disconnect\n",11);m.data=b;m.cursize=15;m.maxsize=64;CL_ConnectionlessPacket(adr(4,27960),&m);printf("disconnect_fresh|%d|%s\n",cls.state,events);}run("print",CA_CONNECTING,adr(4,1),"print","hello world");run("echo",CA_DISCONNECTED,adr(2,1),"echo pong",NULL);run("unknown",CA_DISCONNECTED,adr(2,1),"something",NULL);resend("resend_demo",CA_CONNECTING,5000,0,1,9);resend("resend_wait",CA_CONNECTING,2999,0,0,9);resend("resend_wan",CA_CONNECTING,5000,0,0,9);resend("resend_lan",CA_CONNECTING,5000,0,0,1);resend("resend_connect",CA_CHALLENGING,5000,0,0,9);return 0;}
