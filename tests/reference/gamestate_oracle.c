/* Host for unchanged Baseq3 CL_ParseGamestate. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include "q_shared.h"
#define HMAX 256
#define NYT HMAX
#define INTERNAL_NODE (HMAX+1)
#define ERR_DROP 1
#define FLOAT_INT_BITS 13
#define FLOAT_INT_BIAS (1<<(FLOAT_INT_BITS-1))
enum { svc_bad,svc_nop,svc_gamestate,svc_configstring,svc_baseline,svc_serverCommand,svc_download,svc_snapshot,svc_EOF };
typedef struct nodetype { struct nodetype *left,*right,*parent,*next,*prev,**head; int weight,symbol; } node_t;
typedef struct { int blocNode,blocPtrs; node_t *tree,*lhead,*ltail,*loc[HMAX+1],**freelist,nodeList[768],*nodePtrs[768]; } huff_t;
typedef struct { huff_t compressor,decompressor; } huffman_t;
typedef struct { qboolean allowoverflow,overflowed,oob; byte *data; int maxsize,cursize,readcount,bit; } msg_t;
typedef struct { char *name; int offset,bits; } netField_t;
#define NETF(x) #x,(int)&((entityState_t*)0)->x
#define PSF(x) #x,(int)&((playerState_t*)0)->x
#define LittleShort(x) (x)
#define LittleLong(x) (x)
typedef struct { gameState_t gameState;entityState_t entityBaselines[MAX_GENTITIES]; } clientActive_t;
typedef struct { int connectPacketCount,serverCommandSequence,clientNum,checksumFeed; } clientConnection_t;
static clientActive_t cl;static clientConnection_t clc;static huffman_t msgHuff;static qboolean msgInit=qfalse;static int bloc=0;int oldsize=0,overflows=0,pcount[256];
static cvar_t shownet_store;static cvar_t *cl_shownet=&shownet_store;
static char hooks[16];static int hookn,paused=-1,restartFeed;
void MSG_initHuffman(void);void Q_strncpyz(char*d,const char*s,int n){if(n<=0)return;strncpy(d,s,n-1);d[n-1]=0;}
static void Com_Memset(void*p,int v,size_t n){memset(p,v,n);}static void Com_Memcpy(void*d,const void*s,size_t n){memcpy(d,s,n);}static void Com_Error(int c,const char*f,...){va_list a;fprintf(stderr,"Com_Error %d: ",c);va_start(a,f);vfprintf(stderr,f,a);va_end(a);fprintf(stderr,"\n");abort();}static void Com_Printf(const char*f,...){(void)f;}
#define LOG(x) ((void)0)
static void mark(char c){hooks[hookn++]=c;hooks[hookn]=0;}static void Con_Close(void){mark('C');}static void CL_ClearState(void){memset(&cl,0,sizeof(cl));}static void CL_SystemInfoChanged(void){mark('S');}static void FS_ConditionalRestart(int feed){restartFeed=feed;mark('F');}static void CL_InitDownloads(void){mark('D');}static void Cvar_Set(const char*n,const char*v){if(!strcmp(n,"cl_paused"))paused=atoi(v);mark('P');}
#include "huffman_under_test.inc"
#include "message_core_under_test.inc"
#include "message_state_delta_under_test.inc"
#include "gamestate_under_test.inc"
int main(void){byte data[24000]={0};msg_t m;char large[1101];entityState_t zero,e;memset(large,'a',1100);large[1099]='z';large[1100]=0;memset(&zero,0,sizeof(zero));e=zero;e.number=7;e.eType=9;e.pos.trTime=123;clc.connectPacketCount=9;
 MSG_Init(&m,data,sizeof(data));MSG_WriteLong(&m,77);MSG_WriteByte(&m,svc_configstring);MSG_WriteShort(&m,1);MSG_WriteBigString(&m,"\\sv_serverid\\42%done");MSG_WriteByte(&m,svc_configstring);MSG_WriteShort(&m,5);MSG_WriteBigString(&m,large);MSG_WriteByte(&m,svc_baseline);MSG_WriteDeltaEntity(&m,&zero,&e,qtrue);MSG_WriteByte(&m,svc_EOF);MSG_WriteLong(&m,3);MSG_WriteLong(&m,0x12345678);MSG_BeginReading(&m);CL_ParseGamestate(&m);
 printf("state|seq=%d|client=%d|feed=%u|count=%d|off=%d,%d|c1=%s|long=%u,%c,%c|base=%d,%d,%d|connect=%d|paused=%d|hooks=%s|restart=%u\n",clc.serverCommandSequence,clc.clientNum,(unsigned)clc.checksumFeed,cl.gameState.dataCount,cl.gameState.stringOffsets[1],cl.gameState.stringOffsets[5],cl.gameState.stringData+cl.gameState.stringOffsets[1],(unsigned)strlen(cl.gameState.stringData+cl.gameState.stringOffsets[5]),cl.gameState.stringData[cl.gameState.stringOffsets[5]],cl.gameState.stringData[cl.gameState.stringOffsets[5]+1099],cl.entityBaselines[7].number,cl.entityBaselines[7].eType,cl.entityBaselines[7].pos.trTime,clc.connectPacketCount,paused,hooks,(unsigned)restartFeed);return 0;}
