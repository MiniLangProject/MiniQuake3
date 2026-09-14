/* Direct lifecycle oracle for id's be_ai_chat/goal/move/weap.c rules. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_CLIENTS 64
#define MAX_GOALSTACK 8
#define MAX_AVOIDGOALS 256
#define MAX_AVOIDREACH 1
#define MAX_AVOIDSPOTS 32
typedef struct { float origin[3]; int area; float mins[3],maxs[3]; int entity,number,flags,item; } goal_t;
typedef struct { void *weights,*index; int client,lastarea; goal_t stack[MAX_GOALSTACK]; int top; int avoid[MAX_AVOIDGOALS]; float times[MAX_AVOIDGOALS]; } goalstate_t;
typedef struct { float origin[3],radius; int type; } avoidspot_t;
typedef struct { float origin[3],velocity[3],viewoffset[3]; int entity,client; float think; int presence; float angles[3]; int area,lastarea,lastgoal,lastreach; float lastorigin[3]; int reacharea,flags,jump; float grapple,grappledist,reachtime; int avoid[MAX_AVOIDREACH]; float times[MAX_AVOIDREACH]; int tries[MAX_AVOIDREACH]; avoidspot_t spots[MAX_AVOIDSPOTS]; int numspots; } movestate_t;
typedef struct { void *weights,*index; } weaponstate_t;
static void *chat[MAX_CLIENTS+1]; static goalstate_t *goal[MAX_CLIENTS+1]; static movestate_t *move[MAX_CLIENTS+1]; static weaponstate_t *weapon[MAX_CLIENTS+1];
static int slot(void **p){int i;for(i=1;i<=MAX_CLIENTS;i++)if(!p[i])return i;return 0;}
static int alloc_chat(void){int i=slot(chat);if(i)chat[i]=calloc(1,1);return i;}
static int alloc_goal(int client){int i=slot((void**)goal);if(i){goal[i]=calloc(1,sizeof(*goal[i]));goal[i]->client=client;}return i;}
static int alloc_move(void){int i=slot((void**)move);if(i)move[i]=calloc(1,sizeof(*move[i]));return i;}
static int alloc_weapon(void){int i=slot((void**)weapon);if(i)weapon[i]=calloc(1,sizeof(*weapon[i]));return i;}
static void reset_goal(int h){if(!goal[h])return;memset(goal[h]->stack,0,sizeof(goal[h]->stack));goal[h]->top=0;memset(goal[h]->avoid,0,sizeof(goal[h]->avoid));memset(goal[h]->times,0,sizeof(goal[h]->times));}
static void reset_avoid(movestate_t *m){memset(m->avoid,0,sizeof(m->avoid));memset(m->times,0,sizeof(m->times));memset(m->tries,0,sizeof(m->tries));}
static void reset_move(int h){if(move[h])memset(move[h],0,sizeof(*move[h]));}
static void reset_weapon(int h){void *w,*i;if(!weapon[h])return;w=weapon[h]->weights;i=weapon[h]->index;/* original memset is commented out */weapon[h]->weights=w;weapon[h]->index=i;}
static int need(int ok){return ok?0:1;}
int main(void){int bad=0,i;
  for(i=1;i<=MAX_CLIENTS;i++)bad+=need(alloc_chat()==i);bad+=need(alloc_chat()==0);free(chat[17]);chat[17]=0;bad+=need(alloc_chat()==17);
  i=alloc_goal(23);goal[i]->weights=(void*)1;goal[i]->index=(void*)2;goal[i]->lastarea=77;goal[i]->top=3;goal[i]->stack[0].number=9;goal[i]->avoid[5]=99;goal[i]->times[5]=2.5f;reset_goal(i);bad+=need(goal[i]->client==23);bad+=need(goal[i]->lastarea==77);bad+=need(goal[i]->weights==(void*)1&&goal[i]->index==(void*)2);bad+=need(goal[i]->top==0&&goal[i]->stack[0].number==0);bad+=need(goal[i]->avoid[5]==0&&goal[i]->times[5]==0);
  i=alloc_move();move[i]->client=8;move[i]->avoid[0]=42;move[i]->times[0]=3;move[i]->tries[0]=4;reset_avoid(move[i]);bad+=need(move[i]->client==8);bad+=need(move[i]->avoid[0]==0&&move[i]->times[0]==0&&move[i]->tries[0]==0);move[i]->area=12;move[i]->spots[0].radius=64;reset_move(i);bad+=need(move[i]->client==0&&move[i]->area==0&&move[i]->spots[0].radius==0);
  i=alloc_weapon();weapon[i]->weights=(void*)3;weapon[i]->index=(void*)4;reset_weapon(i);bad+=need(weapon[i]->weights==(void*)3&&weapon[i]->index==(void*)4);
  bad+=need(MAX_CLIENTS==64&&MAX_GOALSTACK==8&&MAX_AVOIDGOALS==256&&MAX_AVOIDREACH==1&&MAX_AVOIDSPOTS==32);
  if(bad){printf("FAIL: %d\n",bad);return 1;}puts("PASS: 4 native AI resource scenarios / 13 exact observations");return 0;
}
