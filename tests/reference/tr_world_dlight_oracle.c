/* Focused host for unchanged Baseq3 tr_world.c dlight surface functions. */
#include <stdio.h>
typedef float vec3_t[3];
typedef struct { vec3_t normal; float dist; } cplane_t;
typedef struct { vec3_t origin; float radius; } dlight_t;
typedef struct { cplane_t plane; int dlightBits[2]; } srfSurfaceFace_t;
typedef struct { vec3_t meshBounds[2]; int dlightBits[2]; } srfGridMesh_t;
typedef struct { int dlightBits[2]; } srfTriangles_t;
typedef struct { struct { int num_dlights; dlight_t *dlights; } refdef; struct { int c_dlightSurfacesCulled; } pc; int smpFrame; } trGlobals_t;
static trGlobals_t tr;
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#include "tr_world_dlight_under_test.inc"
int main(void) {
  int bits;
  dlight_t lights[3]={{{0,0,0},4},{{8,0,0},2},{{0,0,6},1}};
  srfSurfaceFace_t face={{{1,0,0},0},{0,0}};
  srfGridMesh_t grid={{{-2,-2,-2},{2,2,2}},{0,0}};
  srfTriangles_t tris={{0,0}};
  tr.refdef.num_dlights=3;tr.refdef.dlights=lights;tr.smpFrame=1;
  bits=R_DlightFace(&face,7);printf("face|%d,%d,%d\n",bits,face.dlightBits[1],tr.pc.c_dlightSurfacesCulled);
  bits=R_DlightGrid(&grid,7);printf("grid|%d,%d,%d\n",bits,grid.dlightBits[1],tr.pc.c_dlightSurfacesCulled);
  bits=R_DlightGrid(&grid,2);printf("none|%d,%d,%d\n",bits,grid.dlightBits[1],tr.pc.c_dlightSurfacesCulled);
  bits=R_DlightTrisurf(&tris,5);printf("tris|%d,%d\n",bits,tris.dlightBits[1]);
  return 0;
}
