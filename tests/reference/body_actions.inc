/* SPDX-License-Identifier: GPL-2.0-or-later
 * Inputs/observations only. Selection, body queue and physics use original C.
 */
static void bodyExtra(gentity_t *e) {
    word(slotOf(e));word(e->clipmask);words(&e->physicsBounce,1);
    word(!e->think?0:e->think==BodySink?1:2);word(!e->die?0:e->die==body_die?1:2);
}
static void bodyState(void) {
    int i;word(38);word(level.previousTime);word(g_blood.integer);word(level.bodyQueIndex);
    for(i=0;i<8;i++)word(slotOf(level.bodyQue[i]));
    words(level.intermission_origin,3);words(level.intermission_angle,3);word(level.num_entities-64+4);
    for(i=0;i<3;i++)bodyExtra(&g_entities[i]);
    for(i=64;i<level.num_entities;i++)bodyExtra(&g_entities[i]);bodyExtra(&g_entities[1022]);
}
static int bodyAction(int *a) {
    gentity_t *e=a[1]<0?NULL:&g_entities[a[1]],*chosen=NULL;
    int i,result=-1;vec3_t origin={123.5,-45.25,67.75},angles={-12.5,23.25,34.75},avoid;trace_t tr;float f;
    switch(a[0]) {
    case 40:
        for(i=0;i<3;i++)avoid[i]=actionFloat(a[5+i]);
        switch(a[2]) {
        case 0:result=SpotWouldTelefrag(e);break;
        case 1:chosen=SelectNearestDeathmatchSpawnPoint(avoid);break;
        case 2:chosen=SelectRandomDeathmatchSpawnPoint();break;
        case 3:chosen=SelectRandomFurthestSpawnPoint(avoid,origin,angles);break;
        case 4:chosen=SelectSpawnPoint(avoid,origin,angles);break;
        case 5:chosen=SelectInitialSpawnPoint(origin,angles);break;
        case 6:chosen=SelectRandomTeamSpawnPoint(a[4],a[3]);break;
        case 7:chosen=SelectCTFSpawnPoint(a[3],a[4],origin,angles);break;
        case 8:chosen=SelectSpectatorSpawnPoint(origin,angles);break;
        case 9:FindIntermissionPoint();break;
        default:exit(78);}
        if(a[2]!=0)result=slotOf(chosen);
        word(39);word(a[2]);word(result);words(origin,3);words(angles,3);break;
    case 41:InitBodyQue();break;case 42:CopyToBodyQue(e);break;case 43:BodySink(e);break;
    case 44:GibEntity(e,a[2]);break;case 45:body_die(e,NULL,NULL,100,MOD_ROCKET);break;
    case 46:LookAtKiller(e,a[2]<0?NULL:&g_entities[a[2]],a[3]<0?NULL:&g_entities[a[3]]);break;
    case 47:Original_RunItem(e);break;
    case 48:
        memset(&tr,0,sizeof(tr));tr.fraction=actionFloat(a[2]);tr.entityNum=a[3];
        for(i=0;i<3;i++){tr.plane.normal[i]=actionFloat(a[5+i]);tr.endpos[i]=actionFloat(a[8+i]);}
        G_BounceItem(e,&tr);word(33);words(tr.endpos,3);break;
    case 49:
        if(a[2]>=100 && a[2]<152){((int*)&e->s)[a[2]-100]=a[3];break;}
        switch(a[2]) {
        case 0:g_blood.integer=a[3];break;case 1:e->s.groundEntityNum=a[3];break;
        case 2:e->s.legsAnim=a[3];break;case 3:e->s.torsoAnim=a[3];break;case 4:e->s.eFlags=a[3];break;
        case 5:e->s.powerups=a[3];break;case 6:e->s.loopSound=a[3];break;case 7:e->s.event=a[3];break;
        case 8:e->s.pos.trType=a[3];break;case 9:e->s.pos.trTime=a[3];break;case 10:e->s.pos.trDuration=a[3];break;
        case 11:e->physicsBounce=actionFloat(a[3]);break;case 12:level.previousTime=a[3];break;
        case 13:e->die=a[3]?body_die:NULL;break;
        case 14:e->classname=a[3]==0?"bodyque":a[3]==1?"kamikaze timer":a[3]==2?"Kamikaze timer":"info_notnull";break;
        case 15:e->r.svFlags=a[3];break;case 16:srand(a[3]);break;case 17:e->target=(char*)actionName(a[3]);break;
        case 18:e->clipmask=a[3];break;case 19:e->physicsObject=a[3];break;case 20:e->think=a[3]?BodySink:NULL;break;
        default:exit(78);}break;
    case 50:
        for(i=0;i<3;i++)avoid[i]=actionFloat(a[3+i]);
        if(a[2])VectorCopy(avoid,e->s.pos.trDelta);else VectorCopy(avoid,e->s.pos.trBase);break;
    case 51:runEntities();break;
    case 52:for(i=0;i<3;i++)avoid[i]=actionFloat(a[2+i]);f=vectoyaw(avoid);word(40);words(&f,1);break;
    default:return 0;
    }
    return 1;
}
