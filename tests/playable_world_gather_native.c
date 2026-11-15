/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "playable_world_gather_prototype.h"
#include <stdio.h>
static int expect(int value,int wanted,const char *label) {
    if(value!=wanted) { fprintf(stderr,"gather %s got%d expected%d\n",label,value,wanted);return 0; }return 1;
}
int main(void) {
    unsigned char source[6*128],guarded[6*128+32],wanted[6*128];
    int32_t runs[]={0,2,2,0,2,3,5,1},selected[]={3,0,2},sequence[]={5,0,1,2,3,4};
    int index,byte;
    for(index=0;index<6;++index) for(byte=0;byte<128;++byte) source[index*128+byte]=(unsigned char)(index*37+byte*13);
    memset(guarded,0xcc,sizeof(guarded));
    for(index=0;index<6;++index) memcpy(wanted+index*128,source+sequence[index]*128,128);
    if(!expect(mq3_test_gather_world(source,sizeof(source),6,guarded+16,6*128,(unsigned char *)runs,sizeof(runs),(unsigned char *)selected,sizeof(selected),3),6,"selected face order")) return 1;
    if(memcmp(guarded+16,wanted,sizeof(wanted))) return 2;
    for(index=0;index<16;++index) if(guarded[index]!=0xcc || guarded[sizeof(guarded)-1-index]!=0xcc) return 3;
    selected[0]=selected[1]=2;
    if(!expect(mq3_test_gather_world(source,sizeof(source),6,guarded+16,6*128,(unsigned char *)runs,sizeof(runs),(unsigned char *)selected,8,2),6,"repeated face order")) return 4;
    if(memcmp(guarded+16,source+2*128,3*128) || memcmp(guarded+16+3*128,source+2*128,3*128)) return 5;
    memset(guarded,0xcc,sizeof(guarded));selected[0]=-1;
    if(!expect(mq3_test_gather_world(source,sizeof(source),6,guarded+16,6*128,(unsigned char *)runs,sizeof(runs),(unsigned char *)selected,4,1),-2,"negative face")) return 6;
    selected[0]=4;
    if(!expect(mq3_test_gather_world(source,sizeof(source),6,guarded+16,6*128,(unsigned char *)runs,sizeof(runs),(unsigned char *)selected,4,1),-2,"outside face")) return 7;
    selected[0]=2;runs[5]=5;
    if(!expect(mq3_test_gather_world(source,sizeof(source),6,guarded+16,6*128,(unsigned char *)runs,sizeof(runs),(unsigned char *)selected,4,1),-3,"outside source run")) return 8;
    runs[5]=3;
    if(!expect(mq3_test_gather_world(source,sizeof(source),6,guarded+16,2*128,(unsigned char *)runs,sizeof(runs),(unsigned char *)selected,4,1),-4,"destination capacity")) return 9;
    if(!expect(mq3_test_gather_world(source,sizeof(source),6,guarded+16,6*128,(unsigned char *)runs,sizeof(runs),(unsigned char *)selected,3,1),-1,"truncated selection")) return 10;
    if(!expect(mq3_test_gather_world(source,sizeof(source),6,source,sizeof(source),(unsigned char *)runs,sizeof(runs),(unsigned char *)selected,4,1),-5,"source/destination alias")) return 11;
    for(index=0;index<(int)sizeof(guarded);++index) if(guarded[index]!=0xcc) return 12;
    {
        unsigned char metadata[1024],before[1024];
        memset(metadata,0x5a,sizeof(metadata));memcpy(metadata,runs,sizeof(runs));memcpy(before,metadata,sizeof(metadata));
        if(!expect(mq3_test_gather_world(source,sizeof(source),6,metadata,6*128,metadata,sizeof(runs),(unsigned char *)selected,4,1),-5,"destination overwrites face runs")) return 13;
        if(memcmp(metadata,before,sizeof(metadata))) return 14;
        memset(metadata,0x5a,sizeof(metadata));memcpy(metadata+16,selected,4);memcpy(before,metadata,sizeof(metadata));
        if(!expect(mq3_test_gather_world(source,sizeof(source),6,metadata,6*128,(unsigned char *)runs,sizeof(runs),metadata+16,4,1),-5,"destination overwrites selected face IDs")) return 15;
        if(memcmp(metadata,before,sizeof(metadata))) return 16;
    }
    if(!expect(mq3_test_gather_world(0,0,0,0,0,0,0,0,0,0),0,"empty streams")) return 17;
    if(!mq3_test_world_records_equal(source,sizeof(source),6,source,sizeof(source),6) || mq3_test_world_records_equal(source,5,6,source,sizeof(source),6)) return 14;
    puts("PASS: test-only world gather exact order, repeated faces, canaries, validation-before-write, bounds and alias rejection");return 0;
}
