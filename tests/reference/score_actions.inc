/* SPDX-License-Identifier: GPL-2.0-or-later
 * Score test inputs and transport/map-transition observations only.
 */
#include <stddef.h>
/* The original rank reset overruns its two-element voting array. Guard the
 * native layout whose observable effects this profile explicitly supports. */
typedef char scoreSpawningLayout[(offsetof(level_locals_t,spawning)==offsetof(level_locals_t,numteamVotingClients)+2*sizeof(int))?1:-1];
typedef char scoreSpawnVarsLayout[(offsetof(level_locals_t,numSpawnVars)==offsetof(level_locals_t,numteamVotingClients)+3*sizeof(int))?1:-1];
static const char *scoreName(int index) {
    static const char *names[]={"","Player","^1Red","^4Blue","Name with spaces","Quote\"Player","01234567890123456789012345678901234"};
    return names[index];
}
static const char *scoreReason(int index) {static const char *reasons[]={"Fraglimit hit.","Timelimit hit.","Capturelimit hit.","Test exit."};return reasons[index];}
static void scoreTransition(int kind) {
    if(!scoreOutput)G_Error("unported match transition");
    word(43);word(kind);word(level.time);word(level.intermissionQueued);word(level.intermissiontime);word(level.exitTime);word(level.readyToExit);
    word(level.numConnectedClients);word(level.numPlayingClients);
    /* Deliberate test callback mutation, not a substitute BeginIntermission. */
    if(g_entities[1022].count==1 && kind==1)level.intermissiontime=level.time;
    if(g_entities[1022].count==2 && kind==2)level.intermissiontime=0;
}
static void scoreState(void) {
    int i;gclient_t *cl;gentity_t *e;word(44);
    word(level.maxclients);word(g_maxclients.integer);word(level.follow1);word(level.follow2);word(level.numConnectedClients);word(level.numNonSpectatorClients);
    word(level.numPlayingClients);word(level.numVotingClients);word(level.intermissiontime);word(g_timelimit.integer);word(g_fraglimit.integer);word(g_capturelimit.integer);
    word(level.readyToExit);word(level.exitTime);word(level.startTime);words(level.teamScores,4);words(level.numteamVotingClients,2);words(level.sortedClients,64);
    for(i=0;i<64;i++) {
        cl=&g_clients[i];e=&g_entities[i];words(&cl->ps,117);
        word(cl->pers.connected);word(cl->sess.sessionTeam);word(cl->sess.spectatorState);word(cl->sess.spectatorClient);word(cl->sess.spectatorTime);
        word(cl->pers.enterTime);word(cl->accuracy_hits);word(cl->accuracy_shots);word(cl->readyToExit);string(cl->pers.netname);
        word(e->client==cl);word(e->s.number);word(e->r.svFlags);word(e->s.powerups);word(e->r.singleClient);
    }
    word(level.num_entities-64+1);
    for(i=64;i<level.num_entities;i++){word(i);word(g_entities[i].r.singleClient);}word(1022);word(g_entities[1022].r.singleClient);
}
static int scoreAction(int *a) {
    int i,j;gentity_t *e=a[1]<0?NULL:&g_entities[a[1]];gclient_t *cl=a[1]<0 || a[1]>=64?NULL:&g_clients[a[1]];vec3_t origin;
    switch(a[0]) {
    case 60:
        G_InitGentity(e);memset(cl,0,sizeof(*cl));e->client=cl;e->s.eType=ET_PLAYER;cl->ps.clientNum=a[1];
        cl->pers.connected=a[2];cl->sess.sessionTeam=a[3];cl->ps.persistant[PERS_SCORE]=a[4];cl->ps.ping=a[5];
        cl->sess.spectatorState=a[6];cl->sess.spectatorClient=a[7];cl->sess.spectatorTime=a[8];cl->pers.enterTime=a[9];
        cl->accuracy_hits=a[10];cl->accuracy_shots=a[11];cl->readyToExit=a[12];e->r.svFlags=a[13];
        Q_strncpyz(cl->pers.netname,scoreName(a[14]),sizeof(cl->pers.netname));break;
    case 61:
        if(a[2]>=100 && a[2]<116){cl->ps.persistant[a[2]-100]=a[3];break;}
        switch(a[2]) {
        case 0:cl->pers.connected=a[3];break;case 1:cl->sess.sessionTeam=a[3];break;case 2:cl->ps.ping=a[3];break;
        case 3:cl->sess.spectatorState=a[3];break;case 4:cl->sess.spectatorClient=a[3];break;case 5:cl->sess.spectatorTime=a[3];break;
        case 6:cl->pers.enterTime=a[3];break;case 7:cl->accuracy_hits=a[3];break;case 8:cl->accuracy_shots=a[3];break;
        case 9:cl->readyToExit=a[3];break;case 10:e->r.svFlags=a[3];break;case 11:e->s.powerups=a[3];break;
        case 12:cl->ps.clientNum=a[3];break;case 13:Q_strncpyz(cl->pers.netname,scoreName(a[3]),sizeof(cl->pers.netname));break;
        case 14:e->client=a[3]?cl:NULL;break;case 15:e->s.number=a[3];break;case 16:e->r.singleClient=a[3];break;
        default:return 0;}break;
    case 62:
        if(a[2]>=100 && a[2]<104){level.teamScores[a[2]-100]=a[3];break;}
        if(a[2]>=200 && a[2]<264){level.sortedClients[a[2]-200]=a[3];break;}
        switch(a[2]) {
        case 0:level.maxclients=a[3];break;case 1:g_maxclients.integer=a[3];break;case 2:level.intermissiontime=a[3];break;
        case 3:level.warmupTime=a[3];break;case 4:level.intermissionQueued=a[3];break;case 5:level.time=a[3];break;
        case 6:level.startTime=a[3];break;case 7:g_timelimit.integer=a[3];break;case 8:g_fraglimit.integer=a[3];break;
        case 9:g_capturelimit.integer=a[3];break;case 10:level.readyToExit=a[3];break;case 11:level.exitTime=a[3];break;
        case 12:g_gametype.integer=a[3];break;case 13:level.numConnectedClients=a[3];break;case 14:level.numPlayingClients=a[3];break;
        case 15:g_entities[1022].count=a[3];break;case 16:level.spawning=a[3];break;
        case 17:
            level.numSpawnVars=a[3];for(i=0;i<a[3];i++){level.spawnVars[i][0]="scoretest";level.spawnVars[i][1]="1";}break;
        case 18:level.numSpawnVarChars=a[3];break;default:return 0;}break;
    case 63:CalculateRanks();break;case 64:Cmd_Score_f(e);break;case 65:SendScoreboardMessageToAllClients();break;
    case 66:case 67:
        for(i=0;i<3;i++)origin[i]=actionFloat(a[3+i]);
        if(a[0]==66)AddScore(e,origin,a[2]);else ScorePlum(e,origin,a[2]);break;
    case 68:i=a[1];j=a[2];word(45);word(SortRanks(&i,&j));break;
    case 69:qsort(level.sortedClients,a[1],sizeof(int),SortRanks);break;
    case 70:word(46);word(ScoreIsTied());break;case 71:CheckExitRules();break;case 72:LogExit(scoreReason(a[1]));break;
    case 73:CheckIntermissionExit();break;case 74:runEntities();break;
    case 75:for(i=72;i<level.num_entities;i++)if(g_entities[i].inuse)G_FreeEntity(&g_entities[i]);break;
    default:return 0;
    }
    return 1;
}
