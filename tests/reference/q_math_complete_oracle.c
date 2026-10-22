/* SPDX-License-Identifier: GPL-2.0-or-later
 * Deterministic q_math.c completion oracle linked with the unchanged source.
 */
#include "q_shared.h"
#include <stdint.h>
#include <stdio.h>
static void word(FILE *f,uint32_t value){fwrite(&value,4,1,f);}
static void scalar(FILE *f,float value){uint32_t bits;memcpy(&bits,&value,4);word(f,bits);}
int main(int argc,char **argv){
 FILE *f;vec3_t a={1,2,3},b={4,6,3},out,mins={-1,-1,-1},maxs={1,1,1};vec4_t plane;vec3_t colorOut;float maximum; cplane_t cp;
 if(argc!=2 || !(f=fopen(argv[1],"wb")))return 2;word(f,0x514d4332u);
 word(f,(uint32_t)(int32_t)ClampChar(-500));word(f,(uint32_t)(int32_t)ClampChar(500));word(f,(uint32_t)(int32_t)ClampShort(-40000));word(f,(uint32_t)(int32_t)ClampShort(40000));
 word(f,ColorBytes3(1.0f,0.5f,0.0f));word(f,ColorBytes4(1.0f,0.5f,0.0f,1.0f));word(f,Q_log2(1));word(f,Q_log2(8));
 scalar(f,AngleSubtract(10.0f,350.0f));scalar(f,AngleMod(720.25f));scalar(f,AngleDelta(5.0f,355.0f));scalar(f,VectorLengthSquared(a));scalar(f,DistanceSquared(a,b));scalar(f,Distance(a,b));
 maximum=NormalizeColor(a,colorOut);scalar(f,maximum);scalar(f,colorOut[0]);scalar(f,colorOut[1]);scalar(f,colorOut[2]);
 word(f,PlaneFromPoints(plane,(vec3_t){0,0,0},(vec3_t){1,0,0},(vec3_t){0,1,0}));scalar(f,plane[0]);scalar(f,plane[1]);scalar(f,plane[2]);scalar(f,plane[3]);
 memset(&cp,0,sizeof(cp));cp.normal[0]=1;cp.type=3;cp.dist=0;SetPlaneSignbits(&cp);word(f,cp.signbits);word(f,BoxOnPlaneSide(mins,maxs,&cp));
 scalar(f,RadiusFromBounds((vec3_t){-3,-4,-12},(vec3_t){1,2,3}));
 ProjectPointOnPlane(out,(vec3_t){1,2,3},(vec3_t){0,0,1});scalar(f,out[0]);scalar(f,out[1]);scalar(f,out[2]);
 RotatePointAroundVector(out,(vec3_t){0,0,1},(vec3_t){1,0,0},90);scalar(f,out[0]);scalar(f,out[1]);scalar(f,out[2]);
 word(f,DirToByte(bytedirs[52]));ByteToDir(52,out);scalar(f,out[0]);scalar(f,out[1]);scalar(f,out[2]);
 fclose(f);return 0;
}
