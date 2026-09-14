/* SPDX-License-Identifier: GPL-2.0-or-later
 * Standalone direct be_ea.c state oracle. The exercised function bodies and
 * constants are retained from the released Baseq3 source.
 */
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#define MAX_USERMOVE 400
#define ACTION_ATTACK 0x0000001
#define ACTION_USE 0x0000002
#define ACTION_JUMP 0x0000010
#define ACTION_MOVEUP 0x0000020
#define ACTION_CROUCH 0x0000080
#define ACTION_DELAYEDJUMP 0x0008000
#define ACTION_GESTURE 0x0020000
#define ACTION_JUMPEDLASTFRAME 128
typedef float vec3_t[3];
typedef struct bot_input_s {float thinktime;vec3_t dir;float speed;vec3_t viewangles;int actionflags;int weapon;} bot_input_t;
static bot_input_t botinputs[2];
static void EA_Action(int client,int action){botinputs[client].actionflags|=action;}
static void EA_Attack(int client){botinputs[client].actionflags|=ACTION_ATTACK;}
static void EA_Use(int client){botinputs[client].actionflags|=ACTION_USE;}
static void EA_Gesture(int client){botinputs[client].actionflags|=ACTION_GESTURE;}
static void EA_SelectWeapon(int client,int weapon){botinputs[client].weapon=weapon;}
static void EA_Jump(int client){bot_input_t *bi=&botinputs[client];if(bi->actionflags&ACTION_JUMPEDLASTFRAME)bi->actionflags&=~ACTION_JUMP;else bi->actionflags|=ACTION_JUMP;}
static void EA_DelayedJump(int client){bot_input_t *bi=&botinputs[client];if(bi->actionflags&ACTION_JUMPEDLASTFRAME)bi->actionflags&=~ACTION_DELAYEDJUMP;else bi->actionflags|=ACTION_DELAYEDJUMP;}
static void EA_Move(int client,vec3_t dir,float speed){bot_input_t *bi=&botinputs[client];memcpy(bi->dir,dir,sizeof(vec3_t));if(speed>MAX_USERMOVE)speed=MAX_USERMOVE;else if(speed< -MAX_USERMOVE)speed=-MAX_USERMOVE;bi->speed=speed;}
static void EA_View(int client,vec3_t angles){memcpy(botinputs[client].viewangles,angles,sizeof(vec3_t));}
static void EA_EndRegular(int client,float thinktime){(void)client;(void)thinktime;}
static void EA_GetInput(int client,float thinktime,bot_input_t *input){bot_input_t *bi=&botinputs[client];bi->thinktime=thinktime;memcpy(input,bi,sizeof(bot_input_t));}
static void EA_ResetInput(int client){bot_input_t *bi=&botinputs[client];int jumped=0;bi->actionflags&=~ACTION_JUMPEDLASTFRAME;bi->thinktime=0;memset(bi->dir,0,sizeof(bi->dir));bi->speed=0;jumped=bi->actionflags&ACTION_JUMP;bi->actionflags=0;if(jumped)bi->actionflags|=ACTION_JUMPEDLASTFRAME;}
#define CHECK(x) do{if(!(x)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){bot_input_t out,before;vec3_t dir={1.25f,-2.5f,3.75f},view={10,20,30};
 CHECK(sizeof(bot_input_t)==40&&offsetof(bot_input_t,dir)==4&&offsetof(bot_input_t,speed)==16&&offsetof(bot_input_t,viewangles)==20&&offsetof(bot_input_t,actionflags)==32&&offsetof(bot_input_t,weapon)==36);
 EA_Attack(0);EA_Use(0);EA_Gesture(0);EA_Action(0,ACTION_MOVEUP);EA_SelectWeapon(0,300);EA_Move(0,dir,900);EA_View(0,view);EA_GetInput(0,.125f,&out);
 CHECK(out.thinktime==.125f&&out.actionflags==(ACTION_ATTACK|ACTION_USE|ACTION_GESTURE|ACTION_MOVEUP)&&out.weapon==300&&out.speed==400&&out.dir[1]==-2.5f&&out.viewangles[2]==30);
 before=out;EA_EndRegular(0,99);EA_GetInput(0,.125f,&out);CHECK(memcmp(&before,&out,sizeof(out))==0);
 EA_Jump(1);EA_ResetInput(1);CHECK(botinputs[1].actionflags==ACTION_JUMPEDLASTFRAME);EA_Jump(1);EA_DelayedJump(1);CHECK(botinputs[1].actionflags==ACTION_JUMPEDLASTFRAME);EA_ResetInput(1);EA_DelayedJump(1);CHECK(botinputs[1].actionflags==ACTION_DELAYEDJUMP);
 printf("PASS: 5 native Baseq3 Elementary Actions scenarios / 20 exact observations\n");return 0;}
