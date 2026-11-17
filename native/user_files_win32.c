/* SPDX-License-Identifier: GPL-2.0-or-later
 * Per-user Windows file boundary. Archive policy and handle state live in
 * mq3.engine.user_files; this DLL owns path validation and atomic replacement.
 * It is not a general-purpose filesystem sandbox against a hostile local
 * process concurrently changing directory links.
 */
#define WIN32_LEAN_AND_MEAN
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0600
#endif
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include <wchar.h>
#include <wctype.h>
#define API __declspec(dllexport)

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

/* User data boundary. Archive/game policy stays in MiniLang. Never accept
 * absolute QVM paths, Windows device names, ADS, or reparse points below home.
 * Atomic replacement keeps the previous configuration intact on write failure. */
static volatile LONG userTempSerial;
static int user_qpath(const unsigned char *name, int length, wchar_t *out) {
    int i, start = 0, count;
    if (!name || length <= 0 || length >= 256) return 0;
    for (i = 0; i < length; ++i) {
        unsigned char c = name[i];
        if (c < 32 || c == ':' || c == '"' || c == '<' || c == '>' || c == '|' || c == '?' || c == '*') return 0;
    }
    count = utf8_to_wide(name, length, out, 256);
    if (!count || out[0] == L'/' || out[0] == L'\\') return 0;
    for (i = 0; i <= count; ++i) {
        if (out[i] == L'/' || out[i] == L'\\' || !out[i]) {
            wchar_t device[256]; int j, n = i-start;
            if (!n || out[i-1] == L'.' || out[i-1] == L' ') return 0;
            for (j=0; j<n && out[start+j]!=L'.'; ++j) device[j]=(wchar_t)towupper(out[start+j]);
            device[j]=0;
            if (!wcscmp(device,L"CON") || !wcscmp(device,L"PRN") || !wcscmp(device,L"AUX") || !wcscmp(device,L"NUL") || !wcscmp(device,L"CONIN$") || !wcscmp(device,L"CONOUT$") || !wcscmp(device,L"CLOCK$")) return 0;
            if (j==4 && ((!wcsncmp(device,L"COM",3)) || (!wcsncmp(device,L"LPT",3))) && ((device[3]>=L'1' && device[3]<=L'9') || device[3]==0x00b9 || device[3]==0x00b2 || device[3]==0x00b3)) return 0;
            if (out[i]) out[i]=L'\\';
            start=i+1;
        }
    }
    return count;
}
static int user_directory(wchar_t *path, int create) {
    DWORD attributes=GetFileAttributesW(path);
    if (attributes==INVALID_FILE_ATTRIBUTES && create) {
        if (!CreateDirectoryW(path,NULL) && GetLastError()!=ERROR_ALREADY_EXISTS) return 0;
        attributes=GetFileAttributesW(path);
    }
    if (attributes==INVALID_FILE_ATTRIBUTES) return 0;
    if (!(attributes&FILE_ATTRIBUTE_DIRECTORY) || (attributes&FILE_ATTRIBUTE_REPARSE_POINT)) { SetLastError(ERROR_ACCESS_DENIED); return 0; }
    return 1;
}
static int user_path(const unsigned char *root, int rootLength, const unsigned char *name, int nameLength, wchar_t *out, int create) {
    wchar_t relative[256]; int i, count;
    SetLastError(ERROR_INVALID_NAME);
    if (!root || rootLength<=0 || rootLength>24000 || !user_qpath(name,nameLength,relative)) return 0;
    for (i=0;i<rootLength;++i) if (!root[i]) return 0;
    count=utf8_to_wide(root,rootLength,out,32768);
    if (count<3 || out[1]!=L':' || (out[2]!=L'\\' && out[2]!=L'/')) return 0;
    /* The selected home itself must be absolute and explicit. UNC/device
     * namespaces are deliberately not accepted by this bounded local host. */
    for (i=3;i<count;++i) {
        if (out[i]==L'/') out[i]=L'\\';
        if (out[i]==L'\\') { out[i]=0; if (!user_directory(out,create)) return 0; out[i]=L'\\'; }
    }
    while (count>3 && (out[count-1]==L'\\' || out[count-1]==L'/')) out[--count]=0;
    if (!user_directory(out,create)) return 0;
    if ((size_t)count+wcslen(relative)+2>=32768) return 0;
    out[count++]=L'\\';wcscpy_s(out+count,32768-(size_t)count,relative);
    for (i=count;out[i];++i) if (out[i]==L'\\') { out[i]=0; if (!user_directory(out,create)) return 0; out[i]=L'\\'; }
    { DWORD attributes=GetFileAttributesW(out);
      if (attributes!=INVALID_FILE_ATTRIBUTES && (attributes&(FILE_ATTRIBUTE_REPARSE_POINT|FILE_ATTRIBUTE_DIRECTORY))) { SetLastError(ERROR_ACCESS_DENIED); return 0; } }
    return 1;
}
API int mq3_user_default_root(unsigned char *output,int capacity) {
    wchar_t path[32768]; DWORD count=GetEnvironmentVariableW(L"MINIQUAKE3_HOME",path,(DWORD)_countof(path));
    if (count>=_countof(path)) return -1;
    if (!count) {
        count=GetEnvironmentVariableW(L"LOCALAPPDATA",path,(DWORD)_countof(path));
        if (!count || count+24>=_countof(path)) return -1;
        wcscat_s(path,_countof(path),L"\\MiniQuake3\\baseq3");
    }
    return wide_to_utf8(path,output,capacity);
}
API int mq3_user_resolve(const unsigned char *root,int rootLength,const unsigned char *name,int nameLength,unsigned char *output,int capacity) {
    wchar_t path[32768];
    if (!user_path(root,rootLength,name,nameLength,path,0)) return -1;
    return wide_to_utf8(path,output,capacity);
}
API int mq3_user_write_atomic(const unsigned char *root,int rootLength,const unsigned char *name,int nameLength,const unsigned char *data,int length) {
    wchar_t path[32768], temporary[32768]; HANDLE file=INVALID_HANDLE_VALUE;
    DWORD written=0; int attempt, ok=0;
    if (length<0 || length>64*1024*1024 || (length && !data) || !user_path(root,rootLength,name,nameLength,path,1)) return 0;
    for (attempt=0;attempt<16;++attempt) {
        if (_snwprintf_s(temporary,_countof(temporary),_TRUNCATE,L"%ls.mq3-%lu-%lu.tmp",path,(unsigned long)GetCurrentProcessId(),(unsigned long)InterlockedIncrement(&userTempSerial))<0) return 0;
        file=CreateFileW(temporary,GENERIC_WRITE,0,NULL,CREATE_NEW,FILE_ATTRIBUTE_NORMAL|FILE_FLAG_WRITE_THROUGH,NULL);
        if (file!=INVALID_HANDLE_VALUE) break;
        if (GetLastError()!=ERROR_FILE_EXISTS && GetLastError()!=ERROR_ALREADY_EXISTS) return 0;
    }
    if (file==INVALID_HANDLE_VALUE) return 0;
    ok=(!length || (WriteFile(file,data,(DWORD)length,&written,NULL) && written==(DWORD)length)) && FlushFileBuffers(file);
    if (!CloseHandle(file)) ok=0;
    if (ok) ok=MoveFileExW(temporary,path,MOVEFILE_REPLACE_EXISTING|MOVEFILE_WRITE_THROUGH)!=0;
    if (!ok) DeleteFileW(temporary);
    return ok;
}

