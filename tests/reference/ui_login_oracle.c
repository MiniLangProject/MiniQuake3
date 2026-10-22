#include <stdio.h>
#include <string.h>
#define QM_ACTIVATED 3
#define ID_LOGIN 104
#define ID_CANCEL 105
typedef struct {int id;} menucommon_s;typedef struct {char buffer[256];} field_t;typedef struct {field_t field;} menufield_s;typedef struct {menufield_s name_box,password_box;} login_t;static login_t s_login;static int calls,off,pops;static char user[256],pass[256];
static void trap_CL_UI_RankUserLogin(const char*u,const char*p){calls++;strcpy(user,u);strcpy(pass,p);}static void UI_ForceMenuOff(void){off++;}static void UI_PopMenu(void){pops++;}
#include "ui_login_under_test.inc"
static void reset(void){memset(&s_login,0,sizeof(s_login));calls=off=pops=0;strcpy(s_login.name_box.field.buffer,"Player");strcpy(s_login.password_box.field.buffer,"Secret");}
int main(void){menucommon_s i={ID_LOGIN};reset();Login_MenuEvent(&i,1);printf("ignore %d %d %d\n",calls,off,pops);Login_MenuEvent(&i,QM_ACTIVATED);printf("login %d %d %s %s\n",calls,off,user,pass);reset();i.id=ID_CANCEL;Login_MenuEvent(&i,QM_ACTIVATED);printf("cancel %d\n",pops);return 0;}
