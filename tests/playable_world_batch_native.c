#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>

/* Include the implementation so the test can compare its private color and
 * depth surfaces without adding a diagnostic export to the shipping DLL. */
#include "../native/playable_win32.c"

int main(void) {
    static const unsigned char baseRgba[16] = {
        240, 80, 20, 255, 20, 220, 60, 255,
        20, 60, 240, 255, 210, 180, 40, 192
    };
    static const unsigned char lightmapRgba[16] = {
        128, 255, 192, 255, 255, 128, 192, 255,
        192, 192, 255, 255, 224, 160, 128, 255
    };
    playableTriangleBatchRecord command;
    uint32_t expectedPixels[128 * 128];
    float expectedDepth[128 * 128];
    playableTriangleBatchRecord parallelCommands[256];
    const double halfWidth = 32.0;
    const double halfHeight = 32.0;
    const double focal = 32.0;
    int vertex;

    ZeroMemory(&command, sizeof(command));
    memset(command.vertexColor, 255, sizeof(command.vertexColor));
    command.baseTextureSlot = 0;
    command.lightmapTextureSlot = 1;
    command.fallbackRed = 255;
    command.fallbackGreen = 128;
    command.fallbackBlue = 32;
    command.vertex[0][0] = 10.0f; command.vertex[0][1] = -3.0f; command.vertex[0][2] = -2.0f;
    command.vertex[1][0] = 10.0f; command.vertex[1][1] = 3.0f; command.vertex[1][2] = -2.0f;
    command.vertex[2][0] = 10.0f; command.vertex[2][1] = 0.0f; command.vertex[2][2] = 3.0f;
    for (vertex = 0; vertex < 3; ++vertex) {
        command.vertex[vertex][3] = vertex == 1 ? 1.0f : 0.0f;
        command.vertex[vertex][4] = vertex == 2 ? 1.0f : 0.0f;
        command.vertex[vertex][5] = command.vertex[vertex][3];
        command.vertex[vertex][6] = command.vertex[vertex][4];
        command.vertex[vertex][7] = 0.35f + (float)vertex * 0.3f;
    }
    if (!allocateSurface(128, 128) ||
            !playable_window_upload_texture(0, baseRgba, 2, 2) ||
            !playable_window_upload_texture(1, lightmapRgba, 2, 2)) return 1;
    playable_window_begin_frame(7, 10, 16);
    playable_window_draw_triangle_multitexture(0, 1,
        halfWidth + (double)command.vertex[0][1] * focal / (double)command.vertex[0][0],
        halfHeight - (double)command.vertex[0][2] * focal / (double)command.vertex[0][0],
        command.vertex[0][0], command.vertex[0][3], command.vertex[0][4], command.vertex[0][5], command.vertex[0][6], command.vertex[0][7],
        halfWidth + (double)command.vertex[1][1] * focal / (double)command.vertex[1][0],
        halfHeight - (double)command.vertex[1][2] * focal / (double)command.vertex[1][0],
        command.vertex[1][0], command.vertex[1][3], command.vertex[1][4], command.vertex[1][5], command.vertex[1][6], command.vertex[1][7],
        halfWidth + (double)command.vertex[2][1] * focal / (double)command.vertex[2][0],
        halfHeight - (double)command.vertex[2][2] * focal / (double)command.vertex[2][0],
        command.vertex[2][0], command.vertex[2][3], command.vertex[2][4], command.vertex[2][5], command.vertex[2][6], command.vertex[2][7],
        command.fallbackRed, command.fallbackGreen, command.fallbackBlue);
    memcpy(expectedPixels, pixels, sizeof(expectedPixels));
    memcpy(expectedDepth, depthPixels, sizeof(expectedDepth));

    playable_window_begin_frame(7, 10, 16);
    if (playable_window_draw_world_triangle_batch((const unsigned char *)&command,
            (int)sizeof(command), 1,
            0.0, 0.0, 0.0,
            0.0, 1.0, 0.0,
            0.0, 0.0, 1.0,
            1.0, 0.0, 0.0,
            halfWidth, halfHeight, focal, 1.0) != 1) return 2;
    if (memcmp(expectedPixels, pixels, sizeof(expectedPixels)) != 0 ||
            memcmp(expectedDepth, depthPixels, sizeof(expectedDepth)) != 0) return 3;

    memset(command.vertexColor, 128, sizeof(command.vertexColor));
    playable_window_begin_frame(7, 10, 16);
    if (playable_window_draw_world_triangle_batch((const unsigned char *)&command,
            (int)sizeof(command), 1,
            0.0, 0.0, 0.0,
            0.0, 1.0, 0.0,
            0.0, 0.0, 1.0,
            1.0, 0.0, 0.0,
            halfWidth, halfHeight, focal, 1.0) != 1) return 7;
    if (pixels[32 * 128 + 32] != modulateColorRgba(expectedPixels[32 * 128 + 32],
            128.0 / 255.0, 128.0 / 255.0, 128.0 / 255.0, 128.0 / 255.0)) {
        fprintf(stderr, "vertex color pixel: actual=%08x expected=%08x base=%08x\n",
            pixels[32 * 128 + 32], modulateColorRgba(expectedPixels[32 * 128 + 32],
            128.0 / 255.0, 128.0 / 255.0, 128.0 / 255.0, 128.0 / 255.0), expectedPixels[32 * 128 + 32]);
        return 8;
    }
    memset(command.vertexColor, 255, sizeof(command.vertexColor));

    for (vertex = 0; vertex < 256; ++vertex) {
        parallelCommands[vertex] = command;
        parallelCommands[vertex].vertex[0][1] += (float)((vertex % 8) - 4) * 0.2f;
        parallelCommands[vertex].vertex[1][1] += (float)((vertex % 8) - 4) * 0.2f;
        parallelCommands[vertex].vertex[2][2] += (float)((vertex % 5) - 2) * 0.2f;
    }
    playable_window_begin_frame(7, 10, 16);
    rasterClipMaximumY = 127;
    if (playable_window_draw_world_triangle_batch((const unsigned char *)parallelCommands,
            (int)sizeof(parallelCommands), 256,
            0.0, 0.0, 0.0,
            0.0, 1.0, 0.0,
            0.0, 0.0, 1.0,
            1.0, 0.0, 0.0,
            halfWidth, halfHeight, focal, 1.0) != 256) return 4;
    rasterClipMaximumY = INT_MAX;
    memcpy(expectedPixels, pixels, sizeof(expectedPixels));
    memcpy(expectedDepth, depthPixels, sizeof(expectedDepth));
    playable_window_begin_frame(7, 10, 16);
    if (playable_window_draw_world_triangle_batch((const unsigned char *)parallelCommands,
            (int)sizeof(parallelCommands), 256,
            0.0, 0.0, 0.0,
            0.0, 1.0, 0.0,
            0.0, 0.0, 1.0,
            1.0, 0.0, 0.0,
            halfWidth, halfHeight, focal, 1.0) != 256) return 5;
    if (memcmp(expectedPixels, pixels, sizeof(expectedPixels)) != 0 ||
            memcmp(expectedDepth, depthPixels, sizeof(expectedDepth)) != 0) return 6;
    playable_window_shutdown();
    puts("playable world batch native parity: PASS");
    return 0;
}
