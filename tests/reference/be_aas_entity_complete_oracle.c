#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdarg.h>

typedef int qboolean; typedef float vec3_t[3];
#define qtrue 1
#define qfalse 0
#define PRT_FATAL 3
#define ET_MOVER 4
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorClear(a) memset((a),0,sizeof(vec3_t))
#define VectorAdd(a,b,c) do{(c)[0]=(a)[0]+(b)[0];(c)[1]=(a)[1]+(b)[1];(c)[2]=(a)[2]+(b)[2];}while(0)
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
#define VectorLength(v) sqrtf((v)[0]*(v)[0]+(v)[1]*(v)[1]+(v)[2]*(v)[2])
#define Com_Memset memset
#define Com_Memcpy memcpy

typedef struct { int valid,type,flags;float ltime,update_time;int number;vec3_t origin,angles,old_origin,lastvisorigin,mins,maxs;int groundent,solid,modelindex,modelindex2,frame,event,eventParm,powerups,weapon,legsAnim,torsoAnim; } aas_entityinfo_t;
typedef struct { aas_entityinfo_t i; void *areas,*leaves; } aas_entity_t;
typedef struct { vec3_t origin,angles,absmins,absmaxs;int solid,modelnum; } bsp_entdata_t;
typedef struct { int loaded,initialized,maxentities,numframes;float time;aas_entity_t *entities; } aas_t;
static aas_t aasworld;
static int area_unlinks,leaf_unlinks;
static void Print(int kind,const char *fmt,...){(void)kind;(void)fmt;}
static struct { void (*Print)(int,const char*,...); } botimport={Print};
static void AAS_UnlinkFromAreas(void *value){if(value)area_unlinks++;}
static void AAS_UnlinkFromBSPLeaves(void *value){if(value)leaf_unlinks++;}
static int AAS_BestReachableLinkArea(void *value){return value?77:0;}

#include "be_aas_entity_complete_under_test.inc"

static void V(const vec3_t v){printf("%.0f,%.0f,%.0f",v[0],v[1],v[2]);}
int main(void){
  aas_entity_t entities[6];aas_entityinfo_t info;bsp_entdata_t bsp;vec3_t a,b,o;memset(entities,0,sizeof(entities));aasworld.loaded=1;aasworld.initialized=1;aasworld.maxentities=6;aasworld.entities=entities;
  entities[1].i.valid=1;entities[1].i.number=1;entities[1].i.type=1;entities[1].i.modelindex=7;entities[1].i.origin[0]=10;entities[1].i.origin[1]=20;entities[1].i.origin[2]=30;entities[1].i.mins[0]=-2;entities[1].i.mins[1]=-3;entities[1].i.mins[2]=-4;entities[1].i.maxs[0]=2;entities[1].i.maxs[1]=3;entities[1].i.maxs[2]=4;entities[1].areas=(void*)1;entities[1].leaves=(void*)2;
  entities[2].i.valid=1;entities[2].i.number=2;entities[2].i.type=4;entities[2].i.modelindex=9;entities[2].i.origin[0]=90;entities[2].i.origin[1]=80;entities[2].i.origin[2]=70;
  entities[3].i.valid=1;entities[3].i.number=3;entities[3].i.modelindex=7;entities[3].i.origin[0]=12;entities[3].i.origin[1]=21;entities[3].i.origin[2]=33;
  AAS_EntityInfo(1,&info);printf("info=%d,%d,%d\n",info.valid,info.number,info.modelindex);
  AAS_EntityOrigin(1,o);printf("origin=");V(o);printf("\nmodel=%d,%d,%d\n",AAS_EntityModelindex(1),AAS_EntityType(1),AAS_EntityModelNum(1));
  printf("mover=%d:",AAS_OriginOfMoverWithModelNum(9,o));V(o);printf("\n");
  AAS_EntitySize(1,a,b);printf("size=");V(a);printf(":");V(b);printf("\n");
  AAS_EntityBSPData(1,&bsp);printf("bsp=");V(bsp.absmins);printf(":");V(bsp.absmaxs);printf(":%d\n",bsp.modelnum);
  o[0]=12;o[1]=21;o[2]=33;printf("nearest=%d\nbest=%d\nnext=%d,%d\n",AAS_NearestEntity(o,7),AAS_BestReachableEntityArea(1),AAS_NextEntity(-1),AAS_NextEntity(1));
  entities[4].areas=(void*)4;entities[4].leaves=(void*)5;AAS_UnlinkInvalidEntities();printf("unlinks=%d,%d\n",area_unlinks,leaf_unlinks);
  AAS_InvalidateEntities();printf("invalid=%d,%d\n",entities[2].i.valid,entities[2].i.number);AAS_ResetEntityLinks();printf("reset=%d,%d\n",entities[1].areas==0,entities[1].leaves==0);return 0;
}
