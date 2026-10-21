/* Focused host for unchanged UI_RemoveBotsMenu_DeleteEvent. */
#include <stdio.h>
#include <stdarg.h>

#define QM_ACTIVATED 3
#define EXEC_APPEND 2

typedef struct {
    int baseBotNum;
    int selectedBotNum;
    int botClientNums[64];
} remove_state_t;
static remove_state_t removeBotsMenuInfo;
static char commandText[256];

static char *va(const char *format, ...) {
    static char buffer[256];
    va_list args;
    va_start(args, format);
    vsnprintf(buffer, sizeof(buffer), format, args);
    va_end(args);
    return buffer;
}
static void trap_Cmd_ExecuteText(int when, const char *text) {
    snprintf(commandText, sizeof(commandText), "%d:%s", when, text);
}

#include "ui_removebots_under_test.inc"

static void row(const char *label, int event, int base, int selected) {
    int i;
    commandText[0] = 0;
    for (i = 0; i < 64; ++i) removeBotsMenuInfo.botClientNums[i] = i * 2 + 1;
    removeBotsMenuInfo.baseBotNum = base;
    removeBotsMenuInfo.selectedBotNum = selected;
    UI_RemoveBotsMenu_DeleteEvent(0, event);
    printf("%s|%s\n", label, commandText);
}

int main(void) {
    row("ignored", 1, 0, 0);
    row("first", 3, 0, 0);
    row("selected", 3, 0, 4);
    row("paged", 3, 3, 4);
    return 0;
}
