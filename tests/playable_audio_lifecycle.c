#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

__declspec(dllimport) int playable_audio_init(void);
__declspec(dllimport) int playable_audio_play_pcm(const unsigned char *, int, int, int, int);
__declspec(dllimport) int playable_audio_play_pcm_loop(const unsigned char *, int, int, int, int);
__declspec(dllimport) void playable_audio_stop(void);
__declspec(dllimport) void playable_audio_shutdown(void);

int main(void) {
    unsigned char silence[64] = { 0 };
    playable_audio_stop();
    playable_audio_shutdown();
    if (playable_audio_play_pcm(silence, 64, 11025, 1, 8) != 0) return 2;
    if (!playable_audio_init()) return 3;
    if (playable_audio_play_pcm(NULL, 64, 11025, 1, 8) != 0) return 4;
    if (playable_audio_play_pcm(silence, 63, 11025, 2, 16) != 0) return 5;
    if (playable_audio_play_pcm(silence, 64, 3999, 1, 8) != 0) return 6;
    if (playable_audio_play_pcm(silence, 64, 11025, 3, 8) != 0) return 7;
    if (playable_audio_play_pcm(silence, 64, 11025, 1, 24) != 0) return 8;
    if (playable_audio_play_pcm_loop(NULL, 64, 11025, 1, 8) != 0) return 10;
    if (GetEnvironmentVariableA("MQ3_AUDIO_SMOKE", NULL, 0) != 0 &&
        (!playable_audio_play_pcm_loop(silence, 64, 11025, 1, 8) ||
         !playable_audio_play_pcm(silence, 64, 11025, 1, 8) ||
         !playable_audio_play_pcm(silence, 64, 11025, 1, 8))) return 9;
    playable_audio_stop();
    playable_audio_stop();
    playable_audio_shutdown();
    playable_audio_shutdown();
    puts("playable audio lifecycle: PASS");
    return 0;
}
