#include <stdio.h>
#include <string.h>
#define QM_ACTIVATED 3
#define ID_SIGNUP 108
#define ID_CANCEL 109
typedef struct {int id;} menucommon_s;typedef struct {char buffer[256];} field_t;typedef struct {field_t field;} menufield_s;typedef struct {menufield_s name_box,password_box,again_box,email_box;} signup_t;static signup_t s_signup;static int calls,off,pops;static char values[3][256];
static void trap_CL_UI_RankUserCreate(const char*a,const char*b,const char*c){calls++;strcpy(values[0],a);strcpy(values[1],b);strcpy(values[2],c);}static void UI_ForceMenuOff(void){off++;}static void UI_PopMenu(void){pops++;}
#include "ui_signup_under_test.inc"
static void reset(void){memset(&s_signup,0,sizeof(s_signup));calls=off=pops=0;strcpy(s_signup.name_box.field.buffer,"Hero");strcpy(s_signup.password_box.field.buffer,"one");strcpy(s_signup.again_box.field.buffer,"two");strcpy(s_signup.email_box.field.buffer,"h@example.org");}
int main(void){menucommon_s i={ID_SIGNUP};reset();Signup_MenuEvent(&i,QM_ACTIVATED);printf("mismatch %d %d\n",calls,off);strcpy(s_signup.again_box.field.buffer,"one");Signup_MenuEvent(&i,QM_ACTIVATED);printf("signup %d %d %s %s %s\n",calls,off,values[0],values[1],values[2]);reset();i.id=ID_CANCEL;Signup_MenuEvent(&i,QM_ACTIVATED);printf("cancel %d\n",pops);return 0;}
