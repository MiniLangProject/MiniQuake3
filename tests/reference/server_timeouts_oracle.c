/* Host for unchanged SV_CheckTimeouts extracted at test time. */
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
enum {CS_FREE,CS_ZOMBIE,CS_CONNECTED,CS_PRIMED,CS_ACTIVE};
typedef struct { int integer; } cvar_t;
typedef struct client_s { int state,lastPacketTime,timeoutCount; char name[32]; } client_t;
typedef struct { int time; client_t *clients; } serverStatic_t;
static serverStatic_t svs;
static cvar_t timeoutVar,zombieVar,maxclientsVar;
static cvar_t *sv_timeout=&timeoutVar,*sv_zombietime=&zombieVar,*sv_maxclients=&maxclientsVar;
static int drops,diagnostics;
static void Com_DPrintf(const char *format,...){(void)format;diagnostics++;}
static void SV_DropClient(client_t *cl,const char *reason){(void)cl;if(!strcmp(reason,"timed out"))drops++;}
#include "server_timeouts_under_test.inc"

static void run(const char *tag,int now,int timeout,int zombie,int count,const int input[][3]){
 client_t clients[4];int i;memset(clients,0,sizeof(clients));drops=diagnostics=0;
 for(i=0;i<count;i++){clients[i].state=input[i][0];clients[i].lastPacketTime=input[i][1];clients[i].timeoutCount=input[i][2];}
 svs.time=now;svs.clients=clients;timeoutVar.integer=timeout;zombieVar.integer=zombie;maxclientsVar.integer=count;
 SV_CheckTimeouts();printf("%s|%d|%d",tag,drops,diagnostics);
 for(i=0;i<count;i++)printf("|%d:%d:%d",clients[i].state,clients[i].lastPacketTime,clients[i].timeoutCount);
 putchar('\n');
}
int main(void){
 const int mixed[][3]={{CS_CONNECTED,9000,4},{CS_ACTIVE,7999,5},{CS_ZOMBIE,7000,9},{CS_FREE,12000,7}};
 const int edges[][3]={{CS_CONNECTED,8000,4},{CS_ZOMBIE,8000,4},{CS_PRIMED,8001,3},{CS_ZOMBIE,7999,8}};
 const int future[][3]={{CS_ACTIVE,10001,4},{CS_ZOMBIE,10001,4},{CS_FREE,10001,4}};
 const int wrap[][3]={{CS_CONNECTED,-2147483647,0},{CS_ZOMBIE,-2147483647,7}};
 const int mulwrap[][3]={{CS_CONNECTED,0,5},{CS_ZOMBIE,0,5}};
 const int zero[][3]={{CS_CONNECTED,99,5},{CS_ZOMBIE,99,5}};
 run("mixed",10000,2,2,4,mixed);
 run("edges",10000,2,2,4,edges);
 run("future",10000,2,2,3,future);
 run("timewrap",(-2147483647-1),2,2,2,wrap);
 run("mulwrap",123,2147484,2147484,2,mulwrap);
 run("zero",100,0,0,2,zero);
 return 0;
}
