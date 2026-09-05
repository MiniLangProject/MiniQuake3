/* SPDX-License-Identifier: GPL-2.0-or-later
 * Unchanged game functions. G_Damage is a recorded callback boundary: damage,
 * death and scoring rules are intentionally not implemented by this host.
 */
#include "g_local.h"
#include "qcommon.h"
#include "state_offsets.inc"
#include "snapvector.inc"
gentity_t g_entities[MAX_GENTITIES];gclient_t g_clients[MAX_CLIENTS];level_locals_t level;
void hostServerReset(void*,int,int);void hostLink(void*);void hostUnlink(void*);
int hostContact(const vec3_t,const vec3_t,void*,int);int hostArea(const vec3_t,const vec3_t,int*,int);
void hostTrace(trace_t*,const vec3_t,const vec3_t,const vec3_t,const vec3_t,int,int);int hostContents(const vec3_t,int);void hostMetadata(int,int*);
static int logs[32768],logcount;static int packet[262144],packetcount;
static void word(int value) { if(packetcount>=262144)exit(70);packet[packetcount++]=value; }
static int bits(float value) { int i;memcpy(&i,&value,4);return i; }
static void words(const void *p,int count) { const int *v=p;while(count--)word(*v++); }
static void record(const int *values) { if(logcount+12>32768)exit(71);memcpy(logs+logcount,values,48);logcount+=12; }
static void observe(int kind,gentity_t *e) {
    int values[12]={kind,(int)(e-g_entities),e->s.eType,e->s.clientNum,e->s.solid,e->r.linked,
        bits(e->r.currentOrigin[0]),bits(e->r.currentOrigin[1]),bits(e->r.currentOrigin[2]),
        e->client?e->client->ps.eFlags:0,e->client?e->client->ps.eventSequence:0,level.time};record(values);
}
void trap_LinkEntity(gentity_t *e) { hostLink(e);observe(1,e); }
void trap_UnlinkEntity(gentity_t *e) { hostUnlink(e);observe(2,e); }
void trap_LocateGameData(gentity_t *e,int count,int size,playerState_t *ps,int clientSize) { int v[12]={3,count};record(v); }
int trap_EntitiesInBox(const vec3_t mins,const vec3_t maxs,int *list,int count) { return hostArea(mins,maxs,list,count); }
qboolean trap_EntityContact(const vec3_t mins,const vec3_t maxs,const gentity_t *e) { return hostContact(mins,maxs,(void*)e,0); }
void trap_SnapVector(float *v) { Sys_SnapVector(v); }
void QDECL G_Printf(const char *fmt,...) { }
void QDECL G_Error(const char *fmt,...) { fprintf(stderr,"G_Error: %s",fmt);exit(72); }
void G_Damage(gentity_t *t,gentity_t *i,gentity_t *a,vec3_t dir,vec3_t point,int damage,int flags,int mod) {
    int v[12]={4,(int)(t-g_entities),(int)(i-g_entities),(int)(a-g_entities),damage,flags,mod,!dir,!point,t->r.linked,a->r.linked,level.time};record(v);
}
static void recordTouch(gentity_t *self,gentity_t *other,trace_t *tr) {
    int v[12]={5,(int)(self-g_entities),(int)(other-g_entities),bits(tr->fraction),tr->allsolid,tr->startsolid,tr->contents,tr->entityNum,
        bits(tr->endpos[0]),bits(tr->endpos[1]),bits(tr->endpos[2]),level.time};record(v);
}
void Touch_DoorTrigger(gentity_t *self,gentity_t *other,trace_t *tr) { recordTouch(self,other,tr); }
void trigger_push_touch(gentity_t*,gentity_t*,trace_t*);void trigger_teleporter_touch(gentity_t*,gentity_t*,trace_t*);
#include "game_functions.inc"
static void setTouch(gentity_t *e,int kind) {
    e->touch=kind==1?trigger_push_touch:kind==2?trigger_teleporter_touch:kind==3?recordTouch:kind==4?Touch_DoorTrigger:NULL;
}
static void snapshot(gentity_t *e) {
    int m[21],zero[117]={0};word((int)(e-g_entities));words(&e->s,52);word(e->client!=NULL);
    if(e->client) { words(&e->client->ps,117);word(e->client->sess.sessionTeam);words(e->client->pers.cmd.angles,3); }
    else {words(zero,117);words(zero,4);}
    word(e->inuse);word(e->freetime);word(e->neverFree);word(e->eventTime);word(e->freeAfterEvent);word(e->spawnflags);
    words(e->r.mins,3);words(e->r.maxs,3);words(e->r.currentOrigin,3);words(e->r.currentAngles,3);words(e->r.absmin,3);words(e->r.absmax,3);
    word(e->r.contents);word(e->r.bmodel);word(e->r.svFlags);word(e->r.ownerNum);word(e->r.linked);word(e->r.linkcount);
    hostMetadata((int)(e-g_entities),m);words(m,21);
}
static void extras(void) {
    int i,count=0;word(logcount/12);words(logs,logcount);
    for(i=64;i<level.num_entities;i++)if(g_entities[i].inuse && g_entities[i].classname && !strcmp(g_entities[i].classname,"tempEntity"))count++;
    word(count);
    for(i=64;i<level.num_entities;i++)if(g_entities[i].inuse && g_entities[i].classname && !strcmp(g_entities[i].classname,"tempEntity"))snapshot(&g_entities[i]);
}
static void readData(FILE *in,void *p,int size) { if(fread(p,size,1,in)!=1)exit(73); }
int main(int argc,char **argv) {
    FILE *in,*out;int checksum,op,i,number;gentity_t *e;
    struct {int number,hasclient,team,touch,bmodel,contents,flags,owner,link,neverFree,spawnflags;entityState_t s;playerState_t ps;vec3_t mins,maxs,origin,angles;int cmdAngles[3];char target[32],targetname[32];} config;
    if(argc==3 && !strcmp(argv[1],"--spawn-exhaustion")) {
        level.num_entities=ENTITYNUM_MAX_NORMAL;level.time=5000;level.startTime=0;
        for(i=0;i<level.num_entities;i++)g_entities[i].inuse=qtrue;
        if(atoi(argv[2])) {g_entities[64].inuse=qfalse;g_entities[64].freetime=4999;}
        G_Spawn();return 0;
    }
    if(argc==4 && !strcmp(argv[1],"--state")) {
        struct {playerState_t ps;entityState_t s;int snap,extra,time;vec3_t angles;int cmdAngles[3];} q;
        in=fopen(argv[2],"rb");out=fopen(argv[3],"wb");if(!in||!out||sizeof(q)!=712)return 2;
        while(fread(&q,sizeof(q),1,in)==1) {
            if(q.extra)BG_PlayerStateToEntityStateExtraPolate(&q.ps,&q.s,q.time,q.snap);else BG_PlayerStateToEntityState(&q.ps,&q.s,q.snap);
            fwrite(&q.ps,468,1,out);fwrite(&q.s,208,1,out);
            memset(&g_entities[0],0,sizeof(g_entities[0]));memset(&g_clients[0],0,sizeof(g_clients[0]));g_entities[0].client=&g_clients[0];
            g_clients[0].ps=q.ps;VectorCopy(q.cmdAngles,g_clients[0].pers.cmd.angles);SetClientViewAngle(&g_entities[0],q.angles);
            fwrite(g_clients[0].ps.delta_angles,12,1,out);fwrite(g_clients[0].ps.viewangles,12,1,out);fwrite(g_entities[0].s.angles,12,1,out);
        }fclose(in);fclose(out);return 0;
    }
    if(argc!=5 || sizeof(config)!=844)return 2;
    CM_LoadMap(argv[1],qfalse,&checksum);Cvar_Get("cm_noCurves","0",0)->integer=atoi(argv[4]);
    in=fopen(argv[2],"rb");out=fopen(argv[3],"wb");if(!in||!out)return 3;
    while(fread(&op,4,1,in)==1) {
        packetcount=0;logcount=0;
        if(op==0) {
            int q[2];readData(in,q,8);memset(&level,0,sizeof(level));memset(g_entities,0,sizeof(g_entities));memset(g_clients,0,sizeof(g_clients));
            level.gentities=g_entities;level.clients=g_clients;level.num_entities=64;level.time=level.startTime=q[1];srand(q[0]);
            hostServerReset(g_entities,sizeof(gentity_t),64);word(64);
        } else if(op==1) {
            readData(in,&config,sizeof(config));number=config.number;e=&g_entities[number];G_InitGentity(e);e->s=config.s;
            if(config.hasclient) { if(number>=64)return 4;e->client=&g_clients[number];e->client->ps=config.ps;e->client->sess.sessionTeam=config.team;VectorCopy(config.cmdAngles,e->client->pers.cmd.angles); } else e->client=NULL;
            setTouch(e,config.touch);e->r.bmodel=config.bmodel;e->r.contents=config.contents;e->r.svFlags=config.flags;e->r.ownerNum=config.owner;e->neverFree=config.neverFree;e->spawnflags=config.spawnflags;
            VectorCopy(config.mins,e->r.mins);VectorCopy(config.maxs,e->r.maxs);VectorCopy(config.origin,e->r.currentOrigin);VectorCopy(config.angles,e->r.currentAngles);
            e->target=*config.target?_strdup(config.target):NULL;e->targetname=*config.targetname?_strdup(config.targetname):NULL;
            if(number>=level.num_entities)level.num_entities=number+1;
            if(config.link)trap_LinkEntity(e);snapshot(e);
        } else if(op==2) {
            struct {int number;vec3_t origin,angles;} q;readData(in,&q,sizeof(q));e=&g_entities[q.number];TeleportPlayer(e,q.origin,q.angles);snapshot(e);
        } else if(op==3) {readData(in,&number,4);G_TouchTriggers(&g_entities[number]);snapshot(&g_entities[number]);
        } else if(op==4) {
            struct {int number;usercmd_t cmd;int fixed,msec;} q;pmove_t move;readData(in,&q,sizeof(q));e=&g_entities[q.number];
            memset(&move,0,sizeof(move));move.ps=&e->client->ps;move.cmd=q.cmd;e->client->pers.cmd=q.cmd;move.trace=hostTrace;move.pointcontents=hostContents;
            move.tracemask=MASK_PLAYERSOLID;move.pmove_fixed=q.fixed;move.pmove_msec=q.msec;Pmove(&move);
            VectorCopy(move.mins,e->r.mins);VectorCopy(move.maxs,e->r.maxs);VectorCopy(move.ps->origin,e->r.currentOrigin);
            BG_PlayerStateToEntityState(move.ps,&e->s,qtrue);trap_LinkEntity(e);G_TouchTriggers(e);snapshot(e);
        } else if(op==5 || op==6) {readData(in,&number,4);e=&g_entities[number];if(op==5)trap_UnlinkEntity(e);else G_FreeEntity(e);snapshot(e);
        } else if(op==7) {readData(in,&level.time,4);word(level.time);
        } else if(op==8) {e=G_Spawn();snapshot(e);word(level.num_entities);word(G_EntitiesFree());
        } else if(op==9) {struct {vec3_t origin;int event;} q;readData(in,&q,sizeof(q));snapshot(G_TempEntity(q.origin,q.event));
        } else if(op==10) {char name[32];readData(in,name,32);e=G_PickTarget(*name?name:NULL);word(e?(int)(e-g_entities):-1);
        } else if(op==11) {word(rand());
        } else if(op==12) {struct {vec3_t mins,maxs;int number,capsule;} q;readData(in,&q,sizeof(q));word(hostContact(q.mins,q.maxs,&g_entities[q.number],q.capsule));
        } else return 5;
        extras();fwrite(&packetcount,4,1,out);fwrite(packet,4,packetcount,out);
    }fclose(in);fclose(out);return 0;
}
