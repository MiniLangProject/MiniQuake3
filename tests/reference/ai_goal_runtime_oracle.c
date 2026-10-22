/* BotTouchingGoal copied from be_ai_goal.c with only engine vector helpers
 * and the normal-presence box supplied by this standalone harness. */
#include <stdio.h>
typedef float vec3_t[3];
typedef struct { vec3_t origin; int areanum; vec3_t mins,maxs; int entitynum,number,flags,iteminfo; } bot_goal_t;
#define qfalse 0
#define qtrue 1
#define PRESENCE_NORMAL 1
#define VectorSubtract(a,b,c) do { for(int vi=0;vi<3;vi++) (c)[vi]=(a)[vi]-(b)[vi]; } while(0)
#define VectorAdd(a,b,c) do { for(int vi=0;vi<3;vi++) (c)[vi]=(a)[vi]+(b)[vi]; } while(0)
static void AAS_PresenceTypeBoundingBox(int p,vec3_t mins,vec3_t maxs) { (void)p; mins[0]=mins[1]=-15;mins[2]=-24;maxs[0]=maxs[1]=15;maxs[2]=32; }
int BotTouchingGoal(vec3_t origin, bot_goal_t *goal)
{
	int i;
	vec3_t boxmins, boxmaxs;
	vec3_t absmins, absmaxs;
	vec3_t safety_maxs = {0, 0, 0};
	vec3_t safety_mins = {0, 0, 0};
	AAS_PresenceTypeBoundingBox(PRESENCE_NORMAL, boxmins, boxmaxs);
	VectorSubtract(goal->mins, boxmaxs, absmins);
	VectorSubtract(goal->maxs, boxmins, absmaxs);
	VectorAdd(absmins, goal->origin, absmins);
	VectorAdd(absmaxs, goal->origin, absmaxs);
	VectorSubtract(absmaxs, safety_maxs, absmaxs);
	VectorSubtract(absmins, safety_mins, absmins);
	for (i = 0; i < 3; i++)
	{
		if (origin[i] < absmins[i] || origin[i] > absmaxs[i]) return qfalse;
	}
	return qtrue;
}
int main(void) {
  bot_goal_t g={{10,20,30},1,{-2,-3,-4},{2,3,4},0,7,0,0};
  vec3_t p0={10,20,30},p1={-7,20,30},p2={27,20,30},p3={10,0,30},p4={10,20,60};
  printf("TOUCH %d %d %d %d %d\n",BotTouchingGoal(p0,&g),BotTouchingGoal(p1,&g),BotTouchingGoal(p2,&g),BotTouchingGoal(p3,&g),BotTouchingGoal(p4,&g));return 0;
}
