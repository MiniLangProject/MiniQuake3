/* SPDX-License-Identifier: GPL-2.0-or-later
 * Bounded native QVM dispatch. MiniLang retains module ownership, lifecycle,
 * trap dispatch and all engine services. Each invocation owns its continuation
 * bytes; no managed pointer survives a yield and recursive traps are independent.
 */
#include <stdint.h>
#include <string.h>
#include <limits.h>
#include <math.h>
#include <float.h>
#include <xmmintrin.h>
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#define API __declspec(dllexport)
#define PLAN_MAGIC 0x4d565851
#define CONTROL_WORDS 270
enum { C_PC, C_PS, C_TOP, C_ORIGINAL, C_BOTTOM, C_MASK, C_STEPS, C_LIMIT,
       C_BREAKS, C_STATUS, C_RESULT, C_PENDING, C_RESERVED0, C_RESERVED1, C_STACK };
typedef struct instruction_s { uint8_t op, need; uint16_t reserved; int32_t operand; } instruction;
static int32_t read32(const unsigned char *p) { int32_t v; memcpy(&v,p,4); return v; }
static void write32(unsigned char *p,int32_t v) { memcpy(p,&v,4); }

/* Optional diagnostics have no managed state or per-opcode hook. A yielded
 * invocation stores its own QPC timestamp in the two reserved control words,
 * so nested calls cannot replace the outer continuation's boundary timer.
 * Native time excludes callback time; trap time includes the managed bridge
 * and any recursive VM call made by that callback. These are diagnostic wall
 * times, not suitable for a frame-rate acceptance run with logging enabled. */
