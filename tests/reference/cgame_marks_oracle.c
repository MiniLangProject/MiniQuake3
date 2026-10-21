#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdint.h>
#include <stdarg.h>

typedef int qboolean;
typedef int qhandle_t;
typedef unsigned char byte;
typedef float vec3_t[3];
#define qtrue 1
#define qfalse 0
#define MAX_MARK_POLYS 3
#define MAX_VERTS_ON_POLY 64
#define MAX_MARK_FRAGMENTS 128
#define MAX_MARK_POINTS 384
#define MARK_TOTAL_TIME 10000
#define MARK_FADE_TIME 1000
typedef struct { vec3_t xyz; float st[2]; byte modulate[4]; } polyVert_t;
typedef struct { int numVerts; } poly_t;
typedef struct markPoly_s { struct markPoly_s *prevMark,*nextMark; int time; qboolean alphaFade; qhandle_t markShader; poly_t poly; float color[4]; polyVert_t verts[MAX_VERTS_ON_POLY]; } markPoly_t;
typedef struct { int firstPoint,numPoints; } markFragment_t;
typedef struct { int integer; } cvar_t;
typedef struct { int time; } cg_t;
typedef struct { struct { qhandle_t energyMarkShader; } media; } cgs_t;
static cg_t cg;
static cgs_t cgs;
static cvar_t cg_addMarks={1};
static int drawCount;
markPoly_t cg_activeMarkPolys;
markPoly_t *cg_freeMarkPolys;
markPoly_t cg_markPolys[MAX_MARK_POLYS];
static int markTotal;

#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define CrossProduct(a,b,c) ((c)[0]=(a)[1]*(b)[2]-(a)[2]*(b)[1],(c)[1]=(a)[2]*(b)[0]-(a)[0]*(b)[2],(c)[2]=(a)[0]*(b)[1]-(a)[1]*(b)[0])
#define VectorScale(a,s,b) ((b)[0]=(a)[0]*(s),(b)[1]=(a)[1]*(s),(b)[2]=(a)[2]*(s))
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#define VectorSubtract(a,b,c) ((c)[0]=(a)[0]-(b)[0],(c)[1]=(a)[1]-(b)[1],(c)[2]=(a)[2]-(b)[2])
static float VectorNormalize2(const vec3_t v,vec3_t out){float length=sqrtf(DotProduct(v,v));if(length){float ilength=1.0f/length;VectorScale(v,ilength,out);}else memset(out,0,sizeof(vec3_t));return length;}
static void PerpendicularVector(vec3_t dst,const vec3_t src){int pos=0,i;float minelem=1.0f,d,temp[3]={0,0,0};for(i=0;i<3;i++){float e=fabsf(src[i]);if(e<minelem){pos=i;minelem=e;}}temp[pos]=1.0f;d=DotProduct(temp,src);for(i=0;i<3;i++)dst[i]=temp[i]-d*src[i];VectorNormalize2(dst,dst);}
static void RotatePointAroundVector(vec3_t dst,const vec3_t axis,const vec3_t point,float degrees){float r=degrees*3.14159265358979323846f/180.0f,c=cosf(r),s=sinf(r),cross[3],dot=DotProduct(axis,point);CrossProduct(axis,point,cross);dst[0]=point[0]*c+cross[0]*s+axis[0]*dot*(1-c);dst[1]=point[1]*c+cross[1]*s+axis[1]*dot*(1-c);dst[2]=point[2]*c+cross[2]*s+axis[2]*dot*(1-c);}
static void CG_Error(const char *format,...){va_list ap;va_start(ap,format);vfprintf(stderr,format,ap);va_end(ap);exit(90);}
static int trap_CM_MarkFragments(int count,const void *points,const vec3_t projection,int maxPoints,float *pointBuffer,int maxFragments,markFragment_t *fragments){const vec3_t *in=(const vec3_t*)points;int i;(void)projection;(void)maxPoints;(void)maxFragments;for(i=0;i<count;i++){pointBuffer[i*3]=in[i][0];pointBuffer[i*3+1]=in[i][1];pointBuffer[i*3+2]=in[i][2];}fragments[0].firstPoint=0;fragments[0].numPoints=count;return 1;}
static void trap_R_AddPolyToScene(qhandle_t shader,int count,const polyVert_t *verts){(void)shader;(void)count;(void)verts;drawCount++;}

#include "cgame_marks_under_test.inc"

static uint32_t bits(float value){union {float f;uint32_t u;} v;v.f=value;return v.u;}
static int mark_id(markPoly_t *mark){return (int)(mark-cg_markPolys);}
static int active_count(void){markPoly_t *m;int count=0;for(m=cg_activeMarkPolys.nextMark;m!=&cg_activeMarkPolys;m=m->nextMark)count++;return count;}
static void row(const char *name,markPoly_t *mark){polyVert_t *v=&mark->verts[0];printf("%s|%d|%d|%s|%u|%u|%u|%u|%u|%u\n",name,mark_id(mark),mark->time,mark->alphaFade?"true":"false",v->modulate[0],v->modulate[1],v->modulate[2],v->modulate[3],bits(v->st[0]),bits(v->st[1]));}
int main(void){
 markPoly_t *a,*b,*c,*d,*m;vec3_t origin={0,0,0},normal={0,0,1};
 CG_InitMarkPolys();a=CG_AllocMark();a->time=10;b=CG_AllocMark();b->time=10;c=CG_AllocMark();c->time=20;d=CG_AllocMark();
 printf("pool|%d|%d|%d|%d|2\n",mark_id(d),active_count(),mark_id(cg_activeMarkPolys.nextMark),mark_id(cg_activeMarkPolys.nextMark->nextMark));
 CG_InitMarkPolys();cg.time=100;cgs.media.energyMarkShader=99;CG_ImpactMark(11,origin,normal,0,1.0f,.5f,.25f,.75f,qfalse,2.0f,qfalse);m=cg_activeMarkPolys.nextMark;row("impact",m);
 cg.time=9500;CG_AddMarks();row("fade",m);cg.time=10000;CG_AddMarks();printf("live|%d\n",active_count());cg.time=10101;CG_AddMarks();printf("expired|%d|1\n",active_count());
 return 0;
}
