/* SPDX-License-Identifier: GPL-2.0-or-later
 * Retained sky packing. MiniLang owns the original camera/ray math; this
 * boundary preserves its double UVs until the final binary32 batch stores.
 */
#ifndef PLAYABLE_SKY_MATH_H
#define PLAYABLE_SKY_MATH_H

typedef struct playableSkySourceVertex_s { double x, y, u, v; } playableSkySourceVertex;
typedef char playableSkySourceVertexSizeMustBe32[sizeof(playableSkySourceVertex) == 32 ? 1 : -1];

PLAYABLE_API int playable_window_draw_triangle_batch(const unsigned char *records, int byteCount, int triangleCount);

PLAYABLE_API int playable_window_store_sky_vertex(unsigned char *source, int bytes, int index,
        double x, double y, double u, double v) {
    playableSkySourceVertex value;
    SIZE_T offset;
    if (!source || bytes < 0 || index < 0 || !_finite(x) || !_finite(y) || !_finite(u) || !_finite(v)) return 0;
    offset = (SIZE_T)index * sizeof(value);
    if (offset + sizeof(value) > (SIZE_T)bytes) return 0;
    value.x = x; value.y = y; value.u = u; value.v = v;
    memcpy(source + offset, &value, sizeof(value));
    return 1;
}

static void playableSkyWriteTriangle(playableTriangleBatchRecord *record, int slot,
        const playableSkySourceVertex *a, const playableSkySourceVertex *b,
        const playableSkySourceVertex *c, double scaleU, double scaleV,
        double scrollU, double scrollV, double depth) {
    const playableSkySourceVertex *points[3];
    int corner;
    points[0] = a; points[1] = b; points[2] = c;
    memset(record, 0, sizeof(*record));
    record->baseTextureSlot = slot; record->lightmapTextureSlot = -1;
    record->fallbackRed = 255; record->fallbackGreen = 255; record->fallbackBlue = 255;
    memset(record->vertexColor, 255, sizeof(record->vertexColor));
    for (corner = 0; corner < 3; ++corner) {
        double u = points[corner]->u * scaleU + scrollU;
        record->vertex[corner][0] = (float)points[corner]->x;
        record->vertex[corner][1] = (float)points[corner]->y;
        record->vertex[corner][2] = (float)depth;
        record->vertex[corner][3] = (float)u;
        record->vertex[corner][4] = (float)(points[corner]->v * scaleV + scrollV);
        record->vertex[corner][7] = 1.0f;
    }
}

PLAYABLE_API int playable_window_update_sky_layer(unsigned char *records, int bytes, int firstTriangle,
        const unsigned char *source, int sourceBytes, int columns, int rows, int slot,
        double scaleU, double scaleV, double scrollU, double scrollV, double nowMilliseconds, double depth) {
    const playableSkySourceVertex *grid = (const playableSkySourceVertex *)source;
    playableTriangleBatchRecord *output;
    int row, column, index = 0;
    SIZE_T triangleCount, vertexCount, offset;
    double seconds, offsetU, offsetV;
    if (!records || !source || bytes < 0 || sourceBytes < 0 || firstTriangle < 0 ||
            columns < 1 || columns > 256 || rows < 1 || rows > 256 ||
            !_finite(scaleU) || !_finite(scaleV) || !_finite(scrollU) || !_finite(scrollV) ||
            !_finite(nowMilliseconds) || nowMilliseconds < 0.0 || !_finite(depth) || depth <= 0.0) return 0;
    triangleCount = (SIZE_T)columns * (SIZE_T)rows * 2u;
    vertexCount = ((SIZE_T)columns + 1u) * ((SIZE_T)rows + 1u);
    offset = (SIZE_T)firstTriangle * sizeof(playableTriangleBatchRecord);
    if (offset + triangleCount * sizeof(playableTriangleBatchRecord) > (SIZE_T)bytes ||
            vertexCount * sizeof(playableSkySourceVertex) > (SIZE_T)sourceBytes) return 0;
    seconds = nowMilliseconds / 1000.0;
    offsetU = seconds * scrollU; offsetV = seconds * scrollV;
    output = (playableTriangleBatchRecord *)(records + offset);
    for (row = 0; row < rows; ++row) {
        int current = row * (columns + 1), next = current + columns + 1;
        for (column = 0; column < columns; ++column) {
            const playableSkySourceVertex *a = &grid[current + column];
            const playableSkySourceVertex *b = a + 1;
            const playableSkySourceVertex *d = &grid[next + column];
            const playableSkySourceVertex *c = d + 1;
            playableSkyWriteTriangle(&output[index++], slot, a, b, c, scaleU, scaleV, offsetU, offsetV, depth);
            playableSkyWriteTriangle(&output[index++], slot, a, c, d, scaleU, scaleV, offsetU, offsetV, depth);
        }
    }
    return index;
}

/* The legacy ADD mode uses SRC_ALPHA,ONE for preview effects. Sky scripts
 * specify ONE,ONE, so retain their original factor bits through generic mode. */
PLAYABLE_API int playable_window_draw_sky_layer(const unsigned char *records, int bytes,
        int firstTriangle, int triangleCount, int additive) {
    int oldBlend = rasterBlendMode, oldEqual = rasterDepthEqual, oldWrite = rasterDepthWrite;
    int oldAlpha = rasterAlphaTest, oldClamp = rasterClampTexture, oldOffset = rasterPolygonOffset;
    int result;
    SIZE_T offset, required;
    if (!records || bytes < 0 || firstTriangle < 0 || triangleCount < 1 ||
            triangleCount > PLAYABLE_TRIANGLE_BATCH_MAX_COUNT || (additive != 0 && additive != 1)) return 0;
    offset = (SIZE_T)firstTriangle * sizeof(playableTriangleBatchRecord);
    required = (SIZE_T)triangleCount * sizeof(playableTriangleBatchRecord);
    if (offset + required > (SIZE_T)bytes) return 0;
    rasterBlendMode = additive ? 0x122 : 0;
    rasterDepthEqual = 0; rasterDepthWrite = 0; rasterAlphaTest = 0;
    rasterClampTexture = 0; rasterPolygonOffset = 0;
    result = playable_window_draw_triangle_batch(records + offset, (int)required, triangleCount);
    rasterBlendMode = oldBlend; rasterDepthEqual = oldEqual; rasterDepthWrite = oldWrite;
    rasterAlphaTest = oldAlpha; rasterClampTexture = oldClamp; rasterPolygonOffset = oldOffset;
    return result;
}

#endif
