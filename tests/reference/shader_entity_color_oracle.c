/* Host for unchanged Baseq3 entity color/alpha generators. */
#include <stdio.h>
#include <string.h>
typedef struct { unsigned char shaderRGBA[4]; } refEntity_t;
typedef struct { refEntity_t e; } trRefEntity_t;
typedef struct { trRefEntity_t *currentEntity; } backEndState_t;
typedef struct { int numVertexes; } shaderCommands_t;
static backEndState_t backEnd;
static shaderCommands_t tess;
#include "shader_entity_color_under_test.inc"
static void print_colors(const char *name,const unsigned char *colors) {
  int i;printf("%s",name);for(i=0;i<tess.numVertexes;i++)printf("|%u,%u,%u,%u",colors[i*4],colors[i*4+1],colors[i*4+2],colors[i*4+3]);putchar('\n');
}
static void reset(unsigned char *colors) {
  static const unsigned char seed[12]={3,7,11,15,19,23,29,31,37,41,43,47};memcpy(colors,seed,sizeof(seed));
}
int main(void) {
  trRefEntity_t entity;unsigned char colors[12];entity.e.shaderRGBA[0]=17;entity.e.shaderRGBA[1]=63;entity.e.shaderRGBA[2]=129;entity.e.shaderRGBA[3]=201;backEnd.currentEntity=&entity;tess.numVertexes=3;
  reset(colors);RB_CalcColorFromEntity(colors);print_colors("entity",colors);
  reset(colors);RB_CalcColorFromOneMinusEntity(colors);print_colors("inverse",colors);
  reset(colors);RB_CalcAlphaFromEntity(colors);print_colors("alpha",colors);
  reset(colors);RB_CalcAlphaFromOneMinusEntity(colors);print_colors("inverse-alpha",colors);
  return 0;
}
