#include <stdio.h>
#include <stdarg.h>
#define MAX_OSPATH 256
static void Com_sprintf(char*out,int cap,const char*fmt,...){va_list ap;va_start(ap,fmt);vsnprintf(out,cap,fmt,ap);va_end(ap);}
#include "tr_init_under_test.inc"
int main(void){int values[]={-1,0,1,9,42,9999,10000};char b[MAX_OSPATH];for(int i=0;i<7;i++){R_ScreenshotFilename(values[i],b);printf("tga|%d|%s\n",values[i],b);R_ScreenshotFilenameJPEG(values[i],b);printf("jpg|%d|%s\n",values[i],b);}return 0;}
