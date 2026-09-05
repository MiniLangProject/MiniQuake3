/* SPDX-License-Identifier: GPL-2.0-or-later
 * Item pickup, physics and flag lifecycle inputs for the shared native oracle.
 */
static const char *itemPlayerName(int n) {static const char *names[]={"","Alpha","Bravo","Charlie"};return n>=0 && n<4?names[n]:"Player";}
static void itemTargetUse(gentity_t *self,gentity_t *other,gentity_t *activator) {word(55);word(slotOf(self));word(slotOf(other));word(slotOf(activator));self->count++;}
static void itemState(void) {
    int i;word(52);word(teamgame.redStatus);word(teamgame.blueStatus);word(teamgame.flagStatus);string(configs[CS_FLAGSTATUS]);
    word(level.maxclients);word(g_weaponRespawn.integer);word(g_weaponTeamRespawn.integer);words(level.teamScores,TEAM_NUM_TEAMS);
    word(teamgame.redTakenTime);word(teamgame.blueTakenTime);words(&teamgame.last_flag_capture,1);word(teamgame.last_capture_team);
    for(i=0;i<3;i++){gclient_t *cl=g_entities[i].client;word(cl?1:0);if(cl){word(cl->pers.predictItemPickup);word(cl->pers.teamState.captures);word(cl->pers.teamState.flagrecovery);word(cl->pers.teamState.assists);word(cl->rewardTime);words(&cl->pers.teamState.lastreturnedflag,1);words(&cl->pers.teamState.flagsince,1);words(&cl->pers.teamState.lastfraggedcarrier,1);}}
    word(level.num_entities-64);for(i=64;i<level.num_entities;i++) {
        gentity_t *e=&g_entities[i];word(i);word(e->item?(int)(e->item-bg_itemlist):-1);
        word(e->teammaster?(int)(e->teammaster-g_entities):-1);word(e->teamchain?(int)(e->teamchain-g_entities):-1);
    }
}
static int itemAction(int *a) {
    int i;gentity_t *e=a[1]<0 || a[1]>=1024?NULL:&g_entities[a[1]],*result;vec3_t origin,velocity;
    switch(a[0]) {
    case 91:
        g_gametype.integer=a[1];level.time=a[2];level.previousTime=a[3];
        teamgame.redStatus=a[4];teamgame.blueStatus=a[5];teamgame.flagStatus=a[6];break;
    case 92:
        if(!e || a[2]<=0 || a[2]>=bg_numItems)return 0;if(a[1]>=level.num_entities){result=G_Spawn();if(result!=e)exit(76);}else G_InitGentity(e);e->item=&bg_itemlist[a[2]];e->classname=e->item->classname;e->flags=a[3];
        e->s.eType=ET_ITEM;e->s.modelindex=a[2];e->s.modelindex2=(a[3]&FL_DROPPED_ITEM)?1:0;e->physicsBounce=actionFloat(a[10]);
        VectorSet(e->r.mins,-ITEM_RADIUS,-ITEM_RADIUS,-ITEM_RADIUS);VectorSet(e->r.maxs,ITEM_RADIUS,ITEM_RADIUS,ITEM_RADIUS);e->r.contents=CONTENTS_TRIGGER;e->touch=Touch_Item;
        for(i=0;i<3;i++)e->s.pos.trBase[i]=e->r.currentOrigin[i]=actionFloat(a[4+i]);if(a[11])trap_LinkEntity(e);break;
    case 93:
        for(i=0;i<3;i++){origin[i]=actionFloat(a[2+i]);velocity[i]=actionFloat(a[5+i]);}result=LaunchItem(&bg_itemlist[a[1]],origin,velocity);word(53);word((int)(result-g_entities));break;
    case 94:result=Drop_Item(e,&bg_itemlist[a[2]],actionFloat(a[3]));word(53);word((int)(result-g_entities));break;
    case 95:RespawnItem(e);break;case 96:Team_CheckDroppedItem(e);break;
    case 97:result=Team_ResetFlag(a[1]);word(54);word(result?(int)(result-g_entities):-1);break;
    case 98:Team_ReturnFlag(a[1]);break;case 99:Team_FreeEntity(e);break;case 100:Team_DroppedFlagThink(e);break;
    case 101:Original_RunItem(e);break;case 102:
        switch(a[2]) {
        case 0:e->item=a[3]<0?NULL:&bg_itemlist[a[3]];break;case 1:e->physicsBounce=actionFloat(a[3]);break;
        case 2:e->s.groundEntityNum=a[3];break;case 3:e->clipmask=a[3];break;case 4:e->s.pos.trType=a[3];break;
        case 5:e->s.pos.trTime=a[3];break;case 6:e->flags=a[3];break;case 7:e->r.contents=a[3];break;
        case 8:e->teammaster=a[3]<0?NULL:&g_entities[a[3]];break;case 9:e->teamchain=a[3]<0?NULL:&g_entities[a[3]];break;
        case 10:e->team=a[3]?"group":NULL;break;case 11:e->r.ownerNum=a[3];break;case 12:e->nextthink=a[3];break;
        case 13:e->s.eFlags=a[3];break;case 14:e->r.svFlags=a[3];break;case 15:e->speed=actionFloat(a[3]);break;default:return 0;}break;
    case 103:
        for(i=0;i<3;i++) {
            if(a[2]==0)e->s.pos.trBase[i]=actionFloat(a[3+i]);else if(a[2]==1)e->s.apos.trBase[i]=actionFloat(a[3+i]);
            else if(a[2]==2)e->s.pos.trDelta[i]=actionFloat(a[3+i]);else if(a[2]==3)e->r.currentOrigin[i]=actionFloat(a[3+i]);else return 0;
        }break;
    case 104:runEntities();break;case 105:G_SpawnItem(e,&bg_itemlist[a[2]]);break;case 106:FinishSpawningItem(e);break;
    case 107:
        if(!e || a[1]>=MAX_CLIENTS)return 0;G_InitGentity(e);memset(&g_clients[a[1]],0,sizeof(g_clients[0]));e->client=&g_clients[a[1]];e->s.eType=ET_PLAYER;e->s.clientNum=e->client->ps.clientNum=a[1];
        e->client->sess.sessionTeam=a[2];e->client->ps.persistant[PERS_TEAM]=a[2];e->health=a[3];e->client->ps.stats[STAT_HEALTH]=a[3];e->client->ps.stats[STAT_MAX_HEALTH]=a[4];e->client->pers.predictItemPickup=a[5];e->client->pers.connected=a[6];Q_strncpyz(e->client->pers.netname,itemPlayerName(a[7]),sizeof(e->client->pers.netname));
        if(level.maxclients<a[1]+1)level.maxclients=a[1]+1;g_maxclients.integer=level.maxclients;break;
    case 108:
        if(!e || !e->client)return 0;switch(a[2]) {
        case 0:e->client->ps.ammo[a[4]]=a[3];break;case 1:e->client->ps.powerups[a[4]]=a[3];break;case 2:e->client->ps.stats[a[4]]=a[3];break;case 3:e->client->ps.persistant[a[4]]=a[3];break;
        case 4:e->client->pers.predictItemPickup=a[3];break;case 5:e->client->pers.connected=a[3];break;case 6:e->client->sess.sessionTeam=a[3];e->client->ps.persistant[PERS_TEAM]=a[3];break;
        case 7:e->client->pers.teamState.flagrecovery=a[3];break;case 8:e->client->pers.teamState.lastreturnedflag=actionFloat(a[3]);break;case 9:e->client->pers.teamState.captures=a[3];break;
        case 10:e->client->pers.teamState.assists=a[3];break;case 11:e->client->pers.teamState.flagsince=actionFloat(a[3]);break;case 12:e->client->pers.teamState.lastfraggedcarrier=actionFloat(a[3]);break;
        case 13:e->client->rewardTime=a[3];break;case 14:e->client->ps.viewangles[a[4]]=actionFloat(a[3]);break;case 15:e->health=a[3];break;case 16:e->client->ps.eFlags=a[3];break;case 17:e->s.number=a[3];break;case 18:e->inuse=a[3];break;default:return 0;}break;
    case 109:Touch_Item(e,&g_entities[a[2]],NULL);break;
    case 110:word(57);word(BG_CanItemBeGrabbed(g_gametype.integer,&e->s,&g_entities[a[2]].client->ps));break;
    case 111:
        switch(a[3]){case 0:i=Pickup_Powerup(e,&g_entities[a[2]]);break;case 1:i=Pickup_Holdable(e,&g_entities[a[2]]);break;case 2:i=Pickup_Ammo(e,&g_entities[a[2]]);break;case 3:i=Pickup_Weapon(e,&g_entities[a[2]]);break;case 4:i=Pickup_Health(e,&g_entities[a[2]]);break;case 5:i=Pickup_Armor(e,&g_entities[a[2]]);break;case 6:i=Pickup_Team(e,&g_entities[a[2]]);break;default:return 0;}word(58);word(a[3]);word(i);break;
    case 112:
        if(!e)return 0;switch(a[2]){case 0:e->count=a[3];break;case 1:e->wait=actionFloat(a[3]);break;case 2:e->random=actionFloat(a[3]);break;case 3:e->speed=actionFloat(a[3]);break;
        case 4:e->target=a[3]?"pickup_target":NULL;break;case 5:e->spawnflags=a[3];break;case 6:e->s.modelindex2=a[3];break;case 7:e->flags=a[3];break;case 8:e->r.contents=a[3];break;default:return 0;}break;
    case 113:
        switch(a[2]){case 0:level.time=a[3];break;case 1:g_weaponRespawn.integer=a[3];break;case 2:g_weaponTeamRespawn.integer=a[3];break;case 3:level.teamScores[a[4]]=a[3];break;
        case 4:teamgame.redTakenTime=a[3];break;case 5:teamgame.blueTakenTime=a[3];break;case 6:teamgame.last_flag_capture=actionFloat(a[3]);break;case 7:teamgame.last_capture_team=a[3];break;
        case 8:level.maxclients=g_maxclients.integer=a[3];break;case 9:level.warmupTime=a[3];break;default:return 0;}break;
    case 114:if(!e)return 0;if(a[1]>=level.num_entities){result=G_Spawn();if(result!=e)exit(76);}else G_InitGentity(e);e->targetname="pickup_target";e->use=itemTargetUse;break;
    default:return 0;
    }
    return 1;
}
