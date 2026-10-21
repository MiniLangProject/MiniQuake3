/* Host for unchanged Baseq3 RB_ProjectionShadowDeform. */
#include <math.h>
#include <stdio.h>
#include <string.h>

typedef float vec3_t[3];
typedef float vec4_t[4];
typedef struct { float shadowPlane; } refEntity_t;
typedef struct { refEntity_t e; vec3_t lightDir; } trRefEntity_t;
typedef struct { vec3_t origin; vec3_t axis[3]; } orientation_t;
typedef struct { vec4_t xyz[8]; int numVertexes; } shaderCommands_t;
typedef struct { orientation_t or; trRefEntity_t *currentEntity; } backEndState_t;

static shaderCommands_t tess;
static backEndState_t backEnd;

#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define VectorCopy(a,b) do { (b)[0]=(a)[0]; (b)[1]=(a)[1]; (b)[2]=(a)[2]; } while (0)
#define VectorMA(v,s,b,o) do { (o)[0]=(v)[0]+(s)*(b)[0]; (o)[1]=(v)[1]+(s)*(b)[1]; (o)[2]=(v)[2]+(s)*(b)[2]; } while (0)

#include "projection_shadow_under_test.inc"

static long quantize(float value) { return lroundf(value * 10000.0f); }

static void run_case(const char *name, const vec3_t point, float plane,
                     const vec3_t worldLight, const vec3_t origin,
                     const vec3_t axis0, const vec3_t axis1, const vec3_t axis2) {
    trRefEntity_t entity;
    vec3_t world;
    memset(&tess, 0, sizeof(tess));
    memset(&entity, 0, sizeof(entity));
    tess.numVertexes = 1;
    VectorCopy(point, tess.xyz[0]);
    entity.e.shadowPlane = plane;
    VectorCopy(origin, backEnd.or.origin);
    VectorCopy(axis0, backEnd.or.axis[0]);
    VectorCopy(axis1, backEnd.or.axis[1]);
    VectorCopy(axis2, backEnd.or.axis[2]);
    entity.lightDir[0] = DotProduct(worldLight, axis0);
    entity.lightDir[1] = DotProduct(worldLight, axis1);
    entity.lightDir[2] = DotProduct(worldLight, axis2);
    backEnd.currentEntity = &entity;
    RB_ProjectionShadowDeform();
    world[0] = origin[0] + tess.xyz[0][0]*axis0[0] + tess.xyz[0][1]*axis1[0] + tess.xyz[0][2]*axis2[0];
    world[1] = origin[1] + tess.xyz[0][0]*axis0[1] + tess.xyz[0][1]*axis1[1] + tess.xyz[0][2]*axis2[1];
    world[2] = origin[2] + tess.xyz[0][0]*axis0[2] + tess.xyz[0][1]*axis1[2] + tess.xyz[0][2]*axis2[2];
    printf("%s|%ld,%ld,%ld\n", name, quantize(world[0]), quantize(world[1]), quantize(world[2]));
}

int main(void) {
    const vec3_t zero={0,0,0}, origin={10,20,30};
    const vec3_t x={1,0,0}, y={0,1,0}, z={0,0,1};
    const vec3_t point={2,1,4}, vertical={0,0,1}, shallow={1,0,.1f};
    const vec3_t yaw0={0,1,0}, yaw1={-1,0,0}, yaw2={0,0,1};
    const vec3_t diagonal={.2f,.3f,.9327379f};
    const vec3_t tilt0={1,0,0}, tilt1={0,.70710677f,.70710677f}, tilt2={0,-.70710677f,.70710677f};
    const vec3_t scaled0={2,0,0}, scaled1={0,1.5f,0}, scaled2={0,0,.5f};
    run_case("identity",point,1,vertical,zero,x,y,z);
    run_case("shallow",point,1,shallow,zero,x,y,z);
    run_case("yaw",point,25,diagonal,origin,yaw0,yaw1,yaw2);
    run_case("tilt",point,25,diagonal,origin,tilt0,tilt1,tilt2);
    run_case("scaled",point,25,diagonal,origin,scaled0,scaled1,scaled2);
    return 0;
}
