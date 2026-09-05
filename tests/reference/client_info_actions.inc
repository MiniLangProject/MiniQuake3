/* SPDX-License-Identifier: GPL-2.0-or-later
 * Original userinfo/name/team functions, including actual vote/overlay callers.
 */
static void clientInfoState(void){
    int i;word(200);word(level.time);word(g_gametype.integer);word(level.maxclients);
    word(level.teamScores[TEAM_RED]);word(level.teamScores[TEAM_BLUE]);word(level.lastTeamLocationTime);
    for(i=0;i<2;i++){word(level.teamVoteTime[i]);word(level.teamVoteYes[i]);word(level.teamVoteNo[i]);word(level.numteamVotingClients[i]);string(level.teamVoteString[i]);}
    for(i=0;i<MAX_CLIENTS;i++){
        gclient_t *cl=&g_clients[i];gentity_t *ent=&g_entities[i];
        word(ent->client!=NULL);word(ent->inuse);word(ent->r.svFlags);words(&cl->ps,117);
        word(cl->pers.connected);word(cl->sess.sessionTeam);word(cl->sess.spectatorState);
        word(cl->pers.localClient);word(cl->pers.predictItemPickup);word(cl->pers.maxHealth);word(cl->pers.teamInfo);
        word(cl->sess.wins);word(cl->sess.losses);word(cl->sess.teamLeader);word(cl->pers.pmoveFixed);
        word(cl->pers.voteCount);word(cl->pers.teamVoteCount);word(cl->pers.teamState.location);word(ent->s.powerups);
        string(cl->pers.netname);string(configs[CS_PLAYERS+i]);
    }
    for(i=8;i<20;i++)string(configs[i]);
}
static void clientInfoEvent(int kind,int arg,const char *text){
    clientInfoState();word(201);word(kind);word(arg);string(text);
}
static void runClientInfo(FILE *in){
    int q[6],fields[16],a[4],i,count;char first[16384],second[16384],name[4096];
    if(fread(q,4,6,in)!=6 || q[0]<0 || q[0]>MAX_CLIENTS)exit(74);
    level.maxclients=g_maxclients.integer=q[0];g_gametype.integer=q[1];level.time=q[2];
    level.teamScores[TEAM_RED]=q[3];level.teamScores[TEAM_BLUE]=q[4];level.lastTeamLocationTime=q[5];
    g_allowVote.integer=1;level.numteamVotingClients[0]=level.numteamVotingClients[1]=2;
    for(i=0;i<MAX_CLIENTS;i++){
        gclient_t *cl=&g_clients[i];gentity_t *ent=&g_entities[i];
        if(fread(fields,4,16,in)!=16 || fread(&cl->ps,4,117,in)!=117)exit(74);
        ent->client=fields[0]?cl:NULL;ent->inuse=fields[1];ent->r.svFlags=fields[2];
        cl->pers.connected=fields[3];cl->sess.sessionTeam=fields[4];cl->sess.spectatorState=fields[5];
        cl->pers.localClient=fields[6];cl->pers.predictItemPickup=fields[7];cl->pers.maxHealth=fields[8];cl->pers.teamInfo=fields[9];
        cl->sess.wins=fields[10];cl->sess.losses=fields[11];cl->sess.teamLeader=fields[12];cl->pers.pmoveFixed=fields[13];
        cl->pers.voteCount=fields[14];cl->pers.teamVoteCount=fields[15];cl->pers.teamState.location=70+i;ent->s.powerups=i%4;
        voteReadString(in,cl->pers.netname,sizeof(cl->pers.netname));voteReadString(in,clientInfoValues[i],sizeof(clientInfoValues[i]));
        Com_sprintf(configs[CS_PLAYERS+i],sizeof(configs[CS_PLAYERS+i]),"before-player-%d",i);
    }
    for(i=8;i<20;i++)Com_sprintf(configs[i],sizeof(configs[i]),"before-%d",i);
    if(fread(&count,4,1,in)!=1 || count<1 || count>10000)exit(74);
    for(i=0;i<count;i++){
        if(fread(a,4,4,in)!=4 || a[2]<0 || a[2]>=MAX_CLIENTS)exit(74);
        level.time=a[1];voteReadString(in,first,sizeof(first));voteReadString(in,second,sizeof(second));
        if(a[0]>=2 && a[0]<=6){
            word(202);word(a[0]);
            switch(a[0]){
            case 2:if(a[3]<1 || a[3]>sizeof(name))exit(74);memset(name,0,sizeof(name));ClientCleanName(first,name,a[3]);string(name);break;
            case 3:string(Info_ValueForKey(a[3]&1?NULL:first,a[3]&2?NULL:second));break;
            case 4:word(Info_Validate(first));break;
            case 5:word(PickTeam(a[3]));break;
            case 6:word(TeamLeader(a[3]));break;
            }
            continue;
        }
        switch(a[0]){
        case 1:Q_strncpyz(clientInfoValues[a[2]],first,sizeof(clientInfoValues[a[2]]));Original_ClientUserinfoChanged(a[2]);break;
        case 7:SetLeader(a[3],a[2]);break;
        case 8:cmd_argc=3;cmd_argv[0]="callteamvote";cmd_argv[1]=first;cmd_argv[2]=second;Cmd_CallTeamVote_f(&g_entities[a[2]]);break;
        case 9:cmd_argc=2;cmd_argv[0]="teamvote";cmd_argv[1]=first;Cmd_TeamVote_f(&g_entities[a[2]]);break;
        case 10:CheckTeamVote(a[3]);break;
        case 11:g_clients[a[2]].pers.connected=a[3];g_clients[a[2]].sess.sessionTeam=atoi(first);break;
        case 12:CheckTeamStatus();break;
        default:exit(74);
        }
        clientInfoState();
    }
}
