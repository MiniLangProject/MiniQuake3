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

static void drawStencilTriangle(int frontFacing) {
    if (frontFacing) {
        playable_window_draw_triangle(-1,
            1.0, 1.0, 2.0, 0.0, 0.0, 1.0,
            1.0, 7.0, 2.0, 0.0, 0.0, 1.0,
            7.0, 1.0, 2.0, 0.0, 0.0, 1.0, 255, 255, 255);
    } else {
        drawUiTriangle(-1);
    }
}

static void drawUiTriangleUv(int textureSlot, double u) {
    playable_window_draw_triangle(textureSlot,
        1.0, 1.0, 2.0, u, 0.0, 1.0,
        7.0, 1.0, 2.0, u, 0.0, 1.0,
        1.0, 7.0, 2.0, u, 0.0, 1.0,
        255, 255, 255);
}

static void drawUiTriangleUv2(int textureSlot, double u, double v) {
    playable_window_draw_triangle(textureSlot,
        1.0, 1.0, 2.0, u, v, 1.0,
        7.0, 1.0, 2.0, u, v, 1.0,
        1.0, 7.0, 2.0, u, v, 1.0,
        255, 255, 255);
}

static int drawShaderRecords(playableTriangleBatchRecord *records, int count, int world) {
    if (!world) return playable_window_draw_triangle_batch((const unsigned char *)records,
        count * (int)sizeof(*records), count);
    return playable_window_draw_world_triangle_batch((const unsigned char *)records,
        count * (int)sizeof(*records), count,
        0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 64, 64, 64, 1);
}

