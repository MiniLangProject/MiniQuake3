#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <objbase.h>
#include <wincodec.h>
#include <stdint.h>
#include <limits.h>
#include <float.h>
#include <math.h>

#if defined(_MSC_VER)
#define PLAYABLE_API __declspec(dllexport)
#else
#define PLAYABLE_API __attribute__((dllexport))
#endif

static HWND windowHandle;
static HDC windowDC;
static BITMAPINFO bitmapInfo;
static uint32_t *pixels;
static float *depthPixels;
static int surfaceWidth;
static int surfaceHeight;
static int closeRequested = 1;
static int rawMouseEnabled;
static LONG mouseDX;
static LONG mouseDY;
static int haveMousePosition;
static int lastMouseX;
static int lastMouseY;
static LARGE_INTEGER timerFrequency;
static LARGE_INTEGER timerStart;

#define PLAYABLE_TEXTURE_SLOTS 512
#define PLAYABLE_MAX_TEXTURE_SIZE 4096

typedef struct playableTexture_s {
    uint32_t *pixels;
    int width;
    int height;
} playableTexture;

static playableTexture textures[PLAYABLE_TEXTURE_SLOTS];
static int rasterBlendMode;
static int rasterDepthEqual;
static int rasterDepthWrite = 1;
static int rasterAlphaTest;
static int rasterClampTexture;
static int rasterPolygonOffset;
static double rasterDepthRangeScale = 1.0;
static double rasterDepthRangeNear = 1.0;
static __declspec(thread) int rasterClipMinimumY;
static __declspec(thread) int rasterClipMaximumY = INT_MAX;
static __declspec(thread) int rasterVertexColorEnabled;
static __declspec(thread) int rasterVertexColorUniform;
static __declspec(thread) unsigned char rasterVertexColor[3][4];

/* Compact little-endian command consumed by the batch entry point. */
#define PLAYABLE_TRIANGLE_BATCH_RECORD_BYTES 128
#define PLAYABLE_TRIANGLE_BATCH_MAX_COUNT 65536

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

