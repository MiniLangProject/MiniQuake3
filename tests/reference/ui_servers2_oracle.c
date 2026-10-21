#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define QDECL
#define SORT_HOST 0
#define SORT_MAP 1
#define SORT_CLIENTS 2
#define SORT_GAME 3
#define SORT_PING 4
typedef int qboolean;
typedef struct servernode_s {
  char adrstr[64];
  char hostname[25];
  char mapname[16];
  int numclients,maxclients,pingtime,gametype;
  char gamename[12];
  int nettype,minPing,maxPing;
  qboolean bPB;
} servernode_t;

static int g_sortkey;
static double maxPingCvar;
static double trap_Cvar_VariableValue(const char *name){(void)name;return maxPingCvar;}
static int Q_stricmp(const char *a,const char *b){
  while(*a&&*b){int x=tolower((unsigned char)*a++),y=tolower((unsigned char)*b++);if(x!=y)return x-y;}
  return (unsigned char)*a-(unsigned char)*b;
}

#include "ui_servers2_under_test.inc"

static int signum(int value){return value<0?-1:(value>0?1:0);}
int main(void){
  servernode_t left,right;
  memset(&left,0,sizeof(left));memset(&right,0,sizeof(right));
  maxPingCvar=50;printf("max|50|%d\n",ArenaServers_MaxPing());
  maxPingCvar=250;printf("max|250|%d\n",ArenaServers_MaxPing());
  maxPingCvar=150.9;printf("max|150.9|%d\n",ArenaServers_MaxPing());
  strcpy(left.hostname,"Alpha");strcpy(right.hostname,"Bravo");
  strcpy(left.mapname,"Arena");strcpy(right.mapname,"Bravo");
  left.numclients=7;left.maxclients=8;right.numclients=2;right.maxclients=8;
  left.gametype=3;right.gametype=1;left.pingtime=50;right.pingtime=100;
  for(g_sortkey=0;g_sortkey<=4;g_sortkey++)printf("compare|%d|%d\n",g_sortkey,signum(ArenaServers_Compare(&left,&right)));
  right.pingtime=50;g_sortkey=SORT_PING;printf("ping-tie|%d\n",signum(ArenaServers_Compare(&left,&right)));
  return 0;
}
