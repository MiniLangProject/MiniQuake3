/* Host for unchanged Baseq3 qcommon/msg.c function bodies extracted at test time. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
typedef unsigned char byte; typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define MAX_STRING_CHARS 1024
#define ERR_DROP 1
typedef struct { qboolean allowoverflow,overflowed,oob; byte *data; int maxsize,cursize,readcount,bit; } msg_t;
typedef struct { void *tree; } node_stub_t;
typedef struct { node_stub_t compressor,decompressor; } huffman_t;
static huffman_t msgHuff; static qboolean msgInit=qtrue; int oldsize=0,overflows=0;
#define LittleShort(x) (x)
#define LittleLong(x) (x)
static void Com_Memset(void *p,int v,size_t n){memset(p,v,n);}
static void Com_Memcpy(void *d,const void *s,size_t n){memcpy(d,s,n);}
static void Com_Printf(const char *fmt,...){(void)fmt;}
static void Com_Error(int code,const char *fmt,...){(void)code;(void)fmt;abort();}
static void Q_strncpyz(char *d,const char *s,int n){if(n<=0)return;strncpy(d,s,n-1);d[n-1]=0;}
void MSG_initHuffman(void){}
static void Huff_putBit(int v,byte *d,int *b){(void)v;(void)d;(void)b;}
static int Huff_getBit(byte *d,int *b){(void)d;(void)b;return 0;}
static void Huff_offsetTransmit(void *c,int v,byte *d,int *b){(void)c;(void)v;(void)d;(void)b;}
static void Huff_offsetReceive(void *t,int *g,byte *d,int *b){(void)t;(void)d;(void)b;*g=0;}
#include "msg_under_test.inc"

static void hx(const byte *p,int n){int i;for(i=0;i<n;i++)printf("%02x",p[i]);}
static void st(const char*n,msg_t*m){printf("S|%s|%d|%d|%d|%d|%d|%d|%d\n",n,m->allowoverflow,m->overflowed,m->oob,m->cursize,m->readcount,m->bit,m->maxsize);}
int main(void){
 byte b[1100]={0}; msg_t m; char *s; byte out[7]; int i,a,c,d,e;
 MSG_Init(&m,b,16);st("init",&m);m.allowoverflow=1;m.overflowed=1;m.cursize=9;m.readcount=7;m.bit=71;MSG_Clear(&m);st("clear",&m);MSG_BeginReadingOOB(&m);st("begin_oob",&m);MSG_Bitstream(&m);st("bitstream",&m);
 memset(b,0,sizeof(b));MSG_InitOOB(&m,b,32);MSG_WriteChar(&m,-1);MSG_WriteByte(&m,128);MSG_WriteShort(&m,-2);MSG_WriteLong(&m,0x12345678);printf("W|primitives|");hx(b,m.cursize);printf("|%d|%d|%d\n",m.cursize,m.bit,m.overflowed);MSG_BeginReadingOOB(&m);a=MSG_ReadChar(&m);c=MSG_ReadByte(&m);d=MSG_ReadShort(&m);e=MSG_ReadLong(&m);printf("R|primitives|%d|%d|%d|%d|%d|%d\n",a,c,d,e,m.readcount,m.bit);
 memset(b,0,sizeof(b));MSG_InitOOB(&m,b,6);MSG_WriteByte(&m,1);MSG_WriteByte(&m,2);MSG_WriteByte(&m,3);MSG_WriteByte(&m,4);printf("W|overflow|");hx(b,m.cursize);printf("|%d|%d|%d\n",m.cursize,m.bit,m.overflowed);
 memset(b,0,sizeof(b));MSG_InitOOB(&m,b,16);{byte in[]={0,1,127,128,255};MSG_WriteData(&m,in,5);}printf("W|data|");hx(b,m.cursize);printf("|%d|%d\n",m.cursize,m.bit);MSG_BeginReadingOOB(&m);MSG_ReadData(&m,out,7);printf("R|data|");hx(out,7);printf("|%d\n",m.readcount);
 memset(b,0,sizeof(b));MSG_InitOOB(&m,b,32);{char in[]={65,37,(char)128,(char)255,90,0};MSG_WriteString(&m,in);}printf("W|string|");hx(b,m.cursize);printf("|%d\n",m.cursize);MSG_BeginReadingOOB(&m);s=MSG_ReadString(&m);printf("R|string|");hx((byte*)s,4);printf("|%d\n",m.readcount);
 memset(b,0,sizeof(b));MSG_InitOOB(&m,b,8);MSG_WriteString(&m,NULL);printf("W|null|");hx(b,m.cursize);printf("|%d\n",m.cursize);
 memset(b,0,sizeof(b));MSG_InitOOB(&m,b,8);{char in[]={65,0,66,0};MSG_WriteString(&m,in);}printf("W|embedded_null|");hx(b,m.cursize);printf("|%d\n",m.cursize);
 memset(b,'x',1024);b[1024]=0;MSG_InitOOB(&m,b+1030,1032);MSG_WriteString(&m,(char*)b);printf("W|string_limit|");hx(m.data,m.cursize);printf("|%d\n",m.cursize);
 memset(b,0,sizeof(b));memcpy(b,"ab%cd\nef",8);MSG_InitOOB(&m,b,16);m.cursize=9;MSG_BeginReadingOOB(&m);s=MSG_ReadStringLine(&m);printf("R|line|");hx((byte*)s,(int)strlen(s));printf("|%d\n",m.readcount);
 memset(b,0,sizeof(b));b[0]=7;MSG_InitOOB(&m,b,8);m.cursize=1;MSG_BeginReadingOOB(&m);a=MSG_ReadByte(&m);c=MSG_ReadByte(&m);printf("R|oob|%d|%d|%d|%d\n",a,c,m.readcount,m.bit);
 memset(b,'x',1030);MSG_InitOOB(&m,b,1032);m.cursize=1030;MSG_BeginReadingOOB(&m);s=MSG_ReadString(&m);printf("R|string_limit|%d|%d\n",(int)strlen(s),m.readcount);
 return 0;
}
