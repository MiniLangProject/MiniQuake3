/* Focused host for the unchanged ui_splevel.c PlayerIcon body. */
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <ctype.h>

#define MAX_QPATH 64

static const char *available[4];
static int availableCount;

static void Q_strncpyz(char *dest, const char *src, int size) {
    if (size <= 0) return;
    strncpy(dest, src, (size_t)size - 1);
    dest[size - 1] = '\0';
}

static char *Q_strrchr(const char *text, int c) {
    return strrchr((char *)text, c);
}

static int Q_stricmp(const char *a, const char *b) {
    while (*a && *b) {
        int x = tolower((unsigned char)*a++);
        int y = tolower((unsigned char)*b++);
        if (x != y) return x - y;
    }
    return (unsigned char)*a - (unsigned char)*b;
}

static void Com_sprintf(char *dest, int size, const char *format, ...) {
    va_list args;
    va_start(args, format);
    vsnprintf(dest, (size_t)size, format, args);
    va_end(args);
    if (size > 0) dest[size - 1] = '\0';
}

static int trap_R_RegisterShaderNoMip(const char *name) {
    int i;
    for (i = 0; i < availableCount; ++i) {
        if (!Q_stricmp(available[i], name)) return i + 1;
    }
    return 0;
}

#include "ui_splevel_under_test.inc"

static void row(const char *label, const char *modelAndSkin,
                const char *asset0, const char *asset1) {
    char result[MAX_QPATH];
    availableCount = 0;
    if (asset0) available[availableCount++] = asset0;
    if (asset1) available[availableCount++] = asset1;
    PlayerIcon(modelAndSkin, result, sizeof(result));
    printf("%s|%s\n", label, result);
}

int main(void) {
    row("implicit", "ranger", "models/players/ranger/icon_default.tga", NULL);
    row("skin", "sarge/red", "models/players/sarge/icon_red.tga", NULL);
    row("fallback", "sarge/red", "models/players/sarge/icon_default.tga", NULL);
    row("missing-default", "visor/default", NULL, NULL);
    row("case-asset", "Xaero/DEFAULT", "MODELS/PLAYERS/XAERO/ICON_DEFAULT.TGA", NULL);
    row("empty-skin", "sarge/", "models/players/sarge/icon_default.tga", NULL);
    row("nested", "team/sarge/red", "models/players/team/sarge/icon_red.tga", NULL);
    return 0;
}
