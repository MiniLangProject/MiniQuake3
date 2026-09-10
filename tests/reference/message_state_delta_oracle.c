/* Host for unchanged Baseq3 qcommon/msg.c entity/player delta function bodies. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <assert.h>
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
#define PSF(x) #x,(int)&((playerState_t*)0)->x
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
#include "message_state_delta_under_test.inc"
static void hx(byte*p,int n){for(int i=0;i<n;i++)printf("%02x",p[i]);}
static void words(void*p,int n){unsigned*u=(unsigned*)p;for(int i=0;i<n;i++)printf("%s%u",i?",":"",u[i]);}
static void erun(const char*name,entityState_t*f,entityState_t*t,int force){byte b[4096]={0};msg_t m;entityState_t out;MSG_Init(&m,b,sizeof(b));MSG_WriteDeltaEntity(&m,f,t,force);printf("E|%s|%d|%d|",name,m.cursize,m.bit);hx(b,m.cursize);printf("|");if(m.bit){MSG_BeginReading(&m);int num=MSG_ReadBits(&m,GENTITYNUM_BITS);MSG_ReadDeltaEntity(&m,f,&out,num);words(&out,sizeof(out)/4);}printf("\n");}
static void prun(const char*name,playerState_t*f,playerState_t*t){byte b[4096]={0};msg_t m;playerState_t out;MSG_Init(&m,b,sizeof(b));MSG_WriteDeltaPlayerstate(&m,f,t);printf("P|%s|%d|%d|",name,m.cursize,m.bit);hx(b,m.cursize);printf("|");MSG_BeginReading(&m);MSG_ReadDeltaPlayerstate(&m,f,&out);words(&out,sizeof(out)/4);printf("\n");}
static void allfields(void){
 entityState_t e0,e1;playerState_t p0,p1;char tag[16];int i,*slot;
 memset(&e0,0,sizeof(e0));e0.number=23;
 for(i=0;i<(int)(sizeof(entityStateFields)/sizeof(entityStateFields[0]));i++){
  e1=e0;slot=(int*)((byte*)&e1+entityStateFields[i].offset);
  if(entityStateFields[i].bits==0){float f=-7.0f;memcpy(slot,&f,4);}else *slot=entityStateFields[i].bits==32?0x12345678:3;
  sprintf(tag,"field%02d",i);erun(tag,&e0,&e1,0);
 }
 memset(&p0,0,sizeof(p0));
 for(i=0;i<(int)(sizeof(playerStateFields)/sizeof(playerStateFields[0]));i++){
  p1=p0;slot=(int*)((byte*)&p1+playerStateFields[i].offset);
  if(playerStateFields[i].bits==0){float f=-7.0f;memcpy(slot,&f,4);}else *slot=playerStateFields[i].bits==32?0x12345678:(playerStateFields[i].bits<0?-3:3);
  sprintf(tag,"field%02d",i);prun(tag,&p0,&p1);
 }
}
int main(void){entityState_t e0,e1;playerState_t p0,p1;memset(&e0,0,sizeof(e0));e0.number=17;e1=e0;
 erun("skip",&e0,&e1,0);erun("force",&e0,&e1,1);erun("remove",&e0,NULL,0);
 e1=e0;e1.pos.trTime=123456;e1.pos.trBase[0]=0;e1.pos.trBase[1]=-17;e1.pos.trDelta[0]=3.25f;e1.event=513;e1.eFlags=0x34567;erun("mixed",&e0,&e1,0);
 e0=e1;e1.angles2[2]=-91.0f;e1.constantLight=0x12345678;e1.frame=65530;erun("late",&e0,&e1,0);
 memset(&p0,0,sizeof(p0));p1=p0;prun("zero",NULL,&p1);
 p1.commandTime=123456789;p1.origin[0]=-33;p1.origin[1]=3.5f;p1.weaponTime=-1234;p1.viewheight=-12;p1.weapon=17;p1.loopSound=60000;prun("fields",&p0,&p1);
 p0=p1;p1.stats[0]=-7;p1.stats[15]=30000;p1.persistant[3]=-123;p1.ammo[2]=999;p1.ammo[14]=-2;p1.powerups[1]=0x12345678;p1.powerups[15]=-1;prun("arrays",&p0,&p1);
 p0=p1;p1.grapplePoint[2]=4095;p1.jumppad_ent=1023;p1.loopSound=1;prun("late",&p0,&p1);allfields();return 0;}
