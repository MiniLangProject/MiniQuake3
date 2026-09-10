/* SPDX-License-Identifier: GPL-2.0-or-later
 * Direct ai_dmq3.c targeting oracle. The function bodies below are unchanged
 * Baseq3 logic; only botlib/game imports are deterministic capture stubs.
 */
#include <stdio.h>
#include <string.h>
#include <math.h>
#define qtrue 1
#define qfalse 0
#define MAX_CLIENTS 64
#define PW_REDFLAG 7
#define PW_BLUEFLAG 8
#define CHARACTERISTIC_REACTIONTIME 6
#define CHARACTERISTIC_FIRETHROTTLE 47
#define WP_GAUNTLET 1
#define CONTENTS_SOLID 1
#define CONTENTS_PLAYERCLIP 0x10000
#define MASK_SHOT 0x6000001
#define DAMAGETYPE_RADIAL 2
#define WFL_FIRERELEASED 1
#define BFL_ATTACKED 2
#define Square(x) ((x)*(x))
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
#define VectorMA(a,s,b,c) do{(c)[0]=(a)[0]+(s)*(b)[0];(c)[1]=(a)[1]+(s)*(b)[1];(c)[2]=(a)[2]+(s)*(b)[2];}while(0)
#define VectorLengthSquared(v) DotProduct(v,v)
#define AngleMod(a) ((360.0f/65536) * ((int)((a)*(65536/360.0f)) & 65535))
typedef int qboolean;typedef float vec3_t[3];
typedef struct {int number,valid,powerups;vec3_t origin,angles;} aas_entityinfo_t;
typedef struct {float fraction;int ent,startsolid;vec3_t endpos;} bsp_trace_t;
typedef struct {int damagetype;float radius,damage;} projectileinfo_t;
typedef struct {int number,flags;float speed,offset[3],vspread,hspread;projectileinfo_t proj;} weaponinfo_t;
typedef struct {int viewheight;} playerState_t;
typedef struct {int client,entitynum,enemy,character,weaponnum,ws,flags;float enemysight_time,teleport_time,weaponchange_time,firethrottlewait_time,firethrottleshoot_time;vec3_t aimtarget,eye,origin,viewangles;playerState_t cur_ps;} bot_state_t;
static int maxclients=4,attackcalls,sameteam[70],traceindex;static float now,reaction,throttle,randomvalue,visibility[70];static aas_entityinfo_t entities[70];static bsp_trace_t traces[8];static weaponinfo_t weapon;
static void BotEntityInfo(int n,aas_entityinfo_t*e){*e=entities[n];}static int BotSameTeam(bot_state_t*b,int n){(void)b;return sameteam[n];}static float BotEntityVisible(int a,vec3_t b,vec3_t c,float d,int n){(void)a;(void)b;(void)c;(void)d;return visibility[n];}
static float FloatTime(void){return now;}static float trap_Characteristic_BFloat(int c,int k,float a,float b){(void)c;(void)a;(void)b;return k==CHARACTERISTIC_REACTIONTIME?reaction:throttle;}static float random_stub(void){return randomvalue;}
#define random random_stub
static void BotAI_Trace(bsp_trace_t*t,vec3_t a,vec3_t mi,vec3_t ma,vec3_t b,int p,int m){(void)a;(void)mi;(void)ma;(void)b;(void)p;(void)m;*t=traces[traceindex++];}static void trap_BotGetWeaponInfo(int w,int n,weaponinfo_t*i){(void)w;(void)n;*i=weapon;}static void trap_EA_Attack(int c){(void)c;attackcalls++;}
static void vectoangles(vec3_t v,vec3_t a){float yaw,pitch,forward;if(v[1]==0&&v[0]==0){yaw=0;pitch=v[2]>0?90:270;}else{yaw=(float)(atan2(v[1],v[0])*180/3.14159265358979323846);if(yaw<0)yaw+=360;forward=sqrtf(v[0]*v[0]+v[1]*v[1]);pitch=(float)(atan2(v[2],forward)*180/3.14159265358979323846);if(pitch<0)pitch+=360;}a[0]=-pitch;a[1]=yaw;a[2]=0;}
static void AngleVectors(vec3_t a,vec3_t f,vec3_t r,vec3_t u){float p=a[0]*3.14159265358979323846f/180,y=a[1]*3.14159265358979323846f/180,cp=cosf(p),sp=sinf(p),cy=cosf(y),sy=sinf(y);(void)u;f[0]=cp*cy;f[1]=cp*sy;f[2]=-sp;r[0]=sy;r[1]=-cy;r[2]=0;}
qboolean EntityCarriesFlag(aas_entityinfo_t *entinfo) {if(entinfo->powerups&(1<<PW_REDFLAG))return qtrue;if(entinfo->powerups&(1<<PW_BLUEFLAG))return qtrue;return qfalse;}

