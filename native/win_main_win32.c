/* SPDX-License-Identifier: GPL-2.0-or-later
 * Native Win32 boundary for the MiniLang port of code/win32/win_main.c.
 * Game policy and the event loop remain in src/mq3/platform/win_main_runtime.ml.
 */
#define WIN32_LEAN_AND_MEAN
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0601
#endif
#include <windows.h>
#include <mmsystem.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <wchar.h>
#include <wctype.h>

#define API __declspec(dllexport)
#define MAX_OSPATH 256
#define MAX_FOUND_FILES 4096

static FILE *spankFile;

static int utf8_to_wide(const unsigned char *text, int length, wchar_t *output, int capacity) {
    int count;
    if (!text || length < 0 || !output || capacity < 1) return 0;
    count = MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, (const char *)text, length, output, capacity - 1);
    if (count <= 0) return 0;
    output[count] = L'\0';
    return count;
}

static int wide_to_utf8(const wchar_t *text, unsigned char *output, int capacity) {
    int count;
    if (!text || !output || capacity < 1) return -1;
    count = WideCharToMultiByte(CP_UTF8, WC_ERR_INVALID_CHARS, text, -1, (char *)output, capacity, NULL, NULL);
    if (count <= 0) return -1;
    return count - 1;
}

API int mq3_winmain_low_physical_memory(void) {
    MEMORYSTATUSEX status;
    ZeroMemory(&status, sizeof(status));
    status.dwLength = sizeof(status);
    if (!GlobalMemoryStatusEx(&status)) return 0;
    return status.ullTotalPhys <= (ULONGLONG)(96u * 1024u * 1024u) ? 1 : 0;
}

API uint32_t mq3_winmain_milliseconds(void) { return timeGetTime(); }

API int mq3_winmain_cwd(unsigned char *output, int capacity) {
    wchar_t path[32768];
    DWORD length = GetCurrentDirectoryW((DWORD)(sizeof(path) / sizeof(path[0])), path);
    if (length == 0 || length >= (DWORD)(sizeof(path) / sizeof(path[0]))) return -1;
    return wide_to_utf8(path, output, capacity);
}

API int mq3_winmain_mkdir(const unsigned char *path, int length) {
    wchar_t widePath[32768];
    if (!utf8_to_wide(path, length, widePath, (int)(sizeof(widePath) / sizeof(widePath[0])))) return -1;
    if (CreateDirectoryW(widePath, NULL)) return 1;
    return GetLastError() == ERROR_ALREADY_EXISTS ? 1 : 0;
}

API int mq3_winmain_clipboard(unsigned char *output, int capacity) {
    HANDLE handle;
    const wchar_t *text;
    int result = -1;
    if (!output || capacity < 1 || !OpenClipboard(NULL)) return -1;
    handle = GetClipboardData(CF_UNICODETEXT);
    if (handle) {
        text = (const wchar_t *)GlobalLock(handle);
        if (text) {
            result = wide_to_utf8(text, output, capacity);
            GlobalUnlock(handle);
            if (result >= 0) {
                int index;
                for (index = 0; index < result; ++index) {
                    if (output[index] == '\n' || output[index] == '\r' || output[index] == '\b') {
                        output[index] = 0;
                        result = index;
                        break;
                    }
                }
            }
        }
    }
    CloseClipboard();
    return result;
}

API int mq3_winmain_scan_cd(unsigned char *output, int capacity) {
    wchar_t drive[] = L"C:\\", directory[32768], test[32768];
    wchar_t letter;
    DWORD attributes;
    for (letter = L'C'; letter <= L'Z'; ++letter) {
        drive[0] = letter;
        if (GetDriveTypeW(drive) != DRIVE_CDROM) continue;
        _snwprintf_s(directory, _countof(directory), _TRUNCATE, L"%lsquake3", drive);
        _snwprintf_s(test, _countof(test), _TRUNCATE, L"%ls\\quake3.exe", directory);
        attributes = GetFileAttributesW(test);
        if (attributes != INVALID_FILE_ATTRIBUTES && !(attributes & FILE_ATTRIBUTE_DIRECTORY))
            return wide_to_utf8(directory, output, capacity);
        _snwprintf_s(directory, _countof(directory), _TRUNCATE, L"%lsbin\\x86\\glibc-2.1", drive);
        _snwprintf_s(test, _countof(test), _TRUNCATE, L"%ls\\quake3", directory);
        attributes = GetFileAttributesW(test);
        if (attributes != INVALID_FILE_ATTRIBUTES && !(attributes & FILE_ATTRIBUTE_DIRECTORY))
            return wide_to_utf8(directory, output, capacity);
    }
    if (output && capacity > 0) output[0] = 0;
    return 0;
}

