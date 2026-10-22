#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdarg.h>
#include <string.h>

typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define TEAMTASK_OFFENSE 1
#define TEAMTASK_DEFENSE 2
#define TEAMTASK_PATROL 3
#define TEAMTASK_FOLLOW 4
#define TEAMTASK_RETRIEVE 5
#define TEAMTASK_ESCORT 6
#define TEAMTASK_CAMP 7
#define GT_CTF 4
#define GT_1FCTF 5
#define VOICECHAT_YES "yes"
#define VOICECHAT_NO "no"
#define VOICECHAT_ONGETFLAG "ongetflag"
#define VOICECHAT_ONOFFENSE "onoffense"
#define VOICECHAT_ONDEFENSE "ondefense"
#define VOICECHAT_ONPATROL "onpatrol"
#define VOICECHAT_ONCAMPING "oncamp"
#define VOICECHAT_ONFOLLOW "onfollow"
#define VOICECHAT_ONRETURNFLAG "onreturnflag"
#define VOICECHAT_ONFOLLOWCARRIER "onfollowcarrier"
#define VOICECHAT_IHAVEFLAG "ihaveflag"
#define SCREEN_HEIGHT 480
#define FEEDER_SCOREBOARD 1
#define FEEDER_REDTEAM_LIST 2
#define FEEDER_BLUETEAM_LIST 3

typedef struct { int integer; } vmCvar_t;
typedef struct { int teamLeader; } clientInfo_t;
typedef struct { int clientNum; } playerState_t;
typedef struct { playerState_t ps; } snapshot_t;
typedef struct { int winnerSound, loserSound; } media_t;
typedef struct {
    clientInfo_t clientinfo[64]; int currentOrder, orderPending, orderTime;
    int acceptLeader, acceptTask, acceptOrderTime, gametype; media_t media;
} cgs_t;
typedef struct { int time, scoreBoardShowing; snapshot_t *snap; } cg_t;

static cgs_t cgs; static cg_t cg; static snapshot_t snapshot;
static int sortedTeamPlayers[64]; static vmCvar_t cg_currentSelectedPlayer;
static void *menuScoreboard = (void *)1;
static int otherFlag, yourFlag, target, selected;
static char hud_input[1024], console_text[2048], client_text[2048], cvar_text[2048];
static char menu_text[2048], sound_text[256], center_text[256];

static void add(char *dst, size_t cap, const char *text) { if (dst[0]) strcat_s(dst,cap,";"); strcat_s(dst,cap,text); }
static char *va(const char *format, ...) { static char buffers[8][1024]; static int index; char *out=buffers[index++&7]; va_list args; va_start(args,format); vsprintf_s(out,1024,format,args); va_end(args); return out; }
static void trap_SendConsoleCommand(const char *text) { add(console_text,sizeof(console_text),text); }
static void trap_SendClientCommand(const char *text) { add(client_text,sizeof(client_text),text); }
static void trap_Cvar_Set(const char *name,const char *value) { add(cvar_text,sizeof(cvar_text),va("%s=%s",name,value)); }
static void trap_Cvar_VariableStringBuffer(const char *name,char *out,int size) { (void)name; strncpy_s(out,(size_t)size,hud_input,_TRUNCATE); }
static void String_Init(void) { add(menu_text,sizeof(menu_text),"string-init"); }
static void Menu_Reset(void) { add(menu_text,sizeof(menu_text),"menu-reset"); }
static void CG_LoadMenus(const char *name) { add(menu_text,sizeof(menu_text),va("load:%s",name)); }
static void Menu_ScrollFeeder(void *menu,int feeder,qboolean down) { (void)menu; add(menu_text,sizeof(menu_text),va("scroll:%d:%d",feeder,down)); }
static void CG_AddBufferedSound(int sound) { add(sound_text,sizeof(sound_text),va("%d",sound)); }
static void CG_CenterPrint(const char *text,int y,int width) { sprintf_s(center_text,sizeof(center_text),"%s:%d:%d",text,y,width); }
static void CG_SelectNextPlayer(void) { selected++; }
static void CG_SelectPrevPlayer(void) { selected--; }
static qboolean CG_OtherTeamHasFlag(void) { return otherFlag; }
static qboolean CG_YourTeamHasFlag(void) { return yourFlag; }
static int CG_CrosshairPlayer(void) { return target; }
static void Com_sprintf(char *out,int size,const char *format,...) { va_list args; va_start(args,format); vsprintf_s(out,(size_t)size,format,args); va_end(args); }

