/* SPDX-License-Identifier: GPL-2.0-or-later
 * Inputs to unchanged native vote handlers; engine command parsing is external.
 */
static void voteCommandState(void){
    int i;word(180);word(level.time);word(g_allowVote.integer);word(level.maxclients);
    word(level.voteTime);word(level.voteExecuteTime);word(level.voteYes);word(level.voteNo);word(level.numVotingClients);
    for(i=0;i<2;i++){word(level.teamVoteTime[i]);word(level.teamVoteYes[i]);word(level.teamVoteNo[i]);word(level.numteamVotingClients[i]);}
    string(level.voteString);string(level.voteDisplayString);string(level.teamVoteString[0]);string(level.teamVoteString[1]);
    for(i=0;i<MAX_CLIENTS;i++){
        word(g_entities[i].inuse);word(g_clients[i].pers.connected);word(g_clients[i].sess.sessionTeam);
        word(g_clients[i].sess.teamLeader);word(g_clients[i].ps.eFlags);word(g_clients[i].pers.voteCount);
        word(g_clients[i].pers.teamVoteCount);word(g_clients[i].ps.clientNum);string(g_clients[i].pers.netname);
    }
    for(i=8;i<20;i++)string(configs[i]);
}
static void runVoteCommands(FILE *in){
    int q[16],client[8],action[4],i,j,count;if(fread(q,4,16,in)!=16)exit(74);
    if(q[0]<0 || q[0]>MAX_CLIENTS)exit(74);
    level.maxclients=q[0];level.time=q[1];g_allowVote.integer=q[2];
    level.voteTime=q[3];level.voteExecuteTime=q[4];level.voteYes=q[5];level.voteNo=q[6];level.numVotingClients=q[7];
    for(i=0;i<2;i++){level.teamVoteTime[i]=q[8+i*4];level.teamVoteYes[i]=q[9+i*4];level.teamVoteNo[i]=q[10+i*4];level.numteamVotingClients[i]=q[11+i*4];}
    voteReadString(in,level.voteString,sizeof(level.voteString));voteReadString(in,level.voteDisplayString,sizeof(level.voteDisplayString));
    for(i=0;i<2;i++)voteReadString(in,level.teamVoteString[i],sizeof(level.teamVoteString[i]));
    voteReadString(in,voteNextmap,sizeof(voteNextmap));
    for(i=0;i<MAX_CLIENTS;i++){
        if(fread(client,4,8,in)!=8)exit(74);
        g_entities[i].client=&g_clients[i];g_entities[i].inuse=client[0];
        g_clients[i].pers.connected=client[1];g_clients[i].sess.sessionTeam=client[2];g_clients[i].sess.teamLeader=client[3];
        g_clients[i].ps.eFlags=client[4];g_clients[i].pers.voteCount=client[5];g_clients[i].pers.teamVoteCount=client[6];g_clients[i].ps.clientNum=client[7];
        voteReadString(in,g_clients[i].pers.netname,sizeof(g_clients[i].pers.netname));
    }
    for(i=8;i<20;i++)Com_sprintf(configs[i],sizeof(configs[i]),"before-%d",i);
    if(fread(&count,4,1,in)!=1 || count<1 || count>10000)exit(74);
    for(i=0;i<count;i++){
        if(fread(action,4,4,in)!=4)exit(74);
        level.time=action[1];cmd_argc=action[3];
        if(cmd_argc<0 || cmd_argc>64 || action[2]<0 || action[2]>=MAX_CLIENTS)exit(74);
        for(j=0;j<cmd_argc;j++){voteReadString(in,voteArgvStorage[j],sizeof(voteArgvStorage[j]));cmd_argv[j]=voteArgvStorage[j];}
        switch(action[0]){
        case 1:Cmd_CallVote_f(&g_entities[action[2]]);break;
        case 2:Cmd_Vote_f(&g_entities[action[2]]);break;
        case 3:Cmd_CallTeamVote_f(&g_entities[action[2]]);break;
        case 4:Cmd_TeamVote_f(&g_entities[action[2]]);break;
        case 5:CheckVote();break;
        case 6:CheckTeamVote(action[2]);break;
        case 7:if(cmd_argc!=2)exit(74);g_clients[action[2]].pers.connected=atoi(cmd_argv[0]);g_clients[action[2]].sess.sessionTeam=atoi(cmd_argv[1]);break;
        case 8:if(cmd_argc!=1)exit(74);Q_strncpyz(voteNextmap,cmd_argv[0],sizeof(voteNextmap));break;
        case 9:if(cmd_argc!=1)exit(74);g_allowVote.integer=atoi(cmd_argv[0]);break;
        default:exit(74);
        }
        voteCommandState();
    }
}
