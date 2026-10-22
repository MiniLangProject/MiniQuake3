#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <math.h>

#define UI_TIMER_JUMP 1000
#define UI_TIMER_GESTURE 2300
#define UI_TIMER_ATTACK 500
#define ANIM_TOGGLEBIT 128
#define LEGS_JUMP 18
#define TORSO_GESTURE 6
#define TORSO_ATTACK 7
#define TORSO_ATTACK2 8
#define FS_READ 0
#define qtrue 1
#define qfalse 0
#define SPIN_SPEED 0.9
#define COAST_TIME 1000
typedef int qboolean;
typedef struct { int frameTime; } displayContextDef_t;
typedef struct { displayContextDef_t uiDC; } uiInfo_t;
typedef struct { int legsAnim,legsAnimationTimer,pendingLegsAnim,torsoAnim,torsoAnimationTimer,pendingTorsoAnim,barrelTime; float barrelAngle; int barrelSpinning; } playerInfo_t;
static uiInfo_t uiInfo;
static int dp_realtime;
static const char *available[8];
static int availableCount;
static float AngleSubtract(float a,float b){float v=a-b;while(v>180)v-=360;while(v<-180)v+=360;return v;}
static float AngleMod(float a){return (360.0f/65536)*( (int)(a*(65536/360.0f)) & 65535);}
static int trap_FS_FOpenFile(const char *path,void *handle,int mode){int i;(void)handle;(void)mode;for(i=0;i<availableCount;i++)if(!strcmp(path,available[i]))return 17;return -1;}
static void Com_sprintf(char *out,int size,const char *format,...){va_list ap;va_start(ap,format);vsnprintf(out,size,format,ap);va_end(ap);out[size-1]=0;}

#include "ui_players_missionpack_under_test.inc"

int main(void){playerInfo_t p={0};char path[256];
 UI_ForceLegsAnim(&p,LEGS_JUMP);printf("legs %d %d\n",p.legsAnim,p.legsAnimationTimer);p.pendingLegsAnim=22;UI_SetLegsAnim(&p,19);printf("legs_pending %d %d\n",p.legsAnim,p.pendingLegsAnim);
 UI_ForceTorsoAnim(&p,TORSO_GESTURE);printf("torso_gesture %d %d\n",p.torsoAnim,p.torsoAnimationTimer);UI_ForceTorsoAnim(&p,TORSO_ATTACK);printf("torso_attack %d %d\n",p.torsoAnim,p.torsoAnimationTimer);
 {float a=0;int s=0;uiInfo.uiDC.frameTime=16;UI_SwingAngles(90,25,90,.3f,&a,&s);printf("swing %d %d\n",(int)(a*1000),s);}
 p.barrelTime=0;p.barrelAngle=0;p.barrelSpinning=0;p.torsoAnim=TORSO_ATTACK;dp_realtime=100;{float a=UI_MachinegunSpinAngle(&p);printf("spin %d %d %d %d\n",(int)(a*1000),p.barrelSpinning,p.barrelTime,(int)(p.barrelAngle*1000));}
 available[0]="models/players/sarge/head_default.skin";availableCount=1;path[0]=0;printf("head_plain %d ",UI_FindClientHeadFile(path,sizeof(path),"","sarge","default","head","skin"));printf("%s\n",path);
 available[0]="models/players/heads/visor/head_blue.skin";availableCount=1;path[0]=0;printf("head_star %d ",UI_FindClientHeadFile(path,sizeof(path),"","*visor","blue","head","skin"));printf("%s\n",path);
 available[0]="models/players/sarge/default/redhead_default.skin";availableCount=1;path[0]=0;printf("head_team %d ",UI_FindClientHeadFile(path,sizeof(path),"red","sarge","default","head","skin"));printf("%s\n",path);
 availableCount=0;path[0]=0;printf("head_missing %d\n",UI_FindClientHeadFile(path,sizeof(path),"","sarge","default","head","skin"));return 0;}
