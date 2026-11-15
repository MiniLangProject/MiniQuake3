/* SPDX-License-Identifier: GPL-2.0-or-later */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
static unsigned int profileClockQueries;
static BOOL countProfileCounter(LARGE_INTEGER *value) { ++profileClockQueries;return QueryPerformanceCounter(value); }
#define MQ3_PROFILE_COUNTER countProfileCounter
#include "../native/playable_win32.c"
#include <stdio.h>
static playableTriangleBatchRecord triangle(void) {
    playableTriangleBatchRecord t;
    ZeroMemory(&t,sizeof(t));t.baseTextureSlot=t.lightmapTextureSlot=-1;t.fallbackRed=255;
    memset(t.vertexColor,255,sizeof(t.vertexColor));
    t.vertex[0][0]=t.vertex[1][0]=t.vertex[2][0]=4;
    t.vertex[0][1]=-2;t.vertex[0][2]=-2;t.vertex[1][1]=2;t.vertex[1][2]=-2;t.vertex[2][2]=2;
    t.vertex[0][7]=t.vertex[1][7]=t.vertex[2][7]=1;
    return t;
}
static int drawFrame(void) {
    playableTriangleBatchRecord t=triangle();
    playable_window_begin_frame(0,0,0);
    if(hardwareDrawWorld((unsigned char *)&t,1,0,0,128,128,0,0,0,0,1,0,0,0,1,1,0,0,64,1)!=1) return 0;
    playable_window_present();return 1;
}
int main(int argc,char **argv) {
    int frame;
    FILE *file=0;
    char text[4096];
    size_t bytes;
    LONGLONG span,draw,swap;
    if(argc!=2) return 2;
    SetEnvironmentVariableA("MQ3_RENDER_PROFILE",0);
    if(!playable_window_create(128,128) || !hardwareRenderer) return 3;
    for(frame=0;frame<3;++frame) if(!drawFrame()) return 4;
    playable_window_shutdown();
    if(profileClockQueries || hardwareProfile.enabled || hardwareProfile.frameCount) return 5;
    SetEnvironmentVariableA("MQ3_RENDER_PROFILE","1");SetEnvironmentVariableA("MQ3_RENDER_PROFILE_FILE",argv[1]);
    if(!playable_window_create(128,128) || !hardwareRenderer || !hardwareProfile.enabled) return 6;
    for(frame=0;frame<3;++frame) if(!drawFrame()) return 7;
    if(profileClockQueries!=15 || hardwareProfile.frameCount!=3 || hardwareProfile.frameActive) return 8;
    for(frame=0;frame<3;++frame) {
        hardwareProfileFrame *value=&hardwareProfile.frames[frame];
        if(value->triangles!=1 || value->drawCalls!=1 || value->span<value->draw+value->swap || value->draw<=0 || value->swap<0) return 9;
    }
    /* Once bounded storage is full, aggregate counters continue without an
     * out-of-bounds record write. Restore the three real frames before dump. */
    span=hardwareProfile.totalSpan;draw=hardwareProfile.totalDraw;swap=hardwareProfile.totalSwap;
    hardwareProfile.frames[HARDWARE_PROFILE_MAX_FRAMES-1].span=123456789;
    hardwareProfile.frameCount=HARDWARE_PROFILE_MAX_FRAMES;hardwareProfile.frameActive=1;hardwareProfile.frameDraw=2;hardwareProfile.frameStarted=10;
    hardwareProfilePresent(15,20);
    if(hardwareProfile.frameCount!=HARDWARE_PROFILE_MAX_FRAMES+1 || hardwareProfile.frames[HARDWARE_PROFILE_MAX_FRAMES-1].span!=123456789) return 10;
    hardwareProfile.frameCount=3;hardwareProfile.totalSpan=span;hardwareProfile.totalDraw=draw;hardwareProfile.totalSwap=swap;
    playable_window_shutdown();
    if(hardwareProfile.enabled || hardwareProfile.frameActive || hardwareProfile.path[0]) return 11;
    if(fopen_s(&file,argv[1],"rb") || !file) return 12;
    bytes=fread(text,1,sizeof(text)-1,file);text[bytes]=0;fclose(file);
    if(!strstr(text,"MQ3_RENDER_PROFILE version=1 frames=3 recorded=3") || !strstr(text,"FRAME index=2 ") || !strstr(text,"TOTAL frames=3 ")) return 13;
    SetEnvironmentVariableA("MQ3_RENDER_PROFILE_FILE",0);
    if(!playable_window_create(128,128) || !hardwareRenderer || !hardwareProfile.enabled || hardwareProfile.path[0]) return 14;
    if(!drawFrame()) return 15;
    playable_window_shutdown();
    puts("PASS: render profile default-off zero clock calls, exact draw/swap/frame accounting, bounded storage and shutdown-only dump");
    return 0;
}
