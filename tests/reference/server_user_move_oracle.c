/* Deterministic host for unchanged SV_UserMove/SV_ClientThink and Com_HashKey. */
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define MAX_PACKET_USERCMDS 32
#define MAX_RELIABLE_COMMANDS 64
#define PACKET_MASK 31
enum {CS_FREE,CS_ZOMBIE,CS_CONNECTED,CS_PRIMED,CS_ACTIVE};
typedef struct {int serverTime;int angles[3];int buttons;unsigned char weapon;signed char forwardmove,rightmove,upmove;} usercmd_t;
typedef struct {int messageAcked;} clientSnapshot_t;
typedef struct client_s {int state,messageAcknowledge,reliableAcknowledge,deltaMessage,pureAuthentic,gotCP;char reliableCommands[MAX_RELIABLE_COMMANDS][128],name[32];clientSnapshot_t frames[32];usercmd_t lastUsercmd;} client_t;
typedef struct {int integer;} cvar_t;
typedef struct {int checksumFeed;} server_t;
typedef struct {int time;client_t *clients;} serverStatic_t;
typedef struct {int count;} msg_t;
static server_t sv;static serverStatic_t svs;static cvar_t pureValue,*sv_pure=&pureValue;
static usercmd_t scripted[MAX_PACKET_USERCMDS];static int scriptedAt,observedKey,enterActivates=1,kickAfterThink;
static char events[512];
static void add(const char*s){if(events[0])strcat(events,",");strcat(events,s);}
static int MSG_ReadByte(msg_t*m){return m->count;}
static void MSG_ReadDeltaUsercmdKey(msg_t*m,int key,usercmd_t*from,usercmd_t*to){(void)m;(void)from;observedKey=key;*to=scripted[scriptedAt++];}
static void Com_Printf(const char*f,...){(void)f;add("diagnostic");}
static void Com_DPrintf(const char*f,...){(void)f;}
static void *Com_Memset(void*p,int c,size_t n){return memset(p,c,n);}
static void SV_SendClientGameState(client_t*c){(void)c;add("gamestate");}
static void SV_ClientEnterWorld(client_t*c,usercmd_t*cmd){(void)cmd;add("enter");if(enterActivates)c->state=CS_ACTIVE;}
static void SV_DropClient(client_t*c,const char*s){(void)s;add("drop");c->state=CS_ZOMBIE;}
#define GAME_CLIENT_THINK 7
static int VM_Call(void*vm,int callnum,...){client_t*c=&svs.clients[0];(void)vm;(void)callnum;add("think");if(kickAfterThink)c->state=CS_CONNECTED;return 0;}
static void *gvm;
#include "hash_key_under_test.inc"
#include "server_user_move_under_test.inc"

static usercmd_t cmd(int time,int button){usercmd_t c;memset(&c,0,sizeof(c));c.serverTime=time;c.buttons=button;return c;}
static void run(const char*tag,int state,int delta,int pure,int auth,int cp,int ma,int ra,int last,const char*reliable,int count,const int*times,int kick){
 client_t c;msg_t m={count};memset(&c,0,sizeof(c));memset(events,0,sizeof(events));c.state=state;c.messageAcknowledge=ma;c.reliableAcknowledge=ra;c.deltaMessage=77;c.pureAuthentic=auth;c.gotCP=cp;c.lastUsercmd=cmd(last,0);strcpy(c.reliableCommands[ra&63],reliable);svs.clients=&c;svs.time=9000;sv.checksumFeed=0x13572468;sv_pure->integer=pure;scriptedAt=0;observedKey=0;kickAfterThink=kick;enterActivates=1;
 for(int i=0;i<count&&i<MAX_PACKET_USERCMDS;i++)scripted[i]=cmd(times?times[i]:0,i+1);
 SV_UserMove(&c,&m,delta);
 printf("%s|%d|%d|%d|%d|%d|%s\n",tag,c.state,c.deltaMessage,c.frames[ma&31].messageAcked,c.lastUsercmd.serverTime,observedKey,events);
}
int main(void){
 int a[]={100,110,120},dups[]={90,105,104,120},oldmap[]={300,200,250},one[]={100},kick[]={100,110};
 run("empty",CS_ACTIVE,1,0,1,1,7,0,0,"",0,0,0);
 run("too_many",CS_ACTIVE,0,0,1,1,7,0,0,"",33,0,0);
 run("active",CS_ACTIVE,1,0,1,1,7,0,95,"",3,a,0);
 run("duplicates",CS_ACTIVE,1,0,1,1,8,0,100,"",4,dups,0);
 run("map_restart_order",CS_ACTIVE,1,0,1,1,9,0,0,"",3,oldmap,0);
 run("no_delta",CS_ACTIVE,0,0,1,1,10,0,0,"",1,one,0);
 run("pure_wait_active",CS_ACTIVE,1,1,0,0,11,0,0,"",1,one,0);
 run("pure_wait_primed",CS_PRIMED,1,1,0,0,12,0,0,"",1,one,0);
 run("primed",CS_PRIMED,1,1,1,1,13,0,0,"",1,one,0);
 run("pure_bad",CS_PRIMED,1,1,0,1,14,0,0,"",1,one,0);
 run("inactive",CS_CONNECTED,1,0,1,1,15,0,0,"",1,one,0);
 run("kick_mid_burst",CS_ACTIVE,1,0,1,1,16,3,0,"alpha beta",2,kick,1);
 return 0;
}