/* Unchanged from code/game/ai_dmq3.c. */
int BotTeamFlagCarrierVisible(bot_state_t *bs) {
	int i; float vis; aas_entityinfo_t entinfo;
	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
		if (i == bs->client) continue; BotEntityInfo(i, &entinfo); if (!entinfo.valid) continue; if (!EntityCarriesFlag(&entinfo)) continue; if (!BotSameTeam(bs, i)) continue; vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i); if (vis <= 0) continue; return i;
	} return -1;
}
int BotTeamFlagCarrier(bot_state_t *bs) {
	int i; aas_entityinfo_t entinfo;
	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
		if (i == bs->client) continue; BotEntityInfo(i, &entinfo); if (!entinfo.valid) continue; if (!EntityCarriesFlag(&entinfo)) continue; if (!BotSameTeam(bs, i)) continue; return i;
	} return -1;
}
int BotEnemyFlagCarrierVisible(bot_state_t *bs) {
	int i; float vis; aas_entityinfo_t entinfo;
	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
		if (i == bs->client) continue; BotEntityInfo(i, &entinfo); if (!entinfo.valid) continue; if (!EntityCarriesFlag(&entinfo)) continue; if (BotSameTeam(bs, i)) continue; vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i); if (vis <= 0) continue; return i;
	} return -1;
}
qboolean InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles) {
	int i; float diff, angle; for (i = 0; i < 2; i++) {angle=AngleMod(viewangles[i]);angles[i]=AngleMod(angles[i]);diff=angles[i]-angle;if(angles[i]>angle){if(diff>180.0)diff-=360.0;}else{if(diff< -180.0)diff+=360.0;}if(diff>0){if(diff>fov*0.5)return qfalse;}else{if(diff< -fov*0.5)return qfalse;}}return qtrue;
}
void BotCheckAttack(bot_state_t *bs) {
	float points,reactiontime,fov,firethrottle;int attackentity;bsp_trace_t bsptrace;vec3_t forward,right,start,end,dir,angles;weaponinfo_t wi;bsp_trace_t trace;aas_entityinfo_t entinfo;vec3_t mins={-8,-8,-8},maxs={8,8,8};
	attackentity=bs->enemy;BotEntityInfo(attackentity,&entinfo);reactiontime=trap_Characteristic_BFloat(bs->character,CHARACTERISTIC_REACTIONTIME,0,1);if(bs->enemysight_time>FloatTime()-reactiontime)return;if(bs->teleport_time>FloatTime()-reactiontime)return;if(bs->weaponchange_time>FloatTime()-0.1)return;if(bs->firethrottlewait_time>FloatTime())return;firethrottle=trap_Characteristic_BFloat(bs->character,CHARACTERISTIC_FIRETHROTTLE,0,1);if(bs->firethrottleshoot_time<FloatTime()){if(random()>firethrottle){bs->firethrottlewait_time=FloatTime()+firethrottle;bs->firethrottleshoot_time=0;}else{bs->firethrottleshoot_time=FloatTime()+1-firethrottle;bs->firethrottlewait_time=0;}}
	VectorSubtract(bs->aimtarget,bs->eye,dir);if(bs->weaponnum==WP_GAUNTLET){if(VectorLengthSquared(dir)>Square(60))return;}if(VectorLengthSquared(dir)<Square(100))fov=120;else fov=50;vectoangles(dir,angles);if(!InFieldOfVision(bs->viewangles,fov,angles))return;BotAI_Trace(&bsptrace,bs->eye,NULL,NULL,bs->aimtarget,bs->client,CONTENTS_SOLID|CONTENTS_PLAYERCLIP);if(bsptrace.fraction<1&&bsptrace.ent!=attackentity)return;
	trap_BotGetWeaponInfo(bs->ws,bs->weaponnum,&wi);VectorCopy(bs->origin,start);start[2]+=bs->cur_ps.viewheight;AngleVectors(bs->viewangles,forward,right,NULL);start[0]+=forward[0]*wi.offset[0]+right[0]*wi.offset[1];start[1]+=forward[1]*wi.offset[0]+right[1]*wi.offset[1];start[2]+=forward[2]*wi.offset[0]+right[2]*wi.offset[1]+wi.offset[2];VectorMA(start,1000,forward,end);VectorMA(start,-12,forward,start);BotAI_Trace(&trace,start,mins,maxs,end,bs->entitynum,MASK_SHOT);if(trace.ent>0&&trace.ent<=MAX_CLIENTS){if(trace.ent!=attackentity){if(BotSameTeam(bs,trace.ent))return;}}if(trace.ent!=attackentity||attackentity>=MAX_CLIENTS){if(wi.proj.damagetype&DAMAGETYPE_RADIAL){if(trace.fraction*1000<wi.proj.radius){points=(wi.proj.damage-0.5*trace.fraction*1000)*0.5;if(points>0)return;}}}if(wi.flags&WFL_FIRERELEASED){if(bs->flags&BFL_ATTACKED)trap_EA_Attack(bs->client);}else trap_EA_Attack(bs->client);bs->flags^=BFL_ATTACKED;
}

