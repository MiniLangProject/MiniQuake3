#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include "../native/playable_win32.c"

int main(void) {
    playableInputEvent event;
    int index;
    resetInputEvents();
    if (playable_window_next_input_event((unsigned char *)&event, 15) != 0) return 1;
    queueInputEvent(10, PLAYABLE_INPUT_KEY, 'W', 1);
    queueInputEvent(14, PLAYABLE_INPUT_MOUSE, -3, 8);
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) ||
            event.time != 10 || event.type != PLAYABLE_INPUT_KEY || event.value != 'W' || event.value2 != 1) return 2;
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) ||
            event.time != 14 || event.type != PLAYABLE_INPUT_MOUSE || event.value != -3 || event.value2 != 8) return 3;
    if (playable_window_next_input_event((unsigned char *)&event, sizeof(event)) != 0) return 4;
    queueKeyTransition('A', 1, 20);queueKeyTransition('A', 1, 21);queueKeyTransition('A', 0, 24);
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) || event.time != 20 || event.value2 != 1) return 5;
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) || event.time != 24 || event.value2 != 0) return 6;
    if (playable_window_next_input_event((unsigned char *)&event, sizeof(event)) != 0) return 7;
    playableWindowProc(0, WM_CHAR, 'x', 0);
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) ||
            event.type != PLAYABLE_INPUT_CHAR || event.value != 'x' || event.value2 != 0) return 11;
    playableWindowProc(0, WM_CHAR, 0x20ac, 0);
    if (playable_window_next_input_event((unsigned char *)&event, sizeof(event)) != 0) return 12;
    resetInputEvents();
    for (index = 0; index < 258; ++index) queueInputEvent(1000 + index, PLAYABLE_INPUT_KEY, index, index & 1);
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) || event.time != 1002 || event.value != 2) return 8;
    for (index = 1; index < 256; ++index) if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event))) return 9;
    if (event.time != 1257 || event.value != 257 || playable_window_next_input_event((unsigned char *)&event, sizeof(event))) return 10;
    resetInputEvents();
    puts("playable window input events: PASS");
    return 0;
}
