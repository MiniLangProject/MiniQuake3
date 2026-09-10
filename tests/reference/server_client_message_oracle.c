/* Host for unchanged SV_ExecuteClientMessage extracted at test time. */
#include <stdio.h>
#include <string.h>
typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define MAX_RELIABLE_COMMANDS 64
enum {CS_FREE,CS_ZOMBIE,CS_CONNECTED,CS_PRIMED,CS_ACTIVE};
enum {clc_bad,clc_nop,clc_move,clc_moveNoDelta,clc_clientCommand,clc_EOF};
typedef struct {int longs[3],longAt,ops[8],opCount,opAt;} msg_t;
typedef struct client_s {int state,messageAcknowledge,reliableAcknowledge,reliableSequence,gamestateMessageNum;char downloadName[64],lastClientCommandString[128],name[32];} client_t;
typedef struct {int serverId,restartedServerId;} server_t;
typedef struct {client_t *clients;} serverStatic_t;
static server_t sv;static serverStatic_t svs;static char events[512];static int acceptCommand=1;
static void add(const char*s){if(events[0])strcat(events,",");strcat(events,s);}
static void MSG_Bitstream(msg_t*m){(void)m;}static int MSG_ReadLong(msg_t*m){return m->longs[m->longAt++];}static int MSG_ReadByte(msg_t*m){return m->opAt<m->opCount?m->ops[m->opAt++]:-1;}
static void SV_DropClient(client_t*c,const char*s){(void)c;(void)s;add("drop");}
static void Com_DPrintf(const char*f,...){(void)f;}static void Com_Printf(const char*f,...){(void)f;}
static void SV_SendClientGameState(client_t*c){(void)c;add("gamestate");}
static qboolean SV_ClientCommand(client_t*c,msg_t*m){(void)c;(void)m;add("command");return acceptCommand;}
static void SV_UserMove(client_t*c,msg_t*m,qboolean delta){(void)c;(void)m;add(delta?"move:delta":"move:nodelta");}
#include "server_client_message_under_test.inc"
static void run(const char*tag,int packetServer,int ma,int ra,const int*ops,int opCount,client_t c){
 msg_t m={{packetServer,ma,ra},0,{0},opCount,0};memset(events,0,sizeof(events));for(int i=0;i<opCount;i++)m.ops[i]=ops[i];svs.clients=&c;SV_ExecuteClientMessage(&c,&m);
 printf("%s|%d|%d|%d|%s\n",tag,c.state,c.messageAcknowledge,c.reliableAcknowledge,events);
}
int main(void){client_t c;int eof[]={clc_EOF},move[]={clc_clientCommand,clc_move},nod[]={clc_moveNoDelta},bad[]={99};
 sv.serverId=100;sv.restartedServerId=90;
 memset(&c,0,sizeof(c));run("eof",100,7,2,eof,1,c);
 memset(&c,0,sizeof(c));run("negative",100,-1,0,eof,1,c);
 memset(&c,0,sizeof(c));c.reliableSequence=100;run("stale",100,1,35,eof,1,c);
 memset(&c,0,sizeof(c));run("old",95,1,0,eof,1,c);
 memset(&c,0,sizeof(c));c.gamestateMessageNum=2;run("resend",80,3,0,eof,1,c);
 memset(&c,0,sizeof(c));c.gamestateMessageNum=3;run("wrong",80,3,0,eof,1,c);
 memset(&c,0,sizeof(c));strcpy(c.downloadName,"pak");run("download",80,3,0,eof,1,c);
 memset(&c,0,sizeof(c));strcpy(c.lastClientCommandString,"nextdl 4");run("nextdl",80,3,0,eof,1,c);
 memset(&c,0,sizeof(c));acceptCommand=1;run("move",100,1,0,move,2,c);
 memset(&c,0,sizeof(c));run("nodelta",100,1,0,nod,1,c);
 memset(&c,0,sizeof(c));acceptCommand=0;run("reject",100,1,0,move,2,c);acceptCommand=1;
 memset(&c,0,sizeof(c));c.state=CS_ZOMBIE;run("zombie",100,1,0,move,2,c);
 memset(&c,0,sizeof(c));run("bad",100,1,0,bad,1,c);return 0;
}
