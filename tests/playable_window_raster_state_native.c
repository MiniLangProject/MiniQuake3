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
    if (!playable_window_clear_stencil(0, 0, 8, 8) ||
            playable_window_clear_stencil(-1, 0, 8, 8) ||
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
    if (playable_window_finish_stencil_shadow(-1, 0, 8, 8) != -1) return 66;

    playable_window_shutdown();
    puts("playable window raster-state regression: PASS");
    return 0;
}
