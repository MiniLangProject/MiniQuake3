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
    if(followOutput){word(level.warmupModificationCount);word(level.restarted);word(g_warmup.integer);word(g_warmup.modificationCount);string(configs[5]);}
    if(intermissionOutput){
        words(level.intermission_origin,3);words(level.intermission_angle,3);word(g_maxclients.integer);word(level.readyToExit);word(level.exitTime);
        word(g_timelimit.integer);word(g_fraglimit.integer);string(level.changemap);string(configs[CS_INTERMISSION]);
        for(i=0;i<65;i++)string(intermissionSessions[i]);
    }
    if(clientCommandsOutput){
        word(g_cheats.integer);word(g_dedicated.integer);word(g_allowVote.integer);
        string(level.voteString);string(level.voteDisplayString);
        word(level.voteTime);word(level.voteExecuteTime);word(level.voteYes);word(level.voteNo);
        for(i=0;i<2;i++)string(level.teamVoteString[i]);
        words(level.teamVoteTime,2);words(level.teamVoteYes,2);words(level.teamVoteNo,2);
        for(i=8;i<=21;i++)string(configs[i]);
        for(i=0;i<64;i++)string(clientInfoValues[i]);
        string(voteNextmap);word(level.locationHead?level.locationHead-g_entities:-1);
        for(i=0;i<level.num_entities;i++){
            string(g_entities[i].message);word(g_entities[i].nextTrain?g_entities[i].nextTrain-g_entities:-1);
        }
    }
    if(weaponOutput)weaponState();
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
    level.sortedClients[0]=q[10];level.sortedClients[1]=q[11];g_blood.integer=q[12];level.spawning=qtrue;level.numSpawnVars=3;g_inactivity.integer=0;g_warmup.integer=20;
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
    /* Ordinary commands execute after map spawning. G_SpawnString still scans
       numSpawnVars when spawning is false, so no fake null spawn pairs remain. */
    if(clientCommandsOutput){level.spawning=qfalse;level.numSpawnVars=0;}
    if(weaponOutput)weaponConfigure();
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
        case 7:{int found=ClientNumberFromString(&g_entities[a[2]],request);word(224);word(found);break;}
        case 8:cmd_argc=a[3];if(cmd_argc<0 || cmd_argc>64)exit(74);for(j=0;j<cmd_argc;j++)cmd_argv[j]=j==1?request:"follow";Cmd_Follow_f(&g_entities[a[2]]);break;
        case 9:Cmd_FollowCycle_f(&g_entities[a[2]],a[3]);break;
        case 10:Original_AddTournamentPlayer();break;
        case 11:RemoveTournamentLoser();break;
        case 12:RemoveTournamentWinner();break;
        case 13:AdjustTournamentScores();break;
        case 14:Original_CheckTournament();break;
        case 15:{usercmd_t cmd;memset(&cmd,0,sizeof(cmd));cmd.serverTime=a[3];cmd.buttons=atoi(request);SpectatorThink(&g_entities[a[2]],&cmd);break;}
        case 16:{char clean[1024];SanitizeString(request,clean);word(223);string(clean);break;}
        case 17:level.numPlayingClients=a[3];break;
        case 18:g_warmup.integer=a[3];g_warmup.modificationCount=atoi(request);break;
        case 19:Original_MoveClientToIntermission(&g_entities[a[2]]);break;
        case 20:Original_BeginIntermission();break;
        case 21:Original_ExitLevel();break;
        case 22:CheckExitRules();break;
        case 23:CheckIntermissionExit();break;
        case 24:CalculateRanks();break;
        case 25:g_maxclients.integer=a[3];break;
        case 26:g_clients[a[2]].readyToExit=a[3]!=0;break;
        case 27:level.restarted=a[3]!=0;level.changemap=!strcmp(request,"<null>")?NULL:_strdup(request);break;
        case 28:level.intermissionQueued=a[3];break;
        case 29:Original_ClientSpawn(&g_entities[a[2]]);break;
        case 30:g_entities[71].inuse=a[3]!=0;break;
        case 31:g_entities[71].target=request[0]?_strdup(request):NULL;g_entities[70].targetname=a[3]?_strdup(request):NULL;break;
        case 32:level.intermissiontime=a[3];break;
        case 33:{
            gentity_t *ent=&g_entities[a[2]];gclient_t *cl=ent->client;
            VectorSet(level.intermission_origin,-12.5,33.25,99.75);VectorSet(level.intermission_angle,8.5,-179.25,11.5);
            ent->s.eFlags=0x712;ent->s.eType=12;ent->s.modelindex=17;ent->s.loopSound=45;ent->s.event=123;ent->s.eventParm=46;
            ent->s.otherEntityNum=12;ent->s.frame=19;ent->s.powerups=0x1234;ent->r.contents=0x02000002;
            cl->ps.eFlags=0x10123;cl->ps.powerups[0]=37;cl->ps.powerups[15]=2147483647;cl->ps.loopSound=333;cl->ps.externalEvent=77;
            cl->ps.eventSequence=9;cl->ps.events[0]=3;cl->ps.events[1]=4;cl->ps.eventParms[0]=5;cl->ps.eventParms[1]=6;break;
        }
        case 34:Original_ClientBegin(a[2]);break;
        case 35:respawn(&g_entities[a[2]]);break;
        case 36:g_timelimit.integer=a[3];g_fraglimit.integer=atoi(request);break;
        case 40:
            cmd_argc=a[3];if(cmd_argc<0 || cmd_argc>64)exit(74);
            if(cmd_argc)cmd_argv[0]=request;
            for(j=1;j<cmd_argc;j++){voteReadString(in,voteArgvStorage[j],sizeof(voteArgvStorage[j]));cmd_argv[j]=voteArgvStorage[j];}
            ClientCommand(a[2]);break;
        case 41:g_cheats.integer=a[3];g_dedicated.integer=atoi(request);break;
        case 42:{
            gentity_t *ent=&g_entities[82];G_InitGentity(ent);ent->classname="target_location";
            VectorCopy(g_entities[a[2]].r.currentOrigin,ent->s.origin);VectorCopy(ent->s.origin,ent->r.currentOrigin);
            ent->count=a[3];ent->message=_strdup(request);ent->nextTrain=NULL;level.locationHead=ent;level.num_entities=83;break;
        }
        case 43:g_allowVote.integer=a[3];Q_strncpyz(voteNextmap,request,sizeof(voteNextmap));break;
        case 44:{int enemy=atoi(request);if(enemy < -1 || enemy>=MAX_GENTITIES)exit(74);g_clients[a[2]].lastkilled_client=a[3];g_entities[a[2]].enemy=enemy==-1?NULL:&g_entities[enemy];break;}
        case 45:g_clients[a[2]].lasthurt_mod=a[3];g_clients[a[2]].rewardTime=atoi(request);break;
        case 46:VectorSet(g_entities[a[2]].s.origin,(float)a[3],(float)a[3],(float)a[3]);break;
        default:if(!weaponOutput)exit(74);weaponAction(a,request);break;
        }
        teamChangeState();
    }
}
