/* Focused host for the unchanged UI_CinematicsMenu_Event function. */
#include <stdio.h>
#include <stdarg.h>
#include <string.h>

#define QM_ACTIVATED 3
#define EXEC_APPEND 2
#define ID_CIN_IDLOGO 11
#define ID_CIN_END 20

typedef struct { int id; } menucommon_s;
static struct { int demoversion; } uis;
static char *cinematics[] = {
    "idlogo", "intro", "tier1", "tier2", "tier3",
    "tier4", "tier5", "tier6", "tier7", "end"
};
static char cvarText[128];
static char commandText[256];

static char *va(const char *format, ...) {
    static char buffer[256];
    va_list args;
    va_start(args, format);
    vsnprintf(buffer, sizeof(buffer), format, args);
    va_end(args);
    return buffer;
}
static void trap_Cvar_Set(const char *name, const char *value) {
    snprintf(cvarText, sizeof(cvarText), "%s=%s", name, value);
}
static void trap_Cmd_ExecuteText(int when, const char *text) {
    size_t size;
    snprintf(commandText, sizeof(commandText), "%d:%s", when, text);
    size = strlen(commandText);
    if (size && commandText[size - 1] == '\n') commandText[size - 1] = 0;
}

#include "ui_cinematics_under_test.inc"

static void row(const char *label, int id, int event, int demo) {
    menucommon_s item;
    item.id = id;
    uis.demoversion = demo;
    cvarText[0] = 0;
    commandText[0] = 0;
    UI_CinematicsMenu_Event(&item, event);
    printf("%s|%s|%s\n", label, cvarText, commandText);
}

int main(void) {
    row("ignored", 11, 1, 0);
    row("logo", 11, 3, 0);
    row("tier4", 16, 3, 0);
    row("retail-end", 20, 3, 0);
    row("demo-end", 20, 3, 1);
    return 0;
}
