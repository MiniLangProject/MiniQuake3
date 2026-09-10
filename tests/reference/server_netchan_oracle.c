/* SPDX-License-Identifier: GPL-2.0-or-later
 * Deterministic host around unchanged server/sv_net_chan.c, qcommon/net_chan.c,
 * msg.c and huffman.c bodies.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdint.h>
#include "q_shared.h"
#define HMAX 256
#define NYT HMAX
#define INTERNAL_NODE (HMAX+1)
#define MAX_PACKETLEN 1400
#define FRAGMENT_SIZE (MAX_PACKETLEN-100)
#define MAX_MSGLEN 16384
#define MAX_RELIABLE_COMMANDS 64
#define SV_ENCODE_START 4
#define SV_DECODE_START 12
#define FRAGMENT_BIT (1u<<31)
#define svc_EOF 8
#define ERR_DROP 1
typedef enum {NS_CLIENT,NS_SERVER} netsrc_t;
typedef struct {int type;byte ip[4];unsigned short port;} netadr_t;
typedef struct nodetype {struct nodetype *left,*right,*parent,*next,*prev,**head;int weight,symbol;} node_t;
typedef struct {int blocNode,blocPtrs;node_t *tree,*lhead,*ltail,*loc[HMAX+1],**freelist,nodeList[768],*nodePtrs[768];} huff_t;
typedef struct {huff_t compressor,decompressor;} huffman_t;
typedef struct {qboolean allowoverflow,overflowed,oob;byte *data;int maxsize,cursize,readcount,bit;} msg_t;
typedef struct {netsrc_t sock;int dropped;netadr_t remoteAddress;int qport;int incomingSequence,outgoingSequence;int fragmentSequence,fragmentLength;byte fragmentBuffer[MAX_MSGLEN];qboolean unsentFragments;int unsentFragmentStart,unsentLength;byte unsentBuffer[MAX_MSGLEN];} netchan_t;
typedef struct netchan_buffer_s {msg_t msg;byte msgBuffer[MAX_MSGLEN];struct netchan_buffer_s *next;} netchan_buffer_t;
typedef struct client_s {int challenge;netchan_t netchan;char lastClientCommandString[MAX_STRING_CHARS];char reliableCommands[MAX_RELIABLE_COMMANDS][MAX_STRING_CHARS];netchan_buffer_t *netchan_start_queue;netchan_buffer_t **netchan_end_queue;} client_t;
static cvar_t showpackets_store,showdrop_store,qport_store;static cvar_t *showpackets=&showpackets_store,*showdrop=&showdrop_store,*qport=&qport_store;
static char *netsrcString[2]={"client","server"};
static huffman_t msgHuff;static qboolean msgInit=qfalse;static int bloc=0;int oldsize=0,overflows=0,pcount[256];
static byte packets[16][MAX_PACKETLEN];static int packetLengths[16],packetCount;
void MSG_initHuffman(void);
static void Com_Memset(void*p,int v,size_t n){memset(p,v,n);}static void Com_Memcpy(void*d,const void*s,size_t n){memcpy(d,s,n);}
static void Com_Printf(const char*f,...){(void)f;}static void Com_DPrintf(const char*f,...){(void)f;}
static void Com_Error(int code,const char*f,...){(void)code;(void)f;fprintf(stderr,"Com_Error\n");exit(90);}
static const char *NET_AdrToString(netadr_t a){(void)a;return "test";}static char vabuf[64];
static char *va(const char*f,...){va_list a;va_start(a,f);vsnprintf(vabuf,sizeof(vabuf),f,a);va_end(a);return vabuf;}
static void *Z_Malloc(int n){return calloc(1,(size_t)n);}static void Z_Free(void*p){free(p);}
static void NET_SendPacket(netsrc_t sock,int n,const void*d,netadr_t a){(void)sock;(void)a;if(packetCount>=16)exit(91);packetLengths[packetCount]=n;memcpy(packets[packetCount],d,(size_t)n);packetCount++;}
#define LOG(x) ((void)0)
#include "huffman_under_test.inc"
#include "message_under_test.inc"
#include "netchan_under_test.inc"
#include "server_netchan_under_test.inc"
static void hx(const byte*d,int n){int i;for(i=0;i<n;i++)printf("%02x",d[i]);}
static void setup(client_t*c){netadr_t a={2,{127,0,0,1},27960};memset(c,0,sizeof(*c));c->challenge=0x12345678;c->netchan.sock=NS_SERVER;c->netchan.remoteAddress=a;c->netchan.outgoingSequence=1;c->netchan_end_queue=&c->netchan_start_queue;}
static void initmsg(msg_t*m,byte*b){memset(b,0,MAX_MSGLEN);MSG_Init(m,b,MAX_MSGLEN);}
static void dumpmsg(const char*l,msg_t*m){printf("M|%s|%d|%d|%d|%d|",l,m->cursize,m->readcount,m->bit,m->oob);hx(m->data,m->cursize);putchar('\n');}
static void dumppackets(const char*l,int from,client_t*c){int i,q=0;netchan_buffer_t*n;for(n=c->netchan_start_queue;n;n=n->next)q++;printf("T|%s|%d|%d|%d|%d|%d",l,packetCount-from,c->netchan.outgoingSequence,c->netchan.unsentFragments,c->netchan.unsentFragmentStart,q);for(i=from;i<packetCount;i++){printf("|%d:",packetLengths[i]);hx(packets[i],packetLengths[i]);}putchar('\n');}
static void xor_client_body(byte*d,int n,int challenge,int serverId,int ack,const char*s){int i,index=0;byte key=(byte)(challenge^serverId^ack);for(i=SV_DECODE_START;i<n;i++){if(!s[index])index=0;if((byte)s[index]>127||s[index]=='%')key^='.'<<(i&1);else key^=(byte)s[index]<<(i&1);index++;d[i]^=key;}}
int main(void){client_t c;msg_t m;byte b[MAX_MSGLEN],body[MAX_MSGLEN],wire[MAX_MSGLEN];int i,n,from,ret;
 MSG_initHuffman();setup(&c);c.challenge=0x45;c.netchan.outgoingSequence=7;strcpy(c.lastClientCommandString,"ab%c");initmsg(&m,b);MSG_WriteLong(&m,9);MSG_WriteByte(&m,0x11);MSG_WriteByte(&m,0x22);SV_Netchan_Encode(&c,&m);dumpmsg("encode",&m);
 setup(&c);initmsg(&m,b);m.cursize=3;b[0]=1;b[1]=2;b[2]=3;m.readcount=2;m.bit=17;m.oob=qtrue;SV_Netchan_Encode(&c,&m);dumpmsg("short",&m);
 setup(&c);c.challenge=7;c.netchan.outgoingSequence=3;c.lastClientCommandString[0]=(char)0xff;c.lastClientCommandString[1]='%';c.lastClientCommandString[2]=0;initmsg(&m,b);MSG_WriteLong(&m,5);for(i=0;i<8;i++)MSG_WriteByte(&m,i*29);SV_Netchan_Encode(&c,&m);dumpmsg("special",&m);
 setup(&c);c.challenge=0x55;strcpy(c.reliableCommands[5],"xy%z");initmsg(&m,b);MSG_WriteLong(&m,100);MSG_WriteLong(&m,7);MSG_WriteLong(&m,5);for(i=0;i<10;i++)MSG_WriteByte(&m,200+i);xor_client_body(m.data,m.cursize,c.challenge,100,7,c.reliableCommands[5]);m.readcount=0;m.bit=0;m.oob=qtrue;SV_Netchan_Decode(&c,&m);dumpmsg("decode",&m);
 setup(&c);c.challenge=0x66;strcpy(c.reliableCommands[2],"cmd");initmsg(&m,body);MSG_WriteLong(&m,300);MSG_WriteLong(&m,11);MSG_WriteLong(&m,2);for(i=0;i<7;i++)MSG_WriteByte(&m,40+i);xor_client_body(body,m.cursize,c.challenge,300,11,c.reliableCommands[2]);n=m.cursize;wire[0]=4;wire[1]=wire[2]=wire[3]=0;wire[4]=0xd2;wire[5]=4;memcpy(wire+6,body,(size_t)n);printf("P|wire|");hx(wire,n+6);putchar('\n');memset(&m,0,sizeof(m));m.data=wire;m.maxsize=MAX_MSGLEN;m.cursize=n+6;ret=SV_Netchan_Process(&c,&m);printf("P|accept|%d|%d|%d|%d|",ret,m.readcount,m.bit,c.netchan.incomingSequence);hx(m.data,m.cursize);putchar('\n');ret=SV_Netchan_Process(&c,&m);printf("P|duplicate|%d|%d|%d\n",ret,m.readcount,c.netchan.incomingSequence);
 setup(&c);c.challenge=9;strcpy(c.lastClientCommandString,"queue");initmsg(&m,b);MSG_WriteLong(&m,1);for(i=0;i<4200;i++)MSG_WriteByte(&m,(i*37+11)&255);from=packetCount;SV_Netchan_Transmit(&c,&m);dumppackets("large",from,&c);
 {byte b2[MAX_MSGLEN];msg_t m2;initmsg(&m2,b2);MSG_WriteLong(&m2,2);MSG_WriteByte(&m2,77);from=packetCount;SV_Netchan_Transmit(&c,&m2);dumpmsg("queued-raw",&m2);dumppackets("queued",from,&c);}
 while(c.netchan.unsentFragments){from=packetCount;SV_Netchan_TransmitNextFragment(&c);dumppackets("drain",from,&c);}
 return 0;}
