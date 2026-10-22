#include <stdio.h>
#define UI_GETAPIVERSION 0
#define UI_INIT 1
#define UI_SHUTDOWN 2
#define UI_KEY_EVENT 3
#define UI_MOUSE_EVENT 4
#define UI_REFRESH 5
#define UI_IS_FULLSCREEN 6
#define UI_SET_ACTIVE_MENU 7
#define UI_CONSOLE_COMMAND 8
#define UI_DRAW_CONNECT_SCREEN 9
#define UI_HASUNIQUECDKEY 10
#define UI_API_VERSION 6
#define qtrue 1
static int called=-1,a0=-1,a1=-1;
static void UI_Init(void){called=UI_INIT;}
static void UI_Shutdown(void){called=UI_SHUTDOWN;}
static void UI_KeyEvent(int a,int b){called=UI_KEY_EVENT;a0=a;a1=b;}
static void UI_MouseEvent(int a,int b){called=UI_MOUSE_EVENT;a0=a;a1=b;}
static void UI_Refresh(int a){called=UI_REFRESH;a0=a;}
static int UI_IsFullscreen(void){called=UI_IS_FULLSCREEN;return 7;}
static void UI_SetActiveMenu(int a){called=UI_SET_ACTIVE_MENU;a0=a;}
static int UI_ConsoleCommand(int a){called=UI_CONSOLE_COMMAND;a0=a;return 42;}
static void UI_DrawConnectScreen(int a){called=UI_DRAW_CONNECT_SCREEN;a0=a;}
#include "ui_main_under_test.inc"
int main(void){for(int command=0;command<=11;command++){called=-1;a0=-1;a1=-1;int value=vmMain(command,100+command,200+command,0,0,0,0,0,0,0,0,0,0);printf("%d|%d|%d|%d|%d\n",command,value,called,a0,a1);}return 0;}
