// GPL-2.0-or-later. Reduced state oracle for BotUpdateEntityItems in be_ai_goal.c.
#include <stdio.h>
#include <math.h>
typedef struct { int number,iteminfo,flags,entitynum; float origin[3],timeout; } levelitem_t;
typedef struct { int valid,type,modelindex; float origin[3],lastvisorigin[3]; } entityinfo_t;
static int same(const float *a,const float *b){return a[0]==b[0]&&a[1]==b[1]&&a[2]==b[2];}
static float distance(const float *a,const float *b){float x=a[0]-b[0],y=a[1]-b[1],z=a[2]-b[2];return sqrtf(x*x+y*y+z*z);}
int main(void){
  levelitem_t base={1,0,1,0,{10,20,30},0}; entityinfo_t ent={1,2,5,{11,20,30},{11,20,30}};
  int blocked=(base.flags&1)!=0; printf("free=%d ",blocked?0:distance(base.origin,ent.origin)<30);
  blocked=0; if(!blocked&&distance(base.origin,ent.origin)<30) base.entitynum=4; printf("team=%d ",base.entitynum);
  ent.modelindex=6; if(base.entitynum==4&&ent.modelindex!=5) base.entitynum=-1; printf("reuse=%d ",base.entitynum);
  float timeout=35.0f; printf("equal=%d expired=%d\n",timeout<35.0f,timeout<35.1f);
  return 0;
}
