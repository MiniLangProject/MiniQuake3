#include "cm_local.h"
#include <stdint.h>

extern byte *cmod_base;

static uint32_t bits(float value) { uint32_t out; memcpy(&out,&value,4); return out; }
static byte *read_map(const char *name,int *length) {
    void *data=NULL;*length=FS_ReadFile(name,&data);if(!data || *length<sizeof(dheader_t)) exit(70);return data;
}
int main(int argc,char **argv) {
    int checksum,length,index,patches=0;unsigned metadata;byte *data;dheader_t *header;vec3_t mins,maxs;
    if(argc!=2) return 2;
    CM_LoadMap(argv[1],qfalse,&checksum);
    printf("load=%u,%d,%d,%d,%d,%d\n",(unsigned)checksum,CM_NumClusters(),CM_NumInlineModels(),cm.numLeafs,cm.numAreas,cm.numShaders);
    printf("entity=%d,%u\n",cm.numEntityChars,(unsigned)Com_BlockChecksum(cm.entityString,cm.numEntityChars));
    printf("shader0=%s,%u,%u\n",cm.shaders[0].shader,(unsigned)cm.shaders[0].surfaceFlags,(unsigned)cm.shaders[0].contentFlags);
    printf("shaderN=%s,%u,%u\n",cm.shaders[cm.numShaders-1].shader,(unsigned)cm.shaders[cm.numShaders-1].surfaceFlags,(unsigned)cm.shaders[cm.numShaders-1].contentFlags);
    printf("leaf0=%d,%d\n",CM_LeafCluster(0),CM_LeafArea(0));
    printf("leafN=%d,%d\n",CM_LeafCluster(cm.numLeafs-1),CM_LeafArea(cm.numLeafs-1));
    CM_ModelBounds(0,mins,maxs);printf("model0=%u,%u,%u,%u,%u,%u\n",bits(mins[0]),bits(mins[1]),bits(mins[2]),bits(maxs[0]),bits(maxs[1]),bits(maxs[2]));
    CM_ModelBounds(cm.numSubModels-1,mins,maxs);printf("modelN=%u,%u,%u,%u,%u,%u\n",bits(mins[0]),bits(mins[1]),bits(mins[2]),bits(maxs[0]),bits(maxs[1]),bits(maxs[2]));
    for(index=0;index<cm.numSurfaces;index++) if(cm.surfaces[index]) patches++;
    printf("lumps=%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,patches=%d\n",cm.numEntityChars,cm.numShaders,cm.numPlanes,cm.numNodes,cm.numLeafs,cm.numLeafSurfaces,cm.numLeafBrushes,cm.numSubModels,cm.numBrushes,cm.numBrushSides,cm.numSurfaces,cm.numClusters,cm.clusterBytes,cm.numAreas,cm.vised,cm.numLeafBrushes,cm.numLeafSurfaces,patches);
    data=read_map(argv[1],&length);header=(dheader_t*)data;cmod_base=data;metadata=CM_Checksum(header);
    printf("checksums=%u",metadata);for(index=0;index<17;index++) printf(",%u",CM_LumpChecksum(&header->lumps[index]));printf("\n");
    free(data);
    mins[0]=-2;mins[1]=-8;mins[2]=-3;maxs[0]=5;maxs[1]=9;maxs[2]=1;
    printf("temp=%d,%d\n",CM_TempBoxModel(mins,maxs,qfalse),CM_TempBoxModel(mins,maxs,qtrue));CM_ModelBounds(BOX_MODEL_HANDLE,mins,maxs);printf("tempbounds=%u,%u,%u,%u,%u,%u\n",bits(mins[0]),bits(mins[1]),bits(mins[2]),bits(maxs[0]),bits(maxs[1]),bits(maxs[2]));
    CM_LoadMap(argv[1],qtrue,&checksum);printf("cached=%u,%d,%d\n",(unsigned)checksum,CM_NumClusters(),CM_NumInlineModels());
    CM_ClearMap();printf("clear=%d,%d,%d\n",CM_NumClusters(),CM_NumInlineModels(),cm.numLeafs);
    return 0;
}
