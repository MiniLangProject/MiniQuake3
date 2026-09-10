/* Host for unchanged GL_Bind, GL_SelectTexture and GL_BindMultitexture. */
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned int GLuint;
typedef struct image_s { int texnum; int frameUsed; } image_t;
typedef struct { int currenttextures[2]; int currenttmu; } glstate_t;
static glstate_t glState;
static struct { image_t *defaultImage; image_t *dlightImage; int frameCount; } tr;
static struct { int integer; } noBindValue;
static struct { int integer; } *r_nobind=&noBindValue;
#define PRINT_WARNING 1
#define ERR_DROP 2
#define GL_TEXTURE_2D 3553
#define GL_TEXTURE0_ARB 33984
#define GL_TEXTURE1_ARB 33985

static void hostPrintf(int level,const char *format,...) { (void)level;(void)format;printf("W|null\n"); }
static void hostError(int level,const char *format,...) { (void)level;(void)format;exit(72); }
static struct { void (*Printf)(int,const char *,...);void (*Error)(int,const char *,...); } ri={hostPrintf,hostError};
static void qglBindTexture(int target,int texnum) { printf("B|%d|%d\n",target,texnum); }
static void qglActiveTextureARB(int unit) { printf("A|%d\n",unit); }
static void qglClientActiveTextureARB(int unit) { printf("C|%d\n",unit); }
static void GLimp_LogComment(const char *message) { (void)message; }

#include "texture_state_under_test.inc"

static void state(const char *name,image_t *a,image_t *b,image_t *c) {
  printf("S|%s|%d|%d|%d|%d|%d|%d\n",name,glState.currenttmu,glState.currenttextures[0],glState.currenttextures[1],a->frameUsed,b->frameUsed,c->frameUsed);
}
int main(void) {
  image_t fallback={90,0},dlight={77,0},a={11,0},b={22,0},c={33,0};
  tr.defaultImage=&fallback;tr.dlightImage=&dlight;tr.frameCount=5;
  GL_Bind(&a);state("bind-a",&a,&b,&c);
  tr.frameCount=6;GL_Bind(&a);state("cached-a",&a,&b,&c);
  GL_SelectTexture(1);GL_Bind(&b);state("unit1-b",&a,&b,&c);
  tr.frameCount=7;GL_BindMultitexture(&a,7681,&c,7681);state("multi",&a,&b,&c);
  tr.frameCount=8;r_nobind->integer=1;GL_Bind(&b);state("nobind",&a,&b,&c);
  tr.frameCount=9;GL_Bind(&a);state("cached-nobind",&a,&b,&c);
  tr.frameCount=10;GL_BindMultitexture(&a,7681,&b,7681);state("multi-nobind",&a,&b,&c);
  r_nobind->integer=0;glState.currenttextures[0]=90;GL_Bind(NULL);state("null-cached",&a,&b,&c);
  return 0;
}
