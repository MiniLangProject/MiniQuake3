#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mmsystem.h>
#include <GL/gl.h>
#include <objbase.h>
#include <wincodec.h>
#include <stdint.h>
#include <limits.h>
#include <float.h>
#include <math.h>
#ifndef GL_BGRA_EXT
#define GL_BGRA_EXT 0x80E1
#endif

#if defined(_MSC_VER)
#define PLAYABLE_API __declspec(dllexport)
#else
#define PLAYABLE_API __attribute__((dllexport))
#endif

PLAYABLE_API void playable_window_input_activate(int active);

static HWND windowHandle;
static HDC windowDC;
static BITMAPINFO bitmapInfo;
static uint32_t *pixels;
static uint32_t *presentedPixels;
static float *depthPixels;
static int32_t *stencilPixels;
static int surfaceWidth;
static int surfaceHeight;
static volatile LONG closeRequested = 1;
static int rawMouseEnabled;
static LONG mouseDX;
static LONG mouseDY;
static int haveMousePosition;
static int lastMouseX;
static int lastMouseY;
static HANDLE windowThread;
static HANDLE windowCreatedEvent;
static int requestedWindowWidth;
static int requestedWindowHeight;
static int windowCreateSucceeded;
static SRWLOCK presentationLock = SRWLOCK_INIT;
static LARGE_INTEGER timerFrequency;
static LARGE_INTEGER timerStart;
static HMODULE openGLModule;
static HGLRC openGLContext;
static int openGLActive;
static int openGLPixelFormat;
static int openGLColorBits;
static int openGLDepthBits;
static int openGLStencilBits;
static int openGLStereo;
static int openGLSwapInterval;
static int requestedFullscreen;
static int requestedDisplayFrequency;
static int displayModeChanged;
static wchar_t requestedOpenGLDriver[MAX_PATH];
static int gammaRampAvailable;
static int gammaRampChanged;
static WORD originalGammaRamp[3][256];
static char openGLExtensions[4096];
static char openGLVendor[256];
static char openGLRenderer[256];
static char openGLVersion[256];

typedef HGLRC (WINAPI *playableWglCreateContextProc)(HDC);
typedef BOOL (WINAPI *playableWglDeleteContextProc)(HGLRC);
typedef BOOL (WINAPI *playableWglMakeCurrentProc)(HDC,HGLRC);
typedef PROC (WINAPI *playableWglGetProcAddressProc)(LPCSTR);
typedef const GLubyte *(APIENTRY *playableGlGetStringProc)(GLenum);
typedef void (APIENTRY *playableGlViewportProc)(GLint,GLint,GLsizei,GLsizei);
typedef void (APIENTRY *playableGlMatrixModeProc)(GLenum);
typedef void (APIENTRY *playableGlLoadIdentityProc)(void);
typedef void (APIENTRY *playableGlOrthoProc)(GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble);
typedef void (APIENTRY *playableGlRasterPos2iProc)(GLint,GLint);
typedef void (APIENTRY *playableGlPixelZoomProc)(GLfloat,GLfloat);
typedef void (APIENTRY *playableGlPixelStoreiProc)(GLenum,GLint);
typedef void (APIENTRY *playableGlDrawPixelsProc)(GLsizei,GLsizei,GLenum,GLenum,const GLvoid *);
typedef void (APIENTRY *playableGlClearColorProc)(GLclampf,GLclampf,GLclampf,GLclampf);
typedef void (APIENTRY *playableGlClearProc)(GLbitfield);
typedef BOOL (WINAPI *playableWglSwapIntervalProc)(int);
static playableWglCreateContextProc playableWglCreateContext;
static playableWglDeleteContextProc playableWglDeleteContext;
static playableWglMakeCurrentProc playableWglMakeCurrent;
static playableWglGetProcAddressProc playableWglGetProcAddress;
static playableGlGetStringProc playableGlGetString;
static playableGlViewportProc playableGlViewport;
static playableGlMatrixModeProc playableGlMatrixMode;
static playableGlLoadIdentityProc playableGlLoadIdentity;
static playableGlOrthoProc playableGlOrtho;
static playableGlRasterPos2iProc playableGlRasterPos2i;
static playableGlPixelZoomProc playableGlPixelZoom;
static playableGlPixelStoreiProc playableGlPixelStorei;
static playableGlDrawPixelsProc playableGlDrawPixels;
static playableGlClearColorProc playableGlClearColor;
static playableGlClearProc playableGlClear;
static playableWglSwapIntervalProc playableWglSwapInterval;

#define PLAYABLE_INPUT_EVENTS 256
#define PLAYABLE_INPUT_KEY 1
#define PLAYABLE_INPUT_CHAR 2
#define PLAYABLE_INPUT_MOUSE 3
#define PLAYABLE_K_MOUSE1 178
#define PLAYABLE_K_MWHEELDOWN 183
#define PLAYABLE_K_MWHEELUP 184
#define PLAYABLE_K_JOY1 185
#define PLAYABLE_K_AUX1 217
typedef struct playableInputEvent_s { int time, type, value, value2; } playableInputEvent;
static playableInputEvent inputEvents[PLAYABLE_INPUT_EVENTS];
static unsigned int inputEventHead;
static unsigned int inputEventTail;
static unsigned char inputKeyState[256];
static SRWLOCK inputLock = SRWLOCK_INIT;
static volatile LONG inputAppActive;
static volatile LONG inputMouseActive;
static int inputCursorHidden;
static int inputJoystickEnabled;
static int inputJoystickAvailable;
static UINT inputJoystickId;
static JOYCAPSW inputJoystickCaps;
static DWORD inputJoystickOldButtons;
static DWORD inputJoystickOldDirections;
static double inputJoystickThreshold = 0.15;
static double inputJoystickBallScale = 0.02;
static HMIDIIN inputMidiHandle;
static int inputMidiEnabled;
static int inputMidiDevice;
static int inputMidiChannel = 1;

#define PLAYABLE_TEXTURE_SLOTS 512
#define PLAYABLE_MAX_TEXTURE_SIZE 4096
#define PLAYABLE_MAX_MIP_LEVELS 13

typedef struct playableTexture_s {
    uint32_t *pixels;
    int width;
    int height;
    int widthMask;
    int heightMask;
    uint32_t *mipPixels[PLAYABLE_MAX_MIP_LEVELS - 1];
    int mipWidths[PLAYABLE_MAX_MIP_LEVELS - 1];
    int mipHeights[PLAYABLE_MAX_MIP_LEVELS - 1];
    int mipLevelCount;
} playableTexture;

static playableTexture textures[PLAYABLE_TEXTURE_SLOTS];
static int rasterBlendMode;
static int rasterDepthEqual;
static int rasterDepthWrite = 1;
static int rasterAlphaTest;
static int rasterClampTexture;
static int rasterPolygonOffset;
/* 1=increment front, 2=decrement back, 3=increment back, 4=decrement front. */
static int rasterStencilPass;
static double rasterDepthRangeScale = 1.0;
static double rasterDepthRangeNear = 1.0;
static __declspec(thread) int rasterClipMinimumX;
static __declspec(thread) int rasterClipMaximumX = INT_MAX;
static __declspec(thread) int rasterClipMinimumY;
static __declspec(thread) int rasterClipMaximumY = INT_MAX;
static __declspec(thread) int rasterVertexColorEnabled;
static __declspec(thread) int rasterVertexColorUniform;
static __declspec(thread) unsigned char rasterVertexColor[3][4];

/* Compact little-endian command consumed by the batch entry point. */
#define PLAYABLE_TRIANGLE_BATCH_RECORD_BYTES 128
#define PLAYABLE_TRIANGLE_BATCH_MAX_COUNT 65536
#ifndef PLAYABLE_RASTER_MAX_BANDS
#define PLAYABLE_RASTER_MAX_BANDS 6
#endif

typedef struct playableTriangleBatchRecord_s {
    int32_t baseTextureSlot;
    int32_t lightmapTextureSlot;
    int32_t fallbackRed;
    int32_t fallbackGreen;
    int32_t fallbackBlue;
    float vertex[3][8]; /* x, y, depth, base uv, lightmap uv, light */
    unsigned char vertexColor[3][4]; /* perspective-correct RGBA modulation */
} playableTriangleBatchRecord;

typedef char playableTriangleBatchRecordSizeMustBe128[
    sizeof(playableTriangleBatchRecord) == PLAYABLE_TRIANGLE_BATCH_RECORD_BYTES ? 1 : -1];

static void ensureTimer(void) {
    if (!timerFrequency.QuadPart) {
        QueryPerformanceFrequency(&timerFrequency);
        QueryPerformanceCounter(&timerStart);
    }
}

static int currentMilliseconds(void) {
    LARGE_INTEGER now;
    int64_t ticks;
    ensureTimer();
    QueryPerformanceCounter(&now);
    ticks = now.QuadPart - timerStart.QuadPart;
    return (int)((ticks * 1000) / timerFrequency.QuadPart);
}

/* Sys_QueEvent's 256-entry overwrite-oldest ownership rule, specialized to
 * native input. The UI thread is the producer and MiniLang is the consumer. */
static void queueInputEvent(int time, int type, int value, int value2) {
    unsigned int index;
    AcquireSRWLockExclusive(&inputLock);
    if (inputEventHead - inputEventTail >= PLAYABLE_INPUT_EVENTS) ++inputEventTail;
    index = inputEventHead & (PLAYABLE_INPUT_EVENTS - 1u);
    inputEvents[index].time = time;
    inputEvents[index].type = type;
    inputEvents[index].value = value;
    inputEvents[index].value2 = value2;
    ++inputEventHead;
    ReleaseSRWLockExclusive(&inputLock);
}

static void queueKeyTransition(int virtualKey, int down, int time) {
    unsigned int index;
    unsigned char state = (unsigned char)(down != 0);
    if ((unsigned)virtualKey > 255u) return;
    AcquireSRWLockExclusive(&inputLock);
    if (inputKeyState[virtualKey] == state) {
        ReleaseSRWLockExclusive(&inputLock);
        return;
    }
    inputKeyState[virtualKey] = state;
    if (inputEventHead - inputEventTail >= PLAYABLE_INPUT_EVENTS) ++inputEventTail;
    index = inputEventHead & (PLAYABLE_INPUT_EVENTS - 1u);
    inputEvents[index].time = time;
    inputEvents[index].type = PLAYABLE_INPUT_KEY;
    inputEvents[index].value = virtualKey;
    inputEvents[index].value2 = down != 0;
    ++inputEventHead;
    ReleaseSRWLockExclusive(&inputLock);
}

static void queueKeyboardEvent(int key, int down, int time) {
    unsigned int index;
    if ((unsigned)key > 255u) return;
    AcquireSRWLockExclusive(&inputLock);
    inputKeyState[key] = (unsigned char)(down != 0);
    if (inputEventHead - inputEventTail >= PLAYABLE_INPUT_EVENTS) ++inputEventTail;
    index = inputEventHead & (PLAYABLE_INPUT_EVENTS - 1u);
    inputEvents[index].time = time;
    inputEvents[index].type = PLAYABLE_INPUT_KEY;
    inputEvents[index].value = key;
    inputEvents[index].value2 = down != 0;
    ++inputEventHead;
    ReleaseSRWLockExclusive(&inputLock);
}

static void resetInputEvents(void) {
    AcquireSRWLockExclusive(&inputLock);
    inputEventHead = inputEventTail = 0;
    ZeroMemory(inputEvents, sizeof(inputEvents));
    ZeroMemory(inputKeyState, sizeof(inputKeyState));
    ReleaseSRWLockExclusive(&inputLock);
}

static int translateVirtualKey(WPARAM key, LPARAM flags) {
    int extended = (flags & (1L << 24)) != 0;
    if (key >= 'A' && key <= 'Z') return (int)key + ('a' - 'A');
    if (key >= VK_F1 && key <= VK_F15) return 145 + (int)(key - VK_F1);
    switch (key) {
        case VK_BACK: return 127;
        case VK_LWIN: case VK_RWIN: return 128;
        case VK_CAPITAL: return 129;
        case VK_SLEEP: return 130;
        case VK_PAUSE: return 131;
        case VK_UP: return extended ? 132 : 161;
        case VK_DOWN: return extended ? 133 : 167;
        case VK_LEFT: return extended ? 134 : 163;
        case VK_RIGHT: return extended ? 135 : 165;
        case VK_MENU: return 136;
        case VK_CONTROL: return 137;
        case VK_SHIFT: return 138;
        case VK_INSERT: return extended ? 139 : 170;
        case VK_DELETE: return extended ? 140 : 171;
        case VK_NEXT: return extended ? 141 : 168;
        case VK_PRIOR: return extended ? 142 : 162;
        case VK_HOME: return extended ? 143 : 160;
        case VK_END: return extended ? 144 : 166;
        case VK_RETURN: return extended ? 169 : 13;
        case VK_NUMPAD7: return 160;
        case VK_NUMPAD8: return 161;
        case VK_NUMPAD9: return 162;
        case VK_NUMPAD4: return 163;
        case VK_NUMPAD5: return 164;
        case VK_NUMPAD6: return 165;
        case VK_NUMPAD1: return 166;
        case VK_NUMPAD2: return 167;
        case VK_NUMPAD3: return 168;
        case VK_NUMPAD0: return 170;
        case VK_DECIMAL: return 171;
        case VK_DIVIDE: return 172;
        case VK_SUBTRACT: return 173;
        case VK_ADD: return 174;
        case VK_NUMLOCK: return 175;
        case VK_MULTIPLY: return 176;
        case VK_OEM_1: return ';';
        case VK_OEM_PLUS: return '=';
        case VK_OEM_COMMA: return ',';
        case VK_OEM_MINUS: return '-';
        case VK_OEM_PERIOD: return '.';
        case VK_OEM_2: return '/';
        case VK_OEM_3: return '`';
        case VK_OEM_4: return '[';
        case VK_OEM_5: return '\\';
        case VK_OEM_6: return ']';
        case VK_OEM_7: return '\'';
    }
    return (int)key;
}

static void releaseInputKeys(int time) {
    int key;
    for (key = 0; key < 256; ++key) if (inputKeyState[key]) queueKeyTransition(key, 0, time);
    inputJoystickOldButtons = 0;
    inputJoystickOldDirections = 0;
}

/* Raw Input is the modern buffered equivalent of the original DirectInput
 * mouse path. Capture and clipping retain the Win32 fallback's focus rules. */
static void activateMouseOnWindow(HWND hwnd) {
    RECT clip;
    POINT topLeft;
    POINT bottomRight;
    if (!hwnd || !InterlockedCompareExchange(&inputAppActive, 0, 0) ||
            InterlockedExchange(&inputMouseActive, 1)) return;
    SetCapture(hwnd);
    if (GetClientRect(hwnd, &clip)) {
        topLeft.x = clip.left; topLeft.y = clip.top;
        bottomRight.x = clip.right; bottomRight.y = clip.bottom;
        ClientToScreen(hwnd, &topLeft);
        ClientToScreen(hwnd, &bottomRight);
        clip.left = topLeft.x; clip.top = topLeft.y;
        clip.right = bottomRight.x; clip.bottom = bottomRight.y;
        ClipCursor(&clip);
        SetCursorPos((clip.left + clip.right) / 2, (clip.top + clip.bottom) / 2);
    }
    while (ShowCursor(FALSE) >= 0) inputCursorHidden = 1;
    haveMousePosition = 0;
}

static void deactivateMouseOnWindow(void) {
    if (!InterlockedExchange(&inputMouseActive, 0)) return;
    ClipCursor(0);
    if (GetCapture() == windowHandle) ReleaseCapture();
    if (inputCursorHidden) {
        while (ShowCursor(TRUE) < 0) { }
        inputCursorHidden = 0;
    }
    haveMousePosition = 0;
}

static double joystickAxis(int value) {
    double result = ((double)value - 32768.0) / 32768.0;
    if (result < -1.0) result = -1.0;
    if (result > 1.0) result = 1.0;
    return result;
}

static int joystickCentered(int value) { return value - 32768; }

static const int joystickDirectionKeys[16] = {
    134, 135, 132, 133,
    PLAYABLE_K_JOY1 + 15, PLAYABLE_K_JOY1 + 16,
    PLAYABLE_K_JOY1 + 17, PLAYABLE_K_JOY1 + 18,
    PLAYABLE_K_JOY1 + 19, PLAYABLE_K_JOY1 + 20,
    PLAYABLE_K_JOY1 + 21, PLAYABLE_K_JOY1 + 22,
    PLAYABLE_K_JOY1 + 23, PLAYABLE_K_JOY1 + 24,
    PLAYABLE_K_JOY1 + 25, PLAYABLE_K_JOY1 + 26
};

static void queueMidiNote(int note, int down, int time) {
    unsigned int index;
    int key = note - 60 + PLAYABLE_K_AUX1;
    if (key < PLAYABLE_K_AUX1 || key > 255) return;
    AcquireSRWLockExclusive(&inputLock);
    inputKeyState[key] = (unsigned char)(down != 0);
    if (inputEventHead - inputEventTail >= PLAYABLE_INPUT_EVENTS) ++inputEventTail;
    index = inputEventHead & (PLAYABLE_INPUT_EVENTS - 1u);
    inputEvents[index].time = time;
    inputEvents[index].type = PLAYABLE_INPUT_KEY;
    inputEvents[index].value = key;
    inputEvents[index].value2 = down != 0;
    ++inputEventHead;
    ReleaseSRWLockExclusive(&inputLock);
}

