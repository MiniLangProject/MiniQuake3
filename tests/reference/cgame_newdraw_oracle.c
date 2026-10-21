#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#ifdef _MSC_VER
#define strcasecmp _stricmp
#endif
typedef int qboolean;typedef int qhandle_t;typedef float vec4_t[4];
#define qtrue 1
#define qfalse 0
#define SYSTEM_PRINT 0
#define TEAM_FREE 0
#define TEAM_RED 1
#define TEAM_BLUE 2
#define TEAM_SPECTATOR 3
#define GT_FFA 0
#define GT_TOURNAMENT 1
#define GT_SINGLE_PLAYER 2
#define GT_TEAM 3
#define GT_CTF 4
#define GT_1FCTF 5
#define GT_OBELISK 6
#define GT_HARVESTER 7
#define FLAG_TAKEN 1
#define FLAG_TAKEN_RED 3
#define FLAG_TAKEN_BLUE 4
#define PERS_SCORE 0
#define PERS_RANK 1
#define PERS_TEAM 3
#define TEAMTASK_OFFENSE 1
#define TEAMTASK_DEFENSE 2
#define TEAMTASK_PATROL 3
#define TEAMTASK_FOLLOW 4
#define TEAMTASK_RETRIEVE 5
#define TEAMTASK_ESCORT 6
#define TEAMTASK_CAMP 7
typedef struct {int integer;} vmCvar_t;
typedef struct {int persistant[16];} playerState_t;
typedef struct {playerState_t ps;} snapshot_t;
typedef struct {int infoValid;char name[64];int team;} clientInfo_t;
typedef struct {qhandle_t assaultShader,defendShader,patrolShader,followShader,campShader,retrieveShader,escortShader;} media_t;
typedef struct {int gametype,redflag,blueflag,maxclients;int flagStatus;media_t media;clientInfo_t clientinfo[4];} cgs_t;
typedef struct {snapshot_t *snap;char killerName[64];int teamScores[2];} cg_t;
static cgs_t cgs;static cg_t cg;static snapshot_t snap;
static char teamChat1[256],teamChat2[256],systemChat[256];
static vmCvar_t cg_currentSelectedPlayer;static int numSortedTeamPlayers;
static char *va(const char *format,...){static char buffers[4][1024];static int at;va_list args;char *out=buffers[(at++)&3];va_start(args,format);vsnprintf(out,1024,format,args);va_end(args);return out;}
static const char *CG_PlaceString(int rank){static char out[32];int teen=rank%100,last=rank%10;const char *suffix="th";if(!(teen>=11&&teen<=13)){if(last==1)suffix="st";else if(last==2)suffix="nd";else if(last==3)suffix="rd";}snprintf(out,sizeof(out),"%d%s",rank,suffix);return out;}
#define Q_stricmp strcasecmp

#include "cgame_newdraw_under_test.inc"

static const char *boolean(int value){return value?"true":"false";}
static const char *handle_name(int value){switch(value){case 11:return "defend";case 12:return "patrol";case 13:return "follow";case 14:return "camp";case 15:return "retrieve";case 16:return "escort";default:return "assault";}}
int main(void){vec4_t color;
 cg.snap=&snap;CG_InitTeamChat();CG_SetPrintString(SYSTEM_PRINT,"system");CG_SetPrintString(1,"first");CG_SetPrintString(1,"second");printf("chat|%s|%s|%s\n",systemChat,teamChat1,teamChat2);
 cgs.media.assaultShader=10;cgs.media.defendShader=11;cgs.media.patrolShader=12;cgs.media.followShader=13;cgs.media.campShader=14;cgs.media.retrieveShader=15;cgs.media.escortShader=16;printf("status");for(int i=0;i<=8;i++)printf("|%s",handle_name(CG_StatusHandle(i)));printf("\n");
 cgs.gametype=GT_CTF;snap.ps.persistant[PERS_TEAM]=TEAM_RED;cgs.redflag=FLAG_TAKEN;cgs.blueflag=0;printf("flags|%s|%s",boolean(CG_OtherTeamHasFlag()),boolean(CG_YourTeamHasFlag()));cgs.blueflag=FLAG_TAKEN;printf("|%s\n",boolean(CG_YourTeamHasFlag()));
 cgs.gametype=GT_1FCTF;cgs.flagStatus=FLAG_TAKEN_BLUE;printf("oneflag|%s|%s\n",boolean(CG_OtherTeamHasFlag()),boolean(CG_YourTeamHasFlag()));
 printf("types");for(int i=0;i<=7;i++){cgs.gametype=i;printf("|%s",CG_GameTypeString());}printf("\n");
 cg.killerName[0]=0;printf("killer|%s",CG_GetKillerText());strcpy(cg.killerName,"Sarge");printf("|%s\n",CG_GetKillerText());
 snap.ps.persistant[PERS_TEAM]=TEAM_RED;CG_GetTeamColor(&color);printf("colors|%.2f,%.2f,%.2f,%.2f",color[0],color[1],color[2],color[3]);snap.ps.persistant[PERS_TEAM]=TEAM_BLUE;CG_GetTeamColor(&color);printf("|%.2f,%.2f,%.2f,%.2f",color[0],color[1],color[2],color[3]);snap.ps.persistant[PERS_TEAM]=TEAM_FREE;CG_GetTeamColor(&color);printf("|%.2f,%.2f,%.2f,%.2f\n",color[0],color[1],color[2],color[3]);
 cgs.maxclients=2;cgs.clientinfo[0].infoValid=1;strcpy(cgs.clientinfo[0].name,"Ranger");cgs.clientinfo[1].infoValid=1;strcpy(cgs.clientinfo[1].name,"Sarge");printf("clients|%d|%d\n",CG_ClientNumFromName("rAnGeR"),CG_ClientNumFromName("missing"));
 numSortedTeamPlayers=2;cg_currentSelectedPlayer.integer=4;{int selected=CG_GetSelectedPlayer();printf("selected|%d|%d\n",selected,cg_currentSelectedPlayer.integer);}
 cgs.gametype=GT_FFA;snap.ps.persistant[PERS_TEAM]=TEAM_FREE;snap.ps.persistant[PERS_RANK]=0;snap.ps.persistant[PERS_SCORE]=5;printf("game|%s",CG_GetGameStatusText());cgs.gametype=GT_TEAM;cg.teamScores[0]=4;cg.teamScores[1]=2;printf("|%s",CG_GetGameStatusText());cg.teamScores[1]=4;printf("|%s\n",CG_GetGameStatusText());return 0;}
