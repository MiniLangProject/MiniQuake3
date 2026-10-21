#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#define MAX_CLIENTS 64
#define TEAM_RED 1
#define TEAM_BLUE 2
#define TEAM_SPECTATOR 3
#define FEEDER_REDTEAM_LIST 1
#define FEEDER_BLUETEAM_LIST 2
#define FEEDER_SCOREBOARD 3
#define PERS_ATTACKER 6
typedef int qboolean;
typedef struct { int persistant[16]; } playerState_t;
typedef struct { playerState_t ps; } snapshot_t;
typedef struct { int time,crosshairClientTime,crosshairClientNum,attackerTime; snapshot_t *snap; char spectatorList[1024];int spectatorLen,spectatorWidth,numScores;struct {int team;} scores[64];} cg_t;
typedef struct {int infoValid,team;const char *name;} clientInfo_t;
typedef struct {clientInfo_t clientinfo[64];} cgs_t;
cg_t cg;cgs_t cgs;
static const char *va(const char *fmt,...){static char b[256];va_list ap;va_start(ap,fmt);vsnprintf(b,sizeof(b),fmt,ap);va_end(ap);return b;}
static void Q_strcat(char *dst,size_t cap,const char *src){size_t n=strlen(dst);if(n<cap-1)strncat(dst,src,cap-n-1);}
#include "cgame_main_under_test.inc"
int main(void){snapshot_t snap={0};cg.snap=&snap;snap.ps.persistant[6]=7;cg.time=1000;cg.crosshairClientTime=0;cg.crosshairClientNum=3;cg.attackerTime=0;printf("query|%d|%d\n",CG_CrosshairPlayer(),CG_LastAttacker());cg.time=999;cg.attackerTime=1;printf("query|%d|%d\n",CG_CrosshairPlayer(),CG_LastAttacker());cg.time=1001;printf("query|%d|%d\n",CG_CrosshairPlayer(),CG_LastAttacker());cgs.clientinfo[0]=(clientInfo_t){1,TEAM_SPECTATOR,"A"};cgs.clientinfo[3]=(clientInfo_t){1,TEAM_SPECTATOR,"Long Name"};CG_BuildSpectatorString();printf("spectators|%u|%s\n",(unsigned)strlen(cg.spectatorList),cg.spectatorList);cg.numScores=3;cg.scores[0].team=TEAM_RED;cg.scores[1].team=TEAM_BLUE;cg.scores[2].team=TEAM_RED;printf("feeders|%d|%d|%d\n",CG_FeederCount(FEEDER_REDTEAM_LIST),CG_FeederCount(FEEDER_BLUETEAM_LIST),CG_FeederCount(FEEDER_SCOREBOARD));return 0;}
