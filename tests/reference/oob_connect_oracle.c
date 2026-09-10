#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdint.h>
#include "q_shared.h"
#define MAX_CHALLENGES 1024
#define AUTHORIZE_TIMEOUT 5000
#define PROTOCOL_VERSION 68
#define PORT_AUTHORIZE 27952
#define AUTHORIZE_SERVER_NAME "authorize.quake3arena.com"
#define BASEGAME "baseq3"
#define GT_SINGLE_PLAYER 2
#define NS_SERVER 1
#define CVAR_INIT 1
#define CVAR_SYSTEMINFO 2
#define ERR_FATAL 1
#define SVF_BOT 8
#define GAME_CLIENT_CONNECT 2
#define MAC_STATIC static
enum {NA_BOT,NA_BAD,NA_LOOPBACK,NA_BROADCAST,NA_IP};enum {CS_FREE,CS_ZOMBIE,CS_CONNECTED,CS_PRIMED,CS_ACTIVE};
typedef struct {int type;byte ip[4];unsigned short port;} netadr_t;
typedef struct {netadr_t remoteAddress;int qport,outgoingSequence;} netchan_t;
typedef struct {struct {int svFlags;} r;} sharedEntity_t;
typedef struct {netadr_t adr;int challenge,time,pingTime,firstTime;qboolean connected;} challenge_t;
typedef struct client_s {int state;char userinfo[MAX_INFO_STRING];int reliableSequence,reliableAcknowledge,challenge;sharedEntity_t*gentity;char name[32];int deltaMessage,nextSnapshotTime,lastPacketTime,lastConnectTime,rate,snapshotMsec,gamestateMessageNum;netchan_t netchan;void*netchan_start_queue;void**netchan_end_queue;} client_t;
static struct {int time;client_t*clients;challenge_t challenges[MAX_CHALLENGES];netadr_t authorizeAddress;} svs;
static cvar_t maxclients_store,reconnect_store,minping_store,maxping_store,private_store,strict_store,fs_store;static cvar_t *sv_maxclients=&maxclients_store,*sv_reconnectlimit=&reconnect_store,*sv_minPing=&minping_store,*sv_maxPing=&maxping_store,*sv_privateClients=&private_store,*sv_privatePassword=&private_store,*sv_strictAuth=&strict_store;static void*gvm;
static char privateValue[64],strictValue[8],fsValue[64];
static char argv1[MAX_INFO_STRING],events[4096];static int eventLen,lanFlag,localFlag,heartbeat,drops;static sharedEntity_t entities[8];
static void ev(const char*f,...){va_list a;va_start(a,f);eventLen+=vsnprintf(events+eventLen,sizeof(events)-eventLen,f,a);va_end(a);}
static float Cvar_VariableValue(const char*n){(void)n;return 0;}static cvar_t*Cvar_Get(const char*n,const char*v,int f){(void)n;(void)v;(void)f;return &fs_store;}
static int NET_CompareAdr(netadr_t a,netadr_t b){return a.type==b.type&&!memcmp(a.ip,b.ip,4)&&a.port==b.port;}static int NET_CompareBaseAdr(netadr_t a,netadr_t b){return a.type==b.type&&!memcmp(a.ip,b.ip,4);}static int Sys_IsLANAddress(netadr_t a){(void)a;return lanFlag;}static int NET_IsLocalAddress(netadr_t a){(void)a;return localFlag;}static int NET_StringToAdr(const char*n,netadr_t*a){(void)n;a->type=NA_BAD;return 0;}static char*NET_AdrToString(netadr_t a){static char b[64];sprintf(b,"%d.%d.%d.%d:%d",a.ip[0],a.ip[1],a.ip[2],a.ip[3],a.port);return b;}
static void NET_OutOfBandPrint(int s,netadr_t a,const char*f,...){char b[1024];va_list v;(void)s;(void)a;va_start(v,f);vsnprintf(b,sizeof(b),f,v);va_end(v);ev("%s;",b);}static char*Cmd_Argv(int n){(void)n;return argv1;}
static char*Info_ValueForKey(const char*s,const char*k){static char out[2][256];static int which;char*o=out[which^=1];size_t kl=strlen(k);o[0]=0;while(*s){if(*s=='\\')s++;const char*ks=s;while(*s&&*s!='\\')s++;size_t n=s-ks;if(*s)s++;const char*vs=s;while(*s&&*s!='\\')s++;if(n==kl&&!strncmp(ks,k,n)){size_t m=s-vs;if(m>255)m=255;memcpy(o,vs,m);o[m]=0;return o;}}return o;}
static void Info_SetValueForKey(char*s,const char*k,const char*v){strcat(s,"\\");strcat(s,k);strcat(s,"\\");strcat(s,v);}static void Q_strncpyz(char*d,const char*s,int n){strncpy(d,s,n-1);d[n-1]=0;}static void Com_Memset(void*p,int v,size_t n){memset(p,v,n);}static void Com_Printf(const char*f,...){(void)f;}static void Com_DPrintf(const char*f,...){(void)f;}static void Com_Error(int c,const char*f,...){(void)c;(void)f;ev("fatal;");}
static sharedEntity_t*SV_GentityNum(int n){return &entities[n];}static void Netchan_Setup(int s,netchan_t*n,netadr_t a,int q){(void)s;memset(n,0,sizeof(*n));n->remoteAddress=a;n->qport=q;}static intptr_t VM_Call(void*g,...){(void)g;return 0;}static void*VM_ExplicitArgPtr(void*g,int p){(void)g;return(void*)(intptr_t)p;}static void SV_UserinfoChanged(client_t*c){(void)c;}static void SV_Heartbeat_f(void){heartbeat++;}static void SV_DropClient(client_t*c,const char*r){(void)r;c->state=CS_FREE;drops++;}
#define BigShort(x) (x)
#include "oob_under_test.inc"
static netadr_t adr(int n,int p){netadr_t a;memset(&a,0,sizeof(a));a.type=NA_IP;a.ip[0]=10;a.ip[3]=n;a.port=(unsigned short)p;return a;}
static void reset(client_t*c,int count){srand(1);memset(&svs,0,sizeof(svs));memset(c,0,sizeof(client_t)*count);svs.clients=c;svs.time=1000;maxclients_store.integer=count;reconnect_store.integer=3;private_store.integer=0;privateValue[0]=strictValue[0]=fsValue[0]=0;private_store.string=privateValue;strict_store.string=strictValue;fs_store.string=fsValue;minping_store.value=maxping_store.value=0;svs.authorizeAddress.type=NA_IP;svs.authorizeAddress.ip[0]=1;events[0]=0;eventLen=heartbeat=drops=lanFlag=localFlag=0;}
static void ui(int ch,int qp,const char*pw){sprintf(argv1,"\\protocol\\68\\challenge\\%d\\qport\\%d\\password\\%s",ch,qp,pw);}
int main(void){client_t clients[4];netadr_t a=adr(1,27960);challenge_t*c;unsigned seed=1;srand(seed);
 reset(clients,2);lanFlag=1;SV_GetChallenge(a);c=&svs.challenges[0];printf("lan|%d|%d|%d|%s\n",c->challenge,c->firstTime,c->pingTime,events);events[0]=0;eventLen=0;svs.time=1100;SV_GetChallenge(a);printf("reuse|%d|%d|%s\n",c->challenge,c->time,events);
 reset(clients,2);SV_GetChallenge(a);printf("authorize|%d|%d|%s\n",svs.challenges[0].challenge,svs.challenges[0].pingTime,events);svs.challenges[0].firstTime=0;svs.time=5001;events[0]=0;eventLen=0;SV_GetChallenge(a);printf("timeout|%d|%s\n",svs.challenges[0].pingTime,events);
 reset(clients,2);strcpy(argv1,"\\protocol\\67");SV_DirectConnect(a);printf("protocol|%d|%s\n",clients[0].state,events);
 reset(clients,2);ui(7,1234,"");SV_DirectConnect(a);printf("bad|%d|%s\n",clients[0].state,events);
 reset(clients,2);svs.challenges[3].adr=a;svs.challenges[3].challenge=7;svs.challenges[3].pingTime=900;ui(7,1234,"");SV_DirectConnect(a);printf("connect|%d|%d|%d|%d|%d|%s\n",clients[0].state,clients[0].netchan.qport,clients[0].challenge,clients[0].lastConnectTime,heartbeat,events);events[0]=0;eventLen=0;SV_DirectConnect(a);printf("reconnect|%d|%s\n",clients[0].state,events);
 reset(clients,2);localFlag=1;private_store.integer=1;strcpy(privateValue,"secret");ui(0,2,"bad");SV_DirectConnect(a);printf("private|%d|%d|%s\n",clients[0].state,clients[1].state,events);
 return 0;}
