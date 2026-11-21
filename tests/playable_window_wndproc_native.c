#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include "../native/playable_win32.c"

int main(void) {
    int state[7];
    playableInputEvent event;
    resetInputEvents();
    requestedFullscreen = 1;
    if (playableWindowProc(0, WM_CREATE, 0, 0) != 0 ||
            !playable_window_window_state(state, 7) || !state[5]) return 1;
    playableWindowProc(0, WM_ACTIVATE, MAKEWPARAM(WA_ACTIVE, 0), 0);
    if (!playable_window_window_state(state, 7) || !state[0] || state[1] || state[6] != 1) return 2;
    playableWindowProc(0, WM_ACTIVATE, MAKEWPARAM(WA_ACTIVE, 1), 0);
    if (!playable_window_window_state(state, 7) || state[0] || !state[1] || state[6] != 2) return 3;
    requestedFullscreen = 0;
    playableWindowProc(0, WM_MOVE, 0, MAKELPARAM((WORD)-12, (WORD)31));
    if (!playable_window_window_state(state, 7) || state[2] != -12 || state[3] != 31) return 4;
    if (playableWindowProc(0, WM_SYSCOMMAND, SC_SCREENSAVE, 0) != 0) return 5;
    playableWindowProc(0, WM_SYSKEYDOWN, VK_RETURN, 0);
    if (!playable_window_take_video_restart() || playable_window_take_video_restart() ||
            !playable_window_window_state(state, 7) || state[4]) return 6;
    /* Repeats must not queue a second fullscreen toggle. The host applies
     * the first request between frames after reading the current cvars. */
    playableWindowProc(0, WM_SYSKEYDOWN, VK_RETURN, 1L << 30);
    if (playable_window_take_video_restart()) return 15;
    playableWindowProc(0, WM_KEYDOWN, 'X', 0x002d0000);
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) ||
            event.type != PLAYABLE_INPUT_KEY || event.value != 'x' || !event.value2) return 7;
    playableWindowProc(0, WM_KEYUP, 'X', 0x002d0000);
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) || event.value2) return 8;
    playableWindowProc(0, WM_MOUSEWHEEL, MAKEWPARAM(0, 2 * WHEEL_DELTA), 0);
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) || event.value != PLAYABLE_K_MWHEELUP) return 9;
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) || event.value2) return 10;
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) || event.value != PLAYABLE_K_MWHEELUP) return 11;
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) || event.value2) return 12;
    playableWindowProc(0, WM_CLOSE, 0, 0);
    if (!playable_window_should_close()) return 13;
    playableWindowProc(0, WM_DESTROY, 0, 0);
    if (!playable_window_window_state(state, 7) || state[5]) return 14;
    puts("playable window wndproc: PASS");
    return 0;
}
