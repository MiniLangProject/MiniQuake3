/* Unchanged decision bodies extracted from code/client/cl_main.c. */
#include <ctype.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#define MAX_RELIABLE_COMMANDS 64
#define MAX_STRING_CHARS 1024
#define MAX_OSPATH 256
#define MAX_PINGREQUESTS 32
#define CDKEY_LEN 16
#define CDCHKSUM_LEN 2
#define NA_IP 4
typedef unsigned char byte;
typedef int qboolean;
#define qtrue 1
#define qfalse 0

typedef struct { int type; byte ip[4]; unsigned short port; } netadr_t;
typedef struct { byte ip[4]; unsigned short port; } serverAddress_t;
typedef struct { netadr_t adr; int clients; char hostName[64],mapName[64]; int maxClients,maxPing,minPing,ping; char game[32]; int gameType,netType; } serverInfo_t;
typedef struct { netadr_t adr; int start,time; char info[256]; } ping_t;
typedef struct { int realtime; } cls_t;
typedef struct { int reliableSequence,reliableAcknowledge; char reliableCommands[MAX_RELIABLE_COMMANDS][MAX_STRING_CHARS]; } clc_t;
static cls_t cls;
static clc_t clc;
static ping_t cl_pinglist[MAX_PINGREQUESTS];

static void fail(const char *message) { fprintf(stderr,"FAIL: %s\n",message); exit(1); }
static void require(int condition,const char *message) { if (!condition) fail(message); }
static void Q_strncpyz(char *dst,const char *src,size_t size) { if (!size) return; strncpy(dst,src,size-1); dst[size-1]=0; }
static int Q_stricmp(const char *a,const char *b) { while (*a && *b) { int x=tolower((unsigned char)*a++),y=tolower((unsigned char)*b++); if(x!=y)return x-y; } return (unsigned char)*a-(unsigned char)*b; }
static void Com_sprintf(char *dst,size_t size,const char *format,...) { va_list args; va_start(args,format); vsnprintf(dst,size,format,args); va_end(args); }
static void Com_Error(int code,const char *text) { (void)code; fail(text); }
#define ERR_DROP 1

void CL_AddReliableCommand( const char *cmd ) {
	int		index;
	if ( clc.reliableSequence - clc.reliableAcknowledge > MAX_RELIABLE_COMMANDS ) {
		Com_Error( ERR_DROP, "Client command overflow" );
	}
	clc.reliableSequence++;
	index = clc.reliableSequence & ( MAX_RELIABLE_COMMANDS - 1 );
	Q_strncpyz( clc.reliableCommands[ index ], cmd, sizeof( clc.reliableCommands[ index ] ) );
}

void CL_ChangeReliableCommand( void ) {
	int r, index, l;
	r = clc.reliableSequence - (rand() * 5);
	index = clc.reliableSequence & ( MAX_RELIABLE_COMMANDS - 1 );
	l = (int)strlen(clc.reliableCommands[ index ]);
	if ( l >= MAX_STRING_CHARS - 1 ) {
		l = MAX_STRING_CHARS - 2;
	}
	clc.reliableCommands[ index ][ l ] = '\n';
	clc.reliableCommands[ index ][ l+1 ] = '\0';
	(void)r;
}

void CL_DemoFilename( int number, char *fileName ) {
	int		a,b,c,d;
	if ( number < 0 || number > 9999 ) {
		Com_sprintf( fileName, MAX_OSPATH, "demo9999.tga" );
		return;
	}
	a = number / 1000;
	number -= a*1000;
	b = number / 100;
	number -= b*100;
	c = number / 10;
	number -= c*10;
	d = number;
	Com_sprintf( fileName, MAX_OSPATH, "demo%i%i%i%i", a, b, c, d );
}

void CL_InitServerInfo( serverInfo_t *server, serverAddress_t *address ) {
	server->adr.type  = NA_IP;
	server->adr.ip[0] = address->ip[0];
	server->adr.ip[1] = address->ip[1];
	server->adr.ip[2] = address->ip[2];
	server->adr.ip[3] = address->ip[3];
	server->adr.port  = address->port;
	server->clients = 0;
	server->hostName[0] = '\0';
	server->mapName[0] = '\0';
	server->maxClients = 0;
	server->maxPing = 0;
	server->minPing = 0;
	server->ping = -1;
	server->game[0] = '\0';
	server->gameType = 0;
	server->netType = 0;
}

