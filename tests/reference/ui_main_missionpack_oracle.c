#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <ctype.h>
#define qtrue 1
#define qfalse 0
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
typedef int qboolean;
typedef int uiMenuCommand_t;
static char event[64];
static int Com_sprintf(char *out,int size,const char *fmt,...){int result;va_list ap;va_start(ap,fmt);result=vsnprintf(out,(size_t)size,fmt,ap);va_end(ap);return result;}
static void _UI_Init(qboolean value){sprintf(event,"init:%d",value);}
static void _UI_Shutdown(void){strcpy(event,"shutdown");}
static void _UI_KeyEvent(int key,qboolean down){sprintf(event,"key:%d:%d",key,down);}
static void _UI_MouseEvent(int x,int y){sprintf(event,"mouse:%d:%d",x,y);}
static void _UI_Refresh(int time){sprintf(event,"refresh:%d",time);}
static qboolean _UI_IsFullscreen(void){strcpy(event,"full");return qfalse;}
static void _UI_SetActiveMenu(uiMenuCommand_t menu){sprintf(event,"menu:%d",menu);}
static qboolean UI_ConsoleCommand(int time){sprintf(event,"console:%d",time);return time==77;}
static void UI_DrawConnectScreen(qboolean overlay){sprintf(event,"connect:%d",overlay);}
#include "ui_main_missionpack_under_test.inc"
static void Size(int value){char text[64];UI_ReadableSize(text,sizeof(text),value);printf("size:%d=%s\n",value,text);}
static void Time(int value){char text[64];UI_PrintTime(text,sizeof(text),value);printf("time:%d=%s\n",value,text);}
static void Dispatch(int command,int a,int b){int value;event[0]=0;value=vmMain(command,a,b,0,0,0,0,0,0,0,0,0,0);printf("vm:%d=%d:%s\n",command,value,event);}
int main(void){char value[]="AlphaSARGEomega";char empty[]="";char *found;
 Size(1024);Size(1025);Size(1048576);Size(1048577);Size(1073741824);Size(1073741825);Size(1610612736);
 Time(60000);Time(61000);Time(3600000);Time(3601000);
 found=stristr(value,"sarge");printf("find:sarge=%d\n",found?(int)(found-value):-1);found=stristr(value,"missing");printf("find:missing=%d\n",found?(int)(found-value):-1);found=stristr(value,empty);printf("find:empty=%d\n",found?(int)(found-value):-1);
 Dispatch(UI_GETAPIVERSION,0,0);Dispatch(UI_INIT,1,0);Dispatch(UI_KEY_EVENT,13,1);Dispatch(UI_MOUSE_EVENT,-2,4);Dispatch(UI_REFRESH,99,0);Dispatch(UI_IS_FULLSCREEN,0,0);Dispatch(UI_SET_ACTIVE_MENU,4,0);Dispatch(UI_CONSOLE_COMMAND,77,0);Dispatch(UI_DRAW_CONNECT_SCREEN,1,0);Dispatch(UI_HASUNIQUECDKEY,0,0);Dispatch(99,0,0);return 0;}
