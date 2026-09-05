/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "../../Quake-III-Arena-original-source/code/server/sv_world.c"
#include "server_functions.inc"
server_t sv;
void hostServerReset(void *entities,int size,int count) {
    memset(&sv,0,sizeof(sv));sv.gentities=entities;sv.gentitySize=size;sv.num_entities=count;sv.state=SS_LOADING;SV_ClearWorld();
}
void hostLink(void *e) { SV_LinkEntity(e); }
void hostUnlink(void *e) { SV_UnlinkEntity(e); }
int hostContact(const vec3_t mins,const vec3_t maxs,void *e,int capsule) { return SV_EntityContact((float*)mins,(float*)maxs,e,capsule); }
int hostArea(const vec3_t mins,const vec3_t maxs,int *list,int count) { return SV_AreaEntities(mins,maxs,list,count); }
void hostTrace(trace_t *tr,const vec3_t start,const vec3_t mins,const vec3_t maxs,const vec3_t end,int pass,int mask) { SV_Trace(tr,start,(float*)mins,(float*)maxs,end,pass,mask,0); }
int hostContents(const vec3_t point,int pass) { return SV_PointContents(point,pass); }
void hostMetadata(int number,int *out) {
    svEntity_t *e=&sv.svEntities[number];int i;out[0]=e->numClusters;
    for(i=0;i<16;i++)out[1+i]=i<e->numClusters?e->clusternums[i]:0;
    out[17]=e->lastCluster;out[18]=e->areanum;out[19]=e->areanum2;
    out[20]=e->worldSector?(int)(e->worldSector-sv_worldSectors):-1;
}
