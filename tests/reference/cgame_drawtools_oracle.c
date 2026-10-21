#include <stdint.h>
#include <stdio.h>
#include <string.h>
typedef int qboolean;
typedef float vec4_t[4];
#define TEAM_RED 1
#define TEAM_BLUE 2
#define TEAM_SPECTATOR 3
#define FADE_TIME 200
#define ARMOR_PROTECTION 0.66
#define UI_SMALLFONT 0x10
#define Q_IsColorString(p) ((p)[0]=='^' && (p)[1] && (p)[1]!='^')
#define VectorClear(v) ((v)[0]=(v)[1]=(v)[2]=0)
typedef struct { float screenXScale,screenYScale; } cgs_t;
typedef struct { int time; } cg_t;
static cgs_t cgs;
static cg_t cg;
#include "cgame_drawtools_under_test.inc"
static uint32_t bits(float value){union{float f;uint32_t u;}v;v.f=value;return v.u;}
static void four(const char *name,const float *v){printf("%s|%u|%u|%u|%u\n",name,bits(v[0]),bits(v[1]),bits(v[2]),bits(v[3]));}
int main(void){
  float x,y,w,h;vec4_t color;float *value;
  cgs.screenXScale=1.5f;cgs.screenYScale=2.0f;x=3.25f;y=-2.0f;w=10.0f;h=11.5f;CG_AdjustFrom640(&x,&y,&w,&h);color[0]=x;color[1]=y;color[2]=w;color[3]=h;four("adjust",color);
  printf("strlen|%d|%d|%d\n",CG_DrawStrlen("A^1B^^C"),CG_DrawStrlen("^7hello"),CG_DrawStrlen("plain"));
  cg.time=1000;value=CG_FadeColor(850,300);four("fade-active",value);printf("fade-null|%d|%d\n",CG_FadeColor(0,300)==NULL,CG_FadeColor(700,300)==NULL);
  four("team-red",CG_TeamColor(TEAM_RED));four("team-blue",CG_TeamColor(TEAM_BLUE));four("team-spec",CG_TeamColor(TEAM_SPECTATOR));four("team-other",CG_TeamColor(99));
  CG_GetColorForHealth(0,100,color);four("health-dead",color);CG_GetColorForHealth(20,0,color);four("health-low",color);CG_GetColorForHealth(50,0,color);four("health-mid",color);CG_GetColorForHealth(66,0,color);four("health-66",color);CG_GetColorForHealth(40,100,color);four("health-armor",color);CG_GetColorForHealth(100,0,color);four("health-full",color);
  printf("scale|%u|%u\n",bits(UI_ProportionalSizeScale(0)),bits(UI_ProportionalSizeScale(UI_SMALLFONT)));
  return 0;
}
