#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#define MAX_MSGLEN 16384
#define ERR_DROP 1
typedef struct {int shorts[2],si,longv;const char*text;unsigned char payload[16];} msg_t;
static struct {int downloadSize,downloadBlock,download,downloadCount;char downloadTempName[64],downloadName[64];} clc;
static char events[1024];static int openResult=7;
static void ev(const char*f,...){va_list a;char b[128];va_start(a,f);vsprintf(b,f,a);va_end(a);if(*events)strcat(events,",");strcat(events,b);}
static int MSG_ReadShort(msg_t*m){return m->shorts[m->si++];} static int MSG_ReadLong(msg_t*m){return m->longv;} static char*MSG_ReadString(msg_t*m){return (char*)m->text;} static void MSG_ReadData(msg_t*m,void*d,int n){memcpy(d,m->payload,n);}
static void Cvar_SetValue(const char*n,float v){ev("cv:%s=%.0f",n,v);} static void Cvar_Set(const char*n,const char*v){ev("cs:%s=%s",n,v);}
static void Com_Error(int c,const char*f,...){(void)c;ev("error:%s",f);} static void Com_DPrintf(const char*f,...){(void)f;} static void Com_Printf(const char*f,...){va_list a;if(strstr(f,"no download"))ev("print:unrequested");else if(strstr(f,"Could not create")){va_start(a,f);ev("print:create:%s",va_arg(a,char*));va_end(a);}}
static void CL_AddReliableCommand(const char*s){ev("cmd:%s",s);} static int FS_SV_FOpenFileWrite(const char*n){ev("open:%s",n);return openResult;} static void FS_Write(void*d,int n,int f){ev("write:%d:%d:%d",n,f,((unsigned char*)d)[0]);} static void FS_FCloseFile(int f){ev("close:%d",f);} static void FS_SV_Rename(const char*a,const char*b){ev("rename:%s:%s",a,b);} static void CL_WritePacket(void){ev("packet");} static void CL_NextDownload(void){ev("next");}
static char*va(const char*f,...){static char b[128];va_list a;va_start(a,f);vsprintf(b,f,a);va_end(a);return b;}
#include "download_under_test.inc"
static void reset(void){memset(&clc,0,sizeof(clc));events[0]=0;openResult=7;}
static void out(const char*n){printf("%s|%d,%d,%d,%d,%s,%s|%s\n",n,clc.downloadSize,clc.downloadBlock,clc.download,clc.downloadCount,clc.downloadTempName,clc.downloadName,events);}
int main(void){msg_t m;
 reset();strcpy(clc.downloadTempName,"tmp");strcpy(clc.downloadName,"final");memset(&m,0,sizeof(m));m.shorts[0]=0;m.shorts[1]=3;m.longv=3;m.payload[0]=9;CL_ParseDownload(&m);out("block");
 reset();clc.downloadSize=3;clc.downloadBlock=1;clc.download=7;clc.downloadCount=3;strcpy(clc.downloadTempName,"tmp");strcpy(clc.downloadName,"final");memset(&m,0,sizeof(m));m.shorts[0]=1;m.shorts[1]=0;CL_ParseDownload(&m);out("eof");
 reset();clc.downloadBlock=2;memset(&m,0,sizeof(m));m.shorts[0]=1;m.shorts[1]=1;m.payload[0]=4;CL_ParseDownload(&m);out("wrong");
 reset();memset(&m,0,sizeof(m));m.shorts[0]=0;m.shorts[1]=1;m.longv=1;m.payload[0]=2;CL_ParseDownload(&m);out("unrequested");
 return 0;}
