/* SPDX-License-Identifier: GPL-2.0-or-later
 * Original transformed/static/temp-box collision, no changes to engine code.
 */
#include "cm_local.h"
#include "bg_public.h"
static void word(FILE *out,int value) { if(fwrite(&value,4,1,out)!=1) exit(35); }
static void real(FILE *out,float value) { if(fwrite(&value,4,1,out)!=1) exit(35); }
int main(int argc,char **argv) {
    FILE *input,*output;int checksum,i,model;trace_t tr;vec3_t mins,maxs;
    struct {vec3_t start,end,mins,maxs,origin,angles,tempmins,tempmaxs;int model,mask,capsule,kind;} query;
    if(argc==3 && !strcmp(argv[1],"--capsule-rejection")) {
        CM_LoadMap(argv[2],qfalse,&checksum);
        VectorSet(mins,-15,-15,-24);VectorSet(maxs,15,15,32);
        model=CM_TempBoxModel(mins,maxs,qtrue);
        if(model!=CAPSULE_MODEL_HANDLE)return 3;
        CM_BoxTrace(&tr,vec3_origin,vec3_origin,mins,maxs,model,MASK_PLAYERSOLID,qtrue);
        return 0;
    }
    if(argc!=5 || sizeof(query)!=112)return 2;
    CM_LoadMap(argv[1],qfalse,&checksum);cm_noCurves->integer=atoi(argv[4]);
    input=fopen(argv[2],"rb");output=fopen(argv[3],"wb");if(!input || !output)return 3;
    while(fread(&query,sizeof(query),1,input)==1) {
        model=query.model;
        if(query.kind>=1 && query.kind<=3)model=CM_TempBoxModel(query.tempmins,query.tempmaxs,qfalse);
        if(query.kind==3)CM_TempBoxModel(query.mins,query.maxs,qtrue); /* bounds change, box planes do not */
        if(query.kind==2 || query.kind==3 || query.kind==4)
            CM_BoxTrace(&tr,query.start,query.end,query.mins,query.maxs,model,query.mask,query.capsule);
        else CM_TransformedBoxTrace(&tr,query.start,query.end,query.kind==5?NULL:query.mins,query.kind==5?NULL:query.maxs,model,query.mask,query.origin,query.angles,query.capsule);
        real(output,tr.fraction);for(i=0;i<3;i++)real(output,tr.plane.normal[i]);
        real(output,tr.plane.dist);word(output,tr.surfaceFlags);word(output,tr.contents);
        word(output,tr.startsolid);word(output,tr.allsolid);for(i=0;i<3;i++)real(output,tr.endpos[i]);
        word(output,CM_TransformedPointContents(query.start,model,query.origin,query.angles));
        word(output,CM_TransformedPointContents(query.end,model,query.origin,query.angles));
        word(output,tr.plane.type|(tr.plane.signbits<<8));word(output,model);
        CM_ModelBounds(model,mins,maxs);for(i=0;i<3;i++)real(output,mins[i]);for(i=0;i<3;i++)real(output,maxs[i]);
        word(output,CM_PointContents(query.start,model));word(output,CM_PointContents(query.end,model));
    }
    fclose(input);fclose(output);return 0;
}
