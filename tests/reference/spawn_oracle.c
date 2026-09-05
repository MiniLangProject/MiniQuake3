/* SPDX-License-Identifier: GPL-2.0-or-later
 * Complete original g_spawn.c. Unported spawn callbacks only record dispatch.
 */
#include "../../Quake-III-Arena-original-source/code/game/g_spawn.c"
void CM_LoadMap(const char*,qboolean,int*);cvar_t *Cvar_Get(const char*,const char*,int);
#include "snapvector.inc"
gentity_t g_entities[MAX_GENTITIES];gclient_t g_clients[MAX_CLIENTS];level_locals_t level;
vmCvar_t g_gametype,g_motd,g_restarted,g_doWarmup,g_gravity,g_knockback,g_friendlyFire,g_debugDamage;
void hostServerReset(void*,int,int);void hostLink(void*);void hostUnlink(void*);void hostBrush(void*,const char*);void hostMetadata(int,int*);
int hostContact(const vec3_t,const vec3_t,void*,int);int hostArea(const vec3_t,const vec3_t,int*,int);
static char configs[MAX_CONFIGSTRINGS][8192],gravityText[1024];static const char *entityPoint;static FILE *output;
void AimAtTarget(gentity_t*);void trigger_push_touch(gentity_t*,gentity_t*,trace_t*);void trigger_teleporter_touch(gentity_t*,gentity_t*,trace_t*);
static void word(int x) {fwrite(&x,4,1,output);}
static void words(const void *p,int n) {fwrite(p,4,n,output);}
static void string(const char *s) {int n=s?(int)strlen(s):-1;word(n);if(n>0)fwrite(s,1,n,output);}
static void snapshot(gentity_t *e) {
    int m[21];word((int)(e-g_entities));words(&e->s,52);word(e->inuse);word(e->freetime);word(e->neverFree);word(e->eventTime);word(e->freeAfterEvent);word(e->spawnflags);
    words(e->r.mins,3);words(e->r.maxs,3);words(e->r.currentOrigin,3);words(e->r.currentAngles,3);words(e->r.absmin,3);words(e->r.absmax,3);
    word(e->r.contents);word(e->r.bmodel);word(e->r.svFlags);word(e->r.ownerNum);word(e->r.linked);word(e->r.linkcount);hostMetadata((int)(e-g_entities),m);words(m,21);
    words(&e->speed,1);words(&e->wait,1);words(&e->random,1);word(e->count);word(e->health);word(e->damage);word(e->flags);words(e->movedir,3);word(e->nextthink);
    word(e->think==AimAtTarget?1:e->think?2:0);word(e->touch==trigger_push_touch?1:e->touch==trigger_teleporter_touch?2:e->touch?3:0);
    word(e->use?1:0);word(e->activator?(int)(e->activator-g_entities):-1);word(e->unlinkAfterEvent);word(e->physicsObject);
    word(e->noise_index);word(e->fly_sound_debounce_time);word(e->nextTrain?(int)(e->nextTrain-g_entities):-1);
    string(e->classname);string(e->model);string(e->model2);string(e->target);string(e->targetname);string(e->message);string(e->team);string(e->targetShaderName);string(e->targetShaderNewName);
}
static void boundary(gentity_t *e,int kind,int index) {word(4);word(kind);word(index);snapshot(e);}
void trap_LinkEntity(gentity_t *e) {hostLink(e);word(5);snapshot(e);}
void trap_UnlinkEntity(gentity_t *e) {hostUnlink(e);word(6);snapshot(e);}
void trap_SetBrushModel(gentity_t *e,const char *name) {hostBrush(e,name);}
void trap_LocateGameData(gentity_t *e,int count,int size,playerState_t *ps,int clientSize) {word(7);word(count);}
void trap_GetConfigstring(int index,char *buffer,int size) {Q_strncpyz(buffer,configs[index],size);}
void trap_SetConfigstring(int index,const char *value) {if(index<0 || index>=MAX_CONFIGSTRINGS)G_Error("configstring index out of range");Q_strncpyz(configs[index],value?value:"",sizeof(configs[index]));word(1);word(index);string("");string(value);}
void trap_Cvar_Set(const char *key,const char *value) {word(2);word(0);string(key);string(value);if(!strcmp(key,"g_gravity"))Q_strncpyz(gravityText,value,sizeof(gravityText));}
qboolean trap_GetEntityToken(char *buffer,int size) {const char *s=COM_Parse(&entityPoint);Q_strncpyz(buffer,s,size);return entityPoint || *s;}
int trap_EntitiesInBox(const vec3_t mins,const vec3_t maxs,int *list,int count) {return hostArea(mins,maxs,list,count);}
qboolean trap_EntityContact(const vec3_t mins,const vec3_t maxs,const gentity_t *e) {return hostContact(mins,maxs,(void*)e,0);}
void trap_SnapVector(float *v) {Sys_SnapVector(v);}
void QDECL G_Printf(const char *fmt,...) { }
void QDECL G_LogPrintf(const char *fmt,...) {word(3);word(0);string("");string(fmt);}
void QDECL G_Error(const char *fmt,...) {va_list args;va_start(args,fmt);vfprintf(stderr,fmt,args);va_end(args);exit(72);}
void Touch_DoorTrigger(gentity_t *a,gentity_t *b,trace_t *c) {G_Error("unexpected door boundary");}
void *G_Alloc(int n) {void *p=calloc(1,n);if(!p)exit(73);return p;}
void G_SpawnItem(gentity_t *e,gitem_t *item) {boundary(e,1,(int)(item-bg_itemlist));}
#include "spawn_boundaries.inc"
#include "spawn_functions.inc"
#include "target_actions.inc"
#include "combat_actions.inc"
static char *readString(FILE *in) {int n;char *s;if(fread(&n,4,1,in)!=1)return NULL;if(n<0 || n>10000000)exit(74);s=calloc(1,n+1);if(n && fread(s,1,n,in)!=n)exit(74);return s;}
static void state(void) {int i;word(8);word(level.time);word(level.num_entities);word(level.spawning);word(level.numSpawnVars);word(level.numSpawnVarChars);word(level.warmupTime);word(level.locationLinked);word(slotOf(level.locationHead));for(i=64;i<level.num_entities;i++)snapshot(&g_entities[i]);snapshot(&g_entities[1022]);}
static void reset(int type,int flags) {
    memset(&level,0,sizeof(level));memset(g_entities,0,sizeof(g_entities));memset(g_clients,0,sizeof(g_clients));memset(configs,0,sizeof(configs));
    level.gentities=g_entities;level.clients=g_clients;level.num_entities=64;level.time=level.startTime=1000;srand(1);
    g_gametype.integer=type;g_restarted.integer=flags&1;g_doWarmup.integer=flags&2;g_gravity.value=800;g_knockback.value=1000;g_friendlyFire.integer=0;strcpy(g_motd.string,"MiniQuake3 spawn parity");strcpy(gravityText,"800");
    hostServerReset(g_entities,sizeof(gentity_t),64);
}
static void countThink(gentity_t *e) {e->count++;}
int main(int argc,char **argv) {
    int checksum,i,step;FILE *in;char *text;
    if(argc<5)return 2;CM_LoadMap(argv[1],qfalse,&checksum);Cvar_Get("cm_noCurves","0",0)->integer=atoi(argv[4]);
    in=fopen(argv[2],"rb");output=fopen(argv[3],"wb");if(!in || !output)return 3;
    if(argc==6 && !strcmp(argv[5],"--think")) {
        int q[3];gentity_t *e=&g_entities[64];reset(0,0);
        while(fread(q,4,3,in)==3) {e->nextthink=q[0];level.time=q[1];e->count=0;e->think=q[2]?countThink:NULL;G_RunThink(e);word(e->nextthink);word(e->count);}
    } else if(argc==6 && !strcmp(argv[5],"--actions")) {
        reset(0,0);runActions(in);
    } else if(argc==6 && !strcmp(argv[5],"--combat")) {
        reset(0,0);runCombat(in);
    } else if(argc==6 && !strcmp(argv[5],"--values")) {
        reset(0,0);
        while((text=readString(in))!=NULL) {
            char *s;int present,iv;float fv;vec3_t v={123.5f,-45.25f,67.75f};gentity_t *e=&g_entities[64];
            memset(e,0,sizeof(*e));e->s.number=64;entityPoint=text;COM_BeginParseSession("spawn-values");
            word(G_ParseSpawnVars());word(level.numSpawnVars);word(level.numSpawnVarChars);
            for(i=0;i<level.numSpawnVars;i++) {string(level.spawnVars[i][0]);string(level.spawnVars[i][1]);G_ParseField(level.spawnVars[i][0],level.spawnVars[i][1],e);}
            snapshot(e);present=G_SpawnString("probe","fallback",&s);word(present);string(s);
            present=G_SpawnInt("probe","7",&iv);word(present);word(iv);present=G_SpawnFloat("probe","7.5",&fv);word(present);words(&fv,1);
            present=G_SpawnVector("probe","1 2 3",v);word(present);words(v,3);
            word(G_ParseSpawnVars());word(level.numSpawnVars);word(level.numSpawnVarChars);free(text);
        }
    } else {
        int opts[2];if(fread(opts,4,2,in)!=2)return 4;text=readString(in);if(!text)return 4;
        reset(opts[0],opts[1]);entityPoint=text;COM_BeginParseSession("spawn-map");G_SpawnEntitiesFromString();state();
        // The real frame refreshes vmCvar_t before invoking entity thinkers.
        g_gravity.value=(float)atof(gravityText);
        for(step=0;step<3;step++) {level.time=1099+step;for(i=64;i<level.num_entities;i++)if(g_entities[i].inuse)G_RunThink(&g_entities[i]);state();}
        // Probe actual spawned trigger geometry after its delayed target setup.
        {int limit=level.num_entities,probes=0;for(i=64;i<limit && probes<16;i++) {
            gentity_t *hit=&g_entities[i],*e=&g_entities[0];int axis;
            if(!hit->inuse || (hit->s.eType!=ET_PUSH_TRIGGER && hit->s.eType!=ET_TELEPORT_TRIGGER))continue;
            G_InitGentity(e);memset(&g_clients[0],0,sizeof(g_clients[0]));e->client=&g_clients[0];e->s.eType=ET_PLAYER;
            e->client->ps.stats[STAT_HEALTH]=100;e->client->ps.pmove_framecount=1;e->r.contents=CONTENTS_BODY;
            VectorSet(e->r.mins,-15,-15,-24);VectorSet(e->r.maxs,15,15,32);
            for(axis=0;axis<3;axis++)e->client->ps.origin[axis]=e->r.currentOrigin[axis]=(hit->r.absmin[axis]+hit->r.absmax[axis])*0.5;
            trap_LinkEntity(e);G_TouchTriggers(e);word(9);words(&e->client->ps,117);snapshot(e);G_FreeEntity(e);probes++;
        }}
        free(text);
    }
    fclose(in);fclose(output);return 0;
}
