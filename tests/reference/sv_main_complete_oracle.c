/* SPDX-License-Identifier: GPL-2.0-or-later
 * Deterministic host for the previously uncovered unchanged sv_main.c bodies.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdint.h>

typedef unsigned char byte; typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define QDECL
#define MAX_RELIABLE_COMMANDS 64
#define MAX_STRING_CHARS 1024
#define MAX_MSGLEN 16384
#define MAX_INFO_STRING 1024
#define MAX_MASTER_SERVERS 5
#define PORT_MASTER 27950
#define PROTOCOL_VERSION 68
#define HEARTBEAT_MSEC 300000
#define HEARTBEAT_GAME "QuakeArena-1"
#define NS_SERVER 1
#define CVAR_SERVERINFO 4
#define GT_SINGLE_PLAYER 2
#define CS_FREE 0
#define CS_ZOMBIE 1
#define CS_CONNECTED 2
#define CS_PRIMED 3
#define CS_ACTIVE 4
#define PERS_SCORE 0
typedef struct {int type;byte ip[4];unsigned short port;} netadr_t;
typedef struct {char *name,*string;int integer,modified;float value;} cvar_t;
typedef struct {int persistant[16],ping;} playerState_t;
typedef struct {int state,reliableSent,reliableSequence,reliableAcknowledge,ping;char reliableCommands[MAX_RELIABLE_COMMANDS][MAX_STRING_CHARS],name[64];} client_t;
typedef struct {int time,nextHeartbeatTime;client_t *clients;netadr_t redirectAddress;} serverStatic_t;
typedef struct {int unused;} server_t; typedef struct {byte *data;int cursize;} msg_t; typedef void vm_t;
serverStatic_t svs;server_t sv;vm_t *gvm;
cvar_t *sv_fps,*sv_timeout,*sv_zombietime,*sv_rconPassword,*sv_privatePassword,*sv_allowDownload,*sv_maxclients,*sv_privateClients,*sv_hostname,*sv_master[MAX_MASTER_SERVERS],*sv_reconnectlimit,*sv_showloss,*sv_padPackets,*sv_killserver,*sv_mapname,*sv_mapChecksum,*sv_serverid,*sv_maxRate,*sv_minPing,*sv_maxPing,*sv_gametype,*sv_pure,*sv_floodProtect,*sv_lanForceRate,*sv_strictAuth,*com_dedicated;
static cvar_t stores[32];static playerState_t players[8];static char serverInfo[MAX_INFO_STRING],fsGame[128],argvStore[8][1024],cmdStore[2048];static float singlePlayer,uiSingle,restricted;
static char packets[64][MAX_MSGLEN],consoleLog[32768],executed[2048];static int packetCount,dropCount,resolveCount,now;
static char *redirectBuffer;static int redirectCapacity;static void (*redirectFlush)(char*);
static int Q_strncmp(const char*a,const char*b,int n){return strncmp(a,b,(size_t)n);}static void Q_strncpyz(char*d,const char*s,int n){if(n<1)return;strncpy(d,s,(size_t)n-1);d[n-1]=0;}
static int Q_vsnprintf(char*d,int n,const char*f,va_list a){return vsnprintf(d,(size_t)n,f,a);}static void Q_strcat(char*d,int n,const char*s){strncat(d,s,(size_t)n-strlen(d)-1);}
static void append(char*d,size_t n,const char*s){strncat(d,s,n-strlen(d)-1);}static void Com_Printf(const char*f,...){char b[4096];va_list a;va_start(a,f);vsnprintf(b,sizeof(b),f,a);va_end(a);if(redirectBuffer){strncat(redirectBuffer,b,(size_t)redirectCapacity-strlen(redirectBuffer)-1);}else append(consoleLog,sizeof(consoleLog),b);}
static void Com_DPrintf(const char*f,...){(void)f;}static int Com_Milliseconds(void){return now;}
static int Com_sprintf(char*d,int n,const char*f,...){va_list a;va_start(a,f);int r=vsnprintf(d,(size_t)n,f,a);va_end(a);return r;}
static unsigned short BigShort(unsigned short v){return (unsigned short)((v>>8)|(v<<8));}
static const char *NET_AdrToString(netadr_t a){static char b[64];snprintf(b,sizeof(b),"%u.%u.%u.%u:%u",a.ip[0],a.ip[1],a.ip[2],a.ip[3],a.port);return b;}
static int NET_StringToAdr(const char*s,netadr_t*a){resolveCount++;if(!strcmp(s,"bad"))return 0;a->type=4;a->ip[0]=1;a->ip[1]=2;a->ip[2]=3;a->ip[3]=4;a->port=1234;return 1;}
static void NET_OutOfBandPrint(int sock,netadr_t a,const char*f,...){(void)sock;(void)a;va_list v;va_start(v,f);vsnprintf(packets[packetCount++],MAX_MSGLEN,f,v);va_end(v);}
static void Cvar_Set(const char*n,const char*v){int i;for(i=0;i<MAX_MASTER_SERVERS;i++)if(sv_master[i]&&!strcmp(sv_master[i]->name,n)){Q_strncpyz(sv_master[i]->string,v,128);sv_master[i]->integer=atoi(v);return;}}
static float Cvar_VariableValue(const char*n){if(!strcmp(n,"g_gametype"))return singlePlayer;if(!strcmp(n,"ui_singlePlayerActive"))return uiSingle;if(!strcmp(n,"fs_restrict"))return restricted;return 0;}
static char *Cvar_InfoString(int f){(void)f;return serverInfo;}static char *Cvar_VariableString(const char*n){return !strcmp(n,"fs_game")?fsGame:"";}
static char *Cmd_Argv(int i){return argvStore[i];}static char *Cmd_Cmd(void){return cmdStore;}static void Cmd_ExecuteString(const char*s){Q_strncpyz(executed,s,sizeof(executed));if(redirectBuffer)append(redirectBuffer,(size_t)redirectCapacity,"executed\n");}
static void Com_BeginRedirect(char*b,int n,void(*f)(char*)){redirectBuffer=b;redirectCapacity=n;redirectFlush=f;b[0]=0;}static void Com_EndRedirect(void){if(redirectFlush)redirectFlush(redirectBuffer);redirectBuffer=NULL;redirectFlush=NULL;}
static void SV_DropClient(client_t*c,const char*r){(void)r;dropCount++;c->state=CS_ZOMBIE;}static playerState_t *SV_GameClientNum(int i){return &players[i];}
static char *va(const char*f,...){static char b[4][64];static int i;char*out=b[i++&3];va_list a;va_start(a,f);vsnprintf(out,64,f,a);va_end(a);return out;}
static char *Info_ValueForKey(const char*s,const char*k){static char out[2][MAX_INFO_STRING];static int slot;char *d=out[slot++&1];d[0]=0;while(*s){if(*s=='\\')s++;const char*ks=s;while(*s&&*s!='\\')s++;size_t kn=(size_t)(s-ks);if(!*s)break;s++;const char*vs=s;while(*s&&*s!='\\')s++;if(strlen(k)==kn&&!strncmp(ks,k,kn)){size_t n=(size_t)(s-vs);memcpy(d,vs,n);d[n]=0;return d;}}return d;}
static void Info_RemoveKey(char*s,const char*k){char copy[MAX_INFO_STRING]="",key[256],val[768];const char*p=s;while(*p){if(*p=='\\')p++;int i=0;while(*p&&*p!='\\'&&i<255)key[i++]=*p++;key[i]=0;if(*p=='\\')p++;i=0;while(*p&&*p!='\\'&&i<767)val[i++]=*p++;val[i]=0;if(strcmp(key,k)){append(copy,sizeof(copy),"\\");append(copy,sizeof(copy),key);append(copy,sizeof(copy),"\\");append(copy,sizeof(copy),val);}}Q_strncpyz(s,copy,MAX_INFO_STRING);}
static void Info_SetValueForKey(char*s,const char*k,const char*v){char rest[MAX_INFO_STRING],out[MAX_INFO_STRING];Q_strncpyz(rest,s,sizeof(rest));Info_RemoveKey(rest,k);if(!*v){Q_strncpyz(s,rest,MAX_INFO_STRING);return;}snprintf(out,sizeof(out),"\\%s\\%s%s",k,v,rest);Q_strncpyz(s,out,MAX_INFO_STRING);}
#include "sv_main_under_test.inc"
static void reset(void){int i;memset(&svs,0,sizeof(svs));memset(players,0,sizeof(players));memset(stores,0,sizeof(stores));memset(argvStore,0,sizeof(argvStore));memset(cmdStore,0,sizeof(cmdStore));memset(packets,0,sizeof(packets));packetCount=dropCount=resolveCount=0;consoleLog[0]=executed[0]=serverInfo[0]=fsGame[0]=0;singlePlayer=uiSingle=restricted=0;redirectBuffer=NULL;now=1000;for(i=0;i<MAX_MASTER_SERVERS;i++){sv_master[i]=&stores[i];sv_master[i]->name=calloc(1,32);sv_master[i]->string=calloc(1,128);snprintf(sv_master[i]->name,32,"sv_master%d",i+1);}sv_maxclients=&stores[6];sv_privateClients=&stores[7];sv_hostname=&stores[8];sv_mapname=&stores[9];sv_gametype=&stores[10];sv_pure=&stores[11];sv_minPing=&stores[12];sv_maxPing=&stores[13];sv_rconPassword=&stores[14];com_dedicated=&stores[15];}
static void hx(const char*s){const byte*p=(const byte*)s;while(*p)printf("%02x",*p++);}
int main(void){client_t c[4];netadr_t a={4,{9,8,7,6},27960};char large[1100];int i;
 reset();printf("expand|");hx(SV_ExpandNewlines("a\nb\n"));putchar('\n');memset(large,'x',1099);large[1099]=0;printf("expandlong|%u\n",(unsigned)strlen(SV_ExpandNewlines(large)));
 reset();memset(c,0,sizeof(c));c[0].reliableSent=1;c[0].reliableSequence=3;strcpy(c[0].reliableCommands[2],"cs 4 old");strcpy(c[0].reliableCommands[3],"print x");printf("replace|%d|%d|",SV_ReplacePendingServerCommands(&c[0],"cs 4 new"),SV_ReplacePendingServerCommands(&c[0],"cs 5 no"));hx(c[0].reliableCommands[2]);putchar('\n');
 reset();memset(c,0,sizeof(c));c[0].state=CS_ACTIVE;SV_AddServerCommand(&c[0],"one");printf("add|%d|",c[0].reliableSequence);hx(c[0].reliableCommands[1]);c[1].reliableSequence=64;SV_AddServerCommand(&c[1],"last");printf("|%d|%d\n",c[1].reliableSequence,dropCount);
 reset();memset(c,0,sizeof(c));svs.clients=c;sv_maxclients->integer=3;com_dedicated->integer=1;c[0].state=CS_CONNECTED;c[1].state=CS_PRIMED;c[2].state=CS_ACTIVE;SV_SendServerCommand(NULL,"print \"hello\n\"");printf("send|%d|%d|%d|",c[0].reliableSequence,c[1].reliableSequence,c[2].reliableSequence);hx(consoleLog);putchar('\n');
 reset();com_dedicated->integer=2;svs.time=100;strcpy(sv_master[0]->string,"master.example");sv_master[0]->modified=1;printf("heart|%d|",(SV_MasterHeartbeat(),packetCount));SV_MasterHeartbeat();printf("%d|%d|%d|%u\n",packetCount,resolveCount,svs.nextHeartbeatTime,sv_master[0]->modified?0:BigShort(((netadr_t){0}).port));svs.time=300100;SV_MasterHeartbeat();printf("heart2|%d|%d\n",packetCount,resolveCount);SV_MasterShutdown();printf("shutdown|%d\n",packetCount);
 reset();memset(c,0,sizeof(c));svs.clients=c;sv_maxclients->integer=2;c[0].state=CS_CONNECTED;c[0].ping=55;strcpy(c[0].name,"One");players[0].persistant[PERS_SCORE]=9;strcpy(serverInfo,"\\sv_hostname\\Arena\\sv_keywords\\ffa");strcpy(argvStore[1],"token");SVC_Status(a);printf("status|");hx(packets[0]);putchar('\n');
 reset();memset(c,0,sizeof(c));svs.clients=c;sv_maxclients->integer=3;sv_privateClients->integer=1;c[0].state=c[1].state=CS_CONNECTED;sv_hostname->string="Arena";sv_mapname->string="q3dm1";sv_gametype->integer=3;sv_pure->integer=1;sv_minPing->integer=20;sv_maxPing->integer=200;strcpy(fsGame,"osp");strcpy(argvStore[1],"abc");SVC_Info(a);printf("info|");hx(packets[0]);putchar('\n');
 reset();svs.redirectAddress=a;SV_FlushRedirect("hello");printf("flush|");hx(packets[0]);putchar('\n');
 reset();sv_rconPassword->string="pw";strcpy(argvStore[1],"pw");strcpy(argvStore[2],"status");strcpy(cmdStore,"rcon pw  status  all");now=1000;SVC_RemoteCommand(a,NULL);printf("rcon|%s|",executed);hx(packets[0]);putchar('\n');SVC_RemoteCommand(a,NULL);printf("throttle|%d\n",packetCount);now=1500;strcpy(argvStore[1],"bad");SVC_RemoteCommand(a,NULL);printf("bad|");hx(packets[1]);putchar('\n');
 return 0;}
