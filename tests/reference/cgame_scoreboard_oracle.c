#include <stdio.h>
#include <string.h>
typedef int qboolean;typedef float vec4_t[4];
#define qtrue 1
#define GIANT_WIDTH 32
#define GIANT_HEIGHT 48
static int CG_DrawStrlen(const char *s){int n=0;while(*s){if(*s=='^'&&s[1]&&s[1]!='^')s+=2;else{s++;n++;}}return n;}
static void CG_DrawStringExt(float x,float y,const char *s,const float *c,qboolean shadow,qboolean force,int cw,int ch,int max){(void)shadow;(void)force;(void)max;printf("%.1f|%.1f|%s|%.1f,%.1f,%.1f,%.1f|%d|%d\n",x,y,s,c[0],c[1],c[2],c[3],cw,ch);}
#include "cgame_scoreboard_under_test.inc"
int main(void){CG_CenterGiantLine(8,"Scoreboard");CG_CenterGiantLine(64,"1:05");CG_CenterGiantLine(12,"^1RED^7 wins");return 0;}
