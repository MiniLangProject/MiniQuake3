/* SPDX-License-Identifier: GPL-2.0-or-later
 * Test-only actions and observed boundaries; gameplay functions are original C.
 */
static char *readString(FILE*);static void state(void);
static int slotOf(gentity_t *e) {return e?(int)(e-g_entities):-1;}
static void actionThink(gentity_t *e) {word(11);word(slotOf(e));e->count++;}
static void actionUse(gentity_t *e,gentity_t *other,gentity_t *activator) {
    gentity_t *newent;word(10);word(slotOf(e));word(slotOf(other));word(slotOf(activator));word(level.time);e->count++;
    switch(e->damage) {
    case 1:G_FreeEntity(other);break;
    case 2:G_FreeEntity(e);break;
    case 3:G_FreeEntity(&g_entities[e->health]);break;
    case 4:other->target="changed";break;
    case 5:newent=G_Spawn();newent->targetname="leaf";newent->use=actionUse;newent->think=actionThink;newent->nextthink=level.time;break;
    case 6:other->target=NULL;break;
    case 7:G_FreeEntity(other);newent=G_Spawn();newent->target="changed";break;
    }
}
static void actionRun(int kind,gentity_t *e) {word(12);word(kind);word(slotOf(e));}
void G_RunMissile(gentity_t *e) {if(missileOutput)Original_RunMissile(e);else actionRun(1,e);}
void G_RunItem(gentity_t *e) {if(bodyOutput)Original_RunItem(e);else actionRun(2,e);}
void G_RunMover(gentity_t *e) {actionRun(3,e);}
void G_RunClient(gentity_t *e) {actionRun(4,e);}
#include "entity_frame.inc"
static const char *actionName(int n) {static const char *names[]={NULL,"leaf","changed","dest","missing",""};return names[n];}
static float actionFloat(int bits) {float f;memcpy(&f,&bits,4);return f;}
static void actionField(gentity_t *e,int field,int v) {
    switch(field) {
    case 0:e->spawnflags=v;break;case 1:e->nextthink=v;break;case 2:e->eventTime=v;break;
    case 3:e->freeAfterEvent=v;break;case 4:e->unlinkAfterEvent=v;break;case 5:e->neverFree=v;break;
    case 6:e->physicsObject=v;break;case 7:e->s.eType=v;break;case 8:e->s.event=v;break;case 9:e->s.eventParm=v;break;
    case 10:e->wait=actionFloat(v);break;case 11:e->random=actionFloat(v);break;case 12:e->health=v;break;
    case 13:e->damage=v;break;case 14:e->count=v;break;case 15:e->target=(char*)actionName(v);break;case 16:e->targetname=(char*)actionName(v);break;
    case 17:e->think=v?actionThink:NULL;break;case 18:e->use=v?actionUse:NULL;break;case 19:e->client->sess.sessionTeam=v;break;
    case 20:e->client->ps.externalEvent=v;break;case 21:e->client->ps.events[0]=v;break;
    case 22:e->client->ps.externalEventTime=v;break;case 23:e->client->ps.externalEventParm=v;break;
    case 24:e->client->ps.pm_type=v;break;case 25:e->client->ps.powerups[PW_FLIGHT]=v;break;
    case 26:e->fly_sound_debounce_time=v;break;case 27:e->noise_index=v;break;case 28:e->inuse=v;break;
    default:exit(75);
    }
}
static void runActions(FILE *in) {
    int q[8],index=0,i;gentity_t *e,*other,*activator;char *text=readString(in);
    entityPoint=text;COM_BeginParseSession("target-actions");G_SpawnEntitiesFromString();state();
    while(fread(q,4,8,in)==8) {
        e=q[1]<0 || q[1]>=1024?NULL:&g_entities[q[1]];other=q[2]<0 || q[2]>=1024?NULL:&g_entities[q[2]];activator=q[3]<0 || q[3]>=1024?NULL:&g_entities[q[3]];
        switch(q[0]) {
        case 0:level.time=q[1];break;
        case 1:if(!e->use)exit(75);e->use(e,other,activator);break;
        case 2:G_UseTargets(e,other);break;
        case 3:G_RunThink(e);break;
        case 4:runEntities();break;
        case 5:actionField(e,q[2],q[3]);break;
        case 6:G_InitGentity(e);memset(&g_clients[q[1]],0,sizeof(g_clients[0]));e->client=&g_clients[q[1]];e->client->sess.sessionTeam=q[2];e->client->ps.stats[STAT_HEALTH]=100;e->s.eType=ET_PLAYER;
            VectorSet(e->r.mins,-15,-15,-24);VectorSet(e->r.maxs,15,15,32);e->r.contents=CONTENTS_BODY;break;
        case 7:G_AddEvent(e,q[2],q[3]);break;
        case 8:G_Sound(e,q[2],q[3]);break;
        case 9:if(q[2])trap_LinkEntity(e);else trap_UnlinkEntity(e);break;
        case 10:G_FreeEntity(e);break;
        case 11:e=G_Spawn();e->targetname=(char*)actionName(q[1]);e->use=actionUse;break;
        case 12:Touch_Multi(e,other,NULL);break;
        case 13:e->targetShaderName=G_NewString(va("shader/%d",q[2]));e->targetShaderNewName=G_NewString(va("shader/%d",q[3]));break;
        case 14:{char old[64],newname[64];sprintf(old,"shader/%d",q[1]);sprintf(newname,"shader/%d",q[2]);AddRemap(old,newname,actionFloat(q[3]));break;}
        case 15:remapCount=0;break;
        case 16:word(13);string(BuildShaderStateConfig());break;
        case 17:{char old[64],newname[64];sprintf(old,"shader/%056d",q[1]);sprintf(newname,"shader/%056d",q[2]);AddRemap(old,newname,actionFloat(q[3]));break;}
        case 18:word(15);string(configs[q[1]]);break;
        default:exit(75);
        }
        word(14);word(index++);state();
        for(i=0;i<3;i++){snapshot(&g_entities[i]);word(g_entities[i].client?1:0);if(g_entities[i].client)words(&g_entities[i].client->ps,117);}
    }
    word(rand());free(text);
}
