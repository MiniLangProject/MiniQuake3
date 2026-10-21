/* Host for unchanged R_ColorShiftLightingBytes from tr_bsp.c. */
#include <stdio.h>

typedef unsigned char byte;
typedef struct { int integer; } cvar_t;
typedef struct { int overbrightBits; } trGlobals_t;

static cvar_t mapOverbright;
static cvar_t *r_mapOverBrightBits = &mapOverbright;
static trGlobals_t tr;

#include "bsp_lighting_shift_under_test.inc"

static void run(int shift, int red, int green, int blue, int alpha) {
    byte input[4] = {(byte)red, (byte)green, (byte)blue, (byte)alpha};
    byte output[4] = {0, 0, 0, 0};
    mapOverbright.integer = shift;
    tr.overbrightBits = 0;
    R_ColorShiftLightingBytes(input, output);
    printf("%d|%d,%d,%d,%d|%d,%d,%d,%d\n", shift,
           red, green, blue, alpha,
           output[0], output[1], output[2], output[3]);
}

int main(void) {
    run(0, 1, 2, 3, 4);
    run(1, 10, 20, 30, 40);
    run(2, 10, 20, 30, 41);
    run(2, 64, 64, 64, 42);
    run(2, 200, 100, 50, 43);
    run(2, 251, 252, 253, 44);
    run(1, 0, 255, 127, 45);
    return 0;
}
