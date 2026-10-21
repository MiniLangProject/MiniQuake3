#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#define QM_ACTIVATED 3
#define PROP_HEIGHT 27
#define ID_LIST_BOTS 10
#define ID_LIST_CTF_ORDERS 11
#define ID_LIST_TEAM_ORDERS 12
#define GT_CTF 4
#define EXEC_APPEND 2
#define NUM_CTF_ORDERS 7
#define NUM_TEAM_ORDERS 6
typedef struct { int id, top, bottom; } menucommon_s;
typedef struct { menucommon_s generic; int numitems; const char **itemnames; int oldvalue, curvalue; } menulist_s;
typedef struct { menulist_s list; int gametype,numBots,selectedBot; char *bots[9]; char botNames[9][16]; } teamOrdersMenuInfo_t;
static teamOrdersMenuInfo_t teamOrdersMenuInfo;
static const char *ctfOrders[]={"I Am the Leader","Defend the Base","Follow Me","Get Enemy Flag","Camp Here","Report","I Relinquish Command",NULL};
static const char *ctfMessages[]={"i am the leader","%s defend the base","%s follow me","%s get enemy flag","%s camp here","%s report","i stop being the leader",NULL};
static const char *teamOrders[]={"I Am the Leader","Follow Me","Roam","Camp Here","Report","I Relinquish Command",NULL};
static const char *teamMessages[]={"i am the leader","%s follow me","%s roam","%s camp here","%s report","i stop being the leader",NULL};
static int pops;static char command[512];
static void UI_PopMenu(void){pops++;}
static int Com_sprintf(char *out,int size,const char *fmt,...){va_list ap;int n;va_start(ap,fmt);n=vsnprintf(out,size,fmt,ap);va_end(ap);return n;}
static const char *va(const char *fmt,const char *arg){static char out[512];snprintf(out,sizeof(out),fmt,arg);return out;}
static void trap_Cmd_ExecuteText(int when,const char *text){(void)when;strcpy(command,text);}
#include "ui_teamorders_under_test.inc"
static void reset(void){int i;memset(&teamOrdersMenuInfo,0,sizeof(teamOrdersMenuInfo));for(i=0;i<9;i++)teamOrdersMenuInfo.bots[i]=teamOrdersMenuInfo.botNames[i];strcpy(teamOrdersMenuInfo.botNames[0],"Everyone");strcpy(teamOrdersMenuInfo.botNames[1],"Sarge");teamOrdersMenuInfo.numBots=2;teamOrdersMenuInfo.list.generic.top=120;command[0]=0;pops=0;}
int main(void){reset();UI_TeamOrdersMenu_SetList(ID_LIST_BOTS);printf("bots %d %d %d\n",teamOrdersMenuInfo.list.generic.id,teamOrdersMenuInfo.list.numitems,teamOrdersMenuInfo.list.generic.bottom);teamOrdersMenuInfo.gametype=GT_CTF;teamOrdersMenuInfo.list.curvalue=1;UI_TeamOrdersMenu_ListEvent(&teamOrdersMenuInfo.list,QM_ACTIVATED);printf("select %d %d %d\n",teamOrdersMenuInfo.selectedBot,teamOrdersMenuInfo.list.generic.id,teamOrdersMenuInfo.list.numitems);teamOrdersMenuInfo.list.curvalue=2;UI_TeamOrdersMenu_ListEvent(&teamOrdersMenuInfo.list,QM_ACTIVATED);printf("ctf %s%d\n",command,pops);reset();teamOrdersMenuInfo.selectedBot=1;UI_TeamOrdersMenu_SetList(ID_LIST_TEAM_ORDERS);teamOrdersMenuInfo.list.curvalue=2;UI_TeamOrdersMenu_ListEvent(&teamOrdersMenuInfo.list,QM_ACTIVATED);printf("team %s%d\n",command,pops);reset();UI_TeamOrdersMenu_BackEvent(NULL,1);UI_TeamOrdersMenu_BackEvent(NULL,QM_ACTIVATED);printf("back %d\n",pops);return 0;}
