/* SPDX-License-Identifier: GPL-2.0-or-later
 * Direct ai_dmq3.c BotAttackMove oracle with deterministic botlib stubs.
 */
#include <stdio.h>
#include <string.h>
#include <math.h>
#define CHARACTERISTIC_ATTACK_SKILL 5
#define CHARACTERISTIC_JUMPER 21
#define CHARACTERISTIC_CROUCHER 22
#define WP_GAUNTLET 1
#define IDEAL_ATTACKDIST 140
#define MOVE_WALK 1
#define MOVE_CROUCH 2
#define MOVE_JUMP 8
#define BFL_STRAFERIGHT 8
typedef float vec3_t[3];
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorSet(v,a,b,c) do{(v)[0]=a;(v)[1]=b;(v)[2]=c;}while(0)
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
#define VectorNegate(a,b) do{(b)[0]=-(a)[0];(b)[1]=-(a)[1];(b)[2]=-(a)[2];}while(0)
#define VectorAdd(a,b,c) do{(c)[0]=(a)[0]+(b)[0];(c)[1]=(a)[1]+(b)[1];(c)[2]=(a)[2]+(b)[2];}while(0)
#define CrossProduct(a,b,c) do{(c)[0]=(a)[1]*(b)[2]-(a)[2]*(b)[1];(c)[1]=(a)[2]*(b)[0]-(a)[0]*(b)[2];(c)[2]=(a)[0]*(b)[1]-(a)[1]*(b)[0];}while(0)
static float VectorNormalize(vec3_t v){float n=sqrtf(v[0]*v[0]+v[1]*v[1]+v[2]*v[2]);if(n){v[0]/=n;v[1]/=n;v[2]/=n;}return n;}
typedef struct {int number;vec3_t origin;} aas_entityinfo_t;
typedef struct {int entitynum,areanum;vec3_t origin,mins,maxs;} bot_goal_t;
typedef struct {int failure,flags,weapon;vec3_t movedir,ideal_viewangles;} bot_moveresult_t;
typedef struct {int weapon;} playerState_t;
typedef struct {int enemy,lastenemyareanum,ms,character,flags;float attackchase_time,attackcrouch_time,attackjump_time,attackstrafe_time,thinktime;vec3_t lastenemyorigin,origin;playerState_t cur_ps;} bot_state_t;
static float now,characteristics[64],randoms[32];static int randomindex,setupcalls,movecalls,goalcalls,moveanswers[4],lastmovetype;static vec3_t lastdir;static bot_goal_t lastgoal;static aas_entityinfo_t enemyinfo;
static float FloatTime(void){return now;}static float trap_Characteristic_BFloat(int c,int i,float lo,float hi){(void)c;(void)lo;(void)hi;return characteristics[i];}static float random_stub(void){return randoms[randomindex++];}static float crandom_stub(void){return 2*random_stub()-1;}
#define random random_stub
#define crandom crandom_stub
static void BotSetupForMovement(bot_state_t*b){(void)b;setupcalls++;}static void BotEntityInfo(int n,aas_entityinfo_t*e){(void)n;*e=enemyinfo;}
static void trap_BotMoveToGoal(bot_moveresult_t*r,int ms,bot_goal_t*g,int tfl){(void)ms;(void)tfl;goalcalls++;lastgoal=*g;r->failure=1;}
static int trap_BotMoveInDirection(int ms,vec3_t d,float speed,int mt){(void)ms;(void)speed;VectorCopy(d,lastdir);lastmovetype=mt;return moveanswers[movecalls++];}

