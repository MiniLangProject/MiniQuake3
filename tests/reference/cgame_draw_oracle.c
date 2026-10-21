#include <stdio.h>
#include <string.h>

typedef int qhandle_t;
#define CHAR_WIDTH 16
#define CHAR_HEIGHT 24
#define STAT_MINUS 10
#define Com_sprintf snprintf
static struct { struct { qhandle_t numberShaders[11]; } media; } cgs;
static void CG_DrawPic(int x,int y,int w,int h,qhandle_t shader) {
  printf("pic|%d|%d|%d|%d|%d\n",x,y,w,h,shader);
}
#include "cgame_draw_under_test.inc"

int main(void) {
  int i; for(i=0;i<11;i++) cgs.media.numberShaders[i]=i;
  CG_DrawField(10,20,1,15);
  CG_DrawField(10,20,2,-20);
  CG_DrawField(10,20,3,-7);
  CG_DrawField(10,20,4,12345);
  CG_DrawField(10,20,6,-99999);
  CG_DrawField(10,20,0,5);
  return 0;
}
