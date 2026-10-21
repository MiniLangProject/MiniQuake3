/* Focused host for unchanged UI_AddBotsMenu_FightEvent. */
#include <stdio.h>
#include <stdarg.h>

#define QM_ACTIVATED 3
#define EXEC_APPEND 2

typedef struct { const char **itemnames; int curvalue; } list_t;
typedef struct {
    list_t skill;
    list_t team;
    int delay;
    int selectedBotNum;
    char botnames[7][32];
} add_state_t;
static add_state_t addBotsMenuInfo;
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

#include "ui_addbots_under_test.inc"

static void row(const char *label, int event, int skill, int team, int delay, const char *bot) {
    static const char *teams[] = {"Red", "Blue", 0};
    commandText[0] = 0;
    addBotsMenuInfo.skill.curvalue = skill;
    addBotsMenuInfo.team.curvalue = team;
    addBotsMenuInfo.team.itemnames = teams;
    addBotsMenuInfo.delay = delay;
    addBotsMenuInfo.selectedBotNum = 0;
    snprintf(addBotsMenuInfo.botnames[0], sizeof(addBotsMenuInfo.botnames[0]), "%s", bot);
    UI_AddBotsMenu_FightEvent(0, event);
    printf("%s|%s|%d\n", label, commandText, addBotsMenuInfo.delay);
}

int main(void) {
    row("ignored", 1, 2, 0, 1000, "Sarge");
    row("red", 3, 0, 0, 1000, "Sarge");
    row("blue", 3, 4, 1, 2500, "Xaero");
    row("spaces", 3, 2, 0, 4000, "Major Major");
    return 0;
}
