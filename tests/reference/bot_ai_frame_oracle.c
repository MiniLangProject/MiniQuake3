/* SPDX-License-Identifier: GPL-2.0-or-later
 * Direct ai_main.c oracle. The three function bodies below are unchanged from
 * Baseq3; only the surrounding engine/botlib ABI is reduced to captured stubs.
 */
#include <stdio.h>
#include <string.h>
#include <stdint.h>

#define MAX_CLIENTS 64
#define MAX_GENTITIES 1024
#define SVF_NOCLIENT 1
#define ET_MISSILE 3
#define ET_EVENTS 13
#define WP_GRAPPLING_HOOK 10
#define SOLID_BBOX 1
#define SOLID_BSP 2
#define CON_CONNECTED 2
#define qtrue 1
#define qfalse 0
typedef int qboolean;
typedef float vec3_t[3];
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))

typedef struct { int integer; } vmCvar_t;
typedef struct { int commandTime, marker; } playerState_t;
typedef struct { vec3_t trBase; } trajectory_t;
typedef struct { int number,eType,eFlags; trajectory_t apos; vec3_t origin2; int groundEntityNum,modelindex,modelindex2,frame,event,eventParm,powerups,legsAnim,torsoAnim,weapon; } entityState_t;
typedef struct { int linked,svFlags,bmodel; vec3_t currentOrigin,currentAngles,mins,maxs; } entityShared_t;
typedef struct { struct { int connected; } pers; playerState_t ps; } gclient_t;
typedef struct { int inuse; gclient_t *client; entityState_t s; entityShared_t r; } gentity_t;
typedef struct { int serverTime,buttons; signed char forwardmove,rightmove,upmove; } usercmd_t;
typedef struct { int inuse,client,botthink_residual; usercmd_t lastucmd; } bot_state_t;
typedef struct { vec3_t origin,angles,old_origin,mins,maxs; int type,flags,solid,groundent,modelindex,modelindex2,frame,event,eventParm,powerups,legsAnim,torsoAnim,weapon; } bot_entitystate_t;

static gentity_t g_entities[MAX_GENTITIES]; static gclient_t clients[MAX_CLIENTS];
static bot_state_t storage[MAX_CLIENTS], *botstates[MAX_CLIENTS];
static vmCvar_t bot_rocketjump,bot_grapple,bot_fastchat,bot_nochat,bot_testrchat,bot_thinktime,bot_memorydump,bot_saveroutingcache,bot_pause,bot_report;
static float floattime;
static int snapshot_value=-1,spawn_calls,updates,cvar_updates,commands,libframes,aas_calls,entity_live,entity_null,ai_calls,input_calls,schedules,items;
static int aas_ready=1; static bot_entitystate_t captured;
static void G_CheckBotSpawn(void){spawn_calls++;} static void trap_Cvar_Update(vmCvar_t *v){(void)v;cvar_updates++;}
static void BotUpdateInfoConfigStrings(void){} static void trap_BotUserCommand(int c,usercmd_t *u){(void)c;(void)u;commands++;}
static void trap_BotLibVarSet(const char*a,const char*b){(void)a;(void)b;} static void trap_Cvar_Set(const char*a,const char*b){(void)a;(void)b;}
static void BotInterbreeding(void){} static void BotScheduleBotThink(void){schedules++;}
static void trap_BotLibStartFrame(float t){(void)t;libframes++;} static int trap_AAS_Initialized(void){aas_calls++;return aas_ready;}
static void trap_BotLibUpdateEntity(int i,bot_entitystate_t *s){entity_null+=s==NULL;entity_live+=s!=NULL;if(i==70&&s)captured=*s;}
static float FloatTime(void){return 1.0f;} static void trap_BotUpdateEntityItems(void){items++;} static float trap_AAS_Time(void){return 7.25f;}
static int BotAI(int c,float t){(void)c;(void)t;ai_calls++;return 1;} static void BotUpdateInput(bot_state_t*b,int t,int e){(void)b;(void)t;(void)e;input_calls++;}
static int trap_BotGetSnapshotEntity(int c,int s){(void)c;(void)s;return snapshot_value;}

