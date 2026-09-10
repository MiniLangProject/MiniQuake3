/* SPDX-License-Identifier: GPL-2.0-or-later
 * Deterministic host around unchanged SV_PacketEvent.
 */
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
typedef unsigned char byte;typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define CS_FREE 0
#define CS_ZOMBIE 1
#define NS_SERVER 1
typedef struct {int type;byte ip[4];unsigned short port;} netadr_t;
typedef struct {netadr_t remoteAddress;int qport;} netchan_t;
typedef struct {byte *data;int maxsize,cursize,readcount,bit,oob;} msg_t;
typedef struct client_s {int state;netchan_t netchan;int lastPacketTime;} client_t;
typedef struct {client_t *clients;int time;} serverStatic_t;
typedef struct {int integer;} cvar_t;
static serverStatic_t svs;static cvar_t maxclients_store,*sv_maxclients=&maxclients_store;
static client_t clients[3];static char events[64];static int processAccept,processHeader;
static void mark(char c){int n=(int)strlen(events);events[n]=c;events[n+1]=0;}
static void MSG_BeginReadingOOB(msg_t*m){m->readcount=0;m->bit=0;m->oob=qtrue;}
static int MSG_ReadLong(msg_t*m){int v=(int)((unsigned)m->data[m->readcount]|((unsigned)m->data[m->readcount+1]<<8)|((unsigned)m->data[m->readcount+2]<<16)|((unsigned)m->data[m->readcount+3]<<24));m->readcount+=4;m->bit+=32;if(m->readcount>m->cursize)return-1;return v;}
static int MSG_ReadShort(msg_t*m){int v=m->data[m->readcount]|(m->data[m->readcount+1]<<8);m->readcount+=2;m->bit+=16;if(m->readcount>m->cursize)return-1;return(short)v;}
static int NET_CompareBaseAdr(netadr_t a,netadr_t b){return a.type==b.type&&!memcmp(a.ip,b.ip,4);}
static void Com_Printf(const char*f,...){(void)f;mark('F');}
static void SV_ConnectionlessPacket(netadr_t from,msg_t*m){(void)from;m->readcount=m->cursize;m->bit=m->cursize*8;mark('O');}
static qboolean SV_Netchan_Process(client_t*c,msg_t*m){(void)c;mark('N');if(!processAccept)return qfalse;m->readcount=processHeader;m->bit=processHeader*8;return qtrue;}
static void SV_ExecuteClientMessage(client_t*c,msg_t*m){(void)c;(void)m;mark('E');}
static void NET_OutOfBandPrint(int sock,netadr_t from,const char*text){(void)sock;(void)from;(void)text;mark('D');}
#include "server_packet_event_under_test.inc"
static netadr_t adr(int last,int port){netadr_t a={4,{1,2,3,(byte)last},(unsigned short)port};return a;}
static void put32(byte*b,int v){b[0]=(byte)v;b[1]=(byte)(v>>8);b[2]=(byte)(v>>16);b[3]=(byte)(v>>24);}
static void reset(void){memset(clients,0,sizeof(clients));events[0]=0;svs.clients=clients;svs.time=777;sv_maxclients->integer=3;processAccept=1;processHeader=6;}
static void setclient(int i,int state,int last,int port,int qport){clients[i].state=state;clients[i].netchan.remoteAddress=adr(last,port);clients[i].netchan.qport=qport;clients[i].lastPacketTime=10+i;}
static void run(const char*label,int size,int oob,int fromLast,int fromPort,int qport){byte data[64]={0};msg_t m;int i;put32(data,4);if(size>=6){data[4]=(byte)qport;data[5]=(byte)(qport>>8);}if(oob)memset(data,255,4);for(i=6;i<size;i++)data[i]=(byte)(i*13+1);memset(&m,0,sizeof(m));m.data=data;m.maxsize=64;m.cursize=size;SV_PacketEvent(adr(fromLast,fromPort),&m);printf("%s|%s|%d|%d",label,events,m.readcount,m.bit);for(i=0;i<3;i++)printf("|%d,%u,%d",clients[i].state,clients[i].netchan.remoteAddress.port,clients[i].lastPacketTime);printf("\n");}
int main(void){
 reset();setclient(0,2,4,27960,1234);run("oob",8,1,9,30000,0);
 reset();setclient(0,2,4,27960,1234);run("ok",12,0,4,27960,1234);
 reset();setclient(0,2,4,27960,1234);run("translated",12,0,4,30000,1234);
 reset();setclient(0,2,4,27960,1234);processAccept=0;run("reject",12,0,4,27960,1234);
 reset();setclient(0,CS_ZOMBIE,4,27960,1234);run("zombie",12,0,4,27960,1234);
 reset();setclient(0,CS_FREE,4,27960,1234);run("free",12,0,4,27960,1234);
 reset();setclient(0,2,4,27960,1234);run("wrongip",12,0,9,27960,1234);
 reset();setclient(0,2,4,27960,1234);run("wrongqport",12,0,4,27960,4321);
 reset();setclient(0,2,4,27960,111);setclient(1,2,4,27961,222);run("second",12,0,4,30000,222);
 reset();setclient(0,2,4,27960,1234);run("runt",3,0,4,27960,1234);
 return 0;
}
