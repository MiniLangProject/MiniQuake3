#include <stdio.h>
#include <stdlib.h>
#include <math.h>
typedef float vec3_t[3];typedef int qboolean;
typedef struct{int frametime;}cg_t;cg_t cg={16};
#define qtrue 1
#define qfalse 0
static float AngleMod(float a){return (360.0f/65536)*(((int)(a*(65536/360.0f)))&65535);}
static float AngleSubtract(float a1,float a2){float a=a1-a2;while(a>180)a-=360;while(a<-180)a+=360;return a;}
#define VectorClear(a) ((a)[0]=(a)[1]=(a)[2]=0)
#define VectorSet(a,b,c,d) ((a)[0]=(b),(a)[1]=(c),(a)[2]=(d))
#include "cgame_players_under_test.inc"
int main(void){const char*v[]={"0","1","2","3","4","5","6","7","8"};for(int i=0;i<9;i++){vec3_t c;CG_ColorFromString(v[i],c);printf("color|%s|%d|%d|%d\n",v[i],(int)c[0],(int)c[1],(int)c[2]);}float rows[][3]={{90,0,1},{10,0,0},{350,10,1}};for(int i=0;i<3;i++){float a=rows[i][1];qboolean s=(int)rows[i][2];CG_SwingAngles(rows[i][0],25,90,.3f,&a,&s);printf("swing|%d|%s\n",(int)(a*1000),s?"true":"false");}return 0;}
