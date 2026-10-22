#include <stdio.h>
#define QM_ACTIVATED 3
#define ID_LOGIN 100
#define ID_LOGOUT 101
#define ID_CREATE 102
#define ID_SPECTATE 103
#define ID_SETUP 104
#define ID_LEAVE 105
#define EXEC_APPEND 2
typedef struct {int id;} menucommon_s;
static int login,logout,signup,setup,forced;static char cmd[64];
static void UI_LoginMenu(void){login++;}static void trap_CL_UI_RankUserRequestLogout(void){logout++;}static void UI_ForceMenuOff(void){forced++;}static void UI_SignupMenu(void){signup++;}static void UI_SetupMenu(void){setup++;}static void trap_Cmd_ExecuteText(int when,const char*text){(void)when;snprintf(cmd,sizeof(cmd),"%s",text);}
#include "ui_rankings_under_test.inc"
static void run(int id,int event){menucommon_s i={id};login=logout=signup=setup=forced=0;cmd[0]=0;Rankings_MenuEvent(&i,event);printf("%d %d %d %d %d %d %s\n",id,login,logout,signup,setup,forced,cmd);}
int main(void){run(ID_LOGIN,1);run(ID_LOGIN,QM_ACTIVATED);run(ID_LOGOUT,QM_ACTIVATED);run(ID_CREATE,QM_ACTIVATED);run(ID_SPECTATE,QM_ACTIVATED);run(ID_SETUP,QM_ACTIVATED);run(ID_LEAVE,QM_ACTIVATED);return 0;}
