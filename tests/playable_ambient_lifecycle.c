#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>

__declspec(dllimport) int playable_ambient_init(int);
__declspec(dllimport) int playable_ambient_can_submit(void);
__declspec(dllimport) int playable_ambient_submit(const unsigned char *,int);
__declspec(dllimport) void playable_ambient_stop(void);
__declspec(dllimport) void playable_ambient_shutdown(void);

int main(void) {
    unsigned char silence[4096]={0};int result;
    playable_ambient_stop();playable_ambient_shutdown();
    if (playable_ambient_can_submit()!=0) return 2;
    if (playable_ambient_submit(silence,sizeof(silence))!=0) return 3;
    if (playable_ambient_init(3999)!=0 || playable_ambient_init(192001)!=0) return 4;
    if (!playable_ambient_init(22050) || !playable_ambient_can_submit()) return 5;
    if (playable_ambient_submit(NULL,sizeof(silence))!=0) return 6;
    if (playable_ambient_submit(silence,3)!=0) return 7;
    if (playable_ambient_submit(silence,16388)!=0) return 8;
    result=playable_ambient_submit(silence,sizeof(silence));if (result!=1) return 9;
    result=playable_ambient_submit(silence,sizeof(silence));if (result!=1 && result!=2) return 10;
    playable_ambient_stop();playable_ambient_stop();if (playable_ambient_can_submit()!=0) return 11;
    if (!playable_ambient_init(11025)) return 12;
    playable_ambient_shutdown();playable_ambient_shutdown();
    puts("playable ambient lifecycle: PASS");return 0;
}
