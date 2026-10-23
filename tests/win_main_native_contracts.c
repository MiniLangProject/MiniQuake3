#include <windows.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

int mq3_winmain_low_physical_memory(void);
uint32_t mq3_winmain_milliseconds(void);
int mq3_winmain_cwd(unsigned char *, int);
int mq3_winmain_mkdir(const unsigned char *, int);
int mq3_winmain_scan_cd(unsigned char *, int);
int mq3_winmain_spk_open(const unsigned char *, int);
int mq3_winmain_spk_write(const unsigned char *, int);
void mq3_winmain_spk_close(void);
int mq3_winmain_list_files(const unsigned char *, int, const unsigned char *, int,
                           const unsigned char *, int, int, unsigned char *, int);
uintptr_t mq3_winmain_dll_load(const unsigned char *, int);
uintptr_t mq3_winmain_dll_symbol(uintptr_t, const char *);
int mq3_winmain_dll_unload(uintptr_t);

static int contains_name(const unsigned char *data, int size, const char *wanted) {
    int offset = 0;
    while (offset < size) {
        const char *value = (const char *)(data + offset);
        size_t length = strlen(value);
        if (strcmp(value, wanted) == 0) return 1;
        offset += (int)length + 1;
    }
    return 0;
}

int main(void) {
    unsigned char cwd[32768], names[4096], text[] = "native spank\n";
    unsigned char directory[] = "win_main_native_temp", extension[] = ".cfg", filter[] = "*sub\\*.txt";
    unsigned char configPath[] = "win_main_native_temp\\a.cfg", subPath[] = "win_main_native_temp\\sub";
    unsigned char textPath[] = "win_main_native_temp\\sub\\b.txt", logPath[] = "win_main_native_temp\\spank.log";
    unsigned char kernel[] = "kernel32.dll";
    HANDLE file;
    DWORD written;
    uintptr_t module;
    int count = 0, size;
    count += mq3_winmain_cwd(cwd, (int)sizeof(cwd)) > 0;
    count += mq3_winmain_low_physical_memory() == 0 || mq3_winmain_low_physical_memory() == 1;
    count += mq3_winmain_milliseconds() != 0;
    count += mq3_winmain_scan_cd(names, (int)sizeof(names)) >= 0;
    count += mq3_winmain_mkdir(directory, (int)strlen((char *)directory)) != 0;
    count += mq3_winmain_mkdir(subPath, (int)strlen((char *)subPath)) != 0;
    file = CreateFileA((char *)configPath, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
    if (file == INVALID_HANDLE_VALUE) return 2;
    WriteFile(file, "x", 1, &written, NULL); CloseHandle(file);
    file = CreateFileA((char *)textPath, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
    if (file == INVALID_HANDLE_VALUE) return 3;
    WriteFile(file, "y", 1, &written, NULL); CloseHandle(file);
    size = mq3_winmain_list_files(directory, (int)strlen((char *)directory), extension, 4, NULL, 0, 0, names, (int)sizeof(names));
    count += size > 0 && contains_name(names, size, "a.cfg");
    size = mq3_winmain_list_files(directory, (int)strlen((char *)directory), NULL, 0, filter, (int)strlen((char *)filter), 0, names, (int)sizeof(names));
    count += size > 0 && contains_name(names, size, "sub\\b.txt");
    count += mq3_winmain_spk_open(logPath, (int)strlen((char *)logPath)) != 0;
    count += mq3_winmain_spk_write(text, (int)strlen((char *)text)) != 0; mq3_winmain_spk_close();
    module = mq3_winmain_dll_load(kernel, (int)strlen((char *)kernel));
    count += module != 0 && mq3_winmain_dll_symbol(module, "GetCurrentDirectoryW") != 0;
    count += mq3_winmain_dll_unload(module) != 0;
    printf("PASS: %d native win_main contracts\n", count);
    return count == 12 ? 0 : 4;
}
