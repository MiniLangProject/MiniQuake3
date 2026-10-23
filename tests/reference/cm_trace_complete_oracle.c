/* SPDX-License-Identifier: GPL-2.0-or-later
 * Differential host for unchanged BASIC MATH functions extracted verbatim
 * from code/qcommon/cm_trace.c by scripts/test_cm_trace_complete.py.
 */
#include "cm_local.h"
#include <stdint.h>

void CM_ProjectPointOntoVector(vec3_t,vec3_t,vec3_t,vec3_t);
float CM_DistanceFromLineSquared(vec3_t,vec3_t,vec3_t,vec3_t);
float CM_VectorDistanceSquared(vec3_t,vec3_t);
float SquareRootFloat(float);
void RotatePoint(vec3_t,vec3_t[3]);
void TransposeMatrix(vec3_t[3],vec3_t[3]);
void CreateRotationMatrix(const vec3_t,vec3_t[3]);

typedef struct { int op; vec3_t a,b,c; float scalar; } query_t;
static void put(FILE *f,float x){ if(fwrite(&x,4,1,f)!=1) exit(3); }
int main(int argc,char **argv){
  FILE *in,*out;query_t q;vec3_t v,m[3],t[3];int i,j;
  if(argc!=3 || sizeof(query_t)!=44)return 2;
  in=fopen(argv[1],"rb");out=fopen(argv[2],"wb");if(!in||!out)return 3;
  while(fread(&q,sizeof(q),1,in)==1){
    for(i=0;i<10;i++)v[i%3]=0; /* keep stack deterministic */
    for(i=0;i<3;i++)for(j=0;j<3;j++)m[i][j]=t[i][j]=0;
    if(q.op==0){CM_ProjectPointOntoVector(q.a,q.b,q.c,v);for(i=0;i<3;i++)put(out,v[i]);}
    else if(q.op==1)put(out,CM_DistanceFromLineSquared(q.a,q.b,q.c+0,q.c));
    else if(q.op==2)put(out,CM_VectorDistanceSquared(q.a,q.b));
    else if(q.op==3)put(out,SquareRootFloat(q.scalar));
    else if(q.op==4){CreateRotationMatrix(q.a,m);for(i=0;i<3;i++)for(j=0;j<3;j++)put(out,m[i][j]);}
    else if(q.op==5){CreateRotationMatrix(q.b,m);VectorCopy(q.a,v);RotatePoint(v,m);for(i=0;i<3;i++)put(out,v[i]);}
    else {VectorCopy(q.a,m[0]);VectorCopy(q.b,m[1]);VectorCopy(q.c,m[2]);TransposeMatrix(m,t);for(i=0;i<3;i++)for(j=0;j<3;j++)put(out,t[i][j]);}
    for(i=(q.op==4||q.op==6)?9:(q.op==0||q.op==5)?3:1;i<10;i++)put(out,0.0f);
  }
  fclose(in);fclose(out);return 0;
}
