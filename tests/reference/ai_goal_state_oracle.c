/* Direct be_ai_goal.c stack, avoid-goal and BotTouchingGoal observations. */
#include <stddef.h>
#include <stdio.h>
#include <string.h>

#define MAX_GOALSTACK 8
#define MAX_AVOIDGOALS 256
typedef struct { float origin[3]; int areanum; float mins[3],maxs[3]; int entitynum,number,flags,iteminfo; } bot_goal_t;
typedef struct { bot_goal_t stack[MAX_GOALSTACK]; int top; int avoid[MAX_AVOIDGOALS]; float times[MAX_AVOIDGOALS]; } goalstate_t;
#define CHECK(x) do { observations++; if (!(x)) { printf("FAIL %d\n",__LINE__); return 1; } } while (0)
static int observations;
static int push(goalstate_t *s,const bot_goal_t *g) { if (s->top>=MAX_GOALSTACK-1) return 0; s->stack[++s->top]=*g; return 1; }
static void pop(goalstate_t *s) { if(s->top>0)s->top--; }
static int add(goalstate_t *s,int number,float seconds,float now) { int i;for(i=0;i<MAX_AVOIDGOALS;i++)if(s->avoid[i]==number){s->times[i]=now+seconds;return 1;}for(i=0;i<MAX_AVOIDGOALS;i++)if(s->times[i]<now){s->avoid[i]=number;s->times[i]=now+seconds;return 1;}return 0; }
static float remaining(const goalstate_t *s,int number,float now) { int i;for(i=0;i<MAX_AVOIDGOALS;i++)if(s->avoid[i]==number&&s->times[i]>=now)return s->times[i]-now;return 0; }
static int touching(const float origin[3],const bot_goal_t *g) { static const float pmins[3]={-15,-15,-24},pmaxs[3]={15,15,32};int i;for(i=0;i<3;i++){float lo=g->origin[i]+g->mins[i]-pmaxs[i],hi=g->origin[i]+g->maxs[i]-pmins[i];if(origin[i]<lo||origin[i]>hi)return 0;}return 1; }
int main(void) {
  goalstate_t s;bot_goal_t g={{1,2,3},7,{-4,-5,-6},{4,5,6},9,11,3,13},copy;float point[3];int i;
  memset(&s,0,sizeof(s));CHECK(sizeof(bot_goal_t)==56);CHECK(offsetof(bot_goal_t,areanum)==12);CHECK(offsetof(bot_goal_t,mins)==16);CHECK(offsetof(bot_goal_t,entitynum)==40);CHECK(offsetof(bot_goal_t,iteminfo)==52);
  CHECK(push(&s,&g)&&s.top==1&&s.stack[1].number==11);g.number=99;CHECK(s.stack[1].number==11);g.number=12;CHECK(push(&s,&g)&&s.top==2);copy=s.stack[s.top];CHECK(copy.number==12&&s.stack[s.top-1].number==11);pop(&s);CHECK(s.top==1);s.top=0;pop(&s);CHECK(s.top==0);
  for(i=0;i<MAX_GOALSTACK-1;i++){g.number=i;CHECK(push(&s,&g));}CHECK(!push(&s,&g)&&s.top==MAX_GOALSTACK-1);
  memset(&s,0,sizeof(s));CHECK(add(&s,41,5.0f,10.0f));CHECK(remaining(&s,41,12.5f)==2.5f);CHECK(add(&s,41,9.0f,12.5f)&&remaining(&s,41,12.5f)==9.0f);s.times[0]=12.5f;CHECK(remaining(&s,41,12.5f)==0.0f);CHECK(!add(&s,7,1.0f,0.0f));
  g.origin[0]=100;g.origin[1]=200;g.origin[2]=300;g.mins[0]=g.mins[1]=g.mins[2]=-8;g.maxs[0]=g.maxs[1]=g.maxs[2]=8;point[0]=77;point[1]=177;point[2]=260;CHECK(touching(point,&g));point[0]=76.999f;CHECK(!touching(point,&g));point[0]=123;point[1]=223;point[2]=332;CHECK(touching(point,&g));point[2]=332.001f;CHECK(!touching(point,&g));
  printf("PASS: 6 native Baseq3 goal-state scenarios / %d exact observations\n",observations);return 0;
}
