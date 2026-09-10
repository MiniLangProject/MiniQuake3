/* Host for unchanged Baseq3 qcommon/msg.c scalar and usercmd delta bodies. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdint.h>
typedef unsigned char byte; typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define HMAX 256
#define NYT HMAX
#define INTERNAL_NODE (HMAX+1)
#define ERR_DROP 1
typedef struct nodetype { struct nodetype *left,*right,*parent,*next,*prev,**head; int weight,symbol; } node_t;
typedef struct { int blocNode,blocPtrs; node_t *tree,*lhead,*ltail,*loc[HMAX+1],**freelist,nodeList[768],*nodePtrs[768]; } huff_t;
typedef struct { huff_t compressor,decompressor; } huffman_t;
typedef struct { qboolean allowoverflow,overflowed,oob; byte *data; int maxsize,cursize,readcount,bit; } msg_t;
typedef struct { int serverTime,angles[3],buttons; byte weapon; signed char forwardmove,rightmove,upmove; } usercmd_t;
static huffman_t msgHuff; static qboolean msgInit=qfalse; int oldsize=0,overflows=0; static int bloc=0;
void MSG_initHuffman(void);
#define LittleShort(x) (x)
#define LittleLong(x) (x)
static void Com_Memset(void *p,int v,size_t n){memset(p,v,n);}
static void Com_Error(int code,const char *fmt,...){(void)code;(void)fmt;abort();}
#include "huffman_under_test.inc"
#include "message_delta_under_test.inc"

static void hx(const byte *p,int n){int i;for(i=0;i<n;i++)printf("%02x",p[i]);}
static void pc(const char *tag,const usercmd_t *c){
 printf("%s|%d|%d,%d,%d|%d|%u|%d,%d,%d",tag,c->serverTime,c->angles[0],c->angles[1],c->angles[2],c->buttons,c->weapon,c->forwardmove,c->rightmove,c->upmove);
}
static usercmd_t cmd(int t,int a0,int a1,int a2,int b,int w,int f,int r,int u){usercmd_t c={0};c.serverTime=t;c.angles[0]=a0;c.angles[1]=a1;c.angles[2]=a2;c.buttons=b;c.weapon=(byte)w;c.forwardmove=(signed char)f;c.rightmove=(signed char)r;c.upmove=(signed char)u;return c;}
static void plain(const char *tag,usercmd_t from,usercmd_t to){
 byte data[512]={0};msg_t m;usercmd_t got;MSG_Init(&m,data,sizeof(data));MSG_WriteDeltaUsercmd(&m,&from,&to);
 printf("P|%s|%d|%d|",tag,m.cursize,m.bit);hx(data,m.cursize);MSG_BeginReading(&m);MSG_ReadDeltaUsercmd(&m,&from,&got);printf("|");pc("D",&got);printf("|%d|%d\n",m.readcount,m.bit);
}
static void keyed(const char *tag,int key,usercmd_t from,usercmd_t to){
 byte data[512]={0};msg_t m;usercmd_t got;MSG_Init(&m,data,sizeof(data));MSG_WriteDeltaUsercmdKey(&m,key,&from,&to);
 printf("K|%s|%d|%d|",tag,m.cursize,m.bit);hx(data,m.cursize);MSG_BeginReading(&m);MSG_ReadDeltaUsercmdKey(&m,key,&from,&got);printf("|");pc("D",&got);printf("|%d|%d\n",m.readcount,m.bit);
}
static void scalar(void){
 byte data[512]={0};msg_t m;int i0,i1,k0,k1;float f0,f1,kf0,kf1;
 MSG_Init(&m,data,sizeof(data));
 MSG_WriteDelta(&m,7,7,8);MSG_WriteDelta(&m,7,-5,-8);
 MSG_WriteDeltaFloat(&m,0.0f,-0.0f);MSG_WriteDeltaFloat(&m,1.25f,-123.5f);
 MSG_WriteDeltaKey(&m,0x13579bdf,12,12,8);MSG_WriteDeltaKey(&m,0x13579bdf,12,-128,8);
 MSG_WriteDeltaKeyFloat(&m,0x2468ace0,3.0f,3.0f);MSG_WriteDeltaKeyFloat(&m,0x2468ace0,3.0f,-0.125f);
 printf("S|%d|%d|",m.cursize,m.bit);hx(data,m.cursize);
 MSG_BeginReading(&m);i0=MSG_ReadDelta(&m,7,8);i1=MSG_ReadDelta(&m,7,-8);f0=MSG_ReadDeltaFloat(&m,0.0f);f1=MSG_ReadDeltaFloat(&m,1.25f);k0=MSG_ReadDeltaKey(&m,0x13579bdf,12,8);k1=MSG_ReadDeltaKey(&m,0x13579bdf,12,8);kf0=MSG_ReadDeltaKeyFloat(&m,0x2468ace0,3.0f);kf1=MSG_ReadDeltaKeyFloat(&m,0x2468ace0,3.0f);
 printf("|%d,%d,%08x,%08x,%d,%d,%08x,%08x|%d|%d\n",i0,i1,*(unsigned*)&f0,*(unsigned*)&f1,k0,k1,*(unsigned*)&kf0,*(unsigned*)&kf1,m.readcount,m.bit);
}
int main(void){
 usercmd_t base=cmd(1000,1,32767,65535,0x1234,5,-1,0,127);
 scalar();
 plain("same8",base,cmd(1017,1,32767,65535,0x1234,5,-1,0,127));
 plain("all8",base,cmd(1255,65535,0,32768,0xffff,255,-128,127,-127));
 plain("time32",base,cmd(1256,2,32767,65535,0x1234,5,-1,0,127));
 plain("backward",base,cmd(999,1,32767,65535,0x1234,5,-1,0,127));
 keyed("same8",0x13579bdf,base,cmd(1042,1,32767,65535,0x1234,5,-1,0,127));
 keyed("all8",0x13579bdf,base,cmd(1255,65535,0,32768,0xffff,255,-128,127,-127));
 keyed("time32",0x80000001,base,cmd(4096,0,65535,1,0x8000,0,0,-128,64));
 return 0;
}
