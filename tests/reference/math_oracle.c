/* SPDX-License-Identifier: GPL-2.0-or-later
 * Test-only driver linked against unchanged original q_math.c.
 */
#include "q_shared.h"
#include <stdint.h>

static uint32_t generator = 0x12345678u;
static uint32_t next(void) { generator = generator * 1664525u + 1013904223u; return generator; }
static float component(void) { return ((int)(next() & 65535u) - 32768) / 32.0f; }
static void word(FILE *f, uint32_t value) { fwrite(&value, 4, 1, f); }
static void scalar(FILE *f, float value) { fwrite(&value, 4, 1, f); }

int main(int argc, char **argv) {
    FILE *f;
    int j, k, seed, initial;
    float value, a, b, fraction, random, crandom;
    vec3_t v, w, cross, ma;
    uint32_t bits;
    if (argc != 2 || !(f = fopen(argv[1], "wb"))) return 2;
    word(f, 0x33514d54); word(f, 4096);
    for (j = 0; j < 4096; ++j) {
        initial = (int)next(); seed = initial;
        word(f, initial); word(f, Q_rand(&seed));
        seed = initial; random = Q_random(&seed); scalar(f, random);
        seed = initial; crandom = Q_crandom(&seed); scalar(f, crandom);
        bits = next() & 0x7fffffffu;
        if (bits >= 0x7f800000u) bits &= 0x7effffffu;
        if (bits == 0) bits = 1;
        memcpy(&value, &bits, 4);
        scalar(f, value); scalar(f, Q_rsqrt(value)); scalar(f, Q_fabs(-value));
        a = component(); b = component(); fraction = (next() & 65535u) / 65536.0f;
        scalar(f, a); scalar(f, b); scalar(f, fraction); scalar(f, LerpAngle(a,b,fraction));
        for(k=0;k<3;k++) { v[k]=component(); w[k]=component(); }
        for(k=0;k<3;k++) scalar(f, v[k]);
        for(k=0;k<3;k++) scalar(f, w[k]);
        scalar(f, DotProduct(v,w)); CrossProduct(v,w,cross); VectorMA(v,fraction,w,ma);
        for(k=0;k<3;k++) scalar(f,cross[k]);
        for(k=0;k<3;k++) scalar(f,ma[k]);
    }
    fclose(f); return 0;
}
