#include <math.h>
#include <stdio.h>
#include <string.h>

typedef unsigned char byte;
#define qtrue 1
#define qfalse 0
typedef struct { int integer; } cvar_t;
typedef struct { int overbrightBits; } trGlobals_t;
typedef struct { float xyz[3]; } drawVert_t;
typedef struct { int width, height; drawVert_t *verts; } srfGridMesh_t;

static cvar_t mapOverbright;
static cvar_t *r_mapOverBrightBits = &mapOverbright;
static trGlobals_t tr;

#include "tr_bsp_complete_under_test.inc"

static void point(drawVert_t *v, float x, float y, float z) {
    v->xyz[0] = x; v->xyz[1] = y; v->xyz[2] = z;
}

int main(void) {
    float rgb[3];
    const float hsv[][3] = {{0.0f,1.0f,0.5f},{0.1f,1.0f,0.5f},{0.2f,0.5f,0.75f},{0.6f,1.0f,1.0f},{1.0f,1.0f,0.5f}};
    for (int i=0;i<5;i++) {
        HSVtoRGB(hsv[i][0],hsv[i][1],hsv[i][2],rgb);
        printf("H %d %d %d\n",(int)(rgb[0]*1000000.0f+0.5f),(int)(rgb[1]*1000000.0f+0.5f),(int)(rgb[2]*1000000.0f+0.5f));
    }
    const byte inputs[][4]={{1,2,3,4},{200,100,50,77},{255,255,255,128},{0,128,255,9}};
    for (int shift=0;shift<3;shift++) {
        mapOverbright.integer=shift;tr.overbrightBits=0;
        for (int i=0;i<4;i++) { byte out[4];R_ColorShiftLightingBytes((byte*)inputs[i],out);printf("C %d %d %d %d\n",out[0],out[1],out[2],out[3]); }
    }
    drawVert_t verts[12];
    point(&verts[0],0,0,0);point(&verts[1],1,0,0);point(&verts[2],2,0,0);point(&verts[3],0,1,0);point(&verts[4],1,1,0);point(&verts[5],2,1,0);point(&verts[6],0,2,0);point(&verts[7],1,2,0);point(&verts[8],2,2,0);
    srfGridMesh_t grid={3,3,verts};
    printf("M %d %d\n",R_MergedWidthPoints(&grid,0),R_MergedHeightPoints(&grid,0));
    point(&verts[2],1.05f,0,0);point(&verts[6],0,1.05f,0);
    printf("M %d %d\n",R_MergedWidthPoints(&grid,0),R_MergedHeightPoints(&grid,0));
    return 0;
}
