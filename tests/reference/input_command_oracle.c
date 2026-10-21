/* Host for unchanged client/cl_input.c command-building functions. */
#include <math.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define BUTTON_TALK 2
#define BUTTON_WALKING 16
#define BUTTON_ANY 2048
#define PITCH 0
#define YAW 1
#define AXIS_SIDE 0
#define AXIS_FORWARD 1
#define AXIS_UP 2
#define MAX_JOYSTICK_AXIS 16
typedef struct { int down[2]; unsigned downtime,msec; qboolean active,wasPressed; } kbutton_t;
typedef struct { int serverTime,angles[3],buttons; unsigned char weapon; signed char forwardmove,rightmove,upmove; } usercmd_t;
typedef struct { int integer; float value; } cvar_t;
typedef struct { int frametime,keyCatchers; } clientStatic_t;
typedef struct { float viewangles[3]; int mouseDx[2],mouseDy[2],mouseIndex,joystickAxis[MAX_JOYSTICK_AXIS]; float cgameSensitivity; } clientActive_t;
unsigned frame_msec; int com_frameTime; clientStatic_t cls; clientActive_t cl;
kbutton_t in_left,in_right,in_forward,in_back,in_lookup,in_lookdown,in_moveleft,in_moveright,in_strafe,in_speed,in_up,in_down,in_buttons[16];qboolean in_mlooking;
static cvar_t cv_upspeed={0,127},cv_forwardspeed={0,127},cv_sidespeed={0,127},cv_yawspeed={0,140},cv_pitchspeed={0,140},cv_run={1,1},cv_anglespeedkey={0,1.5f};
static cvar_t cv_filter={0,0},cv_sensitivity={0,5},cv_accel={0,0},cv_show={0,0},cv_side={0,.25f},cv_yaw={0,.022f},cv_pitch={0,.022f},cv_forward={0,.25f},cv_freelook={1,1};
cvar_t *cl_upspeed=&cv_upspeed,*cl_forwardspeed=&cv_forwardspeed,*cl_sidespeed=&cv_sidespeed,*cl_yawspeed=&cv_yawspeed,*cl_pitchspeed=&cv_pitchspeed,*cl_run=&cv_run,*cl_anglespeedkey=&cv_anglespeedkey;
cvar_t *m_filter=&cv_filter,*cl_sensitivity=&cv_sensitivity,*cl_mouseAccel=&cv_accel,*cl_showMouseRate=&cv_show,*m_side=&cv_side,*m_yaw=&cv_yaw,*m_pitch=&cv_pitch,*m_forward=&cv_forward,*cl_freelook=&cv_freelook;
static signed char ClampChar(int value){if(value< -128)return -128;if(value>127)return 127;return (signed char)value;}
static void Com_Printf(const char *format,...){(void)format;}
#include "input_command_under_test.inc"
static uint32_t bits(float value){union{float f;uint32_t u;}x;x.f=value;return x.u;}
static void reset(void){memset(&cl,0,sizeof(cl));memset(&cls,0,sizeof(cls));memset(&in_left,0,sizeof(in_left));memset(&in_right,0,sizeof(in_right));memset(&in_forward,0,sizeof(in_forward));memset(&in_back,0,sizeof(in_back));memset(&in_lookup,0,sizeof(in_lookup));memset(&in_lookdown,0,sizeof(in_lookdown));memset(&in_moveleft,0,sizeof(in_moveleft));memset(&in_moveright,0,sizeof(in_moveright));memset(&in_strafe,0,sizeof(in_strafe));memset(&in_speed,0,sizeof(in_speed));memset(&in_up,0,sizeof(in_up));memset(&in_down,0,sizeof(in_down));memset(in_buttons,0,sizeof(in_buttons));frame_msec=50;com_frameTime=150;cls.frametime=50;cl.cgameSensitivity=1;cv_run.integer=1;cv_filter.integer=0;cv_sensitivity.value=5;cv_accel.value=0;in_mlooking=qfalse;}
int main(void){usercmd_t cmd;float value;
 reset();in_forward.active=qtrue;in_forward.downtime=125;value=CL_KeyState(&in_forward);printf("key|%08x|%u|%u\n",bits(value),in_forward.downtime,in_forward.msec);
 reset();memset(&cmd,0,sizeof(cmd));cv_run.integer=0;in_forward.active=in_moveright.active=in_up.active=qtrue;in_forward.downtime=in_moveright.downtime=in_up.downtime=100;CL_KeyMove(&cmd);printf("move|%d|%d|%d|%d\n",cmd.forwardmove,cmd.rightmove,cmd.upmove,cmd.buttons);
 reset();memset(&cmd,0,sizeof(cmd));cv_sensitivity.value=2;cl.cgameSensitivity=.5f;cl.mouseDx[0]=10;cl.mouseDy[0]=-5;CL_MouseMove(&cmd);printf("mouse|%08x|%08x|%d|%d|%d\n",bits(cl.viewangles[YAW]),bits(cl.viewangles[PITCH]),cl.mouseIndex,cl.mouseDx[1],cl.mouseDy[1]);
 reset();memset(&cmd,0,sizeof(cmd));in_strafe.active=qtrue;cl.mouseDx[0]=40;CL_MouseMove(&cmd);printf("strafe|%d|%08x\n",cmd.rightmove,bits(cl.viewangles[YAW]));
 reset();memset(&cmd,0,sizeof(cmd));cl.joystickAxis[AXIS_SIDE]=10;cl.joystickAxis[AXIS_FORWARD]=-20;cl.joystickAxis[AXIS_UP]=30;CL_JoystickMove(&cmd);printf("joy|%08x|%d|%d|%d\n",bits(cl.viewangles[YAW]),cmd.forwardmove,cmd.upmove,cmd.buttons);
 return 0;}
