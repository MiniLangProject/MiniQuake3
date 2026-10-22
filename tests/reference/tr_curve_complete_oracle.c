/* Host for unchanged tr_curve vertex/grid transforms. */
#include <math.h>
#include <stdio.h>
#include <string.h>
#define MAX_GRID_SIZE 65
#define Com_Memcpy memcpy
typedef unsigned char byte;
typedef float vec3_t[3];
typedef struct { float xyz[3],st[2],lightmap[2],normal[3]; byte color[4]; } drawVert_t;
#include "tr_curve_complete_under_test.inc"
static void setv(drawVert_t *v,int x,int y,int z,int c){memset(v,0,sizeof(*v));v->xyz[0]=(float)x;v->xyz[1]=(float)y;v->xyz[2]=(float)z;v->st[0]=x*.1f;v->st[1]=y*.1f;v->lightmap[0]=x*.2f;v->lightmap[1]=y*.2f;v->color[0]=(byte)c;v->color[1]=(byte)(c+1);v->color[2]=(byte)(c+2);v->color[3]=255;}
static void emitv(const char *name,const drawVert_t *v){printf("%s|%d,%d,%d|%d,%d|%u,%u,%u,%u\n",name,(int)(v->xyz[0]*100),(int)(v->xyz[1]*100),(int)(v->xyz[2]*100),(int)(v->st[0]*1000),(int)(v->st[1]*1000),v->color[0],v->color[1],v->color[2],v->color[3]);}
int main(void){drawVert_t a,b,o,ctrl[MAX_GRID_SIZE][MAX_GRID_SIZE];float e[2][MAX_GRID_SIZE];int r,c;memset(ctrl,0,sizeof(ctrl));memset(e,0,sizeof(e));
 setv(&a,0,2,4,10);setv(&b,2,4,6,20);LerpDrawVert(&a,&b,&o);emitv("lerp",&o);
 for(r=0;r<2;r++)for(c=0;c<3;c++)setv(&ctrl[r][c],c+10*r,r,0,1);Transpose(3,2,ctrl);printf("transpose|%d,%d,%d,%d,%d,%d\n",(int)ctrl[0][0].xyz[0],(int)ctrl[0][1].xyz[0],(int)ctrl[1][0].xyz[0],(int)ctrl[1][1].xyz[0],(int)ctrl[2][0].xyz[0],(int)ctrl[2][1].xyz[0]);
 memset(ctrl,0,sizeof(ctrl));for(r=0;r<2;r++)for(c=0;c<3;c++)setv(&ctrl[r][c],c+10*r,r,0,1);InvertCtrl(3,2,ctrl);printf("invert|%d,%d,%d|%d,%d,%d\n",(int)ctrl[0][0].xyz[0],(int)ctrl[0][1].xyz[0],(int)ctrl[0][2].xyz[0],(int)ctrl[1][0].xyz[0],(int)ctrl[1][1].xyz[0],(int)ctrl[1][2].xyz[0]);
 e[0][0]=1;e[0][1]=2;e[0][2]=3;e[1][0]=10;e[1][1]=20;e[1][2]=30;e[1][3]=40;InvertErrorTable(e,3,4);printf("errors|%d,%d,%d,%d|%d,%d,%d\n",(int)e[0][0],(int)e[0][1],(int)e[0][2],(int)e[0][3],(int)e[1][0],(int)e[1][1],(int)e[1][2]);
 memset(ctrl,0,sizeof(ctrl));for(r=0;r<3;r++)for(c=0;c<3;c++)setv(&ctrl[r][c],c*2,r*2,(r==1&&c==1)?8:0,10+r*3+c);PutPointsOnCurve(ctrl,3,3);emitv("curve",&ctrl[1][1]);return 0;}
