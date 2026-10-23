#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include "../native/playable_win32.c"

int main(void) {
    playableInputEvent event;
    int index;
    resetInputEvents();
    if (!playable_window_input_init() ||
            !playable_window_input_configure_joystick(0, 0.15, 0.02) ||
            !playable_window_input_configure_midi(0, 0, 1) ||
            playable_window_input_joystick_available() ||
            playable_window_input_midi_device_count() < 0) return 22;
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
    playableWindowProc(0, WM_KEYDOWN, 'W', 0);
    playableWindowProc(0, WM_KEYDOWN, 'W', 1L << 30);
    playableWindowProc(0, WM_KEYUP, 'W', 0);
    for (index = 0; index < 3; ++index) {
        if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) ||
                event.value != 'w' || event.value2 != (index < 2)) return 21;
    }
    playableWindowProc(0, WM_CHAR, 'x', 0);
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) ||
            event.type != PLAYABLE_INPUT_CHAR || event.value != 'x' || event.value2 != 0) return 11;
    playableWindowProc(0, WM_CHAR, 0x20ac, 0);
    if (playable_window_next_input_event((unsigned char *)&event, sizeof(event)) != 0) return 12;
    playableWindowProc(0, WM_RBUTTONDOWN, 0, 0);
    playableWindowProc(0, WM_RBUTTONUP, 0, 0);
    playableWindowProc(0, WM_MBUTTONDOWN, 0, 0);
    playableWindowProc(0, WM_MBUTTONUP, 0, 0);
    playableWindowProc(0, WM_XBUTTONDOWN, MAKEWPARAM(0, XBUTTON1), 0);
    playableWindowProc(0, WM_XBUTTONUP, MAKEWPARAM(0, XBUTTON1), 0);
    for (index = 0; index < 6; ++index) {
        if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event))) return 13;
        if (event.value != PLAYABLE_K_MOUSE1 + (index < 2 ? 1 : (index < 4 ? 2 : 3)) ||
                event.value2 != ((index & 1) == 0)) return 14;
    }
    playableWindowProc(0, WM_MOUSEWHEEL, MAKEWPARAM(0, WHEEL_DELTA), 0);
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) ||
            event.value != PLAYABLE_K_MWHEELUP || event.value2 != 1) return 15;
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) ||
            event.value != PLAYABLE_K_MWHEELUP || event.value2 != 0) return 16;
    if (joystickCentered(0) != -32768 || joystickCentered(65535) != 32767 ||
            joystickAxis(0) != -1.0 || joystickAxis(65536) != 1.0) return 17;
    if (translateVirtualKey('W', 0) != 'w' || translateVirtualKey(VK_UP, 1L << 24) != 132 ||
            translateVirtualKey(VK_UP, 0) != 161 || translateVirtualKey(VK_RETURN, 1L << 24) != 169 ||
            translateVirtualKey(VK_F15, 0) != 159) return 20;
    inputMidiEnabled = 1; inputMidiChannel = 2;
    playableMidiCallback(0, MIM_DATA, 0, 0x00643c91u, 0);
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) ||
            event.value != PLAYABLE_K_AUX1 || event.value2 != 1) return 18;
    playableMidiCallback(0, MIM_DATA, 0, 0x00003c81u, 0);
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) ||
            event.value != PLAYABLE_K_AUX1 || event.value2 != 0) return 19;
    inputMidiEnabled = 0;
    resetInputEvents();
    for (index = 0; index < 258; ++index) queueInputEvent(1000 + index, PLAYABLE_INPUT_KEY, index, index & 1);
    if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) || event.time != 1002 || event.value != 2) return 8;
    for (index = 1; index < 256; ++index) if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event))) return 9;
    if (event.time != 1257 || event.value != 257 || playable_window_next_input_event((unsigned char *)&event, sizeof(event))) return 10;
    resetInputEvents();
    puts("playable window input events: PASS");
    return 0;
}
