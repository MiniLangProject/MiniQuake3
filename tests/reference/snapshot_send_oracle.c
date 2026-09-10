/* Full message host around unchanged SV_WriteSnapshotToClient and reliable command bodies. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include "q_shared.h"
#define HMAX 256
#define NYT HMAX
#define INTERNAL_NODE (HMAX+1)
#define MAX_RELIABLE_COMMANDS 64
#define PACKET_BACKUP 32
#define PACKET_MASK 31
#define MAX_MAP_AREA_BYTES 32
#define MAX_MSGLEN 16384
#define CS_ACTIVE 4
#define SNAPFLAG_RATE_DELAYED 1
#define SNAPFLAG_NOT_ACTIVE 2
#define svc_serverCommand 5
#define svc_snapshot 7
#define svc_nop 1
#define svc_EOF 8
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
#define ERR_DROP 1
typedef struct { int areabytes; byte areabits[MAX_MAP_AREA_BYTES]; playerState_t ps; int num_entities,first_entity,messageSent,messageAcked,messageSize; } clientSnapshot_t;
typedef struct { int outgoingSequence; } netchan_t;
typedef struct { int state; char name[32]; char reliableCommands[64][MAX_STRING_CHARS]; int reliableSequence,reliableAcknowledge,reliableSent,lastClientCommand,deltaMessage; qboolean rateDelayed; clientSnapshot_t frames[32]; netchan_t netchan; } client_t;
typedef struct { entityState_t baseline; } svEntity_t;
static struct { int time,snapFlagServerBit,numSnapshotEntities,nextSnapshotEntities; entityState_t *snapshotEntities; } svs;
static struct { svEntity_t svEntities[MAX_GENTITIES]; } sv;
static cvar_t pad_store;static cvar_t *sv_padPackets=&pad_store;
static cvar_t shownet_store; cvar_t *cl_shownet=&shownet_store;
static huffman_t msgHuff;static qboolean msgInit=qfalse;static int bloc=0;int oldsize=0,overflows=0,pcount[256];
void MSG_initHuffman(void);void Q_strncpyz(char*d,const char*s,int n){if(n<=0)abort();strncpy(d,s,(size_t)n-1);d[n-1]=0;}
static void Com_Memset(void*p,int v,size_t n){memset(p,v,n);}static void Com_Error(int c,const char*f,...){(void)c;(void)f;abort();}static void Com_Printf(const char*f,...){(void)f;}static void Com_DPrintf(const char*f,...){(void)f;}
#define LOG(x) ((void)0)
#include "huffman_under_test.inc"
#include "message_under_test.inc"
#include "message_delta_under_test.inc"
#include "snapshot_under_test.inc"
static entityState_t estate(int n,int v){entityState_t e;memset(&e,0,sizeof(e));e.number=n;e.eType=v;e.pos.trTime=v*101;return e;}
static void put(client_t*c,int seq,const char*s){Q_strncpyz(c->reliableCommands[seq&63],s,MAX_STRING_CHARS);}
static void hx(byte*p,int n){int i;for(i=0;i<n;i++)printf("%02x",p[i]);}
static void emit(const char*name,client_t*c,const byte*download,int dn){byte data[MAX_MSGLEN]={0};msg_t m;int i;MSG_Init(&m,data,sizeof(data));m.allowoverflow=qtrue;MSG_WriteLong(&m,c->lastClientCommand);SV_UpdateServerCommandsToClient(c,&m);SV_WriteSnapshotToClient(c,&m);for(i=0;i<dn;i++)MSG_WriteByte(&m,download[i]);if(m.overflowed)MSG_Clear(&m);MSG_WriteByte(&m,svc_EOF);printf("%s|%d|%d|",name,c->reliableSent,m.cursize);hx(m.data,m.cursize);printf("\n");}
static void reset(client_t*c,entityState_t*ring){int i;memset(c,0,sizeof(*c));c->state=CS_ACTIVE;c->netchan.outgoingSequence=1;memset(&svs,0,sizeof(svs));memset(&sv,0,sizeof(sv));svs.time=12345;svs.snapshotEntities=ring;svs.numSnapshotEntities=8;for(i=0;i<MAX_GENTITIES;i++)sv.svEntities[i].baseline.number=i;pad_store.integer=0;}
int main(void){client_t c;entityState_t ring[8];byte dl[3]={6,0xaa,0xbb};clientSnapshot_t *f,*o;
 memset(ring,0,sizeof(ring));reset(&c,ring);c.lastClientCommand=11;f=&c.frames[1];emit("full",&c,NULL,0);
 reset(&c,ring);c.reliableSequence=2;put(&c,1,"print hi");put(&c,2,"cp center");f=&c.frames[1];emit("reliable",&c,NULL,0);
 reset(&c,ring);c.netchan.outgoingSequence=10;c.deltaMessage=8;ring[0]=estate(5,1);ring[1]=estate(5,7);o=&c.frames[8];o->first_entity=0;o->num_entities=1;f=&c.frames[10];f->first_entity=1;f->num_entities=1;f->ps.commandTime=99;svs.nextSnapshotEntities=2;emit("delta",&c,NULL,0);
 reset(&c,ring);c.netchan.outgoingSequence=40;c.deltaMessage=10;ring[0]=estate(5,7);f=&c.frames[8];f->first_entity=0;f->num_entities=1;f->ps.commandTime=100;svs.nextSnapshotEntities=1;emit("old-delta",&c,NULL,0);
 reset(&c,ring);c.state=3;c.rateDelayed=qtrue;svs.snapFlagServerBit=4;pad_store.integer=2;f=&c.frames[1];f->areabytes=2;f->areabits[0]=0x12;f->areabits[1]=0x34;emit("flags-pad",&c,NULL,0);
 reset(&c,ring);f=&c.frames[1];emit("download",&c,dl,3);
 return 0;}
