/* Direct host for unchanged Baseq3 client/cl_net_chan.c and qcommon/net_chan.c. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdint.h>
#include "q_shared.h"
#define HMAX 256
#define NYT HMAX
#define INTERNAL_NODE (HMAX+1)
#define MAX_RELIABLE_COMMANDS 64
#define MAX_PACKETLEN 1400
#define FRAGMENT_SIZE (MAX_PACKETLEN-100)
#define MAX_MSGLEN 16384
#define FRAGMENT_BIT (1u<<31)
#define CL_ENCODE_START 12
#define CL_DECODE_START 4
#define ERR_DROP 1
enum {clc_bad,clc_nop,clc_move,clc_moveNoDelta,clc_clientCommand,clc_EOF};
typedef struct nodetype { struct nodetype *left,*right,*parent,*next,*prev,**head; int weight,symbol; } node_t;
typedef struct { int blocNode,blocPtrs;node_t *tree,*lhead,*ltail,*loc[HMAX+1],**freelist,nodeList[768],*nodePtrs[768]; } huff_t;
typedef struct {huff_t compressor,decompressor;} huffman_t;
typedef struct {qboolean allowoverflow,overflowed,oob;byte *data;int maxsize,cursize,readcount,bit;} msg_t;
typedef enum {NS_CLIENT,NS_SERVER} netsrc_t;
typedef struct {int type;byte ip[4];unsigned short port;} netadr_t;
typedef struct {netsrc_t sock;int dropped;netadr_t remoteAddress;int qport;int incomingSequence,outgoingSequence;int fragmentSequence,fragmentLength;byte fragmentBuffer[MAX_MSGLEN];qboolean unsentFragments;int unsentFragmentStart,unsentLength;byte unsentBuffer[MAX_MSGLEN];} netchan_t;
typedef struct {int challenge;char reliableCommands[MAX_RELIABLE_COMMANDS][MAX_STRING_CHARS];char serverCommands[MAX_RELIABLE_COMMANDS][MAX_STRING_CHARS];} clientConnection_t;
static clientConnection_t clc;static huffman_t msgHuff;static qboolean msgInit=qfalse;static int bloc=0;int oldsize=0,newsize=0,overflows=0,pcount[256];
static cvar_t showpackets_store,showdrop_store,qport_store;static cvar_t *showpackets=&showpackets_store,*showdrop=&showdrop_store,*qport=&qport_store;
static char *netsrcString[2]={"client","server"};static byte sent[MAX_PACKETLEN];static int sent_length;
static char va_buffer[64];static char *va(const char*f,...){va_list a;va_start(a,f);vsnprintf(va_buffer,sizeof(va_buffer),f,a);va_end(a);return va_buffer;}
static cvar_t *Cvar_Get(const char*n,const char*v,int f){(void)f;if(!strcmp(n,"net_qport"))qport_store.integer=atoi(v);return !strcmp(n,"net_qport")?&qport_store:(!strcmp(n,"showpackets")?&showpackets_store:&showdrop_store);}
static void Com_Memset(void*p,int v,size_t n){memset(p,v,n);}static void Com_Memcpy(void*d,const void*s,size_t n){memcpy(d,s,n);}static void Com_Printf(const char*f,...){(void)f;}static const char *NET_AdrToString(netadr_t a){(void)a;return "test";}static void Com_Error(int c,const char*f,...){(void)c;(void)f;abort();}
static void NET_SendPacket(netsrc_t s,int n,const void*d,netadr_t a){(void)s;(void)a;sent_length=n;memcpy(sent,d,(size_t)n);}
void MSG_initHuffman(void);
#define LOG(x) ((void)0)
#include "huffman_under_test.inc"
#include "message_core_under_test.inc"
#include "netchan_under_test.inc"
#include "client_netchan_under_test.inc"
static void hx(const byte*d,int n){int i;for(i=0;i<n;i++)printf("%02x",d[i]);}
static void line(const char*t,msg_t*m){printf("%s|%d|%d|%d|",t,m->cursize,m->readcount,m->bit);hx(m->data,m->cursize);putchar('\n');}
static void server_xor(msg_t*m,int sequence,int ack,const char*s){int i,index=0;byte key=(byte)(clc.challenge^sequence);for(i=m->readcount+CL_DECODE_START;i<m->cursize;i++){if(!s[index])index=0;key^=(byte)((((byte)s[index]>127||s[index]=='%')?'.':s[index])<<(i&1));index++;m->data[i]^=key;}(void)ack;}
int main(void){byte b[MAX_MSGLEN]={0},plain[MAX_MSGLEN]={0};msg_t m;netadr_t a={2,{127,0,0,1},27960};netchan_t ch;int i,ack=65,seq=7;
 MSG_Init(&m,b,sizeof(b));clc.challenge=0x13579bdf;strcpy(clc.serverCommands[1],"sv%\xC3\xA4-x");MSG_WriteLong(&m,0x10203040);MSG_WriteLong(&m,0x55667788);MSG_WriteLong(&m,ack);for(i=0;i<9;i++)MSG_WriteByte(&m,i*17+3);m.readcount=3;m.bit=19;m.oob=qtrue;CL_Netchan_Encode(&m);line("encode",&m);
 memcpy(plain,b,m.cursize);CL_Netchan_Encode(&m);printf("encode_twice|%d|",m.readcount);hx(m.data,m.cursize);putchar('\n');
 memset(b,0,sizeof(b));MSG_Init(&m,b,sizeof(b));b[0]=(byte)seq;b[1]=(byte)(seq>>8);b[2]=(byte)(seq>>16);b[3]=(byte)(seq>>24);m.cursize=4;m.bit=32;MSG_WriteLong(&m,ack);for(i=0;i<8;i++)MSG_WriteByte(&m,200-i*9);memcpy(plain,b,m.cursize);strcpy(clc.reliableCommands[1],"cmd%\xC3\xB1-z");m.readcount=4;server_xor(&m,seq,ack,clc.reliableCommands[1]);m.bit=32;m.oob=qtrue;CL_Netchan_Decode(&m);line("decode",&m);printf("decode_plain|%d|",memcmp(b,plain,m.cursize)==0);hx(plain,m.cursize);putchar('\n');
 Netchan_Init(31337);Netchan_Setup(NS_CLIENT,&ch,a,999);memset(b,0,sizeof(b));MSG_Init(&m,b,sizeof(b));MSG_WriteLong(&m,0x10203040);MSG_WriteLong(&m,0x55667788);MSG_WriteLong(&m,ack);MSG_WriteByte(&m,77);CL_Netchan_Transmit(&ch,&m);printf("transmit|%d|%d|%d|",sent_length,ch.outgoingSequence,m.cursize);hx(sent,sent_length);putchar('\n');
 Netchan_Setup(NS_CLIENT,&ch,a,999);memset(b,0,sizeof(b));MSG_Init(&m,b,sizeof(b));MSG_WriteLong(&m,0x10203040);MSG_WriteLong(&m,0x55667788);MSG_WriteLong(&m,ack);for(i=0;i<1500;i++)MSG_WriteByte(&m,(i*29+5)&255);CL_Netchan_Transmit(&ch,&m);printf("frag1|%d|%d|%d|",sent_length,ch.unsentFragmentStart,ch.outgoingSequence);hx(sent,sent_length);putchar('\n');CL_Netchan_TransmitNextFragment(&ch);printf("frag2|%d|%d|%d|",sent_length,ch.unsentFragmentStart,ch.outgoingSequence);hx(sent,sent_length);putchar('\n');
 Netchan_Setup(NS_SERVER,&ch,a,0);memset(b,0,sizeof(b));MSG_Init(&m,b,sizeof(b));MSG_WriteLong(&m,ack);for(i=0;i<7;i++)MSG_WriteByte(&m,90+i);server_xor(&m,ch.outgoingSequence,ack,clc.reliableCommands[1]);Netchan_Transmit(&ch,m.cursize,m.data);Netchan_Setup(NS_CLIENT,&ch,a,0);memcpy(b,sent,(size_t)sent_length);memset(&m,0,sizeof(m));m.data=b;m.cursize=sent_length;m.maxsize=sizeof(b);if(!CL_Netchan_Process(&ch,&m))return 3;line("process",&m);printf("process_state|%d|%d|%d\n",ch.incomingSequence,ch.dropped,newsize);return 0;}
