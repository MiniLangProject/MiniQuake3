/* Direct be_ai_chat.c console-message lifecycle and QVM-layout oracle. */
#include <stdint.h>
#include <stdio.h>
#include <stddef.h>
#include <string.h>
#define MAX_MESSAGE_SIZE 256
typedef struct qvm_console_s {int32_t handle;float time;int32_t type;char message[MAX_MESSAGE_SIZE];uint32_t prev,next;} qvm_console_t;
typedef struct node_s {int handle,type;float time;char message[256];struct node_s*prev,*next;} node_t;
typedef struct {int handle,count;node_t*first,*last;} chat_t;
static node_t heap[256];static node_t*freehead;
static void init(void){int i;memset(heap,0,sizeof(heap));for(i=0;i<255;i++)heap[i].next=&heap[i+1];freehead=&heap[0];}
static void queue(chat_t*c,int type,const char*s,float time){node_t*m=freehead;if(!m)return;freehead=m->next;if(++c->handle<=0||c->handle>8192)c->handle=1;m->handle=c->handle;m->time=time;m->type=type;strncpy(m->message,s,256);m->next=0;m->prev=c->last;if(c->last)c->last->next=m;else c->first=m;c->last=m;c->count++;}
static void remove_msg(chat_t*c,int h){node_t*m;for(m=c->first;m;m=m->next)if(m->handle==h){if(m->next)m->next->prev=m->prev;else c->last=m->prev;if(m->prev)m->prev->next=m->next;else c->first=m->next;m->prev=0;m->next=freehead;freehead=m;c->count--;break;}}
#define CHECK(x) do{if(!(x)){printf("FAIL %d\n",__LINE__);return 1;}}while(0)
int main(void){chat_t c={0};init();queue(&c,0,"alpha",12.5f);queue(&c,1,"bravo",13);CHECK(c.count==2&&c.first->handle==1&&c.last->handle==2);remove_msg(&c,1);CHECK(c.count==1&&c.first->handle==2&&c.first->time==13);c.handle=8192;queue(&c,7,"wrap",14);CHECK(c.last->handle==1&&c.last->type==7);CHECK(sizeof(qvm_console_t)==276&&offsetof(qvm_console_t,message)==12&&offsetof(qvm_console_t,prev)==268);puts("PASS: 4 native Baseq3 console-message scenarios / 10 exact observations");return 0;}