#define QVM_PROFILE_VMS 8
#define QVM_PROFILE_TRAPS 1024
typedef struct qvmTrapProfile_s { uint64_t yields,resumes,ticks,maximum; } qvmTrapProfile;
typedef struct qvmVmProfile_s {
    int count,codeLength;
    uint64_t returns,errors,instructions,nativeTicks,yields,hostTicks;
    qvmTrapProfile traps[QVM_PROFILE_TRAPS+1];
} qvmVmProfile;
typedef struct qvmThreadProfile_s { qvmVmProfile vms[QVM_PROFILE_VMS]; } qvmThreadProfile;
static INIT_ONCE qvmProfileOnce=INIT_ONCE_STATIC_INIT;
static volatile LONG qvmProfileMode=-1;
static LARGE_INTEGER qvmProfileFrequency;
static FILE *qvmProfileOutput;
static __declspec(thread) qvmThreadProfile *qvmProfileThread;
static BOOL CALLBACK qvmProfileInit(PINIT_ONCE once,PVOID parameter,PVOID *context) {
    char setting[32],path[32768];DWORD length;FILE *output=NULL;
    (void)once;(void)parameter;(void)context;
    length=GetEnvironmentVariableA("MQ3_QVM_PROFILE",setting,(DWORD)sizeof(setting));
    if (!length||length>=sizeof(setting)||(length==1&&setting[0]=='0')||
            !QueryPerformanceFrequency(&qvmProfileFrequency)||qvmProfileFrequency.QuadPart<=0) {
        InterlockedExchange(&qvmProfileMode,0);return TRUE;
    }
    length=GetEnvironmentVariableA("MQ3_QVM_PROFILE_FILE",path,(DWORD)sizeof(path));
    if (length&&length<sizeof(path)) (void)fopen_s(&output,path,"a");
    qvmProfileOutput=output ? output : stderr;
    InterlockedExchange(&qvmProfileMode,1);return TRUE;
}
static int qvmProfileEnabled(void) {
    if (qvmProfileMode<0) (void)InitOnceExecuteOnce(&qvmProfileOnce,qvmProfileInit,NULL,NULL);
    return qvmProfileMode>0;
}
static uint64_t qvmProfileClock(void) { LARGE_INTEGER value;QueryPerformanceCounter(&value);return (uint64_t)value.QuadPart; }
static qvmVmProfile *qvmProfileVm(int count,int codeLength) {
    int index;
    if (!qvmProfileThread) qvmProfileThread=(qvmThreadProfile *)HeapAlloc(GetProcessHeap(),HEAP_ZERO_MEMORY,sizeof(*qvmProfileThread));
    if (!qvmProfileThread) return NULL;
    for (index=0;index<QVM_PROFILE_VMS;++index) {
        qvmVmProfile *vm=qvmProfileThread->vms+index;
        if (!vm->count) { vm->count=count;vm->codeLength=codeLength;return vm; }
        if (vm->count==count&&vm->codeLength==codeLength) return vm;
    }
    return NULL;
}
static int qvmProfileTrapIndex(int trap) { return trap>=0&&trap<QVM_PROFILE_TRAPS ? trap : QVM_PROFILE_TRAPS; }
static double qvmProfileMs(uint64_t ticks) { return (double)ticks*1000.0/(double)qvmProfileFrequency.QuadPart; }
static void qvmProfileDump(const qvmVmProfile *vm,int entry,int status) {
    int order[16],used=0,index,slot;
    fprintf(qvmProfileOutput,"[qvm-profile] vm=%d:%d entry=%d status=%d returns=%llu errors=%llu instructions=%llu native_ms=%.6f host_ms=%.6f yields=%llu thread=%lu\n",
            vm->count,vm->codeLength,entry,status,(unsigned long long)vm->returns,(unsigned long long)vm->errors,
            (unsigned long long)vm->instructions,qvmProfileMs(vm->nativeTicks),qvmProfileMs(vm->hostTicks),(unsigned long long)vm->yields,(unsigned long)GetCurrentThreadId());
    for (index=0;index<=QVM_PROFILE_TRAPS;++index) {
        if (!vm->traps[index].yields) continue;
        for (slot=0;slot<used;++slot) if (vm->traps[index].ticks>vm->traps[order[slot]].ticks) break;
        if (slot>=16) continue;
        { int tail=used<16 ? used : 15;for (;tail>slot;--tail) order[tail]=order[tail-1];order[slot]=index;if (used<16) ++used; }
    }
    for (slot=0;slot<used;++slot) {
        const qvmTrapProfile *trap=vm->traps+order[slot];
        fprintf(qvmProfileOutput,"[qvm-trap] vm=%d:%d id=%d yields=%llu resumes=%llu host_ms=%.6f mean_us=%.6f max_us=%.6f\n",
                vm->count,vm->codeLength,order[slot]==QVM_PROFILE_TRAPS ? -1 : order[slot],
                (unsigned long long)trap->yields,(unsigned long long)trap->resumes,qvmProfileMs(trap->ticks),
                trap->resumes ? qvmProfileMs(trap->ticks)*1000.0/(double)trap->resumes : 0.0,qvmProfileMs(trap->maximum)*1000.0);
    }
    fflush(qvmProfileOutput);
}
static int widthFor(int op) { return op==33 ? 1 : (op==3||op==4||op==8||op==9||(op>=11&&op<=26)||op==34 ? 4 : 0); }
static int needFor(int op) {
    if (op==5||op==7||op==10||(op>=27&&op<=29)||op==33||(op>=35&&op<=37)||op==49||op==53||op==58||op==59) return 1;
    if ((op>=11&&op<=26)||(op>=30&&op<=32)||op==34||(op>=38&&op<=48)||(op>=50&&op<=52)||(op>=54&&op<=57)) return 2;
    return 0;
}
API int mq3_qvm_plan_size(const unsigned char *image,int bytes) {
    int32_t count,codeLength;
    int64_t size;
    if (!image||bytes<32||read32(image)!=0x12721444) return -1;
    count=read32(image+4);codeLength=read32(image+12);
    if (count<=0||codeLength<count) return -1;
    /* Encoded code plus one start byte per code byte. A sparse eight-byte
     * instruction for every bytecode byte added nine MB of live managed heap
     * across the three retail VMs and could force continuous GC near a limit. */
    size=16+(int64_t)count*4+(int64_t)codeLength*2;
    return size>INT_MAX ? -1 : (int)size;
}
API int mq3_qvm_prepare(const unsigned char *image,int bytes,unsigned char *plan,int capacity) {
    int required=mq3_qvm_plan_size(image,bytes),i,pc=0;
    int count,codeLength,codeOffset;
    int32_t *addresses;
    unsigned char *code,*starts;
    if (required<0||!plan||capacity<required) return -1;
    count=read32(image+4);codeLength=read32(image+12);codeOffset=read32(image+8);
    if (codeOffset<32||(int64_t)codeOffset+codeLength>bytes) return -1;
    memset(plan,0,(size_t)required);write32(plan,PLAN_MAGIC);write32(plan+4,count);write32(plan+8,codeLength);
    addresses=(int32_t *)(plan+16);code=plan+16+(size_t)count*4;starts=code+codeLength;
    memcpy(code,image+codeOffset,(size_t)codeLength);
    for (i=0;i<count;++i) {
        int op,width;
        if (pc>=codeLength) return -2;
        op=image[codeOffset+pc];width=widthFor(op);
        if (op<1||op>59||(int64_t)pc+1+width>codeLength) return -2;
        addresses[i]=pc;starts[pc]=1;
        if (op==3||op==4) { int frame=read32(code+pc+1);if (frame<0||(frame&3)) return -2; }
        pc+=width+1;
    }
    for (i=0;i<count;++i) {
        int at=addresses[i],op=code[at];
        if (op>=11&&op<=26) {
            int target=read32(code+at+1);if (target<0||target>=count) return -3;
        }
    }
    return 1;
}
API int mq3_qvm_begin(unsigned char *control,int bytes,int original,int bottom,int mask,int limit,int breaks) {
    int32_t *c=(int32_t *)control;
    if (!control||bytes<CONTROL_WORDS*4||original<48||original-48<=bottom||limit<0) return 0;
    memset(control,0,CONTROL_WORDS*4);c[C_PS]=original-48;c[C_ORIGINAL]=original;c[C_BOTTOM]=bottom;
    c[C_MASK]=mask;c[C_LIMIT]=limit;c[C_BREAKS]=breaks;return 1;
}
static uint32_t fbits(float f) { uint32_t u;memcpy(&u,&f,4);return u; }
static float fvalue(uint32_t u) { float f;memcpy(&f,&u,4);return f; }
static int isNanBits(uint32_t u) { return (u&0x7fffffffU)>0x7f800000U; }
static uint32_t floatBinary(uint32_t b,uint32_t a,int op) {
    volatile float left,right,result;
    /* Match the software binary32 compatibility engine's operand-ordered NaNs.
     * SUBF tests NaNs before negating its right operand. */
    if (isNanBits(b)) return b|0x400000U;
    if (isNanBits(a)) return a|0x400000U;
    left=fvalue(b);right=fvalue(a);
    switch(op) { case 54: result=left+right;break;case 55:result=left-right;break;
        case 56:result=left/right;break;default:result=left*right;break; }
    return fbits(result);
}
API int mq3_qvm_run(const unsigned char *plan,int planBytes,unsigned char *data,int dataBytes,
        unsigned char *control,int controlBytes,int resumeValue,int resume) {
    const int32_t *addresses;
    const unsigned char *code,*starts;
    int32_t *c=(int32_t *)control,*s;
    unsigned int savedControl;
    int pc,ps,top,mask,steps,breaks,count,codeLength,error=0;
    qvmVmProfile *profile=NULL;uint64_t profileStart=0;int profileSteps=0,profileEntry=0;
    if (!plan||planBytes<16||!data||!control||controlBytes<CONTROL_WORDS*4||read32(plan)!=PLAN_MAGIC) return -1;
    count=read32(plan+4);codeLength=read32(plan+8);
    if (count<1||codeLength<1||16+(int64_t)count*4+(int64_t)codeLength*2>planBytes) return -1;
    addresses=(const int32_t *)(plan+16);code=plan+16+(size_t)count*4;starts=code+codeLength;s=c+C_STACK;
    pc=c[C_PC];ps=c[C_PS];top=c[C_TOP];mask=c[C_MASK];steps=c[C_STEPS];breaks=c[C_BREAKS];
    if (mask!=dataBytes-1||dataBytes<1||(dataBytes&(dataBytes-1))||top<0||top>=256) return -1;
    if (qvmProfileEnabled()) {
        profile=qvmProfileVm(count,codeLength);
        if (profile) {
            int64_t entryOffset=(int64_t)c[C_ORIGINAL]-40;
            profileStart=qvmProfileClock();profileSteps=steps;
            if (entryOffset>=0&&entryOffset<=dataBytes-4) profileEntry=read32(data+(size_t)entryOffset);
        }
    }
    if (resume) {
        if (c[C_PENDING]!=1||top>=255||ps<0||ps>dataBytes-4) return -1;
        if (profile&&ps<=dataBytes-8) {
            uint64_t stamp,elapsed;int trap=qvmProfileTrapIndex(read32(data+ps+4));qvmTrapProfile *bucket=profile->traps+trap;
            memcpy(&stamp,c+C_RESERVED0,sizeof(stamp));
            if (stamp&&profileStart>=stamp) { elapsed=profileStart-stamp;bucket->ticks+=elapsed;profile->hostTicks+=elapsed;++bucket->resumes;if (elapsed>bucket->maximum) bucket->maximum=elapsed; }
        }
        s[++top]=resumeValue;pc=read32(data+ps);c[C_PENDING]=0;
    }
    /* The software reference rounds to nearest/even and retains subnormals,
     * independently of a caller's floating-point control mode. */
    savedControl=_mm_getcsr();_mm_setcsr((savedControl&~0xe040U)|0x1f80U);
    for (;;) {
        int32_t a,b,operand=0,value=0;int op,width;uint32_t address;
        if (steps==INT_MAX||++steps>c[C_LIMIT]) { error=1;break; }
        if (pc<0||pc>=codeLength||!starts[pc]) { error=2;break; }
        if (ps<=c[C_BOTTOM]||ps<0||ps>dataBytes-4||(ps&3)) { error=3;break; }
        op=code[pc++];width=widthFor(op);
        if (width==4) operand=read32(code+pc);else if (width==1) operand=code[pc];pc+=width;
        if (top<needFor(op)) { error=4;break; }
        a=s[top];b=top>0 ? s[top-1] : 0;
        switch(op) {
        case 1:break;case 2:++breaks;break;
        case 3:ps=(int)((uint32_t)ps-(uint32_t)operand);break;
        case 4:
            ps=(int)((uint32_t)ps+(uint32_t)operand);
            if (ps<0||ps>dataBytes-4) { error=3;break; }pc=read32(data+ps);
            if (pc==-1) { if (top!=1||ps!=c[C_ORIGINAL]-48) { error=5;break; }
                c[C_RESULT]=s[1];c[C_STATUS]=0;goto finished; }break;
        case 5:
            write32(data+ps,pc);--top;
            if (a<0) {
                if (ps>dataBytes-8) { error=3;break; }
                write32(data+ps+4,(int32_t)(-1-(int64_t)a));c[C_PENDING]=1;c[C_RESULT]=ps+4;c[C_STATUS]=1;goto finished;
            }
            if (a>=count) { error=6;break; }pc=addresses[a];break;
        case 6:++top;break;case 7:--top;break;
        case 8:if (++top>=256) { error=7;break; }s[top]=operand;break;
        case 9:if (++top>=256) { error=7;break; }s[top]=(int32_t)((uint32_t)ps+(uint32_t)operand);break;
        case 10:if (a<0||a>=count) { error=6;break; }pc=addresses[a];--top;break;
        case 27:s[top]=data[(uint32_t)a&(uint32_t)mask];break;
        case 28:address=(uint32_t)a&(uint32_t)mask;if (address>(uint32_t)dataBytes-2) { error=8;break; }s[top]=data[address]|((int32_t)data[address+1]<<8);break;
        case 29:address=(uint32_t)a&(uint32_t)mask;if (address>(uint32_t)dataBytes-4) { error=8;break; }s[top]=read32(data+address);break;
        case 30:data[(uint32_t)b&(uint32_t)mask]=(unsigned char)a;top-=2;break;
        case 31:address=(uint32_t)b&((uint32_t)mask&~1U);data[address]=(unsigned char)a;data[address+1]=(unsigned char)((uint32_t)a>>8);top-=2;break;
        case 32:address=(uint32_t)b&((uint32_t)mask&~3U);write32(data+address,a);top-=2;break;
        case 33:address=(uint32_t)ps+(uint32_t)operand;if (address>(uint32_t)dataBytes-4) { error=8;break; }write32(data+address,a);--top;break;
        case 34: {
            int source=a&mask,destination=b&mask;
            int length=(int)(((uint32_t)source+(uint32_t)operand)&(uint32_t)mask)-source,i;
            length=(int)(((uint32_t)destination+(uint32_t)length)&(uint32_t)mask)-destination;
            if ((source|destination|length)&3) { error=9;break; }
            for (i=length-4;i>=0;i-=4) write32(data+destination+i,read32(data+source+i));top-=2;break;
        }
        case 35:s[top]=(int8_t)a;break;case 36:s[top]=(int16_t)a;break;
        case 37:s[top]=(int32_t)(0U-(uint32_t)a);break;
        case 49:s[top-1]=~a;break; /* Original vm_interpreted.c slot semantics. */
        case 53:s[top]=(int32_t)((uint32_t)a^0x80000000U);break;
        case 58:{ volatile float f=(float)a;s[top]=(int32_t)fbits(f);break; }
        case 59:{ float f=fvalue((uint32_t)a);s[top]=!_finite(f)||f>=2147483648.0||f< -2147483648.0 ? INT_MIN : (int32_t)f;break; }
        default:
            if (op>=11&&op<=26) {
                int take=0;
                if (op>=21) { float left=fvalue((uint32_t)b),right=fvalue((uint32_t)a);
                    switch(op) { case 21:take=left==right;break;case 22:take=left!=right;break;case 23:take=left<right;break;case 24:take=left<=right;break;case 25:take=left>right;break;case 26:take=left>=right;break; }
                } else if (op>=17) { uint32_t left=(uint32_t)b,right=(uint32_t)a;
                    switch(op) { case 17:take=left<right;break;case 18:take=left<=right;break;case 19:take=left>right;break;case 20:take=left>=right;break; }
                } else switch(op) { case 11:take=b==a;break;case 12:take=b!=a;break;case 13:take=b<a;break;case 14:take=b<=a;break;case 15:take=b>a;break;case 16:take=b>=a;break; }
                if (take) pc=addresses[operand];top-=2;
            } else {
                switch(op) {
                case 38:value=(int32_t)((uint32_t)b+(uint32_t)a);break;case 39:value=(int32_t)((uint32_t)b-(uint32_t)a);break;
                case 40:case 42:if (!a||(b==INT_MIN&&a==-1)) { error=10;break; }value=op==40 ? b/a : b%a;break;
                case 41:case 43:if (!a) { error=10;break; }value=(int32_t)(op==41 ? (uint32_t)b/(uint32_t)a : (uint32_t)b%(uint32_t)a);break;
                case 44:case 45:value=(int32_t)((uint32_t)b*(uint32_t)a);break;
                case 46:value=b&a;break;case 47:value=b|a;break;case 48:value=b^a;break;
                case 50:value=(int32_t)((uint32_t)b<<(a&31));break;case 51:value=b>>(a&31);break;case 52:value=(int32_t)((uint32_t)b>>(a&31));break;
                case 54:case 55:case 56:case 57:value=(int32_t)floatBinary((uint32_t)b,(uint32_t)a,op);break;
                default:error=11;break;
                }
                if (!error) s[--top]=value;
            }
        }
        if (error) break;
        if (top<0||top>=256) { error=7;break; }
    }
    c[C_STATUS]=-error;
finished:
    c[C_PC]=pc;c[C_PS]=ps;c[C_TOP]=top;c[C_STEPS]=steps;c[C_BREAKS]=breaks;
    if (profile) {
        uint64_t finishedAt=qvmProfileClock();profile->nativeTicks+=finishedAt-profileStart;
        profile->instructions+=(uint32_t)steps-(uint32_t)profileSteps;
        if (c[C_STATUS]==1) {
            int trap=qvmProfileTrapIndex(read32(data+ps+4));uint64_t stamp;
            ++profile->yields;++profile->traps[trap].yields;stamp=qvmProfileClock();memcpy(c+C_RESERVED0,&stamp,sizeof(stamp));
        } else {
            if (c[C_STATUS]==0) ++profile->returns;else ++profile->errors;
            qvmProfileDump(profile,profileEntry,c[C_STATUS]);
        }
    }
    _mm_setcsr(savedControl);
    return c[C_STATUS];
}

