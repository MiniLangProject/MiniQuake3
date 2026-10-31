#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include "../native/playable_win32.c"

int main(void) {
    unsigned char user[4096];
    unsigned char directory[4096];
    unsigned char executableDirectory[32768];
    int before = playable_window_milliseconds();
    int after = playable_window_milliseconds();
    if (before < 0 || after < before) return 1;
    if (playable_system_current_user(0, 4096) || playable_system_current_user(user, 0) ||
            playable_system_current_user(user, 4096) < 1 || !user[0]) return 2;
    if (playable_system_current_directory(0, 4096) || playable_system_current_directory(directory, 0) ||
            playable_system_current_directory(directory, 4096) < 1 || !directory[0]) return 3;
    if (playable_system_executable_directory(0, 32768) || playable_system_executable_directory(executableDirectory, 0) ||
            playable_system_executable_directory(executableDirectory, 32768) < 1 || !executableDirectory[0]) return 4;
    if (playable_system_processor_id() != 0) return 5;
    puts("playable window win_shared: PASS");
    return 0;
}
