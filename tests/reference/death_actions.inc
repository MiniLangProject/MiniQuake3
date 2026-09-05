/* SPDX-License-Identifier: GPL-2.0-or-later
 * Death lifecycle inputs and state added to the shared combat oracle.
 */
static void deathState(void) {
    int i;gclient_t *cl;gentity_t *e;word(51);word(g_blood.integer);
    for(i=0;i<64;i++) {
        cl=&g_clients[i];e=&g_entities[i];word(cl->lastkilled_client);word(cl->respawnTime);word(cl->rewardTime);word(cl->lastKillTime);
        word(cl->pers.cmd.weapon);words(&cl->pers.teamState.lastfraggedcarrier,1);word(cl->pers.teamState.fragcarrier);
        word(cl->pers.teamState.carrierdefense);word(cl->pers.teamState.basedefense);word(cl->hook?(int)(cl->hook-g_entities):-1);
        word(e->die==player_die?1:e->die==body_die?2:e->die?3:0);word(e->enemy?(int)(e->enemy-g_entities):-1);
    }
}
static int deathAction(int *a) {
    int i;gentity_t *e=a[1]<0 || a[1]>=1024?NULL:&g_entities[a[1]];gclient_t *cl=a[1]<0 || a[1]>=64?NULL:&g_clients[a[1]];
    switch(a[0]) {
    case 80:
        if(!e || !cl)return 0;G_InitGentity(e);memset(cl,0,sizeof(*cl));e->client=cl;e->s.eType=ET_PLAYER;e->s.number=a[1];cl->ps.clientNum=a[1];
        cl->pers.connected=a[2];cl->sess.sessionTeam=a[3];cl->ps.persistant[PERS_TEAM]=a[3];e->health=a[4];cl->ps.stats[STAT_HEALTH]=a[4];
        e->takedamage=qtrue;e->die=player_die;VectorSet(e->r.mins,-15,-15,-24);VectorSet(e->r.maxs,15,15,32);e->r.contents=CONTENTS_BODY;
        Q_strncpyz(cl->pers.netname,scoreName(a[5]),sizeof(cl->pers.netname));break;
    case 81:
        if(!e)return 0;
        switch(a[2]) {
        case 0:e->s.weapon=a[3];break;case 1:cl->ps.weaponstate=a[3];break;case 2:cl->pers.cmd.weapon=a[3];break;case 3:cl->ps.stats[STAT_WEAPONS]=a[3];break;
        case 4:cl->ps.ammo[a[4]]=a[3];break;case 5:cl->ps.powerups[a[4]]=a[3];break;case 6:cl->ps.pm_type=a[3];break;
        case 7:cl->lastKillTime=a[3];break;case 8:cl->pers.teamState.lasthurtcarrier=(float)a[3];break;case 9:e->s.powerups=a[3];break;
        case 10:e->s.loopSound=a[3];break;case 11:e->s.angles[a[4]]=actionFloat(a[3]);break;case 12:cl->ps.legsAnim=a[3];break;
        case 13:cl->ps.torsoAnim=a[3];break;case 14:e->flags=a[3];break;case 15:e->r.svFlags=a[3];break;case 16:e->s.number=a[3];break;
        case 17:e->s.clientNum=a[3];break;case 18:cl->ps.generic1=a[3];break;case 19:cl->hook=a[3]<0?NULL:&g_entities[a[3]];break;
        case 20:e->parent=a[3]<0?NULL:&g_entities[a[3]];break;case 21:g_blood.integer=a[3];break;case 22:e->health=a[3];break;
        case 23:cl->respawnTime=a[3];break;case 24:cl->rewardTime=a[3];break;case 25:cl->ps.eFlags=a[3];break;
        default:return 0;}break;
    case 82:
        player_die(e,a[2]<0?NULL:&g_entities[a[2]],a[3]<0?NULL:&g_entities[a[3]],a[4],a[5]);break;
    case 83:Team_FragBonuses(e,a[2]<0?NULL:&g_entities[a[2]],a[3]<0?NULL:&g_entities[a[3]]);break;
    case 84:TossClientItems(e);break;case 85:CheckAlmostCapture(e,a[2]<0?NULL:&g_entities[a[2]]);break;
    case 86:CheckAlmostScored(e,a[2]<0?NULL:&g_entities[a[2]]);break;case 87:respawn(e);break;
    case 88:
        if(!e)return 0;if(a[1]>=level.num_entities){e=G_Spawn();if(e!=&g_entities[a[1]])exit(76);}else G_InitGentity(e);e->classname=(char*)actionName(a[2]);e->flags=a[3];
        for(i=0;i<3;i++){e->s.origin[i]=actionFloat(a[4+i]);e->r.currentOrigin[i]=actionFloat(a[7+i]);}break;
    case 89:
        for(i=0;i<3;i++){e->s.pos.trBase[i]=actionFloat(a[2+i]);e->r.currentOrigin[i]=actionFloat(a[5+i]);if(e->client)e->client->ps.origin[i]=actionFloat(a[8+i]);}break;
    case 90:InitBodyQue();break;
    default:return 0;
    }
    return 1;
}
