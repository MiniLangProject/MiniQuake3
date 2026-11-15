/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "../native/abi.c"
#include <stdio.h>
#include <math.h>

typedef uint32_t (*binaryBitsFn)(uint32_t,uint32_t);
typedef double (*binaryFn)(double,double);
typedef uint32_t (*unaryBitsFn)(uint32_t);
typedef double (*unaryFn)(double);
static binaryBitsFn volatile bitsCalls[4]={mq3_fadd_bits,mq3_fsub_bits,mq3_fmul_bits,mq3_fdiv_bits};
static binaryFn volatile doubleCalls[4]={mq3_fadd,mq3_fsub,mq3_fmul,mq3_fdiv};
static unaryBitsFn volatile sqrtBitsCall=mq3_fsqrt_bits;
static unaryFn volatile sqrtCall=mq3_fsqrt;
static unaryFn volatile f32Call=mq3_f32;
static uint32_t state=0x13579bdfU;
static uint32_t nextBits(void) { state=state*1664525U+1013904223U;return state; }
static uint64_t doubleBits(double value) { uint64_t bits;memcpy(&bits,&value,8);return bits; }
static int checkCSR(unsigned int requested,const char *kind,int op) {
    unsigned int actual=_mm_getcsr();
    if(actual!=requested) { _mm_setcsr(0x1f80U);fprintf(stderr,"binary32 %s op%d changed MXCSR %08x -> %08x\n",kind,op,requested,actual);return 0; }
    return 1;
}
static int emit(FILE *out,uint32_t a,uint32_t b) {
    uint32_t row[7];int op;
    row[0]=a;row[1]=b;
    for(op=0;op<4;++op) row[op+2]=bitsCalls[op](a,b);
    row[6]=sqrtBitsCall(a);
    return fwrite(row,sizeof(row),1,out)==1;
}
int main(int argc,char **argv) {
    static const uint32_t edges[]={0,0x80000000,1,0x80000001,2,0x80000002,0x003fffff,0x007fffff,
        0x807fffff,0x00800000,0x80800000,0x00800001,0x80800001,0x3f000000,0xbf000000,0x3f800000,
        0xbf800000,0x3f800001,0xbf800001,0x3f7fffff,0xbf7fffff,0x33800000,0x33000000,0x34000000,
        0x4f000000,0xcf000000,0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7f800001,0xff800001,
        0x7fa12345,0xffa54321,0x7fbfffff,0xffbfffff,0x7fc00000,0xffc00000,0x7fc12345,0xffc54321,
        0x7fffffff,0xffffffff};
    unsigned int original=_mm_getcsr();
    unsigned int count=0,modeCalls=0;
    int i,j,mode,ftz,daz,masks,op;
    FILE *out=0;
    if(argc!=2 || fopen_s(&out,argv[1],"wb") || !out) return 2;
    _mm_setcsr(0x1f80U);
    for(i=0;i<(int)(sizeof(edges)/sizeof(edges[0]));++i) for(j=0;j<(int)(sizeof(edges)/sizeof(edges[0]));++j) {
        uint32_t a=edges[i],b=edges[j],expected[5],narrowA,narrowB;
        double da=mq3_bits_float(a),db=mq3_bits_float(b);
        uint64_t expectedDouble[5];
        narrowA=mq3_float_bits(da);narrowB=mq3_float_bits(db);
        for(op=0;op<4;++op) { expected[op]=bitsCalls[op](a,b);expectedDouble[op]=doubleBits(mq3_bits_float(bitsCalls[op](narrowA,narrowB))); }
        expected[4]=sqrtBitsCall(a);expectedDouble[4]=doubleBits(mq3_bits_float(sqrtBitsCall(narrowA)));
        for(mode=0;mode<4;++mode) for(ftz=0;ftz<2;++ftz) for(daz=0;daz<2;++daz) for(masks=0;masks<2;++masks) {
            unsigned int requested=0x1fa5U|((unsigned int)mode<<13)|((unsigned int)ftz<<15)|((unsigned int)daz<<6);
            if(masks) requested&=~0x0280U; /* unmask invalid and divide-by-zero */
            for(op=0;op<4;++op) {
                uint32_t result;uint64_t resultDouble;
                _mm_setcsr(requested);result=bitsCalls[op](a,b);
                if(!checkCSR(requested,"bits",op)) goto failure;
                if(result!=expected[op]) { _mm_setcsr(0x1f80U);fprintf(stderr,"binary32 bits depend on mode a=%08x b=%08x op%d csr=%08x\n",a,b,op,requested);goto failure; }
                _mm_setcsr(requested);resultDouble=doubleBits(doubleCalls[op](da,db));
                if(!checkCSR(requested,"double ABI",op)) goto failure;
                if(resultDouble!=expectedDouble[op]) { _mm_setcsr(0x1f80U);fprintf(stderr,"binary32 double ABI depends on mode a=%08x b=%08x op%d csr=%08x\n",a,b,op,requested);goto failure; }
                modeCalls+=2;
            }
            _mm_setcsr(requested);
            if(sqrtBitsCall(a)!=expected[4] || !checkCSR(requested,"sqrt bits",4)) goto failure;
            _mm_setcsr(requested);
            if(doubleBits(sqrtCall(da))!=expectedDouble[4] || !checkCSR(requested,"sqrt double ABI",4)) goto failure;
            modeCalls+=2;
        }
        _mm_setcsr(0x1f80U);if(!emit(out,a,b)) goto failure;++count;
    }
    for(i=0;i<50000;++i) { uint32_t a=nextBits(),b=nextBits();if(!emit(out,a,b)) goto failure;++count; }
    /* Direct double inputs cover operand narrowing before the arithmetic,
     * including exact halfway values, overflow and tiny binary32 subnormals. */
    {
        double inputs[]={0,-0.0,1.0+ldexp(1.0,-24),1.0+3*ldexp(1.0,-24),-1.0-ldexp(1.0,-24),
            ldexp(1.0,-149),ldexp(1.0,-150),3*ldexp(1.0,-150),ldexp(1.0,-140),ldexp(1.0,-1074),
            3.4028234663852886e38,3.4028235677973366e38,1e300,-1e300};
        for(i=0;i<(int)(sizeof(inputs)/sizeof(inputs[0]));++i) for(j=0;j<(int)(sizeof(inputs)/sizeof(inputs[0]));++j) {
            uint64_t expected[4],expectedSqrt,expectedF32;
            uint32_t a=mq3_float_bits(inputs[i]),b=mq3_float_bits(inputs[j]);
            for(op=0;op<4;++op) expected[op]=doubleBits(mq3_bits_float(bitsCalls[op](a,b)));
            expectedSqrt=doubleBits(mq3_bits_float(sqrtBitsCall(a)));expectedF32=doubleBits(mq3_bits_float(a));
            for(mode=0;mode<4;++mode) for(ftz=0;ftz<2;++ftz) for(daz=0;daz<2;++daz) {
                unsigned int requested=0x1fa5U|((unsigned int)mode<<13)|((unsigned int)ftz<<15)|((unsigned int)daz<<6);
                for(op=0;op<4;++op) {
                    _mm_setcsr(requested);
                    if(doubleBits(doubleCalls[op](inputs[i],inputs[j]))!=expected[op] || !checkCSR(requested,"narrow arguments",op)) goto failure;
                    ++modeCalls;
                }
                _mm_setcsr(requested);if(doubleBits(sqrtCall(inputs[i]))!=expectedSqrt || !checkCSR(requested,"narrow sqrt",4)) goto failure;
                _mm_setcsr(requested);if(doubleBits(f32Call(inputs[i]))!=expectedF32 || !checkCSR(requested,"narrow f32",5)) goto failure;
                modeCalls+=2;
            }
            _mm_setcsr(0x1f80U);
        }
    }
    _mm_setcsr(original);fclose(out);
    printf("PASS: %u binary32 records, %u MXCSR/ABI calls (32 rounding/denormal/exception modes, exact restoration)\n",count,modeCalls);
    return 0;
failure:
    _mm_setcsr(original);fclose(out);return 1;
}
