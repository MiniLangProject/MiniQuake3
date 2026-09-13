#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>

__declspec(dllimport) int playable_window_create(int, int);
__declspec(dllimport) void playable_window_poll(void);
__declspec(dllimport) int playable_window_should_close(void);
__declspec(dllimport) int playable_window_set_title_utf8(const unsigned char *, int);
__declspec(dllimport) int playable_window_key_down(int);
__declspec(dllimport) int playable_window_consume_mouse_dx(void);
__declspec(dllimport) int playable_window_consume_mouse_dy(void);
__declspec(dllimport) int playable_window_milliseconds(void);
__declspec(dllimport) void playable_window_begin_frame(int, int, int);
__declspec(dllimport) void playable_window_clear_depth(double);
__declspec(dllimport) int playable_window_set_depth_range(double, double);
__declspec(dllimport) int playable_window_upload_texture(int, const unsigned char *, int, int);
__declspec(dllimport) void playable_window_release_texture(int);
__declspec(dllimport) void playable_window_draw_triangle(int,
    double, double, double, double, double, double,
    double, double, double, double, double, double,
    double, double, double, double, double, double,
    int, int, int);
__declspec(dllimport) void playable_window_draw_triangle_multitexture(int, int,
    double, double, double, double, double, double, double, double,
    double, double, double, double, double, double, double, double,
    double, double, double, double, double, double, double, double,
    int, int, int);
__declspec(dllimport) int playable_window_set_raster_state(int, int, int);
__declspec(dllimport) int playable_window_set_alpha_test(int);
__declspec(dllimport) int playable_window_set_texture_clamp(int);
__declspec(dllimport) int playable_window_draw_triangle_batch(const unsigned char *, int, int);
__declspec(dllimport) int playable_window_draw_world_triangle_batch(const unsigned char *, int, int,
    double, double, double, double, double, double, double, double, double,
    double, double, double, double, double, double, double);
__declspec(dllimport) int playable_window_jpeg_info(const unsigned char *, int, unsigned char *);
__declspec(dllimport) int playable_window_decode_jpeg(const unsigned char *, int, unsigned char *, int);
__declspec(dllimport) void playable_window_draw_line(int, int, int, int, int, int, int);
__declspec(dllimport) void playable_window_present(void);
__declspec(dllimport) void playable_window_shutdown(void);