static void CALLBACK playableMidiCallback(HMIDIIN handle, UINT message,
        DWORD_PTR instance, DWORD_PTR parameter1, DWORD_PTR parameter2) {
    unsigned int packed;
    int status;
    int channel;
    int note;
    int velocity;
    (void)handle; (void)instance; (void)parameter2;
    if (message != MIM_DATA || !inputMidiEnabled) return;
    packed = (unsigned int)parameter1;
    status = packed & 0xff;
    channel = (status & 0x0f) + 1;
    if (channel != inputMidiChannel) return;
    note = (packed >> 8) & 0xff;
    velocity = (packed >> 16) & 0xff;
    if ((status & 0xf0) == 0x90) {
        if (!velocity) queueMidiNote(note, 0, currentMilliseconds());
        /* Preserve the original win_input.c zero-velocity NoteOn quirk. */
        queueMidiNote(note, 1, currentMilliseconds());
    } else if ((status & 0xf0) == 0x80) {
        queueMidiNote(note, 0, currentMilliseconds());
    }
}

static void shutdownMidi(void) {
    HMIDIIN handle = inputMidiHandle;
    inputMidiHandle = 0;
    if (handle) {
        midiInStop(handle);
        midiInReset(handle);
        midiInClose(handle);
    }
}

static int startupMidi(void) {
    UINT count;
    shutdownMidi();
    if (!inputMidiEnabled) return 1;
    count = midiInGetNumDevs();
    if (inputMidiDevice < 0 || (UINT)inputMidiDevice >= count) return 0;
    if (midiInOpen(&inputMidiHandle, (UINT)inputMidiDevice,
            (DWORD_PTR)playableMidiCallback, 0, CALLBACK_FUNCTION) != MMSYSERR_NOERROR) {
        inputMidiHandle = 0;
        return 0;
    }
    if (midiInStart(inputMidiHandle) != MMSYSERR_NOERROR) {
        shutdownMidi();
        return 0;
    }
    return 1;
}

static int startupJoystick(void) {
    UINT count;
    MMRESULT result = MMSYSERR_ERROR;
    ZeroMemory(&inputJoystickCaps, sizeof(inputJoystickCaps));
    inputJoystickAvailable = 0;
    inputJoystickOldButtons = inputJoystickOldDirections = 0;
    if (!inputJoystickEnabled) return 1;
    count = joyGetNumDevs();
    for (inputJoystickId = 0; inputJoystickId < count; ++inputJoystickId) {
        JOYINFOEX info;
        ZeroMemory(&info, sizeof(info));
        info.dwSize = sizeof(info); info.dwFlags = JOY_RETURNCENTERED;
        result = joyGetPosEx(inputJoystickId, &info);
        if (result == JOYERR_NOERROR) break;
    }
    if (result != JOYERR_NOERROR || inputJoystickId >= count) return 0;
    inputJoystickAvailable = joyGetDevCapsW(inputJoystickId, &inputJoystickCaps,
        sizeof(inputJoystickCaps)) == JOYERR_NOERROR;
    return inputJoystickAvailable;
}

static void pollJoystick(int time) {
    JOYINFOEX info;
    DWORD buttons;
    DWORD directions = 0;
    DWORD axis[4];
    unsigned int index;
    if (!inputJoystickEnabled || !inputJoystickAvailable) return;
    ZeroMemory(&info, sizeof(info));
    info.dwSize = sizeof(info); info.dwFlags = JOY_RETURNALL;
    if (joyGetPosEx(inputJoystickId, &info) != JOYERR_NOERROR) return;
    buttons = info.dwButtons;
    for (index = 0; index < inputJoystickCaps.wNumButtons && index < 32; ++index) {
        DWORD mask = 1u << index;
        if ((buttons ^ inputJoystickOldButtons) & mask)
            queueKeyTransition(PLAYABLE_K_JOY1 + (int)index, (buttons & mask) != 0, time);
    }
    inputJoystickOldButtons = buttons;
    axis[0] = info.dwXpos; axis[1] = info.dwYpos;
    axis[2] = info.dwZpos; axis[3] = info.dwRpos;
    for (index = 0; index < inputJoystickCaps.wNumAxes && index < 4; ++index) {
        double value = joystickAxis((int)axis[index]);
        if (value < -inputJoystickThreshold) directions |= 1u << (index * 2);
        else if (value > inputJoystickThreshold) directions |= 1u << (index * 2 + 1);
    }
    if ((inputJoystickCaps.wCaps & JOYCAPS_HASPOV) && info.dwPOV != JOY_POVCENTERED) {
        if (info.dwPOV == JOY_POVFORWARD) directions |= 1u << 12;
        if (info.dwPOV == JOY_POVBACKWARD) directions |= 1u << 13;
        if (info.dwPOV == JOY_POVRIGHT) directions |= 1u << 14;
        if (info.dwPOV == JOY_POVLEFT) directions |= 1u << 15;
    }
    for (index = 0; index < 16; ++index) {
        DWORD mask = 1u << index;
        if ((directions ^ inputJoystickOldDirections) & mask)
            queueKeyTransition(joystickDirectionKeys[index], (directions & mask) != 0, time);
    }
    inputJoystickOldDirections = directions;
    if (inputJoystickCaps.wNumAxes >= 6) {
        int x = (int)(joystickCentered((int)info.dwUpos) * inputJoystickBallScale);
        int y = (int)(joystickCentered((int)info.dwVpos) * inputJoystickBallScale);
        if (x || y) queueInputEvent(time, PLAYABLE_INPUT_MOUSE, x, y);
    }
}

static void copyGLString(char *destination, size_t capacity, const GLubyte *source) {
    size_t length;
    if (!destination || !capacity) return;
    destination[0] = '\0';
    if (!source) return;
    length = strlen((const char *)source);
    if (length >= capacity) length = capacity - 1;
    CopyMemory(destination, source, length);
    destination[length] = '\0';
}

static void shutdownOpenGL(void) {
    if (gammaRampChanged && windowDC) SetDeviceGammaRamp(windowDC, originalGammaRamp);
    gammaRampChanged = 0;
    if (playableWglMakeCurrent) playableWglMakeCurrent(0, 0);
    if (openGLContext && playableWglDeleteContext) playableWglDeleteContext(openGLContext);
    openGLContext = 0;
    openGLActive = 0;
    openGLPixelFormat = 0;
    gammaRampAvailable = 0;
    playableWglSwapInterval = 0;
    playableWglCreateContext = 0; playableWglDeleteContext = 0;
    playableWglMakeCurrent = 0; playableWglGetProcAddress = 0;
    playableGlGetString = 0; playableGlViewport = 0; playableGlMatrixMode = 0;
    playableGlLoadIdentity = 0; playableGlOrtho = 0; playableGlRasterPos2i = 0;
    playableGlPixelZoom = 0; playableGlPixelStorei = 0; playableGlDrawPixels = 0;
    playableGlClearColor = 0; playableGlClear = 0;
    if (openGLModule) FreeLibrary(openGLModule);
    openGLModule = 0;
    openGLExtensions[0] = openGLVendor[0] = openGLRenderer[0] = openGLVersion[0] = '\0';
}

static int initializeOpenGL(const wchar_t *driverName) {
    PIXELFORMATDESCRIPTOR requested;
    PIXELFORMATDESCRIPTOR selected;
    const char *swapExtensions[] = { "wglSwapIntervalEXT" };
    PROC swapProc;
    (void)swapExtensions;
    if (openGLActive) return 1;
    shutdownOpenGL();
    if (!windowHandle || !windowDC) return 0;
    openGLModule = LoadLibraryW(driverName && driverName[0] ? driverName : L"opengl32.dll");
    if (!openGLModule) return 0;
#pragma warning(push)
#pragma warning(disable:4191)
    playableWglCreateContext = (playableWglCreateContextProc)GetProcAddress(openGLModule,"wglCreateContext");
    playableWglDeleteContext = (playableWglDeleteContextProc)GetProcAddress(openGLModule,"wglDeleteContext");
    playableWglMakeCurrent = (playableWglMakeCurrentProc)GetProcAddress(openGLModule,"wglMakeCurrent");
    playableWglGetProcAddress = (playableWglGetProcAddressProc)GetProcAddress(openGLModule,"wglGetProcAddress");
    playableGlGetString = (playableGlGetStringProc)GetProcAddress(openGLModule,"glGetString");
    playableGlViewport = (playableGlViewportProc)GetProcAddress(openGLModule,"glViewport");
    playableGlMatrixMode = (playableGlMatrixModeProc)GetProcAddress(openGLModule,"glMatrixMode");
    playableGlLoadIdentity = (playableGlLoadIdentityProc)GetProcAddress(openGLModule,"glLoadIdentity");
    playableGlOrtho = (playableGlOrthoProc)GetProcAddress(openGLModule,"glOrtho");
    playableGlRasterPos2i = (playableGlRasterPos2iProc)GetProcAddress(openGLModule,"glRasterPos2i");
    playableGlPixelZoom = (playableGlPixelZoomProc)GetProcAddress(openGLModule,"glPixelZoom");
    playableGlPixelStorei = (playableGlPixelStoreiProc)GetProcAddress(openGLModule,"glPixelStorei");
    playableGlDrawPixels = (playableGlDrawPixelsProc)GetProcAddress(openGLModule,"glDrawPixels");
    playableGlClearColor = (playableGlClearColorProc)GetProcAddress(openGLModule,"glClearColor");
    playableGlClear = (playableGlClearProc)GetProcAddress(openGLModule,"glClear");
#pragma warning(pop)
    if (!playableWglCreateContext || !playableWglDeleteContext || !playableWglMakeCurrent ||
            !playableWglGetProcAddress || !playableGlGetString || !playableGlViewport ||
            !playableGlMatrixMode || !playableGlLoadIdentity || !playableGlOrtho ||
            !playableGlRasterPos2i || !playableGlPixelZoom || !playableGlPixelStorei ||
            !playableGlDrawPixels || !playableGlClearColor || !playableGlClear) {
        shutdownOpenGL(); return 0;
    }
    ZeroMemory(&requested, sizeof(requested));
    requested.nSize = sizeof(requested); requested.nVersion = 1;
    requested.dwFlags = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
    if (openGLStereo) requested.dwFlags |= PFD_STEREO;
    requested.iPixelType = PFD_TYPE_RGBA;
    requested.cColorBits = (BYTE)(openGLColorBits ? openGLColorBits : 24);
    requested.cDepthBits = (BYTE)(openGLDepthBits ? openGLDepthBits : 24);
    requested.cStencilBits = (BYTE)(openGLStencilBits ? openGLStencilBits : 8);
    requested.iLayerType = PFD_MAIN_PLANE;
    openGLPixelFormat = ChoosePixelFormat(windowDC, &requested);
    if (!openGLPixelFormat || !DescribePixelFormat(windowDC, openGLPixelFormat,
            sizeof(selected), &selected) || !SetPixelFormat(windowDC, openGLPixelFormat, &selected)) {
        shutdownOpenGL(); return 0;
    }
    openGLContext = playableWglCreateContext(windowDC);
    if (!openGLContext || !playableWglMakeCurrent(windowDC, openGLContext)) {
        shutdownOpenGL(); return 0;
    }
    openGLColorBits = selected.cColorBits;
    openGLDepthBits = selected.cDepthBits;
    openGLStencilBits = selected.cStencilBits;
    openGLStereo = (selected.dwFlags & PFD_STEREO) != 0;
    copyGLString(openGLVendor,sizeof(openGLVendor),playableGlGetString(GL_VENDOR));
    copyGLString(openGLRenderer,sizeof(openGLRenderer),playableGlGetString(GL_RENDERER));
    copyGLString(openGLVersion,sizeof(openGLVersion),playableGlGetString(GL_VERSION));
    copyGLString(openGLExtensions,sizeof(openGLExtensions),playableGlGetString(GL_EXTENSIONS));
#pragma warning(push)
#pragma warning(disable:4191)
    swapProc = playableWglGetProcAddress("wglSwapIntervalEXT");
    if (swapProc && swapProc != (PROC)1 && swapProc != (PROC)2 &&
            swapProc != (PROC)3 && swapProc != (PROC)-1)
        playableWglSwapInterval = (playableWglSwapIntervalProc)swapProc;
#pragma warning(pop)
    if (playableWglSwapInterval) playableWglSwapInterval(openGLSwapInterval);
    gammaRampAvailable = GetDeviceGammaRamp(windowDC, originalGammaRamp) != FALSE;
    openGLActive = 1;
    return 1;
}

static void restoreDisplayMode(void) {
    if (displayModeChanged) ChangeDisplaySettingsW(0, 0);
    displayModeChanged = 0;
}

static void releaseSurface(void) {
    if (pixels) {
        VirtualFree(pixels, 0, MEM_RELEASE);
        pixels = 0;
    }
    if (presentedPixels) {
        VirtualFree(presentedPixels, 0, MEM_RELEASE);
        presentedPixels = 0;
    }
    if (depthPixels) {
        VirtualFree(depthPixels, 0, MEM_RELEASE);
        depthPixels = 0;
    }
    if (stencilPixels) {
        VirtualFree(stencilPixels, 0, MEM_RELEASE);
        stencilPixels = 0;
    }
    surfaceWidth = 0;
    surfaceHeight = 0;
}

