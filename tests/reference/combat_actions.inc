/* Test-only inputs and callback observations; damage/hazards use original C. */
static void combatCallback(int kind,gentity_t *e,gentity_t *inflictor,gentity_t *attacker,int amount,int mod) {
    gentity_t *changed;vec3_t origin={100,0,64};int mode=e->count,slot=e->damage;
    word(kind);word(slotOf(e));word(slotOf(inflictor));word(slotOf(attacker));word(amount);word(mod);
    word(e->health);word(e->client?e->client->ps.stats[STAT_HEALTH]:0);word(e->flags);word(slotOf(e->enemy));
    if(missileOutput)missileState();
    if(mode==1)G_FreeEntity(e);
    if(mode==2)G_FreeEntity(&g_entities[slot]);
    if(mode==3)g_entities[slot].takedamage=qfalse;
    if(mode==4){VectorSet(origin,2000,0,64);G_SetOrigin(&g_entities[slot],origin);trap_LinkEntity(&g_entities[slot]);}
    if(mode==5 || mode==6){if(mode==5)G_FreeEntity(&g_entities[slot]);changed=G_Spawn();changed->takedamage=qtrue;changed->health=333;G_SetOrigin(changed,origin);trap_LinkEntity(changed);}
}
static void combatPain(gentity_t *e,gentity_t *attacker,int amount) {combatCallback(23,e,NULL,attacker,amount,0);}
static void combatDie(gentity_t *e,gentity_t *inflictor,gentity_t *attacker,int amount,int mod) {combatCallback(24,e,inflictor,attacker,amount,mod);}
static void combatUse(gentity_t *e,gentity_t *inflictor,gentity_t *attacker) {combatCallback(25,e,inflictor,attacker,0,0);}
static void combatField(gentity_t *e,int key,int v) {
    switch(key) {
    case 0:e->health=v;break;case 1:e->takedamage=v;break;case 2:e->flags=v;break;case 3:e->s.eType=v;break;
    case 4:e->moverState=v;break;case 5:e->pain=v?combatPain:NULL;break;case 6:e->die=v?combatDie:NULL;break;
    case 7:e->timestamp=v;break;case 8:e->spawnflags=v;break;case 9:e->damage=v;break;case 10:e->noise_index=v;break;
    case 11:e->neverFree=v;break;case 12:e->count=v;break;case 13:e->use=v?combatUse:NULL;break;
    case 14:e->r.contents=v;break;case 15:e->r.ownerNum=v;break;case 16:e->targetname=(char*)actionName(v);break;
    case 17:e->s.number=v;break;case 18:e->enemy=v<0?NULL:&g_entities[v];break;case 19:e->activator=v<0?NULL:&g_entities[v];break;
    case 20:e->client->sess.sessionTeam=v;break;case 21:e->client->noclip=v;break;
    case 22:e->client->ps.stats[STAT_ARMOR]=v;break;case 23:e->client->ps.stats[STAT_MAX_HEALTH]=v;break;
    case 24:e->client->ps.pm_time=v;break;case 25:e->client->ps.pm_flags=v;break;
    case 26:e->client->ps.powerups[PW_BATTLESUIT]=v;break;case 27:e->client->ps.powerups[PW_REDFLAG]=v;break;
    case 28:e->client->ps.powerups[PW_BLUEFLAG]=v;break;case 29:e->client->ps.generic1=v;break;
    case 30:e->client->ps.persistant[PERS_HITS]=v;break;case 31:e->client->pers.teamState.lasthurtcarrier=v;break;
    case 32:e->client->damage_armor=v;break;case 33:e->client->damage_blood=v;break;case 34:e->client->damage_knockback=v;break;
    case 35:e->client->lasthurt_client=v;break;case 36:e->client->lasthurt_mod=v;break;case 37:e->client->ps.externalEvent=v;break;
    case 40:g_gametype.integer=v;break;case 41:g_friendlyFire.integer=v;break;case 42:g_knockback.value=actionFloat(v);break;
    case 43:level.intermissionQueued=v;break;case 44:level.time=v;break;case 45:e->client->ps.stats[STAT_HEALTH]=v;break;case 46:e->inuse=v;break;default:exit(76);
    }
}
static void combatExtra(gentity_t *e) {
    gclient_t *c=e->client;
    word(e->takedamage);word(e->moverState);word(slotOf(e->enemy));word(e->pain?1:0);word(e->die?1:0);word(e->timestamp);
    word(c?1:0);if(!c)return;
    words(&c->ps,117);word(c->sess.sessionTeam);words(c->pers.cmd.angles,3);word(c->noclip);
    word(c->damage_armor);word(c->damage_blood);word(c->damage_knockback);words(c->damage_from,3);word(c->damage_fromWorld);
    word(c->lasthurt_client);word(c->lasthurt_mod);words(&c->pers.teamState.lasthurtcarrier,1);
}
static void combatState(int index) {
    int i;word(26);word(index);word(g_gametype.integer);word(g_friendlyFire.integer);words(&g_knockback.value,1);word(level.intermissionQueued);
    state();for(i=0;i<3;i++){snapshot(&g_entities[i]);combatExtra(&g_entities[i]);}
    for(i=64;i<level.num_entities;i++)combatExtra(&g_entities[i]);combatExtra(&g_entities[1022]);
    if(missileOutput)missileState();
}
static void runCombat(FILE *in) {
    int q[16],index=0,j;gentity_t *e,*other,*attacker;vec3_t dir,point;char *text=readString(in);
    combatTraceOutput=1;entityPoint=text;COM_BeginParseSession("combat-actions");G_SpawnEntitiesFromString();combatState(-1);
    while(fread(q,4,16,in)==16) {
        e=q[1]<0 || q[1]>=1024?NULL:&g_entities[q[1]];other=q[2]<0 || q[2]>=1024?NULL:&g_entities[q[2]];attacker=q[3]<0 || q[3]>=1024?NULL:&g_entities[q[3]];
        switch(q[0]) {
        case 1:G_FreeEntity(e);G_InitGentity(e);e->takedamage=qtrue;e->health=q[4];e->pain=combatPain;e->die=combatDie;
            VectorSet(e->r.currentOrigin,10.25,-20.75,32.5);VectorSet(e->r.mins,-15,-15,-24);VectorSet(e->r.maxs,15,15,32);e->r.contents=CONTENTS_BODY;
            if(q[2]){memset(&g_clients[q[1]],0,sizeof(g_clients[0]));e->client=&g_clients[q[1]];e->client->sess.sessionTeam=q[3];e->s.eType=ET_PLAYER;
                e->client->ps.stats[STAT_HEALTH]=q[4];e->client->ps.stats[STAT_ARMOR]=q[5];e->client->ps.stats[STAT_MAX_HEALTH]=q[6];}break;
        case 2:combatField(e,q[2],q[3]);break;
        case 3:for(j=0;j<3;j++){dir[j]=actionFloat(q[7+j]);point[j]=actionFloat(q[11+j]);}
            G_Damage(e,other,attacker,q[10]?dir:NULL,q[14]?point:NULL,q[4],q[5],q[6]);
            word(20);words(dir,3);words(point,3);break;
        case 4:word(21);word(CheckArmor(e,q[2],q[3]));break;
        case 5:hurt_touch(e,other,NULL);break;
        case 6:if(!e->use)exit(76);e->use(e,other,attacker);break;
        case 7:word(22);word(OnSameTeam(e,other));break;
        case 8:Team_CheckHurtCarrier(e,other);break;
        case 9:G_KillBox(e);break;
        case 10:if(q[2])trap_LinkEntity(e);else trap_UnlinkEntity(e);break;
        case 11:G_FreeEntity(e);break;
        case 12:for(j=0;j<3;j++){e->r.currentOrigin[j]=actionFloat(q[2+j]);if(e->client){e->client->ps.origin[j]=e->r.currentOrigin[j];e->client->ps.velocity[j]=actionFloat(q[5+j]);}}break;
        case 13:G_TouchTriggers(e);break;
        case 14:for(j=0;j<3;j++)point[j]=actionFloat(q[2+j]);VectorSet(dir,0,90,0);TeleportPlayer(e,point,dir);break;
        case 15:for(j=0;j<3;j++)point[j]=actionFloat(q[2+j]);j=CanDamage(e,point);word(28);word(j);break;
        case 16:for(j=0;j<3;j++)point[j]=actionFloat(q[5+j]);j=G_RadiusDamage(point,e,actionFloat(q[3]),actionFloat(q[4]),other,q[8]);word(29);word(j);break;
        case 17:word(30);word(LogAccuracyHit(e,other));break;
        case 18:G_RunThink(e);break;
        case 19:for(j=0;j<3;j++)point[j]=actionFloat(q[3+j]);
            switch(q[2]){case 0:VectorCopy(point,e->s.origin);break;case 1:VectorCopy(point,e->s.angles);break;case 2:VectorCopy(point,e->movedir);break;
            case 3:VectorCopy(point,e->r.mins);break;case 4:VectorCopy(point,e->r.maxs);break;case 5:VectorCopy(point,e->r.currentOrigin);break;
            case 6:VectorCopy(point,e->r.currentAngles);break;case 7:VectorCopy(point,e->r.absmin);break;case 8:VectorCopy(point,e->r.absmax);break;}break;
        case 20:trap_SetBrushModel(e,va("*%d",q[2]));break;
        default:if(!missileOutput || !missileAction(q))exit(76);
        }
        combatState(index++);
    }
    if(missileOutput){word(37);word(rand());}
    free(text);
}
