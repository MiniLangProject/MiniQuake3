/* SPDX-License-Identifier: GPL-2.0-or-later
 * Lifecycle differential host. Gameplay bodies are extracted unchanged. Engine
 * cvars, arena, parser, CM/server linking and all reached spawn helpers are real.
 * Delivery of files/serverinfo/LocateGameData and missing bot AI are observations.
 */
static FILE *lifecycleRaw;
static int lifecycleOpenHandle=7,lifecycleWatermark=256,lifecycleNormalizations;
static char lifecycleServerInfo[8192]="\\mapname\\asset-free\\sv_hostname\\MiniQuake3";
static void lifecycleBlob(const void *data,int size){word(size);if(size)fwrite(data,1,size,output);}
static void lifecycleEntity(gentity_t *e){
    word((int)(e-g_entities));teamChangeEntity(e);
    word(e->spawnflags);string(e->target);string(e->targetname);string(e->model);string(e->model2);
    words(&e->speed,1);words(&e->wait,1);words(&e->random,1);string(e->message);string(e->team);word(e->damage);
    string(e->targetShaderName);string(e->targetShaderNewName);words(e->movedir,3);word(e->use!=NULL);
    word(slotOf(e->activator));word(e->noise_index);word(e->fly_sound_debounce_time);word(slotOf(e->nextTrain));
    word(e->moverState);word(slotOf(e->target_ent));word(e->splashDamage);word(e->splashRadius);
    word(e->methodOfDeath);word(e->splashMethodOfDeath);word(slotOf(e->teammaster));word(slotOf(e->teamchain));
    word(e->waterlevel);word(e->watertype);word(e->pain_debounce_time);word(e->r.bmodel);
    {int metadata[21];hostMetadata((int)(e-g_entities),metadata);words(metadata,21);}
}
static void lifecycleState(void){
    int i,j,limit;long sizeOffset,start,end;
    word(900);sizeOffset=ftell(output);word(0);start=ftell(output);
    word(level.gentities!=NULL);word(level.clients!=NULL);
    word(level.time);word(level.previousTime);word(level.startTime);word(level.num_entities);word(level.maxclients);
    word(level.framenum);word(level.logFile);word(level.snd_fry);word(level.newSession);word(level.restarted);
    word(level.warmupModificationCount);word(level.warmupTime);word(level.spawning);word(level.numSpawnVars);
    word(level.numSpawnVarChars);word(level.bodyQueIndex);word(level.locationLinked);word(slotOf(level.locationHead));
    word(level.follow1);word(level.follow2);word(level.lastTeamLocationTime);
    word(level.numConnectedClients);word(level.numNonSpectatorClients);word(level.numPlayingClients);word(level.numVotingClients);
    words(level.numteamVotingClients,2);words(level.teamScores,4);words(level.sortedClients,64);
    for(i=0;i<8;i++)word(slotOf(level.bodyQue[i]));
    word(level.intermissionQueued);word(level.intermissiontime);word(level.readyToExit);word(level.exitTime);
    words(level.intermission_origin,3);words(level.intermission_angle,3);string(level.changemap);
    string(level.voteString);string(level.voteDisplayString);word(level.voteTime);word(level.voteExecuteTime);word(level.voteYes);word(level.voteNo);
    for(i=0;i<2;i++){string(level.teamVoteString[i]);word(level.teamVoteTime[i]);word(level.teamVoteYes[i]);word(level.teamVoteNo[i]);}
    for(i=0;i<level.numSpawnVars;i++){string(level.spawnVars[i][0]);string(level.spawnVars[i][1]);}
    words(&teamgame,9);words(itemRegistered,256);word(remapCount);
    for(i=0;i<remapCount;i++){string(remappedShaders[i].oldShader);string(remappedShaders[i].newShader);words(&remappedShaders[i].timeOffset,1);}
    words(&s_quadFactor,1);words(forward,3);words(right,3);words(up,3);words(muzzle,3);
    word(allocPoint);if(allocPoint>lifecycleWatermark)lifecycleWatermark=allocPoint;
    if(lifecycleWatermark>POOLSIZE)exit(74);lifecycleBlob(memoryPool,lifecycleWatermark);
    word(numIPFilters);words(ipFilters,2048);lifecycleBlob(g_banIPs.string,256);
    word(gameCvarTableSize);
    for(i=0;i<gameCvarTableSize;i++){
        vmCvar_t *vm=gameCvarTable[i].vmCvar;word(gameCvarTable[i].modificationCount);word(vm!=NULL);
        if(vm){word(vm->handle);word(vm->modificationCount);words(&vm->value,1);word(vm->integer);string(vm->string);}
    }
    word(cvar_numIndexes);word(cvar_modifiedFlags);
    for(i=0;i<cvar_numIndexes;i++){
        cvar_t *v=&cvar_indexes[i];string(v->name);string(v->string);string(v->resetString);string(v->latchedString);
        word(v->flags);word(v->modified);word(v->modificationCount);word(v->integer);words(&v->value,1);
    }
    for(i=0;i<1024;i++)string(configs[i]);
    for(i=0;i<64;i++)connectClientState(&g_clients[i]);
    limit=level.num_entities>128?level.num_entities:128;if(limit>1022)limit=1022;
    word(limit+2);for(i=0;i<limit;i++)lifecycleEntity(&g_entities[i]);lifecycleEntity(&g_entities[1022]);lifecycleEntity(&g_entities[1023]);
    if(mapObjectsOutput)mapObjectExtraState();
    end=ftell(output);fseek(output,sizeOffset,SEEK_SET);word((int)(end-start));fseek(output,end,SEEK_SET);
}
static void lifecycleEffectBytes(int kind,int a,int b,const char *key,const void *data,int size){
    lifecycleState();word(901);word(kind);word(a);word(b);string(key);lifecycleBlob(data,size);if(mapObjectsOutput)mapObjectMutation(kind,a);
}
static void lifecycleEvent(int kind,int a,int b,const char *key,const char *text){lifecycleEffectBytes(kind,a,b,key,text,(int)strlen(text));}
static void lifecycleConfig(int index,const char *text){
    const char *value=text?text:"";
    if(index<0 || index>=1024)G_Error("lifecycle config index");
    if(index==CS_FLAGSTATUS && g_gametype.integer==GT_CTF && teamgame.redStatus==0 && teamgame.blueStatus==-1){
        if((unsigned char)value[0]!='0' || value[2]!=0)exit(75);
        fprintf(lifecycleRaw,"{\"sequence\":%d,\"index\":%d,\"bytes\":[%u,%u,%u]}\n",lifecycleNormalizations,index,(unsigned char)value[0],(unsigned char)value[1],(unsigned char)value[2]);
        lifecycleNormalizations++;value="0";
    }
    Q_strncpyz(configs[index],value,sizeof(configs[index]));lifecycleEvent(5,index,0,"",value);
}
static void lifecycleCvarSet(const char *key,const char *value){
    if(!lifecycleSpawnDepth)lifecycleEvent(4,-1,0,key,value);
    lifecycleEngineDepth++;Cvar_Set2(key,value,qtrue);lifecycleEngineDepth--;
    if(lifecycleSpawnDepth)lifecycleEvent(4,0,0,key,value);
}
void trap_Cvar_Register(vmCvar_t *vm,const char *key,const char *value,int flags){
    int i;for(i=0;i<gameCvarTableSize;i++)if(!strcmp(gameCvarTable[i].cvarName,key))break;
    lifecycleEvent(2,i,flags,key,value);lifecycleEngineDepth++;Cvar_Register(vm,key,value,flags);lifecycleEngineDepth--;
}
void trap_Cvar_Update(vmCvar_t *vm){
    int i;for(i=0;i<gameCvarTableSize;i++)if(gameCvarTable[i].vmCvar==vm)break;
    lifecycleEvent(3,i,0,"","");lifecycleEngineDepth++;Cvar_Update(vm);lifecycleEngineDepth--;
}
void trap_Printf(const char *text){lifecycleEvent(1,0,0,"",text);}
void trap_Error(const char *text){lifecycleState();word(999);string(text);fprintf(stderr,"%s",text);exit(72);}
int trap_FS_FOpenFile(const char *name,fileHandle_t *handle,fsMode_t mode){lifecycleEvent(9,mode,lifecycleOpenHandle,name,"");*handle=lifecycleOpenHandle;return 0;}
void trap_FS_Write(const void *data,int size,fileHandle_t handle){lifecycleEffectBytes(11,handle,size,"",data,size);}
void trap_FS_FCloseFile(fileHandle_t handle){lifecycleEvent(12,handle,0,"","");}
void trap_GetServerinfo(char *buffer,int size){if(strlen(lifecycleServerInfo)>1005){fprintf(stderr,"Lifecycle fixture exceeds native InitGame logfile storage");exit(74);}lifecycleEvent(10,size,0,"",lifecycleServerInfo);Q_strncpyz(buffer,lifecycleServerInfo,size);}
int BotAISetup(int restart){lifecycleEvent(13,restart,0,"","");return qtrue;}
int BotAILoadMap(int restart){lifecycleEvent(14,restart,0,"","");return qtrue;}
void G_InitBots(qboolean restart){lifecycleEvent(15,restart,0,"","");}
int BotAIShutdown(int restart){lifecycleEvent(16,restart,0,"","");return qtrue;}
void G_SpawnEntitiesFromString(void){lifecycleSpawnDepth++;lifecycleOriginalSpawn();lifecycleSpawnDepth--;}
static void lifecycleDiagnostic(const char *text){if(!lifecycleEngineDepth)lifecycleEvent(1,0,0,"",text);}
static void lifecyclePoison(void){
    gentity_t *e;void *allocation;
    level.gentities=g_entities;level.clients=g_clients;level.time=123456;level.previousTime=-7;level.startTime=17;
    level.num_entities=99;level.maxclients=2;level.framenum=42;level.logFile=17;level.snd_fry=777;
    level.newSession=qtrue;level.restarted=qtrue;level.warmupModificationCount=9;level.warmupTime=-1;
    level.spawning=qtrue;level.numSpawnVars=1;level.spawnVars[0][0]="poison";level.spawnVars[0][1]="old";level.numSpawnVarChars=11;
    level.bodyQueIndex=3;level.bodyQue[0]=&g_entities[88];level.locationLinked=qtrue;level.locationHead=&g_entities[99];
    level.follow1=13;level.follow2=-2;level.lastTeamLocationTime=77;level.teamScores[1]=123;level.sortedClients[0]=9;
    level.intermissionQueued=77;level.intermissiontime=88;level.readyToExit=qtrue;level.exitTime=99;
    VectorSet(level.intermission_origin,1,2,3);VectorSet(level.intermission_angle,4,5,6);level.changemap="oldmap";
    strcpy(level.voteString,"old vote");strcpy(level.voteDisplayString,"shown");level.voteTime=100;level.voteYes=2;
    strcpy(level.teamVoteString[1],"old team vote");level.teamVoteNo[1]=3;
    e=&g_entities[0];e->health=91;e->client=&g_clients[0];e->inuse=qtrue;e->s.eType=ET_PLAYER;
    e=&g_entities[127];e->classname="poisoned";e->target="target";e->targetname="named";e->model="oldmodel";
    e->team="oldteam";e->health=77;e->s.number=127;VectorSet(e->s.pos.trBase,7,8,9);e->teammaster=&g_entities[0];
    g_entities[1022].classname="oldworld";g_entities[1022].s.number=1022;g_entities[1023].classname="oldend";
    g_clients[0].ps.stats[STAT_HEALTH]=49;g_clients[0].sess.sessionTeam=TEAM_RED;g_clients[0].pers.connected=CON_CONNECTED;
    strcpy(g_clients[0].pers.netname,"Before init");g_clients[0].sess.spectatorTime=345;g_clients[0].hook=&g_entities[80];
    itemRegistered[200]=17;teamgame.redStatus=1;teamgame.blueStatus=2;teamgame.redTakenTime=45;teamgame.last_flag_capture=1.25f;
    AddRemap("old","new",1.5f);s_quadFactor=2.5f;VectorSet(forward,1,2,3);VectorSet(muzzle,4,5,6);
    allocation=G_Alloc(128);memset(allocation,97,128);numIPFilters=1;ipFilters[0].mask=0x00ffffff;ipFilters[0].compare=0x00030201;
}
static void runLifecycle(FILE *in,const char *rawName){
    int count,i,a[4],seed;char *date,*first,*second;void *allocation;
    lifecycleRaw=fopen(rawName,"wb");if(!lifecycleRaw)exit(74);
    hostServerReset(g_entities,sizeof(gentity_t),64);Cvar_Init();srand(1);mq3DiagnosticFn=lifecycleDiagnostic;
    date=readString(in);if(!date || strcmp(date,__DATE__))exit(74);free(date);
    if(fread(&count,4,1,in)!=1 || count<0)exit(74);
    for(i=0;i<count;i++){
        if(fread(a,4,4,in)!=4)exit(74);first=readString(in);second=readString(in);if(!first || !second)exit(74);
        switch(a[0]){
        case 1:entityPoint=first;COM_BeginParseSession("lifecycle");G_InitGame(a[1],a[2],a[3]);break;
        case 2:G_ShutdownGame(a[1]);break;
        case 3:lifecycleEngineDepth++;Cvar_Set2(first,second,a[1]!=0);lifecycleEngineDepth--;break;
        case 4:lifecycleOpenHandle=a[1];Q_strncpyz(lifecycleServerInfo,first,sizeof(lifecycleServerInfo));break;
        case 5:lifecyclePoison();break;
        case 6:word(902);word(rand());break;
        case 7:{gclient_t *cl;int specTime,specState,specClient,wins,losses,leader;
            if(a[1]<0 || a[1]>=MAX_CLIENTS)exit(74);cl=&g_clients[a[1]];
            if(sscanf(first,"%d,%d,%d,%d,%d,%d",&specTime,&specState,&specClient,&wins,&losses,&leader)!=6)exit(74);
            cl->pers.connected=a[2];cl->sess.sessionTeam=a[3];cl->sess.spectatorTime=specTime;cl->sess.spectatorState=specState;
            cl->sess.spectatorClient=specClient;cl->sess.wins=wins;cl->sess.losses=losses;cl->sess.teamLeader=leader;break;}
        case 8:if(a[1]<0 || a[1]>POOLSIZE)exit(74);allocation=G_Alloc(a[1]);if(a[1])memset(allocation,a[2]&255,a[1]);break;
        case 9:if(a[1]<0 || a[1]>=1024)exit(74);Q_strncpyz(configs[a[1]],first,sizeof(configs[0]));break;
        case 10:G_UpdateCvars();break;
        case 11:level.time=a[1];break;
        case 12:Svcmd_GameMem_f();break;
        case 13:InitBodyQue();break;
        case 14:if(a[1]<0 || a[1]>=MAX_GENTITIES)exit(74);seed=G_CallSpawn(&g_entities[a[1]]);word(904);word(seed);break;
        default:if(mapObjectsOutput){mapObjectAction(a,first,second);break;}exit(74);
        }
        free(first);free(second);lifecycleState();
    }
    word(902);word(rand());word(903);word(lifecycleNormalizations);
    if(fgetc(in)!=EOF)exit(74);fclose(lifecycleRaw);
}

#include "map_object_actions.inc"
