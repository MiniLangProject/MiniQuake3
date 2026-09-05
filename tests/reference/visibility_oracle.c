/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "cm_local.h"
static void word(FILE *out,int value) { if(fwrite(&value,4,1,out)!=1)exit(35); }
static void real(FILE *out,float value) { if(fwrite(&value,4,1,out)!=1)exit(35); }
int main(int argc,char **argv) {
    FILE *input,*output;int checksum,i,j,boxCount,portalCount,leafs[64],last,count;vec3_t mins,maxs;
    cbrush_t *brushes[64];leafList_t ll;
    struct {vec3_t mins,maxs;int capacity;} box;
    struct {int op,a,b,open,view,queryA,queryB,noAreas;byte bits[32];} portal;
    if(argc==6 && !strcmp(argv[1],"--point")) {
        int leaf,cluster,area,visible=0,connected=0;byte *row;
        CM_LoadMap(argv[2],qfalse,&checksum);
        for(i=0;i<3;i++)mins[i]=atof(argv[3+i]);
        leaf=CM_PointLeafnum(mins);cluster=CM_LeafCluster(leaf);area=CM_LeafArea(leaf);row=CM_ClusterPVS(cluster);
        for(i=0;i<cm.numClusters;i++)if(row[i>>3]&(1<<(i&7)))visible++;
        for(i=0;i<cm.numAreas;i++)if(CM_AreasConnected(area,i))connected++;
        printf("%i %i %i %i %i %i %i %i %i\n",leaf,cluster,area,cm.numClusters,cm.clusterBytes,visible,connected,cm.numAreas,cm.numLeafs);
        return 0;
    }
    if(argc!=4)return 2;
    CM_LoadMap(argv[1],qfalse,&checksum);
    input=fopen(argv[2],"rb");output=fopen(argv[3],"wb");if(!input || !output)return 3;
    if(fread(&boxCount,4,1,input)!=1 || fread(&portalCount,4,1,input)!=1)return 4;
    word(output,CM_NumClusters());word(output,cm.numAreas);word(output,cm.clusterBytes);
    word(output,cm.numLeafs);word(output,CM_NumInlineModels());word(output,cm.vised);
    for(i=0;i<cm.numLeafs;i++){word(output,CM_LeafCluster(i));word(output,CM_LeafArea(i));}
    for(i=-2;i<cm.numClusters+2;i++)fwrite(CM_ClusterPVS(i),1,cm.clusterBytes,output);
    for(i=0;i<cm.numSubModels;i++){
        CM_ModelBounds(CM_InlineModel(i),mins,maxs);for(j=0;j<3;j++)real(output,mins[j]);for(j=0;j<3;j++)real(output,maxs[j]);
    }
    for(i=0;i<boxCount;i++){
        if(fread(&box,sizeof(box),1,input)!=1 || box.capacity<0 || box.capacity>64)return 5;
        count=CM_BoxLeafnums(box.mins,box.maxs,leafs,box.capacity,&last);
        memset(&ll,0,sizeof(ll));VectorCopy(box.mins,ll.bounds[0]);VectorCopy(box.maxs,ll.bounds[1]);
        ll.maxcount=box.capacity;ll.list=leafs;ll.storeLeafs=CM_StoreLeafs;CM_BoxLeafnums_r(&ll,0);
        if(count!=ll.count || last!=ll.lastLeaf)return 6;
        word(output,count);word(output,last);word(output,ll.overflowed);
        for(j=0;j<64;j++)word(output,j<count?leafs[j]:-1);
        count=CM_BoxBrushes(box.mins,box.maxs,brushes,box.capacity);
        memset(&ll,0,sizeof(ll));VectorCopy(box.mins,ll.bounds[0]);VectorCopy(box.maxs,ll.bounds[1]);
        cm.checkcount++;ll.maxcount=box.capacity;ll.list=(void *)brushes;ll.storeLeafs=CM_StoreBrushes;CM_BoxLeafnums_r(&ll,0);
        if(count!=ll.count)return 7;
        word(output,count);word(output,ll.overflowed);for(j=0;j<64;j++)word(output,j<count?(int)(brushes[j]-cm.brushes):-1);
    }
    for(i=0;i<portalCount;i++){
        if(fread(&portal,sizeof(portal),1,input)!=1)return 8;
        cm_noAreas->integer=portal.noAreas;
        if(portal.op)CM_AdjustAreaPortalState(portal.a,portal.b,portal.open);
        word(output,CM_AreasConnected(portal.queryA,portal.queryB));
        word(output,CM_WriteAreaBits(portal.bits,portal.view));fwrite(portal.bits,1,32,output);
        for(j=0;j<cm.numAreas;j++)word(output,cm.areas[j].floodnum);
        for(j=0;j<cm.numAreas*cm.numAreas;j++)word(output,cm.areaPortals[j]);
    }
    fclose(input);fclose(output);return 0;
}
