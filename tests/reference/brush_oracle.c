/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "cm_local.h"
#include <stdint.h>
int c_brush_traces;
void CM_TraceThroughBrush(traceWork_t *,cbrush_t *);
static uint32_t rng=68;
static float next(void){rng=rng*1664525u+1013904223u;return ((int)(rng&65535u)-32768)/256.0f;}
static void word(FILE*f,int i){fwrite(&i,4,1,f);}
static void scalar(FILE*f,float v){fwrite(&v,4,1,f);}
int main(int argc,char**argv){
    FILE*f;int i,k,j;
    cplane_t planes[8];cbrushside_t sides[8];cbrush_t brush;traceWork_t tw;
    if(argc!=2||!(f=fopen(argv[1],"wb")))return 2;
    memset(&brush,0,sizeof(brush));memset(planes,0,sizeof(planes));memset(sides,0,sizeof(sides));
    for(i=0;i<6;i++){planes[i].normal[i/2]=(i&1)?1.0f:-1.0f;planes[i].dist=32;}
    planes[6].normal[0]=planes[6].normal[1]=0.70710677f;planes[6].dist=32;
    planes[7].normal[1]=planes[7].normal[2]=0.70710677f;planes[7].dist=32;
    for(i=0;i<8;i++){
        for(k=0;k<3;k++)if(planes[i].normal[k]<0)planes[i].signbits|=1<<k;
        sides[i].plane=&planes[i];sides[i].surfaceFlags=i+7;
    }
    brush.contents=1;brush.numsides=8;brush.sides=sides;
    for(i=0;i<4096;i++){
        memset(&tw,0,sizeof(tw));tw.trace.fraction=1;
        for(k=0;k<3;k++){tw.start[k]=next();tw.end[k]=next();tw.size[0][k]=-15;tw.size[1][k]=15;}
        if(i%8==0)memset(tw.start,0,sizeof(tw.start));
        if(i%16==0)memset(tw.end,0,sizeof(tw.end));
        tw.size[0][2]=-24;tw.size[1][2]=32;
        for(j=0;j<8;j++)for(k=0;k<3;k++)tw.offsets[j][k]=tw.size[(j>>k)&1][k];
        tw.sphere.use=i&1;tw.sphere.radius=5;tw.sphere.offset[2]=4;
        fwrite(tw.start,12,1,f);fwrite(tw.end,12,1,f);fwrite(tw.size,24,1,f);
        scalar(f,tw.sphere.radius);fwrite(tw.sphere.offset,12,1,f);word(f,tw.sphere.use);word(f,8);
        for(j=0;j<8;j++){fwrite(planes[j].normal,12,1,f);scalar(f,planes[j].dist);word(f,sides[j].surfaceFlags);}
        CM_TraceThroughBrush(&tw,&brush);
        scalar(f,tw.trace.fraction);fwrite(tw.trace.plane.normal,12,1,f);scalar(f,tw.trace.plane.dist);
        word(f,tw.trace.surfaceFlags);word(f,tw.trace.contents);word(f,tw.trace.startsolid);word(f,tw.trace.allsolid);
    }
    fclose(f);return 0;
}