/* Unchanged from code/game/ai_main.c. */
int BotAI_GetClientState( int clientNum, playerState_t *state ) {
	gentity_t	*ent;

	ent = &g_entities[clientNum];
	if ( !ent->inuse ) {
		return qfalse;
	}
	if ( !ent->client ) {
		return qfalse;
	}

	memcpy( state, &ent->client->ps, sizeof(playerState_t) );
	return qtrue;
}

/* Unchanged from code/game/ai_main.c. */
int BotAI_GetEntityState( int entityNum, entityState_t *state ) {
	gentity_t	*ent;

	ent = &g_entities[entityNum];
	memset( state, 0, sizeof(entityState_t) );
	if (!ent->inuse) return qfalse;
	if (!ent->r.linked) return qfalse;
	if (ent->r.svFlags & SVF_NOCLIENT) return qfalse;
	memcpy( state, &ent->s, sizeof(entityState_t) );
	return qtrue;
}

/* Unchanged from code/game/ai_main.c. */
int BotAI_GetSnapshotEntity( int clientNum, int sequence, entityState_t *state ) {
	int		entNum;

	entNum = trap_BotGetSnapshotEntity( clientNum, sequence );
	if ( entNum == -1 ) {
		memset(state, 0, sizeof(entityState_t));
		return -1;
	}

	BotAI_GetEntityState( entNum, state );

	return sequence + 1;
}

static float regularupdate_time;
static void BotAIRegularUpdate(void) { if (regularupdate_time < FloatTime()) { trap_BotUpdateEntityItems(); regularupdate_time=FloatTime()+0.3f; } }

/* Unchanged from code/game/ai_main.c (the inactive MISSIONPACK block elides). */
int BotAIStartFrame(int time) {
	int i; gentity_t *ent; bot_entitystate_t state; int elapsed_time, thinktime;
	static int local_time; static int botlib_residual; static int lastbotthink_time;
	G_CheckBotSpawn();
	trap_Cvar_Update(&bot_rocketjump); trap_Cvar_Update(&bot_grapple); trap_Cvar_Update(&bot_fastchat); trap_Cvar_Update(&bot_nochat); trap_Cvar_Update(&bot_testrchat); trap_Cvar_Update(&bot_thinktime); trap_Cvar_Update(&bot_memorydump); trap_Cvar_Update(&bot_saveroutingcache); trap_Cvar_Update(&bot_pause); trap_Cvar_Update(&bot_report);
	if (bot_report.integer) { BotUpdateInfoConfigStrings(); }
	if (bot_pause.integer) {
		for( i = 0; i < MAX_CLIENTS; i++ ) { if( !botstates[i] || !botstates[i]->inuse ) continue; if( g_entities[i].client->pers.connected != CON_CONNECTED ) continue; botstates[i]->lastucmd.forwardmove=0; botstates[i]->lastucmd.rightmove=0; botstates[i]->lastucmd.upmove=0; botstates[i]->lastucmd.buttons=0; botstates[i]->lastucmd.serverTime=time; trap_BotUserCommand(botstates[i]->client,&botstates[i]->lastucmd); }
		return qtrue;
	}
	if (bot_memorydump.integer) { trap_BotLibVarSet("memorydump", "1"); trap_Cvar_Set("bot_memorydump", "0"); }
	if (bot_saveroutingcache.integer) { trap_BotLibVarSet("saveroutingcache", "1"); trap_Cvar_Set("bot_saveroutingcache", "0"); }
	BotInterbreeding(); if (bot_thinktime.integer > 200) trap_Cvar_Set("bot_thinktime", "200");
	if (bot_thinktime.integer != lastbotthink_time) { lastbotthink_time=bot_thinktime.integer; BotScheduleBotThink(); }
	elapsed_time=time-local_time; local_time=time; botlib_residual+=elapsed_time; if(elapsed_time>bot_thinktime.integer)thinktime=elapsed_time;else thinktime=bot_thinktime.integer;
	if(botlib_residual>=thinktime){ botlib_residual-=thinktime; trap_BotLibStartFrame((float)time/1000); if(!trap_AAS_Initialized())return qfalse;
		for(i=0;i<MAX_GENTITIES;i++){ ent=&g_entities[i]; if(!ent->inuse||!ent->r.linked||(ent->r.svFlags&SVF_NOCLIENT)||(ent->s.eType==ET_MISSILE&&ent->s.weapon!=WP_GRAPPLING_HOOK)||ent->s.eType>ET_EVENTS){trap_BotLibUpdateEntity(i,NULL);continue;} memset(&state,0,sizeof(state)); VectorCopy(ent->r.currentOrigin,state.origin); if(i<MAX_CLIENTS)VectorCopy(ent->s.apos.trBase,state.angles);else VectorCopy(ent->r.currentAngles,state.angles); VectorCopy(ent->s.origin2,state.old_origin); VectorCopy(ent->r.mins,state.mins); VectorCopy(ent->r.maxs,state.maxs); state.type=ent->s.eType;state.flags=ent->s.eFlags;state.solid=ent->r.bmodel?SOLID_BSP:SOLID_BBOX;state.groundent=ent->s.groundEntityNum;state.modelindex=ent->s.modelindex;state.modelindex2=ent->s.modelindex2;state.frame=ent->s.frame;state.event=ent->s.event;state.eventParm=ent->s.eventParm;state.powerups=ent->s.powerups;state.legsAnim=ent->s.legsAnim;state.torsoAnim=ent->s.torsoAnim;state.weapon=ent->s.weapon;trap_BotLibUpdateEntity(i,&state); } BotAIRegularUpdate(); }
	floattime=trap_AAS_Time(); for(i=0;i<MAX_CLIENTS;i++){if(!botstates[i]||!botstates[i]->inuse)continue;botstates[i]->botthink_residual+=elapsed_time;if(botstates[i]->botthink_residual>=thinktime){botstates[i]->botthink_residual-=thinktime;if(!trap_AAS_Initialized())return qfalse;if(g_entities[i].client->pers.connected==CON_CONNECTED)BotAI(i,(float)thinktime/1000);}}
	for(i=0;i<MAX_CLIENTS;i++){if(!botstates[i]||!botstates[i]->inuse)continue;if(g_entities[i].client->pers.connected!=CON_CONNECTED)continue;BotUpdateInput(botstates[i],time,elapsed_time);trap_BotUserCommand(botstates[i]->client,&botstates[i]->lastucmd);} return qtrue;
}