/* Strict binary32 plane predicates accelerate the O(n) candidate scans in
 * cm_patch. Plane ownership, insertion order and facet construction stay in
 * MiniLang; these routines return the first identical original candidate. */
API int mq3_patch_store_plane(unsigned char *cache,int bytes,int index,double x,double y,double z,double distance) {
    float p[4];unsigned int savedControl;
    if (!cache||index<0||index>=2048||((int64_t)index+1)*16>bytes) return 0;
    savedControl=_mm_getcsr();_mm_setcsr((savedControl&~0xe040U)|0x1f80U);
    p[0]=(float)x;p[1]=(float)y;p[2]=(float)z;p[3]=(float)distance;memcpy(cache+index*16,p,16);
    _mm_setcsr(savedControl);return 1;
}
static float dot3Strict(const float *a,const float *b) {
    volatile float x=a[0]*b[0],y=a[1]*b[1],z=a[2]*b[2],xy=x+y,result=xy+z;return result;
}
API int mq3_patch_find_plane(const unsigned char *cache,int bytes,int count,
        double nx,double ny,double nz,double ax,double ay,double az,
        double bx,double by,double bz,double cx,double cy,double cz) {
    float normal[3],points[3][3];unsigned int savedControl;
    int i,j;
    if (!cache||count<0||count>2048||bytes<count*16) return -2;
    savedControl=_mm_getcsr();_mm_setcsr((savedControl&~0xe040U)|0x1f80U);
    normal[0]=(float)nx;normal[1]=(float)ny;normal[2]=(float)nz;
    points[0][0]=(float)ax;points[0][1]=(float)ay;points[0][2]=(float)az;
    points[1][0]=(float)bx;points[1][1]=(float)by;points[1][2]=(float)bz;
    points[2][0]=(float)cx;points[2][1]=(float)cy;points[2][2]=(float)cz;
    for (i=0;i<count;++i) {
        float p[4];int matched=1;memcpy(p,cache+i*16,16);
        if (dot3Strict(normal,p)<0) continue;
        for (j=0;j<3;++j) {
            volatile float distance=dot3Strict(points[j],p)-p[3];
            if (distance< -0.1||distance>0.1) { matched=0;break; }
        }
        if (matched) { _mm_setcsr(savedControl);return i; }
    }
    _mm_setcsr(savedControl);return -1;
}
API int mq3_patch_find_plane2(const unsigned char *cache,int bytes,int count,double x,double y,double z,double distance) {
    float wanted[4];int i,flip,j;unsigned int savedControl;
    if (!cache||count<0||count>2048||bytes<count*16) return -2;
    savedControl=_mm_getcsr();_mm_setcsr((savedControl&~0xe040U)|0x1f80U);
    wanted[0]=(float)x;wanted[1]=(float)y;wanted[2]=(float)z;wanted[3]=(float)distance;
    for (i=0;i<count;++i) {
        float p[4];memcpy(p,cache+i*16,16);
        for (flip=0;flip<2;++flip) {
            float candidate[4];int matched;
            for (j=0;j<4;++j) candidate[j]=flip ? -wanted[j] : wanted[j];
            { volatile float delta=p[3]-candidate[3];matched=fabsf(delta)<0.02; }
            for (j=0;j<3;++j) { volatile float delta=p[j]-candidate[j];if (fabsf(delta)>=0.0001) matched=0; }
            if (matched) { _mm_setcsr(savedControl);return i*2+flip; }
        }
    }
    _mm_setcsr(savedControl);return -1;
}

