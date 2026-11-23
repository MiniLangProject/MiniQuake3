/* SPDX-License-Identifier: GPL-2.0-or-later
 * Bounded gather of the existing 128-byte triangle ABI.
 * Face selection, render state and all shader math stay in MiniLang. */
#ifndef MQ3_PLAYABLE_WORLD_GATHER_H
#define MQ3_PLAYABLE_WORLD_GATHER_H
#include <stdint.h>
#include <string.h>
#define PLAYABLE_GATHER_RECORD_BYTES 128
#define PLAYABLE_GATHER_MAX_RECORDS 65536
static int gatherWorldOverlaps(uintptr_t a,size_t aBytes,uintptr_t b,size_t bBytes) {
    return aBytes && bBytes && (a<=b ? b-a<aBytes : a-b<bBytes);
}
static int32_t gatherWorldI32(const unsigned char *data) { int32_t value;memcpy(&value,data,4);return value; }
static int gatherWorldRecordsStride(const unsigned char *source,int sourceBytes,int sourceCount,
        unsigned char *target,int targetBytes,const unsigned char *faceRuns,int runBytes,
        const unsigned char *selected,int selectedBytes,int selectedCount,int recordStride) {
    int faceCount,index,total=0,output=0;
    uintptr_t src=(uintptr_t)source,dst=(uintptr_t)target;
    if(recordStride<1 || sourceCount<0 || sourceCount>PLAYABLE_GATHER_MAX_RECORDS || sourceBytes<0 || sourceCount>sourceBytes/recordStride ||
            targetBytes<0 || runBytes<0 || runBytes%8 || selectedBytes<0 || selectedCount<0 || selectedCount>selectedBytes/4 ||
            (!source && sourceCount) || (!target && targetBytes) || (!faceRuns && runBytes) || (!selected && selectedCount)) return -1;
    faceCount=runBytes/8;
    for(index=0;index<selectedCount;++index) {
        int face=gatherWorldI32(selected+(size_t)index*4),first,count;
        if(face<0 || face>=faceCount) return -2;
        first=gatherWorldI32(faceRuns+(size_t)face*8);count=gatherWorldI32(faceRuns+(size_t)face*8+4);
        if(first<0 || count<0 || first>sourceCount || count>sourceCount-first) return -3;
        if(count>PLAYABLE_GATHER_MAX_RECORDS-total || count>targetBytes/recordStride-total) return -4;
        total+=count;
    }
    if(gatherWorldOverlaps(dst,(size_t)total*recordStride,src,(size_t)sourceCount*recordStride) ||
            gatherWorldOverlaps(dst,(size_t)total*recordStride,(uintptr_t)faceRuns,(size_t)runBytes) ||
            gatherWorldOverlaps(dst,(size_t)total*recordStride,(uintptr_t)selected,(size_t)selectedCount*4)) return -5;
    /* Validation finishes before any write: malformed spans cannot partially
     * overwrite a retained draw buffer. Original selected-face order is exact. */
    for(index=0;index<selectedCount;++index) {
        int face=gatherWorldI32(selected+(size_t)index*4);
        int first=gatherWorldI32(faceRuns+(size_t)face*8),count=gatherWorldI32(faceRuns+(size_t)face*8+4);
        if(count) memcpy(target+(size_t)output*recordStride,source+(size_t)first*recordStride,(size_t)count*recordStride);
        output+=count;
    }
    return total;
}
PLAYABLE_API int playable_window_gather_world_records(const unsigned char *source,int sourceBytes,int sourceCount,
        unsigned char *target,int targetBytes,const unsigned char *faceRuns,int runBytes,
        const unsigned char *selected,int selectedBytes,int selectedCount) {
    return gatherWorldRecordsStride(source,sourceBytes,sourceCount,target,targetBytes,faceRuns,runBytes,selected,selectedBytes,selectedCount,PLAYABLE_GATHER_RECORD_BYTES);
}
PLAYABLE_API int playable_window_gather_specular_normals(const unsigned char *source,int sourceBytes,int sourceCount,
        unsigned char *target,int targetBytes,const unsigned char *faceRuns,int runBytes,
        const unsigned char *selected,int selectedBytes,int selectedCount) {
    return gatherWorldRecordsStride(source,sourceBytes,sourceCount,target,targetBytes,faceRuns,runBytes,selected,selectedBytes,selectedCount,36);
}
#endif
