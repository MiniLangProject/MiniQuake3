/* Host for unchanged Baseq3 fog color modulation routines. */
#include <stdio.h>
#include <string.h>
#define SHADER_MAX_VERTEXES 8
typedef struct { int numVertexes; } shaderCommands_t;
static shaderCommands_t tess;
static float fogCoordinates[SHADER_MAX_VERTEXES][2];
static void RB_CalcFogTexCoords(float *st) { memcpy(st, fogCoordinates, (size_t)tess.numVertexes * 2u * sizeof(float)); }
static float R_FogFactor(float s, float t) { (void)t; return s; }
#include "shader_fog_color_under_test.inc"

static void reset(unsigned char *colors) {
    static const unsigned char seed[12] = { 200,150,100,50, 17,63,129,201, 255,1,128,64 };
    memcpy(colors, seed, sizeof(seed));
    tess.numVertexes = 3;
    fogCoordinates[0][0] = 0.0f; fogCoordinates[0][1] = 0.0f;
    fogCoordinates[1][0] = 0.25f; fogCoordinates[1][1] = 0.0f;
    fogCoordinates[2][0] = 1.0f; fogCoordinates[2][1] = 0.0f;
}
static void show(const char *name, const unsigned char *colors) {
    int i;
    printf("%s|", name);
    for (i = 0; i < 12; ++i) printf("%s%u", i ? "," : "", colors[i]);
    putchar('\n');
}
int main(void) {
    unsigned char colors[12];
    reset(colors); RB_CalcModulateColorsByFog(colors); show("rgb", colors);
    reset(colors); RB_CalcModulateAlphasByFog(colors); show("alpha", colors);
    reset(colors); RB_CalcModulateRGBAsByFog(colors); show("rgba", colors);
    return 0;
}