static void decodeMd3Normal(uint16_t packed,const float *table,float normal[3]) {
    int lat=((packed>>8)&255)*4,lng=(packed&255)*4;
    volatile float x=table[(lat+256)&1023]*table[lng&1023];
    volatile float y=table[lat&1023]*table[lng&1023];
    normal[0]=x;normal[1]=y;normal[2]=table[(lng+256)&1023];
}
/* Original LerpMeshVertexes arithmetic, evaluated with a binary32 store after
 * every operation. Output records are xyz[3], normal[3], 24 bytes per vertex. */
API int mq3_md3_lerp(const unsigned char *fresh,int freshBytes,const unsigned char *old,int oldBytes,
        const unsigned char *normalTable,int tableBytes,unsigned char *output,int outputBytes,int count,double backlerp) {
    int i,j;float back;const float *table=(const float *)normalTable;
    volatile float oneMinus,newScale,oldScale;
    unsigned int savedControl;
    if (!fresh||!old||!normalTable||!output||count<0||(int64_t)count*8>freshBytes||
            (int64_t)count*8>oldBytes||(int64_t)count*24>outputBytes||tableBytes!=4096) return 0;
    savedControl=_mm_getcsr();_mm_setcsr((savedControl&~0xe040U)|0x1f80U);
    if (!_finite(backlerp)||backlerp<0.0||backlerp>1.0) { _mm_setcsr(savedControl);return 0; }
    /* Conversion and scale construction obey the same owned nearest/even,
     * gradual-underflow mode as the actual vertex operations below. */
    back=(float)backlerp;oneMinus=1.0f-back;
    newScale=0.015625f*oneMinus;oldScale=0.015625f*back;
    for (i=0;i<count;++i) {
        int16_t newXyz[3],oldXyz[3];uint16_t newPacked,oldPacked;float record[6],a[3],b[3];
        memcpy(newXyz,fresh+i*8,6);memcpy(&newPacked,fresh+i*8+6,2);
        decodeMd3Normal(newPacked,table,b);
        if (back==0.0f) {
            for (j=0;j<3;++j) { volatile float position=newXyz[j]*newScale;record[j]=position;record[j+3]=b[j]; }
        } else {
            float blended[3];volatile float x2,inverse,xyy,adjusted;
            memcpy(oldXyz,old+i*8,6);memcpy(&oldPacked,old+i*8+6,2);decodeMd3Normal(oldPacked,table,a);
            for (j=0;j<3;++j) {
                volatile float oldPosition=oldXyz[j]*oldScale,newPosition=newXyz[j]*newScale,position=oldPosition+newPosition;
                volatile float oldNormal=a[j]*back,newNormal=b[j]*oneMinus,normal=oldNormal+newNormal;
                record[j]=position;blended[j]=normal;
            }
            { float length=dot3Strict(blended,blended);x2=length*0.5f;inverse=fvalue(0x5f3759dfU-((uint32_t)((int32_t)fbits(length)>>1))); }
            xyy=x2*inverse;xyy=xyy*inverse;adjusted=1.5f-xyy;inverse=inverse*adjusted;
            for (j=0;j<3;++j) { volatile float normalized=blended[j]*inverse;record[j+3]=normalized; }
        }
        memcpy(output+i*24,record,24);
    }
    _mm_setcsr(savedControl);return 1;
}
API int mq3_md3_transform(const unsigned char *input,int inputBytes,unsigned char *output,int outputBytes,int count,
        double ox,double oy,double oz,double a00,double a01,double a02,double a10,double a11,double a12,double a20,double a21,double a22) {
    float origin[3];
    float columns[3][3];
    int i,j;unsigned int savedControl;
    if (!input||!output||count<0||(int64_t)count*24>inputBytes||(int64_t)count*24>outputBytes) return 0;
    savedControl=_mm_getcsr();_mm_setcsr((savedControl&~0xe040U)|0x1f80U);
    origin[0]=(float)ox;origin[1]=(float)oy;origin[2]=(float)oz;
    columns[0][0]=(float)a00;columns[0][1]=(float)a10;columns[0][2]=(float)a20;
    columns[1][0]=(float)a01;columns[1][1]=(float)a11;columns[1][2]=(float)a21;
    columns[2][0]=(float)a02;columns[2][1]=(float)a12;columns[2][2]=(float)a22;
    for (i=0;i<count;++i) {
        float source[6],target[6];memcpy(source,input+i*24,24);
        for (j=0;j<3;++j) {
            volatile float local=dot3Strict(source,columns[j]),position=local+origin[j];
            target[j]=position;target[j+3]=dot3Strict(source+3,columns[j]);
        }
        memcpy(output+i*24,target,24);
    }
    _mm_setcsr(savedControl);return 1;
}