/* -2 is genuinely absent, -1 is invalid/inaccessible, otherwise byte size.
 * Append may create an absent file, but must never truncate an unreadable one. */
API int mq3_user_size(const unsigned char *root,int rootLength,const unsigned char *name,int nameLength) {
    wchar_t path[32768]; WIN32_FILE_ATTRIBUTE_DATA info; DWORD code;
    if (!user_path(root,rootLength,name,nameLength,path,0)) {
        code=GetLastError();
        return (code==ERROR_FILE_NOT_FOUND || code==ERROR_PATH_NOT_FOUND) ? -2 : -1;
    }
    if (!GetFileAttributesExW(path,GetFileExInfoStandard,&info)) {
        code=GetLastError();
        return (code==ERROR_FILE_NOT_FOUND || code==ERROR_PATH_NOT_FOUND) ? -2 : -1;
    }
    if (info.dwFileAttributes&(FILE_ATTRIBUTE_REPARSE_POINT|FILE_ATTRIBUTE_DIRECTORY)) return -1;
    if (info.nFileSizeHigh || info.nFileSizeLow>64u*1024u*1024u) return -1;
    return (int)info.nFileSizeLow;
}

/* Compare writable names before truncating either file. QVM separators and
 * Windows ordinal case folding identify the same name. Existing 8.3 aliases
 * are expanded when available. Missing parent directories are not created.
 * Returns 1 for the same name, 0 for different names, -1 for invalid input.
 * This is per-Store duplicate-writer detection, not a cross-process lock.
 */
API int mq3_user_same_path(const unsigned char *root, int rootLength,
                         const unsigned char *first, int firstLength,
                         const unsigned char *second, int secondLength) {
    wchar_t a[256], b[256], pathA[32768], pathB[32768];
    wchar_t longA[32768], longB[32768];
    DWORD lengthA, lengthB;
    if (!user_qpath(first, firstLength, a) || !user_qpath(second, secondLength, b)) return -1;
    if (CompareStringOrdinal(a, -1, b, -1, TRUE) == CSTR_EQUAL) return 1;
    if (!user_path(root, rootLength, first, firstLength, pathA, 0) ||
        !user_path(root, rootLength, second, secondLength, pathB, 0)) return 0;
    lengthA = GetLongPathNameW(pathA, longA, (DWORD)_countof(longA));
    lengthB = GetLongPathNameW(pathB, longB, (DWORD)_countof(longB));
    if (!lengthA || lengthA >= _countof(longA) || !lengthB || lengthB >= _countof(longB)) return 0;
    return CompareStringOrdinal(longA, -1, longB, -1, TRUE) == CSTR_EQUAL;
}
