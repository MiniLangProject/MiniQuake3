/* SPDX-License-Identifier: GPL-2.0-or-later */
#include <ctype.h>
#include <stdio.h>
#include <string.h>
typedef float vec3_t[3];
typedef struct { vec3_t origin; int area; vec3_t mins,maxs; int entity,number,flags,iteminfo; } goal_t;
typedef struct node_s { const char *name; vec3_t origin; int area; struct node_s *next; } node_t;
static int ci_equal(const char *a,const char *b){while(*a&&toupper((unsigned char)*a)==toupper((unsigned char)*b)){a++;b++;}return !*a&&!*b;}
static int location(node_t *head,const char *name,goal_t *g){for(;head;head=head->next)if(ci_equal(head->name,name)){memcpy(g->origin,head->origin,12);g->area=head->area;g->entity=0;for(int i=0;i<3;i++){g->mins[i]=-8;g->maxs[i]=8;}return 1;}return 0;}
static int camp(node_t *head,int num,goal_t *g){if(num<0)num=0;int i=num;for(;head;head=head->next)if(--i<0){memcpy(g->origin,head->origin,12);g->area=head->area;g->entity=0;for(int j=0;j<3;j++){g->mins[j]=-8;g->maxs[j]=8;}return num+1;}return 0;}
#define CHECK(v) do{observations++;if(!(v)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){int observations=0;node_t first={"Hall",{10,20,30},1,0},later={"Hall",{40,50,60},2,&first};goal_t g={{0},0,{0},{0},0,111,222,333};CHECK(location(&later,"hALL",&g)&&g.origin[0]==40&&g.area==2);CHECK(g.mins[0]==-8&&g.maxs[2]==8&&g.number==111&&g.flags==222&&g.iteminfo==333);CHECK(!location(&later,"missing",&g));node_t alpha={"Alpha",{1,2,3},1,0},beta={"Beta",{4,5,6},1,&alpha};CHECK(camp(&beta,-2,&g)==1&&g.origin[0]==4);CHECK(camp(&beta,1,&g)==2&&g.origin[0]==1);CHECK(camp(&beta,2,&g)==0);CHECK(sizeof(goal_t)==56);puts("PASS: 4 native Baseq3 map-goal scenarios / 7 exact observations");return 0;}