typedef struct worldFace_s {
    double center[3],radius,normal[3];
    int32_t kind,triangles,cullMode,reserved;
} worldFace;
typedef char worldFaceSizeMustBe72[sizeof(worldFace)==72 ? 1 : -1];
API int mq3_world_store_face(unsigned char *records,int bytes,int index,int kind,int triangles,
        double x,double y,double z,double radius,double nx,double ny,double nz) {
    worldFace face;
    if (!records||index<0||((int64_t)index+1)*72>bytes||triangles<0) return 0;
    face.center[0]=x;face.center[1]=y;face.center[2]=z;face.radius=radius;
    face.normal[0]=nx;face.normal[1]=ny;face.normal[2]=nz;face.kind=kind;face.triangles=triangles;
    face.cullMode=0;face.reserved=0;memcpy(records+(size_t)index*72,&face,72);return 1;
}
API int mq3_world_set_cull_mode(unsigned char *records,int bytes,int index,int mode) {
    if (!records||index<0||((int64_t)index+1)*72>bytes||mode<0||mode>2) return 0;
    write32(records+(size_t)index*72+64,mode);return 1;
}
API int mq3_world_set_two_sided(unsigned char *records,int bytes,int index,int twoSided) {
    return mq3_world_set_cull_mode(records,bytes,index,twoSided!=0);
}
API int mq3_world_filter(const unsigned char *records,int recordBytes,int faceCount,
        const unsigned char *visible,int visibleBytes,int visibleCount,
        unsigned char *output,int outputBytes,unsigned char *previous,int previousBytes,
        double x,double y,double z,double fx,double fy,double fz,double rx,double ry,double rz,double ux,double uy,double uz,
        double nearDistance,double farDistance,double slopeX,double slopeY,double radiusScaleX,double radiusScaleY,int backfaceCull) {
    int i,candidates=0,selected=0,used=0,rejectedFrustum=0,rejectedBackface=0,rejectedDistance=0;
    double camera[3]={x,y,z};float position[3],axes[3][3];
    unsigned int savedControl;
    if (!records||!visible||!output||!previous||faceCount<0||visibleCount<0||
            (int64_t)faceCount*72>recordBytes||(int64_t)visibleCount*4>visibleBytes||
            32+(int64_t)visibleCount*4>outputBytes||previousBytes<outputBytes) return 0;
    savedControl=_mm_getcsr();_mm_setcsr((savedControl&~0xe040U)|0x1f80U);
    position[0]=(float)x;position[1]=(float)y;position[2]=(float)z;
    axes[0][0]=(float)rx;axes[0][1]=(float)ry;axes[0][2]=(float)rz;
    axes[1][0]=(float)ux;axes[1][1]=(float)uy;axes[1][2]=(float)uz;
    axes[2][0]=(float)fx;axes[2][1]=(float)fy;axes[2][2]=(float)fz;
    for (i=0;i<visibleCount;++i) {
        int index=read32(visible+(size_t)i*4),axis;worldFace face;float delta[3];double local[3],distanceSquared,horizontal,vertical;
        if (index<0||index>=faceCount) { _mm_setcsr(savedControl);return 0; }
        memcpy(&face,records+(size_t)index*72,72);
        if (face.kind!=1&&face.kind!=2&&face.kind!=3) continue;
        for (axis=0;axis<3;++axis) { volatile float center=(float)face.center[axis],difference=center-position[axis];delta[axis]=difference; }
        for (axis=0;axis<3;++axis) local[axis]=dot3Strict(delta,axes[axis]);
        distanceSquared=local[0]*local[0]+local[1]*local[1]+local[2]*local[2];
        if (distanceSquared>(farDistance+face.radius)*(farDistance+face.radius)) { ++rejectedDistance;continue; }
        horizontal=local[2]*slopeX+face.radius*radiusScaleX;vertical=local[2]*slopeY+face.radius*radiusScaleY;
        if (local[2]+face.radius<nearDistance||local[2]-face.radius>farDistance||
                local[0]<-horizontal||local[0]>horizontal||local[1]<-vertical||local[1]>vertical) { ++rejectedFrustum;continue; }
        if (backfaceCull&&face.kind==1&&face.cullMode!=1) {
            double facing=face.normal[0]*(camera[0]-face.center[0])+face.normal[1]*(camera[1]-face.center[1])+face.normal[2]*(camera[2]-face.center[2]);
            if ((face.cullMode==2&&facing>8.0)||(face.cullMode==0&&facing< -8.0)) { ++rejectedBackface;continue; }
        }
        ++candidates;
        if (face.triangles>0) {
            if (face.triangles>INT_MAX-used) { _mm_setcsr(savedControl);return 0; }
            write32(output+32+(size_t)selected*4,index);++selected;used+=face.triangles;
        }
    }
    write32(output,candidates);write32(output+4,selected);write32(output+8,used);
    write32(output+12,rejectedFrustum);write32(output+16,rejectedBackface);write32(output+20,rejectedDistance);
    write32(output+24,read32(previous+4)==selected&&memcmp(output+32,previous+32,(size_t)selected*4)==0);
    memcpy(previous,output,32+(size_t)selected*4);_mm_setcsr(savedControl);return 1;
}


