/* Host for unchanged R_ClearFlares, RB_TestFlare and RB_RenderFlare. */
#include <stdio.h>
#include <string.h>
typedef int qboolean; typedef float vec3_t[3];
#define qtrue 1
#define qfalse 0
#define MAX_FLARES 128
#define Com_Memset memset
#define GL_DEPTH_COMPONENT 0x1902
#define GL_FLOAT 0x1406
typedef struct flare_s { struct flare_s *next; int addedFrame; qboolean inPortal; int frameSceneNum; void *surface; int fogNum; int fadeTime; qboolean visible; float drawIntensity; int windowX,windowY; float eyeZ; vec3_t color; } flare_t;
static flare_t r_flareStructs[MAX_FLARES],*r_activeFlares,*r_inactiveFlares;
typedef struct { int c_flareTests,c_flareRenders; } counters_t;
typedef struct { float projectionMatrix[16]; int viewportWidth; } view_t;
typedef struct { int time; } refdef_t;
static struct { counters_t pc; view_t viewParms; refdef_t refdef; } backEnd;
static struct { int finishCalled; } glState;
typedef struct { float value; } cvar_t; static cvar_t fadeCvar={7.f},sizeCvar={40.f}; static cvar_t *r_flareFade=&fadeCvar,*r_flareSize=&sizeCvar;
static float suppliedDepth;
static void qglReadPixels(int x,int y,int w,int h,int format,int type,void *out){(void)x;(void)y;(void)w;(void)h;(void)format;(void)type;*(float*)out=suppliedDepth;}
static void VectorScale(const float *a,float s,float *out){out[0]=a[0]*s;out[1]=a[1]*s;out[2]=a[2]*s;}
typedef struct { float xyz[16][4];float texCoords[16][2][2];unsigned char vertexColors[16][4];int indexes[32];int numVertexes,numIndexes; } tess_t;
static tess_t tess; static int shader;
static struct { float identityLight; void *flareShader; } tr={1.f,&shader};
static void RB_BeginSurface(void *s,int fog){(void)s;(void)fog;memset(&tess,0,sizeof(tess));}
static void RB_EndSurface(void){}
#include "tr_flares_complete_under_test.inc"
static int inactiveCount(void){int n=0;flare_t *f;for(f=r_inactiveFlares;f;f=f->next)n++;return n;}
int main(void){flare_t f;memset(&f,0,sizeof(f));memset(r_flareStructs,0xff,sizeof(r_flareStructs));r_activeFlares=&r_flareStructs[0];R_ClearFlares();printf("clear|%d|%d|%d,%d\n",r_activeFlares==0,inactiveCount(),(int)(r_inactiveFlares-r_flareStructs),(int)(r_inactiveFlares->next-r_flareStructs));
 backEnd.viewParms.projectionMatrix[14]=-2;backEnd.viewParms.projectionMatrix[11]=-1;backEnd.viewParms.projectionMatrix[10]=-1;backEnd.refdef.time=1000;f.eyeZ=-100;suppliedDepth=.99f;RB_TestFlare(&f);printf("visible|%d|%d|%d|%d\n",f.visible,f.fadeTime,(int)(f.drawIntensity*1000000),glState.finishCalled);
 backEnd.refdef.time=1200;suppliedDepth=.5f;RB_TestFlare(&f);printf("hidden|%d|%d|%d\n",f.visible,f.fadeTime,(int)(f.drawIntensity*1000000));
 memset(&f,0,sizeof(f));f.windowX=320;f.windowY=240;f.eyeZ=-100;f.drawIntensity=.5f;f.color[0]=.5f;f.color[1]=.25f;f.color[2]=1.f;f.fogNum=3;backEnd.viewParms.viewportWidth=640;RB_RenderFlare(&f);printf("render|%d|%d|%d,%d,%d|%d,%d|%d,%d,%d,%d,%d,%d\n",tess.numVertexes,tess.numIndexes,tess.vertexColors[0][0],tess.vertexColors[0][1],tess.vertexColors[0][2],(int)(tess.xyz[0][0]*10),(int)(tess.xyz[0][1]*10),tess.indexes[0],tess.indexes[1],tess.indexes[2],tess.indexes[3],tess.indexes[4],tess.indexes[5]);return 0;}
