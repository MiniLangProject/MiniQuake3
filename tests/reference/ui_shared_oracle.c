#include <stdio.h>
#include <ctype.h>
#include <stddef.h>

#define qtrue 1
#define qfalse 0
#define WINDOW_VISIBLE 0x00000004
#define WINDOW_FADINGOUT 0x00000020
#define WINDOW_FADINGIN 0x00000040
#define HASH_TABLE_SIZE 2048
#define KEYWORDHASH_SIZE 512
#define MEM_POOL_SIZE 64
typedef int qboolean;
typedef float vec4_t[4];
typedef struct { float x,y,w,h; } rectDef_t;
typedef struct { int realTime; void (*Print)(const char *,...); } displayContextDef_t;
static displayContextDef_t context;
static displayContextDef_t *DC=&context;
static char memoryPool[MEM_POOL_SIZE];
static int allocPoint,outOfMemory;

#include "ui_shared_under_test.inc"

int main(void){vec4_t a={-1,0,.5f,1},b={2,1,1.5f,-1},c;rectDef_t r={10,20,30,40};int flags,next;float alpha;void *p;
 printf("hash %ld %ld\n",hashForString("Player"),hashForString("player"));
 printf("keyword %d %d\n",KeywordHash_Key("RECT"),KeywordHash_Key("rect"));
 printf("rect %d %d %d\n",Rect_ContainsPoint(&r,20,30),Rect_ContainsPoint(&r,10,30),Rect_ContainsPoint(&r,40,60));
 printf("visible %d %d\n",IsVisible(WINDOW_VISIBLE),IsVisible(WINDOW_VISIBLE|WINDOW_FADINGOUT));
 LerpColor(a,b,c,.5f);printf("lerp %d %d %d %d\n",(int)(c[0]*1000),(int)(c[1]*1000),(int)(c[2]*1000),(int)(c[3]*1000));
 context.realTime=1;flags=WINDOW_VISIBLE|WINDOW_FADINGOUT;alpha=.05f;next=0;Fade(&flags,&alpha,1,&next,10,qtrue,.1f);printf("fadeout %d %d %d\n",flags,(int)(alpha*1000),next);
 flags=WINDOW_VISIBLE|WINDOW_FADINGIN;alpha=.95f;next=0;Fade(&flags,&alpha,1, &next,10,qtrue,.1f);printf("fadein %d %d %d\n",flags,(int)(alpha*1000),next);
 UI_InitMemory();p=UI_Alloc(1);printf("alloc1 %d %d\n",(int)((char*)p-memoryPool),allocPoint);p=UI_Alloc(16);printf("alloc2 %d %d\n",(int)((char*)p-memoryPool),allocPoint);p=UI_Alloc(40);printf("overflow %d %d\n",p==NULL,UI_OutOfMemory());return 0;}
