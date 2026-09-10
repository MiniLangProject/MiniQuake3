/* SPDX-License-Identifier: GPL-2.0-or-later
 * Direct oracle for unchanged Baseq3 BotAimAtEnemy statement blocks.
 * Engine calls are captured as inputs/outputs around the original arithmetic.
 */
#include <stdio.h>
#include <math.h>
#include <string.h>
typedef float vec3_t[3];
#define Square(x) ((x)*(x))
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorSubtract(a,b,c) do{(c)[0]=(a)[0]-(b)[0];(c)[1]=(a)[1]-(b)[1];(c)[2]=(a)[2]-(b)[2];}while(0)
#define VectorLengthSquared(v) ((v)[0]*(v)[0]+(v)[1]*(v)[1]+(v)[2]*(v)[2])
static float VectorNormalize(vec3_t v){float n=sqrtf(VectorLengthSquared(v));if(n){v[0]/=n;v[1]/=n;v[2]/=n;}return n;}
#define VectorMA(a,s,b,c) do{(c)[0]=(a)[0]+(s)*(b)[0];(c)[1]=(a)[1]+(s)*(b)[1];(c)[2]=(a)[2]+(s)*(b)[2];}while(0)
static int observations;
#define OBS(x) do{observations++;if(!(x)){fprintf(stderr,"failure line %d\n",__LINE__);return 1;}}while(0)
static void linear(vec3_t enemy,vec3_t last,float update,vec3_t bot,float projectile,vec3_t best){vec3_t dir;float dist,speed;VectorSubtract(enemy,bot,dir);dist=sqrtf(VectorLengthSquared(dir));VectorSubtract(enemy,last,dir);dir[2]=0;speed=VectorNormalize(dir)/update;VectorMA(enemy,(dist/projectile)*speed,dir,best);}
static int suppress(vec3_t best,vec3_t bot,vec3_t enemy,vec3_t remembered){vec3_t d;float dist;VectorSubtract(best,bot,d);dist=sqrtf(VectorLengthSquared(d));VectorSubtract(enemy,remembered,d);return dist>100&&VectorLengthSquared(d)<Square(32);}
static void ground(float enemyz,float floorz,int startsolid,vec3_t best,vec3_t target){VectorCopy(best,target);if(startsolid)target[2]=enemyz-16;else target[2]=floorz-8;}
static int accept_ground(vec3_t hit,vec3_t target,vec3_t start,float clear){vec3_t d;if(fabsf(hit[2]-target[2])>=50)return 0;VectorSubtract(hit,target,d);if(VectorLengthSquared(d)>=Square(60))return 0;VectorSubtract(hit,start,d);if(VectorLengthSquared(d)<=Square(100))return 0;return clear>=1;}
static int corner(vec3_t target,vec3_t eye,float skill,int weapon,vec3_t best){vec3_t d;if(skill<=.5f||!(weapon==9||weapon==5||weapon==4))return 0;VectorSubtract(target,eye,d);if(VectorLengthSquared(d)<=Square(80))return 0;VectorCopy(target,best);best[2]-=20;return 1;}
int main(void){vec3_t e={100,0,0},l={90,0,0},b={0,0,0},out;
 linear(e,l,.1f,b,100,out);OBS(fabsf(out[0]-200)<.001f);OBS(out[1]==0);OBS(out[2]==0);
 {vec3_t best={101,0,0},remembered={99,0,0};OBS(suppress(best,b,e,remembered));remembered[0]=60;OBS(!suppress(best,b,e,remembered));best[0]=100;remembered[0]=99;OBS(!suppress(best,b,e,remembered));}
 {vec3_t best={100,0,8},g;ground(0,-32,0,best,g);OBS(g[2]==-40);ground(0,-32,1,best,g);OBS(g[2]==-16);OBS(g[0]==100&&g[1]==0);}
 {vec3_t start={0,0,26},target={100,0,-40},hit={100,0,-40};OBS(accept_ground(hit,target,start,1));hit[2]=11;OBS(!accept_ground(hit,target,start,1));hit[0]=20;hit[2]=-40;OBS(!accept_ground(hit,target,start,1));hit[0]=100;OBS(!accept_ground(hit,target,start,0));}
 {vec3_t target={200,0,40},eye={0,0,26},best={100,0,8};OBS(corner(target,eye,.8f,5,best));OBS(best[0]==200&&best[2]==20);best[0]=100;best[2]=8;OBS(!corner(target,eye,.5f,5,best));OBS(!corner(target,eye,.8f,2,best));target[0]=20;target[2]=26;OBS(!corner(target,eye,.8f,5,best));}
 {vec3_t enemy={1,2,3},last={1,2,3};linear(enemy,last,.1f,b,900,out);OBS(out[0]==1&&out[1]==2&&out[2]==3);}
 if(observations!=19){fprintf(stderr,"count %d\n",observations);return 1;}printf("PASS: 6 native BotAimAtEnemy prediction scenarios / 19 exact observations\n");return 0;}