/* Unchanged from code/game/ai_dmq3.c. */
bot_moveresult_t BotAttackMove(bot_state_t *bs, int tfl) {
	int movetype, i, attackentity; float attack_skill, jumper, croucher, dist, strafechange_time; float attack_dist, attack_range; vec3_t forward, backward, sideward, hordir, up = {0, 0, 1}; aas_entityinfo_t entinfo; bot_moveresult_t moveresult; bot_goal_t goal;
	attackentity = bs->enemy;
	if (bs->attackchase_time > FloatTime()) {goal.entitynum=attackentity;goal.areanum=bs->lastenemyareanum;VectorCopy(bs->lastenemyorigin,goal.origin);VectorSet(goal.mins,-8,-8,-8);VectorSet(goal.maxs,8,8,8);BotSetupForMovement(bs);trap_BotMoveToGoal(&moveresult,bs->ms,&goal,tfl);return moveresult;}
	memset(&moveresult,0,sizeof(bot_moveresult_t));attack_skill=trap_Characteristic_BFloat(bs->character,CHARACTERISTIC_ATTACK_SKILL,0,1);jumper=trap_Characteristic_BFloat(bs->character,CHARACTERISTIC_JUMPER,0,1);croucher=trap_Characteristic_BFloat(bs->character,CHARACTERISTIC_CROUCHER,0,1);if(attack_skill<0.2)return moveresult;BotSetupForMovement(bs);BotEntityInfo(attackentity,&entinfo);VectorSubtract(entinfo.origin,bs->origin,forward);dist=VectorNormalize(forward);VectorNegate(forward,backward);movetype=MOVE_WALK;
	if(bs->attackcrouch_time<FloatTime()-1){if(random()<jumper)movetype=MOVE_JUMP;else if(bs->attackcrouch_time<FloatTime()-1&&random()<croucher)bs->attackcrouch_time=FloatTime()+croucher*5;}if(bs->attackcrouch_time>FloatTime())movetype=MOVE_CROUCH;if(movetype==MOVE_JUMP){if(bs->attackjump_time>FloatTime())movetype=MOVE_WALK;else bs->attackjump_time=FloatTime()+1;}
	if(bs->cur_ps.weapon==WP_GAUNTLET){attack_dist=0;attack_range=0;}else{attack_dist=IDEAL_ATTACKDIST;attack_range=40;}if(attack_skill<=0.4){if(dist>attack_dist+attack_range){if(trap_BotMoveInDirection(bs->ms,forward,400,movetype))return moveresult;}if(dist<attack_dist-attack_range){if(trap_BotMoveInDirection(bs->ms,backward,400,movetype))return moveresult;}return moveresult;}
	bs->attackstrafe_time+=bs->thinktime;strafechange_time=0.4+(1-attack_skill)*0.2;if(attack_skill>0.7)strafechange_time+=crandom()*0.2;if(bs->attackstrafe_time>strafechange_time){if(random()>0.935){bs->flags^=BFL_STRAFERIGHT;bs->attackstrafe_time=0;}}
	for(i=0;i<2;i++){hordir[0]=forward[0];hordir[1]=forward[1];hordir[2]=0;VectorNormalize(hordir);CrossProduct(hordir,up,sideward);if(bs->flags&BFL_STRAFERIGHT)VectorNegate(sideward,sideward);if(random()>0.9)VectorAdd(sideward,backward,sideward);else{if(dist>attack_dist+attack_range)VectorAdd(sideward,forward,sideward);else if(dist<attack_dist-attack_range)VectorAdd(sideward,backward,sideward);}if(trap_BotMoveInDirection(bs->ms,sideward,400,movetype))return moveresult;bs->flags^=BFL_STRAFERIGHT;bs->attackstrafe_time=0;}return moveresult;
}
static int obs;
#define OBS(x) do{obs++;if(!(x)){fprintf(stderr,"failure line %d\n",__LINE__);return 1;}}while(0)
static void reset(bot_state_t*b){memset(b,0,sizeof(*b));memset(characteristics,0,sizeof(characteristics));memset(randoms,0,sizeof(randoms));memset(moveanswers,0,sizeof(moveanswers));randomindex=setupcalls=movecalls=goalcalls=0;now=10;b->enemy=2;b->lastenemyareanum=6;b->lastenemyorigin[0]=20;b->lastenemyorigin[1]=30;b->lastenemyorigin[2]=40;b->thinktime=.1f;enemyinfo.number=2;enemyinfo.origin[0]=200;enemyinfo.origin[1]=enemyinfo.origin[2]=0;}
int main(void){bot_state_t b;bot_moveresult_t r;
 reset(&b);b.attackchase_time=11;r=BotAttackMove(&b,77);OBS(r.failure);OBS(setupcalls==1&&goalcalls==1);OBS(lastgoal.entitynum==2&&lastgoal.areanum==6&&lastgoal.origin[2]==40);
 reset(&b);characteristics[5]=.19f;BotAttackMove(&b,0);OBS(setupcalls==0);OBS(movecalls==0);
 reset(&b);characteristics[5]=.39f;randoms[0]=randoms[1]=.5f;moveanswers[0]=1;BotAttackMove(&b,0);OBS(movecalls==1);OBS(lastdir[0]>.99f&&lastmovetype==MOVE_WALK);
 reset(&b);characteristics[5]=.39f;b.origin[0]=101;randoms[0]=randoms[1]=.5f;moveanswers[0]=1;BotAttackMove(&b,0);OBS(lastdir[0]<-.99f);
 reset(&b);characteristics[5]=.39f;b.origin[0]=60;randoms[0]=randoms[1]=.5f;BotAttackMove(&b,0);OBS(movecalls==0);
 reset(&b);characteristics[5]=.39f;characteristics[21]=1;moveanswers[0]=1;BotAttackMove(&b,0);OBS(lastmovetype==MOVE_JUMP);OBS(b.attackjump_time==11);
 reset(&b);characteristics[5]=.39f;characteristics[21]=1;b.attackjump_time=11;moveanswers[0]=1;BotAttackMove(&b,0);OBS(lastmovetype==MOVE_WALK);
 reset(&b);characteristics[5]=.39f;characteristics[22]=1;randoms[0]=.5f;moveanswers[0]=1;BotAttackMove(&b,0);OBS(lastmovetype==MOVE_CROUCH);OBS(b.attackcrouch_time==15);
 reset(&b);characteristics[5]=.6f;randoms[0]=randoms[1]=.5f;moveanswers[0]=1;BotAttackMove(&b,0);OBS(lastdir[1]<-.99f);OBS(lastdir[0]>.99f);
 reset(&b);characteristics[5]=.6f;randoms[0]=randoms[1]=.5f;BotAttackMove(&b,0);OBS(movecalls==2);OBS((b.flags&BFL_STRAFERIGHT)==0);OBS(b.attackstrafe_time==0);
 reset(&b);characteristics[5]=.8f;randoms[0]=randoms[1]=.5f;randoms[2]=0;randoms[3]=1;moveanswers[0]=1;b.attackstrafe_time=1;BotAttackMove(&b,0);OBS((b.flags&BFL_STRAFERIGHT)!=0);
 reset(&b);characteristics[5]=.4f;b.cur_ps.weapon=WP_GAUNTLET;randoms[0]=randoms[1]=.5f;moveanswers[0]=1;BotAttackMove(&b,0);OBS(lastdir[0]>.99f);
 if(obs!=21){fprintf(stderr,"count %d\n",obs);return 1;}printf("PASS: 12 native Baseq3 BotAttackMove scenarios / 21 exact observations\n");return 0;}
