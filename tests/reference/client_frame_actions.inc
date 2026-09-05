static void frameDie(gentity_t *self,gentity_t *inflictor,gentity_t *attacker,int damage,int mod) {
    word(80);word(3);word((int)(self-g_entities));word(damage);word(mod);
}
static void seedFramePS(playerState_t *ps,int base) {
    int i;memset(ps,0,sizeof(*ps));
    ps->commandTime=base+1;ps->pm_type=PM_NORMAL;ps->bobCycle=base+2;ps->pm_flags=base+3;ps->pm_time=base+4;
    VectorSet(ps->origin,10.25f,-20.5f,30.75f);VectorSet(ps->velocity,1.5f,-2.25f,3.125f);
    ps->weaponTime=base+5;ps->gravity=800;ps->speed=320;ps->delta_angles[0]=base+6;ps->delta_angles[1]=base+7;ps->delta_angles[2]=base+8;
    ps->groundEntityNum=ENTITYNUM_NONE;ps->legsTimer=base+9;ps->legsAnim=LEGS_IDLE;ps->torsoTimer=base+10;ps->torsoAnim=TORSO_STAND;
    ps->movementDir=base&7;VectorSet(ps->grapplePoint,4.5f,5.5f,6.5f);ps->eFlags=base+11;
    ps->clientNum=base%64;ps->weapon=WP_RAILGUN;ps->weaponstate=WEAPON_READY;VectorSet(ps->viewangles,15.25f,125.5f,-7.75f);
    ps->viewheight=DEFAULT_VIEWHEIGHT;ps->damageEvent=base+12;ps->damageYaw=base+13;ps->damagePitch=base+14;ps->damageCount=base+15;
    for(i=0;i<MAX_STATS;i++)ps->stats[i]=base+100+i;
    for(i=0;i<MAX_PERSISTANT;i++)ps->persistant[i]=base+200+i;
    for(i=0;i<MAX_POWERUPS;i++)ps->powerups[i]=0;
    for(i=0;i<MAX_WEAPONS;i++)ps->ammo[i]=base+300+i;
    ps->generic1=base+16;ps->loopSound=base+17;ps->jumppad_ent=base+18;ps->ping=base+19;
    ps->pmove_framecount=base+20;ps->jumppad_frame=base+21;ps->entityEventSequence=ps->eventSequence=0;
}
static void frameFinal(gentity_t *ent) {
    int i;gclient_t *cl=ent->client;word(81);words(&cl->ps,117);words(&ent->s,52);
    word(ent->health);word(ent->damage);word(ent->flags);word(ent->pain_debounce_time);word(ent->waterlevel);word(ent->watertype);
    word(cl->damage_blood);word(cl->damage_armor);word(cl->damage_knockback);words(cl->damage_from,3);word(cl->damage_fromWorld);
    word(cl->airOutTime);word(cl->sess.spectatorState);word(cl->sess.spectatorClient);word(level.num_entities);word(g_smoothClients.integer);
    for(i=64;i<level.num_entities;i++) {
        gentity_t *t=&g_entities[i];word(i);words(&t->s,52);word(t->r.svFlags);word(t->r.singleClient);
        word(t->freeAfterEvent);word(t->eventTime);words(t->r.currentOrigin,3);
    }
}
static void runClientFrame(FILE *in) {
    int scenario;while(fread(&scenario,4,1,in)==1) {
        gentity_t *ent=&g_entities[0];gclient_t *cl=&g_clients[0],*follow=&g_clients[1];
        reset(0,0);clientFrameOutput=1;level.time=5000;level.follow1=1;level.follow2=2;level.snd_fry=77;
        g_smoothClients.integer=0;g_entities[ENTITYNUM_WORLD].s.number=ENTITYNUM_WORLD;
        memset(ent,0,sizeof(*ent));seedFramePS(&cl->ps,1000);ent->client=cl;ent->inuse=qtrue;ent->s.number=0;
        ent->s.eType=ET_PLAYER;ent->s.eFlags=0x13579;ent->r.currentOrigin[0]=10.25f;ent->r.currentOrigin[1]=-20.5f;ent->r.currentOrigin[2]=30.75f;
        ent->health=91;ent->damage=2;ent->takedamage=qtrue;ent->die=frameDie;ent->pain_debounce_time=4000;
        cl->pers.connected=CON_CONNECTED;cl->sess.sessionTeam=TEAM_FREE;cl->lastCmdTime=4500;cl->airOutTime=17000;
        cl->ps.clientNum=0;cl->ps.stats[STAT_HEALTH]=91;cl->ps.stats[STAT_ARMOR]=25;cl->ps.stats[STAT_MAX_HEALTH]=100;
        cl->ps.powerups[PW_NONE]=4999;cl->ps.powerups[PW_QUAD]=5000;cl->ps.powerups[PW_HASTE]=5001;
        seedFramePS(&follow->ps,2000);follow->ps.clientNum=1;follow->pers.connected=CON_CONNECTED;follow->sess.sessionTeam=TEAM_RED;
        switch(scenario) {
        case 1:cl->damage_blood=7;cl->damage_armor=3;cl->damage_knockback=9;VectorSet(cl->damage_from,1,2,3);break;
        case 2:cl->damage_blood=300;cl->damage_armor=100;cl->damage_knockback=11;cl->damage_fromWorld=qtrue;ent->flags=FL_GODMODE;break;
        case 3:cl->ps.pm_type=PM_DEAD;cl->damage_blood=7;cl->damage_armor=3;break;
        case 4:cl->noclip=qtrue;cl->airOutTime=-20;ent->waterlevel=3;ent->watertype=CONTENTS_LAVA;break;
        case 5:cl->airOutTime=4999;ent->waterlevel=3;ent->damage=2;break;
        case 6:ent->waterlevel=2;ent->watertype=CONTENTS_LAVA|CONTENTS_SLIME;break;
        case 7:ent->waterlevel=2;ent->watertype=CONTENTS_LAVA;cl->ps.powerups[PW_BATTLESUIT]=6000;break;
        case 8:cl->ps.eventSequence=5;cl->ps.entityEventSequence=3;cl->ps.events[0]=EV_FIRE_WEAPON;cl->ps.events[1]=EV_ITEM_PICKUP;cl->ps.eventParms[0]=7;cl->ps.eventParms[1]=9;cl->ps.externalEvent=EV_PAIN;cl->ps.externalEventParm=44;break;
        case 9:g_smoothClients.integer=1;cl->ps.commandTime=4567;break;
        case 10:level.intermissiontime=4500;cl->damage_blood=7;cl->damage_armor=3;break;
        case 11:cl->sess.sessionTeam=TEAM_SPECTATOR;cl->sess.spectatorState=SPECTATOR_FOLLOW;cl->sess.spectatorClient=1;cl->ps.eFlags=EF_VOTED;follow->ps.eFlags=EF_TEAMVOTED|0x100;break;
        case 12:cl->sess.sessionTeam=TEAM_SPECTATOR;cl->sess.spectatorState=SPECTATOR_FOLLOW;cl->sess.spectatorClient=-1;cl->ps.eFlags=EF_TEAMVOTED;follow->ps.eFlags=EF_VOTED|0x200;break;
        case 13:cl->sess.sessionTeam=TEAM_SPECTATOR;cl->sess.spectatorState=SPECTATOR_FOLLOW;cl->sess.spectatorClient=1;follow->pers.connected=CON_CONNECTING;break;
        case 14:cl->sess.sessionTeam=TEAM_SPECTATOR;cl->sess.spectatorState=SPECTATOR_SCOREBOARD;cl->ps.pm_flags=PMF_FOLLOW;break;
        case 15:cl->sess.sessionTeam=TEAM_SPECTATOR;cl->sess.spectatorState=SPECTATOR_FREE;cl->ps.pm_flags=PMF_SCOREBOARD|PMF_FOLLOW;break;
        case 16:cl->sess.sessionTeam=TEAM_SPECTATOR;cl->sess.spectatorState=SPECTATOR_FOLLOW;cl->sess.spectatorClient=-3;cl->ps.pm_flags=PMF_SCOREBOARD;break;
        }
        if(scenario>=100) {
            int k=scenario-100,x=(k*37)%31-15,y=(k*53)%37-18,z=(k*71)%41-20;
            if(!x&&!y&&!z)x=1;
            cl->damage_blood=(k*29)%330;cl->damage_armor=(k*11)%90;cl->damage_knockback=(k*7)%220;
            VectorSet(cl->damage_from,x,y,z);ent->pain_debounce_time=(k&1)?5000:4999;if((k%7)==0)ent->flags|=FL_GODMODE;
        }
        Original_ClientEndFrame(ent);frameFinal(ent);
    }
}
