/* SPDX-License-Identifier: GPL-2.0-or-later
 * Inject SDK RAWMOUSE records into the actual productive WM_INPUT branch,
 * without moving the user's mouse or creating an application window. */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>

static RAWINPUT fixtureRawInput;
static unsigned int fixtureDefaultCalls;
static UINT WINAPI fixtureGetRawInputData(HRAWINPUT handle, UINT command,
        LPVOID output, PUINT size, UINT headerSize) {
    (void)handle;
    if (command != RID_INPUT || !output || !size || *size < sizeof(fixtureRawInput) ||
            headerSize != sizeof(RAWINPUTHEADER)) return (UINT)-1;
    memcpy(output, &fixtureRawInput, sizeof(fixtureRawInput));
    *size = sizeof(fixtureRawInput);
    return sizeof(fixtureRawInput);
}
static LRESULT WINAPI fixtureDefaultWindowProc(HWND hwnd, UINT message,
        WPARAM wParam, LPARAM lParam) {
    if (message == WM_INPUT) { ++fixtureDefaultCalls; return 123; }
    return DefWindowProcW(hwnd, message, wParam, lParam);
}
#define GetRawInputData fixtureGetRawInputData
#define DefWindowProcW fixtureDefaultWindowProc
#include "../native/playable_win32.c"
#undef GetRawInputData
#undef DefWindowProcW

#define REQUIRE(value, label) do { if (!(value)) { printf("FAIL: %s line=%d\n", label, __LINE__); return 1; } } while (0)

