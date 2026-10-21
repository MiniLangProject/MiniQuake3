/* Host for the unchanged Baseq3 texture-scroll routine used by
 * TMOD_ENTITY_TRANSLATE. */
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#define SHADER_MAX_VERTEXES 8
typedef struct { int numVertexes; float shaderTime; } shaderCommands_t;
static shaderCommands_t tess;
#include "shader_entity_translate_under_test.inc"

static uint32_t bits(float value) {
    uint32_t result;
    memcpy(&result, &value, sizeof(result));
    return result;
}
static void run(const char *name, float time, float s, float t, float u, float v) {
    float speed[2] = { s, t };
    float coords[2] = { u, v };
    tess.numVertexes = 1;
    tess.shaderTime = time;
    RB_CalcScrollTexCoords(speed, coords);
    printf("%s|%08x,%08x\n", name, bits(coords[0]), bits(coords[1]));
}
int main(void) {
    run("positive-negative", 2.0f, 0.25f, -0.125f, 0.0f, 0.0f);
    run("both-wrap", 0.5f, -1.5f, 2.25f, 0.25f, 0.5f);
    run("zero-time", 0.0f, 99.0f, -77.0f, 0.125f, 0.875f);
    return 0;
}
