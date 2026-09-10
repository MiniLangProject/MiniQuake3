/* Host for unchanged Baseq3 snapshot visibility helpers. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "q_shared.h"
#include "g_public.h"
#define ERR_DROP 1
#define MAX_SNAPSHOT_ENTITIES 1024
#define MAX_ENT_CLUSTERS 16
typedef struct { int numSnapshotEntities; int snapshotEntities[MAX_SNAPSHOT_ENTITIES]; } snapshotEntityNumbers_t;
typedef struct svEntity_s { entityState_t baseline; int numClusters; int clusternums[MAX_ENT_CLUSTERS]; int lastCluster,areanum,areanum2,snapshotCounter; } svEntity_t;
typedef struct { int areabytes; byte areabits[MAX_MAP_AREA_BYTES]; playerState_t ps; int num_entities,first_entity; } clientSnapshot_t;
static struct { int state,snapshotCounter,num_entities;svEntity_t svEntities[MAX_GENTITIES];sharedEntity_t gentities[MAX_GENTITIES]; } sv;
static byte pvsrows[2][2];
static void Com_Error(int code,const char*text,...){(void)code;(void)text;abort();}
static void Com_DPrintf(const char*text,...){(void)text;}
static sharedEntity_t *SV_GentityNum(int n){return &sv.gentities[n];}
static svEntity_t *SV_SvEntityForGentity(sharedEntity_t*e){return &sv.svEntities[e-sv.gentities];}
static int CM_PointLeafnum(const vec3_t p){return p[0]>=100.0f?1:0;}
static int CM_LeafArea(int leaf){return leaf;}
static int CM_LeafCluster(int leaf){return leaf;}
static int CM_WriteAreaBits(byte*b,int area){b[0]|=(byte)(1<<area);return 1;}
static byte *CM_ClusterPVS(int cluster){return pvsrows[cluster?1:0];}
static qboolean CM_AreasConnected(int a,int b){return a==b;}
static void Com_Memset(void*p,int v,size_t n){memset(p,v,n);}
#define PACKET_MASK 31
#define CS_ZOMBIE 1
typedef struct { int outgoingSequence; } netchan_stub_t;
typedef struct client_s { clientSnapshot_t frames[32]; netchan_stub_t netchan; sharedEntity_t *gentity; int state; } client_t;
static struct { client_t clients[1];entityState_t snapshotEntities[8];int numSnapshotEntities,nextSnapshotEntities; } svs;
static playerState_t gameps[1];
static playerState_t *SV_GameClientNum(int n){return &gameps[n];}
#include "snapshot_build_under_test.inc"
static void setup(int n){int i;memset(&sv,0,sizeof(sv));sv.state=1;sv.snapshotCounter=1;sv.num_entities=n;memset(pvsrows,0,sizeof(pvsrows));for(i=0;i<n;i++){sv.gentities[i].s.number=i;sv.gentities[i].r.linked=qtrue;sv.svEntities[i].numClusters=1;sv.svEntities[i].clusternums[0]=0;sv.svEntities[i].areanum=0;sv.svEntities[i].areanum2=0;}}
static void emit(const char*name,clientSnapshot_t*f,snapshotEntityNumbers_t*n){int i;qsort(n->snapshotEntities,n->numSnapshotEntities,sizeof(int),SV_QsortEntityNumbers);printf("%s|%d|",name,n->numSnapshotEntities);for(i=0;i<n->numSnapshotEntities;i++)printf("%s%d",i?",":"",n->snapshotEntities[i]);printf("|%02x|",f->areabits[0]);for(i=0;i<sv.num_entities;i++)printf("%s%d",i?",":"",sv.svEntities[i].snapshotCounter==sv.snapshotCounter);printf("\n");}
static void visible(const char*name,clientSnapshot_t*f){snapshotEntityNumbers_t n;vec3_t o={0,0,0};memset(&n,0,sizeof(n));SV_AddEntitiesVisibleFromPoint(o,f,&n,qfalse);emit(name,f,&n);}
int main(void){clientSnapshot_t f;
 setup(9);memset(&f,0,sizeof(f));f.ps.clientNum=2;pvsrows[0][0]=1;sv.gentities[1].r.linked=qfalse;sv.gentities[2].r.svFlags=SVF_NOCLIENT;sv.gentities[3].r.svFlags=SVF_SINGLECLIENT;sv.gentities[3].r.singleClient=2;sv.gentities[4].r.svFlags=SVF_SINGLECLIENT;sv.gentities[4].r.singleClient=1;sv.gentities[5].r.svFlags=SVF_NOTSINGLECLIENT;sv.gentities[5].r.singleClient=2;sv.gentities[6].r.svFlags=SVF_NOTSINGLECLIENT;sv.gentities[6].r.singleClient=1;sv.gentities[7].r.svFlags=SVF_CLIENTMASK;sv.gentities[7].r.singleClient=1<<2;sv.gentities[8].r.svFlags=SVF_CLIENTMASK;sv.gentities[8].r.singleClient=1<<1;visible("filters",&f);
 setup(2);memset(&f,0,sizeof(f));f.ps.clientNum=0;sv.gentities[0].r.svFlags=SVF_BROADCAST;sv.svEntities[0].numClusters=0;sv.svEntities[0].areanum=1;sv.svEntities[1].areanum=1;visible("broadcast",&f);
 setup(4);memset(&f,0,sizeof(f));f.ps.clientNum=0;pvsrows[0][0]=1;pvsrows[1][0]=2;sv.gentities[1].r.svFlags=0;sv.svEntities[1].clusternums[0]=1;sv.svEntities[1].areanum=1;sv.gentities[2].r.linked=qfalse;sv.gentities[3].r.svFlags=SVF_PORTAL;sv.gentities[3].s.origin2[0]=100.0f;visible("portal",&f);
 setup(2);memset(&f,0,sizeof(f));f.ps.clientNum=0;pvsrows[0][0]=1;sv.svEntities[1].snapshotCounter=sv.snapshotCounter;visible("dedupe",&f);
 setup(3);memset(&svs,0,sizeof(svs));memset(gameps,0,sizeof(gameps));pvsrows[0][0]=1;sv.gentities[2].r.svFlags=SVF_BROADCAST;svs.numSnapshotEntities=4;svs.nextSnapshotEntities=3;svs.clients[0].gentity=&sv.gentities[0];svs.clients[0].netchan.outgoingSequence=0;gameps[0].clientNum=0;gameps[0].origin[0]=10;gameps[0].origin[1]=20;gameps[0].origin[2]=30;gameps[0].viewheight=26;SV_BuildClientSnapshot(&svs.clients[0]);{clientSnapshot_t*x=&svs.clients[0].frames[0];printf("build|%d|%d|%d|%d,%d|%02x|%d,%d,%d\n",x->first_entity,x->num_entities,svs.nextSnapshotEntities,svs.snapshotEntities[3].number,svs.snapshotEntities[0].number,x->areabits[0],(int)x->ps.origin[2],x->ps.viewheight,x->ps.clientNum);}
 return 0;}
