/* SPDX-License-Identifier: GPL-2.0-or-later
 * Actual engine registry + unchanged Baseq3 table and Cvar functions.
 * Frame probes have no live entities, players, matches or votes.
 */
#define main unused_core_main
#include "core_oracle.c"
#undef main
#include "g_local.h"
extern cvar_t cvar_indexes[];
extern int cvar_numIndexes;
static FILE *result;
static int registered;
static vmCvar_t probe;
static char probeName[1024];
level_locals_t level;
gentity_t g_entities[MAX_GENTITIES];
gclient_t g_clients[MAX_CLIENTS];
#include "game_cvar_table.inc"
static void emit(int v){word(result,v);}
static void emitText(const char *v){string(result,v);}
static int rowIndex(vmCvar_t *vm){int i;for(i=0;i<gameCvarTableSize;i++)if(gameCvarTable[i].vmCvar==vm)return i;return -1;}
void trap_Cvar_Register(vmCvar_t *vm,const char *name,const char *value,int flags){
    int i;for(i=0;i<gameCvarTableSize;i++)if(!strcmp(name,gameCvarTable[i].cvarName))break;
    emit(180);emit(1);emit(i);emit(flags);emitText(name);emitText(value);Cvar_Register(vm,name,value,flags);
}
void trap_Cvar_Update(vmCvar_t *vm){emit(180);emit(2);emit(rowIndex(vm));Cvar_Update(vm);}
void trap_Cvar_Set(const char *name,const char *value){emit(180);emit(3);emit(-1);emitText(name);emitText(value);Cvar_Set2(name,value,qtrue);}
void trap_SendServerCommand(int slot,const char *text){
    int i;emit(181);emit(slot);emitText(text);
    for(i=0;i<gameCvarTableSize;i++){emit(gameCvarTable[i].modificationCount);emit(gameCvarTable[i].vmCvar?gameCvarTable[i].vmCvar->modificationCount:-1);}
}
void QDECL G_Printf(const char *fmt,...){
    char text[2048];va_list args;va_start(args,fmt);
    if(!strcmp(fmt,"%4i: %s\n")){emit(180);emit(6);emit(va_arg(args,int));}
    else{vsnprintf(text,sizeof(text),fmt,args);emit(180);emit(4);emit(-1);emitText("");emitText(text);}
    va_end(args);
}
void QDECL G_Error(const char *fmt,...){fprintf(stderr,"Unexpected non-Cvar game path: %s",fmt);exit(74);}
int trap_Milliseconds(void){return 0;}
void CheckTournament(void){if(level.numPlayingClients)G_Error("tournament");}
void CheckExitRules(void){if(level.numPlayingClients || level.intermissiontime || level.intermissionQueued || g_timelimit.integer)G_Error("match exit");}
void CheckVote(void){if(level.voteTime || level.voteExecuteTime)G_Error("vote");}
void CheckTeamVote(int team){if(level.teamVoteTime[0] || level.teamVoteTime[1])G_Error("team vote");}
gentity_t *Team_GetLocation(gentity_t *ent){G_Error("location");return NULL;}
void TeamplayInfoMessage(gentity_t *ent){G_Error("overlay");}
void G_FreeEntity(gentity_t *ent){G_Error("free entity");}
void trap_UnlinkEntity(gentity_t *ent){G_Error("unlink");}
void G_RunMissile(gentity_t *ent){G_Error("missile");}
void G_RunItem(gentity_t *ent){G_Error("item");}
void G_RunMover(gentity_t *ent){G_Error("mover");}
void G_RunClient(gentity_t *ent){G_Error("client");}
void G_RunThink(gentity_t *ent){G_Error("think");}
void ClientEndFrame(gentity_t *ent){G_Error("client end frame");}
#include "game_cvar_functions.inc"
static void vmState(vmCvar_t *vm){
    emit(vm?1:0);if(!vm)return;
    emit(vm->handle);emit(vm->modificationCount);fwrite(&vm->value,4,1,result);emit(vm->integer);emitText(vm->string);
}
static cvar_t *lookup(const char *name){cvar_t *v;for(v=cvar_vars;v;v=v->next)if(!Q_stricmp(v->name,name))return v;return NULL;}
static void engineState(const char *name){
    cvar_t *v=lookup(name);emit(v?1:0);if(!v)return;
    emit((int)(v-cvar_indexes));emit(v->flags);emit(v->modified);emit(v->modificationCount);fwrite(&v->value,4,1,result);emit(v->integer);
    emitText(v->string);emitText(v->resetString);emitText(v->latchedString);
}
static void snapshot(void){
    int i;emit(190);emit(registered);emit(level.time);emit(level.previousTime);emit(level.framenum);emit(level.lastTeamLocationTime);emit(level.warmupModificationCount);
    emit(cvar_numIndexes);emit(cvar_modifiedFlags);
    for(i=0;i<gameCvarTableSize;i++){emit(gameCvarTable[i].modificationCount);vmState(gameCvarTable[i].vmCvar);engineState(gameCvarTable[i].cvarName);}
    vmState(&probe);emitText(probeName);if(*probeName)engineState(probeName);
    if(registered){
        emit(g_gametype.integer);emit(g_restarted.integer);emit(g_maxclients.integer);emit(g_dmflags.integer);
        emit(g_fraglimit.integer);emit(g_timelimit.integer);emit(g_capturelimit.integer);emit(g_synchronousClients.integer!=0);emit(g_friendlyFire.integer);
        emit(g_warmup.integer);emit(g_warmup.modificationCount);emit(g_doWarmup.integer);emit(g_password.modificationCount);
        fwrite(&g_speed.value,4,1,result);fwrite(&g_gravity.value,4,1,result);fwrite(&g_gravity.value,4,1,result);fwrite(&g_knockback.value,4,1,result);
        emit(g_weaponRespawn.integer);emit(g_weaponTeamRespawn.integer);emit(g_forcerespawn.integer);emit(g_inactivity.integer);emit(g_blood.integer);
        emit(g_listEntity.integer);emit(g_smoothClients.integer!=0);emit(pmove_fixed.integer!=0);emit(pmove_msec.integer);emit(g_allowVote.integer);
        emit(g_cheats.integer);emit(g_dedicated.integer);
        emitText(g_motd.string);emitText(g_password.string);
    }
}
static int readInt(FILE *in){int v;if(fread(&v,4,1,in)!=1)exit(74);return v;}
static char *readText(FILE *in){int n=readInt(in);char *v;if(n<0 || n>65536)exit(74);v=calloc(1,n+1);if(fread(v,1,n,in)!=n)exit(74);return v;}
int main(int argc,char **argv){
    FILE *in;int count,i,kind,arg,flags;char *name,*value;cvar_t *v;
    if(argc==2 && !strcmp(argv[1],"--build-date")){puts(__DATE__);return 0;}
    if(argc!=3 || !(in=fopen(argv[1],"rb")) || !(result=fopen(argv[2],"wb")))return 2;
    Cvar_Init();level.num_entities=64;level.clients=g_clients;level.gentities=g_entities;
    for(i=0;i<64;i++)g_entities[i].client=&g_clients[i];
    value=readText(in);if(strcmp(value,__DATE__))return 3;free(value);count=readInt(in);
    while(count--){
        kind=readInt(in);
        switch(kind){
        case 1:G_RegisterCvars();registered=1;break;
        case 2:G_UpdateCvars();break;
        case 3:name=readText(in);value=readText(in);flags=readInt(in);Cvar_Set2(name,value,flags);free(name);free(value);break;
        case 4:CheckCvars();break;
        case 5:arg=readInt(in);G_RunFrame(arg);break;
        case 6:memset(&level,0,sizeof(level));level.num_entities=64;level.clients=g_clients;level.gentities=g_entities;break;
        case 7:name=readText(in);arg=readInt(in);v=lookup(name);if(!v)exit(74);v->modificationCount=arg;free(name);break;
        case 8:name=readText(in);value=readText(in);flags=readInt(in);Cvar_Get(name,value,flags);free(name);free(value);break;
        case 10:name=readText(in);value=readText(in);flags=readInt(in);Q_strncpyz(probeName,name,sizeof(probeName));Cvar_Register(&probe,name,value,flags);free(name);free(value);break;
        case 11:Cvar_Update(&probe);break;
        case 12:probe.handle=readInt(in);Cvar_Update(&probe);break;
        case 13:name=readText(in);value=readText(in);flags=readInt(in);Cvar_Register(NULL,name,value,flags);free(name);free(value);break;
        case 14:name=readText(in);v=lookup(name);if(!v)exit(74);v->string=NULL;free(name);Cvar_Update(&probe);break;
        default:exit(74);
        }
        snapshot();
    }
    fclose(in);fclose(result);return 0;
}
