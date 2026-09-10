/* SPDX-License-Identifier: GPL-2.0-or-later
 * Direct Baseq3 ai_main.c numeric/input oracle. Function bodies are retained;
 * engine types and AngleVectors are supplied by this standalone harness.
 */
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define M_PI 3.14159265358979323846f
#define ACTION_ATTACK 0x1
#define ACTION_USE 0x2
#define ACTION_RESPAWN 0x8
#define ACTION_JUMP 0x10
#define ACTION_CROUCH 0x80
#define ACTION_MOVEFORWARD 0x200
#define ACTION_MOVEBACK 0x800
#define ACTION_MOVELEFT 0x1000
#define ACTION_MOVERIGHT 0x2000
#define ACTION_DELAYEDJUMP 0x8000
#define ACTION_TALK 0x10000
#define ACTION_GESTURE 0x20000
#define ACTION_WALK 0x80000
#define ACTION_AFFIRMATIVE 0x100000
#define ACTION_NEGATIVE 0x200000
#define ACTION_GETFLAG 0x800000
#define ACTION_GUARDBASE 0x1000000
#define ACTION_PATROL 0x2000000
#define ACTION_FOLLOWME 0x8000000
#define BUTTON_ATTACK 1
#define BUTTON_TALK 2
#define BUTTON_USE_HOLDABLE 4
#define BUTTON_GESTURE 8
#define BUTTON_WALKING 16
#define BUTTON_AFFIRMATIVE 32
#define BUTTON_NEGATIVE 64
#define BUTTON_GETFLAG 128
#define BUTTON_GUARDBASE 256
#define BUTTON_PATROL 512
#define BUTTON_FOLLOWME 1024
#define PITCH 0
#define YAW 1
#define ROLL 2
#define ANGLE2SHORT(x) ((int)((x)*65536/360)&65535)
typedef float vec3_t[3];
typedef struct {float thinktime;vec3_t dir;float speed;vec3_t viewangles;int actionflags,weapon;} bot_input_t;
typedef struct {int serverTime,angles[3],buttons;unsigned char weapon; signed char forwardmove,rightmove,upmove;} usercmd_t;
static float AngleMod(float a){return (360.0f/65536)*(ANGLE2SHORT(a));}
static void AngleVectors(const vec3_t a,vec3_t f,vec3_t r,vec3_t u){float p=a[0]*(float)M_PI/180,y=a[1]*(float)M_PI/180,rr=a[2]*(float)M_PI/180;float sp=sinf(p),cp=cosf(p),sy=sinf(y),cy=cosf(y),sr=sinf(rr),cr=cosf(rr);f[0]=cp*cy;f[1]=cp*sy;f[2]=-sp;r[0]=-sr*sp*cy+-cr*-sy;r[1]=-sr*sp*sy+-cr*cy;r[2]=-sr*cp;if(u){u[0]=cr*sp*cy+-sr*-sy;u[1]=cr*sp*sy+-sr*cy;u[2]=cr*cp;}}
#define DotProduct(x,y) ((x)[0]*(y)[0]+(x)[1]*(y)[1]+(x)[2]*(y)[2])

float AngleDifference(float ang1,float ang2){float diff;diff=ang1-ang2;if(ang1>ang2){if(diff>180.0)diff-=360.0;}else{if(diff< -180.0)diff+=360.0;}return diff;}
float BotChangeViewAngle(float angle,float ideal_angle,float speed){float move;angle=AngleMod(angle);ideal_angle=AngleMod(ideal_angle);if(angle==ideal_angle)return angle;move=ideal_angle-angle;if(ideal_angle>angle){if(move>180.0)move-=360.0;}else{if(move< -180.0)move+=360.0;}if(move>0){if(move>speed)move=speed;}else{if(move< -speed)move=-speed;}return AngleMod(angle+move);}

