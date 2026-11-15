/* SPDX-License-Identifier: GPL-2.0-or-later
 * MiniLang ABI conversion and binary32 arithmetic only.
 * No Quake algorithms or engine state.
 */
#include <stdint.h>
#include <string.h>
#include <emmintrin.h>
#define API __declspec(dllexport)

/* A host OpenGL/audio/FFI caller can leave arbitrary rounding, FTZ/DAZ or
 * exception masks behind. Every primitive owns and restores its exact MXCSR;
 * in particular narrowing the double arguments happens inside this scope. */
static unsigned int mq3_binary32_enter(void) {
    unsigned int saved=_mm_getcsr();
    _mm_setcsr((saved & ~0xe07fU) | 0x1f80U);
    return saved;
}
static uint32_t mq3_narrow_bits(double value) {
    __m128 result=_mm_cvtsd_ss(_mm_setzero_ps(),_mm_set_sd(value));
    return (uint32_t)_mm_cvtsi128_si32(_mm_castps_si128(result));
}
static double mq3_widen_bits(uint32_t bits) {
    __m128 input=_mm_castsi128_ps(_mm_cvtsi32_si128((int32_t)bits));
    return _mm_cvtsd_f64(_mm_cvtss_sd(_mm_setzero_pd(),input));
}
static int mq3_nan_bits(uint32_t bits) { return (bits & 0x7fffffffU)>0x7f800000U; }

/* Match the retained MiniLang reference's left-to-right NaN selection rather
 * than relying on a C compiler's operand commutation for ADDSS/MULSS. */
static uint32_t mq3_binary_bits(uint32_t a,uint32_t b,int operation) {
    __m128 x,y,z;
    if(mq3_nan_bits(a)) return a | 0x00400000U;
    if(mq3_nan_bits(b)) return b | 0x00400000U;
    x=_mm_castsi128_ps(_mm_cvtsi32_si128((int32_t)a));
    y=_mm_castsi128_ps(_mm_cvtsi32_si128((int32_t)b));
    switch(operation) {
        case 0:z=_mm_add_ss(x,y);break;
        case 1:z=_mm_sub_ss(x,y);break;
        case 2:z=_mm_mul_ss(x,y);break;
        default:z=_mm_div_ss(x,y);break;
    }
    return (uint32_t)_mm_cvtsi128_si32(_mm_castps_si128(z));
}
static uint32_t mq3_sqrt_bits(uint32_t input) {
    __m128 value;
    if(mq3_nan_bits(input)) return input | 0x00400000U;
    value=_mm_castsi128_ps(_mm_cvtsi32_si128((int32_t)input));
    return (uint32_t)_mm_cvtsi128_si32(_mm_castps_si128(_mm_sqrt_ss(value)));
}

API double mq3_f32(double value) {
    unsigned int saved=mq3_binary32_enter();
    double result=mq3_widen_bits(mq3_narrow_bits(value));
    _mm_setcsr(saved);return result;
}
API uint32_t mq3_float_bits(double value) {
    unsigned int saved=mq3_binary32_enter();uint32_t result=mq3_narrow_bits(value);
    _mm_setcsr(saved);return result;
}
API double mq3_bits_float(uint32_t bits) {
    unsigned int saved=mq3_binary32_enter();double result=mq3_widen_bits(bits);
    _mm_setcsr(saved);return result;
}
#define MQ3_BINARY32(name,operation) \
    API uint32_t mq3_##name##_bits(uint32_t a,uint32_t b) { \
        unsigned int saved=mq3_binary32_enter();uint32_t result=mq3_binary_bits(a,b,operation); \
        _mm_setcsr(saved);return result; \
    } \
    API double mq3_##name(double a,double b) { \
        unsigned int saved=mq3_binary32_enter(); \
        double result=mq3_widen_bits(mq3_binary_bits(mq3_narrow_bits(a),mq3_narrow_bits(b),operation)); \
        _mm_setcsr(saved);return result; \
    }
MQ3_BINARY32(fadd,0)
MQ3_BINARY32(fsub,1)
MQ3_BINARY32(fmul,2)
MQ3_BINARY32(fdiv,3)
#undef MQ3_BINARY32
API uint32_t mq3_fsqrt_bits(uint32_t value) {
    unsigned int saved=mq3_binary32_enter();uint32_t result=mq3_sqrt_bits(value);
    _mm_setcsr(saved);return result;
}
API double mq3_fsqrt(double value) {
    unsigned int saved=mq3_binary32_enter();double result=mq3_widen_bits(mq3_sqrt_bits(mq3_narrow_bits(value)));
    _mm_setcsr(saved);return result;
}
