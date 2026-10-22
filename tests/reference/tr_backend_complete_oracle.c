/* Host for unchanged GL_Cull, GL_TexEnv, RB_Hyperspace,
 * SetViewportAndScissor and RB_SetColor from renderer/tr_backend.c. */
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
typedef int qboolean; typedef unsigned int GLenum; typedef unsigned char byte;
#define qtrue 1
#define GL_CULL_FACE 0x0B44
#define GL_FRONT 0x0404
#define GL_BACK 0x0405
#define GL_TEXTURE_ENV 0x2300
#define GL_TEXTURE_ENV_MODE 0x2200
#define GL_MODULATE 0x2100
#define GL_REPLACE 0x1E01
#define GL_DECAL 0x2101
#define GL_ADD 0x0104
#define GL_COLOR_BUFFER_BIT 0x4000
#define GL_PROJECTION 0x1701
#define GL_MODELVIEW 0x1700
#define ERR_DROP 1
enum { CT_FRONT_SIDED, CT_BACK_SIDED, CT_TWO_SIDED };
typedef struct { int commandId; float color[4]; } setColorCommand_t;
typedef struct { float projectionMatrix[16]; int viewportX,viewportY,viewportWidth,viewportHeight; int isMirror; } viewParms_t;
typedef struct { int time; } refdef_t;
typedef struct { viewParms_t viewParms; refdef_t refdef; int isHyperspace; byte color2D[4]; } backEndState_t;
typedef struct { int faceCulling,currenttmu,texEnv[2]; } glstate_t;
static backEndState_t backEnd; static glstate_t glState;
static int enabled,disabled,cullFace,texEnv,clearBits,matrixMode,viewport[4],scissorBox[4]; static float clearColor[4],loaded[16];
static void qglEnable(int x){enabled=x;} static void qglDisable(int x){disabled=x;}
static void qglCullFace(int x){cullFace=x;} static void qglTexEnvf(int a,int b,float c){(void)a;(void)b;texEnv=(int)c;}
static void qglClearColor(float r,float g,float b,float a){clearColor[0]=r;clearColor[1]=g;clearColor[2]=b;clearColor[3]=a;}
static void qglClear(int bits){clearBits=bits;} static void qglMatrixMode(int mode){matrixMode=mode;}
static void qglLoadMatrixf(const float *m){memcpy(loaded,m,sizeof(loaded));}
static void qglViewport(int x,int y,int w,int h){viewport[0]=x;viewport[1]=y;viewport[2]=w;viewport[3]=h;}
static void qglScissor(int x,int y,int w,int h){scissorBox[0]=x;scissorBox[1]=y;scissorBox[2]=w;scissorBox[3]=h;}
static void drop(int level,const char *fmt,...){(void)level;(void)fmt;}
static struct { void (*Error)(int,const char *,...); } ri={drop};
#include "tr_backend_complete_under_test.inc"
int main(void){
  int i; setColorCommand_t color={1,{.5f,.25f,.75f,1.f}};
  glState.faceCulling=-1;backEnd.viewParms.isMirror=0;GL_Cull(CT_BACK_SIDED);printf("cullBack|%d|%d|%d\n",glState.faceCulling,enabled,cullFace);
  backEnd.viewParms.isMirror=1;GL_Cull(CT_FRONT_SIDED);printf("cullMirror|%d|%d\n",glState.faceCulling,cullFace);
  GL_Cull(CT_TWO_SIDED);printf("cullTwo|%d|%d\n",glState.faceCulling,disabled);
  glState.currenttmu=1;glState.texEnv[1]=0;GL_TexEnv(GL_ADD);printf("texEnv|%d|%d\n",glState.texEnv[1],texEnv);
  backEnd.refdef.time=128;RB_Hyperspace();printf("hyper|%d|%d|%d\n",(int)(clearColor[0]*1000000.f),clearBits,backEnd.isHyperspace);
  for(i=0;i<16;i++)backEnd.viewParms.projectionMatrix[i]=(float)(i+1);backEnd.viewParms.viewportX=3;backEnd.viewParms.viewportY=4;backEnd.viewParms.viewportWidth=640;backEnd.viewParms.viewportHeight=360;SetViewportAndScissor();
  printf("viewport|%d,%d,%d,%d|%d,%d,%d,%d|%.0f|%d\n",viewport[0],viewport[1],viewport[2],viewport[3],scissorBox[0],scissorBox[1],scissorBox[2],scissorBox[3],loaded[15],matrixMode);
  RB_SetColor(&color);printf("color|%u,%u,%u,%u\n",backEnd.color2D[0],backEnd.color2D[1],backEnd.color2D[2],backEnd.color2D[3]);return 0;
}
