#include <stdio.h>
#include <math.h>
#define UI_TIMER_JUMP 1000
#define UI_TIMER_GESTURE 2300
#define UI_TIMER_ATTACK 500
#define ANIM_TOGGLEBIT 128
#define LEGS_JUMP 18
#define TORSO_GESTURE 6
#define TORSO_ATTACK 7
#define TORSO_ATTACK2 8
#define qtrue 1
#define qfalse 0
#define SPIN_SPEED 0.9
#define COAST_TIME 1000
typedef int qboolean;
typedef struct { int frametime; } uis_t;
typedef struct { int legsAnim,legsAnimationTimer,pendingLegsAnim,torsoAnim,torsoAnimationTimer,pendingTorsoAnim,barrelTime; float barrelAngle; int barrelSpinning; } playerInfo_t;
static uis_t uis; static int dp_realtime;
static float AngleSubtract(float a,float b){float v=a-b;while(v>180)v-=360;while(v<-180)v+=360;return v;}
static float AngleMod(float a){return (360.0f/65536)*( (int)(a*(65536/360.0f)) & 65535);}
#include "ui_players_under_test.inc"
int main(void){playerInfo_t p={0};
 UI_ForceLegsAnim(&p,LEGS_JUMP);printf("legs %d %d\n",p.legsAnim,p.legsAnimationTimer);p.pendingLegsAnim=22;UI_SetLegsAnim(&p,19);printf("legs_pending %d %d\n",p.legsAnim,p.pendingLegsAnim);
 UI_ForceTorsoAnim(&p,TORSO_GESTURE);printf("torso_gesture %d %d\n",p.torsoAnim,p.torsoAnimationTimer);UI_ForceTorsoAnim(&p,TORSO_ATTACK);printf("torso_attack %d %d\n",p.torsoAnim,p.torsoAnimationTimer);
 {float a=0;int s=0;uis.frametime=16;UI_SwingAngles(90,25,90,.3f,&a,&s);printf("swing %d %d\n",(int)(a*1000),s);}
 p.barrelTime=0;p.barrelAngle=0;p.barrelSpinning=0;p.torsoAnim=TORSO_ATTACK;dp_realtime=100;{float a=UI_MachinegunSpinAngle(&p);printf("spin %d %d %d %d\n",(int)(a*1000),p.barrelSpinning,p.barrelTime,(int)(p.barrelAngle*1000));}
 p.torsoAnim=11;dp_realtime=200;{float a=UI_MachinegunSpinAngle(&p);printf("coast %d %d %d %d\n",(int)(a*1000),p.barrelSpinning,p.barrelTime,(int)(p.barrelAngle*1000));}return 0;}
