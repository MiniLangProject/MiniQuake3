/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "q_shared.h"
#include "bg_public.h"
static void word(FILE *out,int value) { if(fwrite(&value,4,1,out)!=1)exit(62); }
static void real(FILE *out,float value) { if(fwrite(&value,4,1,out)!=1)exit(62); }
int main(int argc,char **argv) {
    FILE *in,*out;int i;vec3_t position,velocity,angles;entityState_t item,pad;
    struct {trajectory_t tr;int atTime;playerState_t ps;int number;vec3_t impulse;float angle;} query;
    if(argc!=3 || sizeof(query)!=528)return 2;
    in=fopen(argv[1],"rb");out=fopen(argv[2],"wb");if(!in || !out)return 3;
    while(fread(&query,sizeof(query),1,in)==1) {
        memset(&item,0,sizeof(item));memset(&pad,0,sizeof(pad));item.pos=query.tr;pad.number=query.number;VectorCopy(query.impulse,pad.origin2);
        BG_EvaluateTrajectory(&query.tr,query.atTime,position);BG_EvaluateTrajectoryDelta(&query.tr,query.atTime,velocity);
        for(i=0;i<3;i++)real(out,position[i]);for(i=0;i<3;i++)real(out,velocity[i]);
        word(out,BG_PlayerTouchesItem(&query.ps,&item,query.atTime));vectoangles(query.impulse,angles);
        for(i=0;i<3;i++)real(out,angles[i]);real(out,AngleNormalize360(query.angle));real(out,AngleNormalize180(query.angle));
        BG_TouchJumpPad(&query.ps,&pad);fwrite(&query.ps,sizeof(query.ps),1,out);
    }
    fclose(in);fclose(out);return 0;
}
