/* SPDX-License-Identifier: GPL-2.0-or-later
 * Deterministic host for unchanged address, loopback and inactive scramble
 * bodies from Baseq3 qcommon/net_chan.c.
 */
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdlib.h>
typedef unsigned char byte; typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define QDECL
#define MAX_PACKETLEN 1400
#define MAX_MSGLEN 16384
#define MAX_STRING_CHARS 1024
#define MAX_LOOPBACK 16
#define SCRAMBLE_START 6
#define ERR_DROP 1
#define LittleLong(x) (x)
#define PORT_SERVER 27960
#define NA_BOT 0
#define NA_BAD 1
#define NA_LOOPBACK 2
#define NA_BROADCAST 3
#define NA_IP 4
#define NA_IPX 5
#define NA_BROADCAST_IPX 6
#define NS_CLIENT 0
#define NS_SERVER 1
typedef int netsrc_t;
typedef struct {int type;byte ip[4],ipx[10];unsigned short port;} netadr_t;
typedef struct {byte *data;int maxsize,cursize,readcount,bit;} msg_t;
typedef struct {int integer;} cvar_t;
typedef struct {byte data[MAX_PACKETLEN];int datalen;} loopmsg_t;
typedef struct {loopmsg_t msgs[16];int get,send;} loopback_t;
loopback_t loopbacks[2];
static cvar_t showpackets_store; static cvar_t *showpackets=&showpackets_store;
static byte system_packet[MAX_PACKETLEN];static int system_length,system_count;
static unsigned short BigShort(unsigned short x){return (unsigned short)((x>>8)|(x<<8));}
static void Com_Memset(void*p,int v,size_t n){memset(p,v,n);}static void Com_Memcpy(void*d,const void*s,size_t n){memcpy(d,s,n);}
static void Com_Error(int code,const char*f,...){(void)code;(void)f;abort();}
static void Com_Printf(const char*f,...){(void)f;}static void Com_sprintf(char*out,size_t cap,const char*f,...){va_list a;va_start(a,f);vsnprintf(out,cap,f,a);va_end(a);}
static void Q_strncpyz(char*out,const char*in,size_t cap){if(!cap)return;strncpy(out,in,cap-1);out[cap-1]=0;}
static void Sys_SendPacket(int length,const void*data,netadr_t to){(void)to;system_count++;system_length=length;memcpy(system_packet,data,(size_t)length);}
static int Sys_StringToAdr(const char*s,netadr_t*a){memset(a,0,sizeof(*a));if(!strcmp(s,"ok")){a->type=NA_IP;a->ip[0]=1;a->ip[1]=2;a->ip[2]=3;a->ip[3]=4;return 1;}if(!strcmp(s,"broadcast")){a->type=NA_IP;memset(a->ip,255,4);return 1;}return 0;}
#include "netchan_complete_under_test.inc"
static netadr_t adr(int type,int a,int b,int c,int d,int port){netadr_t x;memset(&x,0,sizeof(x));x.type=type;x.ip[0]=(byte)a;x.ip[1]=(byte)b;x.ip[2]=(byte)c;x.ip[3]=(byte)d;x.port=BigShort((unsigned short)port);return x;}
static void record_addr(void){netadr_t a=adr(NA_IP,1,2,3,4,27960),b=a,c=adr(NA_IP,1,2,3,5,27960),l=adr(NA_LOOPBACK,9,9,9,9,3),x,y;char ta[64],tl[64],tbad[64],tbroad[64];int i; b.port=BigShort(27961);memset(&x,0,sizeof(x));memset(&y,0,sizeof(y));x.type=y.type=NA_IPX;x.port=y.port=BigShort(7);for(i=0;i<10;i++)x.ipx[i]=y.ipx[i]=(byte)i;strcpy(ta,NET_AdrToString(a));strcpy(tl,NET_AdrToString(l));strcpy(tbad,NET_AdrToString(adr(NA_BAD,0,0,0,0,0)));strcpy(tbroad,NET_AdrToString(adr(NA_BROADCAST,255,255,255,255,27960)));
 printf("A|%d|%d|%d|%d|%d|%d|%s|%s|%d\n",NET_CompareBaseAdr(a,b),NET_CompareAdr(a,b),NET_CompareBaseAdr(a,c),NET_CompareAdr(l,adr(NA_LOOPBACK,0,0,0,0,9)),NET_CompareBaseAdr(x,y),NET_CompareAdr(x,y),ta,tl,NET_IsLocalAddress(l));
 printf("X|%s\n",NET_AdrToString(x));
 printf("F|%s|%s\n",tbad,tbroad);
}
static void record_loop(void){byte data[4]={1,2,3,4},storage[64];msg_t m={storage,64,0,0,0};netadr_t from;int i;memset(loopbacks,0,sizeof(loopbacks));printf("L|empty=%d\n",NET_GetLoopPacket(NS_SERVER,&from,&m));NET_SendLoopPacket(NS_CLIENT,4,data,adr(NA_LOOPBACK,0,0,0,0,0));printf("L|one=%d,%d,%d,%d,%d\n",NET_GetLoopPacket(NS_SERVER,&from,&m),m.cursize,m.data[0],m.data[3],from.type);memset(loopbacks,0,sizeof(loopbacks));for(i=0;i<20;i++){data[0]=(byte)i;NET_SendLoopPacket(NS_CLIENT,1,data,from);}printf("L|wrap=");while(NET_GetLoopPacket(NS_SERVER,&from,&m))printf("%d,",m.data[0]);putchar('\n');}
static void record_send(void){byte d[5]={9,8,7,6,0};netadr_t loop=adr(NA_LOOPBACK,0,0,0,0,0),ip=adr(NA_IP,8,8,8,8,27960);memset(loopbacks,0,sizeof(loopbacks));system_count=0;NET_SendPacket(NS_CLIENT,4,d,loop);NET_SendPacket(NS_CLIENT,4,d,adr(NA_BOT,0,0,0,0,0));NET_SendPacket(NS_CLIENT,4,d,adr(NA_BAD,0,0,0,0,0));NET_SendPacket(NS_CLIENT,4,d,ip);printf("S|%d|%d|%d|%d\n",loopbacks[NS_SERVER].send,system_count,system_length,system_packet[0]);NET_OutOfBandPrint(NS_SERVER,ip,"hello %d",7);printf("O|%d|%02x%02x%02x%02x|%s\n",system_length,system_packet[0],system_packet[1],system_packet[2],system_packet[3],system_packet+4);}
static void record_parse(const char*s){netadr_t a;int ok=NET_StringToAdr(s,&a);printf("P|%s|%d|%d|%d.%d.%d.%d|%u\n",s,ok,a.type,a.ip[0],a.ip[1],a.ip[2],a.ip[3],ok?BigShort(a.port):0);}
static void hex(const byte*d,int n){int i;for(i=0;i<n;i++)printf("%02x",d[i]);}
static void record_scramble(void){byte d[32],original[32];int i;for(i=0;i<32;i++)d[i]=original[i]=(byte)(i*17+3);Netchan_ScramblePacket((msg_t*)&(msg_t){d,32,32,0,0});printf("C|");hex(d,32);Netchan_UnScramblePacket((msg_t*)&(msg_t){d,32,32,0,0});printf("|");hex(d,32);printf("|%d\n",memcmp(d,original,32)==0);}
int main(void){record_addr();record_loop();record_send();record_parse("localhost");record_parse("ok");record_parse("ok:1234");record_parse("bad");record_parse("broadcast");record_scramble();return 0;}
