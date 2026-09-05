static void seedThinkPS(playerState_t *ps) {
    int i;memset(ps,0,sizeof(*ps));ps->commandTime=1000;ps->pm_type=PM_NORMAL;
    VectorSet(ps->origin,0,0,64);VectorClear(ps->velocity);ps->gravity=800;ps->speed=320;
    ps->groundEntityNum=ENTITYNUM_NONE;ps->clientNum=0;ps->weapon=WP_MACHINEGUN;ps->weaponstate=WEAPON_READY;
    ps->viewheight=DEFAULT_VIEWHEIGHT;ps->stats[STAT_HEALTH]=100;ps->stats[STAT_MAX_HEALTH]=100;
    ps->stats[STAT_ARMOR]=25;ps->stats[STAT_WEAPONS]=(1<<WP_GAUNTLET)|(1<<WP_MACHINEGUN);
    for(i=0;i<MAX_WEAPONS;i++)ps->ammo[i]=10;ps->ammo[WP_GAUNTLET]=-1;
}
static void thinkFinal(gentity_t *ent) {
    int i;gclient_t *cl=ent->client;word(91);words(&cl->ps,117);words(&ent->s,52);
    words(ent->r.currentOrigin,3);words(ent->r.mins,3);words(ent->r.maxs,3);
    word(ent->r.linked);word(ent->r.linkcount);word(ent->health);word(ent->flags);word(ent->eventTime);
    word(ent->waterlevel);word(ent->watertype);word(ent->pain_debounce_time);
    word(cl->pers.cmd.serverTime);words(cl->pers.cmd.angles,3);word(cl->pers.cmd.buttons);
    word(cl->pers.cmd.weapon);word(cl->pers.cmd.forwardmove);word(cl->pers.cmd.rightmove);word(cl->pers.cmd.upmove);
    word(cl->lastCmdTime);word(cl->buttons);word(cl->oldbuttons);word(cl->latched_buttons);
    words(cl->oldOrigin,3);word(cl->inactivityTime);word(cl->inactivityWarning);word(cl->timeResidual);
    word(cl->fireHeld);word(cl->hook?(int)(cl->hook-g_entities):-1);word(level.num_entities);
    word(cl->damage_armor);word(cl->damage_blood);word(cl->damage_knockback);words(cl->damage_from,3);word(cl->damage_fromWorld);
    word(cl->lasthurt_client);word(cl->lasthurt_mod);
    for(i=64;i<level.num_entities;i++) {gentity_t *e=&g_entities[i];word(i);words(&e->s,52);words(e->r.currentOrigin,3);
        words(e->r.mins,3);words(e->r.maxs,3);word(e->r.contents);word(e->r.linked);word(e->count);word(e->flags);string(e->classname);}
}
static void configureThink(int scenario,gentity_t **result) {
    gentity_t *ent=&g_entities[0];gclient_t *cl=&g_clients[0];reset(0,0);clientThinkOutput=1;
    level.time=1050;g_gravity.value=800;g_speed.value=320;g_dmflags.integer=0;g_inactivity.integer=0;
    g_smoothClients.integer=0;g_forcerespawn.integer=0;g_synchronousClients.integer=0;pmove_fixed.integer=0;pmove_msec.integer=8;
    memset(ent,0,sizeof(*ent));seedThinkPS(&cl->ps);ent->client=cl;ent->inuse=qtrue;ent->s.number=0;ent->s.eType=ET_PLAYER;
    ent->r.contents=CONTENTS_BODY;VectorSet(ent->r.mins,-15,-15,-24);VectorSet(ent->r.maxs,15,15,32);
    VectorCopy(cl->ps.origin,ent->r.currentOrigin);ent->health=100;ent->takedamage=qtrue;
    cl->pers.connected=CON_CONNECTED;cl->sess.sessionTeam=TEAM_FREE;cl->respawnTime=900;cl->inactivityTime=60000;
    memset(&clientSpawnCmd,0,sizeof(clientSpawnCmd));clientSpawnCmd.serverTime=1050;clientSpawnCmd.weapon=WP_MACHINEGUN;clientThinkGauntletHit=0;
    switch(scenario) {
    case 1:clientSpawnCmd.forwardmove=80;clientSpawnCmd.rightmove=-20;clientSpawnCmd.upmove=20;clientSpawnCmd.buttons=BUTTON_ATTACK;break;
    case 2:level.intermissiontime=1;cl->ps.eFlags=EF_TALK|EF_FIRING;cl->buttons=BUTTON_USE_HOLDABLE;clientSpawnCmd.buttons=BUTTON_USE_HOLDABLE|BUTTON_ATTACK;break;
    case 3:cl->sess.sessionTeam=TEAM_SPECTATOR;cl->sess.spectatorState=SPECTATOR_FOLLOW;clientSpawnCmd.buttons=BUTTON_ATTACK;break;
    case 4:cl->sess.sessionTeam=TEAM_SPECTATOR;cl->sess.spectatorState=SPECTATOR_FREE;clientSpawnCmd.forwardmove=100;clientSpawnCmd.angles[YAW]=8192;break;
    case 5:cl->pers.connected=CON_CONNECTING;break;
    case 6:clientSpawnCmd.serverTime=1000;break;
    case 7:g_inactivity.integer=30;cl->inactivityTime=20000;level.time=10052;clientSpawnCmd.serverTime=10052;cl->ps.commandTime=10002;break;
    case 8:g_inactivity.integer=30;cl->inactivityTime=10050;level.time=10051;clientSpawnCmd.serverTime=10051;cl->ps.commandTime=10001;break;
    case 9:cl->timeResidual=950;cl->ps.powerups[PW_REGEN]=12000;ent->health=80;clientSpawnCmd.serverTime=1250;level.time=1250;break;
    case 10:cl->noclip=qtrue;cl->ps.powerups[PW_HASTE]=1;clientSpawnCmd.forwardmove=64;clientSpawnCmd.serverTime=1200;level.time=1200;break;
    case 11:ent->flags=FL_FORCE_GESTURE;break;
    case 12:g_smoothClients.integer=1;clientSpawnCmd.forwardmove=32;break;
    case 13:pmove_fixed.integer=1;pmove_msec.integer=17;clientSpawnCmd.serverTime=1049;break;
    case 14:pmove_msec.integer=7;break;
    case 15:ent->health=0;cl->ps.stats[STAT_HEALTH]=0;cl->respawnTime=2000;break;
    case 16:clientSpawnCmd.forwardmove=40;break;
    case 17:ent->r.svFlags=SVF_BOT;clientSpawnCmd.forwardmove=40;break;
    case 18:cl->ps.weapon=WP_GAUNTLET;clientSpawnCmd.weapon=WP_GAUNTLET;clientSpawnCmd.buttons=BUTTON_ATTACK;clientThinkGauntletHit=1;break;
    case 19:cl->ps.eventSequence=1;cl->ps.events[0]=EV_USE_ITEM2;ent->health=17;break;
    case 20:cl->ps.eventSequence=1;cl->ps.events[0]=EV_FALL_MEDIUM;break;
    case 21:g_dmflags.integer=DF_NO_FALLING;cl->ps.eventSequence=1;cl->ps.events[0]=EV_FALL_FAR;break;
    case 22:cl->ps.eventSequence=1;cl->ps.events[0]=EV_FIRE_WEAPON;break;
    case 23:{gentity_t *spot=&g_entities[64];memset(spot,0,sizeof(*spot));spot->inuse=qtrue;spot->s.number=64;
        spot->classname="info_player_deathmatch";VectorSet(spot->s.origin,256,0,32);level.num_entities=65;
        cl->ps.powerups[PW_REDFLAG]=level.time+5500;cl->ps.eventSequence=1;cl->ps.events[0]=EV_USE_ITEM1;break;}
    case 24:g_gravity.value=800.75f;g_speed.value=321.75f;cl->ps.powerups[PW_HASTE]=1;break;
    case 25:cl->sess.sessionTeam=TEAM_SPECTATOR;cl->sess.spectatorState=SPECTATOR_FREE;pmove_fixed.integer=1;pmove_msec.integer=17;clientSpawnCmd.serverTime=1049;clientSpawnCmd.forwardmove=73;break;
    case 26:{gentity_t *hook=&g_entities[64];memset(hook,0,sizeof(*hook));hook->inuse=qtrue;hook->s.number=64;hook->parent=ent;
        level.num_entities=65;cl->hook=hook;cl->ps.weapon=WP_GRAPPLING_HOOK;clientSpawnCmd.weapon=WP_GRAPPLING_HOOK;break;}
    }
    cl->pers.cmd=clientSpawnCmd;
    *result=ent;
}
static void runClientThink(FILE *in) {
    int scenario;while(fread(&scenario,4,1,in)==1) {
        gentity_t *ent;configureThink(scenario,&ent);
        if(scenario==16)Original_ClientThink(0);
        else if(scenario==17)Original_G_RunClient(ent);
        else if(scenario>=19 && scenario<=23)ClientEvents(ent,0);
        else ClientThink_real(ent);
        thinkFinal(ent);
    }
}
