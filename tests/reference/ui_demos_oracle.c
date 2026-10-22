/* Focused host for the unchanged Demos_MenuEvent function. */
#include <stdio.h>
#include <stdarg.h>
#include <string.h>

#define QM_ACTIVATED 3
#define EXEC_APPEND 2
#define ID_BACK 10
#define ID_GO 11
#define ID_LIST 12
#define ID_RIGHT 13
#define ID_LEFT 14
#define K_LEFTARROW 134
#define K_RIGHTARROW 135

typedef struct { int id; } menucommon_s;
typedef struct { const char **itemnames; int curvalue; } list_s;
typedef struct { list_s list; } demos_t;
static demos_t s_demos;
static char commandText[256];
static int forceOff;
static int popped;
static int scrollKey;

static char *va(const char *format, ...) {
    static char buffer[256];
    va_list args;
    va_start(args, format);
    vsnprintf(buffer, sizeof(buffer), format, args);
    va_end(args);
    return buffer;
}
static void UI_ForceMenuOff(void) { forceOff++; }
static void UI_PopMenu(void) { popped++; }
static void ScrollList_Key(list_s *list, int key) { (void)list; scrollKey = key; }
static void trap_Cmd_ExecuteText(int when, const char *text) {
    size_t size;
    snprintf(commandText, sizeof(commandText), "%d:%s", when, text);
    size = strlen(commandText);
    if (size && commandText[size - 1] == '\n') commandText[size - 1] = 0;
}

#include "ui_demos_under_test.inc"

static void row(const char *label, int id, int event, int selected) {
    static const char *names[] = {"DEMO001", "Q3DM17_RUN", "ZED"};
    menucommon_s item;
    item.id = id;
    s_demos.list.itemnames = names;
    s_demos.list.curvalue = selected;
    commandText[0] = 0;
    forceOff = popped = scrollKey = 0;
    Demos_MenuEvent(&item, event);
    printf("%s|%s|%d|%d|%d\n", label, commandText, forceOff, popped, scrollKey);
}

int main(void) {
    row("ignored", ID_GO, 1, 0);
    row("go", ID_GO, 3, 1);
    row("back", ID_BACK, 3, 0);
    row("left", ID_LEFT, 3, 0);
    row("right", ID_RIGHT, 3, 0);
    row("list", ID_LIST, 3, 0);
    return 0;
}
