/* Host for unchanged R_ChopPolyBehindPlane/R_AddMarkFragments from tr_marks.c. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>

typedef float vec_t;
typedef float vec3_t[3];
typedef struct { int firstPoint; int numPoints; } markFragment_t;

#define MAX_VERTS_ON_POLY 64
#define SIDE_FRONT 0
#define SIDE_BACK 1
#define SIDE_ON 2
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define VectorCopy(a,b) do { (b)[0]=(a)[0]; (b)[1]=(a)[1]; (b)[2]=(a)[2]; } while (0)
#define Com_Memcpy memcpy

#include "mark_fragments_under_test.inc"

static uint32_t bits(float value) { uint32_t word; memcpy(&word, &value, 4); return word; }
static void emit(const char *name, int count, vec3_t *points) {
    int i;
    printf("%s|%d", name, count);
    for (i = 0; i < count; ++i) {
        printf("|%08x,%08x,%08x", bits(points[i][0]), bits(points[i][1]), bits(points[i][2]));
    }
    putchar('\n');
}

int main(void) {
    vec3_t square[MAX_VERTS_ON_POLY] = {{-1,-1,0},{1,-1,0},{1,1,0},{-1,1,0}};
    vec3_t triangle[2][MAX_VERTS_ON_POLY] = {{{-1,0,0},{1,0,0},{0,1,0}}};
    vec3_t output[MAX_VERTS_ON_POLY], normal = {1,0,0};
    vec3_t normals[1] = {{1,0,0}}, mins = {-2,-2,-2}, maxs = {2,2,2};
    float dists[1] = {0};
    float pointBuffer[MAX_VERTS_ON_POLY * 3];
    markFragment_t fragments[4];
    int count, returnedPoints = 0, returnedFragments = 0;

    R_ChopPolyBehindPlane(4, square, &count, output, normal, -2.0f, 0.5f);
    emit("front", count, output);
    R_ChopPolyBehindPlane(4, square, &count, output, normal, 2.0f, 0.5f);
    emit("back", count, output);
    R_ChopPolyBehindPlane(4, square, &count, output, normal, 0.0f, 0.5f);
    emit("split", count, output);
    R_AddMarkFragments(3, triangle, 1, normals, dists, 16, pointBuffer,
                       4, fragments, &returnedPoints, &returnedFragments, mins, maxs);
    printf("add|%d|%d|%d|%d", returnedFragments, returnedPoints,
           fragments[0].firstPoint, fragments[0].numPoints);
    for (count = 0; count < returnedPoints; ++count) {
        printf("|%08x,%08x,%08x", bits(pointBuffer[count*3]), bits(pointBuffer[count*3+1]), bits(pointBuffer[count*3+2]));
    }
    putchar('\n');
    returnedPoints = 0; returnedFragments = 0;
    R_AddMarkFragments(3, triangle, 1, normals, dists, 1, pointBuffer,
                       4, fragments, &returnedPoints, &returnedFragments, mins, maxs);
    printf("capacity|%d|%d\n", returnedFragments, returnedPoints);
    return 0;
}
