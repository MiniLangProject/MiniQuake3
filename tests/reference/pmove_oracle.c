/* SPDX-License-Identifier: GPL-2.0-or-later
 * Full unmodified baseq3 Pmove plus original static map collision.
 */
#include "cm_local.h"
#include "bg_pmove.c"
#include "snapvector.inc"
#include "playerstate_offsets.inc"
void trap_SnapVector(float *v) { Sys_SnapVector(v); }
void trap_Cvar_VariableStringBuffer(const char *name,char *buffer,int size) {
    if(strcmp(name,"showevents") || size<2) exit(61);
    strcpy(buffer,"0");
}
static void worldTrace(trace_t *tr,const vec3_t start,const vec3_t mins,const vec3_t maxs,
                       const vec3_t end,int client,int mask) {
    CM_BoxTrace(tr,start,end,mins,maxs,0,mask,qfalse);
    tr->entityNum=tr->fraction<1 ? ENTITYNUM_WORLD : ENTITYNUM_NONE;
}
static int worldContents(const vec3_t point,int client) { return CM_PointContents(point,0); }
static void word(FILE *out,int value) { if(fwrite(&value,4,1,out)!=1) exit(62); }
static void real(FILE *out,float value) { if(fwrite(&value,4,1,out)!=1) exit(62); }
int main(int argc,char **argv) {
    FILE *input,*output;int checksum,i,j;
    pmove_t move;playerState_t ps,previous;
    struct {playerState_t ps;usercmd_t cmd;int chain,fixed,fixedMsec,gauntlet,noFootsteps,single,environment;} query;
    if(argc==3 && !strcmp(argv[1],"--math")) {
        vec3_t angles,forward,right,up,snap;
        output=fopen(argv[2],"wb");if(!output)return 3;
        word(output,sizeof(playerState_t));word(output,sizeof(usercmd_t));word(output,bg_numItems);
        for(i=0;i<bg_numItems;i++)word(output,bg_itemlist[i].giTag);
        for(i=0;i<65536;i++) {
            angles[0]=i*(360.0/65536);angles[1]=((i*73)&65535)*(360.0/65536);angles[2]=((i*1297)&65535)*(360.0/65536);
            AngleVectors(angles,forward,right,up);
            for(j=0;j<3;j++)real(output,forward[j]);for(j=0;j<3;j++)real(output,right[j]);for(j=0;j<3;j++)real(output,up[j]);
            snap[0]=(i-32768)*0.5;snap[1]=(i-32768)*0.25;snap[2]=(i-32768)*0.75;
            Sys_SnapVector(snap);for(j=0;j<3;j++)real(output,snap[j]);
        }
        {
            unsigned int bits[]={0,0x80000000,1,0x80000001,0x3f000000,0xbf000000,0x3fc00000,0xbfc00000,
                0x3effffff,0x3f000001,0xbeffffff,0xbf000001,0x4affffff,0xcaffffff,
                0x4effffff,0xceffffff,0x4f000000,0xcf000000,0x4f000001,0xcf000001,
                0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7fc00000,0xffc00000};
            word(output,sizeof(bits)/sizeof(bits[0]));
            for(i=0;i<sizeof(bits)/sizeof(bits[0]);i++) {
                word(output,bits[i]);memcpy(&snap[0],&bits[i],4);snap[1]=snap[2]=snap[0];
                Sys_SnapVector(snap);real(output,snap[0]);
            }
        }
        fclose(output);return 0;
    }
    if(argc!=5 || sizeof(query)!=520 || sizeof(playerState_t)!=468 || sizeof(usercmd_t)!=24) return 2;
    CM_LoadMap(argv[1],qfalse,&checksum);cm_noCurves->integer=atoi(argv[4]);
    input=fopen(argv[2],"rb");output=fopen(argv[3],"wb");if(!input || !output) return 3;
    memset(&previous,0,sizeof(previous));
    while(fread(&query,sizeof(query),1,input)==1) {
        memset(&move,0,sizeof(move));memset(&pml,0,sizeof(pml));
        ps=query.chain ? previous : query.ps;
        move.ps=&ps;move.cmd=query.cmd;move.trace=worldTrace;move.pointcontents=worldContents;
        move.tracemask=MASK_PLAYERSOLID;move.pmove_fixed=query.fixed;move.pmove_msec=query.fixedMsec;
        move.gauntletHit=query.gauntlet;move.noFootsteps=query.noFootsteps;
        if(query.single)PmoveSingle(&move);else Pmove(&move);
        fwrite(&ps,sizeof(ps),1,output);fwrite(&move.cmd,sizeof(move.cmd),1,output);
        for(i=0;i<3;i++)real(output,move.mins[i]);for(i=0;i<3;i++)real(output,move.maxs[i]);
        word(output,move.watertype);word(output,move.waterlevel);real(output,move.xyspeed);
        word(output,move.numtouch);
        for(i=0;i<MAXTOUCH;i++)word(output,i<move.numtouch ? move.touchents[i] : 0);
        word(output,move.tracemask);
        previous=ps;
    }
    fclose(input);fclose(output);return 0;
}