int CL_GetPingQueueCount( void ) {
	int i,count; ping_t* pingptr;
	count=0; pingptr=cl_pinglist;
	for (i=0; i<MAX_PINGREQUESTS; i++, pingptr++ ) if (pingptr->adr.port) count++;
	return count;
}

ping_t* CL_GetFreePing( void ) {
	ping_t* pingptr; ping_t* best; int oldest; int i; int time;
	pingptr = cl_pinglist;
	for (i=0; i<MAX_PINGREQUESTS; i++, pingptr++) {
		if (pingptr->adr.port) {
			if (!pingptr->time) { if (cls.realtime - pingptr->start < 500) continue; }
			else if (pingptr->time < 500) continue;
		}
		pingptr->adr.port = 0; return pingptr;
	}
	pingptr=cl_pinglist; best=cl_pinglist; oldest=INT_MIN;
	for (i=0; i<MAX_PINGREQUESTS; i++, pingptr++) { time=cls.realtime-pingptr->start; if(time>oldest){oldest=time;best=pingptr;} }
	return best;
}

qboolean CL_CDKeyValidate( const char *key, const char *checksum ) {
	char ch; byte sum; char chs[3]; int i, len;
	len = (int)strlen(key);
	if( len != CDKEY_LEN ) return qfalse;
	if( checksum && strlen( checksum ) != CDCHKSUM_LEN ) return qfalse;
	sum = 0;
	for (i = 0; i < len; i++) {
		ch = *key++;
		if (ch>='a' && ch<='z') ch -= 32;
		switch( ch ) {
		case '2': case '3': case '7': case 'A': case 'B': case 'C': case 'D': case 'G': case 'H': case 'J': case 'L': case 'P': case 'R': case 'S': case 'T': case 'W': sum += ch; continue;
		default: return qfalse;
		}
	}
	sprintf(chs, "%02x", sum);
	if (checksum && !Q_stricmp(chs, checksum)) return qtrue;
	if (!checksum) return qtrue;
	return qfalse;
}

int main(void) {
	int observations=0; char name[MAX_OSPATH]; serverInfo_t si; serverAddress_t address={{1,2,3,4},27960};
	CL_DemoFilename(0,name);require(!strcmp(name,"demo0000"),"demo 0");observations++;
	CL_DemoFilename(42,name);require(!strcmp(name,"demo0042"),"demo 42");observations++;
	CL_DemoFilename(9999,name);require(!strcmp(name,"demo9999"),"demo 9999");observations++;
	CL_DemoFilename(-1,name);require(!strcmp(name,"demo9999.tga"),"demo invalid");observations++;
	require(CL_CDKeyValidate("2222222222222222",NULL),"key alphabet");observations++;
	require(CL_CDKeyValidate("2222222222222222","20"),"key checksum");observations++;
	require(CL_CDKeyValidate("aaaaaaaaaaaaaaaa","10"),"key lowercase");observations++;
	require(!CL_CDKeyValidate("2222","20"),"key length");observations++;
	require(!CL_CDKeyValidate("EEEEEEEEEEEEEEEE",NULL),"key character");observations++;
	memset(&si,0x7f,sizeof(si));CL_InitServerInfo(&si,&address);require(si.adr.type==NA_IP&&si.adr.ip[2]==3&&si.adr.port==27960,"server address");observations++;
	require(si.clients==0&&si.maxClients==0&&si.ping==-1,"server numbers");observations++;
	require(!si.hostName[0]&&!si.mapName[0]&&!si.game[0],"server strings");observations++;
	CL_AddReliableCommand("say hello");require(clc.reliableSequence==1&&!strcmp(clc.reliableCommands[1],"say hello"),"reliable add");observations++;
	CL_ChangeReliableCommand();require(!strcmp(clc.reliableCommands[1],"say hello\n"),"reliable change");observations++;
	memset(cl_pinglist,0,sizeof(cl_pinglist));require(CL_GetPingQueueCount()==0,"empty pings");observations++;
	cl_pinglist[0].adr.port=1;cl_pinglist[1].adr.port=2;require(CL_GetPingQueueCount()==2,"ping count");observations++;
	cls.realtime=100;require(CL_GetFreePing()==&cl_pinglist[2],"first free ping");observations++;
	for(int i=0;i<MAX_PINGREQUESTS;i++){cl_pinglist[i].adr.port=1;cl_pinglist[i].start=99;cl_pinglist[i].time=20;}
	cl_pinglist[7].time=600;require(CL_GetFreePing()==&cl_pinglist[7],"queried result reused");observations++;
	printf("PASS: %d unchanged-C client_main observations\n",observations);return 0;
}
