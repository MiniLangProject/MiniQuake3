/* Host for unchanged Baseq3 ComputeColors stage ordering. */
#include <math.h>
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
typedef float vec3_t[3];
typedef float vec4_t[4];
typedef byte color4ub_t[4];
typedef enum { AGEN_IDENTITY,AGEN_SKIP,AGEN_ENTITY,AGEN_ONE_MINUS_ENTITY,AGEN_VERTEX,AGEN_ONE_MINUS_VERTEX,AGEN_LIGHTING_SPECULAR,AGEN_WAVEFORM,AGEN_PORTAL,AGEN_CONST } alphaGen_t;
typedef enum { CGEN_BAD,CGEN_IDENTITY_LIGHTING,CGEN_IDENTITY,CGEN_ENTITY,CGEN_ONE_MINUS_ENTITY,CGEN_EXACT_VERTEX,CGEN_VERTEX,CGEN_ONE_MINUS_VERTEX,CGEN_WAVEFORM,CGEN_LIGHTING_DIFFUSE,CGEN_FOG,CGEN_CONST } colorGen_t;
typedef enum { ACFF_NONE,ACFF_MODULATE_RGB,ACFF_MODULATE_ALPHA,ACFF_MODULATE_RGBA } adjustColorsForFog_t;
typedef struct { int func;float base,amplitude,phase,frequency; } waveForm_t;
typedef struct { waveForm_t rgbWave;colorGen_t rgbGen;waveForm_t alphaWave;alphaGen_t alphaGen;byte constantColor[4];adjustColorsForFog_t adjustColorsForFog; } shaderStage_t;
typedef struct { int colorInt; } fog_t;
typedef struct { fog_t fogs[1]; } world_t;
typedef struct { float portalRange; } shader_t;
typedef struct { color4ub_t colors[8]; } stageVars_t;
typedef struct { vec4_t xyz[8];color4ub_t vertexColors[8];stageVars_t svars;shader_t *shader;int fogNum,numVertexes; } shaderCommands_t;
typedef struct { float identityLight;int identityLightByte;world_t *world; } trGlobals_t;
typedef struct { vec3_t origin; } orientation_t;
typedef struct { orientation_t or; } viewParms_t;
typedef struct { viewParms_t viewParms; } backEndState_t;
static shaderCommands_t tess;static trGlobals_t tr;static backEndState_t backEnd;static byte entityColor[4];
#define Com_Memset memset
#define Com_Memcpy memcpy
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
static float VectorLength(const vec3_t value){return sqrtf(value[0]*value[0]+value[1]*value[1]+value[2]*value[2]);}
static void RB_CalcDiffuseColor(unsigned char *colors){int i;for(i=0;i<tess.numVertexes;i++){colors[i*4]=tess.vertexColors[i][0];colors[i*4+1]=tess.vertexColors[i][1];colors[i*4+2]=tess.vertexColors[i][2];colors[i*4+3]=255;}}
static void RB_CalcWaveColor(const waveForm_t *wave,unsigned char *colors){int i,v=(int)(255.0f*wave->base*tr.identityLight);for(i=0;i<tess.numVertexes;i++){colors[i*4]=colors[i*4+1]=colors[i*4+2]=(byte)v;colors[i*4+3]=255;}}
static void RB_CalcColorFromEntity(unsigned char *colors){int i;for(i=0;i<tess.numVertexes;i++)memcpy(colors+i*4,entityColor,4);}
static void RB_CalcColorFromOneMinusEntity(unsigned char *colors){int i,j;for(i=0;i<tess.numVertexes;i++)for(j=0;j<4;j++)colors[i*4+j]=(byte)(255-entityColor[j]);}
static void RB_CalcWaveAlpha(const waveForm_t *wave,unsigned char *colors){int i,v=(int)(255.0f*wave->base);for(i=0;i<tess.numVertexes;i++)colors[i*4+3]=(byte)v;}
static void RB_CalcSpecularAlpha(unsigned char *colors){int i;for(i=0;i<tess.numVertexes;i++)colors[i*4+3]=88;}
static void RB_CalcAlphaFromEntity(unsigned char *colors){int i;for(i=0;i<tess.numVertexes;i++)colors[i*4+3]=entityColor[3];}
static void RB_CalcAlphaFromOneMinusEntity(unsigned char *colors){int i;for(i=0;i<tess.numVertexes;i++)colors[i*4+3]=(byte)(255-entityColor[3]);}
static void RB_CalcModulateColorsByFog(unsigned char *colors){(void)colors;}
static void RB_CalcModulateAlphasByFog(unsigned char *colors){(void)colors;}
static void RB_CalcModulateRGBAsByFog(unsigned char *colors){(void)colors;}
#include "shader_compute_colors_under_test.inc"
static void reset(float identity){static shader_t shader={128.0f};static world_t world;memset(&tess,0,sizeof(tess));tess.numVertexes=1;tess.shader=&shader;tess.vertexColors[0][0]=8;tess.vertexColors[0][1]=16;tess.vertexColors[0][2]=32;tess.vertexColors[0][3]=64;tess.xyz[0][0]=64.0f;tr.identityLight=identity;tr.identityLightByte=(int)(255.0f*identity);tr.world=&world;entityColor[0]=17;entityColor[1]=63;entityColor[2]=129;entityColor[3]=201;}
static void run(const char *name,colorGen_t rgb,alphaGen_t alpha,float identity){shaderStage_t stage;memset(&stage,0,sizeof(stage));reset(identity);stage.rgbGen=rgb;stage.alphaGen=alpha;stage.constantColor[0]=20;stage.constantColor[1]=40;stage.constantColor[2]=60;stage.constantColor[3]=80;stage.rgbWave.base=.25f;stage.alphaWave.base=.5f;ComputeColors(&stage);printf("%s|%u,%u,%u,%u\n",name,tess.svars.colors[0][0],tess.svars.colors[0][1],tess.svars.colors[0][2],tess.svars.colors[0][3]);}
int main(void){
  run("identity",CGEN_IDENTITY,AGEN_IDENTITY,1.0f);run("identity-light",CGEN_IDENTITY_LIGHTING,AGEN_IDENTITY,.5f);
  run("entity-identity",CGEN_ENTITY,AGEN_IDENTITY,1.0f);run("inverse-identity",CGEN_ONE_MINUS_ENTITY,AGEN_IDENTITY,1.0f);run("entity-alpha",CGEN_ENTITY,AGEN_ENTITY,1.0f);
  run("const-identity",CGEN_CONST,AGEN_IDENTITY,1.0f);run("const-alpha",CGEN_CONST,AGEN_CONST,1.0f);
  run("vertex-full",CGEN_VERTEX,AGEN_IDENTITY,1.0f);run("vertex-half",CGEN_VERTEX,AGEN_IDENTITY,.5f);run("inverse-vertex",CGEN_ONE_MINUS_VERTEX,AGEN_VERTEX,.5f);
  run("exact-identity",CGEN_EXACT_VERTEX,AGEN_IDENTITY,1.0f);run("diffuse-entity",CGEN_LIGHTING_DIFFUSE,AGEN_ENTITY,1.0f);
  run("wave-alpha",CGEN_WAVEFORM,AGEN_WAVEFORM,.5f);run("portal",CGEN_IDENTITY,AGEN_PORTAL,1.0f);run("specular",CGEN_IDENTITY,AGEN_LIGHTING_SPECULAR,1.0f);return 0;
}
