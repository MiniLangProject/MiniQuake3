/* Host for the unchanged Baseq3 renderer noise implementation. */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define NOISE_SIZE 256
#define NOISE_MASK (NOISE_SIZE - 1)

static float s_noise_table[NOISE_SIZE];
static int s_noise_perm[NOISE_SIZE];

#define VAL(a) s_noise_perm[(a) & NOISE_MASK]
#define INDEX(x,y,z,t) VAL((x) + VAL((y) + VAL((z) + VAL(t))))
#define LERP(a,b,w) ((a) * (1.0f - (w)) + (b) * (w))

#include "renderer_noise_under_test.inc"

static long quantize(float value) {
    return lroundf(value * 1000000.0f);
}

int main(void) {
    static const float cases[][4] = {
        {0.0f, 0.0f, 0.0f, 0.0f},
        {0.25f, 0.5f, 0.75f, 1.0f},
        {-0.25f, -0.5f, -0.75f, -1.0f},
        {255.9f, 256.1f, 511.5f, 12.75f},
        {-256.125f, 1024.875f, -511.25f, 7.5f},
        {3.1415927f, 2.7182817f, 1.4142135f, 0.5772157f},
        {100.125f, 200.25f, 300.5f, 400.75f},
        {-1000.75f, 0.03125f, 64.5f, -32.25f}
    };
    size_t i;
    R_NoiseInit();
    for (i = 0; i < sizeof(cases) / sizeof(cases[0]); ++i) {
        printf("%u|%ld\n", (unsigned)i,
               quantize(R_NoiseGet4f(cases[i][0], cases[i][1], cases[i][2], cases[i][3])));
    }
    return 0;
}