static int observations;
#define OBS(x) do{observations++;if(!(x)){fprintf(stderr,"failure line %d\n",__LINE__);return 1;}}while(0)
static void reset(bot_state_t*b){memset(b,0,sizeof(*b));memset(entities,0,sizeof(entities));memset(sameteam,0,sizeof(sameteam));for(int i=0;i<70;i++)visibility[i]=1;memset(&weapon,0,sizeof(weapon));memset(traces,0,sizeof(traces));b->enemy=1;b->aimtarget[0]=100;b->aimtarget[2]=26;b->eye[2]=26;b->cur_ps.viewheight=26;entities[1].number=1;entities[1].valid=1;now=100;reaction=0;throttle=1;randomvalue=0;traceindex=0;attackcalls=0;traces[0].fraction=1;traces[0].ent=1;traces[1].fraction=1;traces[1].ent=1;}
int main(void){bot_state_t b;reset(&b);entities[1].powerups=1<<PW_REDFLAG;sameteam[1]=1;OBS(BotTeamFlagCarrierVisible(&b)==1);visibility[1]=0;OBS(BotTeamFlagCarrierVisible(&b)==-1);OBS(BotTeamFlagCarrier(&b)==1);sameteam[1]=0;visibility[1]=1;OBS(BotEnemyFlagCarrierVisible(&b)==1);
 reset(&b);BotCheckAttack(&b);OBS(attackcalls==1);OBS(b.flags==BFL_ATTACKED);OBS(b.firethrottleshoot_time==100);
 reset(&b);reaction=1;b.enemysight_time=99.5f;BotCheckAttack(&b);OBS(attackcalls==0);OBS(traceindex==0);
 reset(&b);b.weaponchange_time=99.95f;BotCheckAttack(&b);OBS(attackcalls==0);OBS(traceindex==0);
 reset(&b);b.weaponnum=WP_GAUNTLET;b.aimtarget[0]=61;BotCheckAttack(&b);OBS(attackcalls==0);OBS(traceindex==0);
 reset(&b);b.aimtarget[0]=0;b.aimtarget[1]=100;BotCheckAttack(&b);OBS(attackcalls==0);OBS(traceindex==0);
 reset(&b);traces[0].fraction=.5f;traces[0].ent=3;BotCheckAttack(&b);OBS(attackcalls==0);OBS(traceindex==1);
 reset(&b);traces[1].ent=2;sameteam[2]=1;BotCheckAttack(&b);OBS(attackcalls==0);OBS(traceindex==2);
 reset(&b);weapon.proj.damagetype=DAMAGETYPE_RADIAL;weapon.proj.radius=200;weapon.proj.damage=100;traces[1].ent=3;traces[1].fraction=.05f;BotCheckAttack(&b);OBS(attackcalls==0);OBS(b.flags==0);
 reset(&b);weapon.flags=WFL_FIRERELEASED;BotCheckAttack(&b);OBS(attackcalls==0);OBS(b.flags==BFL_ATTACKED);traceindex=0;BotCheckAttack(&b);OBS(attackcalls==1);OBS(b.flags==0);
 if(observations!=25){fprintf(stderr,"observation count %d\n",observations);return 1;}printf("PASS: 10 native Baseq3 targeting scenarios / 25 exact observations\n");return 0;}
