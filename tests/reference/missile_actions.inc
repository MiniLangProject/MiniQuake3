/* SPDX-License-Identifier: GPL-2.0-or-later
 * Test inputs and observations only; all missile/shooter functions are original C.
 */
static int missileThinkId(gentity_t *e) {
    if(!e->think)return 0;if(e->think==G_ExplodeMissile)return 1;if(e->think==Weapon_HookFree)return 2;
    if(e->think==Weapon_HookThink)return 3;if(e->think==InitShooter_Finish)return 4;return 5;
}
static void missileExtra(gentity_t *e) {
    word(slotOf(e));word(slotOf(e->parent));word(slotOf(e->target_ent));word(e->splashDamage);words(&e->splashRadius,1);
    word(e->methodOfDeath);word(e->splashMethodOfDeath);word(e->clipmask);word(missileThinkId(e));word(e->client?1:0);
    word(e->client?e->client->accuracy_hits:0);word(e->client?slotOf(e->client->hook):-1);
}
static void missileState(void) {
    int i;word(31);word(level.previousTime);words(itemRegistered,MAX_ITEMS);word(level.num_entities-64+4);
    for(i=0;i<3;i++)missileExtra(&g_entities[i]);
    for(i=64;i<level.num_entities;i++)missileExtra(&g_entities[i]);missileExtra(&g_entities[1022]);
}
static int missileAction(int *q) {
    int j;gentity_t *e=q[1]<0?NULL:&g_entities[q[1]],*created;vec3_t start,dir,v;trace_t tr;
    switch(q[0]) {
    case 21:
        for(j=0;j<3;j++){start[j]=actionFloat(q[3+j]);dir[j]=actionFloat(q[6+j]);}
        switch(q[2]){case 4:created=fire_grenade(e,start,dir);break;case 5:created=fire_rocket(e,start,dir);break;
        case 8:created=fire_plasma(e,start,dir);break;case 9:created=fire_bfg(e,start,dir);break;case 10:created=fire_grapple(e,start,dir);break;default:exit(77);}
        word(32);word(slotOf(created));words(start,3);words(dir,3);break;
    case 22:G_RunMissile(e);break;
    case 23:G_ExplodeMissile(e);break;
    case 24:case 25:
        memset(&tr,0,sizeof(tr));tr.fraction=actionFloat(q[2]);tr.entityNum=q[3];tr.surfaceFlags=q[4];
        for(j=0;j<3;j++){tr.plane.normal[j]=actionFloat(q[5+j]);tr.endpos[j]=actionFloat(q[8+j]);}
        if(q[0]==24)G_BounceMissile(e,&tr);else G_MissileImpact(e,&tr);
        word(33);words(tr.endpos,3);break;
    case 26:Weapon_HookThink(e);break;case 27:Weapon_HookFree(e);break;
    case 28:runEntities();break;
    case 29:
        for(j=0;j<3;j++){dir[j]=actionFloat(q[2+j]);start[j]=actionFloat(q[5+j]);}
        j=DirToByte(q[8]?NULL:dir);SnapVectorTowards(dir,start);word(34);word(j);words(dir,3);break;
    case 30:InitShooter(e,q[2]);break;
    case 31:
        switch(q[2]) {
        case 0:level.previousTime=q[3];break;case 1:e->s.eFlags=q[3];break;case 2:e->s.pos.trType=q[3];break;
        case 3:e->s.pos.trTime=q[3];break;case 4:e->s.pos.trDuration=q[3];break;case 5:e->splashDamage=q[3];break;
        case 6:e->splashRadius=q[3];break;case 7:e->parent=q[3]<0?NULL:&g_entities[q[3]];break;
        case 8:e->target_ent=q[3]<0?NULL:&g_entities[q[3]];break;case 9:e->clipmask=q[3];break;
        case 10:e->client->accuracy_hits=q[3];break;case 11:e->nextthink=q[3];break;
        case 12:e->target=(char*)actionName(q[3]);break;case 13:e->random=actionFloat(q[3]);break;
        case 14:srand(q[3]);break;case 15:e->s.weapon=q[3];break;
        case 16:e->think=q[3]?G_ExplodeMissile:NULL;break;case 17:e->client->hook=q[3]<0?NULL:&g_entities[q[3]];break;
        default:exit(77);}break;
    case 32:
        for(j=0;j<3;j++)v[j]=actionFloat(q[3+j]);
        if(q[2])VectorCopy(v,e->s.pos.trDelta);else VectorCopy(v,e->s.pos.trBase);break;
    case 33:
        for(j=0;j<3;j++)dir[j]=actionFloat(q[2+j]);PerpendicularVector(v,dir);word(35);words(v,3);break;
    case 34:word(36);word(BG_FindItemForWeapon(q[1])-bg_itemlist);break;
    case 35:for(j=72;j<level.num_entities;j++)if(g_entities[j].inuse)G_FreeEntity(&g_entities[j]);break;
    default:return 0;
    }
    return 1;
}
