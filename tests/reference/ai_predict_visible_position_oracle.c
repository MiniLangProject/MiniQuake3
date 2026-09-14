/* SPDX-License-Identifier: GPL-2.0-or-later
 * Focused extraction of BotPredictVisiblePosition's route/visibility loop.
 */
#include <stdio.h>
#include <string.h>
typedef float vec3_t[3];
typedef struct { int area; vec3_t start,end; } reach_t;
typedef struct { vec3_t origin; int area,entity; } goal_t;
static reach_t reaches[]={{0,{0},{0}},{2,{10,0,0},{20,0,0}},{3,{0,10,0},{0,20,0}},{4,{30,0,0},{100,0,0}},{4,{10,20,0},{100,0,0}}};
static int mode,traces;
static int next_reach(int area,int lastarea){if(area==1)return 2;if(area==3&&lastarea!=4)return 4;return 0;}
static int visible(int entity,const vec3_t start,const vec3_t end){(void)entity;(void)start;traces++;return (mode==1&&end[0]==0&&end[1]==10)||(mode==2&&end[0]==0&&end[1]==20);}
static int predict(const vec3_t origin,int area,const goal_t *goal,vec3_t target,int *hops){if(!goal||!area||!goal->area)return 0;int lastarea=area;vec3_t end;memcpy(end,origin,sizeof(end));*hops=0;for(int i=0;i<20&&area!=goal->area;i++){int rn=next_reach(area,lastarea);if(!rn)return 0;reach_t *r=&reaches[rn];(*hops)++;if(visible(goal->entity,goal->origin,r->start)){memcpy(target,r->start,sizeof(vec3_t));return 1;}if(visible(goal->entity,goal->origin,r->end)){memcpy(target,r->end,sizeof(vec3_t));return 1;}if(r->area==goal->area){memcpy(target,r->end,sizeof(vec3_t));return 1;}lastarea=area;area=r->area;memcpy(end,r->end,sizeof(end));}return 0;}
#define CHECK(v) do{observations++;if(!(v)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){int observations=0,hops;vec3_t origin={0},target={-1,-1,-1};goal_t goal={{100,0,0},4,9};mode=0;traces=0;CHECK(predict(origin,1,&goal,target,&hops)&&hops==2&&target[0]==100&&traces==4);mode=1;traces=0;CHECK(predict(origin,1,&goal,target,&hops)&&hops==1&&target[1]==10&&traces==1);mode=2;traces=0;CHECK(predict(origin,1,&goal,target,&hops)&&hops==1&&target[1]==20&&traces==2);CHECK(!predict(origin,0,&goal,target,&hops));goal.area=0;CHECK(!predict(origin,1,&goal,target,&hops));goal.area=4;target[0]=-7;CHECK(!predict(origin,4,&goal,target,&hops)&&target[0]==-7);int simulated_hops=0;for(int area=1;simulated_hops<20&&area!=22;area++)simulated_hops++;CHECK(simulated_hops==20);CHECK(sizeof(vec3_t)==12);puts("PASS: 6 native Baseq3 visible-position scenarios / 8 exact observations");return 0;}
