/* Host for unchanged RB_SurfaceBeam from renderer/tr_surface.c. */
#include <math.h>
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef float vec_t;typedef float vec3_t[3];typedef float vec_t_matrix[3][3];
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#define CrossProduct(a,b,o) ((o)[0]=(a)[1]*(b)[2]-(a)[2]*(b)[1],(o)[1]=(a)[2]*(b)[0]-(a)[0]*(b)[2],(o)[2]=(a)[0]*(b)[1]-(a)[1]*(b)[0])
#define VectorCopy(a,b) ((b)[0]=(a)[0],(b)[1]=(a)[1],(b)[2]=(a)[2])
#define VectorScale(a,s,o) ((o)[0]=(a)[0]*(s),(o)[1]=(a)[1]*(s),(o)[2]=(a)[2]*(s))
#define VectorAdd(a,b,o) ((o)[0]=(a)[0]+(b)[0],(o)[1]=(a)[1]+(b)[1],(o)[2]=(a)[2]+(b)[2])
#define M_PI 3.14159265358979323846f
#define DEG2RAD(a) (((a)*M_PI)/180.0F)
#define Q_fabs(a) fabsf(a)
#include "surface_beam_math_under_test.inc"
typedef struct { vec3_t origin,oldorigin; } refEntity_t;
typedef struct { refEntity_t e; } trRefEntity_t;
typedef struct { trRefEntity_t *currentEntity; } backEndState_t;
typedef struct { void *whiteImage; } trGlobals_t;
static backEndState_t backEnd;static trGlobals_t tr;static vec3_t captured[32];static int capturedCount;
static void captureVertex(const float *v){VectorCopy(v,captured[capturedCount]);capturedCount++;}
#define qglVertex3fv captureVertex
#define qglBegin(x) ((void)0)
#define qglEnd() ((void)0)
#define qglColor3f(r,g,b) ((void)0)
#define GL_Bind(x) ((void)0)
#define GL_State(x) ((void)0)
#define GL_TRIANGLE_STRIP 5
#define GLS_SRCBLEND_ONE 1
#define GLS_DSTBLEND_ONE 2
#include "surface_beam_under_test.inc"
static uint32_t bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static void run(const char *name,const vec3_t origin,const vec3_t oldorigin){trRefEntity_t entity;int i;memset(&entity,0,sizeof(entity));VectorCopy(origin,entity.e.origin);VectorCopy(oldorigin,entity.e.oldorigin);backEnd.currentEntity=&entity;capturedCount=0;RB_SurfaceBeam();printf("%s|V%d",name,capturedCount);for(i=0;i<capturedCount;i++)printf("|%08x,%08x,%08x",bits(captured[i][0]),bits(captured[i][1]),bits(captured[i][2]));putchar('\n');}
int main(void){vec3_t a={10,-4,2},b={34,8,14},same={1,2,3};run("diagonal",a,b);run("zero",same,same);return 0;}
