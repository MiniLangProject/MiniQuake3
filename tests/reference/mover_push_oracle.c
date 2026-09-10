/* SPDX-License-Identifier: GPL-2.0-or-later
 * Deterministic host for the unchanged Baseq3 g_mover.c push algorithms.
 */
#include "../../Quake-III-Arena-original-source/code/game/g_mover.c"

gentity_t g_entities[MAX_GENTITIES];
gclient_t g_clients[MAX_CLIENTS];
level_locals_t level;
vmCvar_t g_gravity;

static FILE *out;
static int areaCall, traceCall, linkCalls, unlinkCalls, blockedCalls, blockedSlot;
static int areaCounts[4], areaSlots[4][4], traceSolid[8], traceEntity[8];

static void word(int value) { fwrite(&value,4,1,out); }
static void vec(const vec3_t value) { fwrite(value,4,3,out); }

void QDECL G_Error(const char *fmt,...) { (void)fmt; exit(72); }
void QDECL G_Printf(const char *fmt,...) { (void)fmt; }
void QDECL Com_Error(int code,const char *fmt,...) {(void)code;(void)fmt;exit(72);}
void QDECL Com_Printf(const char *fmt,...) {(void)fmt;}
qboolean G_SpawnString(const char *key,const char *def,char **value){(void)key;*value=(char*)def;return qfalse;}
qboolean G_SpawnFloat(const char *key,const char *def,float *value){(void)key;*value=(float)atof(def);return qfalse;}
qboolean G_SpawnInt(const char *key,const char *def,int *value){(void)key;*value=atoi(def);return qfalse;}
qboolean G_SpawnVector(const char *key,const char *def,float *value){(void)key;(void)def;VectorSet(value,0,0,0);return qfalse;}
int G_ModelIndex(char *name){(void)name;return 0;} int G_SoundIndex(char *name){(void)name;return 0;}
gentity_t *G_Find(gentity_t *from,int fieldofs,const char *match){(void)from;(void)fieldofs;(void)match;return NULL;}
void G_SetMovedir(vec3_t angles,vec3_t movedir){(void)angles;VectorClear(movedir);}
gentity_t *G_Spawn(void){return &g_entities[100];} gentity_t *G_TempEntity(vec3_t origin,int event){(void)origin;(void)event;return &g_entities[101];}
void G_FreeEntity(gentity_t *ent){ent->inuse=qfalse;} char *vtos(const vec3_t value){(void)value;return "0 0 0";}
void TeleportPlayer(gentity_t *ent,vec3_t origin,vec3_t angles){(void)ent;(void)origin;(void)angles;}
void Team_DroppedFlagThink(gentity_t *ent){(void)ent;}
void trap_SetBrushModel(gentity_t *ent,const char *name){(void)ent;(void)name;}
void trap_LinkEntity(gentity_t *ent) { (void)ent; linkCalls++; }
void trap_UnlinkEntity(gentity_t *ent) { (void)ent; unlinkCalls++; }
int trap_EntitiesInBox(const vec3_t mins,const vec3_t maxs,int *list,int capacity) {
    int i,count=areaCounts[areaCall]; (void)mins; (void)maxs;
    if(count>capacity)count=capacity;
    for(i=0;i<count;i++)list[i]=areaSlots[areaCall][i];
    areaCall++; return count;
}
void trap_Trace(trace_t *tr,const vec3_t start,const vec3_t mins,const vec3_t maxs,
                const vec3_t end,int passEntityNum,int contentmask) {
    (void)start;(void)mins;(void)maxs;(void)end;(void)passEntityNum;(void)contentmask;
    memset(tr,0,sizeof(*tr));tr->fraction=traceSolid[traceCall]?0.0f:1.0f;
    tr->startsolid=traceSolid[traceCall];tr->allsolid=traceSolid[traceCall];
    tr->entityNum=traceEntity[traceCall];traceCall++;
}
void G_Damage(gentity_t *targ,gentity_t *inflictor,gentity_t *attacker,vec3_t dir,
              vec3_t point,int damage,int dflags,int mod) {
    (void)targ;(void)inflictor;(void)attacker;(void)dir;(void)point;(void)damage;(void)dflags;(void)mod;
    G_Error("unexpected sine mover damage");
}
void G_RunThink(gentity_t *ent) { (void)ent; }
void G_AddEvent(gentity_t *ent,int event,int eventParm) {(void)ent;(void)event;(void)eventParm;}
void G_UseTargets(gentity_t *ent,gentity_t *activator) {(void)ent;(void)activator;}
void trap_AdjustAreaPortalState(gentity_t *ent,qboolean open) {(void)ent;(void)open;}

