/* Host for unchanged Baseq3 SV_WriteDownloadToClient/SV_NextDownload_f. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include "q_shared.h"
#define HMAX 256
#define NYT HMAX
#define INTERNAL_NODE (HMAX+1)
#define MAX_DOWNLOAD_WINDOW 8
#define MAX_DOWNLOAD_BLKSIZE 2048
#define svc_download 6
#define ERR_DROP 1
typedef struct nodetype { struct nodetype *left,*right,*parent,*next,*prev,**head; int weight,symbol; } node_t;
typedef struct { int blocNode,blocPtrs; node_t *tree,*lhead,*ltail,*loc[HMAX+1],**freelist,nodeList[768],*nodePtrs[768]; } huff_t;
typedef struct { huff_t compressor,decompressor; } huffman_t;
typedef struct { qboolean allowoverflow,overflowed,oob; byte *data; int maxsize,cursize,readcount,bit; } msg_t;
typedef struct client_s { char name[32],downloadName[MAX_QPATH];int download,downloadSize,downloadCount,downloadClientBlock,downloadCurrentBlock,downloadXmitBlock;unsigned char *downloadBlocks[8];int downloadBlockSize[8];qboolean downloadEOF;int downloadSendTime,rate,snapshotMsec; } client_t;
static struct { int time;client_t *clients; } svs;static cvar_t allow_store,pure_store,max_store;static cvar_t *sv_allowDownload=&allow_store,*sv_pure=&pure_store,*sv_maxRate=&max_store;
static huffman_t msgHuff;static qboolean msgInit=qfalse;static int bloc=0;int oldsize=0,overflows=0,pcount[256];
static byte source[20000];static int sourceLen,sourcePos,dropped,closed;static char cmdBlock[32];
void MSG_initHuffman(void);void Q_strncpyz(char*d,const char*s,int n){strncpy(d,s,n-1);d[n-1]=0;}
static void Com_Memset(void*p,int v,size_t n){memset(p,v,n);}static void Com_Error(int c,const char*f,...){(void)c;(void)f;abort();}static void Com_Printf(const char*f,...){(void)f;}static void Com_DPrintf(const char*f,...){(void)f;}static void Com_sprintf(char*d,int n,const char*f,...){va_list a;va_start(a,f);vsnprintf(d,n,f,a);va_end(a);}
static int FS_idPak(const char*a,const char*b){(void)a;(void)b;return 0;}static int FS_SV_FOpenFileRead(const char*n,int*h){(void)n;*h=1;return sourceLen;}static int FS_Read(void*d,int n,int h){int k=sourceLen-sourcePos;(void)h;if(k>n)k=n;if(k<0)return -1;memcpy(d,source+sourcePos,k);sourcePos+=k;return k;}static void FS_FCloseFile(int h){(void)h;closed++;}
static void *Z_Malloc(int n){return calloc(1,n);}static void Z_Free(void*p){free(p);}static void Cvar_Set(const char*n,const char*v){(void)n;max_store.integer=atoi(v);}static char *Cmd_Argv(int n){(void)n;return cmdBlock;}static void SV_DropClient(client_t*c,const char*r){(void)c;(void)r;dropped++;}
#define LittleShort(x) (x)
#define LittleLong(x) (x)
#define LOG(x) ((void)0)
#include "huffman_under_test.inc"
#include "message_under_test.inc"
#include "download_under_test.inc"
static void hx(byte*p,int n){int i;for(i=0;i<n;i++)printf("%02x",p[i]);}
static void reset(client_t*c,int size,int rate,int snap){int i;memset(c,0,sizeof(*c));for(i=0;i<size;i++)source[i]=(byte)((i*37+11)&255);sourceLen=size;sourcePos=0;strcpy(c->downloadName,"maps/test.pk3");c->download=1;c->downloadSize=size;c->rate=rate;c->snapshotMsec=snap;svs.clients=c;svs.time=1000;dropped=closed=0;max_store.integer=0;}
static void emit(const char*n,client_t*c){byte b[10000]={0};msg_t m;MSG_Init(&m,b,sizeof(b));SV_WriteDownloadToClient(c,&m);printf("%s|%d|%d|%d|%d|%d|%d|%d|%d|",n,m.cursize,m.bit,m.overflowed,c->downloadCount,c->downloadClientBlock,c->downloadCurrentBlock,c->downloadXmitBlock,c->downloadEOF);hx(b,m.cursize);printf("\n");}
static void ack(const char*n,client_t*c,int block){sprintf(cmdBlock,"%d",block);SV_NextDownload_f(c);printf("%s|%d|%d|%d|%d|%d\n",n,c->downloadClientBlock,c->downloadSendTime,(int)c->downloadName[0],closed,dropped);}
int main(void){client_t c;
 reset(&c,3,0,50);emit("small0",&c);ack("ack0",&c,0);emit("small-eof",&c);ack("ack-eof",&c,1);
 reset(&c,5000,250000,100);emit("rate",&c);
 reset(&c,17000,0,50);emit("window0",&c);ack("window-ack",&c,0);emit("window1",&c);
 reset(&c,3,0,50);emit("first",&c);svs.time=1500;emit("early",&c);svs.time=2501;emit("resend",&c);ack("bad-ack",&c,3);
 return 0;}