/* Return the drive-letter mask for readable optical volumes. Suppress Windows'
 * own insert-disc dialog while probing an empty drive. */
API DWORD mq3_winmain_retail_cd_drives(void) {
    DWORD drives = GetLogicalDrives(), ready = 0, previousMode;
    wchar_t root[] = L"A:\\";
    int letter;
    if (!SetThreadErrorMode(GetThreadErrorMode() | SEM_FAILCRITICALERRORS, &previousMode)) return 0;
    for (letter = 0; letter < 26; ++letter) {
        DWORD bit = 1u << letter;
        if (!(drives & bit)) continue;
        root[0] = (wchar_t)(L'A' + letter);
        if (GetDriveTypeW(root) == DRIVE_CDROM &&
            GetVolumeInformationW(root, NULL, 0, NULL, NULL, NULL, NULL, 0))
            ready |= bit;
    }
    SetThreadErrorMode(previousMode, NULL);
    return ready;
}

API int mq3_winmain_spk_open(const unsigned char *path, int length) {
    wchar_t widePath[32768];
    errno_t openError;
    if (spankFile) { fclose(spankFile); spankFile = NULL; }
    if (!utf8_to_wide(path, length, widePath, (int)(sizeof(widePath) / sizeof(widePath[0])))) return 0;
    openError = _wfopen_s(&spankFile, widePath, L"wb");
    return openError == 0 && spankFile != NULL;
}

API int mq3_winmain_spk_write(const unsigned char *text, int length) {
    size_t written;
    if (!spankFile || !text || length < 0) return 0;
    written = fwrite(text, 1u, (size_t)length, spankFile);
    fflush(spankFile);
    return written == (size_t)length;
}

API void mq3_winmain_spk_close(void) {
    if (spankFile) { fclose(spankFile); spankFile = NULL; }
}

static int char_equal(wchar_t left, wchar_t right) {
    if (left == L'\\') left = L'/';
    if (right == L'\\') right = L'/';
    return towlower(left) == towlower(right);
}

static int filter_path(const wchar_t *filter, const wchar_t *name) {
    while (*filter) {
        if (*filter == L'*') {
            ++filter;
            if (!*filter) return 1;
            while (*name) {
                if (filter_path(filter, name)) return 1;
                ++name;
            }
            return 0;
        }
        if (*filter == L'?') {
            if (!*name) return 0;
            ++filter; ++name;
            continue;
        }
        if (!*name || !char_equal(*filter, *name)) return 0;
        ++filter; ++name;
    }
    return *name == L'\0';
}

typedef struct NameList { wchar_t *items[MAX_FOUND_FILES]; int count; } NameList;

static void free_names(NameList *list) {
    int index;
    for (index = 0; index < list->count; ++index) free(list->items[index]);
    list->count = 0;
}

static int add_name(NameList *list, const wchar_t *name) {
    size_t size;
    if (list->count >= MAX_FOUND_FILES - 1) return 0;
    size = (wcslen(name) + 1u) * sizeof(wchar_t);
    list->items[list->count] = (wchar_t *)malloc(size);
    if (!list->items[list->count]) return 0;
    memcpy(list->items[list->count], name, size);
    ++list->count;
    return 1;
}

static void list_filtered(const wchar_t *base, const wchar_t *subdirs, const wchar_t *filter, NameList *list) {
    wchar_t search[32768], relative[32768], child[32768];
    WIN32_FIND_DATAW data;
    HANDLE handle;
    if (list->count >= MAX_FOUND_FILES - 1) return;
    if (*subdirs) _snwprintf_s(search, _countof(search), _TRUNCATE, L"%ls\\%ls\\*", base, subdirs);
    else _snwprintf_s(search, _countof(search), _TRUNCATE, L"%ls\\*", base);
    handle = FindFirstFileW(search, &data);
    if (handle == INVALID_HANDLE_VALUE) return;
    do {
        if ((data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) && wcscmp(data.cFileName, L".") && wcscmp(data.cFileName, L"..")) {
            if (*subdirs) _snwprintf_s(child, _countof(child), _TRUNCATE, L"%ls\\%ls", subdirs, data.cFileName);
            else _snwprintf_s(child, _countof(child), _TRUNCATE, L"%ls", data.cFileName);
            list_filtered(base, child, filter, list);
        }
        if (list->count >= MAX_FOUND_FILES - 1) break;
        _snwprintf_s(relative, _countof(relative), _TRUNCATE, L"%ls\\%ls", subdirs, data.cFileName);
        if (filter_path(filter, relative)) (void)add_name(list, relative);
    } while (FindNextFileW(handle, &data));
    FindClose(handle);
}