static int shaderBlendContracts(void) {
    static const int originalAliases[] = {0, 0x165, 0x122, 0x113, 0x183, 0x123, 0x141, 0x162};
    static const uint32_t colors[] = {0x00f06432u, 0x010000ffu, 0x7f2165cdu, 0x8025788bu,
        0xfe9c0304u, 0xffffffffu, 0x43519abcu, 0xff000000u};
    static const unsigned char zeroAlpha[] = {80, 140, 220, 0};
    static const unsigned char opaque[] = {80, 140, 220, 255};
    static const unsigned char white[] = {255, 255, 255, 255};
    playableTriangleBatchRecord records[256];
    uint32_t serial[128 * 128];
    float legacyDepth;
    int mode, source, destination, path, alphaSource, vertex, i;
    for (mode = 1; mode <= 7; ++mode) for (source = 0; source < 8; ++source)
        for (destination = 0; destination < 8; ++destination) {
            uint32_t actual = applyBlendColor(colors[source], colors[destination], mode);
            uint32_t expected = genericBlendColor(colors[source], colors[destination], originalAliases[mode]);
            if (actual != expected) {
                fprintf(stderr, "software blend alias %d: %08x != original factors %08x\n", mode, actual, expected);
                return 0;
            }
        }
    if (!allocateSurface(128, 128) || !playable_window_upload_texture(7, zeroAlpha, 1, 1) ||
            !playable_window_upload_texture(8, opaque, 1, 1) ||
            !playable_window_upload_texture(9, white, 1, 1)) return 0;
    for (path = 0; path < 6; ++path) for (alphaSource = 0; alphaSource < 2; ++alphaSource) {
        int world = path & 1;
        ZeroMemory(records, sizeof(records));
        records[0].baseTextureSlot = alphaSource ? 8 : 7;
        records[0].lightmapTextureSlot = path >= 2 && path < 4 || path == 5 ? 9 : -1;
        records[0].fallbackRed = records[0].fallbackGreen = records[0].fallbackBlue = 255;
        memset(records[0].vertexColor, 255, sizeof(records[0].vertexColor));
        records[0].vertex[0][0] = 4;records[0].vertex[0][1] = 4;
        records[0].vertex[1][0] = 124;records[0].vertex[1][1] = 4;
        records[0].vertex[2][0] = 4;records[0].vertex[2][1] = 124;
        /* Last two paths exercise generated near-plane vertices as well. */
        if (path >= 4) world = 1;
        for (vertex = 0; vertex < 3; ++vertex) {
            float *p = records[0].vertex[vertex];
            p[2] = path >= 4 && vertex == 2 ? 0.5f : 2.0f;p[7] = 1;
            if (world) {
                float screenX = p[0], screenY = p[1], depth = p[2];
                p[0] = depth;p[1] = (screenX - 64) * depth / 64;p[2] = (64 - screenY) * depth / 64;
            }
            if (alphaSource) records[0].vertexColor[vertex][3] = 0;
        }
        for (i = 1; i < 256; ++i) records[i] = records[0];
        for (mode = 0; mode <= 2; ++mode) {
            uint32_t expected = mode == 0 ? 0x00508cdcu : mode == 1 ? 0xff25518fu : 0xff75ddffu;
            /* Sample center (16.5,16.5) has b2=12.5/120: reciprocal depth
             * is .5 + b2*(2-.5) = .65625 for the clipped triangle. */
            float expectedDepth = path >= 4 ? 0.65625f : 0.5f;
            playable_window_begin_frame(37, 81, 143);
            playable_window_set_raster_state(mode, 0, 1);
            if (drawShaderRecords(records, 1, world) != 1 || pixels[16 * 128 + 16] != expected ||
                    depthPixels[16 * 128 + 16] != expectedDepth || rasterShaderBatch) {
                fprintf(stderr, "zero-alpha shader path=%d alphaSource=%d mode=%d actual=%08x wanted=%08x depth=%g\n",
                    path, alphaSource, mode, pixels[16 * 128 + 16], expected, depthPixels[16 * 128 + 16]);
                return 0;
            }
        }
        /* Both batch entry points set shader policy on every raster worker. */
        playable_window_begin_frame(37, 81, 143);playable_window_set_raster_state(2, 0, 0);
        rasterClipMaximumY = 127;
        if (drawShaderRecords(records, 256, world) != 256) return 0;
        memcpy(serial, pixels, sizeof(serial));rasterClipMaximumY = INT_MAX;
        playable_window_begin_frame(37, 81, 143);playable_window_set_raster_state(2, 0, 0);
        if (drawShaderRecords(records, 256, world) != 256 || memcmp(serial, pixels, sizeof(serial)) ||
                pixels[16 * 128 + 16] != 0xffffffffu || rasterShaderBatch) {
            int pixel;
            fprintf(stderr, "zero-alpha parallel path=%d alphaSource=%d actual=%08x shaderFlag=%d\n",
                path, alphaSource, pixels[16 * 128 + 16], rasterShaderBatch);
            for (pixel = 0; pixel < 128 * 128; ++pixel) if (serial[pixel] != pixels[pixel]) {
                fprintf(stderr, "pixel %d,%d serial=%08x parallel=%08x\n", pixel%128, pixel/128, serial[pixel], pixels[pixel]);break;
            }
            return 0;
        }
    }
    /* Shader policy must not leak into the direct font-atlas API. */
    playable_window_begin_frame(37, 81, 143);playable_window_set_raster_state(2, 0, 1);
    legacyDepth = depthPixels[16 * 128 + 16];
    playable_window_draw_triangle(7, 4,4,2,0,0,1, 124,4,2,0,0,1, 4,124,2,0,0,1, 255,255,255);
    if (pixels[16 * 128 + 16] != 0xff25518fu || depthPixels[16 * 128 + 16] != legacyDepth) {
        fprintf(stderr, "legacy after shader actual=%08x depth=%g\n", pixels[16 * 128 + 16], depthPixels[16 * 128 + 16]);return 0;
    }
    puts("PASS: 448 software blend aliases; zero-alpha screen/world/multitexture/clipped shader batches and parallel parity");
    return 1;
}