int main(void) {
    static const unsigned char texture[16] = {
        255, 0, 0, 255, 0, 255, 0, 255,
        0, 0, 255, 255, 255, 255, 255, 128
    };
    static const unsigned char invalidJpeg[4] = { 0xff, 0xd8, 0xff, 0xd9 };
    unsigned char jpegMetadata[8] = { 0 };
    unsigned char jpegPixel[4] = { 0 };
    unsigned char batch[128] = { 0 };
    int before = playable_window_milliseconds();
    /* Every API must be safe before create and after shutdown. */
    playable_window_poll();
    if (playable_window_set_title_utf8((const unsigned char *)"before create", 13)) return 8;
    playable_window_begin_frame(0, 0, 0);
    playable_window_clear_depth(1000.0);
    if (playable_window_upload_texture(-1, texture, 2, 2) ||
        playable_window_upload_texture(512, texture, 2, 2) ||
        playable_window_upload_texture(0, 0, 2, 2) ||
        !playable_window_upload_texture(0, texture, 2, 2) ||
        !playable_window_upload_texture(511, texture, 2, 2)) return 2;
    playable_window_draw_triangle(0,
        0.0, 0.0, 2.0, 0.0, 0.0, 1.0,
        1.0, 0.0, 2.0, 1.0, 0.0, 1.0,
        0.0, 1.0, 2.0, 0.0, 1.0, 1.0,
        255, 255, 255);
    playable_window_draw_triangle_multitexture(0, 0,
        0.0, 0.0, 2.0, 0.0, 0.0, 0.0, 0.0, 1.0,
        1.0, 0.0, 2.0, 1.0, 0.0, 1.0, 0.0, 1.0,
        0.0, 1.0, 2.0, 0.0, 1.0, 0.0, 1.0, 1.0,
        255, 255, 255);
    if (playable_window_set_raster_state(-1, 0, 1) ||
        playable_window_set_raster_state(5, 0, 1) ||
        playable_window_set_raster_state(0, 2, 1) ||
        playable_window_set_raster_state(0, 0, 2) ||
            !playable_window_set_raster_state(4, 1, 0) ||
            !playable_window_set_raster_state(0, 0, 1)) return 10;
    if (playable_window_set_alpha_test(-1) || playable_window_set_alpha_test(4) ||
            !playable_window_set_alpha_test(3) || !playable_window_set_alpha_test(0)) return 13;
    if (playable_window_set_texture_clamp(-1) || playable_window_set_texture_clamp(2) ||
            !playable_window_set_texture_clamp(1) || !playable_window_set_texture_clamp(0)) return 14;
    if (playable_window_set_depth_range(0.0, 1.0) ||
            playable_window_set_depth_range(1.1, 1.0) ||
            playable_window_set_depth_range(0.3, 0.0) ||
            !playable_window_set_depth_range(0.3, 1.0) ||
            !playable_window_set_depth_range(1.0, 1.0)) return 12;
    if (playable_window_draw_triangle_batch(0, 128, 1) ||
        playable_window_draw_triangle_batch(batch, 115, 1) ||
        playable_window_draw_triangle_batch(batch, 128, -1) ||
        playable_window_draw_triangle_batch(batch, 128, 65537) ||
        playable_window_draw_triangle_batch(batch, 0, 0)) return 8;
    if (playable_window_draw_triangle_batch(batch, 128, 1) != 1) return 9;
    if (playable_window_draw_world_triangle_batch(0, 128, 1,
            0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0,
            1.0, 0.0, 0.0, 160.0, 100.0, 160.0, 1.0) ||
        playable_window_draw_world_triangle_batch(batch, 115, 1,
            0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0,
            1.0, 0.0, 0.0, 160.0, 100.0, 160.0, 1.0) ||
        playable_window_draw_world_triangle_batch(batch, 128, 1,
            0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0,
            1.0, 0.0, 0.0, 160.0, 100.0, 160.0, 0.0)) return 11;
    if (playable_window_draw_world_triangle_batch(batch, 128, 1,
            0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0,
            1.0, 0.0, 0.0, 160.0, 100.0, 160.0, 1.0) != 1) return 12;
    if (playable_window_jpeg_info(invalidJpeg, 4, jpegMetadata) ||
        playable_window_decode_jpeg(invalidJpeg, 4, jpegPixel, 4)) return 7;
    playable_window_release_texture(0);
    playable_window_draw_line(0, 0, 1, 1, 255, 255, 255);
    playable_window_present();
    if (!playable_window_should_close() || playable_window_key_down('W') ||
        playable_window_consume_mouse_dx() || playable_window_consume_mouse_dy()) return 2;
    playable_window_shutdown();
    if (!playable_window_should_close() || playable_window_milliseconds() < before) return 3;
    if (GetEnvironmentVariableA("MQ3_WINDOW_SMOKE_GUI", 0, 0)) {
        if (!playable_window_create(320, 200)) return 4;
        playable_window_poll();
        if (!playable_window_set_title_utf8((const unsigned char *)"MiniQuake3 | 61 FPS | q3dm1", 27) ||
            playable_window_set_title_utf8((const unsigned char *)"", 0) ||
            playable_window_set_title_utf8((const unsigned char *)"bad\0title", 9)) return 8;
        {
            WCHAR currentTitle[64];
            if (!GetWindowTextW(FindWindowW(L"MiniQuake3PlayableWindow", 0), currentTitle, 64) ||
                    lstrcmpW(currentTitle, L"MiniQuake3 | 61 FPS | q3dm1")) return 8;
        }
        if (!playable_window_upload_texture(1, texture, 2, 2)) return 5;
        playable_window_begin_frame(12, 24, 48);
        playable_window_clear_depth(10000.0);
        playable_window_draw_triangle(1,
            20.0, 20.0, 1.0, 0.0, 0.0, 1.0,
            300.0, 40.0, 4.0, 4.0, 0.0, 0.8,
            160.0, 180.0, 2.0, 2.0, 4.0, 1.2,
            255, 0, 255);
        playable_window_draw_triangle_multitexture(1, 1,
            20.0, 20.0, 3.0, 0.0, 0.0, 0.0, 0.0, 1.0,
            300.0, 40.0, 3.0, 4.0, 0.0, 1.0, 0.0, 1.0,
            160.0, 180.0, 3.0, 2.0, 4.0, 0.5, 1.0, 1.0,
            255, 0, 255);
        /* A nearer solid triangle exercises depth rejection and fallback color. */
        playable_window_draw_triangle(-1,
            120.0, 60.0, 0.5, 0.0, 0.0, 1.0,
            240.0, 100.0, 0.5, 0.0, 0.0, 1.0,
            180.0, 170.0, 0.5, 0.0, 0.0, 1.0,
            255, 192, 32);
        playable_window_draw_line(0, 0, 319, 199, 255, 160, 32);
        playable_window_draw_line(319, 0, 0, 199, 32, 220, 255);
        playable_window_present();
        playable_window_shutdown();
        if (!playable_window_should_close()) return 6;
    }
    puts("playable window lifecycle: PASS");
    return 0;
}