static void releaseSurface(void) {
    if (pixels) {
        VirtualFree(pixels, 0, MEM_RELEASE);
        pixels = 0;
    }
    if (depthPixels) {
        VirtualFree(depthPixels, 0, MEM_RELEASE);
        depthPixels = 0;
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
    depthPixels = (float *)VirtualAlloc(0, byteCount, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
    if (!depthPixels) {
        VirtualFree(pixels, 0, MEM_RELEASE);
        pixels = 0;
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
            closeRequested = 1;
            DestroyWindow(hwnd);
            return 0;
        case WM_DESTROY:
            if (windowDC) ReleaseDC(hwnd, windowDC);
            windowDC = 0;
            closeRequested = 1;
            windowHandle = 0;
            PostQuitMessage(0);
            return 0;
        case WM_KILLFOCUS:
            haveMousePosition = 0;
            return 0;
        case WM_MOUSEMOVE:
            if (!rawMouseEnabled) {
                int x = (int)(short)LOWORD(lParam);
                int y = (int)(short)HIWORD(lParam);
                if (haveMousePosition) {
                    InterlockedExchangeAdd(&mouseDX, x - lastMouseX);
                    InterlockedExchangeAdd(&mouseDY, y - lastMouseY);
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
            if (pixels) StretchDIBits(dc, 0, 0, client.right, client.bottom,
                0, 0, surfaceWidth, surfaceHeight, pixels, &bitmapInfo,
                DIB_RGB_COLORS, SRCCOPY);
            EndPaint(hwnd, &paint);
            return 0;
        }
    }
    return DefWindowProcW(hwnd, message, wParam, lParam);
}

PLAYABLE_API int playable_window_create(int width, int height) {
    static int classRegistered;
    WNDCLASSEXW wc;
    RECT rectangle;
    RAWINPUTDEVICE mouse;
    HINSTANCE instance = GetModuleHandleW(0);
    if (windowHandle) return 1;
    if (!allocateSurface(width, height)) return 0;
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
            releaseSurface();
            return 0;
        }
        classRegistered = 1;
    }
    rectangle.left = 0; rectangle.top = 0; rectangle.right = width; rectangle.bottom = height;
    AdjustWindowRect(&rectangle, WS_OVERLAPPEDWINDOW, FALSE);
    closeRequested = 0;
    mouseDX = mouseDY = 0;
    windowHandle = CreateWindowExW(0, L"MiniQuake3PlayableWindow", L"MiniQuake3 - playable preview",
        WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT,
        rectangle.right - rectangle.left, rectangle.bottom - rectangle.top,
        0, 0, instance, 0);
    if (!windowHandle) {
        closeRequested = 1;
        releaseSurface();
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
    return 1;
}

PLAYABLE_API void playable_window_poll(void) {
    MSG message;
    while (PeekMessageW(&message, 0, 0, 0, PM_REMOVE)) {
        if (message.message == WM_QUIT) closeRequested = 1;
        TranslateMessage(&message);
        DispatchMessageW(&message);
    }
}

PLAYABLE_API int playable_window_should_close(void) { return closeRequested; }

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

PLAYABLE_API int playable_window_consume_mouse_dx(void) {
    return (int)InterlockedExchange(&mouseDX, 0);
}

PLAYABLE_API int playable_window_consume_mouse_dy(void) {
    return (int)InterlockedExchange(&mouseDY, 0);
}

PLAYABLE_API int playable_window_milliseconds(void) {
    LARGE_INTEGER now;
    int64_t ticks;
    ensureTimer();
    QueryPerformanceCounter(&now);
    ticks = now.QuadPart - timerStart.QuadPart;
    return (int)((ticks * 1000) / timerFrequency.QuadPart);
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
    rasterDepthRangeScale = 1.0;
    rasterDepthRangeNear = 1.0;
}

PLAYABLE_API void playable_window_clear_depth(double depth) {
    float value = (float)depth;
    if (!_finite(depth) || depth <= 0.0 || value <= 0.0f) depth = FLT_MAX;
    clearDepth(depth);
}

PLAYABLE_API int playable_window_upload_texture(int slot, const unsigned char *rgba,
        int width, int height) {
    playableTexture *texture;
    SIZE_T pixelCount;
    SIZE_T byteCount;
    SIZE_T i;
    uint32_t *copy;
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
    texture = &textures[slot];
    if (texture->pixels) VirtualFree(texture->pixels, 0, MEM_RELEASE);
    texture->pixels = copy;
    texture->width = width;
    texture->height = height;
    return 1;
}

PLAYABLE_API void playable_window_release_texture(int slot) {
    playableTexture *texture;
    if (slot < 0 || slot >= PLAYABLE_TEXTURE_SLOTS) return;
    texture = &textures[slot];
    if (texture->pixels) VirtualFree(texture->pixels, 0, MEM_RELEASE);
    texture->pixels = 0;
    texture->width = 0;
    texture->height = 0;
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

PLAYABLE_API int playable_window_set_raster_state(int blendMode, int depthEqual, int depthWrite) {
    if (blendMode < 0 || blendMode > 4 || (depthEqual != 0 && depthEqual != 1) ||
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

static uint32_t sampleTexture(const playableTexture *texture, double u, double v) {
    double sampledU = u;
    double sampledV = v;
    int textureX;
    int textureY;
    if (rasterClampTexture) {
        if (sampledU < 0.0) sampledU = 0.0;if (sampledU > 1.0) sampledU = 1.0;
        if (sampledV < 0.0) sampledV = 0.0;if (sampledV > 1.0) sampledV = 1.0;
    } else {
        sampledU -= floor(sampledU);sampledV -= floor(sampledV);
    }
    textureX = (int)(sampledU * (double)texture->width);textureY = (int)(sampledV * (double)texture->height);
    if (textureX >= texture->width) textureX = texture->width-1;if (textureY >= texture->height) textureY = texture->height-1;
    return texture->pixels[(SIZE_T)textureY * (SIZE_T)texture->width + (SIZE_T)textureX];
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
    playableTexture *texture = 0;
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
    if (minimumY < rasterClipMinimumY) minimumY = rasterClipMinimumY;
    if (maximumY > rasterClipMaximumY) maximumY = rasterClipMaximumY;
    if (minimumX > maximumX || minimumY > maximumY) return;
    texture = textureAt(textureSlot);
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
            depth = constantDepth ? constantDepthScale : 1.0 / inverseDepth;
            light = unitLight ? 1.0 : lightOverDepth * depth;
            color = fallback;
            if (texture) {
                double u = uOverDepth * depth;
                double v = vOverDepth * depth;
                color = sampleTexture(texture, u, v);
            }
            if (!unitLight) color = modulateColor(color, light);
            if (rasterVertexColorEnabled) {
                color = modulateBatchVertexColor(color, b0, b1, b2,
                    inverseDepth0, inverseDepth1, inverseDepth2, depth);
            }
            if (!alphaTestPasses(color) || (color >> 24) == 0u) continue;
            if (rasterBlendMode == 4) pixels[offset] = destinationAlphaColor(color, pixels[offset]);
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
    int x;
    int y;
    playableTexture *baseTexture = textureAt(baseTextureSlot);
    playableTexture *lightmapTexture = textureAt(lightmapTextureSlot);
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
    minimumX = lowerPixel(min(x0, min(x1, x2)));
    maximumX = upperPixel(max(x0, max(x1, x2)));
    minimumY = lowerPixel(min(y0, min(y1, y2)));
    maximumY = upperPixel(max(y0, max(y1, y2)));
    if (minimumX < 0) minimumX = 0;
    if (minimumY < 0) minimumY = 0;
    if (maximumX >= surfaceWidth) maximumX = surfaceWidth - 1;
    if (maximumY >= surfaceHeight) maximumY = surfaceHeight - 1;
    if (minimumY < rasterClipMinimumY) minimumY = rasterClipMinimumY;
    if (maximumY > rasterClipMaximumY) maximumY = rasterClipMaximumY;
    if (minimumX > maximumX || minimumY > maximumY) return;
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
            light = lightOverDepth * depth;
            if (baseTexture) {
                double u = uOverDepth * depth;
                double v = vOverDepth * depth;
                color = sampleTexture(baseTexture, u, v);
            }
            if (lightmapTexture) {
                double u = luOverDepth * depth;
                double v = lvOverDepth * depth;
                color = multiplyTextures(color, sampleTexture(lightmapTexture, u, v));
            }
            color = modulateColor(color, light);
            if (rasterVertexColorEnabled) {
                color = modulateBatchVertexColor(color, b0, b1, b2,
                    inverseDepth0, inverseDepth1, inverseDepth2, depth);
            }
            if (!alphaTestPasses(color) || (color >> 24) == 0u) continue;
            if (rasterDepthEqual) {
                double difference = comparisonDepth - (double)depthPixels[offset];
                if (difference < -0.00001 || difference > 0.00001) continue;
            }
            if (rasterBlendMode == 4) pixels[offset] = destinationAlphaColor(color, pixels[offset]);
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

PLAYABLE_API int playable_window_draw_triangle_batch(const unsigned char *records,
        int byteCount, int triangleCount) {
    int index;
    SIZE_T required;
    if (triangleCount < 0 || triangleCount > PLAYABLE_TRIANGLE_BATCH_MAX_COUNT || byteCount < 0) return 0;
    if (triangleCount == 0) return 0;
    if (!records) return 0;
    required = (SIZE_T)triangleCount * (SIZE_T)PLAYABLE_TRIANGLE_BATCH_RECORD_BYTES;
    if (required > (SIZE_T)INT_MAX || (SIZE_T)byteCount < required) return 0;
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
    rasterClipMinimumY = work->minimumY;
    rasterClipMaximumY = work->maximumY;
    playable_window_draw_world_triangle_batch(work->records, work->byteCount, work->triangleCount,
        work->position[0], work->position[1], work->position[2],
        work->right[0], work->right[1], work->right[2],
        work->up[0], work->up[1], work->up[2],
        work->forward[0], work->forward[1], work->forward[2],
        work->halfWidth, work->halfHeight, work->focal, work->nearDistance);
    rasterClipMinimumY = 0;
    rasterClipMaximumY = INT_MAX;
}

static void CALLBACK drawWorldBatchBandCallback(PTP_CALLBACK_INSTANCE instance,
        void *context, PTP_WORK callbackWork) {
    (void)instance;
    (void)callbackWork;
    drawWorldBatchBand((playableWorldBatchWork *)context);
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
    if (rasterClipMaximumY == INT_MAX && triangleCount >= 256 && surfaceHeight >= 128) {
        SYSTEM_INFO systemInfo;
        playableWorldBatchWork work[4];
        PTP_WORK handles[4] = {0, 0, 0, 0};
        int bandCount;
        int band;
        GetSystemInfo(&systemInfo);
        bandCount = (int)systemInfo.dwNumberOfProcessors;
        if (bandCount > 4) bandCount = 4;
        if (bandCount > surfaceHeight) bandCount = surfaceHeight;
        if (bandCount > 1) {
            for (band = 0; band < bandCount; ++band) {
                playableWorldBatchWork *item = &work[band];
                item->records = records; item->byteCount = byteCount; item->triangleCount = triangleCount;
                item->position[0] = positionX; item->position[1] = positionY; item->position[2] = positionZ;
                item->right[0] = rightX; item->right[1] = rightY; item->right[2] = rightZ;
                item->up[0] = upX; item->up[1] = upY; item->up[2] = upZ;
                item->forward[0] = forwardX; item->forward[1] = forwardY; item->forward[2] = forwardZ;
                item->halfWidth = halfWidth; item->halfHeight = halfHeight; item->focal = focal;
                item->nearDistance = nearDistance;
                item->minimumY = surfaceHeight * band / bandCount;
                item->maximumY = surfaceHeight * (band + 1) / bandCount - 1;
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
            return triangleCount;
        }
    }
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
    GetClientRect(windowHandle, &client);
    StretchDIBits(windowDC, 0, 0, client.right, client.bottom,
        0, 0, surfaceWidth, surfaceHeight, pixels, &bitmapInfo,
        DIB_RGB_COLORS, SRCCOPY);
}

PLAYABLE_API void playable_window_shutdown(void) {
    HWND oldWindow = windowHandle;
    int slot;
    if (oldWindow && windowDC) ReleaseDC(oldWindow, windowDC);
    windowDC = 0;
    if (oldWindow) DestroyWindow(oldWindow);
    windowHandle = 0;
    closeRequested = 1;
    rawMouseEnabled = 0;
    releaseSurface();
    for (slot = 0; slot < PLAYABLE_TEXTURE_SLOTS; ++slot) playable_window_release_texture(slot);
}
