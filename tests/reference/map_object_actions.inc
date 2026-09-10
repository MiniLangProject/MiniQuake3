/* SPDX-License-Identifier: GPL-2.0-or-later
 * Only fixtures, observations and one explicit post-delivery mutation hook.
 * All spawn/use/think/item/score/team algorithms above are unchanged originals.
 */
static int mapMutationKind,mapMutationArg,mapMutationRemaining,mapMutationAction[4];
static char mapMutationText[32768];
static int mapCallbackThink(gentity_t *e){return !e->think?0:e->think==locateCamera?1:e->think==RespawnItem?2:e->think==FinishSpawningItem?3:99;}
static int mapCallbackUse(gentity_t *e){return !e->use?0:e->use==Use_Target_Give?1:e->use==Use_target_remove_powerups?2:e->use==Use_Target_Score?3:e->use==Use_Target_Print?4:99;}
static void mapObjectExtraState(void){
    int i,limit=level.num_entities>128?level.num_entities:128;
    if(limit>1022)limit=1022;word(950);word(mapMutationKind);word(mapMutationArg);word(mapMutationRemaining);words(mapMutationAction,4);string(mapMutationText);
    word(limit+2);for(i=0;i<limit;i++){word(mapCallbackThink(&g_entities[i]));word(mapCallbackUse(&g_entities[i]));word(g_entities[i].touch==Touch_Item?1:g_entities[i].touch?99:0);}
    for(i=1022;i<1024;i++){word(mapCallbackThink(&g_entities[i]));word(mapCallbackUse(&g_entities[i]));word(g_entities[i].touch==Touch_Item?1:g_entities[i].touch?99:0);}
}
static void mapObjectMutation(int kind,int arg){
    if(mapMutationRemaining<=0 || kind!=mapMutationKind || (mapMutationArg!=-999 && arg!=mapMutationArg))return;
    mapMutationRemaining--;
    if(!mapMutationRemaining){int op=mapMutationAction[0];if(op!=21 && op!=22 && op!=23 && op!=24 && op!=25 && op!=27 && op!=29)exit(74);mapObjectAction(mapMutationAction,mapMutationText,"");}
}
static int mapWords(const char *text,int *values,int capacity){
    int count=0;const char *p=text;memset(values,0,capacity*sizeof(int));
    if(!*p)return 0;
    while(*p && count<capacity){values[count++]=atoi(p);p=strchr(p,',');if(!p)break;p++;}
    return count;
}
static gentity_t *mapEntity(int index){if(index<0 || index>=1024)exit(74);return &g_entities[index];}
static gclient_t *mapClient(int index){if(index<0 || index>=64)exit(74);return &g_clients[index];}
static void mapObjectAction(int *a,const char *first,const char *second){
    gentity_t *e,*other,*activator;gclient_t *client;int v[4],i;float *vector;char **field;
    switch(a[0]){
    case 20:e=mapEntity(a[1]);other=a[2]<0?NULL:mapEntity(a[2]);activator=mapEntity(a[3]);if(!e->use)exit(74);e->use(e,other,activator);break;
    case 21:e=mapEntity(a[1]);switch(a[2]){
        case 1:e->spawnflags=a[3];break;case 2:e->count=a[3];break;case 3:e->health=a[3];break;
        case 4:e->s.number=a[3];break;case 5:e->s.frame=a[3];break;case 6:e->s.clientNum=a[3];break;case 7:e->s.powerups=a[3];break;
        case 8:e->s.eType=a[3];break;case 9:e->r.svFlags=a[3];break;case 10:e->r.ownerNum=a[3];break;case 11:e->inuse=a[3]!=0;break;
        case 12:e->client=a[3]<0?NULL:mapClient(a[3]);break;case 13:if(a[3]<-1 || a[3]>=bg_numItems)exit(74);e->item=a[3]<0?NULL:&bg_itemlist[a[3]];break;
        case 14:e->s.modelindex=a[3];break;case 15:e->nextthink=a[3];break;case 16:e->flags=a[3];break;
        case 17:e->wait=actionFloat(a[3]);break;case 18:e->random=actionFloat(a[3]);break;case 19:e->speed=actionFloat(a[3]);break;
        case 20:e->neverFree=a[3]!=0;break;case 21:e->freeAfterEvent=a[3]!=0;break;case 22:e->unlinkAfterEvent=a[3]!=0;break;
        case 23:e->r.contents=a[3];break;case 24:e->s.eFlags=a[3];break;case 25:e->r.singleClient=a[3];break;case 26:e->eventTime=a[3];break;
        case 27:e->s.event=a[3];break;case 28:e->s.eventParm=a[3];break;case 29:e->physicsObject=a[3]!=0;break;
        case 30:e->takedamage=a[3]!=0;break;case 31:e->s.groundEntityNum=a[3];break;case 32:e->s.pos.trType=a[3];break;
        case 33:e->s.pos.trTime=a[3];break;case 34:e->s.pos.trDuration=a[3];break;case 35:e->clipmask=a[3];break;default:exit(74);}break;
    case 22:e=mapEntity(a[1]);if(mapWords(first,v,3)!=3)exit(74);switch(a[2]){
        case 1:vector=e->s.origin;break;case 2:vector=e->r.currentOrigin;break;
        case 3:if(!e->client)exit(74);vector=e->client->ps.origin;break;case 4:vector=e->s.angles;break;
        case 5:vector=e->r.mins;break;case 6:vector=e->r.maxs;break;case 7:vector=e->s.origin2;break;case 8:vector=e->s.pos.trBase;break;
        case 9:vector=e->movedir;break;case 10:if(!e->client)exit(74);vector=e->client->ps.viewangles;break;default:exit(74);}
        for(i=0;i<3;i++)vector[i]=actionFloat(v[i]);break;
    case 23:e=mapEntity(a[1]);switch(a[2]){
        case 1:field=&e->target;break;case 2:field=&e->targetname;break;case 3:field=&e->message;break;case 4:field=&e->classname;break;
        case 5:field=&e->team;break;case 6:field=&e->targetShaderName;break;case 7:field=&e->targetShaderNewName;break;default:exit(74);}
        *field=a[3]?NULL:_strdup(first);break;
    case 24:client=mapClient(a[1]);switch(a[2]){
        case 1:client->pers.connected=a[3];break;case 2:client->sess.sessionTeam=a[3];break;case 3:client->ps.persistant[PERS_TEAM]=a[3];break;
        case 4:client->ps.persistant[PERS_SCORE]=a[3];break;case 5:client->ps.stats[STAT_HEALTH]=a[3];break;case 6:client->ps.stats[STAT_MAX_HEALTH]=a[3];break;
        case 7:client->pers.predictItemPickup=a[3]!=0;break;case 8:client->ps.stats[STAT_ARMOR]=a[3];break;case 9:client->sess.spectatorState=a[3];break;
        case 10:client->sess.spectatorClient=a[3];break;case 11:client->ps.pm_type=a[3];break;case 12:client->ps.stats[STAT_WEAPONS]=a[3];break;
        case 13:Q_strncpyz(client->pers.netname,first,sizeof(client->pers.netname));break;default:exit(74);}break;
    case 25:client=mapClient(a[1]);if(a[2]<0 || a[2]>=16)exit(74);client->ps.powerups[a[2]]=a[3];break;
    case 26:client=mapClient(a[1]);if(a[2]<0 || a[2]>=16)exit(74);client->ps.ammo[a[2]]=a[3];break;
    case 27:switch(a[1]){case 1:level.warmupTime=a[2];break;case 2:g_gametype.integer=a[2];break;case 3:if(a[2]<0 || a[2]>64)exit(74);level.maxclients=a[2];break;case 4:if(a[2]<0 || a[2]>1022)exit(74);level.num_entities=a[2];break;default:exit(74);}break;
    case 28:e=mapEntity(a[1]);if(a[2])trap_LinkEntity(e);else trap_UnlinkEntity(e);break;
    case 29:entityPoint=_strdup(first);level.spawning=qtrue;COM_BeginParseSession("map-object-vars");if(!G_ParseSpawnVars())exit(74);break;
    case 30:mapMutationKind=a[1];mapMutationArg=a[2];mapMutationRemaining=a[3];if(mapWords(first,mapMutationAction,4)!=4 || strlen(second)>=sizeof(mapMutationText))exit(74);strcpy(mapMutationText,second);break;
    case 31:e=mapEntity(a[1]);switch(a[2]){
        case 1:SP_target_give(e);break;case 2:SP_target_remove_powerups(e);break;case 3:SP_target_score(e);break;case 4:SP_target_print(e);break;
        case 5:SP_misc_portal_surface(e);break;case 6:SP_misc_portal_camera(e);break;case 7:locateCamera(e);break;case 8:G_RunThink(e);break;
        case 9:G_FreeEntity(e);break;case 10:FinishSpawningItem(e);break;default:exit(74);}break;
    case 32:Team_SetFlagStatus(a[1],a[2]);break;
    case 33:srand(a[1]);break;
    case 34:e=mapEntity(a[1]);activator=a[2]<0?NULL:mapEntity(a[2]);G_UseTargets(e,activator);break;
    case 35:e=mapEntity(a[1]);level.previousTime=level.time;level.time=a[2];retailMoverOutput=1;G_RunMover(e);retailMoverOutput=0;break;
    case 36:e=mapEntity(a[1]);other=mapEntity(a[2]);if(!e->touch)exit(74);e->touch(e,other,NULL);break;
    case 37:frameRunOutput=1;Original_G_RunFrame(a[1]);frameRunOutput=0;break;
    default:exit(74);
    }
}