/* CM_TransformedBoxTrace against the six axial planes of CM_TempBoxModel.
 * World traversal, capsule traces and ownership of the result stay in MiniLang.
 * A negative return sends unusual or non-finite input through the checked path.
 */
static int trace_transformed_box(const float start[3], const float end[3],
                                 const float mins[3], const float maxs[3],
                                 const float origin[3], const float box_min[3],
                                 const float box_max[3], int matches_mask,
                                 float result[5]) {
    float a[3], b[3], lo[3], hi[3], enter = -1.0f, leave = 1.0f;
    int stationary = 1, startout = 0, getout = 0, leading = -1, hit = 0;
    result[0] = 1.0f;
    result[1] = 0.0f;
    for (int i = 0; i < 3; ++i) {
        if (!isfinite(start[i]) || !isfinite(end[i]) || !isfinite(origin[i]) ||
            !isfinite(mins[i]) || !isfinite(maxs[i]) || mins[i] > maxs[i]) return -1;
        float center = (mins[i] + maxs[i]) * 0.5f;
        lo[i] = mins[i] - center;
        hi[i] = maxs[i] - center;
        a[i] = (start[i] + center) - origin[i];
        b[i] = (end[i] + center) - origin[i];
        if (!isfinite(lo[i]) || !isfinite(hi[i]) || !isfinite(a[i]) || !isfinite(b[i])) return -1;
        if (a[i] != b[i]) stationary = 0;
        /* CM_Trace recenters the transformed bounds again. */
        center = (lo[i] + hi[i]) * 0.5f;
        a[i] += center;
        b[i] += center;
        lo[i] -= center;
        hi[i] -= center;
        if (!isfinite(a[i]) || !isfinite(b[i]) || !isfinite(end[i] - start[i])) return -1;
    }
    if (matches_mask && stationary) {
        hit = 2;
        for (int i = 0; i < 3; ++i) {
            if (a[i] + lo[i] > box_max[i] || a[i] + hi[i] < box_min[i]) hit = 0;
        }
        if (hit == 2) result[0] = 0.0f;
    } else if (matches_mask) {
        for (int side = 0; side < 6; ++side) {
            int i = side / 2, negative = side & 1;
            float plane = negative ? -box_min[i] : box_max[i];
            float distance = plane - (negative ? -hi[i] : lo[i]);
            float d1 = (negative ? -a[i] : a[i]) - distance;
            float d2 = (negative ? -b[i] : b[i]) - distance;
            if (!isfinite(d1) || !isfinite(d2)) return -1;
            if (d1 > 0.0f && (d2 >= 0.125f || d2 >= d1)) goto done;
            if (d1 > 0.0f) startout = 1;
            if (d2 > 0.0f) getout = 1;
            if (d1 <= 0.0f && d2 <= 0.0f) continue;
            float delta = d1 - d2;
            if (!isfinite(delta)) return -1;
            if (d1 > d2) {
                float fraction = (float)(((double)d1 - 0.125) / (double)delta);
                if (fraction < 0.0f) fraction = 0.0f;
                if (fraction > enter) { enter = fraction; leading = side; }
            } else {
                float fraction = (float)(((double)d1 + 0.125) / (double)delta);
                if (fraction < leave) leave = fraction;
            }
        }
        if (!startout) {
            hit = getout ? 1 : 2;
            if (!getout) result[0] = 0.0f;
        } else if (enter < leave && leading >= 0) {
            hit = 3 + leading;
            result[0] = enter;
            result[1] = (leading & 1) ? -box_min[leading / 2] : box_max[leading / 2];
        }
    }
done:
    for (int i = 0; i < 3; ++i) result[2 + i] = start[i] + result[0] * (end[i] - start[i]);
    return hit;
}

