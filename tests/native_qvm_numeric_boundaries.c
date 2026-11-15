/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "../native/qvm_exec.c"
static int checked;
static int expect(int ok,const char *label) { ++checked;if (!ok) fprintf(stderr,"numeric boundary failed: %s\n",label);return ok; }
static int filterCase(const unsigned char *record,double x,double forward,double nearDistance,unsigned char *output,unsigned char *previous) {
    int visible=0;
    return mq3_world_filter(record,72,1,(const unsigned char *)&visible,4,1,output,36,previous,36,
            x,0,0,forward,0,0,0,1,0,0,0,1,nearDistance,10,1,1,1,1,0);
}
int main(void) {
    unsigned int saved=_mm_getcsr();int rounding,denormals;
    unsigned char record[72],plane[16],otherPlane[16],output[36],previous[36],guard[72];
    unsigned char fresh[8]={0},table[4096]={0},packed[24]={0},transformed[24],image[64]={0},plan[64],data[2048]={0},control[CONTROL_WORDS*4];
    SetEnvironmentVariableA("MQ3_QVM_PROFILE","0");
    for(rounding=0;rounding<4;++rounding) for(denormals=0;denormals<4;++denormals) {
        unsigned int mode=0x1fa1U|((unsigned int)rounding<<13)|(denormals&1 ? 0x40U : 0)|(denormals&2 ? 0x8000U : 0);
        int result;uint32_t bits;
        _mm_setcsr(mode);
        if(!expect(mq3_patch_store_plane(plane,16,0,1.0+0x1p-24,0x1p-149,-0.0,0.0)==1&&_mm_getcsr()==mode,"plane store owns and restores MXCSR")) return 1;
        memcpy(&bits,plane,4);if(!expect(bits==0x3f800000U,"plane midpoint nearest/even")) return 2;
        memcpy(&bits,plane+4,4);if(!expect(bits==1U,"plane gradual underflow")) return 3;
        memcpy(&bits,plane+8,4);if(!expect(bits==0x80000000U,"plane signed zero")) return 4;
        mq3_patch_store_plane(otherPlane,16,0,1,0,0,0);
        result=mq3_patch_find_plane(otherPlane,16,1,1,0,0,0.1,0,0,0.1,0,0,0.1,0,0);
        if(!expect(result==-1&&_mm_getcsr()==mode,"plane predicate conversion/tolerance independent of caller rounding")) return 5;
        result=mq3_patch_find_plane(otherPlane,16,1,1,0,0,0,0,0,0,0,0,0,0,0);
        if(!expect(result==0&&_mm_getcsr()==mode,"plane match restores MXCSR")) return 6;
        result=mq3_patch_find_plane(otherPlane,16,0,1,0,0,0,0,0,0,0,0,0,0,0);
        if(!expect(result==-1&&_mm_getcsr()==mode,"empty plane scan restores MXCSR")) return 7;
        result=mq3_patch_find_plane2(otherPlane,16,1,1.0001,0,0,0);
        if(!expect(result==-1&&_mm_getcsr()==mode,"plane2 conversion/tolerance independent of caller rounding")) return 8;
        result=mq3_patch_find_plane2(otherPlane,16,1,1,0,0,0);
        if(!expect(result==0&&_mm_getcsr()==mode,"plane2 match restores MXCSR")) return 9;
        memset(output,0,sizeof(output));memset(previous,0,sizeof(previous));mq3_world_store_face(record,72,0,1,1,2,0,0,0,1,0,0);
        result=filterCase(record,1.0+0x1p-24,1,1,output,previous);
        if(!expect(result==1&&read32(output+4)==1&&_mm_getcsr()==mode,"camera conversion occurs inside owned mode")) return 10;
        memset(output,0,sizeof(output));memset(previous,0,sizeof(previous));mq3_world_store_face(record,72,0,1,1,1,0,0,0,1,0,0);
        result=filterCase(record,0,1.0+0x1p-24,1.0+0x1p-24,output,previous);
        if(!expect(result==1&&read32(output+4)==0&&_mm_getcsr()==mode,"axis conversion occurs inside owned mode")) return 11;
        { int visible=1;result=mq3_world_filter(record,72,1,(unsigned char *)&visible,4,1,output,36,previous,36,0,0,0,1,0,0,0,1,0,0,0,1,1,10,1,1,1,1,0); }
        if(!expect(result==0&&_mm_getcsr()==mode,"invalid world face restores MXCSR")) return 12;
        result=mq3_md3_lerp(fresh,8,fresh,8,table,4096,packed,24,1,0x0.0000000000001p-1022);
        if(!expect(result==1&&_mm_getcsr()==mode,"MD3 denormal validation restores original status")) return 13;
        result=mq3_md3_lerp(fresh,8,fresh,8,table,4096,packed,24,1,2.0);
        if(!expect(result==0&&_mm_getcsr()==mode,"MD3 invalid lerp restores original status")) return 14;
        memset(packed,0,sizeof(packed));
        result=mq3_md3_transform(packed,24,transformed,24,1,1.0+0x1p-24,0x1p-149,0,1,0,0,0,1,0,0,0,1);
        if(!expect(result==1&&read32(transformed)==0x3f800000&&read32(transformed+4)==1&&_mm_getcsr()==mode,"MD3 transform conversion owns mode")) return 15;
    }
    memset(record,0xcc,sizeof(record));memcpy(guard,record,sizeof(record));
    if(!expect(mq3_world_store_face(record,72,INT_MAX,1,1,0,0,0,1,0,0,1)==0&&!memcmp(record,guard,72),"INT_MAX world store rejects without writes")) return 16;
    if(!expect(mq3_world_set_two_sided(record,72,INT_MAX,1)==0&&!memcmp(record,guard,72),"INT_MAX face flags reject without writes")) return 17;
    if(!expect(mq3_world_store_face(record,72,INT_MAX-1,1,1,0,0,0,1,0,0,1)==0,"near INT_MAX world store rejects")) return 18;
    if(!expect(mq3_world_set_two_sided(record,-1,0,1)==0&&!memcmp(record,guard,72),"negative face buffer rejects without writes")) return 19;
    if(!expect(mq3_patch_store_plane(plane,16,INT_MAX,0,0,0,0)==0,"INT_MAX plane store rejects")) return 20;
    if(!expect(mq3_patch_find_plane2(plane,16,INT_MAX,0,0,0,0)==-2,"INT_MAX plane count rejects")) return 21;
    if(!expect(mq3_md3_lerp(fresh,8,fresh,8,table,4096,packed,24,INT_MAX,0)==0,"INT_MAX MD3 lerp count rejects")) return 22;
    if(!expect(mq3_md3_transform(packed,24,transformed,24,INT_MAX,0,0,0,1,0,0,0,1,0,0,0,1)==0,"INT_MAX MD3 transform count rejects")) return 23;
    write32(image,0x12721444);write32(image+4,4);write32(image+8,32);write32(image+12,16);image[32]=3;write32(image+33,64);image[37]=8;write32(image+38,42);image[42]=6;image[43]=4;write32(image+44,64);
    if(!expect(mq3_qvm_prepare(image,sizeof(image),plan,sizeof(plan))==1,"valid test QVM plan")) return 24;
    mq3_qvm_begin(control,sizeof(control),1024,64,2047,100,0);write32(control+C_PS*4,INT_MAX);write32(control+C_PENDING*4,1);
    if(!expect(mq3_qvm_run(plan,sizeof(plan),data,sizeof(data),control,sizeof(control),0,1)==-1,"INT_MAX resumed program stack rejects before access")) return 25;
    mq3_qvm_begin(control,sizeof(control),1024,64,2047,INT_MAX,0);write32(control+C_STEPS*4,INT_MAX);
    if(!expect(mq3_qvm_run(plan,sizeof(plan),data,sizeof(data),control,sizeof(control),0,0)==-1,"INT_MAX instruction counter rejects without overflow")) return 26;
    _mm_setcsr(saved);printf("PASS: %d native QVM helper rounding/status/INT_MAX contracts\n",checked);return 0;
}
