/* Host for unchanged Baseq3 CL_ParseCommandString/CL_ParseServerMessage bodies. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include "q_shared.h"
#define HMAX 256
#define NYT HMAX
#define INTERNAL_NODE (HMAX+1)
#define PACKET_BACKUP 32
#define PACKET_MASK 31
#define MAX_PARSE_ENTITIES 2048
#define MAX_RELIABLE_COMMANDS 64
#define ERR_DROP 1
#define FLOAT_INT_BITS 13
#define FLOAT_INT_BIAS (1<<(FLOAT_INT_BITS-1))
enum { svc_bad,svc_nop,svc_gamestate,svc_configstring,svc_baseline,svc_serverCommand,svc_download,svc_snapshot,svc_EOF };
static const char *svc_strings[256];
typedef struct nodetype { struct nodetype *left,*right,*parent,*next,*prev,**head; int weight,symbol; } node_t;
typedef struct { int blocNode,blocPtrs; node_t *tree,*lhead,*ltail,*loc[HMAX+1],**freelist,nodeList[768],*nodePtrs[768]; } huff_t;
typedef struct { huff_t compressor,decompressor; } huffman_t;
typedef struct { qboolean allowoverflow,overflowed,oob; byte *data; int maxsize,cursize,readcount,bit; } msg_t;
typedef struct { char *name; int offset,bits; } netField_t;
#define NETF(x) #x,(int)&((entityState_t*)0)->x
#define PSF(x) #x,(int)&((playerState_t*)0)->x
#define LittleShort(x) (x)
#define LittleLong(x) (x)
typedef struct { int p_serverTime,p_realtime; } outPacket_t;
typedef struct { qboolean valid; int snapFlags,serverTime,messageNum,deltaNum,ping; byte areamask[MAX_MAP_AREA_BYTES]; playerState_t ps; int numEntities,parseEntitiesNum,serverCommandNum; } clSnapshot_t;
typedef struct { entityState_t parseEntities[MAX_PARSE_ENTITIES],entityBaselines[MAX_GENTITIES]; int parseEntitiesNum; clSnapshot_t snapshots[PACKET_BACKUP],snap; outPacket_t outPackets[PACKET_BACKUP]; qboolean newSnapshots; } clientActive_t;
typedef struct { int outgoingSequence; } netchan_t;
typedef struct { int serverCommandSequence,serverMessageSequence;netchan_t netchan;qboolean demowaiting;int reliableAcknowledge,reliableSequence;char serverCommands[MAX_RELIABLE_COMMANDS][MAX_STRING_CHARS]; } clientConnection_t;
typedef struct { int realtime; } clientStatic_t;
static clientActive_t cl;static clientConnection_t clc;static clientStatic_t cls;
static cvar_t shownet_store;static cvar_t *cl_shownet=&shownet_store;
static huffman_t msgHuff;static qboolean msgInit=qfalse;static int bloc=0;int oldsize=0,overflows=0,pcount[256];
void MSG_initHuffman(void);
static void Com_Memset(void*p,int v,size_t n){memset(p,v,n);}static void Com_Error(int c,const char*f,...){(void)c;(void)f;abort();}static void Com_Printf(const char*f,...){(void)f;}
void Q_strncpyz(char*d,const char*s,int n){if(n<=0)return;strncpy(d,s,n-1);d[n-1]=0;}
#define LOG(x) ((void)0)
#define SHOWNET(msg,s) ((void)0)
#include "huffman_under_test.inc"
#include "message_core_under_test.inc"
#include "message_state_delta_under_test.inc"
#include "snapshot_command_under_test.inc"
static int gameCalls,downloadCalls;void CL_ParseGamestate(msg_t*m){(void)m;gameCalls++;}void CL_ParseDownload(msg_t*m){(void)m;downloadCalls++;}
#include "server_message_under_test.inc"

static entityState_t ent(int number,int type){entityState_t e;memset(&e,0,sizeof(e));e.number=number;e.eType=type;return e;}
static playerState_t player(int time){playerState_t p;memset(&p,0,sizeof(p));p.commandTime=time;return p;}
static void command(msg_t*m,int seq,const char*s){MSG_WriteByte(m,svc_serverCommand);MSG_WriteLong(m,seq);MSG_WriteString(m,s);}
static void snapshot(msg_t*m){playerState_t p=player(500);entityState_t e=ent(2,9);byte area=3;MSG_WriteByte(m,svc_snapshot);MSG_WriteLong(m,700);MSG_WriteByte(m,0);MSG_WriteByte(m,1);MSG_WriteByte(m,1);MSG_WriteByte(m,area);MSG_WriteDeltaPlayerstate(m,NULL,&p);MSG_WriteDeltaEntity(m,&cl.entityBaselines[2],&e,qtrue);MSG_WriteBits(m,MAX_GENTITIES-1,GENTITYNUM_BITS);}
static void dump(const char*tag){printf("%s|ack=%d|seq=%d|c1=%s|c2=%s|snap=%d,%d,%d,%d|ring=%d|new=%d|host=%d,%d\n",tag,clc.reliableAcknowledge,clc.serverCommandSequence,clc.serverCommands[1],clc.serverCommands[2],cl.snap.valid,cl.snap.messageNum,cl.snap.serverCommandNum,cl.snap.serverTime,cl.parseEntitiesNum,cl.newSnapshots,gameCalls,downloadCalls);}
int main(void){byte b[4096]={0};msg_t m;memset(&cl,0,sizeof(cl));memset(&clc,0,sizeof(clc));memset(&cls,0,sizeof(cls));cl.entityBaselines[2]=ent(2,0);clc.reliableSequence=5;clc.serverMessageSequence=11;clc.netchan.outgoingSequence=1;cls.realtime=900;
 MSG_Init(&m,b,sizeof(b));MSG_WriteLong(&m,4);MSG_WriteByte(&m,svc_nop);command(&m,1,"cp alpha");command(&m,2,"print beta");command(&m,2,"ignored");snapshot(&m);MSG_WriteByte(&m,svc_EOF);MSG_BeginReading(&m);CL_ParseServerMessage(&m);dump("stream");
 memset(b,0,sizeof(b));cl.newSnapshots=qfalse;clc.reliableSequence=70;MSG_Init(&m,b,sizeof(b));MSG_WriteLong(&m,-100);command(&m,2,"duplicate");command(&m,65,"ring sixtyfive");MSG_WriteByte(&m,svc_EOF);MSG_BeginReading(&m);CL_ParseServerMessage(&m);dump("repair");
 memset(b,0,sizeof(b));MSG_Init(&m,b,sizeof(b));MSG_WriteLong(&m,70);MSG_WriteByte(&m,svc_gamestate);MSG_WriteByte(&m,svc_download);MSG_WriteByte(&m,svc_EOF);MSG_BeginReading(&m);CL_ParseServerMessage(&m);dump("hosts");return 0;}
