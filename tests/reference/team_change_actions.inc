/* SPDX-License-Identifier: GPL-2.0-or-later
 * Real original team changes and disconnect with complete client snapshots.
 * Only engine delivery and the separate movement/end-frame callbacks are hosts.
 */
static void teamChangeEntity(gentity_t *e){
    words(&e->s,52);word(e->inuse);word(e->client?e->client-g_clients:-1);string(e->classname);
    word(e->freetime);word(e->neverFree);word(e->eventTime);word(e->freeAfterEvent);word(e->unlinkAfterEvent);
    word(e->health);word(e->flags);word(e->takedamage);word(e->clipmask);word(e->physicsObject);words(&e->physicsBounce,1);
    word(e->nextthink);word(e->timestamp);word(e->count);word(e->item?e->item-bg_itemlist:-1);
    word(e->think!=NULL);word(e->die!=NULL);word(e->touch!=NULL);word(e->pain!=NULL);
    word(e->enemy?e->enemy-g_entities:-1);word(e->parent?e->parent-g_entities:-1);
    word(e->r.contents);word(e->r.svFlags);word(e->r.ownerNum);word(e->r.singleClient);word(e->r.linked);word(e->r.linkcount);
    words(e->r.mins,3);words(e->r.maxs,3);words(e->r.currentOrigin,3);words(e->r.currentAngles,3);words(e->r.absmin,3);words(e->r.absmax,3);
}
static void teamChangeState(void){
    int i;word(220);word(level.time);word(g_gametype.integer);word(level.maxclients);word(g_teamForceBalance.integer);word(g_maxGameClients.integer);
    word(level.num_entities);word(level.follow1);word(level.follow2);word(level.numConnectedClients);word(level.numNonSpectatorClients);word(level.numPlayingClients);word(level.numVotingClients);
    words(level.numteamVotingClients,2);words(level.sortedClients,64);words(level.teamScores,4);word(level.spawning);word(level.numSpawnVars);
    word(level.intermissiontime);word(level.intermissionQueued);word(level.warmupTime);word(level.bodyQueIndex);
    for(i=0;i<8;i++)word(level.bodyQue[i]?level.bodyQue[i]-g_entities:-1);
    word(teamgame.redStatus);word(teamgame.blueStatus);words(itemRegistered,256);
    for(i=0;i<64;i++){connectClientState(&g_clients[i]);string(configs[CS_PLAYERS+i]);}
    for(i=0;i<level.num_entities;i++)teamChangeEntity(&g_entities[i]);
    string(configs[6]);string(configs[7]);string(configs[CS_FLAGSTATUS]);
}
static void teamChangeEvent(int kind,int arg,const char *text){
    if(!teamChangeReady)return;
    teamChangeState();word(221);word(kind);word(arg);string(text);
}
static void runTeamChanges(FILE *in){
    int q[13],c[28],a[4],i,j,count;char request[16384];
    if(fread(q,4,13,in)!=13 || q[0]<0 || q[0]>64)exit(74);
    level.maxclients=g_maxclients.integer=q[0];g_gametype.integer=q[1];level.time=q[2];g_teamForceBalance.integer=q[3];g_maxGameClients.integer=q[4];
    level.numNonSpectatorClients=q[5];level.intermissiontime=q[6];level.warmupTime=q[7];level.teamScores[1]=q[8];level.teamScores[2]=q[9];
    level.sortedClients[0]=q[10];level.sortedClients[1]=q[11];g_blood.integer=q[12];level.spawning=qtrue;level.numSpawnVars=3;g_inactivity.integer=0;
    clientSpawnSpot(64,"info_player_deathmatch",0,0,64,10,20,30,0);g_entities[64].spawnflags=1;
    clientSpawnSpot(65,"info_player_deathmatch",1000,0,64,-15,180,1,0);
    clientSpawnSpot(66,"info_player_deathmatch",-500,300,96,45,-90,5,0);
    clientSpawnSpot(67,"team_CTF_redplayer",100,200,80,1,91,2,0);
    clientSpawnSpot(68,"team_CTF_redspawn",110,210,90,3,93,4,0);
    clientSpawnSpot(69,"team_CTF_blueplayer",-100,-200,100,5,-95,6,0);
    clientSpawnSpot(70,"team_CTF_bluespawn",-110,-210,110,7,-97,8,0);
    clientSpawnSpot(71,"info_player_intermission",25,35,512,9,135,11,0);
    for(i=64;i<72;i++)g_entities[i].target=NULL;
    level.num_entities=72;InitBodyQue();
    for(i=80;i<82;i++){
        gentity_t *ent=&g_entities[i];G_InitGentity(ent);ent->item=BG_FindItemForPowerup(i==80?PW_REDFLAG:PW_BLUEFLAG);
        ent->classname=ent->item->classname;ent->s.eType=ET_ITEM;ent->s.modelindex=ent->item-bg_itemlist;
        VectorSet(ent->s.pos.trBase,400,(i-80)*100,100);VectorCopy(ent->s.pos.trBase,ent->r.currentOrigin);
        VectorSet(ent->r.mins,-15,-15,-15);VectorSet(ent->r.maxs,15,15,15);ent->r.contents=CONTENTS_TRIGGER;hostLink(ent);
    }
    level.num_entities=82;
    for(i=0;i<64;i++){
        gentity_t *ent=&g_entities[i];gclient_t *cl=&g_clients[i];if(fread(c,4,28,in)!=28)exit(74);
        if(c[1])G_InitGentity(ent);ent->client=c[0]?cl:NULL;ent->inuse=c[1];ent->classname="player";ent->r.svFlags=c[2];
        cl->pers.connected=c[3];cl->sess.sessionTeam=c[4];cl->sess.spectatorState=c[5];cl->sess.spectatorClient=c[6];cl->sess.spectatorTime=c[7];
        cl->sess.wins=c[8];cl->sess.losses=c[9];cl->sess.teamLeader=c[10];ent->health=cl->ps.stats[STAT_HEALTH]=c[11];cl->ps.pm_type=c[12];cl->ps.pm_flags=c[13];
        cl->ps.clientNum=c[14];ent->s.clientNum=c[15];ent->flags=c[16];cl->switchTeamTime=c[17];cl->ps.weapon=ent->s.weapon=c[18];cl->ps.ammo[c[18]]=c[19];
        cl->ps.weaponstate=c[20];cl->pers.cmd.weapon=c[21];cl->ps.stats[STAT_WEAPONS]=(1<<c[18])|(1<<c[21]);
        for(j=1;j<PW_NUM_POWERUPS;j++)if(c[22]&(1<<j))cl->ps.powerups[j]=c[23];
        cl->ps.groundEntityNum=ent->s.groundEntityNum=c[24];cl->ps.persistant[PERS_SCORE]=c[26];cl->ps.eFlags=c[27];cl->ps.persistant[PERS_TEAM]=c[4];
        cl->pers.maxHealth=cl->ps.stats[STAT_MAX_HEALTH]=100;cl->pers.teamState.state=1;cl->pers.teamState.location=7;
        cl->pers.enterTime=70;
        VectorSet(cl->ps.origin,3000+i*100,0,128);VectorCopy(cl->ps.origin,ent->s.origin);VectorCopy(cl->ps.origin,ent->s.pos.trBase);VectorCopy(cl->ps.origin,ent->r.currentOrigin);
        VectorSet(cl->ps.velocity,1.25,-2.5,3.75);VectorSet(cl->ps.viewangles,0,35,0);VectorCopy(cl->ps.viewangles,ent->s.angles);
        VectorSet(ent->r.mins,-15,-15,-24);VectorSet(ent->r.maxs,15,15,32);ent->r.contents=CONTENTS_BODY;ent->takedamage=qtrue;ent->s.modelindex=9;
        voteReadString(in,cl->pers.netname,sizeof(cl->pers.netname));voteReadString(in,clientInfoValues[i],sizeof(clientInfoValues[i]));
        Com_sprintf(configs[CS_PLAYERS+i],sizeof(configs[0]),"before-%d",i);if(c[25] && c[1])hostLink(ent);
    }
    teamChangeReady=1;if(fread(&count,4,1,in)!=1 || count<1)exit(74);
    for(i=0;i<count;i++){
        if(fread(a,4,4,in)!=4 || a[2]<0 || a[2]>=64)exit(74);level.time=a[1];voteReadString(in,request,sizeof(request));
        switch(a[0]){
        case 1:SetTeam(&g_entities[a[2]],request);break;
        case 2:cmd_argc=a[3];if(cmd_argc<0 || cmd_argc>64)exit(74);for(j=0;j<cmd_argc;j++)cmd_argv[j]=j==1?request:"team";Cmd_Team_f(&g_entities[a[2]]);break;
        case 3:StopFollowing(&g_entities[a[2]]);break;
        case 4:ClientDisconnect(a[2]);break;
        case 5:g_entities[a[2]].health=g_clients[a[2]].ps.stats[STAT_HEALTH]=a[3];g_clients[a[2]].ps.pm_type=PM_DEAD;break;
        case 6:if(a[3]<0 || a[3]>=64)exit(74);g_entities[a[2]].client=&g_clients[a[3]];break;
        default:exit(74);
        }
        teamChangeState();
    }
}
