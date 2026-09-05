/* SPDX-License-Identifier: GPL-2.0-or-later */
void Original_CheckTournament(void);
static void runTournament(FILE *in){
    int q[12],i;if(fread(q,4,12,in)!=12)exit(74);
    g_gametype.integer=q[0];level.numPlayingClients=q[1];level.warmupTime=q[2];level.time=q[3];
    g_warmup.integer=q[4];g_warmup.modificationCount=q[5];level.warmupModificationCount=q[6];
    level.maxclients=q[7];g_maxclients.integer=q[7];tournamentPromote=q[10];
    for(i=0;i<q[8];i++){g_clients[i].pers.connected=CON_CONNECTED;g_clients[i].sess.sessionTeam=TEAM_RED;}
    for(;i<q[8]+q[9];i++){g_clients[i].pers.connected=CON_CONNECTED;g_clients[i].sess.sessionTeam=TEAM_BLUE;}
    Original_CheckTournament();word(140);word(level.warmupTime);word(level.warmupModificationCount);word(level.restarted);word(level.numPlayingClients);
}