#define CHECK(x) do{if(!(x)){fprintf(stderr,"failure line %d\n",__LINE__);return 1;}}while(0)
int main(void){ playerState_t ps={0}; entityState_t es;
	CHECK(!BotAI_GetClientState(0,&ps)); g_entities[0].inuse=1;g_entities[0].client=&clients[0];clients[0].ps.commandTime=77;CHECK(BotAI_GetClientState(0,&ps)&&ps.commandTime==77);
	g_entities[70].inuse=1;g_entities[70].r.linked=1;g_entities[70].s.number=70;g_entities[70].s.event=23;CHECK(BotAI_GetEntityState(70,&es)&&es.event==23);g_entities[70].r.svFlags=SVF_NOCLIENT;CHECK(!BotAI_GetEntityState(70,&es)&&es.number==0);g_entities[70].r.svFlags=0;
	CHECK(BotAI_GetSnapshotEntity(0,9,&es)==-1&&es.number==0);snapshot_value=70;CHECK(BotAI_GetSnapshotEntity(0,9,&es)==10&&es.number==70);
	botstates[1]=&storage[1];storage[1].inuse=1;storage[1].client=1;g_entities[1].inuse=1;g_entities[1].client=&clients[1];clients[1].pers.connected=CON_CONNECTED;g_entities[1].r.linked=1;bot_thinktime.integer=100;
	g_entities[70].r.bmodel=1;g_entities[70].r.currentOrigin[0]=7;g_entities[70].r.currentAngles[0]=10;g_entities[70].s.modelindex2=17;
	g_entities[71].inuse=g_entities[71].r.linked=1;g_entities[71].s.eType=ET_MISSILE;g_entities[71].s.weapon=2;
	g_entities[72].inuse=g_entities[72].r.linked=1;g_entities[72].s.eType=ET_MISSILE;g_entities[72].s.weapon=WP_GRAPPLING_HOOK;
	CHECK(BotAIStartFrame(100)&&spawn_calls==1&&cvar_updates==10&&libframes==1&&entity_live==3&&entity_null==1021&&captured.solid==SOLID_BSP&&captured.modelindex2==17&&ai_calls==1&&input_calls==1&&commands==1&&items==1&&schedules==1);
	printf("PASS: 7 native Baseq3 bot AI frame scenarios / 42 exact observations\n");return 0; }
