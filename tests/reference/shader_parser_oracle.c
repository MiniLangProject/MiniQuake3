/* Host for unchanged shader token-to-enum functions from tr_shader.c. */
#define _CRT_SECURE_NO_WARNINGS
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../../Quake-III-Arena-original-source/code/game/q_shared.h"
#define GLS_SRCBLEND_ZERO 0x1
#define GLS_SRCBLEND_ONE 0x2
#define GLS_SRCBLEND_DST_COLOR 0x3
#define GLS_SRCBLEND_ONE_MINUS_DST_COLOR 0x4
#define GLS_SRCBLEND_SRC_ALPHA 0x5
#define GLS_SRCBLEND_ONE_MINUS_SRC_ALPHA 0x6
#define GLS_SRCBLEND_DST_ALPHA 0x7
#define GLS_SRCBLEND_ONE_MINUS_DST_ALPHA 0x8
#define GLS_SRCBLEND_ALPHA_SATURATE 0x9
#define GLS_DSTBLEND_ZERO 0x10
#define GLS_DSTBLEND_ONE 0x20
#define GLS_DSTBLEND_SRC_COLOR 0x30
#define GLS_DSTBLEND_ONE_MINUS_SRC_COLOR 0x40
#define GLS_DSTBLEND_SRC_ALPHA 0x50
#define GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA 0x60
#define GLS_DSTBLEND_DST_ALPHA 0x70
#define GLS_DSTBLEND_ONE_MINUS_DST_ALPHA 0x80
#define GLS_ATEST_GT_0 0x10000000
#define GLS_ATEST_LT_80 0x20000000
#define GLS_ATEST_GE_80 0x40000000
typedef enum {GF_NONE,GF_SIN,GF_SQUARE,GF_TRIANGLE,GF_SAWTOOTH,GF_INVERSE_SAWTOOTH,GF_NOISE} genFunc_t;
static struct {char name[64];} shader={{0}};
static void quiet(int level,const char *format,...){(void)level;(void)format;}
static struct {void (*Printf)(int,const char *,...);} ri={quiet};
void QDECL Com_Error(int level,const char *fmt,...){(void)level;(void)fmt;exit(72);}
void QDECL Com_Printf(const char *fmt,...){(void)fmt;}
#include "shader_parser_under_test.inc"
int main(void){
 const char *af[]={"GT0","lt128","Ge128","invalid"};
 const char *src[]={"GL_ONE","GL_ZERO","GL_DST_COLOR","GL_ONE_MINUS_DST_COLOR","GL_SRC_ALPHA","GL_ONE_MINUS_SRC_ALPHA","GL_DST_ALPHA","GL_ONE_MINUS_DST_ALPHA","GL_SRC_ALPHA_SATURATE","invalid"};
 const char *dst[]={"GL_ONE","GL_ZERO","GL_SRC_ALPHA","GL_ONE_MINUS_SRC_ALPHA","GL_DST_ALPHA","GL_ONE_MINUS_DST_ALPHA","GL_SRC_COLOR","GL_ONE_MINUS_SRC_COLOR","invalid"};
 const char *gen[]={"sin","SQUARE","triangle","sawtooth","inverseSawTooth","noise","invalid"};int i;
 for(i=0;i<4;i++)printf("A|%s|%u\n",af[i],NameToAFunc(af[i]));
 for(i=0;i<10;i++)printf("S|%s|%d\n",src[i],NameToSrcBlendMode(src[i]));
 for(i=0;i<9;i++)printf("D|%s|%d\n",dst[i],NameToDstBlendMode(dst[i]));
 for(i=0;i<7;i++)printf("G|%s|%d\n",gen[i],(int)NameToGenFunc(gen[i]));
 return 0;
}