static int motion(int time, int dx, int dy) {
    playableInputEvent event;
    if (!dx && !dy) {
        if (playable_window_next_input_event((unsigned char *)&event, sizeof(event))) return 0;
    } else if (!playable_window_next_input_event((unsigned char *)&event, sizeof(event)) ||
            event.time != time || event.type != PLAYABLE_INPUT_MOUSE || event.value != dx || event.value2 != dy) return 0;
    if (playable_window_next_input_event((unsigned char *)&event, sizeof(event))) return 0;
    return playable_window_consume_mouse_dx() == dx && playable_window_consume_mouse_dy() == dy;
}
static int raw(USHORT flags, LONG x, LONG y, HANDLE device, int time) {
    ZeroMemory(&fixtureRawInput, sizeof(fixtureRawInput));
    fixtureRawInput.header.dwType = RIM_TYPEMOUSE;
    fixtureRawInput.header.dwSize = sizeof(fixtureRawInput);
    fixtureRawInput.header.hDevice = device;
    fixtureRawInput.data.mouse.usFlags = flags;
    fixtureRawInput.data.mouse.lLastX = x; fixtureRawInput.data.mouse.lLastY = y;
    /* Deterministic event times for the payload tests, and the full window
     * branch independently below to check foreground cleanup ownership. */
    queueRawMouseMotion(&fixtureRawInput.data.mouse, device, time);
    return 1;
}
static int absoluteX(int x, int desktop) {
    return (desktop ? GetSystemMetrics(SM_XVIRTUALSCREEN) : 0) +
        MulDiv(x, GetSystemMetrics(desktop ? SM_CXVIRTUALSCREEN : SM_CXSCREEN) - 1, 65535);
}
static int absoluteY(int y, int desktop) {
    return (desktop ? GetSystemMetrics(SM_YVIRTUALSCREEN) : 0) +
        MulDiv(y, GetSystemMetrics(desktop ? SM_CYVIRTUALSCREEN : SM_CYSCREEN) - 1, 65535);
}
int main(void) {
    playableInputEvent event;
    HANDLE firstDevice = (HANDLE)(UINT_PTR)1, secondDevice = (HANDLE)(UINT_PTR)2;
    int dx, dy;
    resetInputEvents();
    InterlockedExchange(&inputAppActive, 1);
    queueKeyboardEvent('w', 1, 10);
    REQUIRE(playable_window_input_key_down('w') && !playable_window_input_key_down('W') &&
        !playable_window_input_key_down(152), "normalized W state does not alias virtual W/F8");
    queueKeyTransition(PLAYABLE_K_MOUSE1, 1, 20);
    REQUIRE(playable_window_input_key_down(PLAYABLE_K_MOUSE1) &&
        !playable_window_input_key_down(VK_LBUTTON), "mouse1 normalized state");
    REQUIRE(playable_window_next_input_event((unsigned char *)&event, sizeof(event)) &&
        event.value == 'w' && event.value2, "held W down retained");
    REQUIRE(playable_window_next_input_event((unsigned char *)&event, sizeof(event)) &&
        event.value == PLAYABLE_K_MOUSE1 && event.value2, "held attack down retained");
    /* No actual window/capture: this executes the productive focus-loss path
     * and proves it keeps release events for managed movement/attack state. */
    InterlockedExchange(&inputMouseActive, 0);
    playableWindowProc(0, WM_KILLFOCUS, 0, 0);
    REQUIRE(!playable_window_input_key_down('w') && !playable_window_input_key_down(PLAYABLE_K_MOUSE1), "focus loss clears visible key state");
    REQUIRE(playable_window_next_input_event((unsigned char *)&event, sizeof(event)) &&
        event.value == 'w' && !event.value2, "focus loss produces W key-up");
    REQUIRE(playable_window_next_input_event((unsigned char *)&event, sizeof(event)) &&
        event.value == PLAYABLE_K_MOUSE1 && !event.value2, "focus loss produces attack key-up");
    REQUIRE(!playable_window_next_input_event((unsigned char *)&event, sizeof(event)), "focus releases are not cleared or duplicated");
    REQUIRE(!playable_window_input_key_down(-1) && !playable_window_input_key_down(256), "key bounds");
    raw(0, -3, 8, firstDevice, 100);
    REQUIRE(motion(100, 0, 0), "inactive raw reports are ignored");
    InterlockedExchange(&inputAppActive, 1);
    raw(0, -3, 8, firstDevice, 101);
    REQUIRE(motion(101, 0, 0), "uncaptured raw reports are ignored");
    InterlockedExchange(&inputMouseActive, 1);
    raw(0, -3, 8, firstDevice, 102);
    REQUIRE(motion(102, -3, 8), "relative deltas remain exact");
    rawMouseEnabled = 1;
    playableWindowProc(0, WM_MOUSEMOVE, 0, MAKELPARAM(30000, 30000));
    REQUIRE(motion(103, 0, 0), "legacy cursor-warp message cannot duplicate raw movement");
    raw(MOUSE_MOVE_ABSOLUTE, 32768, 20000, firstDevice, 104);
    REQUIRE(motion(104, 0, 0), "first absolute report anchors without a camera jump");
    dx = absoluteX(33000, 0) - absoluteX(32768, 0); dy = absoluteY(21000, 0) - absoluteY(20000, 0);
    raw(MOUSE_MOVE_ABSOLUTE, 33000, 21000, firstDevice, 105);
    REQUIRE(motion(105, dx, dy), "absolute normalized coordinates become pixel deltas");
    raw(MOUSE_MOVE_ABSOLUTE, 50000, 50000, secondDevice, 106);
    REQUIRE(motion(106, 0, 0), "new absolute device reanchors");
    dx = absoluteX(51000, 0) - absoluteX(50000, 0); dy = absoluteY(51000, 0) - absoluteY(50000, 0);
    raw(MOUSE_MOVE_ABSOLUTE | MOUSE_MOVE_NOCOALESCE, 51000, 51000, secondDevice, 107);
    REQUIRE(motion(107, dx, dy), "no-coalesce metadata does not discard motion");
    raw(MOUSE_MOVE_ABSOLUTE | MOUSE_VIRTUAL_DESKTOP, 32768, 32768, secondDevice, 108);
    REQUIRE(motion(108, 0, 0), "virtual desktop coordinate-space change reanchors");
    dx = absoluteX(33000, 1) - absoluteX(32768, 1); dy = absoluteY(32000, 1) - absoluteY(32768, 1);
    raw(MOUSE_MOVE_ABSOLUTE | MOUSE_VIRTUAL_DESKTOP, 33000, 32000, secondDevice, 109);
    REQUIRE(motion(109, dx, dy), "virtual desktop deltas include the correct screen extent");
    raw(MOUSE_MOVE_ABSOLUTE | MOUSE_ATTRIBUTES_CHANGED, 1000, 1000, secondDevice, 110);
    REQUIRE(motion(110, 0, 0), "device attribute change reanchors");
    playable_window_input_clear_states();
    raw(MOUSE_MOVE_ABSOLUTE, 60000, 60000, secondDevice, 111);
    REQUIRE(motion(111, 0, 0), "loading/focus state clear reanchors absolute input");
    raw(MOUSE_MOVE_ABSOLUTE, -1, 65536, secondDevice, 112);
    REQUIRE(motion(112, 0, 0), "invalid absolute coordinates cannot inject extreme movement");
    raw(0, 2, -4, secondDevice, 113);
    REQUIRE(motion(113, 2, -4), "switch back to relative input remains exact");
    raw(MOUSE_MOVE_ABSOLUTE, 10000, 10000, secondDevice, 114);
    REQUIRE(motion(114, 0, 0), "switch back to absolute input reanchors");
    InterlockedExchange(&inputAppActive, 0);
    rawMouseEnabled = 0; haveMousePosition = 1; lastMouseX = 100; lastMouseY = 100;
    playableWindowProc(0, WM_MOUSEMOVE, 0, MAKELPARAM(200, 300));
    REQUIRE(motion(115, 0, 0), "inactive legacy mouse reports cannot race delayed deactivation");
    rawMouseEnabled = 1;
    fixtureDefaultCalls = 0;
    REQUIRE(playableWindowProc(0, WM_INPUT, RIM_INPUT, 1) == 123 && fixtureDefaultCalls == 1,
        "ignored foreground raw input still performs DefWindowProc cleanup");
    REQUIRE(motion(115, 0, 0), "ignored foreground raw input has no motion");
    REQUIRE(playableWindowProc(0, WM_INPUT, RIM_INPUTSINK, 1) == 0 && fixtureDefaultCalls == 1,
        "background sink returns zero without foreground cleanup");
    REQUIRE(motion(116, 0, 0), "background sink has no motion");
    puts("playable raw input: PASS (normalized key state, focus key-ups, relative/absolute/virtual input, warp isolation, foreground cleanup)");
    return 0;
}
