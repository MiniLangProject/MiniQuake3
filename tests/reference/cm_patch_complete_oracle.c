/* Direct differential for unchanged static and public cm_patch.c kernels. */
#include <stdint.h>

/* Expose the original file-local helpers only inside this oracle TU. */
#define static
#include "../../Quake-III-Arena-original-source/code/qcommon/cm_patch.c"
#undef static

cvar_t *cm_playerCurveClip;

static unsigned bits(float value) { unsigned out; memcpy(&out,&value,4); return out; }
static void point(vec3_t value,float x,float y,float z) { value[0]=x;value[1]=y;value[2]=z; }

int main(void) {
    vec3_t a,b,c,o1,o2,o3,normal;float made[4],candidate[4],enter=-1,leave=1;int flipped,hit,index,x,y,equal1,equal2,flip1,flip2;cGrid_t grid;patchCollide_t *patch;vec3_t source[9];
    point(a,0,0,0);point(b,1,0,0);point(c,0,1,0);
    printf("sign=%d\n",CM_SignbitsForNormal((vec3_t){-1,2,-3}));
    printf("plane=%d",CM_PlaneFromPoints(made,a,b,c));for(index=0;index<4;index++)printf(",%u",bits(made[index]));printf("\n");
    printf("needs=%d,%d\n",CM_NeedsSubdivision((vec3_t){0,0,0},(vec3_t){0,100,0},(vec3_t){0,0,0}),CM_NeedsSubdivision((vec3_t){0,0,0},(vec3_t){0,1,0},(vec3_t){0,2,0}));
    CM_Subdivide((vec3_t){0,0,0},(vec3_t){2,4,6},(vec3_t){4,8,12},o1,o2,o3);printf("sub");for(index=0;index<3;index++)printf(",%u",bits(o1[index]));for(index=0;index<3;index++)printf(",%u",bits(o2[index]));for(index=0;index<3;index++)printf(",%u",bits(o3[index]));printf("\n");
    printf("compare=%d,%d\n",CM_ComparePoints((vec3_t){1,2,3},(vec3_t){1.09f,1.91f,3.09f}),CM_ComparePoints((vec3_t){1,2,3},(vec3_t){1.11f,2,3}));
    point(normal,.00001f,.99999f,.00002f);CM_SnapVector(normal);printf("snap=%u,%u,%u\n",bits(normal[0]),bits(normal[1]),bits(normal[2]));
    numPlanes=0;index=CM_FindPlane(a,b,c);printf("find=%d,%d,%d,%d\n",index,numPlanes,CM_PointOnPlaneSide((vec3_t){0,0,1},index),CM_PointOnPlaneSide((vec3_t){0,0,-1},index));
    Vector4Copy(planes[index].plane,candidate);equal1=CM_PlaneEqual(&planes[index],candidate,&flipped);flip1=flipped;VectorNegate(candidate,candidate);candidate[3]=-planes[index].plane[3];equal2=CM_PlaneEqual(&planes[index],candidate,&flipped);flip2=flipped;printf("equal=%d,%d,%d,%d\n",equal1,flip1,equal2,flip2);
    memset(&grid,0,sizeof(grid));grid.width=3;grid.height=3;for(x=0;x<3;x++)for(y=0;y<3;y++)point(grid.points[x][y],(float)(x*8-8),(float)(y*8-8),0);CM_SetGridWrapWidth(&grid);CM_SubdivideGridColumns(&grid);CM_RemoveDegenerateColumns(&grid);CM_TransposeGrid(&grid);CM_SetGridWrapWidth(&grid);CM_SubdivideGridColumns(&grid);CM_RemoveDegenerateColumns(&grid);printf("grid=%d,%d,%d,%d",grid.width,grid.height,grid.wrapWidth,grid.wrapHeight);for(x=0;x<grid.width;x++)for(y=0;y<grid.height;y++)for(index=0;index<3;index++)printf(",%u",bits(grid.points[x][y][index]));printf("\n");
    for(y=0;y<3;y++)for(x=0;x<3;x++)point(source[y*3+x],(float)(x*8-8),(float)(y*8-8),0);patch=CM_GeneratePatchCollide(3,3,source);printf("generate=%d,%d",patch->numPlanes,patch->numFacets);for(x=0;x<2;x++)for(y=0;y<3;y++)printf(",%u",bits(patch->bounds[x][y]));printf("\n");
    candidate[0]=0;candidate[1]=0;candidate[2]=1;candidate[3]=0;printf("check=%d",CM_CheckFacetPlane(candidate,(vec3_t){0,0,1},(vec3_t){0,0,-1},&enter,&leave,&hit));printf(",%u,%u,%d\n",bits(enter),bits(leave),hit);
    debugPatchCollide=patch;debugFacet=patch->facets;CM_ClearLevelPatches();printf("clear=%d,%d\n",debugPatchCollide==NULL,debugFacet==NULL);
    return 0;
}
