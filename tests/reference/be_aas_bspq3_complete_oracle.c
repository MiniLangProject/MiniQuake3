#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define qfalse 0
#define qtrue 1
#define PRT_MESSAGE 1
#define MAX_EPAIRKEY 128
typedef float vec3_t[3];
typedef int qboolean;
typedef struct { int allsolid,startsolid;float fraction;vec3_t endpos;float planeDist;vec3_t planeNormal;int planeSignbits,planeType,surfaceValue,ent;float expDist;int sidenum,contents; } bsp_trace_t;
typedef struct bsp_link_s { int unused; } bsp_link_t;
typedef struct bsp_epair_s { char *key;char *value;struct bsp_epair_s *next; } bsp_epair_t;
typedef struct bsp_entity_s { bsp_epair_t *epairs; } bsp_entity_t;
typedef struct { int loaded,entdatasize;char *dentdata;int numentities;bsp_entity_t entities[2048]; } bsp_t;
typedef struct {
 void (*Trace)(bsp_trace_t *,vec3_t,vec3_t,vec3_t,vec3_t,int,int);
 int (*PointContents)(vec3_t);
 void (*EntityTrace)(bsp_trace_t *,vec3_t,vec3_t,vec3_t,vec3_t,int,int);
 int (*inPVS)(vec3_t,vec3_t);
 void (*BSPModelMinsMaxsOrigin)(int,vec3_t,vec3_t,vec3_t,vec3_t);
 void (*Print)(int,const char *,...);
} botlib_import_t;
static botlib_import_t botimport;
static bsp_t bspworld;
#define Com_Memcpy memcpy
#define VectorClear(v) ((v)[0]=(v)[1]=(v)[2]=0)
#include "be_aas_bspq3_complete_under_test.inc"

static void trace_fn(bsp_trace_t *out,vec3_t a,vec3_t b,vec3_t c,vec3_t d,int ent,int mask) { (void)a;(void)b;(void)c;(void)d;(void)mask;memset(out,0,sizeof(*out));out->fraction=0.75f;out->ent=ent; }
static int contents_fn(vec3_t p) { return (int)p[0]+17; }
static void entity_trace_fn(bsp_trace_t *out,vec3_t a,vec3_t b,vec3_t c,vec3_t d,int ent,int mask) { (void)a;(void)b;(void)c;(void)d;(void)ent;(void)mask;memset(out,0,sizeof(*out));out->fraction=0.25f; }
static int pvs_fn(vec3_t a,vec3_t b) { return a[0]<b[0]; }
static void bounds_fn(int model,vec3_t angles,vec3_t mins,vec3_t maxs,vec3_t origin) { (void)angles;mins[0]=(float)-model;mins[1]=-2;mins[2]=-3;maxs[0]=(float)model;maxs[1]=2;maxs[2]=3;origin[0]=origin[1]=origin[2]=0; }
static void print_fn(int type,const char *fmt,...) { (void)type;(void)fmt; }
int main(void) {
 vec3_t a={2,0,0},b={5,0,0},mins={0,0,0},maxs={0,0,0},origin={9,9,9};bsp_trace_t tr,base;char text[16];float f;int i;vec3_t v;
 botimport.Trace=trace_fn;botimport.PointContents=contents_fn;botimport.EntityTrace=entity_trace_fn;botimport.inPVS=pvs_fn;botimport.BSPModelMinsMaxsOrigin=bounds_fn;botimport.Print=print_fn;
 tr=AAS_Trace(a,mins,maxs,b,-1,1);printf("imports=%g,%d,%d,%d\n",tr.fraction,AAS_PointContents(a),AAS_inPVS(a,b),AAS_inPHS(a,b));
 memset(&base,0,sizeof(base));base.fraction=0.5f;printf("collision=%d,",AAS_EntityCollision(3,a,mins,maxs,b,1,&base));printf("%g,%d\n",base.fraction,base.contents);
 AAS_BSPModelMinsMaxsOrigin(7,mins,mins,maxs,origin);printf("bounds=%g,%g,%g,%g\n",mins[0],mins[2],maxs[0],origin[0]);
 printf("stubs=%d,%d,%d\n",AAS_BSPLinkEntity(mins,maxs,1,2)==NULL,AAS_BoxEntities(mins,maxs,&i,1),AAS_BSPTraceLight(a,b,origin,&i,&i,&i));AAS_UnlinkFromBSPLeaves(NULL);
 bspworld.numentities=3;printf("next=%d,%d,%d,%d\n",AAS_NextBSPEntity(0),AAS_NextBSPEntity(1),AAS_NextBSPEntity(2),AAS_BSPEntityInRange(3));
 { bsp_epair_t first={"origin","1.5 -2 3",NULL},second={"count","-42",&first};bspworld.entities[1].epairs=&second;
   printf("value=%d,%s,",AAS_ValueForBSPEpairKey(1,"count",text,sizeof(text)),text);printf("missing=%d\n",AAS_ValueForBSPEpairKey(1,"none",text,sizeof(text)));
   printf("typed=%d,",AAS_VectorForBSPEpairKey(1,"origin",v));printf("%g,%g,%g,",v[0],v[1],v[2]);printf("%d,",AAS_FloatForBSPEpairKey(1,"origin",&f));printf("%g,%d,",f,AAS_IntForBSPEpairKey(1,"count",&i));printf("%d\n",i);
 }
 return 0;
}