static void blocked(gentity_t *self,gentity_t *other) {
    (void)self; blockedCalls++; blockedSlot=other?(int)(other-g_entities):-1;
}
static void reset_case(void) {
    int i; memset(g_entities,0,sizeof(g_entities));memset(g_clients,0,sizeof(g_clients));memset(&level,0,sizeof(level));
    memset(areaCounts,0,sizeof(areaCounts));memset(areaSlots,0,sizeof(areaSlots));
    memset(traceSolid,0,sizeof(traceSolid));for(i=0;i<8;i++)traceEntity[i]=ENTITYNUM_NONE;
    areaCall=traceCall=linkCalls=unlinkCalls=blockedCalls=0;blockedSlot=-1;
    level.time=100;level.previousTime=90;
}
static gentity_t *entity(int slot,int type,float x,float y,float z) {
    gentity_t *e=&g_entities[slot];memset(e,0,sizeof(*e));e->inuse=qtrue;e->s.number=slot;e->s.eType=type;
    VectorSet(e->r.mins,-4,-4,-4);VectorSet(e->r.maxs,4,4,4);
    VectorSet(e->r.absmin,x-5,y-5,z-5);VectorSet(e->r.absmax,x+5,y+5,z+5);
    VectorSet(e->r.currentOrigin,x,y,z);VectorCopy(e->r.currentOrigin,e->s.pos.trBase);
    e->r.contents=CONTENTS_SOLID;e->clipmask=MASK_SOLID;e->s.groundEntityNum=ENTITYNUM_NONE;return e;
}
static void linear_trajectory(gentity_t *e,float dx,float dy,float dz) {
    e->s.pos.trType=TR_LINEAR;e->s.pos.trTime=0;VectorSet(e->s.pos.trDelta,dx*10,dy*10,dz*10);
}
static void snapshot_entity(int slot) {
    gentity_t *e=&g_entities[slot];word(e->inuse);vec(e->r.currentOrigin);vec(e->r.currentAngles);
    vec(e->s.pos.trBase);vec(e->s.apos.trBase);word(e->s.groundEntityNum);word(e->s.pos.trTime);word(e->s.apos.trTime);
    word(e->client!=NULL);if(e->client){vec(e->client->ps.origin);word(e->client->ps.delta_angles[YAW]);}
    else {vec(vec3_origin);word(0);}
}
static void finish(int id,int success,int obstacle) {
    int slot;word(0x4d505553);word(id);word(success);word(obstacle);
    for(slot=1;slot<=5;slot++)snapshot_entity(slot);
    word(areaCall);word(traceCall);word(linkCalls);word(unlinkCalls);word(blockedCalls);word(blockedSlot);
}
int main(int argc,char **argv) {
    int id,success=1;gentity_t *pusher,*actor,*obstacle=NULL,*slave;
    vec3_t move={10,0,0},amove={0,0,0};
    if(argc!=3)return 2;id=atoi(argv[1]);out=fopen(argv[2],"wb");if(!out)return 3;reset_case();
    pusher=entity(1,ET_MOVER,0,0,0);actor=entity(3,ET_ITEM,0,0,9);actor->s.groundEntityNum=1;
    areaCounts[0]=1;areaSlots[0][0]=3;
    if(id==1){pushed_p=pushed;success=G_MoverPush(pusher,move,amove,&obstacle);}
    else if(id==2){
        actor->s.eType=ET_PLAYER;actor->client=&g_clients[3];VectorSet(actor->client->ps.origin,10,0,9);
        VectorCopy(actor->client->ps.origin,actor->r.currentOrigin);actor->client->ps.delta_angles[YAW]=123;
        VectorClear(move);VectorSet(amove,0,90,0);pushed_p=pushed;success=G_MoverPush(pusher,move,amove,&obstacle);
    } else if(id==3){
        entity(5,ET_GENERAL,5,0,9);
        traceSolid[0]=traceSolid[1]=1;traceEntity[0]=traceEntity[1]=5;
        pushed_p=pushed;success=G_MoverPush(pusher,move,amove,&obstacle);
    } else if(id==4){
        actor=entity(3,ET_ITEM,10,0,0);entity(5,ET_GENERAL,10,0,0);pusher->s.eFlags|=EF_MOVER_STOP;actor->s.groundEntityNum=ENTITYNUM_NONE;
        traceSolid[0]=1;traceEntity[0]=5;pushed_p=pushed;success=G_MoverPush(pusher,move,amove,&obstacle);
    } else if(id==5){
        slave=entity(2,ET_MOVER,100,0,0);pusher->teamchain=slave;pusher->blocked=blocked;
        linear_trajectory(pusher,10,0,0);linear_trajectory(slave,10,0,0);
        actor->s.groundEntityNum=1;entity(4,ET_ITEM,100,0,9)->s.groundEntityNum=2;entity(5,ET_GENERAL,105,0,9);
        areaCounts[0]=1;areaSlots[0][0]=3;areaCounts[1]=1;areaSlots[1][0]=4;
        traceSolid[1]=traceSolid[2]=1;traceEntity[1]=traceEntity[2]=5;
        G_MoverTeam(pusher);success=blockedCalls==0;obstacle=blockedCalls?&g_entities[blockedSlot]:NULL;
    } else return 4;
    finish(id,success,obstacle?(int)(obstacle-g_entities):-1);fclose(out);return 0;
}
