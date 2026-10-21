#include <stdio.h>
typedef int qhandle_t;
static int loadingPlayerIconCount,loadingItemIconCount;static qhandle_t loadingPlayerIcons[16],loadingItemIcons[26];
static void CG_DrawPic(int x,int y,int w,int h,qhandle_t asset){printf("%d|%d|%d|%d|%d\n",x,y,w,h,asset);}
#include "cgame_info_under_test.inc"
int main(void){loadingPlayerIconCount=2;loadingPlayerIcons[0]=11;loadingPlayerIcons[1]=12;loadingItemIconCount=14;for(int i=0;i<14;i++)loadingItemIcons[i]=100+i;CG_DrawLoadingIcons();return 0;}
