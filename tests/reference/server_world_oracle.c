/* SPDX-License-Identifier: GPL-2.0-or-later
 * Actual sv_world.c, sv_game.c address helpers, CM and Pmove. Only input,
 * output, shared entity storage, time-independent host traps are supplied.
 */
#include "../../Quake-III-Arena-original-source/code/server/sv_world.c"
#include "snapvector.inc"
#include "playerstate_offsets.inc"
#include "server_helpers.inc"
server_t sv;
static sharedEntity_t entities[MAX_GENTITIES];
static playerState_t previous;
void trap_SnapVector(float *v) { Sys_SnapVector(v); }
void trap_Cvar_VariableStringBuffer(const char *name,char *buffer,int size) {
    if(strcmp(name,"showevents") || size<2)exit(61);strcpy(buffer,"0");
}
static void worldTrace(trace_t *tr,const vec3_t start,const vec3_t mins,const vec3_t maxs,const vec3_t end,int client,int mask) {
    SV_Trace(tr,start,(float*)mins,(float*)maxs,end,client,mask,qfalse);
}
static void word(FILE *out,int value) { if(fwrite(&value,4,1,out)!=1)exit(62); }
static void real(FILE *out,float value) { if(fwrite(&value,4,1,out)!=1)exit(62); }
static void readData(FILE *in,void *p,int size) { if(fread(p,size,1,in)!=1)exit(63); }
static void metadata(FILE *out,int number) {
    int i;sharedEntity_t *e=&entities[number];svEntity_t *s=&sv.svEntities[number];
    word(out,e->r.linked);word(out,e->r.linkcount);word(out,e->s.solid);
    for(i=0;i<3;i++)real(out,e->r.absmin[i]);for(i=0;i<3;i++)real(out,e->r.absmax[i]);
    word(out,s->numClusters);for(i=0;i<16;i++)word(out,i<s->numClusters?s->clusternums[i]:0);
    word(out,s->lastCluster);word(out,s->areanum);word(out,s->areanum2);
    word(out,s->worldSector?(int)(s->worldSector-sv_worldSectors):-1);
}
static void traceWords(FILE *out,trace_t *tr) {
    int i;real(out,tr->fraction);for(i=0;i<3;i++)real(out,tr->plane.normal[i]);real(out,tr->plane.dist);
    word(out,tr->surfaceFlags);word(out,tr->contents);word(out,tr->startsolid);word(out,tr->allsolid);
    for(i=0;i<3;i++)real(out,tr->endpos[i]);word(out,tr->plane.type|(tr->plane.signbits<<8));word(out,tr->entityNum);
}
int main(int argc,char **argv) {
    FILE *in,*out;int checksum,op,i,number;
    struct {int number,bmodel,modelindex,flags,contents,owner;vec3_t mins,maxs,currentOrigin,currentAngles,origin,angles;} ent;
    struct {vec3_t start,end,mins,maxs;int number,mask,capsule;} query;
    struct {vec3_t mins,maxs;int capacity;} area;
    struct {vec3_t point;int pass;} point;
    struct {playerState_t ps;usercmd_t cmd;int chain,fixed,fixedMsec,gauntlet,noFootsteps,single,environment;} command;
    if(argc!=5 || sizeof(ent)!=96 || sizeof(query)!=60 || sizeof(command)!=520)return 2;
    CM_LoadMap(argv[1],qfalse,&checksum);Cvar_Get("cm_noCurves","0",0)->integer=atoi(argv[4]);
    in=fopen(argv[2],"rb");out=fopen(argv[3],"wb");if(!in || !out)return 3;
    while(fread(&op,4,1,in)==1) {
        if(op==0) {
            memset(&sv,0,sizeof(sv));memset(entities,0,sizeof(entities));memset(&previous,0,sizeof(previous));
            sv.gentities=entities;sv.gentitySize=sizeof(entities[0]);sv.num_entities=MAX_GENTITIES;sv.state=SS_LOADING;
            for(i=0;i<MAX_GENTITIES;i++)entities[i].s.number=i;
            SV_ClearWorld();word(out,sv_numworldSectors);
            for(i=0;i<sv_numworldSectors;i++) {
                worldSector_t *s=&sv_worldSectors[i];word(out,s->axis);real(out,s->dist);
                word(out,s->children[0]?(int)(s->children[0]-sv_worldSectors):-1);
                word(out,s->children[1]?(int)(s->children[1]-sv_worldSectors):-1);
            }
        } else if(op==1) {
            sharedEntity_t *e;readData(in,&ent,sizeof(ent));if(ent.number<0 || ent.number>=MAX_GENTITIES)return 4;e=&entities[ent.number];
            e->r.bmodel=ent.bmodel;e->s.modelindex=ent.modelindex;e->r.svFlags=ent.flags;e->r.contents=ent.contents;e->r.ownerNum=ent.owner;
            VectorCopy(ent.mins,e->r.mins);VectorCopy(ent.maxs,e->r.maxs);VectorCopy(ent.currentOrigin,e->r.currentOrigin);
            VectorCopy(ent.currentAngles,e->r.currentAngles);VectorCopy(ent.origin,e->s.origin);VectorCopy(ent.angles,e->s.angles);
            SV_LinkEntity(e);metadata(out,ent.number);
        } else if(op==2) {
            readData(in,&number,4);SV_UnlinkEntity(&entities[number]);metadata(out,number);
        } else if(op==3) {
            int list[MAX_GENTITIES],count;readData(in,&area,sizeof(area));count=SV_AreaEntities(area.mins,area.maxs,list,area.capacity);
            word(out,count);for(i=0;i<count;i++)word(out,list[i]);
        } else if(op==4 || op==5) {
            trace_t tr;readData(in,&query,sizeof(query));
            if(op==4)SV_Trace(&tr,query.start,query.mins,query.maxs,query.end,query.number,query.mask,query.capsule);
            else SV_ClipToEntity(&tr,query.start,query.mins,query.maxs,query.end,query.number,query.mask,query.capsule);
            traceWords(out,&tr);
        } else if(op==6) {
            readData(in,&point,sizeof(point));word(out,SV_PointContents(point.point,point.pass));
        } else if(op==7) {
            pmove_t move;playerState_t ps;readData(in,&command,sizeof(command));memset(&move,0,sizeof(move));
            ps=command.chain?previous:command.ps;move.ps=&ps;move.cmd=command.cmd;move.trace=worldTrace;move.pointcontents=SV_PointContents;
            move.tracemask=MASK_PLAYERSOLID;move.pmove_fixed=command.fixed;move.pmove_msec=command.fixedMsec;
            move.gauntletHit=command.gauntlet;move.noFootsteps=command.noFootsteps;
            if(command.single)PmoveSingle(&move);else Pmove(&move);
            fwrite(&ps,sizeof(ps),1,out);fwrite(&move.cmd,sizeof(move.cmd),1,out);
            for(i=0;i<3;i++)real(out,move.mins[i]);for(i=0;i<3;i++)real(out,move.maxs[i]);
            word(out,move.watertype);word(out,move.waterlevel);real(out,move.xyspeed);word(out,move.numtouch);
            for(i=0;i<MAXTOUCH;i++)word(out,i<move.numtouch?move.touchents[i]:0);word(out,move.tracemask);previous=ps;
        } else if(op==8) {
            entityState_t pad;struct {int number;vec3_t impulse;} touch;
            readData(in,&touch,sizeof(touch));memset(&pad,0,sizeof(pad));pad.number=touch.number;VectorCopy(touch.impulse,pad.origin2);
            BG_TouchJumpPad(&previous,&pad);fwrite(&previous,sizeof(previous),1,out);
        } else return 5;
    }
    fclose(in);fclose(out);return 0;
}