static int compare_names(const void *left, const void *right) {
    const wchar_t *const *a = (const wchar_t *const *)left;
    const wchar_t *const *b = (const wchar_t *const *)right;
    return wcscmp(*a, *b);
}

/* NUL-separated UTF-8 names; returns bytes used or -required bytes. */
API int mq3_winmain_list_files(const unsigned char *directory, int directoryLength,
                               const unsigned char *extension, int extensionLength,
                               const unsigned char *filter, int filterLength, int wantSubs,
                               unsigned char *output, int capacity) {
    wchar_t dir[32768], ext[MAX_OSPATH], pattern[MAX_OSPATH], search[32768];
    WIN32_FIND_DATAW data;
    HANDLE handle;
    NameList list;
    int index, used = 0;
    ZeroMemory(&list, sizeof(list));
    if (!utf8_to_wide(directory, directoryLength, dir, (int)_countof(dir))) return 0;
    if (filter && filterLength > 0) {
        if (!utf8_to_wide(filter, filterLength, pattern, (int)_countof(pattern))) return 0;
        list_filtered(dir, L"", pattern, &list);
    } else {
        if (extensionLength > 0) {
            if (!utf8_to_wide(extension, extensionLength, ext, (int)_countof(ext))) return 0;
        } else ext[0] = L'\0';
        if (wcscmp(ext, L"/") == 0) ext[0] = L'\0';
        _snwprintf_s(search, _countof(search), _TRUNCATE, L"%ls\\*%ls", dir, ext);
        handle = FindFirstFileW(search, &data);
        if (handle != INVALID_HANDLE_VALUE) {
            do {
                int isDirectory = (data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) != 0;
                if ((!wantSubs && !isDirectory) || (wantSubs && isDirectory)) {
                    if (!add_name(&list, data.cFileName)) break;
                }
            } while (FindNextFileW(handle, &data));
            FindClose(handle);
        }
        qsort(list.items, (size_t)list.count, sizeof(list.items[0]), compare_names);
    }
    for (index = 0; index < list.count; ++index) {
        unsigned char converted[32768];
        int length = wide_to_utf8(list.items[index], converted, (int)sizeof(converted));
        if (length < 0) { free_names(&list); return 0; }
        if (output && used + length + 1 <= capacity) {
            memcpy(output + used, converted, (size_t)length);
            output[used + length] = 0;
        }
        used += length + 1;
    }
    free_names(&list);
    return used <= capacity ? used : -used;
}

API uintptr_t mq3_winmain_dll_load(const unsigned char *path, int length) {
    wchar_t widePath[32768];
    if (!utf8_to_wide(path, length, widePath, (int)_countof(widePath))) return 0;
    return (uintptr_t)LoadLibraryW(widePath);
}

API uintptr_t mq3_winmain_dll_symbol(uintptr_t handle, const char *name) {
    if (!handle || !name) return 0;
    return (uintptr_t)GetProcAddress((HMODULE)handle, name);
}

API int mq3_winmain_dll_attach(uintptr_t handle, uintptr_t systemCalls) {
    typedef void (__cdecl *DllEntryProc)(int (__cdecl *)(int, ...));
    typedef int (__cdecl *SystemCallsProc)(int, ...);
    union { FARPROC raw; DllEntryProc typed; } entry;
    union { uintptr_t raw; SystemCallsProc typed; } calls;
    if (!handle || !systemCalls) return 0;
    entry.raw = GetProcAddress((HMODULE)handle, "dllEntry");
    calls.raw = systemCalls;
    if (!entry.raw) return 0;
    entry.typed(calls.typed);
    return 1;
}

API int mq3_winmain_dll_unload(uintptr_t handle) {
    return handle && FreeLibrary((HMODULE)handle) ? 1 : 0;
}
