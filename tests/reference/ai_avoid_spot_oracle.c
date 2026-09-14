/* SPDX-License-Identifier: GPL-2.0-or-later
 * Direct BotAddAvoidSpot oracle from code/botlib/be_ai_move.c.
 */
#include <stdio.h>
#include <string.h>
#define MAX_AVOIDSPOTS 32
#define AVOID_CLEAR 0
typedef float vec3_t[3];
typedef struct { vec3_t origin; float radius; int type; } bot_avoidspot_t;
typedef struct { bot_avoidspot_t avoidspots[MAX_AVOIDSPOTS]; int numavoidspots; } bot_movestate_t;
static void add(bot_movestate_t *ms,const vec3_t origin,float radius,int type) {
 int i;if(!ms)return;if(type==AVOID_CLEAR){ms->numavoidspots=0;return;}if(ms->numavoidspots>=MAX_AVOIDSPOTS)return;
 for(i=0;i<3;i++)ms->avoidspots[ms->numavoidspots].origin[i]=origin[i];
 ms->avoidspots[ms->numavoidspots].radius=radius;ms->avoidspots[ms->numavoidspots].type=type;ms->numavoidspots++;
}
#define CHECK(v) do { observations++; if(!(v)){printf("FAIL %d\n",__LINE__);return 1;} } while(0)
int main(void) {
 bot_movestate_t ms;vec3_t a={1.25f,-2.5f,3.75f},b={7,8,9},overflow={999,999,999};int observations=0;memset(&ms,0,sizeof(ms));
 add(&ms,a,160.5f,1);CHECK(ms.numavoidspots==1);CHECK(memcmp(ms.avoidspots[0].origin,a,sizeof(a))==0);CHECK(ms.avoidspots[0].radius==160.5f&&ms.avoidspots[0].type==1);
 add(&ms,b,9.0f,2);CHECK(ms.numavoidspots==2&&ms.avoidspots[1].type==2);
 add(&ms,overflow,0,AVOID_CLEAR);CHECK(ms.numavoidspots==0);CHECK(ms.avoidspots[0].origin[0]==1.25f&&ms.avoidspots[0].radius==160.5f);
 add(&ms,b,32.0f,37);CHECK(ms.numavoidspots==1&&ms.avoidspots[0].type==37);
 for(int i=1;i<MAX_AVOIDSPOTS;i++){vec3_t v={(float)i,0,0};add(&ms,v,(float)i,1);}CHECK(ms.numavoidspots==MAX_AVOIDSPOTS);
 bot_avoidspot_t last=ms.avoidspots[MAX_AVOIDSPOTS-1];add(&ms,overflow,999,2);CHECK(ms.numavoidspots==MAX_AVOIDSPOTS);CHECK(memcmp(&last,&ms.avoidspots[MAX_AVOIDSPOTS-1],sizeof(last))==0);
 add(NULL,a,1,1);CHECK(MAX_AVOIDSPOTS==32&&sizeof(bot_avoidspot_t)==20);
 printf("PASS: 5 native BotAddAvoidSpot scenarios / %d exact observations\n",observations);return 0;
}
