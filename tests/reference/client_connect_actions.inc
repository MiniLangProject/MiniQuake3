/* SPDX-License-Identifier: GPL-2.0-or-later
 * Session Cvar storage and observed engine/IP/bot boundaries around original code.
 */
#include "client_connect_fields.inc"
static char connectSessions[65][16384];
static int connectCvarIndex(const char *name){if(!Q_stricmp(name,"session"))return 64;return atoi(name+7);}
static void connectState(void){
    int i;word(210);word(level.time);word(g_gametype.integer);word(level.maxclients);
    word(level.newSession);word(g_teamAutoJoin.integer);word(g_maxGameClients.integer);
    word(level.follow1);word(level.follow2);word(level.numConnectedClients);word(level.numNonSpectatorClients);
    word(level.numPlayingClients);word(level.numVotingClients);words(level.numteamVotingClients,2);words(level.sortedClients,64);
    word(level.spawning);word(level.numSpawnVars);word(level.intermissiontime);word(level.intermissionQueued);words(level.teamScores,4);
    for(i=0;i<64;i++){
        gentity_t *ent=&g_entities[i];word(ent->client==&g_clients[i]);word(ent->inuse);word(ent->r.svFlags);
        connectClientState(&g_clients[i]);string(configs[CS_PLAYERS+i]);string(connectSessions[i]);
    }
    string(connectSessions[64]);string(configs[6]);string(configs[7]);
}
static void connectEvent(int kind,int arg,const char *key,const char *text){
    connectState();word(211);word(kind);word(arg);string(key);string(text);
}
static void connectCvarGet(const char *name,char *buffer,int size){
    int index=connectCvarIndex(name);if(index<0 || index>64)G_Error("unexpected session key");
    connectEvent(1,size,name,"");Q_strncpyz(buffer,connectSessions[index],size);
}
static void connectCvarSet(const char *name,const char *value){
    int index=connectCvarIndex(name);if(index<0 || index>64)G_Error("unexpected session key");
    connectEvent(2,-1,name,value);Q_strncpyz(connectSessions[index],value,sizeof(connectSessions[index]));
}
static void connectRequireComplete(const char *text){
    int values[7];char copy[1024];Q_strncpyz(copy,text,sizeof(copy));
    if(sscanf(copy,"%i %i %i %i %i %i %i",values,values+1,values+2,values+3,values+4,values+5,values+6)!=7)
        G_Error("incomplete session fixture would read uninitialized C locals");
}
static void runClientConnect(FILE *in){
    int q[12],c[11],a[5],i,count;char first[16384],second[16384];
    if(fread(q,4,12,in)!=12 || q[0]<0 || q[0]>64)exit(74);
    level.maxclients=g_maxclients.integer=q[0];g_gametype.integer=q[1];level.time=q[2];level.teamScores[1]=q[3];level.teamScores[2]=q[4];
    level.newSession=q[5];g_teamAutoJoin.integer=q[6];g_maxGameClients.integer=q[7];level.numNonSpectatorClients=q[8];level.intermissiontime=q[9];
    connectFilterResult=q[10];connectBotResult=q[11];level.spawning=qtrue;level.numSpawnVars=3;
    voteReadString(in,g_password.string,sizeof(g_password.string));voteReadString(in,connectSessions[64],sizeof(connectSessions[64]));
    for(i=0;i<64;i++){
        gclient_t *cl=&g_clients[i];gentity_t *ent=&g_entities[i];connectSeedClient(cl,i);
        if(fread(c,4,11,in)!=11)exit(74);
        ent->client=c[0]?cl:NULL;ent->inuse=c[1];ent->r.svFlags=c[2];cl->pers.connected=c[3];cl->sess.sessionTeam=c[4];
        cl->sess.spectatorState=c[5];cl->sess.spectatorClient=c[6];cl->sess.spectatorTime=c[7];cl->sess.wins=c[8];cl->sess.losses=c[9];cl->sess.teamLeader=c[10];
        voteReadString(in,cl->pers.netname,sizeof(cl->pers.netname));voteReadString(in,clientInfoValues[i],sizeof(clientInfoValues[i]));
        voteReadString(in,connectSessions[i],sizeof(connectSessions[i]));
        Com_sprintf(configs[CS_PLAYERS+i],sizeof(configs[CS_PLAYERS+i]),"before-player-%d",i);
    }
    if(fread(&count,4,1,in)!=1 || count<1 || count>10000)exit(74);
    for(i=0;i<count;i++){
        if(fread(a,4,5,in)!=5 || a[2]<0 || a[2]>=64)exit(74);
        level.time=a[1];voteReadString(in,first,sizeof(first));voteReadString(in,second,sizeof(second));
        switch(a[0]){
        case 1:{const char *result;Q_strncpyz(clientInfoValues[a[2]],first,sizeof(clientInfoValues[a[2]]));result=ClientConnect(a[2],a[3],a[4]);word(212);string(result);break;}
        case 2:G_InitSessionData(&g_clients[a[2]],first);break;
        case 3:Q_strncpyz(connectSessions[a[2]],first,sizeof(connectSessions[a[2]]));connectRequireComplete(first);G_ReadSessionData(&g_clients[a[2]]);break;
        case 4:G_WriteClientSessionData(&g_clients[a[2]]);break;
        case 5:Q_strncpyz(connectSessions[64],first,sizeof(connectSessions[64]));g_gametype.integer=a[3];G_InitWorldSession();break;
        case 6:G_WriteSessionData();break;
        case 7:BroadcastTeamChange(&g_clients[a[2]],a[3]);break;
        case 8:g_clients[a[2]].pers.connected=a[3];g_clients[a[2]].sess.sessionTeam=a[4];break;
        case 9:{int gametype=g_gametype.integer;reset(gametype,0);level.maxclients=g_maxclients.integer=a[3];break;}
        case 10:g_teamAutoJoin.integer=a[3];g_maxGameClients.integer=a[4];g_gametype.integer=atoi(first);break;
        case 11:Q_strncpyz(g_password.string,first,sizeof(g_password.string));break;
        case 12:connectFilterResult=a[3];connectBotResult=a[4];break;
        case 13:Original_ClientUserinfoChanged(a[2]);break;
        case 14:SetLeader(a[3],a[2]);break;
        default:exit(74);
        }
        connectState();
    }
}
