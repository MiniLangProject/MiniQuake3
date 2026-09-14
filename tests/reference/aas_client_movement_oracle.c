/* SPDX-License-Identifier: GPL-2.0-or-later
 * Direct numerical/layout oracle extracted from code/botlib/be_aas_move.c.
 */
#include <math.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
typedef float vec3_t[3];
typedef struct aas_trace_s { int startsolid; float fraction; vec3_t endpos; int ent,lastarea,area,planenum; } aas_trace_t;
typedef struct aas_clientmove_s { vec3_t endpos; int endarea; vec3_t velocity; aas_trace_t trace; int presencetype,stopevent,endcontents; float time; int frames; } aas_clientmove_t;
#define CHECK(x) do { if (!(x)) { printf("FAIL %d\n",__LINE__); return 1; } } while (0)
static void accelerate(vec3_t velocity,float frametime,const vec3_t wishdir,float wishspeed,float accel) {
 float current=velocity[0]*wishdir[0]+velocity[1]*wishdir[1]+velocity[2]*wishdir[2];float add=wishspeed-current;if(add<=0)return;float amount=accel*frametime*wishspeed;if(amount>add)amount=add;for(int i=0;i<3;i++)velocity[i]+=amount*wishdir[i];
}
static void friction(vec3_t vel,float value,float stopspeed,float frametime) {
 float speed=sqrtf(vel[0]*vel[0]+vel[1]*vel[1]);if(speed){float control=speed<stopspeed?stopspeed:speed;float next=speed-frametime*control*value;if(next<0)next=0;next/=speed;vel[0]*=next;vel[1]*=next;}
}
static int clip_bbox(aas_trace_t *trace,const vec3_t start,const vec3_t end,const vec3_t mins,const vec3_t maxs) {
 const vec3_t player_mins={-15,-15,-24},player_maxs={15,15,32};vec3_t amin,amax,dir,mid;for(int i=0;i<3;i++){amin[i]=mins[i]-player_maxs[i];amax[i]=maxs[i]-player_mins[i];dir[i]=end[i]-start[i];trace->endpos[i]=end[i];if(start[i]<amin[i]&&end[i]<amin[i])return 0;if(start[i]>amax[i]&&end[i]>amax[i])return 0;}trace->fraction=1;
 for(int i=0;i<3;i++){float plane=dir[i]>0?amin[i]:amax[i];float front=start[i]-plane,back=end[i]-plane;if(front==back)continue;float fraction=front/(front-back);int side=(i+1)%3;mid[side]=start[side]+dir[side]*fraction;if(mid[side]>amin[side]&&mid[side]<amax[side]){side=(side+1)%3;mid[side]=start[side]+dir[side]*fraction;if(mid[side]>amin[side]&&mid[side]<amax[side]){trace->fraction=fraction;for(int j=0;j<3;j++)trace->endpos[j]=start[j]+dir[j]*fraction;return 1;}}}return 0;
}
int main(void) {
 CHECK(sizeof(aas_trace_t)==36&&offsetof(aas_trace_t,endpos)==8&&offsetof(aas_trace_t,planenum)==32);
 CHECK(sizeof(aas_clientmove_t)==84&&offsetof(aas_clientmove_t,trace)==28&&offsetof(aas_clientmove_t,presencetype)==64&&offsetof(aas_clientmove_t,time)==76&&offsetof(aas_clientmove_t,frames)==80);
 vec3_t velocity={200,0,0};friction(velocity,6,100,.1f);CHECK(velocity[0]==80&&velocity[1]==0);
 vec3_t stopped={20,0,0};friction(stopped,6,100,.1f);CHECK(stopped[0]==0);
 vec3_t accel={0,0,0},wish={1,0,0};accelerate(accel,.1f,wish,320,10);CHECK(accel[0]==320&&accel[1]==0&&accel[2]==0);
 vec3_t partial={300,0,0};accelerate(partial,.1f,wish,320,10);CHECK(partial[0]==320);
 aas_trace_t trace;memset(&trace,0,sizeof(trace));vec3_t start={0,0,24},end={60,0,24},mins={55,-20,0},maxs={75,20,64};CHECK(clip_bbox(&trace,start,end,mins,maxs));CHECK(fabsf(trace.fraction-0.666666687f)<1e-7f&&trace.endpos[0]==40&&trace.endpos[1]==0&&trace.endpos[2]==24);
 float frame_z=0*.1f-(800*.1f*.1f);CHECK(frame_z==-8.0f);float jump_z=270*.1f-(800*.1f*.1f)+5;CHECK(jump_z==24.0f);
 printf("PASS: 5 native Baseq3 AAS movement scenarios / 17 exact observations\n");return 0;
}
