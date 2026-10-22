/* SPDX-License-Identifier: GPL-2.0-or-later
 * Team Arena proximity-mine branches from the unchanged g_mover.c.
 */
#define MISSIONPACK 1
#define main mover_push_reference_main
#include "mover_push_oracle.c"
#undef main

static int exploded;
void G_ExplodeMissile(gentity_t *ent) {
    vec3_t origin;
    BG_EvaluateTrajectory(&ent->s.pos,level.time,origin); SnapVector(origin);
    VectorCopy(origin,ent->s.pos.trBase); VectorCopy(origin,ent->r.currentOrigin);
    ent->s.eType=ET_GENERAL; exploded++;
}

static void output_mine(int id,int success,gentity_t *mine,gentity_t *activator) {
    word(0x4d4f5643); word(id); word(success);
    vec(mine->s.pos.trBase); vec(mine->r.currentOrigin); word(mine->s.loopSound);
    word(mine->activator ? (int)(mine->activator-g_entities) : -1);
    word(activator->inuse); word(exploded);
}

int main(int argc,char **argv) {
    int id,success; gentity_t *pusher,*mine,*activator,*obstacle=NULL;
    vec3_t move={0,0,0},amove={0,0,0};
    if(argc!=3)return 2; id=atoi(argv[1]); out=fopen(argv[2],"wb"); if(!out)return 3;
    reset_case(); exploded=0;
    pusher=entity(1,ET_MOVER,0,0,0); mine=entity(3,ET_MISSILE,0,0,7.9f);
    mine->classname="prox mine"; VectorSet(mine->movedir,0,0,1); mine->s.loopSound=77;
    activator=entity(4,ET_GENERAL,100,100,100); mine->activator=activator;
    areaCounts[0]=1; areaSlots[0][0]=3;
    if(id==1) { mine->enemy=pusher; VectorSet(move,10,0,0); }
    else if(id==2) { traceSolid[0]=1; traceEntity[0]=ENTITYNUM_WORLD; }
    else return 4;
    pushed_p=pushed; success=G_MoverPush(pusher,move,amove,&obstacle);
    output_mine(id,success,mine,activator); fclose(out); return 0;
}