API int mq3_trace_transformed_box(
    double ax, double ay, double az, double bx, double by, double bz,
    double lx, double ly, double lz, double hx, double hy, double hz,
    double ox, double oy, double oz, double tx, double ty, double tz,
    double ux, double uy, double uz, int matches_mask, unsigned char *output) {
    unsigned int saved = _mm_getcsr();
    _mm_setcsr((saved & ~0xe07fU) | 0x1f80U);
    float start[3] = {(float)ax, (float)ay, (float)az};
    float end[3] = {(float)bx, (float)by, (float)bz};
    float mins[3] = {(float)lx, (float)ly, (float)lz};
    float maxs[3] = {(float)hx, (float)hy, (float)hz};
    float origin[3] = {(float)ox, (float)oy, (float)oz};
    float box_min[3] = {(float)tx, (float)ty, (float)tz};
    float box_max[3] = {(float)ux, (float)uy, (float)uz};
    float result[5];
    int hit = trace_transformed_box(start, end, mins, maxs, origin, box_min, box_max, matches_mask, result);
    if (hit >= 0) memcpy(output, result, sizeof(result));
    _mm_setcsr(saved);
    return hit;
}


static float collision_dot(const float a[3], const float b[3]) {
    return (a[0] * b[0] + a[1] * b[1]) + a[2] * b[2];
}

