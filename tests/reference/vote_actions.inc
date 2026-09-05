/* SPDX-License-Identifier: GPL-2.0-or-later
 * Binary inputs and snapshots around unchanged Baseq3 vote/leader functions.
 */
static void voteReadString(FILE *in,char *text,int capacity){
    int size;if(fread(&size,4,1,in)!=1 || size<0 || size>=capacity)exit(74);
    memset(text,0,capacity);if(size && fread(text,1,size,in)!=size)exit(74);
}
static void voteState(void){
    int i;word(160);word(level.framenum);word(level.previousTime);word(level.time);
    word(level.voteTime);word(level.voteExecuteTime);word(level.voteYes);word(level.voteNo);word(level.numVotingClients);
    for(i=0;i<2;i++){word(level.teamVoteTime[i]);word(level.teamVoteYes[i]);word(level.teamVoteNo[i]);word(level.numteamVotingClients[i]);}
    string(level.voteString);string(level.teamVoteString[0]);string(level.teamVoteString[1]);
    for(i=0;i<MAX_CLIENTS;i++){
        word(g_clients[i].pers.connected);word(g_clients[i].sess.sessionTeam);word(g_clients[i].sess.teamLeader);word(g_entities[i].r.svFlags);
        string(g_clients[i].pers.netname);
    }
    string(configs[CS_VOTE_TIME]);string(configs[CS_TEAMVOTE_TIME]);string(configs[CS_TEAMVOTE_TIME+1]);
}
static void runVotes(FILE *in){
    int q[15],client[4],action[4],i,count;if(fread(q,4,15,in)!=15)exit(74);
    if(q[0]<0 || q[0]>MAX_CLIENTS)exit(74);
    level.maxclients=g_maxclients.integer=q[0];level.time=q[1];
    level.voteTime=q[2];level.voteExecuteTime=q[3];level.voteYes=q[4];level.voteNo=q[5];level.numVotingClients=q[6];
    for(i=0;i<2;i++){level.teamVoteTime[i]=q[7+i*4];level.teamVoteYes[i]=q[8+i*4];level.teamVoteNo[i]=q[9+i*4];level.numteamVotingClients[i]=q[10+i*4];}
    voteReadString(in,level.voteString,sizeof(level.voteString));
    for(i=0;i<2;i++)voteReadString(in,level.teamVoteString[i],sizeof(level.teamVoteString[i]));
    for(i=0;i<MAX_CLIENTS;i++){
        if(fread(client,4,4,in)!=4)exit(74);
        g_clients[i].pers.connected=client[0];g_clients[i].sess.sessionTeam=client[1];g_clients[i].sess.teamLeader=client[2];g_entities[i].r.svFlags=client[3];
        voteReadString(in,g_clients[i].pers.netname,sizeof(g_clients[i].pers.netname));
    }
    strcpy(configs[CS_VOTE_TIME],"vote-before");strcpy(configs[CS_TEAMVOTE_TIME],"red-before");strcpy(configs[CS_TEAMVOTE_TIME+1],"blue-before");
    if(fread(&count,4,1,in)!=1 || count<1 || count>10000)exit(74);
    for(i=0;i<count;i++){
        if(fread(action,4,4,in)!=4)exit(74);
        if(action[0]!=6)level.time=action[1];
        switch(action[0]){
        case 1:CheckVote();break;
        case 2:CheckTeamVote(action[2]);break;
        case 3:if(action[3]<0 || action[3]>=MAX_CLIENTS)exit(74);SetLeader(action[2],action[3]);break;
        case 4:CheckTeamLeader(action[2]);break;
        case 5:PrintTeam(action[2],"print \"Team notice.\n\"");break;
        case 6:frameRunOutput=1;Original_G_RunFrame(action[1]);frameRunOutput=0;break;
        default:exit(74);
        }
        voteState();
    }
}
