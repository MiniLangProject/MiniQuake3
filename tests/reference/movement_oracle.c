/* SPDX-License-Identifier: GPL-2.0-or-later
 * Include the original translation unit to exercise its static kernels too.
 * The game's Pmove loop itself is not claimed by this test profile.
 */
#include "cm_local.h"
#include "bg_pmove.c"
void trap_SnapVector(float *v) { exit(60); } /* not used by these kernels */
void trap_Cvar_VariableStringBuffer(const char *name,char *buffer,int size) {
    if(strcmp(name,"showevents") || size<2) exit(61);
    strcpy(buffer,"0");
}
static void worldTrace(trace_t *tr,const vec3_t start,const vec3_t mins,const vec3_t maxs,
                       const vec3_t end,int client,int mask) {
    CM_BoxTrace(tr,start,end,mins,maxs,0,mask,qfalse);
    tr->entityNum=tr->fraction<1 ? ENTITYNUM_WORLD : ENTITYNUM_NONE;
}
static void word(FILE *out,int value) { if(fwrite(&value,4,1,out)!=1) exit(62); }
static void real(FILE *out,float value) { if(fwrite(&value,4,1,out)!=1) exit(62); }
int main(int argc,char **argv) {
    FILE *input,*output;int checksum,i,clipped;float value;
    pmove_t move;playerState_t ps,previous;
    struct { int mode,useGravity,gravity,pmTime,walking,groundPlane,groundFlags,waterlevel,pmFlags,flight,pmType,speed;
        float frametime;vec3_t origin,velocity,normal,wishdir;float wishspeed,accel,overbounce;
        int forward,right,up,chain; } query;
    if(argc!=5 || sizeof(query)!=128) return 2;
    CM_LoadMap(argv[1],qfalse,&checksum);cm_noCurves->integer=atoi(argv[4]);
    input=fopen(argv[2],"rb");output=fopen(argv[3],"wb");if(!input || !output) return 3;
    memset(&previous,0,sizeof(previous));
    while(fread(&query,sizeof(query),1,input)==1) {
        memset(&move,0,sizeof(move));memset(&ps,0,sizeof(ps));memset(&pml,0,sizeof(pml));
        pm=&move;move.ps=&ps;move.trace=worldTrace;move.tracemask=MASK_PLAYERSOLID;
        VectorSet(move.mins,-15,-15,-24);VectorSet(move.maxs,15,15,32);
        VectorCopy(query.origin,ps.origin);VectorCopy(query.velocity,ps.velocity);
        if(query.chain) {
            VectorCopy(previous.origin,ps.origin);VectorCopy(previous.velocity,ps.velocity);
            ps.eventSequence=previous.eventSequence;
            memcpy(ps.events,previous.events,sizeof(ps.events));memcpy(ps.eventParms,previous.eventParms,sizeof(ps.eventParms));
        }
        ps.gravity=query.gravity;ps.pm_time=query.pmTime;ps.pm_flags=query.pmFlags;
        ps.pm_type=query.pmType;ps.speed=query.speed;ps.powerups[PW_FLIGHT]=query.flight;
        move.waterlevel=query.waterlevel;pml.frametime=query.frametime;pml.walking=query.walking;
        pml.groundPlane=query.groundPlane;pml.groundTrace.surfaceFlags=query.groundFlags;
        VectorCopy(query.normal,pml.groundTrace.plane.normal);
        move.cmd.forwardmove=query.forward;move.cmd.rightmove=query.right;move.cmd.upmove=query.up;
        value=0;clipped=0;
        switch(query.mode) {
            case 0: PM_ClipVelocity(ps.velocity,query.normal,ps.velocity,query.overbounce);break;
            case 1: PM_Accelerate(query.wishdir,query.wishspeed,query.accel);break;
            case 2: PM_Friction();break;
            case 3: value=PM_CmdScale(&move.cmd);break;
            case 4: clipped=PM_SlideMove(query.useGravity);break;
            case 5: PM_StepSlideMove(query.useGravity);break;
            case 6:
                for(i=0;i<50;i++) { PM_AddTouchEnt(100+(query.forward+i*(query.right+128))%40);PM_AddTouchEnt(ENTITYNUM_WORLD); }
                break;
            case 7: for(i=0;i<query.up+128;i++) PM_AddEvent(EV_STEP_4+(i%4));break;
            case 8: PM_Friction();PM_Accelerate(query.wishdir,query.wishspeed,query.accel);PM_StepSlideMove(query.useGravity);break;
            default: return 4;
        }
        for(i=0;i<3;i++) real(output,ps.origin[i]);for(i=0;i<3;i++) real(output,ps.velocity[i]);
        real(output,pml.impactSpeed);real(output,value);word(output,clipped);word(output,move.numtouch);
        for(i=0;i<MAXTOUCH;i++) word(output,move.touchents[i]);word(output,ps.eventSequence);
        for(i=0;i<MAX_PS_EVENTS;i++) word(output,ps.events[i]);for(i=0;i<MAX_PS_EVENTS;i++) word(output,ps.eventParms[i]);
        previous=ps;
    }
    fclose(input);fclose(output);return 0;
}
