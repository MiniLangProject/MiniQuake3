/* SPDX-License-Identifier: GPL-2.0-or-later
 * Optional retained-renderer diagnostic capture. Include after the shared
 * raster state, texture catalog and batch ABI, before the hardware header.
 * MQ3_RENDER_TRACE selects the text filename; two sidecars retain unchanged
 * batch bytes and uploaded CPU texels for deterministic offline replay.
 * Disabled captures perform no allocations, file operations or pixel scans.
 */
#ifndef MQ3_PLAYABLE_RENDER_TRACE_H
#define MQ3_PLAYABLE_RENDER_TRACE_H
#include <stdio.h>

static char playableTracePath[32768];
static char playableTraceRecordsPath[32768];
static char playableTraceTexturesPath[32768];
static unsigned int playableTraceBatchNumber;
static unsigned char playableTraceTextureLogged[PLAYABLE_TEXTURE_SLOTS];

static int playableTraceSidecarPath(char *destination, size_t capacity,
        const char *path, const char *suffix) {
    size_t length = strlen(path);
    size_t extra = strlen(suffix);
    if (length + extra >= capacity) return 0;
    memcpy(destination, path, length);
    memcpy(destination + length, suffix, extra + 1);
    return 1;
}

static void playableTraceBeginFrame(int red, int green, int blue, int hardware) {
    FILE *file = 0;
    DWORD length = GetEnvironmentVariableA("MQ3_RENDER_TRACE", playableTracePath,
        (DWORD)sizeof(playableTracePath));
    playableTraceBatchNumber = 0;
    ZeroMemory(playableTraceTextureLogged, sizeof(playableTraceTextureLogged));
    if (!length || length >= sizeof(playableTracePath) ||
            !playableTraceSidecarPath(playableTraceRecordsPath, sizeof(playableTraceRecordsPath), playableTracePath, ".records") ||
            !playableTraceSidecarPath(playableTraceTexturesPath, sizeof(playableTraceTexturesPath), playableTracePath, ".textures")) {
        playableTracePath[0] = '\0';
        return;
    }
    if (fopen_s(&file, playableTracePath, "wb") != 0 || !file) {
        playableTracePath[0] = '\0';
        return;
    }
    fprintf(file, "MQ3_RENDER_TRACE version=1 recordBytes=%d backend=%s width=%d height=%d background=%d,%d,%d\n",
        PLAYABLE_TRIANGLE_BATCH_RECORD_BYTES, hardware ? "hardware" : "software",
        surfaceWidth, surfaceHeight, red, green, blue);
    fprintf(file, "FORMAT .records=raw128byteLittleEndianBatchRecords .textures=rawLittleEndianAARRGGBB32Texels offsets=bytes\n");
    fclose(file);
    if (fopen_s(&file, playableTraceRecordsPath, "wb") == 0 && file) fclose(file);
    if (fopen_s(&file, playableTraceTexturesPath, "wb") == 0 && file) fclose(file);
}

static void playableTraceTexture(FILE *textFile, int slot, int baseTriangles,
        int lightmapTriangles) {
    playableTexture *texture = &textures[slot];
    FILE *texels = 0;
    __int64 offset = -1;
    unsigned int minimum[4] = {255,255,255,255};
    unsigned int maximum[4] = {0,0,0,0};
    unsigned int zeroAlpha = 0;
    uint64_t hash = UINT64_C(14695981039346656037);
    SIZE_T count;
    SIZE_T pixel;
    int component;
    if (!texture->pixels || texture->width < 1 || texture->height < 1) {
        fprintf(textFile, "SLOT id=%d exists=0 baseTriangles=%d lightmapTriangles=%d\n", slot, baseTriangles, lightmapTriangles);
        return;
    }
    if (playableTraceTextureLogged[slot]) {
        fprintf(textFile, "SLOT id=%d exists=1 reuse=1 baseTriangles=%d lightmapTriangles=%d\n", slot, baseTriangles, lightmapTriangles);
        return;
    }
    playableTraceTextureLogged[slot] = 1;
    count = (SIZE_T)texture->width * (SIZE_T)texture->height;
    for (pixel = 0; pixel < count; ++pixel) {
        uint32_t color = texture->pixels[pixel];
        const unsigned int rgba[4] = {(color >> 16) & 255u,(color >> 8) & 255u,color & 255u,color >> 24};
        if (!rgba[3]) ++zeroAlpha;
        for (component = 0; component < 4; ++component) {
            if (rgba[component] < minimum[component]) minimum[component] = rgba[component];
            if (rgba[component] > maximum[component]) maximum[component] = rgba[component];
            hash = (hash ^ rgba[component]) * UINT64_C(1099511628211);
        }
    }
    if (fopen_s(&texels, playableTraceTexturesPath, "ab") == 0 && texels) {
        _fseeki64(texels, 0, SEEK_END);
        offset = _ftelli64(texels);
        if (fwrite(texture->pixels, sizeof(uint32_t), count, texels) != count) offset = -1;
        fclose(texels);
    }
    fprintf(textFile,
        "SLOT id=%d exists=1 width=%d height=%d mips=%d baseTriangles=%d lightmapTriangles=%d firstARGB=%08x centerARGB=%08x lastARGB=%08x minRGBA=%u,%u,%u,%u maxRGBA=%u,%u,%u,%u zeroAlpha=%u hashRGBA=%016llx texelsOffset=%lld texelsBytes=%llu\n",
        slot, texture->width, texture->height, texture->mipLevelCount,
        baseTriangles, lightmapTriangles, texture->pixels[0], texture->pixels[count/2], texture->pixels[count-1],
        minimum[0],minimum[1],minimum[2],minimum[3],maximum[0],maximum[1],maximum[2],maximum[3],
        zeroAlpha, (unsigned long long)hash, (long long)offset, (unsigned long long)(count * sizeof(uint32_t)));
}

