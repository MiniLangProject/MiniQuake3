/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "../native/qvm_exec.c"
#include <stdio.h>

typedef int (*md3LerpFn)(const unsigned char *,int,const unsigned char *,int,
    const unsigned char *,int,unsigned char *,int,int,double);
typedef int (*md3TransformFn)(const unsigned char *,int,unsigned char *,int,int,
    double,double,double,double,double,double,double,double,double,double,double,double);
/* Match the DLL ABI boundary: prevent call-site inlining/constant folding of
 * the deliberately halfway and subnormal double arguments. */
static md3LerpFn volatile callLerp = mq3_md3_lerp;
static md3TransformFn volatile callTransform = mq3_md3_transform;

static int checkControl(unsigned int expected,const char *operation,int sample) {
    unsigned int actual=_mm_getcsr();
    if(actual!=expected) {
        fprintf(stderr,"MD3 %s sample%d changed MXCSR: expected=%08x actual=%08x\n",operation,sample,expected,actual);
        return 0;
    }
    return 1;
}

int main(void) {
    int16_t fresh[3][4]={{32767,-12345,127,0},{-23456,30001,-32768,16384},{127,-91,183,8192}};
    int16_t old[3][4]={{-1023,23456,-31999,8192},{1024,-16383,23456,0},{30001,19,-32767,16384}};
    float table[1024];
    float input[18]={1,2,3,0,1,0, 0,0,0,0,0,1, 127.25f,-32768,0.5f,1,0,0};
    unsigned char expectedLerp[5][72];
    unsigned char expectedTransform[3][72];
    unsigned char output[72];
    double backs[5];
    double transform[3][12];
    unsigned int original=_mm_getcsr();
    int mode;
    int ftz;
    int daz;
    int sample;
    int calls=0;
    int result=1;
    _mm_setcsr(0x1f80U);
    backs[0]=0;backs[1]=0.12345678;backs[2]=0.5+ldexp(1.0,-25);backs[3]=ldexp(1.0,-140);backs[4]=1;
    for(sample=0;sample<1024;++sample) table[sample]=(float)sin((double)sample*6.2831853071795864769/1024.0);
    memset(transform,0,sizeof(transform));
    transform[0][0]=1.0+ldexp(1.0,-24);transform[0][1]=-1.0-ldexp(1.0,-24);transform[0][2]=ldexp(1.0,-145);
    transform[0][3]=transform[0][7]=transform[0][11]=1.0+ldexp(1.0,-24);
    transform[1][3]=ldexp(1.0,-145);transform[1][7]=transform[1][11]=1;
    transform[2][0]=123.25;transform[2][1]=-400.5;transform[2][2]=0.03125;
    transform[2][3]=1.25;transform[2][4]=0.37;transform[2][5]=-0.125;
    transform[2][6]=-0.5;transform[2][7]=2;transform[2][8]=0.75;
    transform[2][9]=0.33;transform[2][10]=-0.2;transform[2][11]=0.8;
    for(sample=0;sample<5;++sample) {
        if(!callLerp((unsigned char *)fresh,sizeof(fresh),(unsigned char *)old,sizeof(old),
                (unsigned char *)table,sizeof(table),expectedLerp[sample],72,3,backs[sample])) goto failed;
    }
    for(sample=0;sample<3;++sample) {
        double *v=transform[sample];
        if(!callTransform((unsigned char *)input,sizeof(input),expectedTransform[sample],72,3,
                v[0],v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8],v[9],v[10],v[11])) goto failed;
    }
    for(mode=0;mode<4;++mode) for(ftz=0;ftz<2;++ftz) for(daz=0;daz<2;++daz) {
        /* Keep pre-existing sticky exception flags too, not only rounding and
         * denormal controls. The helper must restore the caller's exact word. */
        unsigned int requested=0x1fa5U|((unsigned int)mode<<13)|((unsigned int)ftz<<15)|((unsigned int)daz<<6);
        for(sample=0;sample<5;++sample) {
            _mm_setcsr(requested);
            if(!callLerp((unsigned char *)fresh,sizeof(fresh),(unsigned char *)old,sizeof(old),
                    (unsigned char *)table,sizeof(table),output,72,3,backs[sample]) ||
                    !checkControl(requested,"lerp",sample)) goto failed;
            if(memcmp(output,expectedLerp[sample],72)) {
                fprintf(stderr,"MD3 lerp depends on caller mode=%08x sample=%d\n",requested,sample);goto failed;
            }
            ++calls;
        }
        for(sample=0;sample<3;++sample) {
            double *v=transform[sample];
            _mm_setcsr(requested);
            if(!callTransform((unsigned char *)input,sizeof(input),output,72,3,
                    v[0],v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8],v[9],v[10],v[11]) ||
                    !checkControl(requested,"transform",sample)) goto failed;
            if(memcmp(output,expectedTransform[sample],72)) {
                fprintf(stderr,"MD3 transform depends on caller mode=%08x sample=%d\n",requested,sample);goto failed;
            }
            ++calls;
        }
        _mm_setcsr(requested);
        if(callLerp(0,0,(unsigned char *)old,sizeof(old),(unsigned char *)table,sizeof(table),output,72,3,backs[3]) ||
                !checkControl(requested,"invalid lerp",0)) goto failed;
        ++calls;
        _mm_setcsr(requested);
        if(callTransform(0,0,output,72,3,transform[0][0],transform[0][1],transform[0][2],
                1,0,0,0,1,0,0,0,1) || !checkControl(requested,"invalid transform",0)) goto failed;
        ++calls;
    }
    _mm_setcsr(original);
    printf("PASS: native MD3 MXCSR independence (16 modes, %d calls, exact restoration)\n",calls);
    return 0;
failed:
    result=1;
    _mm_setcsr(original);
    return result;
}
