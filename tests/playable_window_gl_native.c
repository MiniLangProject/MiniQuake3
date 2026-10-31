#include <windows.h>
#include <stdio.h>

__declspec(dllimport) int playable_window_gl_configure(const unsigned char *,int,int,int,int,int,int,int,int);
__declspec(dllimport) int playable_window_gl_configure_driver(const unsigned char *,int);
__declspec(dllimport) int playable_window_gl_configure_pixel_format(int,int,int,int);
__declspec(dllimport) int playable_window_gl_configure_display(int,int,int);
__declspec(dllimport) int playable_window_create(int,int);
__declspec(dllimport) int playable_window_gl_available(void);
__declspec(dllimport) int playable_window_gl_pixel_format(void);
__declspec(dllimport) int playable_window_gl_color_bits(void);
__declspec(dllimport) int playable_window_gl_depth_bits(void);
__declspec(dllimport) int playable_window_gl_stencil_bits(void);
__declspec(dllimport) int playable_window_gl_info(int,unsigned char *,int);
__declspec(dllimport) int playable_window_gl_has_extension(const unsigned char *,int);
__declspec(dllimport) int playable_window_gl_set_swap_interval(int);
__declspec(dllimport) void playable_window_begin_frame(int,int,int);
__declspec(dllimport) void playable_window_gl_end_frame(void);
__declspec(dllimport) int playable_window_presented_non_black(void);
__declspec(dllimport) void playable_window_gl_restore_gamma(void);
__declspec(dllimport) void playable_window_shutdown(void);

int main(void) {
    static const unsigned char driver[] = "opengl32.dll";
    static const unsigned char impossible[] = "GL_MINIQUAKE3_impossible_extension";
    unsigned char text[4096];
    int selector;
    if (!playable_window_gl_configure(driver, 12, 24, 24, 8, 0, 0, 0, 0)) return 1;
    if (!playable_window_gl_configure_driver(driver, 12)) return 8;
    if (!playable_window_gl_configure_pixel_format(24, 24, 8, 0)) return 9;
    if (!playable_window_gl_configure_display(0, 0, 0)) return 10;
    if (!playable_window_create(320, 240)) return 2;
    if (!playable_window_gl_available() || playable_window_gl_pixel_format() < 1) return 3;
    if (playable_window_gl_color_bits() < 16 || playable_window_gl_depth_bits() < 15 ||
            playable_window_gl_stencil_bits() < 0) return 4;
    for (selector = 0; selector < 4; ++selector) {
        int length = playable_window_gl_info(selector, text, sizeof(text));
        if (length < 1 || length >= (int)sizeof(text) || text[length] != 0) return 5;
    }
    if (playable_window_gl_has_extension(impossible, (int)sizeof(impossible)-1)) return 6;
    if (!playable_window_gl_set_swap_interval(0)) return 7;
    playable_window_begin_frame(12,34,56);
    playable_window_gl_end_frame();
    if (playable_window_presented_non_black() != 320 * 240) return 11;
    playable_window_gl_restore_gamma();
    playable_window_shutdown();
    puts("playable window WGL lifecycle: PASS");
    return 0;
}