int main(void) {
    static const unsigned char halfRed[4] = { 255, 0, 0, 128 };
    static const unsigned char halfBlue[4] = { 0, 0, 255, 128 };
    static const unsigned char lowGreen[4] = { 0, 255, 0, 127 };
    static const unsigned char filterGray[4] = { 128, 64, 255, 255 };
    static const unsigned char baseGray[4] = { 64, 128, 32, 255 };
    static const unsigned char edgeColors[8] = { 255, 0, 0, 255, 0, 255, 0, 255 };
    static const unsigned char bilinearColors[16] = {
        255, 0, 0, 255, 0, 255, 0, 255,
        0, 0, 255, 255, 255, 255, 255, 255
    };
    const SIZE_T sample = 2u * 8u + 2u;
    float clearedDepth;
    int stencilIteration;

    if (!allocateSurface(8, 8) ||
            !playable_window_upload_texture(0, halfRed, 1, 1) ||
            !playable_window_upload_texture(1, halfBlue, 1, 1) ||
            !playable_window_upload_texture(2, lowGreen, 1, 1) ||
            !playable_window_upload_texture(3, filterGray, 1, 1) ||
            !playable_window_upload_texture(4, edgeColors, 2, 1) ||
            !playable_window_upload_texture(5, bilinearColors, 2, 2) ||
            !playable_window_upload_texture(6, baseGray, 1, 1)) return 1;

    playable_window_begin_frame(0, 0, 0);
    clearedDepth = depthPixels[sample];
    if (!(clearedDepth > 0.0f && clearedDepth < 1.0f / 1000000.0f)) return 2;
    if (!playable_window_set_raster_state(1, 0, 0)) return 3;

    drawUiTriangle(0);
    drawUiTriangle(1);

    /* Red at 50% over black, then blue at 50% at the same depth. Both UI
     * layers must survive, and disabled depth writes must preserve clear. */
    if (pixels[sample] != UINT32_C(0x9f400080)) return 4;
    if (depthPixels[sample] != clearedDepth) return 5;

    /* Control case: with depth writes enabled, the first equal-depth layer
     * occludes the second under the normal strict depth comparison. */
    playable_window_begin_frame(0, 0, 0);
    if (!playable_window_set_raster_state(1, 0, 1)) return 6;
    drawUiTriangle(0);
    drawUiTriangle(1);
    if (pixels[sample] != UINT32_C(0xbf800000)) return 7;
    if (depthPixels[sample] != 0.5f) return 8;

    /* RF_DEPTHHACK maps a far viewmodel into the front 30 percent while a
     * fragment exactly on the near plane still wins. */
    playable_window_begin_frame(0, 0, 0);
    if (!playable_window_set_raster_state(0, 0, 1)) return 9;
    playable_window_draw_triangle(-1,
        1.0, 1.0, 2.0, 0.0, 0.0, 1.0,
        7.0, 1.0, 2.0, 0.0, 0.0, 1.0,
        1.0, 7.0, 2.0, 0.0, 0.0, 1.0, 255, 0, 0);
    if (!playable_window_set_depth_range(0.3, 1.0)) return 10;
    playable_window_draw_triangle(-1,
        1.0, 1.0, 10.0, 0.0, 0.0, 1.0,
        7.0, 1.0, 10.0, 0.0, 0.0, 1.0,
        1.0, 7.0, 10.0, 0.0, 0.0, 1.0, 0, 0, 255);
    if (pixels[sample] != UINT32_C(0xff0000ff)) return 11;
    if (depthPixels[sample] < 0.7299f || depthPixels[sample] > 0.7301f) return 12;
    playable_window_begin_frame(0, 0, 0);
    playable_window_draw_triangle(-1,
        1.0, 1.0, 1.0, 0.0, 0.0, 1.0,
        7.0, 1.0, 1.0, 0.0, 0.0, 1.0,
        1.0, 7.0, 1.0, 0.0, 0.0, 1.0, 255, 0, 0);
    if (!playable_window_set_depth_range(0.3, 1.0)) return 13;
    playable_window_draw_triangle(-1,
        1.0, 1.0, 10.0, 0.0, 0.0, 1.0,
        7.0, 1.0, 10.0, 0.0, 0.0, 1.0,
        1.0, 7.0, 10.0, 0.0, 0.0, 1.0, 0, 0, 255);
    if (pixels[sample] != UINT32_C(0xffff0000)) return 14;

    /* Quake 3's GE128 cutout keeps alpha 128 as an opaque fragment and
     * discards alpha 127 without touching color or depth. */
    playable_window_begin_frame(0, 0, 0);
    if (!playable_window_set_alpha_test(3)) return 15;
    drawUiTriangle(2);
    if (pixels[sample] != UINT32_C(0xff000000) || depthPixels[sample] != clearedDepth) return 16;
    drawUiTriangle(1);
    if (pixels[sample] != UINT32_C(0x800000ff) || depthPixels[sample] != 0.5f) return 17;

    /* LT128 is the inverse threshold and also writes surviving texels
     * opaquely when blending is disabled. */
    playable_window_begin_frame(0, 0, 0);
    if (!playable_window_set_alpha_test(2)) return 18;
    drawUiTriangle(1);
    drawUiTriangle(2);
    if (pixels[sample] != UINT32_C(0x7f00ff00) || depthPixels[sample] != 0.5f) return 19;

    /* GL_DST_COLOR/GL_ZERO multiplies the new stage with the framebuffer. */
    playable_window_begin_frame(0, 0, 0);
    if (!playable_window_set_alpha_test(0) || !playable_window_set_raster_state(0, 0, 1)) return 20;
    drawUiTriangle(0);
    if (!playable_window_set_raster_state(3, 1, 0)) return 21;
    drawUiTriangle(3);
    if (pixels[sample] != UINT32_C(0x80800000) || depthPixels[sample] != 0.5f) return 22;

    /* GL_DST_COLOR/GL_ONE_MINUS_DST_ALPHA consumes preserved destination alpha. */
    playable_window_begin_frame(0, 0, 0);
    if (!playable_window_set_raster_state(0, 0, 1)) return 23;
    drawUiTriangle(0);
    if (!playable_window_set_raster_state(4, 1, 0)) return 24;
    drawUiTriangle(3);
    if (pixels[sample] != UINT32_C(0xc0ff0000) || depthPixels[sample] != 0.5f) return 25;
    if (playable_window_set_raster_state(8, 0, 0)) return 26;

    playable_window_begin_frame(0, 0, 0);
    drawUiTriangleUv(4, 1.25);
    if (pixels[sample] != UINT32_C(0xffff0000)) return 27;
    playable_window_begin_frame(0, 0, 0);
    if (!playable_window_set_texture_clamp(1)) return 28;
    drawUiTriangleUv(4, 1.25);
    if (pixels[sample] != UINT32_C(0xff00ff00)) return 29;
    if (playable_window_set_texture_clamp(2)) return 30;

    /* Baseq3 polygon offset brings a coplanar decal forward. The first blue
     * draw is rejected by strict depth; the biased draw replaces the red. */
    playable_window_begin_frame(0, 0, 0);
    if (!playable_window_set_texture_clamp(0) ||
            !playable_window_set_raster_state(0, 0, 1)) return 31;
    drawUiTriangle(0);
    drawUiTriangle(1);
    if (pixels[sample] != UINT32_C(0x80ff0000)) return 32;
    if (!playable_window_set_polygon_offset(1)) return 33;
    drawUiTriangle(1);
    if (pixels[sample] != UINT32_C(0x800000ff) || depthPixels[sample] <= 0.5f) return 34;
    if (!playable_window_set_polygon_offset(0) || playable_window_set_polygon_offset(2)) return 35;

    /* GL_LINEAR samples around texel centers. The middle of this 2x2 texture
     * is the equal RGBA average of red, green, blue and white. */
    playable_window_begin_frame(0, 0, 0);
    drawUiTriangleUv2(5, 0.5, 0.5);
    if (pixels[sample] != UINT32_C(0xff808080)) return 36;

    /* Upload builds the complete chain, and a heavily minified triangle picks
     * the 1x1 average instead of aliasing between the four source texels. */
    if (textures[5].mipLevelCount != 2 || textures[5].mipWidths[0] != 1 ||
            textures[5].mipHeights[0] != 1 ||
            textures[5].mipPixels[0][0] != UINT32_C(0xff808080)) return 37;
    playable_window_begin_frame(0, 0, 0);
    playable_window_draw_triangle(5,
        1.0, 1.0, 2.0, 0.0, 0.0, 1.0,
        7.0, 1.0, 2.0, 12.0, 0.0, 1.0,
        1.0, 7.0, 2.0, 0.0, 12.0, 1.0,
        255, 255, 255);
    if (pixels[sample] != UINT32_C(0xff808080)) return 38;
    if (!playable_window_upload_texture(5, halfRed, 1, 1) ||
            textures[5].mipLevelCount != 1 || textures[5].mipPixels[0] != 0) return 39;
    playable_window_release_texture(5);
    if (textures[5].pixels != 0 || textures[5].mipLevelCount != 0) return 40;
    if (playable_window_upload_texture_mipmapped(5, bilinearColors, 2, 2, 2) ||
            !playable_window_upload_texture_mipmapped(5, bilinearColors, 2, 2, 0) ||
            textures[5].mipLevelCount != 1 || textures[5].mipPixels[0] != 0) return 41;

    playable_window_set_texture_settings(1, 3);
    if (!playable_window_upload_material_texture(16, bilinearColors, 2, 2, 1, 1) ||
            textures[16].width != 1 || textures[16].height != 1 ||
            textures[16].pixels[0] != UINT32_C(0xff808080) || textures[16].mipLevelCount != 1) return 81;
    if (!playable_window_upload_material_texture(17, bilinearColors, 2, 2, 1, 0) ||
            textures[17].width != 2 || textures[17].height != 2 || textures[17].mipLevelCount != 2) return 82;
    playable_window_release_texture(16);
    playable_window_release_texture(17);
    playable_window_set_texture_settings(0, 3);

    /* ProjectDlightTexture uses DST_COLOR/ONE: each light channel scales the
     * existing framebuffer channel and adds it back with saturation. */
    playable_window_begin_frame(0, 0, 0);
    drawUiTriangle(6);
    if (!playable_window_set_raster_state(5, 1, 0)) return 42;
    drawUiTriangle(3);
    if (pixels[sample] != UINT32_C(0xff60a040) || depthPixels[sample] != 0.5f) return 43;

    /* Damage-mark shaders use ZERO/ONE_MINUS_SRC_COLOR to darken the
     * framebuffer without changing its depth. */
    playable_window_begin_frame(0, 0, 0);
    if (!playable_window_set_raster_state(0, 0, 1)) return 44;
    drawUiTriangle(6);
    if (!playable_window_set_raster_state(6, 1, 0)) return 45;
    drawUiTriangle(3);
    if (pixels[sample] != UINT32_C(0x00206000) || depthPixels[sample] != 0.5f) return 46;

    /* GL_ONE/GL_ONE_MINUS_SRC_ALPHA keeps the premultiplied source and fades
     * every destination channel, including alpha, by inverse source alpha. */
    playable_window_begin_frame(0, 0, 0);
    if (!playable_window_set_raster_state(0, 0, 1)) return 50;
    drawUiTriangle(6);
    if (!playable_window_set_raster_state(7, 1, 0)) return 51;
    drawUiTriangle(0);
    if (pixels[sample] != UINT32_C(0xffff4010) || depthPixels[sample] != 0.5f) return 52;

    /* Entity light-grid RGB reaches the rasterizer as perspective-correct
     * vertex color, and the direct call restores state for legacy draws. */
    playable_window_begin_frame(0, 0, 0);
    if (!playable_window_set_raster_state(0, 0, 1)) return 47;
    playable_window_draw_triangle_colored(-1,
        1.0, 1.0, 2.0, 0.0, 0.0,
        7.0, 1.0, 2.0, 0.0, 0.0,
        1.0, 7.0, 2.0, 0.0, 0.0,
        64, 128, 192, 255, 64, 128, 192, 255, 64, 128, 192, 255,
        255, 255, 255);
    if (pixels[sample] != UINT32_C(0xff4080c0)) return 48;
    playable_window_begin_frame(0, 0, 0);
    drawUiTriangle(-1);
    if (pixels[sample] != UINT32_C(0xffffffff)) return 49;

    /* RB_ShadowTessEnd uses separate front/back stencil passes and reverses
     * their culling for mirrors. RB_ShadowFinish multiplies every non-zero
     * stencil pixel by 0.6 exactly once. */
    playable_window_begin_frame(100, 150, 200);
    /* Negative origins clip legally; zero width is the invalid case. */
    if (!playable_window_clear_stencil(0, 0, 8, 8) ||
            playable_window_clear_stencil(0, 0, 0, 8) ||
            playable_window_set_stencil_pass(5)) return 53;
    if (!playable_window_set_stencil_pass(1)) return 54;
    for (stencilIteration = 0; stencilIteration < 300; ++stencilIteration) drawStencilTriangle(1);
    if (stencilPixels[sample] != 255 ||
            !playable_window_clear_stencil(0, 0, 8, 8)) return 70;
    drawStencilTriangle(1);
    if (stencilPixels[sample] != 1) return 55;
    if (!playable_window_clear_stencil(0, 0, 8, 8) ||
            !playable_window_set_stencil_pass(2)) return 67;
    drawStencilTriangle(0);
    if (stencilPixels[sample] != 0) return 68;
    if (!playable_window_set_stencil_pass(1)) return 69;
    drawStencilTriangle(1);
    if (!playable_window_set_stencil_pass(2)) return 56;
    drawStencilTriangle(1);
    if (stencilPixels[sample] != 1) return 57;
    drawStencilTriangle(0);
    if (stencilPixels[sample] != 0) return 58;
    if (!playable_window_set_stencil_pass(3)) return 59;
    drawStencilTriangle(0);
    if (stencilPixels[sample] != 1) return 60;
    if (!playable_window_set_stencil_pass(4)) return 61;
    drawStencilTriangle(1);
    if (stencilPixels[sample] != 0) return 62;
    if (!playable_window_clear_stencil(0, 0, 8, 8) ||
            !playable_window_set_stencil_pass(1)) return 63;
    drawStencilTriangle(1);
    if (!playable_window_set_stencil_pass(0)) return 64;
    if (playable_window_finish_stencil_shadow(0, 0, 8, 8) <= 0 ||
            pixels[sample] != UINT32_C(0xff3c5a78)) return 65;
    if (playable_window_finish_stencil_shadow(0, 0, 0, 8) != -1) return 66;

    if (!shaderBlendContracts()) return 71;
    playable_window_shutdown();
    puts("playable window raster-state regression: PASS");
    return 0;
}
