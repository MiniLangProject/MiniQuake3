/* SPDX-License-Identifier: GPL-2.0-or-later
 * Dropped-item and flag lifecycle inputs for the shared native oracle.
 */
static void itemState(void) {
    int i;word(52);word(teamgame.redStatus);word(teamgame.blueStatus);word(teamgame.flagStatus);string(configs[CS_FLAGSTATUS]);
    word(level.num_entities-64);for(i=64;i<level.num_entities;i++) {
        gentity_t *e=&g_entities[i];word(i);word(e->item?(int)(e->item-bg_itemlist):-1);
        word(e->teammaster?(int)(e->teammaster-g_entities):-1);word(e->teamchain?(int)(e->teamchain-g_entities):-1);
    }
}
static int itemAction(int *a) {
    int i;gentity_t *e=a[1]<0 || a[1]>=1024?NULL:&g_entities[a[1]],*result;vec3_t origin,velocity;
    switch(a[0]) {
    case 91:
        g_gametype.integer=a[1];level.time=a[2];level.previousTime=a[3];
        teamgame.redStatus=a[4];teamgame.blueStatus=a[5];teamgame.flagStatus=a[6];break;
    case 92:
        if(!e || a[2]<=0 || a[2]>=bg_numItems)return 0;if(a[1]>=level.num_entities){result=G_Spawn();if(result!=e)exit(76);}else G_InitGentity(e);e->item=&bg_itemlist[a[2]];e->classname=e->item->classname;e->flags=a[3];
        e->s.eType=ET_ITEM;e->s.modelindex=a[2];e->s.modelindex2=(a[3]&FL_DROPPED_ITEM)?1:0;e->physicsBounce=actionFloat(a[10]);
        VectorSet(e->r.mins,-ITEM_RADIUS,-ITEM_RADIUS,-ITEM_RADIUS);VectorSet(e->r.maxs,ITEM_RADIUS,ITEM_RADIUS,ITEM_RADIUS);e->r.contents=CONTENTS_TRIGGER;e->touch=Touch_Item;
        for(i=0;i<3;i++)e->s.pos.trBase[i]=e->r.currentOrigin[i]=actionFloat(a[4+i]);if(a[11])trap_LinkEntity(e);break;
    case 93:
        for(i=0;i<3;i++){origin[i]=actionFloat(a[2+i]);velocity[i]=actionFloat(a[5+i]);}result=LaunchItem(&bg_itemlist[a[1]],origin,velocity);word(53);word((int)(result-g_entities));break;
    case 94:result=Drop_Item(e,&bg_itemlist[a[2]],actionFloat(a[3]));word(53);word((int)(result-g_entities));break;
    case 95:RespawnItem(e);break;case 96:Team_CheckDroppedItem(e);break;
    case 97:result=Team_ResetFlag(a[1]);word(54);word(result?(int)(result-g_entities):-1);break;
    case 98:Team_ReturnFlag(a[1]);break;case 99:Team_FreeEntity(e);break;case 100:Team_DroppedFlagThink(e);break;
    case 101:Original_RunItem(e);break;case 102:
        switch(a[2]) {
        case 0:e->item=a[3]<0?NULL:&bg_itemlist[a[3]];break;case 1:e->physicsBounce=actionFloat(a[3]);break;
        case 2:e->s.groundEntityNum=a[3];break;case 3:e->clipmask=a[3];break;case 4:e->s.pos.trType=a[3];break;
        case 5:e->s.pos.trTime=a[3];break;case 6:e->flags=a[3];break;case 7:e->r.contents=a[3];break;
        case 8:e->teammaster=a[3]<0?NULL:&g_entities[a[3]];break;case 9:e->teamchain=a[3]<0?NULL:&g_entities[a[3]];break;
        case 10:e->team=a[3]?"group":NULL;break;case 11:e->r.ownerNum=a[3];break;case 12:e->nextthink=a[3];break;
        case 13:e->s.eFlags=a[3];break;case 14:e->r.svFlags=a[3];break;case 15:e->speed=actionFloat(a[3]);break;default:return 0;}break;
    case 103:
        for(i=0;i<3;i++) {
            if(a[2]==0)e->s.pos.trBase[i]=actionFloat(a[3+i]);else if(a[2]==1)e->s.apos.trBase[i]=actionFloat(a[3+i]);
            else if(a[2]==2)e->s.pos.trDelta[i]=actionFloat(a[3+i]);else if(a[2]==3)e->r.currentOrigin[i]=actionFloat(a[3+i]);else return 0;
        }break;
    case 104:runEntities();break;case 105:G_SpawnItem(e,&bg_itemlist[a[2]]);break;case 106:FinishSpawningItem(e);break;
    default:return 0;
    }
    return 1;
}
