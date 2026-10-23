#include <stdio.h>
#include <string.h>
#include <stdint.h>

typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define CPUID_GENERIC 0
int sys_timeBase;
static unsigned fakeTimes[] = { 1000u, 1000u, 1007u };
static int fakeTimeIndex;
static unsigned fakeTimeGetTime(void) { return fakeTimes[fakeTimeIndex++]; }
#define timeGetTime fakeTimeGetTime
static const char *fakeUser;
static int fakeGetUserName(char *output, unsigned long *size) {
    size_t count;
    if (!fakeUser) return 0;
    count = strlen(fakeUser) + 1;
    if (count > *size) return 0;
    memcpy(output, fakeUser, count); *size = (unsigned long)count; return 1;
}
#define GetUserName fakeGetUserName
static char *Sys_Cwd(void) { return "C:/MiniQuake3"; }

#include "win_shared_complete_under_test.inc"

int main(void) {
    int first = Sys_Milliseconds(); int second = Sys_Milliseconds();
    printf("millis|%d|%d\n", first, second);
    fakeUser = "Ranger"; printf("user|%s\n", Sys_GetCurrentUser());
    fakeUser = ""; printf("empty|%s\n", Sys_GetCurrentUser());
    fakeUser = 0; printf("failure|%s\n", Sys_GetCurrentUser());
    printf("paths|%s|%s\n", Sys_DefaultHomePath() ? "value" : "null", Sys_DefaultInstallPath());
    printf("processor|%d\n", Sys_GetProcessorId());
    return 0;
}
