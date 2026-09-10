/* Host for the unchanged Baseq3 SV_EmitPacketEntities body. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include "q_shared.h"
#define HMAX 256
#define NYT HMAX
#define INTERNAL_NODE (HMAX+1)
typedef struct nodetype { struct nodetype *left,*right,*parent,*next,*prev,**head; int weight,symbol; } node_t;
typedef struct { int blocNode,blocPtrs; node_t *tree,*lhead,*ltail,*loc[HMAX+1],**freelist,nodeList[768],*nodePtrs[768]; } huff_t;
typedef struct { huff_t compressor,decompressor; } huffman_t;
typedef struct { qboolean allowoverflow,overflowed,oob; byte *data; int maxsize,cursize,readcount,bit; } msg_t;
typedef struct { char *name; int offset,bits; } netField_t;
#define NETF(x) #x,(int)&((entityState_t*)0)->x
#define LittleShort(x) (x)
#define LittleLong(x) (x)
#define ERR_DROP 1
#define FLOAT_INT_BITS 13
#define FLOAT_INT_BIAS (1<<(FLOAT_INT_BITS-1))
static cvar_t shownet_store;cvar_t *cl_shownet=&shownet_store;
static huffman_t msgHuff;static qboolean msgInit=qfalse;static int bloc=0;int oldsize=0,overflows=0,pcount[256];
void MSG_initHuffman(void);
static void Com_Memset(void*p,int v,size_t n){memset(p,v,n);} static void Com_Error(int c,const char*f,...){(void)c;(void)f;abort();}
static void Com_Printf(const char*f,...){(void)f;}
#define LOG(x) ((void)0)
#include "huffman_under_test.inc"
#include "message_core_under_test.inc"
#include "message_entity_delta_under_test.inc"

typedef struct { int first_entity,num_entities; } clientSnapshot_t;
typedef struct { entityState_t baseline; } svEntity_t;
static struct { entityState_t *snapshotEntities; int numSnapshotEntities; } svs;
static struct { svEntity_t svEntities[MAX_GENTITIES]; } sv;
#include "snapshot_emit_under_test.inc"

static entityState_t state(int number,int value){entityState_t e;memset(&e,0,sizeof(e));e.number=number;e.eType=value;e.pos.trTime=value*101;e.origin[0]=(float)value;return e;}
static void hx(byte*p,int n){int i;for(i=0;i<n;i++)printf("%02x",p[i]);}
static void run(const char*name,entityState_t*ring,int cap,clientSnapshot_t*oldf,clientSnapshot_t*newf,int emitted){byte b[4096]={0};msg_t m;int i;svs.snapshotEntities=ring;svs.numSnapshotEntities=cap;memset(&sv,0,sizeof(sv));for(i=0;i<MAX_GENTITIES;i++)sv.svEntities[i].baseline.number=i;MSG_Init(&m,b,sizeof(b));SV_EmitPacketEntities(oldf,newf,&m);printf("%s|%d|%d|%d|",name,emitted,m.cursize,m.bit);hx(b,m.cursize);printf("\n");}
int main(void){entityState_t r[8],same;clientSnapshot_t oldf,newf;
 r[0]=state(2,7);newf.first_entity=0;newf.num_entities=1;run("add",r,1,NULL,&newf,1);
 r[0]=state(3,4);oldf.first_entity=0;oldf.num_entities=1;newf.first_entity=1;newf.num_entities=0;run("remove",r,1,&oldf,&newf,1);
 same=state(4,9);r[0]=same;r[1]=same;oldf.first_entity=0;oldf.num_entities=1;newf.first_entity=1;newf.num_entities=1;run("unchanged",r,2,&oldf,&newf,0);
 r[0]=state(5,1);r[1]=state(5,8);oldf.first_entity=0;newf.first_entity=1;run("changed",r,2,&oldf,&newf,1);
 r[0]=state(1,1);r[1]=state(3,3);r[2]=state(5,5);r[3]=state(0,6);r[4]=state(1,1);r[5]=state(2,2);r[6]=state(3,7);r[7]=state(6,6);oldf.first_entity=0;oldf.num_entities=3;newf.first_entity=3;newf.num_entities=5;run("merge",r,8,&oldf,&newf,5);
 r[0]=state(3,7);r[1]=state(6,6);r[2]=state(1,1);r[3]=state(3,3);r[4]=state(5,5);r[5]=state(0,6);r[6]=state(1,1);r[7]=state(2,2);oldf.first_entity=2;newf.first_entity=5;run("wrapped",r,8,&oldf,&newf,5);
 return 0;}
