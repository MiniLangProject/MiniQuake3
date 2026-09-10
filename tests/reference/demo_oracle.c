#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
typedef unsigned char byte;
#define MAX_MSGLEN 16384
#define MAX_OSPATH 256
#define ERR_DROP 1
#define LittleLong(x) (x)
typedef struct {byte*data;int maxsize,cursize,readcount,bit;} msg_t;
static struct {int serverMessageSequence,demofile,lastPacketTime;} clc;
static struct {int realtime;} cls;
static byte written[20000],input[20000],parsed[20000];static int writtenCount,inputCount,inputPos,completed,parsedCount,errorFlag;
static int FS_Write(const void*p,int n,int f){(void)f;memcpy(written+writtenCount,p,n);writtenCount+=n;return n;}
static int FS_Read(void*p,int n,int f){int left=inputCount-inputPos;(void)f;if(left<n)n=left;if(n<0)n=0;memcpy(p,input+inputPos,n);inputPos+=n;return n;}
static void MSG_Init(msg_t*m,byte*d,int n){memset(m,0,sizeof(*m));m->data=d;m->maxsize=n;}
static void CL_DemoCompleted(void){completed++;clc.demofile=0;}
static void CL_ParseServerMessage(msg_t*m){parsedCount=m->cursize;memcpy(parsed,m->data,m->cursize);}
static void Com_Printf(const char*f,...){(void)f;}static void Com_Error(int c,const char*f,...){(void)c;(void)f;errorFlag++;}
static void Com_sprintf(char*d,int n,const char*f,...){va_list a;va_start(a,f);vsnprintf(d,n,f,a);va_end(a);}
#include "demo_under_test.inc"
static void hx(byte*p,int n){int i;for(i=0;i<n;i++)printf("%02x",p[i]);}
static void load(const byte*p,int n){memcpy(input,p,n);inputCount=n;inputPos=completed=parsedCount=errorFlag=0;clc.demofile=1;clc.serverMessageSequence=0;clc.lastPacketTime=0;cls.realtime=777;}
static void readcase(const char*n,const byte*p,int z){load(p,z);CL_ReadDemoMessage();printf("R|%s|%d|%d|%d|%d|%d|",n,clc.serverMessageSequence,clc.lastPacketTime,inputPos,completed,parsedCount);hx(parsed,parsedCount);printf("\n");}
int main(void){byte packet[10],record[32],end[8];msg_t m;char name[256];int i,seq=7,size=3,neg=-1;
 for(i=0;i<10;i++)packet[i]=(byte)(i+1);m.data=packet;m.cursize=10;clc.serverMessageSequence=0x12345678;clc.demofile=1;writtenCount=0;CL_WriteDemoMessage(&m,4);printf("W|%d|",writtenCount);hx(written,writtenCount);printf("\n");
 CL_DemoFilename(0,name);printf("F|0|%s\n",name);CL_DemoFilename(42,name);printf("F|42|%s\n",name);CL_DemoFilename(9999,name);printf("F|9999|%s\n",name);CL_DemoFilename(-1,name);printf("F|-1|%s\n",name);CL_DemoFilename(10000,name);printf("F|10000|%s\n",name);
 memcpy(record,&seq,4);memcpy(record+4,&size,4);record[8]=9;record[9]=8;record[10]=7;readcase("normal",record,11);
 memcpy(end,&neg,4);memcpy(end+4,&neg,4);readcase("end",end,8);readcase("short-seq",record,3);readcase("short-len",record,6);readcase("short-data",record,10);
 clc.demofile=0;completed=0;CL_ReadDemoMessage();printf("R|nofile|%d\n",completed);return 0;}
