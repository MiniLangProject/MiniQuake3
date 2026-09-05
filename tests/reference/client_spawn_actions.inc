/* SPDX-License-Identifier: GPL-2.0-or-later
 * Deterministic host boundaries around the verbatim Baseq3 ClientSpawn.
 */
void Original_ClientSpawn(gentity_t *ent);
void Original_ClientBegin(int clientNum);
static void clientSpawnUse(gentity_t *self,gentity_t *other,gentity_t *activator) {
    word(60);word(4);word(other?(int)(other-g_entities):-1);
    activator->client->ps.stats[STAT_WEAPONS]|=1<<WP_RAILGUN;
}
static void clientSpawnSpot(int slot,const char *classname,float x,float y,float z,float pitch,float yaw,float roll,int flags) {
    gentity_t *e=&g_entities[slot];G_InitGentity(e);e->classname=(char*)classname;e->flags=flags;e->target="spawn_target";
    VectorSet(e->s.origin,x,y,z);VectorSet(e->s.angles,pitch,yaw,roll);
}
static void clientSpawnOccupant(int slot,float x,float y,float z) {
    gentity_t *e=&g_entities[slot];gclient_t *cl=&g_clients[slot];G_InitGentity(e);memset(cl,0,sizeof(*cl));e->client=cl;
    VectorSet(e->s.origin,x,y,z);VectorSet(e->r.currentOrigin,x,y,z);VectorSet(e->r.mins,-15,-15,-24);VectorSet(e->r.maxs,15,15,32);
    e->r.contents=CONTENTS_BODY;e->takedamage=qfalse;hostLink(e);
}
static void clientSpawnState(gentity_t *e) {
    gclient_t *cl=e->client;
    word(70);words(&cl->ps,117);words(&e->s,52);
    word(e->health);word(e->flags);word(e->takedamage);word(e->inuse);word(e->r.contents);word(e->clipmask);
    word(e->waterlevel);word(e->watertype);word(e->r.linked);word(e->die==player_die);string(e->classname);
    words(e->r.mins,3);words(e->r.maxs,3);words(e->r.currentOrigin,3);
    word(cl->sess.sessionTeam);words(cl->pers.cmd.angles,3);word(cl->pers.cmd.serverTime);word(cl->pers.cmd.buttons);
    word(cl->pers.cmd.weapon);word(cl->pers.cmd.forwardmove);word(cl->pers.cmd.rightmove);word(cl->pers.cmd.upmove);
    word(cl->accuracy_hits);word(cl->accuracy_shots);word(cl->pers.connected);word(cl->pers.localClient);word(cl->pers.initialSpawn);
    word(cl->pers.predictItemPickup);word(cl->pers.maxHealth);word(cl->pers.enterTime);word(cl->pers.teamState.state);
    word(cl->pers.teamState.location);word(cl->pers.teamState.captures);word(cl->pers.teamState.basedefense);
    word(cl->pers.teamState.carrierdefense);word(cl->pers.teamState.flagrecovery);word(cl->pers.teamState.fragcarrier);
    word(cl->pers.teamState.assists);words(&cl->pers.teamState.lasthurtcarrier,1);words(&cl->pers.teamState.lastreturnedflag,1);
    words(&cl->pers.teamState.flagsince,1);words(&cl->pers.teamState.lastfraggedcarrier,1);
    word(cl->sess.spectatorTime);word(cl->sess.spectatorState);word(cl->sess.spectatorClient);word(cl->sess.wins);
    word(cl->sess.losses);word(cl->sess.teamLeader);word(cl->lastkilled_client);word(cl->respawnTime);
    word(cl->inactivityTime);word(cl->airOutTime);word(cl->readyToExit);word(cl->noclip);word(cl->lastCmdTime);
    word(cl->buttons);word(cl->oldbuttons);word(cl->latched_buttons);words(cl->oldOrigin,3);word(cl->damage_armor);
    word(cl->damage_blood);word(cl->damage_knockback);words(cl->damage_from,3);word(cl->damage_fromWorld);
    word(cl->accurateCount);word(cl->inactivityWarning);word(cl->rewardTime);word(cl->lastKillTime);word(cl->fireHeld);
    word(cl->hook?1:0);word(cl->switchTeamTime);word(cl->timeResidual);
}
static gentity_t *configureClientSpawn(FILE *in) {
    int q[32],i,scenario;gentity_t *e,*target;gclient_t *cl;
    if(fread(q,4,32,in)!=32)exit(74);scenario=q[0];
    g_gametype.integer=q[1];level.time=q[8];level.intermissiontime=q[7];g_inactivity.integer=q[9];
    clientSpawnSpot(64,"info_player_deathmatch",0,0,64,10,20,30,0);g_entities[64].spawnflags=1;
    clientSpawnSpot(65,"info_player_deathmatch",1000,0,64,-15,180,1,0);
    clientSpawnSpot(66,"info_player_deathmatch",-500,300,96,45,-90,5,0);
    clientSpawnSpot(67,"team_CTF_redplayer",100,200,80,1,91,2,0);
    clientSpawnSpot(68,"team_CTF_redspawn",110,210,90,3,93,4,0);
    clientSpawnSpot(69,"team_CTF_blueplayer",-100,-200,100,5,-95,6,0);
    clientSpawnSpot(70,"team_CTF_bluespawn",-110,-210,110,7,-97,8,0);
    clientSpawnSpot(71,"info_player_intermission",25,35,512,9,135,11,0);
    if(scenario==1)g_entities[64].flags=FL_NO_HUMANS;
    if(scenario==2)g_entities[64].flags=FL_NO_BOTS;
    if(scenario==3){clientSpawnOccupant(1,0,0,64);clientSpawnOccupant(2,1000,0,64);clientSpawnOccupant(3,-500,300,96);}
    target=&g_entities[80];G_InitGentity(target);target->classname="target_give";target->targetname="spawn_target";target->use=clientSpawnUse;
    level.num_entities=81;

    e=&g_entities[0];G_InitGentity(e);cl=&g_clients[0];memset(cl,0,sizeof(*cl));e->client=cl;e->r.svFlags=q[3]?SVF_BOT:0;e->s.eFlags=q[12]|EF_KAMIKAZE;
    cl->sess.sessionTeam=q[2];cl->pers.localClient=q[4];cl->pers.initialSpawn=q[5];cl->pers.teamState.state=q[6];
    cl->pers.connected=CON_CONNECTED;cl->pers.predictItemPickup=qtrue;cl->pers.maxHealth=88;cl->pers.enterTime=77;
    cl->pers.teamState.location=4;cl->pers.teamState.captures=5;cl->pers.teamState.basedefense=6;cl->pers.teamState.carrierdefense=7;
    cl->pers.teamState.flagrecovery=8;cl->pers.teamState.fragcarrier=9;cl->pers.teamState.assists=10;
    cl->pers.teamState.lasthurtcarrier=11.5f;cl->pers.teamState.lastreturnedflag=12.5f;cl->pers.teamState.flagsince=13.5f;cl->pers.teamState.lastfraggedcarrier=14.5f;
    cl->sess.spectatorTime=15;cl->sess.spectatorState=SPECTATOR_FOLLOW;cl->sess.spectatorClient=2;cl->sess.wins=16;cl->sess.losses=17;cl->sess.teamLeader=qtrue;
    Q_strncpyz(cl->pers.netname,"SpawnTester",sizeof(cl->pers.netname));
    cl->ps.eFlags=q[11];cl->ps.ping=q[13];cl->ps.eventSequence=q[14];for(i=0;i<MAX_PERSISTANT;i++)cl->ps.persistant[i]=q[15]+i;
    VectorSet(cl->ps.origin,actionFloat(q[22]),actionFloat(q[23]),actionFloat(q[24]));
    cl->accuracy_hits=q[20];cl->accuracy_shots=q[21];
    cl->readyToExit=cl->noclip=qtrue;cl->lastCmdTime=101;cl->buttons=102;cl->oldbuttons=103;cl->latched_buttons=104;VectorSet(cl->oldOrigin,1,2,3);
    cl->damage_armor=105;cl->damage_blood=106;cl->damage_knockback=107;VectorSet(cl->damage_from,4,5,6);cl->damage_fromWorld=qtrue;
    cl->accurateCount=108;cl->lastkilled_client=109;cl->lasthurt_client=110;cl->lasthurt_mod=111;cl->respawnTime=112;cl->inactivityTime=113;
    cl->inactivityWarning=qtrue;cl->rewardTime=114;cl->airOutTime=115;cl->lastKillTime=116;cl->fireHeld=qtrue;cl->hook=&g_entities[90];cl->switchTeamTime=117;cl->timeResidual=118;
    memset(&clientSpawnCmd,0,sizeof(clientSpawnCmd));clientSpawnCmd.angles[0]=q[16];clientSpawnCmd.angles[1]=q[17];clientSpawnCmd.angles[2]=q[18];clientSpawnCmd.weapon=q[19];clientSpawnCmd.buttons=0x1234;
    clientSpawnCmd.forwardmove=-17;clientSpawnCmd.rightmove=33;clientSpawnCmd.upmove=-4;
    Com_sprintf(clientSpawnUserinfo,sizeof(clientSpawnUserinfo),"\\handicap\\%d",q[10]);
    if(q[28]>0){int size=q[28]-1;if(size>=sizeof(clientSpawnUserinfo) || fread(clientSpawnUserinfo,1,size,in)!=size)exit(74);clientSpawnUserinfo[size]=0;}
    level.maxclients=4;g_maxclients.integer=4;
    if(q[26])hostLink(e);
    if(q[27]) {
        gentity_t *other=&g_entities[1];gclient_t *otherClient=&g_clients[1];
        if(!other->inuse)G_InitGentity(other);other->client=otherClient;
        otherClient->pers.connected=CON_CONNECTED;otherClient->sess.sessionTeam=TEAM_FREE;
        otherClient->ps.persistant[PERS_SCORE]=9;Q_strncpyz(otherClient->pers.netname,"Other",sizeof(otherClient->pers.netname));
    }
    return e;
}
static void clientBeginState(gentity_t *e) {
    int i;clientSpawnState(e);word(71);word(level.follow1);word(level.follow2);word(level.numConnectedClients);
    word(level.numNonSpectatorClients);word(level.numPlayingClients);word(level.numVotingClients);
    words(level.numteamVotingClients,2);for(i=0;i<4;i++)word(level.sortedClients[i]);
    word(level.spawning);word(level.numSpawnVars);word(level.num_entities);
    words(&g_entities[81].s,52);word(g_entities[81].inuse);word(g_entities[81].freeAfterEvent);
    word(g_entities[81].eventTime);string(g_entities[81].classname);
}
static void runClientSpawn(FILE *in) {
    gentity_t *e=configureClientSpawn(in);Original_ClientSpawn(e);clientSpawnState(e);
}
static void runClientBegin(FILE *in) {
    gentity_t *e=configureClientSpawn(in);Original_ClientBegin((int)(e-g_entities));clientBeginState(e);
}
