/* SPDX-License-Identifier: GPL-2.0-or-later
 * Input/effect observations around unchanged Baseq3 functions and actual CM PVS.
 */
void CM_AdjustAreaPortalState(int,int,qboolean);
static void teamStatusState(void){
    int i;word(170);word(level.time);word(level.previousTime);word(level.framenum);word(level.lastTeamLocationTime);
    for(i=0;i<MAX_CLIENTS;i++)word(g_clients[i].pers.teamState.location);
}
static void teamStatusBind(void){int i;for(i=0;i<MAX_CLIENTS;i++)g_entities[i].client=&g_clients[i];}
static void runTeamStatus(FILE *in){
    int q[5],c[9],a[3],count,i,j,kind,slot;float pos[3];gentity_t *tail=NULL,*loc;
    if(fread(q,4,5,in)!=5 || q[0]<0 || q[0]>64 || q[1]<0 || q[1]>64 || q[4]<0 || q[4]>958)exit(74);
    g_maxclients.integer=q[0];level.maxclients=q[1];level.lastTeamLocationTime=q[2];level.time=q[3];teamStatusBind();
    for(i=0;i<MAX_CLIENTS;i++){
        if(fread(c,4,9,in)!=9 || fread(pos,4,3,in)!=3)exit(74);
        g_entities[i].inuse=c[0];g_clients[i].pers.connected=c[1];g_clients[i].sess.sessionTeam=c[2];g_clients[i].pers.teamInfo=c[3];
        g_clients[i].pers.teamState.location=c[4];g_clients[i].ps.stats[STAT_HEALTH]=c[5];g_clients[i].ps.stats[STAT_ARMOR]=c[6];
        g_clients[i].ps.weapon=c[7];g_entities[i].s.powerups=c[8];VectorCopy(pos,g_entities[i].r.currentOrigin);
    }
    if(fread(level.sortedClients,4,64,in)!=64)exit(74);
    for(i=0;i<q[4];i++){
        loc=&g_entities[64+i];if(fread(&loc->health,4,1,in)!=1 || fread(loc->r.currentOrigin,4,3,in)!=3)exit(74);
        loc->inuse=qtrue;loc->classname="target_location";
        if(tail)tail->nextTrain=loc;else level.locationHead=loc;tail=loc;
    }
    level.num_entities=64+q[4];
    if(fread(&count,4,1,in)!=1 || count<1 || count>10000)exit(74);
    for(j=0;j<count;j++){
        if(fread(&kind,4,1,in)!=1)exit(74);
        switch(kind){
        case 1:if(fread(&level.time,4,1,in)!=1)exit(74);CheckTeamStatus();break;
        case 2:case 3:
            if(fread(&slot,4,1,in)!=1 || slot<0 || slot>=64)exit(74);
            if(kind==2)TeamplayInfoMessage(&g_entities[slot]);
            else{loc=Team_GetLocation(&g_entities[slot]);word(173);word(loc?(int)(loc-g_entities):-1);}
            break;
        case 4:
            if(fread(&g_password.modificationCount,4,1,in)!=1)exit(74);
            voteReadString(in,g_password.string,sizeof(g_password.string));CheckCvars();break;
        case 5:
            if(fread(a,4,3,in)!=3)exit(74);CM_AdjustAreaPortalState(a[0],a[1],a[2]);break;
        case 6:
            if(fread(a,4,1,in)!=1)exit(74);frameRunOutput=1;Original_G_RunFrame(a[0]);frameRunOutput=0;break;
        case 7:reset(0,0);teamStatusBind();break;
        case 8:
            if(fread(&slot,4,1,in)!=1 || slot<0 || slot>=64 || fread(pos,4,3,in)!=3)exit(74);
            VectorCopy(pos,g_entities[slot].r.currentOrigin);break;
        default:exit(74);
        }
        teamStatusState();
    }
}