/* Return the matching side with the earliest opposing plane, or the
 * startsolid/allsolid status. BSP order, masks and patches stay in MiniLang. */
static int trace_convex_brush(const unsigned char *planes, int plane_bytes,
                              const float start[3], const float end[3],
                              const float mins[3], const float maxs[3],
                              float limit, float *result) {
    float enter = -1.0f, leave = 1.0f;
    int startout = 0, getout = 0, leading = -1;
    for (int offset = 0; offset < plane_bytes; offset += 16) {
        float p[4], corner[3];
        memcpy(p, planes + offset, sizeof(p));
        for (int i = 0; i < 3; ++i) corner[i] = p[i] < 0.0f ? maxs[i] : mins[i];
        float distance = p[3] - collision_dot(corner, p);
        float d1 = collision_dot(start, p) - distance;
        float d2 = collision_dot(end, p) - distance;
        if (!isfinite(d1) || !isfinite(d2)) return -1;
        if (d1 > 0.0f && (d2 >= 0.125f || d2 >= d1)) return 0;
        if (d1 > 0.0f) startout = 1;
        if (d2 > 0.0f) getout = 1;
        if (d1 <= 0.0f && d2 <= 0.0f) continue;
        float delta = d1 - d2;
        if (!isfinite(delta)) return -1;
        if (d1 > d2) {
            float fraction = (float)(((double)d1 - 0.125) / (double)delta);
            if (fraction < 0.0f) fraction = 0.0f;
            if (fraction > enter) { enter = fraction; leading = offset / 16; }
        } else {
            float fraction = (float)(((double)d1 + 0.125) / (double)delta);
            if (fraction < leave) leave = fraction;
        }
    }
    if (!startout && plane_bytes != 0) return getout ? 1 : 2;
    if (leading < 0 || !(enter < leave && enter < limit)) return 0;
    *result = enter;
    return leading + 3;
}

API int mq3_trace_convex_brush(const unsigned char *planes, int plane_bytes,
    double ax, double ay, double az, double bx, double by, double bz,
    double lx, double ly, double lz, double hx, double hy, double hz,
    double limit, unsigned char *output) {
    if (plane_bytes < 0 || plane_bytes % 16 != 0) return -1;
    unsigned int saved = _mm_getcsr();
    _mm_setcsr((saved & ~0xe07fU) | 0x1f80U);
    float start[3] = {(float)ax, (float)ay, (float)az};
    float end[3] = {(float)bx, (float)by, (float)bz};
    float mins[3] = {(float)lx, (float)ly, (float)lz};
    float maxs[3] = {(float)hx, (float)hy, (float)hz};
    float fraction = 1.0f;
    int hit = trace_convex_brush(planes, plane_bytes, start, end, mins, maxs, (float)limit, &fraction);
    if (hit >= 3) memcpy(output, &fraction, sizeof(fraction));
    _mm_setcsr(saved);
    return hit;
}
