/* Focused host for the unchanged Controls_GetKeyAssignment body. */
#include <stdio.h>
#include <string.h>
#include <ctype.h>

static const char *bindings[256];

static void trap_Key_GetBindingBuf(int key, char *buffer, int size) {
    const char *value = bindings[key] ? bindings[key] : "";
    if (size <= 0) return;
    strncpy(buffer, value, (size_t)size - 1);
    buffer[size - 1] = '\0';
}

static int Q_stricmp(const char *a, const char *b) {
    while (*a && *b) {
        int x = tolower((unsigned char)*a++);
        int y = tolower((unsigned char)*b++);
        if (x != y) return x - y;
    }
    return (unsigned char)*a - (unsigned char)*b;
}

#include "ui_controls_under_test.inc"

static void row(const char *name, const char *command) {
    int result[2];
    Controls_GetKeyAssignment((char *)command, result);
    printf("%s|%d|%d\n", name, result[0], result[1]);
}

int main(void) {
    memset(bindings, 0, sizeof(bindings));
    bindings[9] = "+scores";
    bindings[32] = "+MOVEUP";
    bindings[90] = "+moveup";
    bindings[132] = "+moveup";
    bindings[180] = "+button3";
    row("single", "+scores");
    row("first-two", "+moveup");
    row("case", "+MoVeUp");
    row("mouse", "+button3");
    row("missing", "+zoom");
    row("empty", "");
    return 0;
}
