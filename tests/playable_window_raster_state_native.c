#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <float.h>
#include <stdint.h>
#include <stdio.h>

/* Include the implementation so this regression can inspect the private
 * color and depth surfaces without exposing test-only DLL entry points. */
#include "../native/playable_win32.c"

static void drawUiTriangle(int textureSlot) {
    playable_window_draw_triangle(textureSlot,
        1.0, 1.0, 2.0, 0.0, 0.0, 1.0,
        7.0, 1.0, 2.0, 0.0, 0.0, 1.0,
        1.0, 7.0, 2.0, 0.0, 0.0, 1.0,
        255, 255, 255);
}

int main(void) {
    static const unsigned char halfRed[4] = { 255, 0, 0, 128 };
    static const unsigned char halfBlue[4] = { 0, 0, 255, 128 };
    const SIZE_T sample = 2u * 8u + 2u;
    float clearedDepth;

    if (!allocateSurface(8, 8) ||
            !playable_window_upload_texture(0, halfRed, 1, 1) ||
            !playable_window_upload_texture(1, halfBlue, 1, 1)) return 1;

    playable_window_begin_frame(0, 0, 0);
    clearedDepth = depthPixels[sample];
    if (!(clearedDepth > 0.0f && clearedDepth < 1.0f / 1000000.0f)) return 2;
    if (!playable_window_set_raster_state(1, 0, 0)) return 3;

    drawUiTriangle(0);
    drawUiTriangle(1);

    /* Red at 50% over black, then blue at 50% at the same depth. Both UI
     * layers must survive, and disabled depth writes must preserve clear. */
    if (pixels[sample] != UINT32_C(0x00400080)) return 4;
    if (depthPixels[sample] != clearedDepth) return 5;

    /* Control case: with depth writes enabled, the first equal-depth layer
     * occludes the second under the normal strict depth comparison. */
    playable_window_begin_frame(0, 0, 0);
    if (!playable_window_set_raster_state(1, 0, 1)) return 6;
    drawUiTriangle(0);
    drawUiTriangle(1);
    if (pixels[sample] != UINT32_C(0x00800000)) return 7;
    if (depthPixels[sample] != 0.5f) return 8;

    playable_window_shutdown();
    puts("playable window raster-state regression: PASS");
    return 0;
}
