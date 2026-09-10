/* SPDX-License-Identifier: GPL-2.0-or-later
 * Minimal host around unchanged Baseq3 qcommon/net_chan.c functions.
 * Message byte I/O and NET_SendPacket are explicit deterministic host services.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdint.h>
typedef unsigned char byte; typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define CVAR_TEMP 0
#define CVAR_INIT 1
#define ERR_DROP 1
#define MAX_PACKETLEN 1400
#define FRAGMENT_SIZE (MAX_PACKETLEN-100)
#define MAX_MSGLEN 16384
#define FRAGMENT_BIT (1u<<31)
#define LittleLong(x) (x)
typedef enum {NS_CLIENT,NS_SERVER} netsrc_t;
typedef struct {int type;byte ip[4];unsigned short port;} netadr_t;
typedef struct {int integer;} cvar_t;
typedef struct {qboolean allowoverflow,overflowed,oob;byte *data;int maxsize,cursize,readcount,bit;} msg_t;
typedef struct {netsrc_t sock;int dropped;netadr_t remoteAddress;int qport;int incomingSequence,outgoingSequence;int fragmentSequence,fragmentLength;byte fragmentBuffer[MAX_MSGLEN];qboolean unsentFragments;int unsentFragmentStart,unsentLength;byte unsentBuffer[MAX_MSGLEN];} netchan_t;
static cvar_t showpackets_store,showdrop_store,qport_store;
cvar_t *showpackets=&showpackets_store,*showdrop=&showdrop_store,*qport=&qport_store;
static char *netsrcString[2]={"client","server"};
static byte sent[MAX_PACKETLEN];static int sent_length;
static char va_buffer[64];
static char *va(const char *format,...){va_list ap;va_start(ap,format);vsnprintf(va_buffer,sizeof(va_buffer),format,ap);va_end(ap);return va_buffer;}
static cvar_t *Cvar_Get(const char *name,const char *value,int flags){(void)flags;if(!strcmp(name,"net_qport"))qport_store.integer=atoi(value);else if(!strcmp(name,"showpackets"))showpackets_store.integer=atoi(value);else showdrop_store.integer=atoi(value);return !strcmp(name,"net_qport")?&qport_store:(!strcmp(name,"showpackets")?&showpackets_store:&showdrop_store);}
static void Com_Memset(void *p,int v,size_t n){memset(p,v,n);}static void Com_Memcpy(void*d,const void*s,size_t n){memcpy(d,s,n);}
static void Com_Printf(const char *format,...){(void)format;}static const char *NET_AdrToString(netadr_t a){(void)a;return "test";}
static void Com_Error(int code,const char *format,...){(void)code;(void)format;exit(90);}
static void MSG_InitOOB(msg_t*m,byte*d,int size){memset(m,0,sizeof(*m));m->data=d;m->maxsize=size;m->oob=qtrue;}
static void MSG_WriteData(msg_t*m,const void*p,int n){memcpy(m->data+m->cursize,p,(size_t)n);m->cursize+=n;}
static void MSG_WriteLong(msg_t*m,int value){byte b[4]={(byte)value,(byte)(value>>8),(byte)(value>>16),(byte)(value>>24)};MSG_WriteData(m,b,4);}
static void MSG_WriteShort(msg_t*m,int value){byte b[2]={(byte)value,(byte)(value>>8)};MSG_WriteData(m,b,2);}
static void MSG_BeginReadingOOB(msg_t*m){m->readcount=0;m->bit=0;m->oob=qtrue;}
static int MSG_ReadLong(msg_t*m){uint32_t v;if(m->readcount+4>m->cursize){m->readcount=m->cursize+1;return -1;}v=(uint32_t)m->data[m->readcount]|((uint32_t)m->data[m->readcount+1]<<8)|((uint32_t)m->data[m->readcount+2]<<16)|((uint32_t)m->data[m->readcount+3]<<24);m->readcount+=4;m->bit=m->readcount*8;return (int)v;}
static int MSG_ReadShort(msg_t*m){int v;if(m->readcount+2>m->cursize){m->readcount=m->cursize+1;return -1;}v=m->data[m->readcount]|(m->data[m->readcount+1]<<8);m->readcount+=2;m->bit=m->readcount*8;return (short)v;}
static void NET_SendPacket(netsrc_t sock,int length,const void*data,netadr_t to){(void)sock;(void)to;sent_length=length;memcpy(sent,data,(size_t)length);}
#include "netchan_under_test.inc"
static void hex(const byte*d,int n){int i;for(i=0;i<n;i++)printf("%02x",d[i]);}
static void payload(byte*d,int n){int i;for(i=0;i<n;i++)d[i]=(byte)(i*37+11);}
static int make_packet(byte*d,int seq,int frag,int qp,int start,int claimed,const byte*body,int bodylen,int server){int o=0;d[o++]=(byte)seq;d[o++]=(byte)(seq>>8);d[o++]=(byte)(seq>>16);d[o++]=(byte)((uint32_t)seq>>24);if(frag)d[3]|=128;if(server){d[o++]=(byte)qp;d[o++]=(byte)(qp>>8);}if(frag){d[o++]=(byte)start;d[o++]=(byte)(start>>8);d[o++]=(byte)claimed;d[o++]=(byte)(claimed>>8);}memcpy(d+o,body,(size_t)bodylen);return o+bodylen;}
static void tx(const char*label,netchan_t*c){printf("T|%s|%d|%d|%d|%d|%d|",label,sent_length,c->outgoingSequence,c->unsentFragments,c->unsentFragmentStart,c->unsentLength);hex(sent,sent_length);putchar('\n');}
static void process_case(const char*label,netchan_t*c,byte*d,int size,int max){msg_t m;int ok;memset(&m,0,sizeof(m));m.data=d;m.cursize=size;m.maxsize=max;ok=Netchan_Process(c,&m);printf("P|%s|%d|%d|%d|%d|%d|%d|%d|",label,ok,m.cursize,m.readcount,m.bit,c->incomingSequence,c->dropped,c->fragmentLength);hex(m.data,m.cursize);putchar('\n');}
int main(void){netadr_t a={2,{127,0,0,1},27960};netchan_t c;byte data[MAX_MSGLEN],packet[MAX_MSGLEN];int size;
 Netchan_Init(70000);printf("I|%d\n",qport->integer);Netchan_Setup(NS_CLIENT,&c,a,123);printf("S|%d|%d|%d|%d|%d\n",c.sock,c.dropped,c.qport,c.incomingSequence,c.outgoingSequence);
 payload(data,3);Netchan_Transmit(&c,3,data);tx("client3",&c);
 Netchan_Setup(NS_SERVER,&c,a,0);Netchan_Transmit(&c,0,data);tx("server0",&c);
 Netchan_Setup(NS_CLIENT,&c,a,0);payload(data,1300);Netchan_Transmit(&c,1300,data);tx("exact1",&c);Netchan_TransmitNextFragment(&c);tx("exact0",&c);
 Netchan_Setup(NS_SERVER,&c,a,0);payload(data,1301);Netchan_Transmit(&c,1301,data);tx("short1",&c);Netchan_TransmitNextFragment(&c);tx("short2",&c);
 Netchan_Setup(NS_CLIENT,&c,a,0);payload(data,4);size=make_packet(packet,1,0,0,0,0,data,4,0);process_case("plain",&c,packet,size,MAX_MSGLEN);payload(data,1);size=make_packet(packet,1,0,0,0,0,data,1,0);process_case("duplicate",&c,packet,size,MAX_MSGLEN);size=make_packet(packet,4,0,0,0,0,data,1,0);process_case("dropped",&c,packet,size,MAX_MSGLEN);
 Netchan_Setup(NS_SERVER,&c,a,0);payload(data,1300);size=make_packet(packet,7,1,123,0,1300,data,1300,1);process_case("frag1",&c,packet,size,MAX_MSGLEN);payload(data,2);size=make_packet(packet,7,1,123,1300,2,data,2,1);process_case("frag2",&c,packet,size,MAX_MSGLEN);
 Netchan_Setup(NS_SERVER,&c,a,0);payload(data,1);size=make_packet(packet,2,1,0,3,1,data,1,1);process_case("gap",&c,packet,size,MAX_MSGLEN);size=make_packet(packet,2,1,0,0,2,data,1,1);process_case("truncated",&c,packet,size,MAX_MSGLEN);
 Netchan_Setup(NS_CLIENT,&c,a,0);payload(data,1300);size=make_packet(packet,8,1,0,0,1300,data,1300,0);process_case("exact_recv_data",&c,packet,size,MAX_MSGLEN);size=make_packet(packet,8,1,0,1300,0,data,0,0);process_case("exact_recv_zero",&c,packet,size,MAX_MSGLEN);
 Netchan_Setup(NS_CLIENT,&c,a,0);payload(data,1300);size=make_packet(packet,9,1,0,0,1300,data,1300,0);process_case("newseq_old",&c,packet,size,MAX_MSGLEN);payload(data,1);size=make_packet(packet,10,1,0,0,1,data,1,0);process_case("newseq_reset",&c,packet,size,MAX_MSGLEN);
 Netchan_Setup(NS_CLIENT,&c,a,0);payload(data,1300);size=make_packet(packet,11,1,0,0,1300,data,1300,0);process_case("retry_first",&c,packet,size,MAX_MSGLEN);payload(data,1);size=make_packet(packet,11,1,0,1301,1,data,1,0);process_case("retry_gap",&c,packet,size,MAX_MSGLEN);size=make_packet(packet,11,1,0,1300,1,data,1,0);process_case("retry_ok",&c,packet,size,MAX_MSGLEN);
 Netchan_Setup(NS_CLIENT,&c,a,0);payload(data,1);size=make_packet(packet,12,0,0,0,0,data,1,0);process_case("partial_base",&c,packet,size,MAX_MSGLEN);payload(data,1300);size=make_packet(packet,13,1,0,0,1300,data,1300,0);process_case("partial_first",&c,packet,size,MAX_MSGLEN);payload(data,1);size=make_packet(packet,12,0,0,0,0,data,1,0);process_case("partial_old",&c,packet,size,MAX_MSGLEN);payload(data,1300);size=make_packet(packet,13,1,0,0,1300,data,1300,0);process_case("partial_duplicate",&c,packet,size,MAX_MSGLEN);
 Netchan_Setup(NS_SERVER,&c,a,0);payload(data,1);size=make_packet(packet,3,0,4321,0,0,data,1,1);process_case("server_qport",&c,packet,size,MAX_MSGLEN);
 Netchan_Setup(NS_CLIENT,&c,a,0);size=make_packet(packet,20,1,0,0,-1,data,0,0);process_case("negative_length",&c,packet,size,MAX_MSGLEN);payload(data,2);size=make_packet(packet,21,1,0,0,3,data,2,0);process_case("overlong_length",&c,packet,size,MAX_MSGLEN);return 0;}
