#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>

/* Include the implementation so the test can compare its private color and
 * depth surfaces without adding a diagnostic export to the shipping DLL. */
#include "../native/playable_win32.c"

static playableClipVertex cameraVertexForTest(const playableTriangleBatchRecord *record, int index) {
    playableClipVertex result;
    int component;
    result.vertex[0] = record->vertex[index][1];
    result.vertex[1] = record->vertex[index][2];
    result.vertex[2] = record->vertex[index][0];
    for (component = 3; component < 8; ++component) result.vertex[component] = record->vertex[index][component];
    for (component = 0; component < 4; ++component) result.color[component] = record->vertexColor[index][component];
    return result;
}

/* These fixtures use depths 3 and -1 with near=1: each expected boundary
 * vertex is independently known to be the exact midpoint of its edge. */
static playableClipVertex midpointForTest(playableClipVertex a, playableClipVertex b) {
    playableClipVertex result;
    int component;
    for (component = 0; component < 8; ++component) result.vertex[component] = (a.vertex[component] + b.vertex[component]) / 2.0;
    for (component = 0; component < 4; ++component) result.color[component] = (a.color[component] + b.color[component]) / 2.0;
    return result;
}

/* Reference projection of already clipped, explicit triangles. This calls
 * only the existing screen raster APIs, never the world clipping helpers. */
static void referenceTriangleForTest(const playableTriangleBatchRecord *record,
        const playableClipVertex *a, const playableClipVertex *b, const playableClipVertex *c,
        double centerX, double centerY, double focal) {
    const playableClipVertex *vertices[3] = { a, b, c };
    double projected[3][3];
    int vertex;
    int channel;
    rasterVertexColorEnabled = 1;
    rasterVertexColorUniform = 0;
    for (vertex = 0; vertex < 3; ++vertex) {
        projected[vertex][0] = centerX + focal * vertices[vertex]->vertex[0] / vertices[vertex]->vertex[2];
        projected[vertex][1] = centerY - focal * vertices[vertex]->vertex[1] / vertices[vertex]->vertex[2];
        projected[vertex][2] = vertices[vertex]->vertex[2];
        for (channel = 0; channel < 4; ++channel) rasterVertexColor[vertex][channel] = vertices[vertex]->color[channel];
    }
    if (record->lightmapTextureSlot >= 0) {
        playable_window_draw_triangle_multitexture(record->baseTextureSlot, record->lightmapTextureSlot,
            projected[0][0], projected[0][1], projected[0][2], a->vertex[3], a->vertex[4], a->vertex[5], a->vertex[6], a->vertex[7],
            projected[1][0], projected[1][1], projected[1][2], b->vertex[3], b->vertex[4], b->vertex[5], b->vertex[6], b->vertex[7],
            projected[2][0], projected[2][1], projected[2][2], c->vertex[3], c->vertex[4], c->vertex[5], c->vertex[6], c->vertex[7],
            record->fallbackRed, record->fallbackGreen, record->fallbackBlue);
    } else {
        playable_window_draw_triangle(record->baseTextureSlot,
            projected[0][0], projected[0][1], projected[0][2], a->vertex[3], a->vertex[4], a->vertex[7],
            projected[1][0], projected[1][1], projected[1][2], b->vertex[3], b->vertex[4], b->vertex[7],
            projected[2][0], projected[2][1], projected[2][2], c->vertex[3], c->vertex[4], c->vertex[7],
            record->fallbackRed, record->fallbackGreen, record->fallbackBlue);
    }
}

static int drawWorldForTest(const playableTriangleBatchRecord *records, int count, int viewport) {
    if (viewport) {
        return playable_window_draw_world_triangle_batch_viewport((const unsigned char *)records,
            count * (int)sizeof(*records), count, 40, 20, 16, 12,
            0,0,0, 0,1,0, 0,0,1, 1,0,0, 8,1);
    }
    return playable_window_draw_world_triangle_batch((const unsigned char *)records,
        count * (int)sizeof(*records), count,
        0,0,0, 0,1,0, 0,0,1, 1,0,0, 32,32,32,1);
}