#include "cgame_console_missionpack_under_test.inc"

static void reset(void) {
    memset(&cgs,0,sizeof(cgs)); memset(&cg,0,sizeof(cg)); memset(&snapshot,0,sizeof(snapshot));
    cg.snap=&snapshot; cgs.media.winnerSound=11; cgs.media.loserSound=22;
    memset(sortedTeamPlayers,0,sizeof(sortedTeamPlayers)); cg_currentSelectedPlayer.integer=0;
    otherFlag=yourFlag=0; target=-1; selected=0; hud_input[0]=0;
    console_text[0]=client_text[0]=cvar_text[0]=menu_text[0]=sound_text[0]=center_text[0]=0;
    menuScoreboard=(void *)1;
}
static void row(const char *name) {
    printf("%s|%s|%s|%s|%s|%s|%s|%d|%d|%d|%d|%d\n",name,console_text,client_text,cvar_text,menu_text,sound_text,center_text,selected,cgs.currentOrder,cgs.orderPending,cgs.orderTime,cgs.acceptOrderTime);
}

int main(void) {
    reset(); CG_LoadHud_f(); row("loadhud");
    reset(); cg.scoreBoardShowing=1; CG_scrollScoresDown_f(); row("scroll-down");
    reset(); cg.scoreBoardShowing=1; CG_scrollScoresUp_f(); row("scroll-up");
    reset(); CG_spWin_f(); row("sp-win");
    reset(); CG_spLose_f(); row("sp-lose");
    reset(); CG_NextTeamMember_f(); CG_PrevTeamMember_f(); row("team-member");
    reset(); cgs.clientinfo[0].teamLeader=0; sortedTeamPlayers[0]=1; snapshot.ps.clientNum=0; cgs.currentOrder=TEAMTASK_FOLLOW; CG_NextOrder_f(); row("order-blocked");
    reset(); cgs.clientinfo[0].teamLeader=1; snapshot.ps.clientNum=0; cgs.currentOrder=TEAMTASK_FOLLOW; cg.time=500; CG_NextOrder_f(); row("order-skip");
    reset(); cgs.acceptLeader=2;cgs.acceptTask=TEAMTASK_DEFENSE;cgs.acceptOrderTime=1000;cg.time=900;CG_ConfirmOrder_f();row("confirm");
    reset(); cgs.acceptLeader=3;cgs.acceptOrderTime=1000;cg.time=900;CG_DenyOrder_f();row("deny");
    reset(); cgs.gametype=GT_CTF;CG_TaskOffense_f();row("offense-ctf");
    reset(); cgs.gametype=0;CG_TaskOffense_f();row("offense");
    reset(); CG_TaskDefense_f();row("defense");
    reset(); CG_TaskPatrol_f();row("patrol");
    reset(); CG_TaskCamp_f();row("camp");
    reset(); CG_TaskFollow_f();row("follow");
    reset(); CG_TaskRetrieve_f();row("retrieve");
    reset(); CG_TaskEscort_f();row("escort");
    reset(); CG_TaskOwnFlag_f();row("ownflag");
    reset(); target=4;CG_TaskSuicide_f();row("suicide");
    reset(); CG_TauntKillInsult_f();row("taunt-kill");
    reset(); CG_TauntPraise_f();row("taunt-praise");
    reset(); CG_TauntTaunt_f();row("taunt");
    reset(); CG_TauntDeathInsult_f();row("taunt-death");
    reset(); CG_TauntGauntlet_f();row("taunt-gauntlet");
    return 0;
}
