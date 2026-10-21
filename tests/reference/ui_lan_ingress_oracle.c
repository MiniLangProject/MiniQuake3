#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

typedef unsigned char byte;
typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define NA_IP 4
#define NA_BROADCAST 3
#define NA_IPX 5
#define NA_BROADCAST_IPX 6
#define AS_LOCAL 0
#define MAX_INFO_STRING 1024
#define MAX_NAME_LENGTH 64
#define MAX_PINGREQUESTS 32
#define MAX_SERVERSTATUSREQUESTS 16
#define MAX_OTHER_SERVERS 128
#define MAX_GLOBAL_SERVERS 4096
#define MAX_SERVERSPERPACKET 256
#define PROTOCOL_VERSION 68

typedef struct { int type; byte ip[4]; unsigned short port; } netadr_t;
typedef struct { byte ip[4]; unsigned short port; } serverAddress_t;
typedef struct { netadr_t adr; int clients,maxClients,maxPing,minPing,ping,gameType,netType,punkbuster; char hostName[MAX_NAME_LENGTH],mapName[MAX_NAME_LENGTH],game[MAX_NAME_LENGTH]; int visible; } serverInfo_t;
typedef struct { byte *data; int cursize; const char **strings; int stringIndex; } msg_t;
typedef struct { netadr_t adr; int time,start; char info[MAX_INFO_STRING]; } ping_t;
typedef struct { netadr_t address; int retrieved,pending,print,time,startTime; char string[4096]; } serverStatus_t;
typedef struct {
 int numglobalservers,numGlobalServerAddresses,nummplayerservers,numlocalservers,masterNum,pingUpdateSource,realtime;
 serverInfo_t localServers[MAX_OTHER_SERVERS],mplayerServers[MAX_OTHER_SERVERS],globalServers[MAX_GLOBAL_SERVERS],favoriteServers[MAX_OTHER_SERVERS];
 serverAddress_t globalServerAddresses[MAX_GLOBAL_SERVERS];
} clientStatic_t;
static clientStatic_t cls;
static ping_t cl_pinglist[MAX_PINGREQUESTS];
static serverStatus_t cl_serverStatusList[MAX_SERVERSTATUSREQUESTS];
static int serverStatusCount;

static unsigned short BigShort(unsigned short v) { return (unsigned short)((v>>8)|(v<<8)); }
static int NET_CompareAdr(netadr_t a,netadr_t b) { return a.type==b.type && a.port==b.port && !memcmp(a.ip,b.ip,4); }
static void Q_strncpyz(char *to,const char *from,size_t size) { if(!size)return; snprintf(to,size,"%s",from?from:""); }
static const char *Info_ValueForKey(const char *text,const char *key) {
 static char result[2][MAX_INFO_STRING]; static int slot; const char *p=text?text:""; slot^=1; result[slot][0]=0;
 while(*p){ const char *ks,*vs; size_t kl,vl; if(*p=='\\')p++;ks=p;while(*p&&*p!='\\')p++;kl=(size_t)(p-ks);if(*p=='\\')p++;vs=p;while(*p&&*p!='\\')p++;vl=(size_t)(p-vs);if(strlen(key)==kl&&!strncmp(ks,key,kl)){if(vl>=sizeof(result[slot]))vl=sizeof(result[slot])-1;memcpy(result[slot],vs,vl);result[slot][vl]=0;return result[slot];}}
 return result[slot];
}
static void Info_SetValueForKey(char *text,const char *key,const char *value) { size_t n=strlen(text); snprintf(text+n,MAX_INFO_STRING-n,"\\%s\\%s",key,value); }
static const char *MSG_ReadString(msg_t *msg) { const char *s=msg->strings[msg->stringIndex]; if(s)msg->stringIndex++; return s?s:""; }
static const char *MSG_ReadStringLine(msg_t *msg) { return MSG_ReadString(msg); }
static void Com_Printf(const char *fmt,...) { (void)fmt; }
static void Com_DPrintf(const char *fmt,...) { (void)fmt; }
static const char *NET_AdrToString(netadr_t address) { static char out[64];snprintf(out,sizeof(out),"%u.%u.%u.%u:%u",address.ip[0],address.ip[1],address.ip[2],address.ip[3],BigShort(address.port));return out; }
static const char *va(const char *fmt,...) { static char out[64];va_list ap;va_start(ap,fmt);vsnprintf(out,sizeof(out),fmt,ap);va_end(ap);return out; }
static int Com_Milliseconds(void) { return 777; }
static void Com_sprintf(char *dest,int size,const char *fmt,...) { va_list ap;va_start(ap,fmt);vsnprintf(dest,(size_t)size,fmt,ap);va_end(ap); }