static int nearPlaneContracts(void) {
    playableTriangleBatchRecord record;
    playableTriangleBatchRecord parallel[256];
    uint32_t expectedPixels[128 * 128];
    float expectedDepth[128 * 128];
    int lightmap;
    int behind;
    int viewport;
    int i;
    ZeroMemory(&record, sizeof(record));
    record.baseTextureSlot = 0;
    record.fallbackRed = record.fallbackGreen = record.fallbackBlue = 255;
    record.vertex[0][1] = -1; record.vertex[0][2] = -1;
    record.vertex[1][1] = 1; record.vertex[1][2] = -1;
    record.vertex[2][1] = 0; record.vertex[2][2] = 2;
    for (i = 0; i < 3; ++i) {
        record.vertex[i][3] = i == 1 ? 1.0f : 0.0f;
        record.vertex[i][4] = i == 2 ? 1.0f : 0.0f;
        record.vertex[i][5] = 0.25f + (float)i * 0.25f;
        record.vertex[i][6] = 0.75f - (float)i * 0.25f;
        record.vertex[i][7] = 0.5f + (float)i * 0.25f;
        record.vertexColor[i][0] = i == 0 ? 255 : 0;
        record.vertexColor[i][1] = i == 1 ? 255 : 0;
        record.vertexColor[i][2] = i == 2 ? 255 : 0;
        record.vertexColor[i][3] = (unsigned char)(95 + i * 80);
    }
    for (lightmap = 0; lightmap < 2; ++lightmap) {
        record.lightmapTextureSlot = lightmap ? 1 : -1;
        for (behind = 1; behind <= 2; ++behind) {
            playableClipVertex a;
            playableClipVertex b;
            playableClipVertex c;
            playableClipVertex ca;
            playableClipVertex ab;
            playableClipVertex bc;
            playableClipVertex input[3];
            playableClipVertex clipped[4];
            int clippedCount;
            int component;
            record.vertex[0][0] = 3;
            record.vertex[1][0] = behind == 2 ? -1.0f : 3.0f;
            record.vertex[2][0] = -1;
            a = cameraVertexForTest(&record, 0);
            b = cameraVertexForTest(&record, 1);
            c = cameraVertexForTest(&record, 2);
            ca = midpointForTest(c, a);
            ab = midpointForTest(a, b);
            bc = midpointForTest(b, c);
            input[0] = a; input[1] = b; input[2] = c;
            clippedCount = clipWorldTriangleNear(input, clipped, 1);
            if (clippedCount != (behind == 1 ? 4 : 3)) return 19;
            for (component = 0; component < 8; ++component) if (clipped[0].vertex[component] != ca.vertex[component]) return 20;
            for (component = 0; component < 4; ++component) if (clipped[0].color[component] != ca.color[component]) return 21;
            if (clipped[0].color[0] != 127.5 || clipped[0].color[2] != 127.5) return 22;
            for (viewport = 0; viewport < 2; ++viewport) {
                double centerX = viewport ? 48.0 : 32.0;
                double centerY = viewport ? 26.0 : 32.0;
                double focal = viewport ? 8.0 : 32.0;
                int colored = 0;
                playable_window_begin_frame(0,0,0);
                if (viewport) {
                    rasterClipMinimumX = 40; rasterClipMaximumX = 55;
                    rasterClipMinimumY = 20; rasterClipMaximumY = 31;
                }
                if (behind == 1) {
                    referenceTriangleForTest(&record, &ca, &a, &b, centerX, centerY, focal);
                    referenceTriangleForTest(&record, &ca, &b, &bc, centerX, centerY, focal);
                } else {
                    referenceTriangleForTest(&record, &ca, &a, &ab, centerX, centerY, focal);
                }
                rasterClipMinimumX = rasterClipMinimumY = 0;
                rasterClipMaximumX = rasterClipMaximumY = INT_MAX;
                for (i = 0; i < 128 * 128; ++i) if (pixels[i] != UINT32_C(0xff000000)) ++colored;
                if (!colored) {
                    fprintf(stderr, "empty near clip reference: lightmap=%d behind=%d viewport=%d\n", lightmap, behind, viewport);
                    return 23;
                }
                memcpy(expectedPixels, pixels, sizeof(expectedPixels));
                memcpy(expectedDepth, depthPixels, sizeof(expectedDepth));
                playable_window_begin_frame(0,0,0);
                if (drawWorldForTest(&record, 1, viewport) != 1) return 24;
                if (memcmp(expectedPixels, pixels, sizeof(expectedPixels)) || memcmp(expectedDepth, depthPixels, sizeof(expectedDepth))) {
                    fprintf(stderr, "near clip reference mismatch: lightmap=%d behind=%d viewport=%d\n", lightmap, behind, viewport);
                    return 25;
                }
                /* Repeated opaque copies produce the same reference but force
                 * the production scanline-worker path for the full viewport. */
                if (!viewport) {
                    for (i = 0; i < 256; ++i) parallel[i] = record;
                    playable_window_begin_frame(0,0,0);
                    rasterClipMaximumY = 127;
                    if (drawWorldForTest(parallel, 256, 0) != 256) return 26;
                    rasterClipMaximumY = INT_MAX;
                    memcpy(expectedPixels, pixels, sizeof(expectedPixels));
                    memcpy(expectedDepth, depthPixels, sizeof(expectedDepth));
                    playable_window_begin_frame(0,0,0);
                    if (drawWorldForTest(parallel, 256, 0) != 256) return 26;
                    if (memcmp(expectedPixels, pixels, sizeof(expectedPixels)) || memcmp(expectedDepth, depthPixels, sizeof(expectedDepth))) {
                        for (i = 0; i < 128 * 128; ++i) if (expectedPixels[i] != pixels[i] || expectedDepth[i] != depthPixels[i]) {
                            fprintf(stderr, "near clip parallel mismatch: lightmap=%d behind=%d pixel=%d,%d color=%08x/%08x depth=%g/%g\n", lightmap, behind, i%128, i/128, expectedPixels[i], pixels[i], expectedDepth[i], depthPixels[i]);
                            break;
                        }
                        return 27;
                    }
                }
            }
        }
    }
    /* Plane endpoints are retained once; an edge on the plane with the last
     * point behind has no area. Fully hidden or nonfinite geometry is empty. */
    for (i = 0; i < 3; ++i) record.vertex[i][0] = -1;
    playable_window_begin_frame(0,0,0);
    drawWorldForTest(&record, 1, 0);
    for (i = 0; i < 128 * 128; ++i) if (pixels[i] != UINT32_C(0xff000000)) return 28;
    {
        playableClipVertex input[3];
        playableClipVertex output[4];
        record.vertex[0][0] = record.vertex[1][0] = 1;
        for (i = 0; i < 3; ++i) input[i] = cameraVertexForTest(&record, i);
        if (clipWorldTriangleNear(input, output, 1) != 2) return 29;
        record.vertex[2][0] = 3;
        for (i = 0; i < 3; ++i) input[i] = cameraVertexForTest(&record, i);
        if (clipWorldTriangleNear(input, output, 1) != 3) return 30;
        playable_window_begin_frame(0,0,0);
        drawWorldForTest(&record, 1, 0);
        if (pixels[32 * 128 + 32] == UINT32_C(0xff000000)) return 31;
        record.vertex[0][0] = NAN;
        playable_window_begin_frame(0,0,0);
        drawWorldForTest(&record, 1, 0);
        for (i = 0; i < 128 * 128; ++i) if (pixels[i] != UINT32_C(0xff000000)) return 32;
    }
    puts("near-plane clipping: PASS (UV/light/RGBA, one/two/three hidden, plane endpoints, viewport and parallel pixels/depth)");
    return 0;
}

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
    int repeat;
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

    /* A refdef viewport shifts the projection center and scissors both axes.
     * This deliberately oversized triangle must touch pixels only inside the
     * 16x12 rectangle at (40,20). */
    command.baseTextureSlot = -1;
    command.lightmapTextureSlot = -1;
    command.fallbackRed = 255;
    command.fallbackGreen = 255;
    command.fallbackBlue = 255;
    command.vertex[0][0] = 10.0f; command.vertex[0][1] = -30.0f; command.vertex[0][2] = -30.0f;
    command.vertex[1][0] = 10.0f; command.vertex[1][1] = 30.0f; command.vertex[1][2] = -30.0f;
    command.vertex[2][0] = 10.0f; command.vertex[2][1] = 0.0f; command.vertex[2][2] = 30.0f;
    command.vertex[0][7] = 1.0f; command.vertex[1][7] = 1.0f; command.vertex[2][7] = 1.0f;
    playable_window_begin_frame(7, 10, 16);
    if (playable_window_draw_world_triangle_batch_viewport((const unsigned char *)&command,
            (int)sizeof(command), 1, 40, 20, 16, 12,
            0.0, 0.0, 0.0,
            0.0, 1.0, 0.0,
            0.0, 0.0, 1.0,
            1.0, 0.0, 0.0,
            8.0, 1.0) != 1) return 9;
    if (pixels[26 * 128 + 48] != UINT32_C(0xffffffff)) {
        fprintf(stderr, "viewport center pixel: actual=%08x\n", pixels[26 * 128 + 48]);
        return 10;
    }
    if (pixels[26 * 128 + 39] != UINT32_C(0xff070a10) ||
            pixels[26 * 128 + 56] != UINT32_C(0xff070a10) ||
            pixels[19 * 128 + 48] != UINT32_C(0xff070a10) ||
            pixels[32 * 128 + 48] != UINT32_C(0xff070a10)) {
        fprintf(stderr, "viewport outside pixels: %08x %08x %08x %08x\n",
            pixels[26 * 128 + 39], pixels[26 * 128 + 56],
            pixels[19 * 128 + 48], pixels[32 * 128 + 48]);
        return 11;
    }
    if (playable_window_draw_world_triangle_batch_viewport((const unsigned char *)&command,
            (int)sizeof(command), 1, 120, 120, 16, 12,
            0.0, 0.0, 0.0,
            0.0, 1.0, 0.0,
            0.0, 0.0, 1.0,
            1.0, 0.0, 0.0,
            8.0, 1.0) != 0) return 12;

    /* The viewport entry point used by refdef_t rendering must retain exact
     * serial pixels when it splits a sufficiently large world batch.  The
     * 256th opaque copy is intentionally redundant, allowing 255 records to
     * force the serial path while producing the same reference image. */
    for (vertex = 0; vertex < 256; ++vertex) parallelCommands[vertex] = command;
    playable_window_begin_frame(7, 10, 16);
    if (playable_window_draw_world_triangle_batch_viewport(
            (const unsigned char *)parallelCommands,
            (int)(sizeof(command) * 255), 255, 0, 0, 128, 128,
            0.0, 0.0, 0.0,
            0.0, 1.0, 0.0,
            0.0, 0.0, 1.0,
            1.0, 0.0, 0.0,
            32.0, 1.0) != 255) return 16;
    memcpy(expectedPixels, pixels, sizeof(expectedPixels));
    memcpy(expectedDepth, depthPixels, sizeof(expectedDepth));
    for (repeat = 0; repeat < 16; ++repeat) {
        playable_window_begin_frame(7, 10, 16);
        if (playable_window_draw_world_triangle_batch_viewport(
                (const unsigned char *)parallelCommands,
                (int)sizeof(parallelCommands), 256, 0, 0, 128, 128,
                0.0, 0.0, 0.0,
                0.0, 1.0, 0.0,
                0.0, 0.0, 1.0,
                1.0, 0.0, 0.0,
                32.0, 1.0) != 256) return 17;
        if (memcmp(expectedPixels, pixels, sizeof(expectedPixels)) != 0 ||
                memcmp(expectedDepth, depthPixels, sizeof(expectedDepth)) != 0) return 18;
    }

    /* Screen-space batches such as the sky retain command order while four
     * disjoint scanline bands rasterize in parallel. */
    for (vertex = 0; vertex < 256; ++vertex) {
        playableTriangleBatchRecord *screen = &parallelCommands[vertex];
        float x = (float)((vertex % 16) * 8);
        float y = (float)((vertex / 16) * 8);
        ZeroMemory(screen, sizeof(*screen));
        screen->baseTextureSlot = -1;screen->lightmapTextureSlot = -1;
        screen->fallbackRed = 37;screen->fallbackGreen = 91;screen->fallbackBlue = 173;
        memset(screen->vertexColor, 255, sizeof(screen->vertexColor));
        screen->vertex[0][0] = x;screen->vertex[0][1] = y;screen->vertex[0][2] = 2.0f;screen->vertex[0][7] = 1.0f;
        screen->vertex[1][0] = x + 7.0f;screen->vertex[1][1] = y;screen->vertex[1][2] = 2.0f;screen->vertex[1][7] = 1.0f;
        screen->vertex[2][0] = x;screen->vertex[2][1] = y + 7.0f;screen->vertex[2][2] = 2.0f;screen->vertex[2][7] = 1.0f;
    }
    playable_window_begin_frame(7, 10, 16);
    rasterClipMaximumY = 127;
    if (playable_window_draw_triangle_batch((const unsigned char *)parallelCommands,
            (int)sizeof(parallelCommands), 256) != 256) return 13;
    rasterClipMaximumY = INT_MAX;
    memcpy(expectedPixels, pixels, sizeof(expectedPixels));
    memcpy(expectedDepth, depthPixels, sizeof(expectedDepth));
    for (repeat = 0; repeat < 16; ++repeat) {
        playable_window_begin_frame(7, 10, 16);
        if (playable_window_draw_triangle_batch((const unsigned char *)parallelCommands,
                (int)sizeof(parallelCommands), 256) != 256) return 14;
        if (memcmp(expectedPixels, pixels, sizeof(expectedPixels)) != 0 ||
                memcmp(expectedDepth, depthPixels, sizeof(expectedDepth)) != 0) return 15;
    }
    {
        int result = nearPlaneContracts();
        if (result) return result;
    }
    playable_window_shutdown();
    puts("playable world batch native parity: PASS");
    return 0;
}
