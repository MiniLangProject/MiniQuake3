/* Host for unchanged Baseq3 SV_UpdateServerCommandsToClient. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include "q_shared.h"
#define HMAX 256
#define NYT HMAX
#define INTERNAL_NODE (HMAX+1)
#define MAX_RELIABLE_COMMANDS 64
#define svc_serverCommand 5
typedef struct nodetype { struct nodetype *left,*right,*parent,*next,*prev,**head; int weight,symbol; } node_t;
typedef struct { int blocNode,blocPtrs; node_t *tree,*lhead,*ltail,*loc[HMAX+1],**freelist,nodeList[768],*nodePtrs[768]; } huff_t;
typedef struct { huff_t compressor,decompressor; } huffman_t;
typedef struct { qboolean allowoverflow,overflowed,oob; byte *data; int maxsize,cursize,readcount,bit; } msg_t;
typedef struct { int reliableAcknowledge,reliableSequence,reliableSent; char reliableCommands[MAX_RELIABLE_COMMANDS][MAX_STRING_CHARS]; } client_t;
#define LittleShort(x) (x)
#define LittleLong(x) (x)
#define ERR_DROP 1
static huffman_t msgHuff;static qboolean msgInit=qfalse;static int bloc=0;int oldsize=0,overflows=0,pcount[256];
void MSG_initHuffman(void);
void Q_strncpyz(char*d,const char*s,int n){if(n<=0)abort();strncpy(d,s,(size_t)n-1);d[n-1]=0;}
static void Com_Memset(void*p,int v,size_t n){memset(p,v,n);} static void Com_Error(int c,const char*f,...){(void)c;(void)f;abort();}
static void Com_Printf(const char*f,...){(void)f;}
#define LOG(x) ((void)0)
#include "huffman_under_test.inc"
#include "message_under_test.inc"
#include "reliable_under_test.inc"
static void put(client_t*c,int seq,const char*s){strncpy(c->reliableCommands[seq&63],s,MAX_STRING_CHARS-1);}
static void hx(byte*p,int n){int i;for(i=0;i<n;i++)printf("%02x",p[i]);}
static void emit(const char*name,client_t*c){byte b[4096]={0};msg_t m;MSG_Init(&m,b,sizeof(b));SV_UpdateServerCommandsToClient(c,&m);printf("%s|%d|%d|%d|%d|",name,c->reliableSent,m.cursize,m.bit,m.overflowed);hx(b,m.cursize);printf("\n");}
int main(void){client_t c;
 memset(&c,0,sizeof(c));emit("empty",&c);
 memset(&c,0,sizeof(c));c.reliableSequence=1;put(&c,1,"print hi");emit("single",&c);
 memset(&c,0,sizeof(c));c.reliableAcknowledge=1;c.reliableSequence=4;put(&c,2,"");put(&c,3,"cp center");put(&c,4,"cs 7 value");emit("range",&c);
 memset(&c,0,sizeof(c));c.reliableAcknowledge=62;c.reliableSequence=66;put(&c,63,"s63");put(&c,64,"s64");put(&c,65,"s65");put(&c,66,"s66");emit("wrap",&c);
 memset(&c,0,sizeof(c));c.reliableAcknowledge=c.reliableSequence=7;c.reliableSent=3;emit("acked",&c);
 memset(&c,0,sizeof(c));c.reliableAcknowledge=-1;c.reliableSequence=1;put(&c,0,"zero");put(&c,1,"one");emit("negative",&c);
 memset(&c,0,sizeof(c));c.reliableAcknowledge=126;c.reliableSequence=130;put(&c,127,"cmd127");put(&c,128,"cmd128");put(&c,129,"cmd129");put(&c,130,"cmd130");emit("highwrap",&c);
 return 0;}
