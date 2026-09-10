#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "../native/playable_win32.c"

#define BENCHMARK_TRIANGLES 1728
#define BENCHMARK_FRAMES 30

static void setVertex(float *vertex, double screenX, double screenY, double depth,
        double u, double v) {
    vertex[0] = (float)depth;
    vertex[1] = (float)((screenX - 320.0) * depth / 320.0);
    vertex[2] = (float)((240.0 - screenY) * depth / 320.0);
    vertex[3] = (float)u;
    vertex[4] = (float)v;
    vertex[5] = (float)u;
    vertex[6] = (float)v;
    vertex[7] = 0.65f;
}

static uint64_t surfaceHash(void) {
    uint64_t hash = UINT64_C(1469598103934665603);
    int index;
    for (index = 0; index < 640 * 480; ++index) {
        hash ^= pixels[index];
        hash *= UINT64_C(1099511628211);
        hash ^= (uint32_t)(depthPixels[index] * 1000000.0f);
        hash *= UINT64_C(1099511628211);
    }
    return hash;
}

static double render(playableTriangleBatchRecord *commands, int parallel, uint64_t *hash) {
    LARGE_INTEGER frequency;
    LARGE_INTEGER started;
    LARGE_INTEGER finished;
    int frame;
    rasterClipMinimumY = 0;
    rasterClipMaximumY = parallel ? INT_MAX : 479;
    QueryPerformanceFrequency(&frequency);
    QueryPerformanceCounter(&started);
    for (frame = 0; frame < BENCHMARK_FRAMES; ++frame) {
        playable_window_begin_frame(4, 7, 11);
        playable_window_draw_world_triangle_batch((const unsigned char *)commands,
            (int)(sizeof(*commands) * BENCHMARK_TRIANGLES), BENCHMARK_TRIANGLES,
            0.0, 0.0, 0.0,
            0.0, 1.0, 0.0,
            0.0, 0.0, 1.0,
            1.0, 0.0, 0.0,
            320.0, 240.0, 320.0, 1.0);
    }
    QueryPerformanceCounter(&finished);
    *hash = surfaceHash();
    rasterClipMaximumY = INT_MAX;
    return 1000.0 * (double)(finished.QuadPart - started.QuadPart) /
        (double)frequency.QuadPart;
}

int main(void) {
    static unsigned char texture[64 * 64 * 4];
    playableTriangleBatchRecord *commands;
    uint64_t serialHash;
    uint64_t parallelHash;
    double serialMilliseconds;
    double parallelMilliseconds;
    int triangle = 0;
    int index;
    int layer;
    int row;
    int column;
    for (index = 0; index < 64 * 64; ++index) {
        texture[index * 4] = (unsigned char)(index * 13);
        texture[index * 4 + 1] = (unsigned char)(index * 7);
        texture[index * 4 + 2] = (unsigned char)(index * 3);
        texture[index * 4 + 3] = 255;
    }
    commands = (playableTriangleBatchRecord *)calloc(BENCHMARK_TRIANGLES, sizeof(*commands));
    if (!commands || !allocateSurface(640, 480) ||
            !playable_window_upload_texture(0, texture, 64, 64) ||
            !playable_window_upload_texture(1, texture, 64, 64)) return 1;
    for (layer = 0; layer < 12; ++layer) {
        for (row = 0; row < 12; ++row) {
            for (column = 0; column < 12; ++column) {
                playableTriangleBatchRecord *command = &commands[triangle++];
                double x = (double)column * 54.0 - 4.0 + (double)(layer % 3);
                double y = (double)row * 41.0 - 5.0 + (double)(layer % 2);
                double depth = 80.0 - (double)layer;
                command->baseTextureSlot = 0;
                command->lightmapTextureSlot = 1;
                command->fallbackRed = command->fallbackGreen = command->fallbackBlue = 255;
                setVertex(command->vertex[0], x, y, depth, 0.0, 0.0);
                setVertex(command->vertex[1], x + 48.0, y + 2.0, depth + 3.0, 1.0, 0.0);
                setVertex(command->vertex[2], x + 20.0, y + 38.0, depth + 1.0, 0.5, 1.0);
            }
        }
    }
    serialMilliseconds = render(commands, 0, &serialHash);
    parallelMilliseconds = render(commands, 1, &parallelHash);
    if (serialHash != parallelHash) return 2;
    printf("world raster benchmark: triangles=%d frames=%d serial_ms=%.3f parallel_ms=%.3f speedup=%.2fx hash=%llu\n",
        BENCHMARK_TRIANGLES, BENCHMARK_FRAMES, serialMilliseconds, parallelMilliseconds,
        serialMilliseconds / parallelMilliseconds, (unsigned long long)parallelHash);
    playable_window_shutdown();
    free(commands);
    return 0;
}
