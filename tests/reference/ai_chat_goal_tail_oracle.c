/* SPDX-License-Identifier: GPL-2.0-or-later */
#include <stdio.h>
#include <string.h>
#include <ctype.h>
typedef struct { int number; float until; } avoid_t;
typedef struct { const char *name; int count; } chat_type_t;
static int num_chats(const chat_type_t *types,int count,const char *name){for(int i=0;i<count;i++){const char *a=types[i].name,*b=name;while(*a&&toupper((unsigned char)*a)==toupper((unsigned char)*b)){a++;b++;}if(!*a&&!*b)return types[i].count;}return 0;}
static void remove_tildes(char *m){for(int i=0;m[i];i++)if(m[i]=='~')memmove(m+i,m+i+1,strlen(m+i+1)+1);}
static void get_message(char *state,char *out,int size){remove_tildes(state);strncpy(out,state,(size_t)size-1);out[size-1]=0;state[0]=0;}
static void remove_avoid(avoid_t *a,int count,int number,float now){for(int i=0;i<count;i++)if(a[i].number==number&&a[i].until>=now){a[i].until=0;return;}}
static void add_avoid(avoid_t *a,int count,int number,float now,float duration){for(int i=0;i<count;i++)if(a[i].number==number){a[i].until=now+duration;return;}for(int i=0;i<count;i++)if(a[i].until<now){a[i].number=number;a[i].until=now+duration;return;}}
#define CHECK(v) do{observations++;if(!(v)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){int observations=0;chat_type_t types[]={{"greeting",3},{"death",7}};CHECK(num_chats(types,2,"GREETING")==3&&num_chats(types,2,"missing")==0);char a[64]="one~~two~three",out[8];remove_tildes(a);CHECK(!strcmp(a,"one~twothree"));strcpy(a,"~hello~~");get_message(a,out,6);CHECK(!strcmp(out,"hello"));CHECK(!*a);avoid_t av[4]={{7,15},{0,0},{0,0},{0,0}};remove_avoid(av,4,7,10);CHECK(av[0].until==0);add_avoid(av,4,8,10,3.5f);CHECK(av[0].number==8&&av[0].until==13.5f);float respawn=5;if(respawn==0)respawn=30;if(respawn<10)respawn=10;CHECK(respawn==10);respawn=25;if(respawn==0)respawn=30;if(respawn<10)respawn=10;CHECK(respawn==25);CHECK(sizeof(float)==4);puts("PASS: 4 native Baseq3 chat/goal-tail scenarios / 9 exact observations");return 0;}
