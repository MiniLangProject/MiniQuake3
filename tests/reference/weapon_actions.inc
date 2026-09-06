/* SPDX-License-Identifier: GPL-2.0-or-later
 * Weapon fixtures only. Gameplay comes from unchanged g_weapon.c bodies.
 * CSV values are explicit signed 32-bit fixture words, never game commands.
 */
static void weaponState(void){
    int i;words(&g_quadfactor.value,1);word(g_friendlyFire.integer);words(&g_knockback.value,1);
    words(&s_quadFactor,1);words(forward,3);words(right,3);words(up,3);words(muzzle,3);
    for(i=0;i<64;i++)word(g_clients[i].hook?g_clients[i].hook-g_entities:-1);
    for(i=0;i<level.num_entities;i++){
        gentity_t *e=&g_entities[i];word(e->damage);word(e->splashDamage);word(e->splashRadius);
        word(e->methodOfDeath);word(e->splashMethodOfDeath);word(e->target_ent?e->target_ent-g_entities:-1);
    }
}
static void weaponConfigure(void){
    int i;g_quadfactor.value=3;g_speed.value=320;pmove_msec.integer=8;
    for(i=0;i<64;i++)if(g_entities[i].client){
        g_entities[i].die=player_die;g_entities[i].client->ps.viewheight=26;
        VectorClear(g_entities[i].client->ps.viewangles);
    }
}
static void weaponValues(const char *text,int *v){
    int i;const char *p=text;memset(v,0,16*sizeof(int));
    for(i=0;i<16 && *p;i++){
        char *end;long value=strtol(p,&end,10);if(end==p)exit(74);v[i]=(int)value;
        if(!*end)return;if(*end!=',')exit(74);p=end+1;
    }
    if(*p)exit(74);
}
static void weaponScalar(gentity_t *ent,int field,int value){
    gclient_t *cl=&g_clients[ent-g_entities];float f;memcpy(&f,&value,4);
    switch(field){
    case 1:ent->s.weapon=cl->ps.weapon=value;break;
    case 2:cl->ps.viewheight=value;break;
    case 3:g_quadfactor.value=f;break;
    case 4:cl->accuracy_shots=value;break;
    case 5:cl->accuracy_hits=value;break;
    case 6:cl->accurateCount=value;break;
    case 7:cl->ps.stats[STAT_ARMOR]=value;break;
    case 8:ent->health=cl->ps.stats[STAT_HEALTH]=value;break;
    case 9:cl->ps.stats[STAT_MAX_HEALTH]=value;break;
    case 10:ent->takedamage=value;break;
    case 11:ent->r.contents=value;if(ent->r.linked)hostLink(ent);break;
    case 12:ent->client=value?cl:NULL;break;
    case 13:g_friendlyFire.integer=value;break;
    case 14:g_knockback.value=f;break;
    case 15:cl->ps.powerups[PW_QUAD]=value;break;
    case 16:cl->fireHeld=value;break;
    case 17:if(value < -1 || value>=MAX_GENTITIES)exit(74);cl->hook=value<0?NULL:&g_entities[value];break;
    case 18:ent->die=value?player_die:NULL;break;
    case 19:cl->ps.eFlags=value;break;
    case 20:cl->ps.weaponTime=value;break;
    case 21:cl->noclip=value;break;
    case 22:cl->ps.commandTime=value;break;
    case 23:if(value < -1 || value>=MAX_GENTITIES)exit(74);ent->enemy=value<0?NULL:&g_entities[value];break;
    case 24:ent->flags=value;break;
    case 25:cl->ps.pm_flags=value;break;
    case 26:cl->rewardTime=value;break;
    case 27:cl->ps.persistant[PERS_IMPRESSIVE_COUNT]=value;break;
    case 28:cl->ps.stats[STAT_WEAPONS]=value;break;
    case 29:cl->ps.weaponstate=value;break;
    case 30:ent->s.weapon=value;break;
    case 31:cl->ps.weapon=value;break;
    case 32:cl->ps.stats[STAT_HEALTH]=value;break;
    default:exit(74);
    }
}
static void weaponVector(gentity_t *ent,int field,int *value){
    vec3_t v;gclient_t *cl=&g_clients[ent-g_entities];memcpy(v,value,sizeof(v));
    switch(field){
    case 1:VectorCopy(v,cl->ps.origin);VectorCopy(v,ent->s.origin);VectorCopy(v,ent->s.pos.trBase);VectorCopy(v,ent->r.currentOrigin);if(ent->r.linked)hostLink(ent);break;
    case 2:VectorCopy(v,cl->ps.viewangles);break;
    case 3:VectorCopy(v,ent->s.pos.trBase);break;
    case 4:VectorCopy(v,cl->oldOrigin);break;
    case 5:VectorCopy(v,cl->ps.velocity);break;
    case 6:VectorCopy(v,ent->r.mins);if(ent->r.linked)hostLink(ent);break;
    case 7:VectorCopy(v,ent->r.maxs);if(ent->r.linked)hostLink(ent);break;
    case 8:VectorCopy(v,forward);break;
    case 9:VectorCopy(v,right);break;
    case 10:VectorCopy(v,up);break;
    case 11:VectorCopy(v,muzzle);break;
    default:exit(74);
    }
}
static void weaponDirect(gentity_t *ent,int method,int *value){
    vec3_t result;float v[16];memcpy(v,value,sizeof(v));weaponTraceDepth++;
    switch(method){
    case 1:Bullet_Fire(ent,v[0],value[1]);break;
    case 2:ShotgunPattern(v,v+3,value[6],ent);break;
    case 3:{qboolean hit=ShotgunPellet(v,v+3,ent);word(224);word(hit);break;}
    case 4:weapon_supershotgun_fire(ent);break;
    case 5:weapon_railgun_fire(ent);break;
    case 6:Weapon_LightningFire(ent);break;
    case 7:weapon_grenadelauncher_fire(ent);break;
    case 8:Weapon_RocketLauncher_Fire(ent);break;
    case 9:Weapon_Plasmagun_Fire(ent);break;
    case 10:BFG_Fire(ent);break;
    case 11:Weapon_GrapplingHook_Fire(ent);break;
    case 12:CalcMuzzlePoint(ent,forward,right,up,result);word(225);words(result,3);break;
    case 13:CalcMuzzlePointOrigin(ent,v,forward,right,up,result);word(225);words(result,3);break;
    case 14:G_BounceProjectile(v,v+3,v+6,result);word(225);words(result,3);break;
    default:exit(74);
    }
    weaponTraceDepth--;
}
static void weaponAction(const int *a,const char *request){
    int v[16];gentity_t *ent=&g_entities[a[2]];gclient_t *cl=ent->client;
    weaponValues(request,v);
    switch(a[0]){
    case 50:FireWeapon(ent);break;
    case 51:{qboolean hit=CheckGauntletAttack(ent);word(224);word(hit);break;}
    case 52:srand(a[3]);break;
    case 53:weaponScalar(ent,a[3],v[0]);break;
    case 54:weaponVector(ent,a[3],v);break;
    case 55:weaponDirect(ent,a[3],v);break;
    case 56:cl->ps.eventSequence=a[3]+1;cl->ps.events[a[3]&1]=EV_FIRE_WEAPON;ClientEvents(ent,a[3]);break;
    case 57:cl->pers.cmd.serverTime=v[0];cl->pers.cmd.buttons=v[1];cl->pers.cmd.weapon=v[2];
        cl->pers.cmd.angles[0]=v[3];cl->pers.cmd.angles[1]=v[4];cl->pers.cmd.angles[2]=v[5];
        cl->pers.cmd.forwardmove=v[6];cl->pers.cmd.rightmove=v[7];cl->pers.cmd.upmove=v[8];ClientThink_real(ent);break;
    case 58:if(a[3]<64 || a[3]>=level.num_entities)exit(74);weaponTraceDepth++;Original_RunMissile(&g_entities[a[3]]);weaponTraceDepth--;break;
    default:exit(74);
    }
}
