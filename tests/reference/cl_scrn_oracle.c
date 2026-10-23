/* Focused host for unchanged Baseq3 cl_scrn.c coordinate/text helpers. */
#include <stdio.h>
#include "q_shared.h"
struct { struct { int vidWidth; int vidHeight; } glconfig; } cls;
#include "cl_scrn_under_test.inc"

static void scale(int width, int height, float x, float y, float w, float h) {
    cls.glconfig.vidWidth=width; cls.glconfig.vidHeight=height;
    SCR_AdjustFrom640(&x,&y,&w,&h);
    printf("S|%d|%d|%d|%d\n",(int)(x*1000.0f),(int)(y*1000.0f),(int)(w*1000.0f),(int)(h*1000.0f));
}
static void text(const char *value) { printf("T|%d|%d\n",SCR_Strlen(value),SCR_GetBigStringWidth(value)); }
int main(void) {
    scale(640,480,10,20,30,40); scale(1280,720,10,20,30,40); scale(1920,1080,-5,2,0.5f,9);
    text(""); text("abc"); text("a^1bc"); text("^^x"); text("^7white^1red");
    return 0;
}
