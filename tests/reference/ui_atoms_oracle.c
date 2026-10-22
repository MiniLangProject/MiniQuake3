#include <stdio.h>
#define PROP_GAP_WIDTH 3
#define PROP_SMALL_SIZE_SCALE 0.75f
#define PROP_SPACE_WIDTH 8
#define UI_SMALLFONT 16
typedef int qboolean; typedef float vec4_t[4];
#define qtrue 1
#define qfalse 0
typedef struct { float scale,bias; int cursorx,cursory; } uiStatic_t;
static uiStatic_t uis;
static int propMap[128][3];
#include "ui_atoms_under_test.inc"
int main(void){
 int widths[128]={-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,8,7,14,17,18,23,18,7,8,9,18,18,7,11,6,14,17,12,17,18,19,18,18,16,17,18,7,7,14,14,14,18,22,18,18,18,17,13,13,18,17,8,16,18,12,23,18,18,18,18,17,18,14,18,19,29,18,18,14,7,13,7,17,21,5,18,18,18,17,13,13,18,17,8,16,18,12,23,18,18,18,18,17,18,14,18,19,29,18,18,14,13,5,13,17,-1};for(int i=0;i<128;i++)propMap[i][2]=widths[i];
 printf("clamp|%d|%d|%d\n",(int)UI_ClampCvar(1,5,-2),(int)UI_ClampCvar(1,5,7),(int)UI_ClampCvar(1,5,3));vec4_t a={-1,.2f,2,.5f},b={1,1,0,2},c;UI_LerpColor(a,b,c,.5f);printf("lerp|%d|%d|%d|%d\n",(int)(c[0]*1000),(int)(c[1]*1000),(int)(c[2]*1000),(int)(c[3]*1000));printf("width|%d|%d|%d\n",UI_ProportionalStringWidth(""),UI_ProportionalStringWidth("ABC"),UI_ProportionalStringWidth("A Z!"));printf("scale|%d|%d\n",(int)(UI_ProportionalSizeScale(0)*100),(int)(UI_ProportionalSizeScale(UI_SMALLFONT)*100));uis.scale=2;uis.bias=10;float x=1,y=2,w=3,h=4;UI_AdjustFrom640(&x,&y,&w,&h);printf("adjust|%d|%d|%d|%d\n",(int)x,(int)y,(int)w,(int)h);uis.cursorx=10;uis.cursory=20;printf("cursor|%d|%d|%d\n",UI_CursorInRect(10,20,0,0),UI_CursorInRect(0,0,10,20),UI_CursorInRect(11,20,5,5));return 0;
}
