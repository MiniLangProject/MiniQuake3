/* Host for unchanged Baseq3 CL_ParseSnapshot/packet-entity parser bodies. */
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
#define ERR_DROP 1
#define FLOAT_INT_BITS 13
#define FLOAT_INT_BIAS (1<<(FLOAT_INT_BITS-1))
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
typedef struct { int serverCommandSequence,serverMessageSequence; netchan_t netchan; qboolean demowaiting; } clientConnection_t;
typedef struct { int realtime; } clientStatic_t;
static clientActive_t cl;static clientConnection_t clc;static clientStatic_t cls;
static cvar_t shownet_store;static cvar_t *cl_shownet=&shownet_store;
static huffman_t msgHuff;static qboolean msgInit=qfalse;static int bloc=0;int oldsize=0,overflows=0,pcount[256];
void MSG_initHuffman(void);
static void Com_Memset(void*p,int v,size_t n){memset(p,v,n);}static void Com_Error(int c,const char*f,...){(void)c;(void)f;abort();}static void Com_Printf(const char*f,...){(void)f;}
#define LOG(x) ((void)0)
#define SHOWNET(msg,s) ((void)0)
#include "huffman_under_test.inc"
#include "message_core_under_test.inc"
#include "message_state_delta_under_test.inc"
#include "snapshot_command_under_test.inc"

static entityState_t ent(int number,int type){entityState_t e;memset(&e,0,sizeof(e));e.number=number;e.eType=type;return e;}
static playerState_t player(int time,int health){playerState_t p;memset(&p,0,sizeof(p));p.commandTime=time;p.stats[0]=health;return p;}
static void head(msg_t*m,byte*b,int time,int distance,int flags,const byte*area,int n,playerState_t*from,playerState_t*to){MSG_Init(m,b,4096);MSG_WriteLong(m,time);MSG_WriteByte(m,distance);MSG_WriteByte(m,flags);MSG_WriteByte(m,n);for(int i=0;i<n;i++)MSG_WriteByte(m,area[i]);MSG_WriteDeltaPlayerstate(m,from,to);}
static void finish(msg_t*m){MSG_WriteBits(m,MAX_GENTITIES-1,GENTITYNUM_BITS);MSG_BeginReading(m);CL_ParseSnapshot(m);}
static void dump(const char*tag){clSnapshot_t*s=&cl.snap;printf("%s|snap=%d,%d,%d,%d,%d,%d|ps=%d,%d|area=",tag,s->valid,s->messageNum,s->deltaNum,s->snapFlags,s->ping,s->serverCommandNum,s->ps.commandTime,s->ps.stats[0]);for(int i=0;i<MAX_MAP_AREA_BYTES;i++)if(s->areamask[i])printf("%d:%u,",i,s->areamask[i]);printf("|ring=%d|ents=",cl.parseEntitiesNum);for(int i=0;i<s->numEntities;i++){entityState_t*e=&cl.parseEntities[(s->parseEntitiesNum+i)&(MAX_PARSE_ENTITIES-1)];printf("%d:%d,",e->number,e->eType);}printf("|slots=");for(int i=0;i<PACKET_BACKUP;i++)if(cl.snapshots[i].valid)printf("%d:%d,",i,cl.snapshots[i].messageNum);printf("|new=%d|demo=%d\n",cl.newSnapshots,clc.demowaiting);}
int main(void){byte b[4096]={0},area2[2]={5,9},area1[1]={1};msg_t m;playerState_t p0,p1,p2;entityState_t z,e1,e2,e1b,e3,e4;
 memset(&cl,0,sizeof(cl));memset(&clc,0,sizeof(clc));memset(&cls,0,sizeof(cls));clc.demowaiting=qtrue;
 z=ent(0,0);e1=ent(1,4);e2=ent(2,7);e1b=ent(1,8);e3=ent(3,6);e4=ent(4,9);cl.entityBaselines[1]=ent(1,0);cl.entityBaselines[2]=ent(2,0);cl.entityBaselines[3]=ent(3,0);cl.entityBaselines[4]=ent(4,0);
 p0=player(0,0);p1=player(1000,75);p2=player(1100,60);clc.serverMessageSequence=7;clc.serverCommandSequence=3;clc.netchan.outgoingSequence=4;cls.realtime=1400;cl.outPackets[3].p_serverTime=900;cl.outPackets[3].p_realtime=1200;
 head(&m,b,1234,0,2,area2,2,NULL,&p1);MSG_WriteDeltaEntity(&m,&cl.entityBaselines[1],&e1,qtrue);MSG_WriteDeltaEntity(&m,&cl.entityBaselines[2],&e2,qtrue);finish(&m);dump("full");
 clc.serverMessageSequence=9;clc.serverCommandSequence=4;clc.netchan.outgoingSequence=5;cls.realtime=1400;cl.outPackets[4].p_serverTime=1050;cl.outPackets[4].p_realtime=1300;memset(b,0,sizeof(b));head(&m,b,1300,2,1,area1,1,&p1,&p2);MSG_WriteDeltaEntity(&m,&e1,&e1b,qfalse);MSG_WriteDeltaEntity(&m,&e2,NULL,qtrue);MSG_WriteDeltaEntity(&m,&cl.entityBaselines[3],&e3,qtrue);finish(&m);dump("delta");
 cl.newSnapshots=qfalse;clc.serverMessageSequence=12;cl.snapshots[10].valid=qfalse;memset(b,0,sizeof(b));head(&m,b,1500,2,0,NULL,0,&p0,&p0);MSG_WriteDeltaEntity(&m,&cl.entityBaselines[4],&e4,qtrue);finish(&m);dump("invalid");
 cl.newSnapshots=qfalse;clc.serverMessageSequence=20;cl.snapshots[18].valid=qtrue;cl.snapshots[18].messageNum=18;cl.snapshots[18].parseEntitiesNum=0;cl.snapshots[18].numEntities=0;cl.parseEntitiesNum=MAX_PARSE_ENTITIES-127;memset(b,0,sizeof(b));head(&m,b,1600,2,0,NULL,0,&cl.snapshots[18].ps,&cl.snapshots[18].ps);finish(&m);dump("aged");return 0;}
