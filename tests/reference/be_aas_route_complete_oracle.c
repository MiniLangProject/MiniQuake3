#include <math.h>
#include <stdio.h>
#include <string.h>
#define qfalse 0
#define qtrue 1
#define MAX_TRAVELTYPES 32
#define TRAVELTYPE_MASK 0xffffff
#define TRAVELFLAG_NOTTEAM1 0x01000000
#define TRAVELFLAG_NOTTEAM2 0x02000000
#define TRAVEL_INVALID 1
#define TRAVEL_WALK 2
#define TRAVEL_CROUCH 3
#define TRAVEL_BARRIERJUMP 4
#define TRAVEL_JUMP 5
#define TRAVEL_LADDER 6
#define TRAVEL_WALKOFFLEDGE 7
#define TRAVEL_SWIM 8
#define TRAVEL_WATERJUMP 9
#define TRAVEL_TELEPORT 10
#define TRAVEL_ELEVATOR 11
#define TRAVEL_ROCKETJUMP 12
#define TRAVEL_BFGJUMP 13
#define TRAVEL_GRAPPLEHOOK 14
#define TRAVEL_DOUBLEJUMP 15
#define TRAVEL_RAMPJUMP 16
#define TRAVEL_STRAFEJUMP 17
#define TRAVEL_JUMPPAD 18
#define TRAVEL_FUNCBOB 19
#define TFL_INVALID 0x00000001
#define TFL_WALK 0x00000002
#define TFL_CROUCH 0x00000004
#define TFL_BARRIERJUMP 0x00000008
#define TFL_JUMP 0x00000010
#define TFL_LADDER 0x00000020
#define TFL_WALKOFFLEDGE 0x00000080
#define TFL_SWIM 0x00000100
#define TFL_WATERJUMP 0x00000200
#define TFL_TELEPORT 0x00000400
#define TFL_ELEVATOR 0x00000800
#define TFL_ROCKETJUMP 0x00001000
#define TFL_BFGJUMP 0x00002000
#define TFL_GRAPPLEHOOK 0x00004000
#define TFL_DOUBLEJUMP 0x00008000
#define TFL_RAMPJUMP 0x00010000
#define TFL_STRAFEJUMP 0x00020000
#define TFL_JUMPPAD 0x00040000
#define TFL_AIR 0x00080000
#define TFL_WATER 0x00100000
#define TFL_SLIME 0x00200000
#define TFL_LAVA 0x00400000
#define TFL_DONOTENTER 0x00800000
#define TFL_FUNCBOB 0x01000000
#define TFL_BRIDGE 0x04000000
#define TFL_NOTTEAM1 0x08000000
#define TFL_NOTTEAM2 0x10000000
#define AREACONTENTS_WATER 1
#define AREACONTENTS_LAVA 2
#define AREACONTENTS_SLIME 4
#define AREACONTENTS_DONOTENTER 256
#define AREACONTENTS_NOTTEAM1 2048
#define AREACONTENTS_NOTTEAM2 4096
#define AREA_BRIDGE 16
#define DISTANCEFACTOR_CROUCH 1.3f
#define DISTANCEFACTOR_SWIM 1.0f
#define DISTANCEFACTOR_WALK 0.33f
typedef float vec3_t[3];
typedef struct { int contents, areaflags, presencetype, cluster, clusterareanum, numreachableareas, firstreachablearea; } aas_areasettings_t;
static struct { int travelflagfortype[MAX_TRAVELTYPES]; aas_areasettings_t areasettings[4]; } aasworld;
#define VectorSubtract(a,b,c) do {(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];} while (0)
static float VectorLength(const vec3_t value) { return sqrtf(value[0]*value[0]+value[1]*value[1]+value[2]*value[2]); }
static int AAS_AreaCrouch(int area) { return area==1; }
static int AAS_AreaSwim(int area) { return area==2; }
static void AAS_ProjectPointOntoVector(const vec3_t p,const vec3_t a,const vec3_t b,vec3_t out) { vec3_t d;float den,t;VectorSubtract(b,a,d);den=d[0]*d[0]+d[1]*d[1]+d[2]*d[2];t=den?((p[0]-a[0])*d[0]+(p[1]-a[1])*d[1]+(p[2]-a[2])*d[2])/den:0;out[0]=a[0]+t*d[0];out[1]=a[1]+t*d[1];out[2]=a[2]+t*d[2]; }
#include "be_aas_route_complete_under_test.inc"
int main(void) {
  vec3_t a={0,0,0},b={10,0,0},p={5,3,0},q={3,4,0};
  AAS_InitTravelFlagFromType();
  printf("flags=%d,%d,%d,%d\n",AAS_TravelFlagForType(TRAVEL_WALK),AAS_TravelFlagForType(TRAVEL_ROCKETJUMP),AAS_TravelFlagForType(99),AAS_TravelFlagForType_inline(TRAVEL_FUNCBOB));
  aasworld.areasettings[0].contents=0;
  aasworld.areasettings[1].contents=AREACONTENTS_WATER|AREACONTENTS_DONOTENTER|AREACONTENTS_NOTTEAM1;aasworld.areasettings[1].areaflags=AREA_BRIDGE;
  aasworld.areasettings[2].contents=AREACONTENTS_SLIME;
  aasworld.areasettings[3].contents=AREACONTENTS_LAVA|AREACONTENTS_NOTTEAM2;
  printf("contents=%d,%d,%d,%d\n",AAS_GetAreaContentsTravelFlags(0),AAS_GetAreaContentsTravelFlags(1),AAS_GetAreaContentsTravelFlags(2),AAS_GetAreaContentsTravelFlags(3));
  printf("time=%u,%u,%u\n",AAS_AreaTravelTime(0,a,q),AAS_AreaTravelTime(1,a,q),AAS_AreaTravelTime(2,a,q));
  printf("stub=%d,%d\n",AAS_BridgeWalkable(1),AAS_AreaVisible(1,2));
  printf("line=%.6g\n",DistancePointToLine(a,b,p));
  return 0;
}
