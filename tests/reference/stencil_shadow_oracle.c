/* Host for unchanged Baseq3 R_AddEdgeDef, R_RenderShadowEdges and
 * RB_ShadowTessEnd. */
#include <math.h>
#include <stdio.h>
#include <string.h>

#define SHADER_MAX_VERTEXES 64
#define SHADER_MAX_INDEXES 192
#define GL_TRIANGLE_STRIP 0
#define GL_CULL_FACE 1
#define GL_STENCIL_TEST 2
#define GL_FRONT 3
#define GL_BACK 4
#define GL_KEEP 5
#define GL_INCR 6
#define GL_DECR 7
#define GL_ALWAYS 8
#define GL_NOTEQUAL 9
#define GL_CLIP_PLANE0 10
#define GL_QUADS 11
#define GL_FALSE 0
#define GL_TRUE 1
#define GLS_SRCBLEND_ONE 1
#define GLS_DSTBLEND_ZERO 2
#define GLS_DEPTHMASK_TRUE 4
#define GLS_SRCBLEND_DST_COLOR 8

typedef float vec3_t[3];
typedef float vec4_t[4];
typedef struct { vec4_t xyz[SHADER_MAX_VERTEXES]; int indexes[SHADER_MAX_INDEXES]; int numVertexes; int numIndexes; } shaderCommands_t;
typedef struct { vec3_t lightDir; } trRefEntity_t;
typedef struct { trRefEntity_t *currentEntity; struct { int isMirror; } viewParms; } backEndState_t;
typedef struct { int stencilBits; } glconfig_t;
typedef struct { void *whiteImage; } trGlobals_t;
typedef struct { int integer; } cvar_t;

static shaderCommands_t tess;
static backEndState_t backEnd;
static glconfig_t glConfig;
static trGlobals_t tr;
static vec3_t captured[1024];
static int capturedCount;
static cvar_t shadowCvar;
static cvar_t *r_shadows=&shadowCvar;
static float currentRed,currentGreen,currentBlue;
static float finishRed,finishGreen,finishBlue;
static int finishVertexCount;
typedef struct { int i2; int facing; } edgeDef_t;
#define MAX_EDGE_DEFS 32
static edgeDef_t edgeDefs[SHADER_MAX_VERTEXES][MAX_EDGE_DEFS];
static int numEdgeDefs[SHADER_MAX_VERTEXES];
static int facing[SHADER_MAX_INDEXES/3];

#define VectorCopy(a,b) do { (b)[0]=(a)[0]; (b)[1]=(a)[1]; (b)[2]=(a)[2]; } while (0)
#define VectorMA(v,s,b,o) do { (o)[0]=(v)[0]+(s)*(b)[0]; (o)[1]=(v)[1]+(s)*(b)[1]; (o)[2]=(v)[2]+(s)*(b)[2]; } while (0)
#define VectorSubtract(a,b,o) do { (o)[0]=(a)[0]-(b)[0]; (o)[1]=(a)[1]-(b)[1]; (o)[2]=(a)[2]-(b)[2]; } while (0)
#define CrossProduct(a,b,o) do { (o)[0]=(a)[1]*(b)[2]-(a)[2]*(b)[1]; (o)[1]=(a)[2]*(b)[0]-(a)[0]*(b)[2]; (o)[2]=(a)[0]*(b)[1]-(a)[1]*(b)[0]; } while (0)
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define Com_Memset memset

static void GL_Bind(void *image) { (void)image; }
static void GL_State(int state) { if(state==(GLS_DEPTHMASK_TRUE|GLS_SRCBLEND_DST_COLOR|GLS_DSTBLEND_ZERO)){finishRed=currentRed;finishGreen=currentGreen;finishBlue=currentBlue;} }
static void qglEnable(int value) { (void)value; }
static void qglDisable(int value) { (void)value; }
static void qglColor3f(float a,float b,float c) { currentRed=a;currentGreen=b;currentBlue=c; }
static void qglColor4f(float a,float b,float c,float d) { currentRed=a;currentGreen=b;currentBlue=c;(void)d; }
static void qglColorMask(int a,int b,int c,int d) { (void)a;(void)b;(void)c;(void)d; }
static void qglStencilFunc(int a,int b,int c) { (void)a;(void)b;(void)c; }
static void qglCullFace(int value) { (void)value; }
static void qglStencilOp(int a,int b,int c) { (void)a;(void)b;(void)c; }
static void qglBegin(int value) { (void)value; }
static void qglEnd(void) { }
static void qglLoadIdentity(void) { }
static void qglVertex3f(float a,float b,float c) { (void)a;(void)b;(void)c;++finishVertexCount; }
static void qglVertex3fv(const float *point) {
    VectorCopy(point,captured[capturedCount]);
    ++capturedCount;
}

#include "stencil_shadow_under_test.inc"

static long quantize(float value) { return lroundf(value * 1000.0f); }

static void run_case(const char *name,const float (*points)[3],int pointCount,
                     const int *indexes,int indexCount,const vec3_t light) {
    trRefEntity_t entity;
    int i;
    memset(&tess,0,sizeof(tess));
    memset(&entity,0,sizeof(entity));
    capturedCount=0;
    tess.numVertexes=pointCount;
    tess.numIndexes=indexCount;
    for(i=0;i<pointCount;++i) VectorCopy(points[i],tess.xyz[i]);
    for(i=0;i<indexCount;++i) tess.indexes[i]=indexes[i];
    VectorCopy(light,entity.lightDir);
    backEnd.currentEntity=&entity;
    backEnd.viewParms.isMirror=0;
    glConfig.stencilBits=8;
    RB_ShadowTessEnd();
    /* The original emits identical geometry for increment and decrement. */
    printf("%s|%d",name,capturedCount/8);
    for(i=0;i<capturedCount/2;++i) printf("|%ld,%ld,%ld",quantize(captured[i][0]),quantize(captured[i][1]),quantize(captured[i][2]));
    putchar('\n');
}

int main(void) {
    static const float square[4][3]={{0,0,0},{2,0,0},{2,2,0},{0,2,0}};
    static const int squareIndexes[6]={0,1,2,0,2,3};
    static const float triangle[3][3]={{-1,0,1},{3,0,1},{0,4,1}};
    static const int triangleIndexes[3]={0,1,2};
    const vec3_t vertical={0,0,1};
    const vec3_t diagonal={1,0,1};
    run_case("square",square,4,squareIndexes,6,vertical);
    run_case("triangle",triangle,3,triangleIndexes,3,diagonal);
    shadowCvar.integer=2;finishVertexCount=0;RB_ShadowFinish();
    printf("finish|%ld,%ld,%ld|%d\n",quantize(finishRed),quantize(finishGreen),quantize(finishBlue),finishVertexCount);
    return 0;
}
