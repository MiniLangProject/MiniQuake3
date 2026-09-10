/* Host for unchanged Sys_QueEvent extracted from pinned Baseq3 win_main.c. */
#include <stdio.h>
#include <string.h>
typedef unsigned char byte;
typedef enum {SE_NONE=0,SE_KEY,SE_CHAR,SE_MOUSE,SE_JOYSTICK_AXIS,SE_CONSOLE,SE_PACKET} sysEventType_t;
typedef struct {int evTime;sysEventType_t evType;int evValue,evValue2;int evPtrLength;void *evPtr;} sysEvent_t;
#define MAX_QUED_EVENTS 256
#define MASK_QUED_EVENTS (MAX_QUED_EVENTS-1)
static sysEvent_t eventQue[MAX_QUED_EVENTS];static int eventHead,eventTail;static int now=1234,freed,overflowed;
static int Sys_Milliseconds(void){return now;}
static void Com_Printf(const char *text){(void)text;overflowed++;}
static void Z_Free(void *ptr){(void)ptr;freed++;}
#include "input_event_queue_under_test.inc"
static sysEvent_t getQueued(void){eventTail++;return eventQue[(eventTail-1)&MASK_QUED_EVENTS];}
int main(void){
 sysEvent_t a,b,first,last;int i;
 memset(eventQue,0,sizeof(eventQue));eventHead=eventTail=freed=overflowed=0;
 Sys_QueEvent(0,SE_KEY,10,1,0,NULL);Sys_QueEvent(77,SE_CHAR,65,0,0,NULL);a=getQueued();b=getQueued();
 printf("basic|%d|%d|%d|%d|%d|%d|%d|%d\n",a.evTime,a.evType,a.evValue,a.evValue2,b.evTime,b.evType,b.evValue,b.evValue2);
 memset(eventQue,0,sizeof(eventQue));eventHead=eventTail=freed=overflowed=0;
 for(i=0;i<258;i++)Sys_QueEvent(2000+i,SE_KEY,i,(i&1)==1,0,NULL);
 first=getQueued();last=first;while(eventHead>eventTail)last=getQueued();
 printf("overflow|%d|%d|%d|%d|%d|%d|%d\n",eventHead,eventTail,overflowed,first.evTime,first.evValue,last.evTime,last.evValue);
 return 0;
}