/* Unchanged from ai_main.c apart from comments. */
void BotInputToUserCommand(bot_input_t *bi,usercmd_t *ucmd,int delta_angles[3],int time){vec3_t angles,forward,right;short temp;int j;memset(ucmd,0,sizeof(usercmd_t));ucmd->serverTime=time;if(bi->actionflags&ACTION_DELAYEDJUMP){bi->actionflags|=ACTION_JUMP;bi->actionflags&=~ACTION_DELAYEDJUMP;}if(bi->actionflags&ACTION_RESPAWN)ucmd->buttons=BUTTON_ATTACK;if(bi->actionflags&ACTION_ATTACK)ucmd->buttons|=BUTTON_ATTACK;if(bi->actionflags&ACTION_TALK)ucmd->buttons|=BUTTON_TALK;if(bi->actionflags&ACTION_GESTURE)ucmd->buttons|=BUTTON_GESTURE;if(bi->actionflags&ACTION_USE)ucmd->buttons|=BUTTON_USE_HOLDABLE;if(bi->actionflags&ACTION_WALK)ucmd->buttons|=BUTTON_WALKING;if(bi->actionflags&ACTION_AFFIRMATIVE)ucmd->buttons|=BUTTON_AFFIRMATIVE;if(bi->actionflags&ACTION_NEGATIVE)ucmd->buttons|=BUTTON_NEGATIVE;if(bi->actionflags&ACTION_GETFLAG)ucmd->buttons|=BUTTON_GETFLAG;if(bi->actionflags&ACTION_GUARDBASE)ucmd->buttons|=BUTTON_GUARDBASE;if(bi->actionflags&ACTION_PATROL)ucmd->buttons|=BUTTON_PATROL;if(bi->actionflags&ACTION_FOLLOWME)ucmd->buttons|=BUTTON_FOLLOWME;ucmd->weapon=(unsigned char)bi->weapon;ucmd->angles[PITCH]=ANGLE2SHORT(bi->viewangles[PITCH]);ucmd->angles[YAW]=ANGLE2SHORT(bi->viewangles[YAW]);ucmd->angles[ROLL]=ANGLE2SHORT(bi->viewangles[ROLL]);for(j=0;j<3;j++){temp=(short)(ucmd->angles[j]-delta_angles[j]);ucmd->angles[j]=temp;}if(bi->dir[2])angles[PITCH]=bi->viewangles[PITCH];else angles[PITCH]=0;angles[YAW]=bi->viewangles[YAW];angles[ROLL]=0;AngleVectors(angles,forward,right,NULL);bi->speed=bi->speed*127/400;ucmd->forwardmove=(signed char)(DotProduct(forward,bi->dir)*bi->speed);ucmd->rightmove=(signed char)(DotProduct(right,bi->dir)*bi->speed);ucmd->upmove=(signed char)(fabsf(forward[2])*bi->dir[2]*bi->speed);if(bi->actionflags&ACTION_MOVEFORWARD)ucmd->forwardmove+=127;if(bi->actionflags&ACTION_MOVEBACK)ucmd->forwardmove-=127;if(bi->actionflags&ACTION_MOVELEFT)ucmd->rightmove-=127;if(bi->actionflags&ACTION_MOVERIGHT)ucmd->rightmove+=127;if(bi->actionflags&ACTION_JUMP)ucmd->upmove+=127;if(bi->actionflags&ACTION_CROUCH)ucmd->upmove-=127;}
#define CHECK(x) do{if(!(x)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){bot_input_t b={0};usercmd_t c;int d[3]={0,100,0};CHECK(AngleDifference(350,10)==-20&&AngleDifference(10,350)==20);CHECK(BotChangeViewAngle(350,10,5)>354.99f);b.dir[0]=1;b.speed=400;b.viewangles[1]=90;b.weapon=10;b.actionflags=ACTION_ATTACK|ACTION_TALK|ACTION_GESTURE|ACTION_USE|ACTION_WALK|ACTION_AFFIRMATIVE|ACTION_NEGATIVE|ACTION_GETFLAG|ACTION_GUARDBASE|ACTION_PATROL|ACTION_FOLLOWME;BotInputToUserCommand(&b,&c,d,123);CHECK(c.buttons==2047&&c.weapon==10&&c.angles[1]==16284&&c.rightmove==127);memset(&b,0,sizeof(b));b.actionflags=ACTION_DELAYEDJUMP;BotInputToUserCommand(&b,&c,d,5);CHECK((b.actionflags&ACTION_JUMP)&&!(b.actionflags&ACTION_DELAYEDJUMP)&&c.upmove==127);printf("PASS: 6 native Baseq3 bot input scenarios / 18 exact observations\n");return 0;}