static int allocateSurface(int width, int height) {
    SIZE_T byteCount;
    releaseSurface();
    if (width < 1 || height < 1 || width > 16384 || height > 16384) return 0;
    byteCount = (SIZE_T)width * (SIZE_T)height * 4u;
    if (byteCount / 4u != (SIZE_T)width * (SIZE_T)height) return 0;
    pixels = (uint32_t *)VirtualAlloc(0, byteCount, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
    if (!pixels) return 0;
    presentedPixels = (uint32_t *)VirtualAlloc(0, byteCount, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
    if (!presentedPixels) {
        VirtualFree(pixels, 0, MEM_RELEASE);
        pixels = 0;
        return 0;
    }
    depthPixels = (float *)VirtualAlloc(0, byteCount, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
    if (!depthPixels) {
        VirtualFree(pixels, 0, MEM_RELEASE);
        VirtualFree(presentedPixels, 0, MEM_RELEASE);
        pixels = 0;
        presentedPixels = 0;
        return 0;
    }
    stencilPixels = (int32_t *)VirtualAlloc(0, byteCount, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
    if (!stencilPixels) {
        VirtualFree(pixels, 0, MEM_RELEASE);
        VirtualFree(presentedPixels, 0, MEM_RELEASE);
        VirtualFree(depthPixels, 0, MEM_RELEASE);
        pixels = 0;
        presentedPixels = 0;
        depthPixels = 0;
        return 0;
    }
    surfaceWidth = width;
    surfaceHeight = height;
    ZeroMemory(&bitmapInfo, sizeof(bitmapInfo));
    bitmapInfo.bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
    bitmapInfo.bmiHeader.biWidth = width;
    bitmapInfo.bmiHeader.biHeight = -height;
    bitmapInfo.bmiHeader.biPlanes = 1;
    bitmapInfo.bmiHeader.biBitCount = 32;
    bitmapInfo.bmiHeader.biCompression = BI_RGB;
    return 1;
}

static LRESULT CALLBACK playableWindowProc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam) {
    switch (message) {
        case WM_CLOSE:
            InterlockedExchange(&closeRequested, 1);
            ShowWindow(hwnd, SW_HIDE);
            return 0;
        case WM_APP + 1:
            deactivateMouseOnWindow();
            DestroyWindow(hwnd);
            return 0;
        case WM_APP + 2:
            if (wParam) activateMouseOnWindow(hwnd); else deactivateMouseOnWindow();
            return 0;
        case WM_DESTROY:
            if (windowDC) ReleaseDC(hwnd, windowDC);
            windowDC = 0;
            InterlockedExchange(&closeRequested, 1);
            windowHandle = 0;
            PostQuitMessage(0);
            return 0;
        case WM_KILLFOCUS:
            InterlockedExchange(&inputAppActive, 0);
            deactivateMouseOnWindow();
            releaseInputKeys(currentMilliseconds());
            haveMousePosition = 0;
            return 0;
        case WM_SETFOCUS:
            InterlockedExchange(&inputAppActive, 1);
            activateMouseOnWindow(hwnd);
            return 0;
        case WM_ACTIVATEAPP:
            InterlockedExchange(&inputAppActive, wParam != 0);
            if (wParam) activateMouseOnWindow(hwnd);
            else { deactivateMouseOnWindow(); releaseInputKeys(currentMilliseconds()); }
            return 0;
        case WM_KEYDOWN:
        case WM_SYSKEYDOWN:
            queueKeyboardEvent(translateVirtualKey(wParam, lParam), 1, currentMilliseconds());
            return 0;
        case WM_KEYUP:
        case WM_SYSKEYUP:
            queueKeyboardEvent(translateVirtualKey(wParam, lParam), 0, currentMilliseconds());
            return 0;
        /* win_wndproc.c queues WM_CHAR separately from the physical key so
         * TranslateMessage has already applied layout, Shift and Caps Lock. */
        case WM_CHAR:
            if ((unsigned int)wParam <= 255u)
                queueInputEvent(currentMilliseconds(), PLAYABLE_INPUT_CHAR, (int)wParam, 0);
            return 0;
        case WM_LBUTTONDOWN:
            queueKeyTransition(PLAYABLE_K_MOUSE1, 1, currentMilliseconds());
            return 0;
        case WM_LBUTTONUP:
            queueKeyTransition(PLAYABLE_K_MOUSE1, 0, currentMilliseconds());
            return 0;
        case WM_RBUTTONDOWN:
            queueKeyTransition(PLAYABLE_K_MOUSE1 + 1, 1, currentMilliseconds());
            return 0;
        case WM_RBUTTONUP:
            queueKeyTransition(PLAYABLE_K_MOUSE1 + 1, 0, currentMilliseconds());
            return 0;
        case WM_MBUTTONDOWN:
            queueKeyTransition(PLAYABLE_K_MOUSE1 + 2, 1, currentMilliseconds());
            return 0;
        case WM_MBUTTONUP:
            queueKeyTransition(PLAYABLE_K_MOUSE1 + 2, 0, currentMilliseconds());
            return 0;
        case WM_XBUTTONDOWN:
            queueKeyTransition(PLAYABLE_K_MOUSE1 + (GET_XBUTTON_WPARAM(wParam) == XBUTTON1 ? 3 : 4),
                1, currentMilliseconds());
            return TRUE;
        case WM_XBUTTONUP:
            queueKeyTransition(PLAYABLE_K_MOUSE1 + (GET_XBUTTON_WPARAM(wParam) == XBUTTON1 ? 3 : 4),
                0, currentMilliseconds());
            return TRUE;
        case WM_MOUSEWHEEL: {
            int delta = GET_WHEEL_DELTA_WPARAM(wParam);
            int key = delta > 0 ? PLAYABLE_K_MWHEELUP : PLAYABLE_K_MWHEELDOWN;
            int steps = delta < 0 ? -delta : delta;
            int now = currentMilliseconds();
            while (steps >= WHEEL_DELTA) {
                queueInputEvent(now, PLAYABLE_INPUT_KEY, key, 1);
                queueInputEvent(now, PLAYABLE_INPUT_KEY, key, 0);
                steps -= WHEEL_DELTA;
            }
            return 0;
        }
        case WM_MOUSEMOVE:
            if (!rawMouseEnabled && InterlockedCompareExchange(&inputMouseActive, 0, 0)) {
                int x = (int)(short)LOWORD(lParam);
                int y = (int)(short)HIWORD(lParam);
                RECT client;
                if (hwnd && GetClientRect(hwnd, &client)) {
                    POINT center;
                    int centerX = (client.right - client.left) / 2;
                    int centerY = (client.bottom - client.top) / 2;
                    int dx = x - centerX;
                    int dy = y - centerY;
                    InterlockedExchangeAdd(&mouseDX, dx);
                    InterlockedExchangeAdd(&mouseDY, dy);
                    if (dx || dy) queueInputEvent(currentMilliseconds(), PLAYABLE_INPUT_MOUSE, dx, dy);
                    center.x = centerX; center.y = centerY;
                    ClientToScreen(hwnd, &center);
                    if (dx || dy) SetCursorPos(center.x, center.y);
                } else if (haveMousePosition) {
                    int dx = x - lastMouseX;
                    int dy = y - lastMouseY;
                    InterlockedExchangeAdd(&mouseDX, dx);
                    InterlockedExchangeAdd(&mouseDY, dy);
                    if (dx || dy) queueInputEvent(currentMilliseconds(), PLAYABLE_INPUT_MOUSE, dx, dy);
                }
                lastMouseX = x;
                lastMouseY = y;
                haveMousePosition = 1;
            }
            return 0;
        case WM_INPUT: {
            RAWINPUT input;
            UINT size = sizeof(input);
            if (GetRawInputData((HRAWINPUT)lParam, RID_INPUT, &input, &size,
                    sizeof(RAWINPUTHEADER)) == size && input.header.dwType == RIM_TYPEMOUSE) {
                InterlockedExchangeAdd(&mouseDX, input.data.mouse.lLastX);
                InterlockedExchangeAdd(&mouseDY, input.data.mouse.lLastY);
                if (input.data.mouse.lLastX || input.data.mouse.lLastY)
                    queueInputEvent(currentMilliseconds(), PLAYABLE_INPUT_MOUSE,
                        input.data.mouse.lLastX, input.data.mouse.lLastY);
            }
            return 0;
        }
        case WM_ERASEBKGND:
            return 1;
        case WM_PAINT: {
            PAINTSTRUCT paint;
            RECT client;
            HDC dc = BeginPaint(hwnd, &paint);
            GetClientRect(hwnd, &client);
            AcquireSRWLockShared(&presentationLock);
            if (presentedPixels && !openGLActive) StretchDIBits(dc, 0, 0, client.right, client.bottom,
                0, 0, surfaceWidth, surfaceHeight, presentedPixels, &bitmapInfo,
                DIB_RGB_COLORS, SRCCOPY);
            ReleaseSRWLockShared(&presentationLock);
            EndPaint(hwnd, &paint);
            return 0;
        }
    }
    return DefWindowProcW(hwnd, message, wParam, lParam);
}

static DWORD WINAPI playableWindowThread(void *parameter) {
    static int classRegistered;
    WNDCLASSEXW wc;
    RECT rectangle;
    RAWINPUTDEVICE mouse;
    MSG message;
    HINSTANCE instance = GetModuleHandleW(0);
    int width = requestedWindowWidth;
    int height = requestedWindowHeight;
    DWORD style = WS_OVERLAPPEDWINDOW;
    (void)parameter;
    if (!classRegistered) {
        ZeroMemory(&wc, sizeof(wc));
        wc.cbSize = sizeof(wc);
        wc.style = CS_OWNDC;
        wc.lpfnWndProc = playableWindowProc;
        wc.hInstance = instance;
        wc.hCursor = LoadCursorW(0, MAKEINTRESOURCEW(32512));
        wc.hIcon = LoadIconW(0, MAKEINTRESOURCEW(32512));
        wc.lpszClassName = L"MiniQuake3PlayableWindow";
        if (!RegisterClassExW(&wc) && GetLastError() != ERROR_CLASS_ALREADY_EXISTS) {
            SetEvent(windowCreatedEvent);
            return 0;
        }
        classRegistered = 1;
    }
    if (requestedFullscreen) {
        DEVMODEW mode;
        ZeroMemory(&mode, sizeof(mode)); mode.dmSize = sizeof(mode);
        mode.dmPelsWidth = (DWORD)width; mode.dmPelsHeight = (DWORD)height;
        mode.dmBitsPerPel = (DWORD)(openGLColorBits ? openGLColorBits : 32);
        mode.dmFields = DM_PELSWIDTH | DM_PELSHEIGHT | DM_BITSPERPEL;
        if (requestedDisplayFrequency > 0) {
            mode.dmDisplayFrequency = (DWORD)requestedDisplayFrequency;
            mode.dmFields |= DM_DISPLAYFREQUENCY;
        }
        if (ChangeDisplaySettingsW(&mode, CDS_FULLSCREEN) == DISP_CHANGE_SUCCESSFUL) {
            displayModeChanged = 1;
            style = WS_POPUP;
        } else requestedFullscreen = 0;
    }
    rectangle.left = 0; rectangle.top = 0; rectangle.right = width; rectangle.bottom = height;
    if (!requestedFullscreen) AdjustWindowRect(&rectangle, style, FALSE);
    mouseDX = mouseDY = 0;
    InterlockedExchange(&inputAppActive, 0);
    InterlockedExchange(&inputMouseActive, 0);
    resetInputEvents();
    windowHandle = CreateWindowExW(0, L"MiniQuake3PlayableWindow", L"MiniQuake3 - playable preview",
        style, requestedFullscreen ? 0 : CW_USEDEFAULT, requestedFullscreen ? 0 : CW_USEDEFAULT,
        rectangle.right - rectangle.left, rectangle.bottom - rectangle.top,
        0, 0, instance, 0);
    if (!windowHandle) {
        restoreDisplayMode();
        SetEvent(windowCreatedEvent);
        return 0;
    }
    windowDC = GetDC(windowHandle);
    mouse.usUsagePage = 0x01;
    mouse.usUsage = 0x02;
    mouse.dwFlags = 0;
    mouse.hwndTarget = windowHandle;
    rawMouseEnabled = RegisterRawInputDevices(&mouse, 1, sizeof(mouse)) != FALSE;
    ensureTimer();
    ShowWindow(windowHandle, SW_SHOW);
    UpdateWindow(windowHandle);
    SetFocus(windowHandle);
    windowCreateSucceeded = 1;
    SetEvent(windowCreatedEvent);
    while (GetMessageW(&message, 0, 0, 0) > 0) {
        TranslateMessage(&message);
        DispatchMessageW(&message);
    }
    mouse.dwFlags = RIDEV_REMOVE;
    mouse.hwndTarget = 0;
    RegisterRawInputDevices(&mouse, 1, sizeof(mouse));
    rawMouseEnabled = 0;
    return 0;
}

PLAYABLE_API int playable_window_create(int width, int height) {
    DWORD threadId;
    if (windowHandle) return 1;
    if (windowThread) {
        if (WaitForSingleObject(windowThread, 0) == WAIT_TIMEOUT) return 0;
        CloseHandle(windowThread);
        windowThread = 0;
    }
    if (!allocateSurface(width, height)) return 0;
    windowCreatedEvent = CreateEventW(0, TRUE, FALSE, 0);
    if (!windowCreatedEvent) {
        releaseSurface();
        return 0;
    }
    requestedWindowWidth = width;
    requestedWindowHeight = height;
    windowCreateSucceeded = 0;
    InterlockedExchange(&closeRequested, 0);
    windowThread = CreateThread(0, 0, playableWindowThread, 0, 0, &threadId);
    if (!windowThread) {
        CloseHandle(windowCreatedEvent);
        windowCreatedEvent = 0;
        InterlockedExchange(&closeRequested, 1);
        releaseSurface();
        return 0;
    }
    WaitForSingleObject(windowCreatedEvent, INFINITE);
    CloseHandle(windowCreatedEvent);
    windowCreatedEvent = 0;
    if (!windowCreateSucceeded) {
        WaitForSingleObject(windowThread, INFINITE);
        CloseHandle(windowThread);
        windowThread = 0;
        InterlockedExchange(&closeRequested, 1);
        releaseSurface();
        return 0;
    }
    if (!openGLColorBits) openGLColorBits = 24;
    if (!openGLDepthBits) openGLDepthBits = 24;
    if (!openGLStencilBits) openGLStencilBits = 8;
    initializeOpenGL(requestedOpenGLDriver[0] ? requestedOpenGLDriver : L"opengl32.dll");
    return 1;
}

PLAYABLE_API int playable_window_gl_configure(const unsigned char *driver, int driverLength,
        int colorBits, int depthBits, int stencilBits, int stereo, int fullscreen,
        int displayFrequency, int swapInterval) {
    int converted;
    if (windowHandle || driverLength < 0 || driverLength >= MAX_PATH || colorBits < 0 ||
            depthBits < 0 || stencilBits < 0 || displayFrequency < 0) return 0;
    requestedOpenGLDriver[0] = L'\0';
    if (driverLength) {
        if (!driver) return 0;
        converted = MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS,
            (const char *)driver, driverLength, requestedOpenGLDriver, MAX_PATH - 1);
        if (converted < 1) return 0;
        requestedOpenGLDriver[converted] = L'\0';
    }
    openGLColorBits = colorBits ? colorBits : 24;
    openGLDepthBits = depthBits ? depthBits : 24;
    openGLStencilBits = stencilBits;
    openGLStereo = stereo != 0;
    requestedFullscreen = fullscreen != 0;
    requestedDisplayFrequency = displayFrequency;
    openGLSwapInterval = swapInterval;
    return 1;
}

PLAYABLE_API int playable_window_gl_available(void) { return openGLActive; }
PLAYABLE_API int playable_window_gl_pixel_format(void) { return openGLPixelFormat; }
PLAYABLE_API int playable_window_gl_color_bits(void) { return openGLColorBits; }
PLAYABLE_API int playable_window_gl_depth_bits(void) { return openGLDepthBits; }
PLAYABLE_API int playable_window_gl_stencil_bits(void) { return openGLStencilBits; }
PLAYABLE_API int playable_window_gl_stereo(void) { return openGLStereo; }
PLAYABLE_API int playable_window_gl_fullscreen(void) { return requestedFullscreen && displayModeChanged; }

PLAYABLE_API int playable_window_gl_info(int which, unsigned char *output, int capacity) {
    const char *source = "";
    size_t length;
    if (!output || capacity < 1) return -1;
    if (which == 0) source = openGLVendor;
    else if (which == 1) source = openGLRenderer;
    else if (which == 2) source = openGLVersion;
    else if (which == 3) source = openGLExtensions;
    else return -1;
    length = strlen(source);
    if (length >= (size_t)capacity) length = (size_t)capacity - 1;
    CopyMemory(output, source, length); output[length] = 0;
    return (int)length;
}

PLAYABLE_API int playable_window_gl_has_extension(const unsigned char *name, int length) {
    const char *at;
    char terminated[256];
    if (!name || length < 1 || length > 255 || !openGLActive) return 0;
    CopyMemory(terminated, name, (size_t)length); terminated[length] = '\0';
    at = openGLExtensions;
    while ((at = strstr(at, terminated)) != 0) {
        if ((at == openGLExtensions || at[-1] == ' ') &&
                (at[length] == '\0' || at[length] == ' ') &&
                strncmp(at, (const char *)name, (size_t)length) == 0) return 1;
        ++at;
    }
    return 0;
}

PLAYABLE_API int playable_window_gl_set_swap_interval(int interval) {
    openGLSwapInterval = interval;
    return playableWglSwapInterval ? playableWglSwapInterval(interval) != FALSE : interval == 0;
}

PLAYABLE_API int playable_window_gl_set_gamma(const unsigned char *red,
        const unsigned char *green, const unsigned char *blue, int count) {
    WORD ramp[3][256];
    int index;
    if (!gammaRampAvailable || !windowDC || !red || !green || !blue || count < 256) return 0;
    for (index = 0; index < 256; ++index) {
        ramp[0][index] = (WORD)((red[index] << 8) | red[index]);
        ramp[1][index] = (WORD)((green[index] << 8) | green[index]);
        ramp[2][index] = (WORD)((blue[index] << 8) | blue[index]);
    }
    if (!SetDeviceGammaRamp(windowDC, ramp)) return 0;
    gammaRampChanged = 1;
    return 1;
}

PLAYABLE_API void playable_window_gl_restore_gamma(void) {
    if (gammaRampChanged && windowDC) SetDeviceGammaRamp(windowDC, originalGammaRamp);
    gammaRampChanged = 0;
}

PLAYABLE_API void playable_window_gl_activate(int active) {
    if (!windowHandle) return;
    if (active) {
        ShowWindow(windowHandle, SW_RESTORE);
        SetForegroundWindow(windowHandle);
        SetFocus(windowHandle);
    } else ShowWindow(windowHandle, SW_MINIMIZE);
    playable_window_input_activate(active);
}

PLAYABLE_API void playable_window_poll(void) {
    /* The dedicated UI thread keeps the native window responsive even while
     * MiniLang is decoding a large retail asset on the caller thread. */
}

PLAYABLE_API int playable_window_should_close(void) { return InterlockedCompareExchange(&closeRequested, 0, 0) != 0; }

PLAYABLE_API int playable_window_set_title_utf8(const unsigned char *title, int length) {
    WCHAR wideTitle[256];
    int wideLength;
    int index;
    if (!windowHandle || !title || length < 1 || length > 255) return 0;
    for (index = 0; index < length; ++index) {
        if (!title[index]) return 0;
    }
    wideLength = MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS,
        (const char *)title, length, wideTitle, 255);
    if (wideLength < 1 || wideLength > 255) return 0;
    wideTitle[wideLength] = L'\0';
    return SetWindowTextW(windowHandle, wideTitle) != FALSE;
}

PLAYABLE_API int playable_window_key_down(int virtualKey) {
    if (!windowHandle || GetForegroundWindow() != windowHandle || virtualKey < 0 || virtualKey > 255) return 0;
    return (GetAsyncKeyState(virtualKey) & 0x8000) != 0;
}

PLAYABLE_API int playable_window_next_input_event(unsigned char *output, int capacity) {
    playableInputEvent event;
    if (!output || capacity < (int)sizeof(event)) return 0;
    AcquireSRWLockExclusive(&inputLock);
    if (inputEventHead == inputEventTail) {
        ReleaseSRWLockExclusive(&inputLock);
        return 0;
    }
    event = inputEvents[inputEventTail & (PLAYABLE_INPUT_EVENTS - 1u)];
    ++inputEventTail;
    ReleaseSRWLockExclusive(&inputLock);
    CopyMemory(output, &event, sizeof(event));
    return 1;
}

PLAYABLE_API int playable_window_consume_mouse_dx(void) {
    return (int)InterlockedExchange(&mouseDX, 0);
}

PLAYABLE_API int playable_window_consume_mouse_dy(void) {
    return (int)InterlockedExchange(&mouseDY, 0);
}

PLAYABLE_API int playable_window_milliseconds(void) {
    return currentMilliseconds();
}

PLAYABLE_API int playable_window_input_init(void) {
    resetInputEvents();
    InterlockedExchange(&mouseDX, 0);
    InterlockedExchange(&mouseDY, 0);
    startupJoystick();
    return startupMidi();
}

PLAYABLE_API void playable_window_input_activate(int active) {
    InterlockedExchange(&inputAppActive, active != 0);
    if (windowHandle) PostMessageW(windowHandle, WM_APP + 2, active != 0, 0);
    if (!active) releaseInputKeys(currentMilliseconds());
}

PLAYABLE_API void playable_window_input_frame(void) {
    pollJoystick(currentMilliseconds());
    if (!InterlockedCompareExchange(&inputAppActive, 0, 0) &&
            InterlockedCompareExchange(&inputMouseActive, 0, 0) && windowHandle)
        PostMessageW(windowHandle, WM_APP + 2, 0, 0);
}

PLAYABLE_API void playable_window_input_clear_states(void) {
    releaseInputKeys(currentMilliseconds());
    InterlockedExchange(&mouseDX, 0);
    InterlockedExchange(&mouseDY, 0);
    haveMousePosition = 0;
}

PLAYABLE_API int playable_window_input_configure_joystick(int enabled,
        double threshold, double ballScale) {
    inputJoystickEnabled = enabled != 0;
    if (threshold < 0.0) threshold = 0.0;
    if (threshold > 1.0) threshold = 1.0;
    inputJoystickThreshold = threshold;
    inputJoystickBallScale = ballScale;
    return startupJoystick();
}

PLAYABLE_API int playable_window_input_configure_midi(int enabled, int device, int channel) {
    inputMidiEnabled = enabled != 0;
    inputMidiDevice = device;
    inputMidiChannel = channel < 1 ? 1 : (channel > 16 ? 16 : channel);
    return startupMidi();
}

PLAYABLE_API int playable_window_input_joystick_available(void) {
    return inputJoystickEnabled && inputJoystickAvailable;
}

PLAYABLE_API int playable_window_input_midi_device_count(void) {
    return (int)midiInGetNumDevs();
}

static unsigned char colorByte(int value) {
    if (value < 0) return 0;
    if (value > 255) return 255;
    return (unsigned char)value;
}

static uint32_t makeColor(int red, int green, int blue) {
    return (uint32_t)colorByte(blue) | ((uint32_t)colorByte(green) << 8) |
        ((uint32_t)colorByte(red) << 16);
}

/* OpenGL maps normalized depth into glDepthRange(0, scale). This rasterizer
 * stores reciprocal eye depth, so the equivalent comparison value is
 * (1-scale)/zNear + scale/z. Attribute interpolation still uses the original
 * reciprocal depth, just as OpenGL keeps clip-space W unchanged. */
static double depthRangeInverse(double inverseDepth) {
    return (1.0 - rasterDepthRangeScale) / rasterDepthRangeNear +
        rasterDepthRangeScale * inverseDepth;
}

/* Baseq3 defaults r_offsetFactor to -1 and r_offsetUnits to -2. OpenGL adds
 * factor * max(|dz/dx|,|dz/dy|) + units * r to its conventional depth. This
 * rasterizer stores reciprocal depth with the opposite comparison direction,
 * so both terms become positive. A 24-bit depth unit matches the minimum
 * resolution of the depth buffer used by the original renderer. */
static double polygonOffsetInverse(double stepInverseDepthX, double stepInverseDepthY) {
    double slope = fabs(stepInverseDepthX);
    if (fabs(stepInverseDepthY) > slope) slope = fabs(stepInverseDepthY);
    return rasterDepthRangeScale * slope + 2.0 / 16777216.0;
}

static void clearDepth(double depth) {
    SIZE_T count = (SIZE_T)surfaceWidth * (SIZE_T)surfaceHeight;
    SIZE_T i;
    float value = (float)(1.0 / depth);
    if (!depthPixels) return;
    for (i = 0; i < count; ++i) depthPixels[i] = value;
}

PLAYABLE_API void playable_window_begin_frame(int red, int green, int blue) {
    uint32_t color = makeColor(red, green, blue) | 0xff000000u;
    SIZE_T count = (SIZE_T)surfaceWidth * (SIZE_T)surfaceHeight;
    SIZE_T i;
    if (!pixels) return;
    for (i = 0; i < count; ++i) pixels[i] = color;
    clearDepth(FLT_MAX);
    rasterBlendMode = 0;
    rasterDepthEqual = 0;
    rasterDepthWrite = 1;
    rasterAlphaTest = 0;
    rasterClampTexture = 0;
    rasterPolygonOffset = 0;
    rasterStencilPass = 0;
    rasterDepthRangeScale = 1.0;
    rasterDepthRangeNear = 1.0;
}

PLAYABLE_API int playable_window_clear_stencil(int x, int y, int width, int height) {
    int row;
    if (!stencilPixels || x < 0 || y < 0 || width < 1 || height < 1 ||
            x > surfaceWidth - width || y > surfaceHeight - height) return 0;
    for (row = y; row < y + height; ++row) {
        ZeroMemory(stencilPixels + (SIZE_T)row * (SIZE_T)surfaceWidth + (SIZE_T)x,
            (SIZE_T)width * sizeof(*stencilPixels));
    }
    return 1;
}

PLAYABLE_API int playable_window_set_stencil_pass(int pass) {
    if (pass < 0 || pass > 4) return 0;
    rasterStencilPass = pass;
    return 1;
}

PLAYABLE_API int playable_window_finish_stencil_shadow(int x, int y, int width, int height) {
    int row;
    int column;
    int darkened = 0;
    if (!pixels || !stencilPixels || x < 0 || y < 0 || width < 1 || height < 1 ||
            x > surfaceWidth - width || y > surfaceHeight - height) return -1;
    for (row = y; row < y + height; ++row) {
        SIZE_T offset = (SIZE_T)row * (SIZE_T)surfaceWidth + (SIZE_T)x;
        for (column = 0; column < width; ++column, ++offset) {
            uint32_t color;
            uint32_t red;
            uint32_t green;
            uint32_t blue;
            if (stencilPixels[offset] == 0) continue;
            color = pixels[offset];
            red = (((color >> 16) & 255u) * 153u + 127u) / 255u;
            green = (((color >> 8) & 255u) * 153u + 127u) / 255u;
            blue = ((color & 255u) * 153u + 127u) / 255u;
            pixels[offset] = (color & 0xff000000u) | (red << 16) | (green << 8) | blue;
            ++darkened;
        }
    }
    return darkened;
}

PLAYABLE_API void playable_window_clear_depth(double depth) {
    float value = (float)depth;
    if (!_finite(depth) || depth <= 0.0 || value <= 0.0f) depth = FLT_MAX;
    clearDepth(depth);
}

/* Return the positive eye-space distance represented by the software depth
 * buffer.  The renderer stores reciprocal depth so perspective-correct
 * interpolation and the greater-is-closer comparison stay cheap.  Flares
 * need the original distance for Baseq3's 24-unit visibility tolerance. */
PLAYABLE_API double playable_window_sample_depth(int x, int y) {
    float inverseDepth;
    SIZE_T offset;
    if (!depthPixels || x < 0 || y < 0 || x >= surfaceWidth || y >= surfaceHeight) {
        return -1.0;
    }
    offset = (SIZE_T)y * (SIZE_T)surfaceWidth + (SIZE_T)x;
    inverseDepth = depthPixels[offset];
    if (!_finite(inverseDepth) || inverseDepth <= 0.0f) return (double)FLT_MAX;
    return 1.0 / (double)inverseDepth;
}

static int uploadTexture(int slot, const unsigned char *rgba,
        int width, int height, int mipmapped) {
    playableTexture *texture;
    SIZE_T pixelCount;
    SIZE_T byteCount;
    SIZE_T i;
    uint32_t *copy;
    uint32_t *mipPixels[PLAYABLE_MAX_MIP_LEVELS - 1] = {0};
    int mipWidths[PLAYABLE_MAX_MIP_LEVELS - 1] = {0};
    int mipHeights[PLAYABLE_MAX_MIP_LEVELS - 1] = {0};
    int mipCount = 0;
    if (slot < 0 || slot >= PLAYABLE_TEXTURE_SLOTS || !rgba || width < 1 || height < 1 ||
            width > PLAYABLE_MAX_TEXTURE_SIZE || height > PLAYABLE_MAX_TEXTURE_SIZE) return 0;
    pixelCount = (SIZE_T)width * (SIZE_T)height;
    if (pixelCount / (SIZE_T)width != (SIZE_T)height) return 0;
    byteCount = pixelCount * sizeof(uint32_t);
    if (byteCount / sizeof(uint32_t) != pixelCount) return 0;
    copy = (uint32_t *)VirtualAlloc(0, byteCount, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
    if (!copy) return 0;
    for (i = 0; i < pixelCount; ++i) {
        SIZE_T source = i * 4u;
        copy[i] = makeColor((int)rgba[source], (int)rgba[source + 1u], (int)rgba[source + 2u]) |
            ((uint32_t)rgba[source + 3u] << 24);
    }
    {
        uint32_t *previous = copy;
        int previousWidth = width;
        int previousHeight = height;
        while (mipmapped && (previousWidth > 1 || previousHeight > 1) &&
                mipCount < PLAYABLE_MAX_MIP_LEVELS - 1) {
            int nextWidth = previousWidth > 1 ? previousWidth / 2 : 1;
            int nextHeight = previousHeight > 1 ? previousHeight / 2 : 1;
            SIZE_T nextCount = (SIZE_T)nextWidth * (SIZE_T)nextHeight;
            uint32_t *next = (uint32_t *)VirtualAlloc(0, nextCount * sizeof(uint32_t),
                MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
            int y;
            if (!next) {
                int level;
                VirtualFree(copy, 0, MEM_RELEASE);
                for (level = 0; level < mipCount; ++level)
                    VirtualFree(mipPixels[level], 0, MEM_RELEASE);
                return 0;
            }
            for (y = 0; y < nextHeight; ++y) {
                int x;
                int sy0 = y * 2;
                int sy1 = sy0 + 1 < previousHeight ? sy0 + 1 : sy0;
                for (x = 0; x < nextWidth; ++x) {
                    int sx0 = x * 2;
                    int sx1 = sx0 + 1 < previousWidth ? sx0 + 1 : sx0;
                    uint32_t values[4] = {
                        previous[(SIZE_T)sy0 * (SIZE_T)previousWidth + (SIZE_T)sx0],
                        previous[(SIZE_T)sy0 * (SIZE_T)previousWidth + (SIZE_T)sx1],
                        previous[(SIZE_T)sy1 * (SIZE_T)previousWidth + (SIZE_T)sx0],
                        previous[(SIZE_T)sy1 * (SIZE_T)previousWidth + (SIZE_T)sx1]
                    };
                    uint32_t color = 0u;
                    int shift;
                    for (shift = 0; shift <= 24; shift += 8) {
                        uint32_t sum = ((values[0] >> shift) & 255u) +
                            ((values[1] >> shift) & 255u) +
                            ((values[2] >> shift) & 255u) + ((values[3] >> shift) & 255u);
                        color |= ((sum + 2u) / 4u) << shift;
                    }
                    next[(SIZE_T)y * (SIZE_T)nextWidth + (SIZE_T)x] = color;
                }
            }
            mipPixels[mipCount] = next;mipWidths[mipCount] = nextWidth;
            mipHeights[mipCount] = nextHeight;mipCount++;
            previous = next;previousWidth = nextWidth;previousHeight = nextHeight;
        }
    }
    texture = &textures[slot];
    if (texture->pixels) {
        int level;
        VirtualFree(texture->pixels, 0, MEM_RELEASE);
        for (level = 1; level < texture->mipLevelCount; ++level)
            if (texture->mipPixels[level - 1]) VirtualFree(texture->mipPixels[level - 1], 0, MEM_RELEASE);
    }
    for (i = 0; i < PLAYABLE_MAX_MIP_LEVELS - 1; ++i) {
        texture->mipPixels[i] = 0;texture->mipWidths[i] = 0;texture->mipHeights[i] = 0;
    }
    texture->pixels = copy;
    texture->width = width;
    texture->height = height;
    texture->widthMask = (width & (width - 1)) == 0 ? width - 1 : -1;
    texture->heightMask = (height & (height - 1)) == 0 ? height - 1 : -1;
    texture->mipLevelCount = mipCount + 1;
    for (i = 0; i < (SIZE_T)mipCount; ++i) {
        texture->mipPixels[i] = mipPixels[i];texture->mipWidths[i] = mipWidths[i];
        texture->mipHeights[i] = mipHeights[i];
    }
    return 1;
}

PLAYABLE_API int playable_window_upload_texture(int slot, const unsigned char *rgba,
        int width, int height) {
    return uploadTexture(slot, rgba, width, height, 1);
}

PLAYABLE_API int playable_window_upload_texture_mipmapped(int slot,
        const unsigned char *rgba, int width, int height, int mipmapped) {
    if (mipmapped != 0 && mipmapped != 1) return 0;
    return uploadTexture(slot, rgba, width, height, mipmapped);
}

PLAYABLE_API void playable_window_release_texture(int slot) {
    playableTexture *texture;
    if (slot < 0 || slot >= PLAYABLE_TEXTURE_SLOTS) return;
    texture = &textures[slot];
    if (texture->pixels) {
        int level;
        VirtualFree(texture->pixels, 0, MEM_RELEASE);
        for (level = 1; level < texture->mipLevelCount; ++level) {
            if (texture->mipPixels[level - 1])
                VirtualFree(texture->mipPixels[level - 1], 0, MEM_RELEASE);
            texture->mipPixels[level - 1] = 0;
        }
    }
    texture->pixels = 0;
    texture->width = 0;
    texture->height = 0;
    texture->widthMask = -1;
    texture->heightMask = -1;
    texture->mipLevelCount = 0;
}

static double edgeValue(double ax, double ay, double bx, double by, double px, double py) {
    return (px - ax) * (by - ay) - (py - ay) * (bx - ax);
}

static int triangleScanlineSpan(double x0, double y0, double x1, double y1,
        double x2, double y2, int y, int minimumX, int maximumX,
        int *startX, int *endX) {
    double px[3];
    double scanY = (double)y + 0.5;
    double ax[3] = {x0, x1, x2};
    double ay[3] = {y0, y1, y2};
    int count = 0;
    int edge;
    for (edge = 0; edge < 3; ++edge) {
        int next = (edge + 1) % 3;
        double firstY = ay[edge];
        double secondY = ay[next];
        if ((firstY <= scanY && scanY < secondY) ||
                (secondY <= scanY && scanY < firstY)) {
            double fraction = (scanY - firstY) / (secondY - firstY);
            px[count++] = ax[edge] + fraction * (ax[next] - ax[edge]);
        }
    }
    if (count < 2) return 0;
    {
        double left = px[0];
        double right = px[0];
        int index;
        int first;
        int last;
        for (index = 1; index < count; ++index) {
            if (px[index] < left) left = px[index];
            if (px[index] > right) right = px[index];
        }
        first = (int)ceil(left - 0.5);
        last = (int)floor(right - 0.5);
        if (first < minimumX) first = minimumX;
        if (last > maximumX) last = maximumX;
        if (first > last) return 0;
        *startX = first;
        *endX = last;
    }
    return 1;
}

static int lowerPixel(double value) {
    double result = floor(value);
    if (result < -1048576.0) return -1048576;
    if (result > 1048576.0) return 1048576;
    return (int)result;
}

static int upperPixel(double value) {
    double result = ceil(value);
    if (result < -1048576.0) return -1048576;
    if (result > 1048576.0) return 1048576;
    return (int)result;
}

static uint32_t modulateColor(uint32_t color, double light) {
    int red;
    int green;
    int blue;
    if (light < 0.0) light = 0.0;
    red = (int)((double)((color >> 16) & 255u) * light + 0.5);
    green = (int)((double)((color >> 8) & 255u) * light + 0.5);
    blue = (int)((double)(color & 255u) * light + 0.5);
    return makeColor(red, green, blue) | (color & 0xff000000u);
}

static uint32_t modulateColorRgba(uint32_t color, double redFactor,
        double greenFactor, double blueFactor, double alphaFactor) {
    int red;
    int green;
    int blue;
    int alpha;
    if (redFactor < 0.0) redFactor = 0.0;if (redFactor > 1.0) redFactor = 1.0;
    if (greenFactor < 0.0) greenFactor = 0.0;if (greenFactor > 1.0) greenFactor = 1.0;
    if (blueFactor < 0.0) blueFactor = 0.0;if (blueFactor > 1.0) blueFactor = 1.0;
    if (alphaFactor < 0.0) alphaFactor = 0.0;if (alphaFactor > 1.0) alphaFactor = 1.0;
    red = (int)((double)((color >> 16) & 255u) * redFactor + 0.5);
    green = (int)((double)((color >> 8) & 255u) * greenFactor + 0.5);
    blue = (int)((double)(color & 255u) * blueFactor + 0.5);
    alpha = (int)((double)(color >> 24) * alphaFactor + 0.5);
    return ((uint32_t)alpha << 24) | ((uint32_t)red << 16) |
        ((uint32_t)green << 8) | (uint32_t)blue;
}

static void useBatchVertexColor(const playableTriangleBatchRecord *command) {
    int vertex;
    int channel;
    rasterVertexColorEnabled = 0;
    rasterVertexColorUniform = 1;
    for (vertex = 0; vertex < 3; ++vertex) {
        for (channel = 0; channel < 4; ++channel) {
            unsigned char value = command->vertexColor[vertex][channel];
            rasterVertexColor[vertex][channel] = value;
            if (value != 255u) rasterVertexColorEnabled = 1;
            if (vertex > 0 && value != rasterVertexColor[0][channel]) rasterVertexColorUniform = 0;
        }
    }
    if (!rasterVertexColorEnabled) rasterVertexColorUniform = 0;
}

static uint32_t modulateBatchVertexColor(uint32_t color,
        double b0, double b1, double b2,
        double inverseDepth0, double inverseDepth1, double inverseDepth2,
        double depth) {
    double redFactor;
    double greenFactor;
    double blueFactor;
    double alphaFactor;
    if (rasterVertexColorUniform) {
        redFactor = (double)rasterVertexColor[0][0] / 255.0;
        greenFactor = (double)rasterVertexColor[0][1] / 255.0;
        blueFactor = (double)rasterVertexColor[0][2] / 255.0;
        alphaFactor = (double)rasterVertexColor[0][3] / 255.0;
    } else {
        redFactor = (b0 * (double)rasterVertexColor[0][0] * inverseDepth0 + b1 * (double)rasterVertexColor[1][0] * inverseDepth1 + b2 * (double)rasterVertexColor[2][0] * inverseDepth2) * depth / 255.0;
        greenFactor = (b0 * (double)rasterVertexColor[0][1] * inverseDepth0 + b1 * (double)rasterVertexColor[1][1] * inverseDepth1 + b2 * (double)rasterVertexColor[2][1] * inverseDepth2) * depth / 255.0;
        blueFactor = (b0 * (double)rasterVertexColor[0][2] * inverseDepth0 + b1 * (double)rasterVertexColor[1][2] * inverseDepth1 + b2 * (double)rasterVertexColor[2][2] * inverseDepth2) * depth / 255.0;
        alphaFactor = (b0 * (double)rasterVertexColor[0][3] * inverseDepth0 + b1 * (double)rasterVertexColor[1][3] * inverseDepth1 + b2 * (double)rasterVertexColor[2][3] * inverseDepth2) * depth / 255.0;
    }
    return modulateColorRgba(color, redFactor, greenFactor, blueFactor, alphaFactor);
}

static uint32_t blendColor(uint32_t source, uint32_t destination) {
    uint32_t alpha = source >> 24;
    uint32_t destinationAlpha = destination >> 24;
    uint32_t inverse;
    uint32_t red;
    uint32_t green;
    uint32_t blue;
    uint32_t outputAlpha;
    if (alpha == 255u) return source;
    if (alpha == 0u) return destination;
    inverse = 255u - alpha;
    red = ((((source >> 16) & 255u) * alpha) + (((destination >> 16) & 255u) * inverse) + 127u) / 255u;
    green = ((((source >> 8) & 255u) * alpha) + (((destination >> 8) & 255u) * inverse) + 127u) / 255u;
    blue = (((source & 255u) * alpha) + ((destination & 255u) * inverse) + 127u) / 255u;
    outputAlpha = (alpha * alpha + destinationAlpha * inverse + 127u) / 255u;
    return (outputAlpha << 24) | (red << 16) | (green << 8) | blue;
}

static uint32_t addColor(uint32_t source, uint32_t destination) {
    uint32_t alpha = source >> 24;
    uint32_t outputAlpha = alpha + (destination >> 24);
    uint32_t red = ((source >> 16) & 255u) * alpha / 255u + ((destination >> 16) & 255u);
    uint32_t green = ((source >> 8) & 255u) * alpha / 255u + ((destination >> 8) & 255u);
    uint32_t blue = (source & 255u) * alpha / 255u + (destination & 255u);
    if (red > 255u) red = 255u;
    if (green > 255u) green = 255u;
    if (blue > 255u) blue = 255u;
    if (outputAlpha > 255u) outputAlpha = 255u;
    return (outputAlpha << 24) | (red << 16) | (green << 8) | blue;
}

static uint32_t filterColor(uint32_t source, uint32_t destination) {
    uint32_t alpha = ((source >> 24) * (destination >> 24) + 127u) / 255u;
    uint32_t red = (((source >> 16) & 255u) * ((destination >> 16) & 255u) + 127u) / 255u;
    uint32_t green = (((source >> 8) & 255u) * ((destination >> 8) & 255u) + 127u) / 255u;
    uint32_t blue = ((source & 255u) * (destination & 255u) + 127u) / 255u;
    return (alpha << 24) | (red << 16) | (green << 8) | blue;
}

static uint32_t destinationAlphaColor(uint32_t source, uint32_t destination) {
    uint32_t destinationAlpha = destination >> 24;
    uint32_t inverse = 255u - destinationAlpha;
    uint32_t red = ((destination >> 16) & 255u) * (((source >> 16) & 255u) + inverse);
    uint32_t green = ((destination >> 8) & 255u) * (((source >> 8) & 255u) + inverse);
    uint32_t blue = (destination & 255u) * ((source & 255u) + inverse);
    uint32_t alpha = destinationAlpha * ((source >> 24) + inverse);
    red = (red + 127u) / 255u;green = (green + 127u) / 255u;blue = (blue + 127u) / 255u;alpha = (alpha + 127u) / 255u;
    if (red>255u) red=255u;if (green>255u) green=255u;if (blue>255u) blue=255u;if (alpha>255u) alpha=255u;
    return (alpha << 24) | (red << 16) | (green << 8) | blue;
}

/* GLS_SRCBLEND_DST_COLOR | GLS_DSTBLEND_ONE, used by Baseq3's projected
 * dynamic-light pass. */
static uint32_t dynamicLightColor(uint32_t source, uint32_t destination) {
    uint32_t alpha = (destination >> 24) * ((source >> 24) + 255u);
    uint32_t red = ((destination >> 16) & 255u) * (((source >> 16) & 255u) + 255u);
    uint32_t green = ((destination >> 8) & 255u) * (((source >> 8) & 255u) + 255u);
    uint32_t blue = (destination & 255u) * ((source & 255u) + 255u);
    alpha = (alpha + 127u) / 255u;red = (red + 127u) / 255u;green = (green + 127u) / 255u;blue = (blue + 127u) / 255u;
    if (alpha>255u) alpha=255u;if (red>255u) red=255u;if (green>255u) green=255u;if (blue>255u) blue=255u;
    return (alpha << 24) | (red << 16) | (green << 8) | blue;
}

/* GLS_SRCBLEND_ZERO | GLS_DSTBLEND_ONE_MINUS_SRC_COLOR, used by the
 * monochrome Baseq3 impact-mark shaders. */
static uint32_t inverseSourceColor(uint32_t source, uint32_t destination) {
    uint32_t alpha = ((destination >> 24) * (255u - (source >> 24)) + 127u) / 255u;
    uint32_t red = (((destination >> 16) & 255u) * (255u - ((source >> 16) & 255u)) + 127u) / 255u;
    uint32_t green = (((destination >> 8) & 255u) * (255u - ((source >> 8) & 255u)) + 127u) / 255u;
    uint32_t blue = ((destination & 255u) * (255u - (source & 255u)) + 127u) / 255u;
    return (alpha << 24) | (red << 16) | (green << 8) | blue;
}

/* GLS_SRCBLEND_ONE | GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA. Baseq3 applies this
 * premultiplied-alpha policy to all four channels. */
static uint32_t premultipliedAlphaColor(uint32_t source, uint32_t destination) {
    uint32_t sourceAlpha = source >> 24;
    uint32_t inverse = 255u - sourceAlpha;
    uint32_t alpha = sourceAlpha + (((destination >> 24) * inverse + 127u) / 255u);
    uint32_t red = ((source >> 16) & 255u) + ((((destination >> 16) & 255u) * inverse + 127u) / 255u);
    uint32_t green = ((source >> 8) & 255u) + ((((destination >> 8) & 255u) * inverse + 127u) / 255u);
    uint32_t blue = (source & 255u) + (((destination & 255u) * inverse + 127u) / 255u);
    if (alpha > 255u) alpha = 255u;
    if (red > 255u) red = 255u;
    if (green > 255u) green = 255u;
    if (blue > 255u) blue = 255u;
    return (alpha << 24) | (red << 16) | (green << 8) | blue;
}

PLAYABLE_API int playable_window_set_raster_state(int blendMode, int depthEqual, int depthWrite) {
    if (blendMode < 0 || blendMode > 7 || (depthEqual != 0 && depthEqual != 1) ||
            (depthWrite != 0 && depthWrite != 1)) return 0;
    rasterBlendMode = blendMode;
    rasterDepthEqual = depthEqual;
    rasterDepthWrite = depthWrite;
    return 1;
}

/* Mirrors GLS_ATEST_GT_0, GLS_ATEST_LT_80 and GLS_ATEST_GE_80 after the
 * texture and vertex-light color calculations have produced fragment alpha. */
PLAYABLE_API int playable_window_set_alpha_test(int mode) {
    if (mode < 0 || mode > 3) return 0;
    rasterAlphaTest = mode;
    return 1;
}

PLAYABLE_API int playable_window_set_texture_clamp(int enabled) {
    if (enabled != 0 && enabled != 1) return 0;
    rasterClampTexture = enabled;
    return 1;
}

PLAYABLE_API int playable_window_set_polygon_offset(int enabled) {
    if (enabled != 0 && enabled != 1) return 0;
    rasterPolygonOffset = enabled;
    return 1;
}

static int alphaTestPasses(uint32_t color) {
    uint32_t alpha = color >> 24;
    if (rasterAlphaTest == 1) return alpha > 0u;
    if (rasterAlphaTest == 2) return alpha < 128u;
    if (rasterAlphaTest == 3) return alpha >= 128u;
    return 1;
}

PLAYABLE_API int playable_window_set_depth_range(double scale, double nearDistance) {
    if (!_finite(scale) || !_finite(nearDistance) || scale <= 0.0 || scale > 1.0 ||
            nearDistance <= 0.0) return 0;
    rasterDepthRangeScale = scale;
    rasterDepthRangeNear = nearDistance;
    return 1;
}

static playableTexture *textureAt(int slot) {
    if (slot < 0 || slot >= PLAYABLE_TEXTURE_SLOTS || !textures[slot].pixels) return 0;
    return &textures[slot];
}

static uint32_t lerpColor(uint32_t first, uint32_t second, unsigned int fraction) {
    unsigned int inverse = 256u - fraction;
    uint32_t redBlue = (((first & 0x00ff00ffu) * inverse +
        (second & 0x00ff00ffu) * fraction + 0x00800080u) >> 8) & 0x00ff00ffu;
    uint32_t alphaGreen = ((((first >> 8) & 0x00ff00ffu) * inverse +
        ((second >> 8) & 0x00ff00ffu) * fraction + 0x00800080u) >> 8) & 0x00ff00ffu;
    return redBlue | (alphaGreen << 8);
}

static uint32_t bilinearColor(uint32_t c00, uint32_t c10, uint32_t c01,
        uint32_t c11, unsigned int fractionX, unsigned int fractionY) {
    return lerpColor(lerpColor(c00, c10, fractionX),
        lerpColor(c01, c11, fractionX), fractionY);
}

static int mipLevelFor(const playableTexture *texture,
        double x0, double y0, double u0, double v0,
        double x1, double y1, double u1, double v1,
        double x2, double y2, double u2, double v2) {
    double determinant = (x1 - x0) * (y2 - y0) - (x2 - x0) * (y1 - y0);
    double duDx;
    double duDy;
    double dvDx;
    double dvDy;
    double rhoX;
    double rhoY;
    double rho;
    int level = 0;
    if (!texture || texture->mipLevelCount < 2 || fabs(determinant) < 0.0000001) return 0;
    duDx = ((u1 - u0) * (y2 - y0) - (u2 - u0) * (y1 - y0)) / determinant;
    duDy = ((x1 - x0) * (u2 - u0) - (x2 - x0) * (u1 - u0)) / determinant;
    dvDx = ((v1 - v0) * (y2 - y0) - (v2 - v0) * (y1 - y0)) / determinant;
    dvDy = ((x1 - x0) * (v2 - v0) - (x2 - x0) * (v1 - v0)) / determinant;
    rhoX = sqrt(duDx * duDx * (double)(texture->width * texture->width) +
        dvDx * dvDx * (double)(texture->height * texture->height));
    rhoY = sqrt(duDy * duDy * (double)(texture->width * texture->width) +
        dvDy * dvDy * (double)(texture->height * texture->height));
    rho = rhoX > rhoY ? rhoX : rhoY;
    while (rho > 1.5 && level + 1 < texture->mipLevelCount) { rho *= 0.5;level++; }
    return level;
}

typedef struct playableTextureView_s {
    const uint32_t *texels;
    int width;
    int height;
    int widthMask;
    int heightMask;
} playableTextureView;

static playableTextureView textureView(const playableTexture *texture, int level) {
    playableTextureView view;
    if (level >= texture->mipLevelCount) level = texture->mipLevelCount - 1;
    if (level > 0) {
        view.texels = texture->mipPixels[level - 1];
        view.width = texture->mipWidths[level - 1];
        view.height = texture->mipHeights[level - 1];
        view.widthMask = (view.width & (view.width - 1)) == 0 ? view.width - 1 : -1;
        view.heightMask = (view.height & (view.height - 1)) == 0 ? view.height - 1 : -1;
    } else {
        view.texels = texture->pixels;
        view.width = texture->width;
        view.height = texture->height;
        view.widthMask = texture->widthMask;
        view.heightMask = texture->heightMask;
    }
    return view;
}

static uint32_t sampleTextureView(const playableTextureView *view, double u, double v) {
    const uint32_t *texels = view->texels;
    int width = view->width;
    int height = view->height;
    int widthMask = view->widthMask;
    int heightMask = view->heightMask;
    double x;
    double y;
    x = u * (double)width - 0.5;
    y = v * (double)height - 0.5;
    double floorX = floor(x);
    double floorY = floor(y);
    int x0 = (int)floorX;
    int y0 = (int)floorY;
    int x1;
    int y1;
    unsigned int fractionX = (unsigned int)((x - floorX) * 256.0);
    unsigned int fractionY = (unsigned int)((y - floorY) * 256.0);
    if (width == 1 && height == 1) return texels[0];
    if (rasterClampTexture) {
        x1 = x0 + 1;y1 = y0 + 1;
        if (x0 < 0) x0 = 0;else if (x0 >= width) x0 = width - 1;
        if (y0 < 0) y0 = 0;else if (y0 >= height) y0 = height - 1;
        if (x1 < 0) x1 = 0;else if (x1 >= width) x1 = width - 1;
        if (y1 < 0) y1 = 0;else if (y1 >= height) y1 = height - 1;
    } else {
        if (widthMask >= 0) x0 &= widthMask;
        else { x0 %= width;if (x0 < 0) x0 += width; }
        if (heightMask >= 0) y0 &= heightMask;
        else { y0 %= height;if (y0 < 0) y0 += height; }
        x1 = x0 + 1;if (x1 == width) x1 = 0;
        y1 = y0 + 1;if (y1 == height) y1 = 0;
    }
    SIZE_T row0 = (SIZE_T)y0 * (SIZE_T)width;
    SIZE_T row1 = (SIZE_T)y1 * (SIZE_T)width;
    return bilinearColor(texels[row0 + (SIZE_T)x0], texels[row0 + (SIZE_T)x1],
        texels[row1 + (SIZE_T)x0], texels[row1 + (SIZE_T)x1], fractionX, fractionY);
}

static uint32_t multiplyTextures(uint32_t base, uint32_t lightmap) {
    uint32_t red = (((base >> 16) & 255u) * ((lightmap >> 16) & 255u) + 127u) / 255u;
    uint32_t green = (((base >> 8) & 255u) * ((lightmap >> 8) & 255u) + 127u) / 255u;
    uint32_t blue = ((base & 255u) * (lightmap & 255u) + 127u) / 255u;
    return (base & 0xff000000u) | (red << 16) | (green << 8) | blue;
}

PLAYABLE_API void playable_window_draw_triangle(int textureSlot,
        double x0, double y0, double depth0, double u0, double v0, double light0,
        double x1, double y1, double depth1, double u1, double v1, double light1,
        double x2, double y2, double depth2, double u2, double v2, double light2,
        int fallbackRed, int fallbackGreen, int fallbackBlue) {
    double area;
    double inverseDepth0;
    double inverseDepth1;
    double inverseDepth2;
    double inverseArea;
    double rowB0;
    double rowB1;
    double stepB0X;
    double stepB0Y;
    double stepB1X;
    double stepB1Y;
    double rowInverseDepth;
    double stepInverseDepthX;
    double stepInverseDepthY;
    double rowLightOverDepth;
    double stepLightOverDepthX;
    double stepLightOverDepthY;
    double rowUOverDepth;
    double stepUOverDepthX;
    double stepUOverDepthY;
    double rowVOverDepth;
    double stepVOverDepthX;
    double stepVOverDepthY;
    int minimumX;
    int maximumX;
    int minimumY;
    int maximumY;
    int constantDepth;
    int unitLight;
    double constantDepthScale;
    int x;
    int y;
    int textureMipLevel = 0;
    playableTexture *texture = 0;
    playableTextureView sampler;
    uint32_t fallback = makeColor(fallbackRed, fallbackGreen, fallbackBlue) | 0xff000000u;
    if (!pixels || !depthPixels || !_finite(x0) || !_finite(y0) || !_finite(depth0) ||
            !_finite(x1) || !_finite(y1) || !_finite(depth1) || !_finite(x2) ||
            !_finite(y2) || !_finite(depth2) || depth0 <= 0.0 || depth1 <= 0.0 || depth2 <= 0.0) return;
    area = edgeValue(x0, y0, x1, y1, x2, y2);
    if (!_finite(area) || area == 0.0) return;
    if ((rasterStencilPass == 1 || rasterStencilPass == 4) && area < 0.0) return;
    if ((rasterStencilPass == 2 || rasterStencilPass == 3) && area > 0.0) return;
    inverseArea = 1.0 / area;
    inverseDepth0 = 1.0 / depth0;
    inverseDepth1 = 1.0 / depth1;
    inverseDepth2 = 1.0 / depth2;
    constantDepth = depth0 == depth1 && depth1 == depth2;
    unitLight = light0 == 1.0 && light1 == 1.0 && light2 == 1.0;
    constantDepthScale = constantDepth ? 1.0 / inverseDepth0 : 0.0;
    minimumX = lowerPixel(min(x0, min(x1, x2)));
    maximumX = upperPixel(max(x0, max(x1, x2)));
    minimumY = lowerPixel(min(y0, min(y1, y2)));
    maximumY = upperPixel(max(y0, max(y1, y2)));
    if (minimumX < 0) minimumX = 0;
    if (minimumY < 0) minimumY = 0;
    if (maximumX >= surfaceWidth) maximumX = surfaceWidth - 1;
    if (maximumY >= surfaceHeight) maximumY = surfaceHeight - 1;
    if (minimumX < rasterClipMinimumX) minimumX = rasterClipMinimumX;
    if (maximumX > rasterClipMaximumX) maximumX = rasterClipMaximumX;
    if (minimumY < rasterClipMinimumY) minimumY = rasterClipMinimumY;
    if (maximumY > rasterClipMaximumY) maximumY = rasterClipMaximumY;
    if (minimumX > maximumX || minimumY > maximumY) return;
    texture = textureAt(textureSlot);
    textureMipLevel = mipLevelFor(texture,x0,y0,u0,v0,x1,y1,u1,v1,x2,y2,u2,v2);
    if (texture) sampler = textureView(texture, textureMipLevel);
    rowB0 = edgeValue(x1, y1, x2, y2, (double)minimumX + 0.5, (double)minimumY + 0.5) * inverseArea;
    rowB1 = edgeValue(x2, y2, x0, y0, (double)minimumX + 0.5, (double)minimumY + 0.5) * inverseArea;
    stepB0X = (y2 - y1) * inverseArea;
    stepB0Y = (x1 - x2) * inverseArea;
    stepB1X = (y0 - y2) * inverseArea;
    stepB1Y = (x2 - x0) * inverseArea;
    {
        double inverseDepthDelta0 = inverseDepth0 - inverseDepth2;
        double inverseDepthDelta1 = inverseDepth1 - inverseDepth2;
        double lightOverDepth0 = light0 * inverseDepth0;
        double lightOverDepth1 = light1 * inverseDepth1;
        double lightOverDepth2 = light2 * inverseDepth2;
        double uOverDepth0 = u0 * inverseDepth0;
        double uOverDepth1 = u1 * inverseDepth1;
        double uOverDepth2 = u2 * inverseDepth2;
        double vOverDepth0 = v0 * inverseDepth0;
        double vOverDepth1 = v1 * inverseDepth1;
        double vOverDepth2 = v2 * inverseDepth2;
        rowInverseDepth = inverseDepth2 + rowB0 * inverseDepthDelta0 + rowB1 * inverseDepthDelta1;
        stepInverseDepthX = stepB0X * inverseDepthDelta0 + stepB1X * inverseDepthDelta1;
        stepInverseDepthY = stepB0Y * inverseDepthDelta0 + stepB1Y * inverseDepthDelta1;
        rowLightOverDepth = lightOverDepth2 + rowB0 * (lightOverDepth0 - lightOverDepth2) +
            rowB1 * (lightOverDepth1 - lightOverDepth2);
        stepLightOverDepthX = stepB0X * (lightOverDepth0 - lightOverDepth2) +
            stepB1X * (lightOverDepth1 - lightOverDepth2);
        stepLightOverDepthY = stepB0Y * (lightOverDepth0 - lightOverDepth2) +
            stepB1Y * (lightOverDepth1 - lightOverDepth2);
        rowUOverDepth = uOverDepth2 + rowB0 * (uOverDepth0 - uOverDepth2) +
            rowB1 * (uOverDepth1 - uOverDepth2);
        stepUOverDepthX = stepB0X * (uOverDepth0 - uOverDepth2) +
            stepB1X * (uOverDepth1 - uOverDepth2);
        stepUOverDepthY = stepB0Y * (uOverDepth0 - uOverDepth2) +
            stepB1Y * (uOverDepth1 - uOverDepth2);
        rowVOverDepth = vOverDepth2 + rowB0 * (vOverDepth0 - vOverDepth2) +
            rowB1 * (vOverDepth1 - vOverDepth2);
        stepVOverDepthX = stepB0X * (vOverDepth0 - vOverDepth2) +
            stepB1X * (vOverDepth1 - vOverDepth2);
        stepVOverDepthY = stepB0Y * (vOverDepth0 - vOverDepth2) +
            stepB1Y * (vOverDepth1 - vOverDepth2);
    }
    for (y = minimumY; y <= maximumY; ++y) {
        int startX;
        int endX;
        double nextB0;
        double nextB1;
        double nextInverseDepth;
        double nextLightOverDepth;
        double nextUOverDepth;
        double nextVOverDepth;
        if (!triangleScanlineSpan(x0, y0, x1, y1, x2, y2, y, minimumX, maximumX, &startX, &endX)) {
            rowB0 += stepB0Y;
            rowB1 += stepB1Y;
            rowInverseDepth += stepInverseDepthY;
            rowLightOverDepth += stepLightOverDepthY;
            rowUOverDepth += stepUOverDepthY;
            rowVOverDepth += stepVOverDepthY;
            continue;
        }
        nextB0 = rowB0 + (double)(startX - minimumX) * stepB0X;
        nextB1 = rowB1 + (double)(startX - minimumX) * stepB1X;
        nextInverseDepth = rowInverseDepth + (double)(startX - minimumX) * stepInverseDepthX;
        nextLightOverDepth = rowLightOverDepth + (double)(startX - minimumX) * stepLightOverDepthX;
        nextUOverDepth = rowUOverDepth + (double)(startX - minimumX) * stepUOverDepthX;
        nextVOverDepth = rowVOverDepth + (double)(startX - minimumX) * stepVOverDepthX;
        for (x = startX; x <= endX; ++x) {
            double b0 = nextB0;
            double b1 = nextB1;
            double b2 = 1.0 - b0 - b1;
            double inverseDepth = nextInverseDepth;
            double comparisonDepth;
            double lightOverDepth = nextLightOverDepth;
            double uOverDepth = nextUOverDepth;
            double vOverDepth = nextVOverDepth;
            double depth;
            double light;
            uint32_t color;
            SIZE_T offset;
            nextB0 += stepB0X;
            nextB1 += stepB1X;
            nextInverseDepth += stepInverseDepthX;
            nextLightOverDepth += stepLightOverDepthX;
            nextUOverDepth += stepUOverDepthX;
            nextVOverDepth += stepVOverDepthX;
            if (b0 < 0.0 || b1 < 0.0 || b2 < 0.0) continue;
            if (inverseDepth <= 0.0) continue;
            comparisonDepth = depthRangeInverse(inverseDepth);
            if (rasterPolygonOffset) comparisonDepth +=
                polygonOffsetInverse(stepInverseDepthX, stepInverseDepthY);
            offset = (SIZE_T)y * (SIZE_T)surfaceWidth + (SIZE_T)x;
            if (rasterDepthEqual) {
                double difference = comparisonDepth - (double)depthPixels[offset];
                double tolerance = fabs(comparisonDepth) * 0.00001 + 0.0000001;
                if (difference < -tolerance || difference > tolerance) continue;
            } else if (comparisonDepth <= (double)depthPixels[offset]) continue;
            if (rasterStencilPass != 0) {
                if (rasterStencilPass == 1 || rasterStencilPass == 3) {
                    /* GL_INCR/GL_DECR saturate at the unsigned stencil range;
                     * they do not wrap and DECR at a cleared pixel stays 0. */
                    if (stencilPixels[offset] < 255) ++stencilPixels[offset];
                } else if (stencilPixels[offset] > 0) --stencilPixels[offset];
                continue;
            }
            depth = constantDepth ? constantDepthScale : 1.0 / inverseDepth;
            light = unitLight ? 1.0 : lightOverDepth * depth;
            color = fallback;
            if (texture) {
                double u = uOverDepth * depth;
                double v = vOverDepth * depth;
                color = sampleTextureView(&sampler, u, v);
            }
            if (!unitLight) color = modulateColor(color, light);
            if (rasterVertexColorEnabled) {
                color = modulateBatchVertexColor(color, b0, b1, b2,
                    inverseDepth0, inverseDepth1, inverseDepth2, depth);
            }
            if (!alphaTestPasses(color) || (color >> 24) == 0u) continue;
            if (rasterBlendMode == 0) pixels[offset] = color;
            else if (rasterBlendMode == 7) pixels[offset] = premultipliedAlphaColor(color, pixels[offset]);
            else if (rasterBlendMode == 6) pixels[offset] = inverseSourceColor(color, pixels[offset]);
            else if (rasterBlendMode == 5) pixels[offset] = dynamicLightColor(color, pixels[offset]);
            else if (rasterBlendMode == 4) pixels[offset] = destinationAlphaColor(color, pixels[offset]);
            else if (rasterBlendMode == 3) pixels[offset] = filterColor(color, pixels[offset]);
            else if (rasterBlendMode == 2) pixels[offset] = addColor(color, pixels[offset]);
            else if (rasterBlendMode == 1) pixels[offset] = blendColor(color, pixels[offset]);
            else pixels[offset] = color;
            if (rasterDepthWrite) depthPixels[offset] = (float)comparisonDepth;
        }
        rowB0 += stepB0Y;
        rowB1 += stepB1Y;
        rowInverseDepth += stepInverseDepthY;
        rowLightOverDepth += stepLightOverDepthY;
        rowUOverDepth += stepUOverDepthY;
        rowVOverDepth += stepVOverDepthY;
    }
}

PLAYABLE_API void playable_window_draw_triangle_colored(int textureSlot,
        double x0, double y0, double depth0, double u0, double v0,
        double x1, double y1, double depth1, double u1, double v1,
        double x2, double y2, double depth2, double u2, double v2,
        int red0, int green0, int blue0, int alpha0,
        int red1, int green1, int blue1, int alpha1,
        int red2, int green2, int blue2, int alpha2,
        int fallbackRed, int fallbackGreen, int fallbackBlue) {
    int colors[3][4] = {
        {red0, green0, blue0, alpha0},
        {red1, green1, blue1, alpha1},
        {red2, green2, blue2, alpha2}
    };
    int vertex;
    int channel;
    rasterVertexColorEnabled = 0;
    rasterVertexColorUniform = 1;
    for (vertex = 0; vertex < 3; ++vertex) {
        for (channel = 0; channel < 4; ++channel) {
            int value = colors[vertex][channel];
            if (value < 0) value = 0;
            if (value > 255) value = 255;
            rasterVertexColor[vertex][channel] = (unsigned char)value;
            if (value != 255) rasterVertexColorEnabled = 1;
            if (vertex > 0 && rasterVertexColor[vertex][channel] !=
                    rasterVertexColor[0][channel]) rasterVertexColorUniform = 0;
        }
    }
    if (!rasterVertexColorEnabled) rasterVertexColorUniform = 0;
    playable_window_draw_triangle(textureSlot,
        x0, y0, depth0, u0, v0, 1.0,
        x1, y1, depth1, u1, v1, 1.0,
        x2, y2, depth2, u2, v2, 1.0,
        fallbackRed, fallbackGreen, fallbackBlue);
    rasterVertexColorEnabled = 0;
    rasterVertexColorUniform = 0;
}

PLAYABLE_API void playable_window_draw_triangle_multitexture(int baseTextureSlot,
        int lightmapTextureSlot,
        double x0, double y0, double depth0, double u0, double v0, double lu0, double lv0, double light0,
        double x1, double y1, double depth1, double u1, double v1, double lu1, double lv1, double light1,
        double x2, double y2, double depth2, double u2, double v2, double lu2, double lv2, double light2,
        int fallbackRed, int fallbackGreen, int fallbackBlue) {
    double area;
    double inverseDepth0;
    double inverseDepth1;
    double inverseDepth2;
    double inverseArea;
    double rowB0;
    double rowB1;
    double stepB0X;
    double stepB0Y;
    double stepB1X;
    double stepB1Y;
    double rowInverseDepth;
    double stepInverseDepthX;
    double stepInverseDepthY;
    double rowLightOverDepth;
    double stepLightOverDepthX;
    double stepLightOverDepthY;
    double rowUOverDepth;
    double stepUOverDepthX;
    double stepUOverDepthY;
    double rowVOverDepth;
    double stepVOverDepthX;
    double stepVOverDepthY;
    double rowLuOverDepth;
    double stepLuOverDepthX;
    double stepLuOverDepthY;
    double rowLvOverDepth;
    double stepLvOverDepthX;
    double stepLvOverDepthY;
    int minimumX;
    int maximumX;
    int minimumY;
    int maximumY;
    int unitLight;
    int x;
    int y;
    playableTexture *baseTexture = textureAt(baseTextureSlot);
    playableTexture *lightmapTexture = textureAt(lightmapTextureSlot);
    playableTextureView baseSampler;
    playableTextureView lightmapSampler;
    int baseMipLevel = mipLevelFor(baseTexture,x0,y0,u0,v0,x1,y1,u1,v1,x2,y2,u2,v2);
    int lightmapMipLevel = mipLevelFor(lightmapTexture,x0,y0,lu0,lv0,x1,y1,lu1,lv1,x2,y2,lu2,lv2);
    uint32_t fallback = makeColor(fallbackRed, fallbackGreen, fallbackBlue) | 0xff000000u;
    if (!pixels || !depthPixels || !_finite(x0) || !_finite(y0) || !_finite(depth0) ||
            !_finite(x1) || !_finite(y1) || !_finite(depth1) || !_finite(x2) ||
            !_finite(y2) || !_finite(depth2) || depth0 <= 0.0 || depth1 <= 0.0 || depth2 <= 0.0) return;
    area = edgeValue(x0, y0, x1, y1, x2, y2);
    if (!_finite(area) || area == 0.0) return;
    inverseArea = 1.0 / area;
    inverseDepth0 = 1.0 / depth0;
    inverseDepth1 = 1.0 / depth1;
    inverseDepth2 = 1.0 / depth2;
    unitLight = light0 == 1.0 && light1 == 1.0 && light2 == 1.0;
    minimumX = lowerPixel(min(x0, min(x1, x2)));
    maximumX = upperPixel(max(x0, max(x1, x2)));
    minimumY = lowerPixel(min(y0, min(y1, y2)));
    maximumY = upperPixel(max(y0, max(y1, y2)));
    if (minimumX < 0) minimumX = 0;
    if (minimumY < 0) minimumY = 0;
    if (maximumX >= surfaceWidth) maximumX = surfaceWidth - 1;
    if (maximumY >= surfaceHeight) maximumY = surfaceHeight - 1;
    if (minimumX < rasterClipMinimumX) minimumX = rasterClipMinimumX;
    if (maximumX > rasterClipMaximumX) maximumX = rasterClipMaximumX;
    if (minimumY < rasterClipMinimumY) minimumY = rasterClipMinimumY;
    if (maximumY > rasterClipMaximumY) maximumY = rasterClipMaximumY;
    if (minimumX > maximumX || minimumY > maximumY) return;
    if (baseTexture) baseSampler = textureView(baseTexture, baseMipLevel);
    if (lightmapTexture) lightmapSampler = textureView(lightmapTexture, lightmapMipLevel);
    rowB0 = edgeValue(x1, y1, x2, y2, (double)minimumX + 0.5, (double)minimumY + 0.5) * inverseArea;
    rowB1 = edgeValue(x2, y2, x0, y0, (double)minimumX + 0.5, (double)minimumY + 0.5) * inverseArea;
    stepB0X = (y2 - y1) * inverseArea;
    stepB0Y = (x1 - x2) * inverseArea;
    stepB1X = (y0 - y2) * inverseArea;
    stepB1Y = (x2 - x0) * inverseArea;
    {
        double inverseDepthDelta0 = inverseDepth0 - inverseDepth2;
        double inverseDepthDelta1 = inverseDepth1 - inverseDepth2;
        double lightOverDepth0 = light0 * inverseDepth0;
        double lightOverDepth1 = light1 * inverseDepth1;
        double lightOverDepth2 = light2 * inverseDepth2;
        double uOverDepth0 = u0 * inverseDepth0;
        double uOverDepth1 = u1 * inverseDepth1;
        double uOverDepth2 = u2 * inverseDepth2;
        double vOverDepth0 = v0 * inverseDepth0;
        double vOverDepth1 = v1 * inverseDepth1;
        double vOverDepth2 = v2 * inverseDepth2;
        double luOverDepth0 = lu0 * inverseDepth0;
        double luOverDepth1 = lu1 * inverseDepth1;
        double luOverDepth2 = lu2 * inverseDepth2;
        double lvOverDepth0 = lv0 * inverseDepth0;
        double lvOverDepth1 = lv1 * inverseDepth1;
        double lvOverDepth2 = lv2 * inverseDepth2;
        rowInverseDepth = inverseDepth2 + rowB0 * inverseDepthDelta0 + rowB1 * inverseDepthDelta1;
        stepInverseDepthX = stepB0X * inverseDepthDelta0 + stepB1X * inverseDepthDelta1;
        stepInverseDepthY = stepB0Y * inverseDepthDelta0 + stepB1Y * inverseDepthDelta1;
        rowLightOverDepth = lightOverDepth2 + rowB0 * (lightOverDepth0 - lightOverDepth2) +
            rowB1 * (lightOverDepth1 - lightOverDepth2);
        stepLightOverDepthX = stepB0X * (lightOverDepth0 - lightOverDepth2) +
            stepB1X * (lightOverDepth1 - lightOverDepth2);
        stepLightOverDepthY = stepB0Y * (lightOverDepth0 - lightOverDepth2) +
            stepB1Y * (lightOverDepth1 - lightOverDepth2);
        rowUOverDepth = uOverDepth2 + rowB0 * (uOverDepth0 - uOverDepth2) +
            rowB1 * (uOverDepth1 - uOverDepth2);
        stepUOverDepthX = stepB0X * (uOverDepth0 - uOverDepth2) +
            stepB1X * (uOverDepth1 - uOverDepth2);
        stepUOverDepthY = stepB0Y * (uOverDepth0 - uOverDepth2) +
            stepB1Y * (uOverDepth1 - uOverDepth2);
        rowVOverDepth = vOverDepth2 + rowB0 * (vOverDepth0 - vOverDepth2) +
            rowB1 * (vOverDepth1 - vOverDepth2);
        stepVOverDepthX = stepB0X * (vOverDepth0 - vOverDepth2) +
            stepB1X * (vOverDepth1 - vOverDepth2);
        stepVOverDepthY = stepB0Y * (vOverDepth0 - vOverDepth2) +
            stepB1Y * (vOverDepth1 - vOverDepth2);
        rowLuOverDepth = luOverDepth2 + rowB0 * (luOverDepth0 - luOverDepth2) +
            rowB1 * (luOverDepth1 - luOverDepth2);
        stepLuOverDepthX = stepB0X * (luOverDepth0 - luOverDepth2) +
            stepB1X * (luOverDepth1 - luOverDepth2);
        stepLuOverDepthY = stepB0Y * (luOverDepth0 - luOverDepth2) +
            stepB1Y * (luOverDepth1 - luOverDepth2);
        rowLvOverDepth = lvOverDepth2 + rowB0 * (lvOverDepth0 - lvOverDepth2) +
            rowB1 * (lvOverDepth1 - lvOverDepth2);
        stepLvOverDepthX = stepB0X * (lvOverDepth0 - lvOverDepth2) +
            stepB1X * (lvOverDepth1 - lvOverDepth2);
        stepLvOverDepthY = stepB0Y * (lvOverDepth0 - lvOverDepth2) +
            stepB1Y * (lvOverDepth1 - lvOverDepth2);
    }
    for (y = minimumY; y <= maximumY; ++y) {
        int startX;
        int endX;
        double nextB0;
        double nextB1;
        double nextInverseDepth;
        double nextLightOverDepth;
        double nextUOverDepth;
        double nextVOverDepth;
        double nextLuOverDepth;
        double nextLvOverDepth;
        if (!triangleScanlineSpan(x0, y0, x1, y1, x2, y2, y, minimumX, maximumX, &startX, &endX)) {
            rowB0 += stepB0Y;
            rowB1 += stepB1Y;
            rowInverseDepth += stepInverseDepthY;
            rowLightOverDepth += stepLightOverDepthY;
            rowUOverDepth += stepUOverDepthY;
            rowVOverDepth += stepVOverDepthY;
            rowLuOverDepth += stepLuOverDepthY;
            rowLvOverDepth += stepLvOverDepthY;
            continue;
        }
        nextB0 = rowB0 + (double)(startX - minimumX) * stepB0X;
        nextB1 = rowB1 + (double)(startX - minimumX) * stepB1X;
        nextInverseDepth = rowInverseDepth + (double)(startX - minimumX) * stepInverseDepthX;
        nextLightOverDepth = rowLightOverDepth + (double)(startX - minimumX) * stepLightOverDepthX;
        nextUOverDepth = rowUOverDepth + (double)(startX - minimumX) * stepUOverDepthX;
        nextVOverDepth = rowVOverDepth + (double)(startX - minimumX) * stepVOverDepthX;
        nextLuOverDepth = rowLuOverDepth + (double)(startX - minimumX) * stepLuOverDepthX;
        nextLvOverDepth = rowLvOverDepth + (double)(startX - minimumX) * stepLvOverDepthX;
        for (x = startX; x <= endX; ++x) {
            double b0 = nextB0;
            double b1 = nextB1;
            double b2 = 1.0 - b0 - b1;
            double inverseDepth = nextInverseDepth;
            double comparisonDepth;
            double lightOverDepth = nextLightOverDepth;
            double uOverDepth = nextUOverDepth;
            double vOverDepth = nextVOverDepth;
            double luOverDepth = nextLuOverDepth;
            double lvOverDepth = nextLvOverDepth;
            double depth;
            double light;
            uint32_t color = fallback;
            SIZE_T offset;
            nextB0 += stepB0X;
            nextB1 += stepB1X;
            nextInverseDepth += stepInverseDepthX;
            nextLightOverDepth += stepLightOverDepthX;
            nextUOverDepth += stepUOverDepthX;
            nextVOverDepth += stepVOverDepthX;
            nextLuOverDepth += stepLuOverDepthX;
            nextLvOverDepth += stepLvOverDepthX;
            if (b0 < 0.0 || b1 < 0.0 || b2 < 0.0) continue;
            if (inverseDepth <= 0.0) continue;
            comparisonDepth = depthRangeInverse(inverseDepth);
            if (rasterPolygonOffset) comparisonDepth +=
                polygonOffsetInverse(stepInverseDepthX, stepInverseDepthY);
            offset = (SIZE_T)y * (SIZE_T)surfaceWidth + (SIZE_T)x;
            if (rasterDepthEqual) {
                double difference = comparisonDepth - (double)depthPixels[offset];
                double tolerance = fabs(comparisonDepth) * 0.00001 + 0.0000001;
                if (difference < -tolerance || difference > tolerance) continue;
            } else if (comparisonDepth <= (double)depthPixels[offset]) continue;
            depth = 1.0 / inverseDepth;
            light = unitLight ? 1.0 : lightOverDepth * depth;
            if (baseTexture) {
                double u = uOverDepth * depth;
                double v = vOverDepth * depth;
                color = sampleTextureView(&baseSampler, u, v);
            }
            if (lightmapTexture) {
                double u = luOverDepth * depth;
                double v = lvOverDepth * depth;
                color = multiplyTextures(color, sampleTextureView(&lightmapSampler, u, v));
            }
            if (!unitLight) color = modulateColor(color, light);
            if (rasterVertexColorEnabled) {
                color = modulateBatchVertexColor(color, b0, b1, b2,
                    inverseDepth0, inverseDepth1, inverseDepth2, depth);
            }
            if (!alphaTestPasses(color) || (color >> 24) == 0u) continue;
            if (rasterDepthEqual) {
                double difference = comparisonDepth - (double)depthPixels[offset];
                if (difference < -0.00001 || difference > 0.00001) continue;
            }
            if (rasterBlendMode == 0) pixels[offset] = color;
            else if (rasterBlendMode == 7) pixels[offset] = premultipliedAlphaColor(color, pixels[offset]);
            else if (rasterBlendMode == 6) pixels[offset] = inverseSourceColor(color, pixels[offset]);
            else if (rasterBlendMode == 5) pixels[offset] = dynamicLightColor(color, pixels[offset]);
            else if (rasterBlendMode == 4) pixels[offset] = destinationAlphaColor(color, pixels[offset]);
            else if (rasterBlendMode == 3) pixels[offset] = filterColor(color, pixels[offset]);
            else if (rasterBlendMode == 2) pixels[offset] = addColor(color, pixels[offset]);
            else if (rasterBlendMode == 1) pixels[offset] = blendColor(color, pixels[offset]);
            else pixels[offset] = color;
            if (rasterDepthWrite) depthPixels[offset] = (float)comparisonDepth;
        }
        rowB0 += stepB0Y;
        rowB1 += stepB1Y;
        rowInverseDepth += stepInverseDepthY;
        rowLightOverDepth += stepLightOverDepthY;
        rowUOverDepth += stepUOverDepthY;
        rowVOverDepth += stepVOverDepthY;
        rowLuOverDepth += stepLuOverDepthY;
        rowLvOverDepth += stepLvOverDepthY;
    }
}

typedef struct playableTriangleBatchWork_s {
    const unsigned char *records;
    int byteCount;
    int triangleCount;
    int minimumY;
    int maximumY;
} playableTriangleBatchWork;

PLAYABLE_API int playable_window_draw_triangle_batch(const unsigned char *records,
        int byteCount, int triangleCount);

static void drawTriangleBatchBand(playableTriangleBatchWork *work) {
    int previousMinimumY = rasterClipMinimumY;
    int previousMaximumY = rasterClipMaximumY;
    rasterClipMinimumY = work->minimumY;
    rasterClipMaximumY = work->maximumY;
    playable_window_draw_triangle_batch(work->records, work->byteCount, work->triangleCount);
    rasterClipMinimumY = previousMinimumY;
    rasterClipMaximumY = previousMaximumY;
}

static void CALLBACK drawTriangleBatchBandCallback(PTP_CALLBACK_INSTANCE instance,
        void *context, PTP_WORK callbackWork) {
    (void)instance;
    (void)callbackWork;
    drawTriangleBatchBand((playableTriangleBatchWork *)context);
}

PLAYABLE_API int playable_window_draw_triangle_batch(const unsigned char *records,
        int byteCount, int triangleCount) {
    int index;
    SIZE_T required;
    if (triangleCount < 0 || triangleCount > PLAYABLE_TRIANGLE_BATCH_MAX_COUNT || byteCount < 0) return 0;
    if (triangleCount == 0) return 0;
    if (!records) return 0;
    required = (SIZE_T)triangleCount * (SIZE_T)PLAYABLE_TRIANGLE_BATCH_RECORD_BYTES;
    if (required > (SIZE_T)INT_MAX || (SIZE_T)byteCount < required) return 0;
    if (rasterClipMaximumY == INT_MAX && triangleCount >= 256 && surfaceHeight >= 128) {
        SYSTEM_INFO systemInfo;
        playableTriangleBatchWork work[PLAYABLE_RASTER_MAX_BANDS];
        PTP_WORK handles[PLAYABLE_RASTER_MAX_BANDS] = {0};
        int bandCount;
        int maximumBands = PLAYABLE_RASTER_MAX_BANDS;
        int band;
        /* Small submissions do not amortize two extra projections/work items. */
        if ((triangleCount < 1024 || surfaceHeight < 360) && maximumBands > 4) maximumBands = 4;
        GetSystemInfo(&systemInfo);
        bandCount = (int)systemInfo.dwNumberOfProcessors;
        if (bandCount > maximumBands) bandCount = maximumBands;
        if (bandCount > surfaceHeight) bandCount = surfaceHeight;
        if (bandCount > 1) {
            for (band = 0; band < bandCount; ++band) {
                playableTriangleBatchWork *item = &work[band];
                item->records = records;item->byteCount = byteCount;item->triangleCount = triangleCount;
                item->minimumY = surfaceHeight * band / bandCount;
                item->maximumY = surfaceHeight * (band + 1) / bandCount - 1;
                if (band > 0) {
                    handles[band] = CreateThreadpoolWork(drawTriangleBatchBandCallback, item, 0);
                    if (handles[band]) SubmitThreadpoolWork(handles[band]);
                }
            }
            drawTriangleBatchBand(&work[0]);
            for (band = 1; band < bandCount; ++band) {
                if (handles[band]) {
                    WaitForThreadpoolWorkCallbacks(handles[band], FALSE);
                    CloseThreadpoolWork(handles[band]);
                } else {
                    drawTriangleBatchBand(&work[band]);
                }
            }
            return triangleCount;
        }
    }
    for (index = 0; index < triangleCount; ++index) {
        playableTriangleBatchRecord command;
        const unsigned char *source = records + (SIZE_T)index * PLAYABLE_TRIANGLE_BATCH_RECORD_BYTES;
        memcpy(&command, source, sizeof(command));
        useBatchVertexColor(&command);
        if (command.lightmapTextureSlot >= 0) {
            playable_window_draw_triangle_multitexture(
                command.baseTextureSlot, command.lightmapTextureSlot,
                command.vertex[0][0], command.vertex[0][1], command.vertex[0][2], command.vertex[0][3], command.vertex[0][4], command.vertex[0][5], command.vertex[0][6], command.vertex[0][7],
                command.vertex[1][0], command.vertex[1][1], command.vertex[1][2], command.vertex[1][3], command.vertex[1][4], command.vertex[1][5], command.vertex[1][6], command.vertex[1][7],
                command.vertex[2][0], command.vertex[2][1], command.vertex[2][2], command.vertex[2][3], command.vertex[2][4], command.vertex[2][5], command.vertex[2][6], command.vertex[2][7],
                command.fallbackRed, command.fallbackGreen, command.fallbackBlue);
        } else {
            playable_window_draw_triangle(command.baseTextureSlot,
                command.vertex[0][0], command.vertex[0][1], command.vertex[0][2], command.vertex[0][3], command.vertex[0][4], command.vertex[0][7],
                command.vertex[1][0], command.vertex[1][1], command.vertex[1][2], command.vertex[1][3], command.vertex[1][4], command.vertex[1][7],
                command.vertex[2][0], command.vertex[2][1], command.vertex[2][2], command.vertex[2][3], command.vertex[2][4], command.vertex[2][7],
                command.fallbackRed, command.fallbackGreen, command.fallbackBlue);
        }
    }
    rasterVertexColorEnabled = 0;
    return triangleCount;
}

/* Projects a static world-space batch and feeds the existing rasterizers.  The
 * command layout deliberately matches playable_window_draw_triangle_batch so
 * callers can build and retain one stream until visible-world selection changes. */
typedef struct playableWorldBatchWork_s {
    const unsigned char *records;
    int byteCount;
    int triangleCount;
    double position[3];
    double right[3];
    double up[3];
    double forward[3];
    double halfWidth;
    double halfHeight;
    double focal;
    double nearDistance;
    int minimumX;
    int maximumX;
    int minimumY;
    int maximumY;
} playableWorldBatchWork;

PLAYABLE_API int playable_window_draw_world_triangle_batch(const unsigned char *records,
        int byteCount, int triangleCount,
        double positionX, double positionY, double positionZ,
        double rightX, double rightY, double rightZ,
        double upX, double upY, double upZ,
        double forwardX, double forwardY, double forwardZ,
        double halfWidth, double halfHeight, double focal, double nearDistance);

static void drawWorldBatchBand(playableWorldBatchWork *work) {
    int previousMinimumX = rasterClipMinimumX;
    int previousMaximumX = rasterClipMaximumX;
    int previousMinimumY = rasterClipMinimumY;
    int previousMaximumY = rasterClipMaximumY;
    rasterClipMinimumX = work->minimumX;
    rasterClipMaximumX = work->maximumX;
    rasterClipMinimumY = work->minimumY;
    rasterClipMaximumY = work->maximumY;
    playable_window_draw_world_triangle_batch(work->records, work->byteCount, work->triangleCount,
        work->position[0], work->position[1], work->position[2],
        work->right[0], work->right[1], work->right[2],
        work->up[0], work->up[1], work->up[2],
        work->forward[0], work->forward[1], work->forward[2],
        work->halfWidth, work->halfHeight, work->focal, work->nearDistance);
    rasterClipMinimumX = previousMinimumX;
    rasterClipMaximumX = previousMaximumX;
    rasterClipMinimumY = previousMinimumY;
    rasterClipMaximumY = previousMaximumY;
}

static void CALLBACK drawWorldBatchBandCallback(PTP_CALLBACK_INSTANCE instance,
        void *context, PTP_WORK callbackWork) {
    (void)instance;
    (void)callbackWork;
    drawWorldBatchBand((playableWorldBatchWork *)context);
}

static int drawWorldBatchParallel(const unsigned char *records,
        int byteCount, int triangleCount,
        double positionX, double positionY, double positionZ,
        double rightX, double rightY, double rightZ,
        double upX, double upY, double upZ,
        double forwardX, double forwardY, double forwardZ,
        double halfWidth, double halfHeight, double focal, double nearDistance,
        int minimumX, int maximumX, int minimumY, int maximumY) {
    SYSTEM_INFO systemInfo;
    playableWorldBatchWork work[PLAYABLE_RASTER_MAX_BANDS];
    PTP_WORK handles[PLAYABLE_RASTER_MAX_BANDS] = {0};
    int height = maximumY - minimumY + 1;
    int bandCount;
    int maximumBands = PLAYABLE_RASTER_MAX_BANDS;
    int band;
    if (triangleCount < 256 || height < 128) return 0;
    if ((triangleCount < 1024 || height < 360) && maximumBands > 4) maximumBands = 4;
    GetSystemInfo(&systemInfo);
    bandCount = (int)systemInfo.dwNumberOfProcessors;
    if (bandCount > maximumBands) bandCount = maximumBands;
    if (bandCount > height) bandCount = height;
    if (bandCount <= 1) return 0;
    for (band = 0; band < bandCount; ++band) {
        playableWorldBatchWork *item = &work[band];
        item->records = records;
        item->byteCount = byteCount;
        item->triangleCount = triangleCount;
        item->position[0] = positionX;
        item->position[1] = positionY;
        item->position[2] = positionZ;
        item->right[0] = rightX;
        item->right[1] = rightY;
        item->right[2] = rightZ;
        item->up[0] = upX;
        item->up[1] = upY;
        item->up[2] = upZ;
        item->forward[0] = forwardX;
        item->forward[1] = forwardY;
        item->forward[2] = forwardZ;
        item->halfWidth = halfWidth;
        item->halfHeight = halfHeight;
        item->focal = focal;
        item->nearDistance = nearDistance;
        item->minimumX = minimumX;
        item->maximumX = maximumX;
        item->minimumY = minimumY + height * band / bandCount;
        item->maximumY = minimumY + height * (band + 1) / bandCount - 1;
        if (band > 0) {
            handles[band] = CreateThreadpoolWork(drawWorldBatchBandCallback, item, 0);
            if (handles[band]) SubmitThreadpoolWork(handles[band]);
        }
    }
    drawWorldBatchBand(&work[0]);
    for (band = 1; band < bandCount; ++band) {
        if (handles[band]) {
            WaitForThreadpoolWorkCallbacks(handles[band], FALSE);
            CloseThreadpoolWork(handles[band]);
        } else {
            drawWorldBatchBand(&work[band]);
        }
    }
    return 1;
}

PLAYABLE_API int playable_window_draw_world_triangle_batch(const unsigned char *records,
        int byteCount, int triangleCount,
        double positionX, double positionY, double positionZ,
        double rightX, double rightY, double rightZ,
        double upX, double upY, double upZ,
        double forwardX, double forwardY, double forwardZ,
        double halfWidth, double halfHeight, double focal, double nearDistance) {
    int index;
    SIZE_T required;
    if (triangleCount < 0 || triangleCount > PLAYABLE_TRIANGLE_BATCH_MAX_COUNT ||
            byteCount < 0 || !_finite(positionX) || !_finite(positionY) ||
            !_finite(positionZ) || !_finite(rightX) || !_finite(rightY) ||
            !_finite(rightZ) || !_finite(upX) || !_finite(upY) || !_finite(upZ) ||
            !_finite(forwardX) || !_finite(forwardY) || !_finite(forwardZ) ||
            !_finite(halfWidth) || !_finite(halfHeight) || !_finite(focal) ||
            !_finite(nearDistance) || focal <= 0.0 || nearDistance <= 0.0) return 0;
    if (triangleCount == 0) return 0;
    if (!records) return 0;
    required = (SIZE_T)triangleCount * (SIZE_T)PLAYABLE_TRIANGLE_BATCH_RECORD_BYTES;
    if (required > (SIZE_T)INT_MAX || (SIZE_T)byteCount < required) return 0;
    if (rasterClipMaximumY == INT_MAX && drawWorldBatchParallel(records,
            byteCount, triangleCount,
            positionX, positionY, positionZ,
            rightX, rightY, rightZ,
            upX, upY, upZ,
            forwardX, forwardY, forwardZ,
            halfWidth, halfHeight, focal, nearDistance,
            0, surfaceWidth - 1, 0, surfaceHeight - 1)) return triangleCount;
    for (index = 0; index < triangleCount; ++index) {
        playableTriangleBatchRecord command;
        double projected[3][3];
        int vertex;
        int visible = 1;
        const unsigned char *source = records + (SIZE_T)index * PLAYABLE_TRIANGLE_BATCH_RECORD_BYTES;
        memcpy(&command, source, sizeof(command));
        for (vertex = 0; vertex < 3; ++vertex) {
            double dx = (double)command.vertex[vertex][0] - positionX;
            double dy = (double)command.vertex[vertex][1] - positionY;
            double dz = (double)command.vertex[vertex][2] - positionZ;
            double side = dx * rightX + dy * rightY + dz * rightZ;
            double up = dx * upX + dy * upY + dz * upZ;
            double depth = dx * forwardX + dy * forwardY + dz * forwardZ;
            double scale;
            if (!_finite(depth) || depth < nearDistance) {
                visible = 0;
                break;
            }
            scale = focal / depth;
            projected[vertex][0] = halfWidth + side * scale;
            projected[vertex][1] = halfHeight - up * scale;
            projected[vertex][2] = depth;
        }
        if (!visible) continue;
        useBatchVertexColor(&command);
        if (command.lightmapTextureSlot >= 0) {
            playable_window_draw_triangle_multitexture(
                command.baseTextureSlot, command.lightmapTextureSlot,
                projected[0][0], projected[0][1], projected[0][2], command.vertex[0][3], command.vertex[0][4], command.vertex[0][5], command.vertex[0][6], command.vertex[0][7],
                projected[1][0], projected[1][1], projected[1][2], command.vertex[1][3], command.vertex[1][4], command.vertex[1][5], command.vertex[1][6], command.vertex[1][7],
                projected[2][0], projected[2][1], projected[2][2], command.vertex[2][3], command.vertex[2][4], command.vertex[2][5], command.vertex[2][6], command.vertex[2][7],
                command.fallbackRed, command.fallbackGreen, command.fallbackBlue);
        } else {
            playable_window_draw_triangle(command.baseTextureSlot,
                projected[0][0], projected[0][1], projected[0][2], command.vertex[0][3], command.vertex[0][4], command.vertex[0][7],
                projected[1][0], projected[1][1], projected[1][2], command.vertex[1][3], command.vertex[1][4], command.vertex[1][7],
                projected[2][0], projected[2][1], projected[2][2], command.vertex[2][3], command.vertex[2][4], command.vertex[2][7],
                command.fallbackRed, command.fallbackGreen, command.fallbackBlue);
        }
    }
    rasterVertexColorEnabled = 0;
    return triangleCount;
}

/* Render one refdef_t into its own window rectangle.  The projection center
 * follows glViewport placement and the raster clip emulates glScissor, so a
 * small model or menu view cannot draw outside its assigned rectangle. */
PLAYABLE_API int playable_window_draw_world_triangle_batch_viewport(const unsigned char *records,
        int byteCount, int triangleCount,
        int viewportX, int viewportY, int viewportWidth, int viewportHeight,
        double positionX, double positionY, double positionZ,
        double rightX, double rightY, double rightZ,
        double upX, double upY, double upZ,
        double forwardX, double forwardY, double forwardZ,
        double focal, double nearDistance) {
    int previousMinimumX = rasterClipMinimumX;
    int previousMaximumX = rasterClipMaximumX;
    int previousMinimumY = rasterClipMinimumY;
    int previousMaximumY = rasterClipMaximumY;
    int result;
    SIZE_T required;
    if (viewportX < 0 || viewportY < 0 || viewportWidth < 1 || viewportHeight < 1 ||
            viewportWidth > surfaceWidth || viewportHeight > surfaceHeight ||
            viewportX > surfaceWidth - viewportWidth ||
            viewportY > surfaceHeight - viewportHeight) return 0;
    if (triangleCount < 0 || triangleCount > PLAYABLE_TRIANGLE_BATCH_MAX_COUNT ||
            byteCount < 0 || !_finite(positionX) || !_finite(positionY) ||
            !_finite(positionZ) || !_finite(rightX) || !_finite(rightY) ||
            !_finite(rightZ) || !_finite(upX) || !_finite(upY) || !_finite(upZ) ||
            !_finite(forwardX) || !_finite(forwardY) || !_finite(forwardZ) ||
            !_finite(focal) || !_finite(nearDistance) || focal <= 0.0 ||
            nearDistance <= 0.0) return 0;
    if (triangleCount == 0 || !records) return 0;
    required = (SIZE_T)triangleCount * (SIZE_T)PLAYABLE_TRIANGLE_BATCH_RECORD_BYTES;
    if (required > (SIZE_T)INT_MAX || (SIZE_T)byteCount < required) return 0;
    if (drawWorldBatchParallel(records, byteCount, triangleCount,
            positionX, positionY, positionZ,
            rightX, rightY, rightZ,
            upX, upY, upZ,
            forwardX, forwardY, forwardZ,
            (double)viewportX + (double)viewportWidth * 0.5,
            (double)viewportY + (double)viewportHeight * 0.5,
            focal, nearDistance,
            viewportX, viewportX + viewportWidth - 1,
            viewportY, viewportY + viewportHeight - 1)) return triangleCount;
    rasterClipMinimumX = viewportX;
    rasterClipMaximumX = viewportX + viewportWidth - 1;
    rasterClipMinimumY = viewportY;
    rasterClipMaximumY = viewportY + viewportHeight - 1;
    result = playable_window_draw_world_triangle_batch(records, byteCount, triangleCount,
        positionX, positionY, positionZ,
        rightX, rightY, rightZ,
        upX, upY, upZ,
        forwardX, forwardY, forwardZ,
        (double)viewportX + (double)viewportWidth * 0.5,
        (double)viewportY + (double)viewportHeight * 0.5,
        focal, nearDistance);
    rasterClipMinimumX = previousMinimumX;
    rasterClipMaximumX = previousMaximumX;
    rasterClipMinimumY = previousMinimumY;
    rasterClipMaximumY = previousMaximumY;
    return result;
}

typedef HRESULT (WINAPI *playableCoInitializeExFn)(LPVOID, DWORD);
typedef HRESULT (WINAPI *playableCoCreateInstanceFn)(REFCLSID, LPUNKNOWN, DWORD, REFIID, LPVOID *);
typedef void (WINAPI *playableCoUninitializeFn)(void);

static const GUID playableWicFactoryClsid =
    {0xcacaf262,0x9370,0x4615,{0xa1,0x3b,0x9f,0x55,0x39,0xda,0x4c,0x0a}};
static const GUID playableWicFactoryIid =
    {0xec5ec8a9,0xc395,0x4314,{0x9c,0x77,0x54,0xd7,0xa9,0x35,0xff,0x70}};
static const GUID playableRgbaPixelFormat =
    {0xf5c7ad2d,0x6a8d,0x43dd,{0xa7,0xa8,0xa2,0x99,0x35,0x26,0x1a,0xe9}};

static int decodeJpegWic(const unsigned char *data, int byteCount, unsigned char *rgba,
        int capacity, UINT *outWidth, UINT *outHeight) {
    HMODULE ole32;
    union { FARPROC raw; playableCoInitializeExFn typed; } initialize;
    union { FARPROC raw; playableCoCreateInstanceFn typed; } create;
    union { FARPROC raw; playableCoUninitializeFn typed; } uninitialize;
    IWICImagingFactory *factory = 0;
    IWICStream *stream = 0;
    IWICBitmapDecoder *decoder = 0;
    IWICBitmapFrameDecode *frame = 0;
    IWICFormatConverter *converter = 0;
    HRESULT initialized;
    HRESULT result;
    UINT width = 0;
    UINT height = 0;
    UINT stride;
    UINT required;
    int ok = 0;
    if (!data || byteCount < 4 || !outWidth || !outHeight) return 0;
    ole32 = LoadLibraryW(L"ole32.dll");
    if (!ole32) return 0;
    initialize.raw = GetProcAddress(ole32, "CoInitializeEx");
    create.raw = GetProcAddress(ole32, "CoCreateInstance");
    uninitialize.raw = GetProcAddress(ole32, "CoUninitialize");
    if (!initialize.typed || !create.typed || !uninitialize.typed) goto cleanupLibrary;
    initialized = initialize.typed(0, COINIT_MULTITHREADED);
    if (FAILED(initialized) && initialized != RPC_E_CHANGED_MODE) goto cleanupLibrary;
    result = create.typed(&playableWicFactoryClsid, 0, CLSCTX_INPROC_SERVER,
        &playableWicFactoryIid, (void **)&factory);
    if (FAILED(result) || !factory) goto cleanupCom;
    result = factory->lpVtbl->CreateStream(factory, &stream);
    if (FAILED(result) || !stream) goto cleanupObjects;
    result = stream->lpVtbl->InitializeFromMemory(stream, (BYTE *)(uintptr_t)data, (DWORD)byteCount);
    if (FAILED(result)) goto cleanupObjects;
    result = factory->lpVtbl->CreateDecoderFromStream(factory, (IStream *)stream, 0,
        WICDecodeMetadataCacheOnLoad, &decoder);
    if (FAILED(result) || !decoder) goto cleanupObjects;
    result = decoder->lpVtbl->GetFrame(decoder, 0, &frame);
    if (FAILED(result) || !frame) goto cleanupObjects;
    result = frame->lpVtbl->GetSize(frame, &width, &height);
    if (FAILED(result) || width < 1u || height < 1u || width > PLAYABLE_MAX_TEXTURE_SIZE ||
            height > PLAYABLE_MAX_TEXTURE_SIZE || width > UINT_MAX / 4u ||
            height > UINT_MAX / (width * 4u)) goto cleanupObjects;
    *outWidth = width;
    *outHeight = height;
    if (!rgba) { ok = 1; goto cleanupObjects; }
    stride = width * 4u;
    required = stride * height;
    if (capacity < 0 || (UINT)capacity < required) goto cleanupObjects;
    result = factory->lpVtbl->CreateFormatConverter(factory, &converter);
    if (FAILED(result) || !converter) goto cleanupObjects;
    result = converter->lpVtbl->Initialize(converter, (IWICBitmapSource *)frame,
        &playableRgbaPixelFormat, WICBitmapDitherTypeNone, 0, 0.0,
        WICBitmapPaletteTypeCustom);
    if (FAILED(result)) goto cleanupObjects;
    result = converter->lpVtbl->CopyPixels(converter, 0, stride, required, rgba);
    if (SUCCEEDED(result)) ok = 1;
cleanupObjects:
    if (converter) converter->lpVtbl->Release(converter);
    if (frame) frame->lpVtbl->Release(frame);
    if (decoder) decoder->lpVtbl->Release(decoder);
    if (stream) stream->lpVtbl->Release(stream);
    if (factory) factory->lpVtbl->Release(factory);
cleanupCom:
    if (SUCCEEDED(initialized)) uninitialize.typed();
cleanupLibrary:
    FreeLibrary(ole32);
    return ok;
}

PLAYABLE_API int playable_window_jpeg_info(const unsigned char *data, int byteCount,
        unsigned char *metadata) {
    UINT width;
    UINT height;
    if (!metadata || !decodeJpegWic(data, byteCount, 0, 0, &width, &height)) return 0;
    metadata[0] = (unsigned char)width; metadata[1] = (unsigned char)(width >> 8);
    metadata[2] = (unsigned char)(width >> 16); metadata[3] = (unsigned char)(width >> 24);
    metadata[4] = (unsigned char)height; metadata[5] = (unsigned char)(height >> 8);
    metadata[6] = (unsigned char)(height >> 16); metadata[7] = (unsigned char)(height >> 24);
    return 1;
}

PLAYABLE_API int playable_window_decode_jpeg(const unsigned char *data, int byteCount,
        unsigned char *rgba, int capacity) {
    UINT width;
    UINT height;
    return decodeJpegWic(data, byteCount, rgba, capacity, &width, &height);
}

PLAYABLE_API void playable_window_draw_line(int x0, int y0, int x1, int y1,
        int red, int green, int blue) {
    int dx = x1 > x0 ? x1 - x0 : x0 - x1;
    int sx = x0 < x1 ? 1 : -1;
    int dyAbs = y1 > y0 ? y1 - y0 : y0 - y1;
    int dy = -dyAbs;
    int sy = y0 < y1 ? 1 : -1;
    int error = dx + dy;
    uint32_t color = makeColor(red, green, blue);
    if (!pixels) return;
    for (;;) {
        if ((unsigned)x0 < (unsigned)surfaceWidth && (unsigned)y0 < (unsigned)surfaceHeight)
            pixels[(SIZE_T)y0 * (SIZE_T)surfaceWidth + (SIZE_T)x0] = color;
        if (x0 == x1 && y0 == y1) break;
        {
            int twiceError = error * 2;
            if (twiceError >= dy) { error += dy; x0 += sx; }
            if (twiceError <= dx) { error += dx; y0 += sy; }
        }
    }
}

PLAYABLE_API void playable_window_present(void) {
    RECT client;
    if (!windowHandle || !windowDC || !pixels) return;
    AcquireSRWLockExclusive(&presentationLock);
    CopyMemory(presentedPixels, pixels, (SIZE_T)surfaceWidth * (SIZE_T)surfaceHeight * 4u);
    GetClientRect(windowHandle, &client);
    if (openGLActive && playableWglMakeCurrent(windowDC, openGLContext)) {
        int width = client.right > 0 ? client.right : surfaceWidth;
        int height = client.bottom > 0 ? client.bottom : surfaceHeight;
        playableGlViewport(0, 0, width, height);
        playableGlMatrixMode(GL_PROJECTION); playableGlLoadIdentity();
        playableGlOrtho(0.0, (GLdouble)width, 0.0, (GLdouble)height, -1.0, 1.0);
        playableGlMatrixMode(GL_MODELVIEW); playableGlLoadIdentity();
        playableGlClearColor(0.0f, 0.0f, 0.0f, 1.0f); playableGlClear(GL_COLOR_BUFFER_BIT);
        playableGlPixelStorei(GL_UNPACK_ALIGNMENT, 4);
        playableGlRasterPos2i(0, height);
        playableGlPixelZoom((GLfloat)width / (GLfloat)surfaceWidth,
            -(GLfloat)height / (GLfloat)surfaceHeight);
        playableGlDrawPixels(surfaceWidth, surfaceHeight, GL_BGRA_EXT,
            GL_UNSIGNED_BYTE, presentedPixels);
        SwapBuffers(windowDC);
    } else {
        StretchDIBits(windowDC, 0, 0, client.right, client.bottom,
            0, 0, surfaceWidth, surfaceHeight, presentedPixels, &bitmapInfo,
            DIB_RGB_COLORS, SRCCOPY);
    }
    ReleaseSRWLockExclusive(&presentationLock);
}

PLAYABLE_API void playable_window_gl_end_frame(void) { playable_window_present(); }

PLAYABLE_API void playable_window_gl_log_comment(const unsigned char *comment, int length) {
    char text[1024];
    if (!comment || length < 1) return;
    if (length > (int)sizeof(text) - 1) length = (int)sizeof(text) - 1;
    CopyMemory(text, comment, (size_t)length); text[length] = '\0';
    OutputDebugStringA(text);
}

PLAYABLE_API void playable_window_shutdown(void) {
    HWND oldWindow = windowHandle;
    int slot;
    shutdownMidi();
    playable_window_input_activate(0);
    shutdownOpenGL();
    if (oldWindow) PostMessageW(oldWindow, WM_APP + 1, 0, 0);
    if (windowThread) {
        WaitForSingleObject(windowThread, INFINITE);
        CloseHandle(windowThread);
        windowThread = 0;
    }
    InterlockedExchange(&closeRequested, 1);
    rawMouseEnabled = 0;
    inputJoystickEnabled = 0;
    inputJoystickAvailable = 0;
    ZeroMemory(&inputJoystickCaps, sizeof(inputJoystickCaps));
    restoreDisplayMode();
    resetInputEvents();
    releaseSurface();
    for (slot = 0; slot < PLAYABLE_TEXTURE_SLOTS; ++slot) playable_window_release_texture(slot);
}
