/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "../native/qvm_exec.c"

static int prepareTestPlan(unsigned char *plan,int capacity) {
    unsigned char image[64]={0};
    write32(image,0x12721444);write32(image+4,4);write32(image+8,32);write32(image+12,16);
    image[32]=3;write32(image+33,64);image[37]=8;write32(image+38,-4);image[42]=5;image[43]=4;write32(image+44,64);
    return mq3_qvm_prepare(image,sizeof(image),plan,capacity);
}
static int beginTestCall(unsigned char *control,unsigned char *data,int original,int limit) {
    if (mq3_qvm_begin(control,CONTROL_WORDS*4,original,64,2047,limit,0)!=1) return 0;
    write32(data+original-48,-1);write32(data+original-40,7);return 1;
}
int main(int argc,char **argv) {
    unsigned char plan[64],data[2048]={0},outer[CONTROL_WORDS*4],inner[CONTROL_WORDS*4],failed[CONTROL_WORDS*4];
    uint64_t outerStamp=0;unsigned int saved=_mm_getcsr(),hostile=(saved&~0x6000U)|0x6000U;int enabled,frameMode;
    if (argc!=2) return 1;
    frameMode=argv[1][0]=='2';enabled=frameMode||argv[1][0]=='1';
    SetEnvironmentVariableA("MQ3_QVM_PROFILE",frameMode ? "frame" : (enabled ? "1" : "0"));
    SetEnvironmentVariableA("MQ3_QVM_PROFILE_FILE",NULL);
    if (mq3_qvm_profile_frame(0,0,0)!=frameMode) return 16;
    if (prepareTestPlan(plan,sizeof(plan))!=1||!beginTestCall(outer,data,1024,100)) return 2;
    _mm_setcsr(hostile);
    if (mq3_qvm_run(plan,sizeof(plan),data,sizeof(data),outer,sizeof(outer),0,0)!=1||_mm_getcsr()!=hostile) return 3;
    memcpy(&outerStamp,outer+C_RESERVED0*4,sizeof(outerStamp));
    if ((outerStamp!=0)!=enabled||read32(outer+C_STEPS*4)!=3) return 4;
    if (!beginTestCall(inner,data,read32(outer+C_PS*4)-4,100)) return 5;
    if (mq3_qvm_run(plan,sizeof(plan),data,sizeof(data),inner,sizeof(inner),0,0)!=1||_mm_getcsr()!=hostile) return 6;
    if (enabled) Sleep(1);
    if (mq3_qvm_run(plan,sizeof(plan),data,sizeof(data),inner,sizeof(inner),41,1)!=0||read32(inner+C_RESULT*4)!=41||_mm_getcsr()!=hostile) return 7;
    if (memcmp(&outerStamp,outer+C_RESERVED0*4,sizeof(outerStamp))) return 8;
    if (enabled) Sleep(1);
    if (mq3_qvm_run(plan,sizeof(plan),data,sizeof(data),outer,sizeof(outer),42,1)!=0||read32(outer+C_RESULT*4)!=42||_mm_getcsr()!=hostile) return 9;
    if (read32(outer+C_STEPS*4)!=4||read32(inner+C_STEPS*4)!=4) return 10;
    if (!beginTestCall(failed,data,1024,0)) return 11;
    if (mq3_qvm_run(plan,sizeof(plan),data,sizeof(data),failed,sizeof(failed),0,0)!=-1||_mm_getcsr()!=hostile) return 12;
    if (enabled) {
        const qvmVmProfile *vm=qvmProfileThread->vms;const qvmTrapProfile *trap=vm->traps+3;
        if (vm->count!=4||vm->codeLength!=16||vm->returns!=2||vm->errors!=1||vm->instructions!=9||vm->yields!=2) return 13;
        if (trap->yields!=2||trap->resumes!=2||!trap->ticks||!trap->maximum||trap->ticks!=vm->hostTicks) return 14;
    } else if (qvmProfileThread||qvmProfileMode!=0) return 15;
    if (frameMode) {
        qvmVmProfile *vm=qvmProfileThread->vms;
        if (vm->frame.entries[7].returns!=3||vm->frame.traps[3].resumes!=2) return 17;
        if (!mq3_qvm_profile_frame(1,8,10)||vm->frame.entries[7].returns||vm->frame.traps[3].resumes) return 18;
        if (!beginTestCall(outer,data,1024,100)) return 19;
        if (mq3_qvm_run(plan,sizeof(plan),data,sizeof(data),outer,sizeof(outer),0,0)!=1) return 20;
        Sleep(1);
        if (mq3_qvm_run(plan,sizeof(plan),data,sizeof(data),outer,sizeof(outer),43,1)!=0) return 21;
        if (!mq3_qvm_profile_frame(2,12,10)||!mq3_qvm_profile_frame(-1,0,0)||qvmFrameActive) return 22;
    }
    _mm_setcsr(saved);puts("PASS: native QVM profile disabled/reentrant/trap/budget/MXCSR contracts");return 0;
}
