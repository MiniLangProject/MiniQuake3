/* Host for unchanged functions extracted from code/client/cl_input.c. */
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define BUTTON_TALK 2
#define BUTTON_ANY 2048
#define KEYCATCH_UI 2
#define KEYCATCH_CGAME 8
#define UI_MOUSE_EVENT 8
#define CG_MOUSE_EVENT 7
#define ERR_DROP 1
#define MAX_JOYSTICK_AXIS 16
#define PITCH 0
#define YAW 1
#define ANGLE2SHORT(x) ((int)((x)*65536/360)&65535)
typedef struct { int down[2]; unsigned downtime,msec; qboolean active,wasPressed; } kbutton_t;
typedef struct { int serverTime,angles[3],buttons; unsigned char weapon; signed char forwardmove,rightmove,upmove; } usercmd_t;
typedef struct { int frametime,keyCatchers; } clientStatic_t;
typedef struct { float viewangles[3]; int mouseDx[2],mouseDy[2],mouseIndex,joystickAxis[MAX_JOYSTICK_AXIS]; float cgameSensitivity; int cgameUserCmdValue,serverTime; } clientActive_t;
unsigned frame_msec; int com_frameTime,anykeydown; clientStatic_t cls; clientActive_t cl;
kbutton_t in_left,in_right,in_forward,in_back,in_lookup,in_lookdown,in_moveleft,in_moveright,in_strafe,in_speed,in_up,in_down,in_buttons[16];qboolean in_mlooking;
static const char *av[3]={"","",""};static int uiCalls,cgameCalls,lastX,lastY;static int uiTag,cgameTag;void *uivm=&uiTag,*cgvm=&cgameTag;
static char *Cmd_Argv(int index){return (char *)av[index];}
static void Com_Printf(const char *format,...){(void)format;}
static void Com_Error(int code,const char *format,...){(void)code;(void)format;}
static int VM_Call(void *vm,int call,int x,int y){(void)call;lastX=x;lastY=y;if(vm==uivm)uiCalls++;if(vm==cgvm)cgameCalls++;return 0;}
#include "cl_input_complete_under_test.inc"
static void args(const char *key,const char *time){av[1]=key;av[2]=time;}
static void reset(void){memset(&cl,0,sizeof(cl));memset(&cls,0,sizeof(cls));memset(in_buttons,0,sizeof(in_buttons));frame_msec=50;com_frameTime=150;anykeydown=0;uiCalls=cgameCalls=lastX=lastY=0;}
int main(void){usercmd_t cmd;float fraction;
 reset();args("7","100");IN_KeyDown(&in_forward);args("8","110");IN_KeyDown(&in_forward);args("7","125");IN_KeyUp(&in_forward);args("8","140");IN_KeyUp(&in_forward);fraction=CL_KeyState(&in_forward);printf("dual|%d|%d|%d|%u\n",(int)(fraction*10),in_forward.down[0],in_forward.down[1],in_forward.msec);
 reset();args("","0");IN_KeyDown(&in_back);IN_KeyUp(&in_back);printf("manual|%d|%d|%d\n",in_back.down[0],in_back.down[1],in_back.active);
 reset();memset(&cmd,0,sizeof(cmd));in_buttons[0].wasPressed=qtrue;in_buttons[3].active=qtrue;cls.keyCatchers=KEYCATCH_UI;anykeydown=1;CL_CmdButtons(&cmd);printf("buttons|%d|%d|%d\n",cmd.buttons,in_buttons[0].wasPressed,in_buttons[3].wasPressed);
 reset();CL_MouseEvent(3,-4,12);cls.keyCatchers=KEYCATCH_UI;CL_MouseEvent(5,6,13);cls.keyCatchers=KEYCATCH_CGAME;CL_MouseEvent(-7,8,14);printf("mouse|%d|%d|%d|%d|%d|%d\n",cl.mouseDx[0],cl.mouseDy[0],uiCalls,cgameCalls,lastX,lastY);
 reset();CL_JoystickEvent(3,-42,10);printf("joy|%d\n",cl.joystickAxis[3]);
 reset();memset(&cmd,0,sizeof(cmd));cl.cgameUserCmdValue=261;cl.serverTime=123456;cl.viewangles[0]=90;cl.viewangles[1]=-45;cl.viewangles[2]=720;CL_FinishMove(&cmd);printf("finish|%u|%d|%d|%d|%d\n",cmd.weapon,cmd.serverTime,(short)cmd.angles[0],(short)cmd.angles[1],(short)cmd.angles[2]);
 return 0;}
