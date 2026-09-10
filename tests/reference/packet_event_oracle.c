/* SPDX-License-Identifier: GPL-2.0-or-later
 * Deterministic host around unchanged CL_PacketEvent.
 */
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
typedef unsigned char byte;typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define CA_CONNECTED 5
#define LittleLong(x) (x)
typedef struct {int type;byte ip[4];unsigned short port;} netadr_t;
typedef struct {netadr_t remoteAddress;} netchan_t;
typedef struct {byte *data;int maxsize,cursize,readcount,bit;} msg_t;
typedef struct {int lastPacketTime,serverMessageSequence;netchan_t netchan;qboolean demorecording,demowaiting;} clientConnection_t;
typedef struct {int state,realtime;} clientStatic_t;
static clientConnection_t clc;static clientStatic_t cls;static int processAccept,processHeader,clearWaiting,demoHeader;static char events[32];
static void mark(char c){int n=(int)strlen(events);events[n]=c;events[n+1]=0;}
static int NET_CompareAdr(netadr_t a,netadr_t b){return a.type==b.type&&!memcmp(a.ip,b.ip,4)&&a.port==b.port;}
static const char *NET_AdrToString(netadr_t a){(void)a;return "address";}
static void Com_Printf(const char *f,...){(void)f;}static void Com_DPrintf(const char *f,...){(void)f;}
static void CL_ConnectionlessPacket(netadr_t from,msg_t*m){(void)from;m->readcount=m->cursize;mark('O');}
static qboolean CL_Netchan_Process(netchan_t*n,msg_t*m){(void)n;mark('N');if(!processAccept)return qfalse;m->readcount=processHeader;m->bit=processHeader*8;return qtrue;}
static void CL_ParseServerMessage(msg_t*m){mark('P');m->readcount=99;if(clearWaiting)clc.demowaiting=qfalse;}
static void CL_WriteDemoMessage(msg_t*m,int header){(void)m;mark('D');demoHeader=header;}
#include "packet_event_under_test.inc"
static netadr_t adr(int last,int port){netadr_t a={4,{1,2,3,(byte)last},(unsigned short)port};return a;}
static void put32(byte*b,int value){b[0]=(byte)value;b[1]=(byte)(value>>8);b[2]=(byte)(value>>16);b[3]=(byte)(value>>24);}
static void hx(byte*b,int n){int i;for(i=0;i<n;i++)printf("%02x",b[i]);}
static void run(const char*label,int state,int size,int oob,int same,int accept,int recording,int waiting,int clear,int sequence,int header){byte data[64]={0};msg_t m;netadr_t from=adr(same?4:9,27960);memset(&clc,0,sizeof(clc));memset(&cls,0,sizeof(cls));events[0]=0;demoHeader=-1;processAccept=accept;processHeader=header;clearWaiting=clear;cls.state=state;cls.realtime=777;clc.netchan.remoteAddress=adr(4,27960);clc.demorecording=recording;clc.demowaiting=waiting;if(oob){memset(data,255,4);strcpy((char*)data+4,"wat");}else{put32(data,sequence);for(int i=4;i<size;i++)data[i]=(byte)(i*17+3);}memset(&m,0,sizeof(m));m.data=data;m.maxsize=64;m.cursize=size;CL_PacketEvent(from,&m);printf("%s|",label);hx(data,size);printf("|%d|%d|%d|%d|%s|%d\n",clc.lastPacketTime,clc.serverMessageSequence,clc.demowaiting,m.readcount,events,demoHeader);}
int main(void){run("oob",1,8,1,0,0,0,0,0,0,6);run("disconnected",3,8,0,1,1,0,0,0,4,6);run("runt",5,3,0,1,1,0,0,0,4,6);run("wrong",5,8,0,0,1,0,0,0,4,6);run("reject",5,8,0,1,0,0,0,0,4,6);run("success",5,12,0,1,1,0,0,0,0x12345678,6);run("waiting",8,12,0,1,1,1,1,0,9,6);run("record",8,12,0,1,1,1,1,1,10,6);run("negative",8,12,0,1,1,1,0,0,-7,4);return 0;}