#include "ui_lan_ingress_under_test.inc"

static netadr_t adr(int a,int b,int c,int d,int port){netadr_t n={NA_IP,{(byte)a,(byte)b,(byte)c,(byte)d},BigShort((unsigned short)port)};return n;}
static void showadr(netadr_t n,char *out,size_t size){snprintf(out,size,"%u.%u.%u.%u:%u",n.ip[0],n.ip[1],n.ip[2],n.ip[3],BigShort(n.port));}
int main(void){
 byte response[]={255,255,255,255,'g','e','t','s','e','r','v','e','r','s','R','e','s','p','o','n','s','e','\\',1,2,3,4,109,56,'\\',5,6,7,8,109,57,'\\','E','O','T',0};msg_t master={response,(int)sizeof(response),NULL,0};char a[64],b[64];
 memset(&cls,0,sizeof(cls));cls.numglobalservers=-1;cls.nummplayerservers=-1;CL_ServersResponsePacket(adr(9,9,9,9,27950),&master);showadr(cls.globalServers[0].adr,a,sizeof(a));showadr(cls.globalServers[1].adr,b,sizeof(b));printf("servers|%d|%s|%s|%d\n",cls.numglobalservers,a,b,cls.globalServers[0].ping);
 {const char *strings[]={"\\protocol\\68\\hostname\\Arena One\\mapname\\q3dm1\\clients\\3\\sv_maxclients\\8\\game\\baseq3\\gametype\\0\\minping\\0\\maxping\\200\\punkbuster\\0",NULL};msg_t m={NULL,0,strings,0};cl_pinglist[0].adr=adr(1,2,3,4,27960);cl_pinglist[0].start=100;cls.realtime=141;CL_ServerInfoPacket(cl_pinglist[0].adr,&m);printf("info|%d|%s|%s|%d|%s\n",cls.globalServers[0].ping,cls.globalServers[0].hostName,cls.globalServers[0].mapName,cls.globalServers[0].clients,Info_ValueForKey(cl_pinglist[0].info,"nettype"));}
 cls.pingUpdateSource=AS_LOCAL;{const char *bad[]={"\\protocol\\67\\hostname\\Wrong",NULL};msg_t m={NULL,0,bad,0};CL_ServerInfoPacket(adr(10,0,0,1,27960),&m);}{const char *ok[]={"\\protocol\\68\\hostname\\Arena One", "",NULL};msg_t m={NULL,0,ok,0};CL_ServerInfoPacket(adr(10,0,0,2,27960),&m);}showadr(cls.localServers[0].adr,a,sizeof(a));printf("local|%d|%s|%d\n",cls.localServers[0].adr.port?1:0,a,cls.localServers[0].ping);
 cl_serverStatusList[0].address=adr(1,2,3,4,27960);{const char *lines[]={"\\sv_hostname\\Arena One\\mapname\\q3dm1","12 34 \\\"Ranger\\\"","-2 51 \\\"Sarge\\\"","",NULL};msg_t m={NULL,0,lines,0};CL_ServerStatusResponse(cl_serverStatusList[0].address,&m);}printf("status|%s\n",cl_serverStatusList[0].string);
 return 0;
}