static void playableTraceClearDepth(double depth) {
    FILE *file = 0;
    if (!playableTracePath[0]) return;
    if (fopen_s(&file, playableTracePath, "ab") == 0 && file) {
        fprintf(file, "CLEAR_DEPTH depth=%.17g\n", depth);
        fclose(file);
    }
}

/* position/right/up/forward == NULL describes an already projected screen
 * batch. A world batch preserves the exact camera passed to native projection.
 * Call once before dispatch to worker bands, not again in each worker. */
static void playableTraceBatch(const unsigned char *records, int count,
        int x, int y, int width, int height, const double *position,
        const double *right, const double *up, const double *forward,
        double focal, double nearDistance) {
    FILE *textFile = 0;
    FILE *batchFile = 0;
    __int64 offset = -1;
    int baseCounts[PLAYABLE_TEXTURE_SLOTS] = {0};
    int lightmapCounts[PLAYABLE_TEXTURE_SLOTS] = {0};
    int fallback = 0;
    int whiteFallback = 0;
    int index;
    int slot;
    if (!playableTracePath[0] || !records || count < 0 || count > PLAYABLE_TRIANGLE_BATCH_MAX_COUNT) return;
    if (fopen_s(&textFile, playableTracePath, "ab") != 0 || !textFile) return;
    if (fopen_s(&batchFile, playableTraceRecordsPath, "ab") == 0 && batchFile) {
        _fseeki64(batchFile, 0, SEEK_END);
        offset = _ftelli64(batchFile);
        if (fwrite(records, PLAYABLE_TRIANGLE_BATCH_RECORD_BYTES, (size_t)count, batchFile) != (size_t)count) offset = -1;
        fclose(batchFile);
    }
    fprintf(textFile, "BATCH id=%u triangles=%d recordsOffset=%lld kind=%s viewport=%d,%d,%d,%d\n",
        playableTraceBatchNumber++, count, (long long)offset, position ? "world" : "screen", x,y,width,height);
    if (position && right && up && forward) {
        fprintf(textFile,
            "VIEW position=%.17g,%.17g,%.17g right=%.17g,%.17g,%.17g up=%.17g,%.17g,%.17g forward=%.17g,%.17g,%.17g focal=%.17g near=%.17g\n",
            position[0],position[1],position[2],right[0],right[1],right[2],up[0],up[1],up[2],forward[0],forward[1],forward[2],focal,nearDistance);
    }
    fprintf(textFile,
        "STATE blend=%d depthEqual=%d depthWrite=%d depthScale=%.17g depthNear=%.17g alpha=%d clamp=%d polygonOffset=%d stencil=%d\n",
        rasterBlendMode,rasterDepthEqual,rasterDepthWrite,rasterDepthRangeScale,rasterDepthRangeNear,
        rasterAlphaTest,rasterClampTexture,rasterPolygonOffset,rasterStencilPass);
    for (index = 0; index < count; ++index) {
        playableTriangleBatchRecord command;
        int textured = 0;
        memcpy(&command, records + (SIZE_T)index * sizeof(command), sizeof(command));
        slot = command.baseTextureSlot;
        if (slot >= 0 && slot < PLAYABLE_TEXTURE_SLOTS) { ++baseCounts[slot]; if (textures[slot].pixels) textured = 1; }
        slot = command.lightmapTextureSlot;
        if (slot >= 0 && slot < PLAYABLE_TEXTURE_SLOTS) { ++lightmapCounts[slot]; if (textures[slot].pixels) textured = 1; }
        if (!textured) {
            ++fallback;
            if (command.fallbackRed == 255 && command.fallbackGreen == 255 && command.fallbackBlue == 255) ++whiteFallback;
        }
    }
    fprintf(textFile, "FALLBACK triangles=%d whiteTriangles=%d\n", fallback, whiteFallback);
    for (slot = 0; slot < PLAYABLE_TEXTURE_SLOTS; ++slot)
        if (baseCounts[slot] || lightmapCounts[slot]) playableTraceTexture(textFile, slot, baseCounts[slot], lightmapCounts[slot]);
    fclose(textFile);
}
#endif
