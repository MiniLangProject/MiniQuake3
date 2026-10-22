/* Focused host for the unchanged UI_CDKeyMenu_PreValidateKey function. */
#include <stdio.h>
#include <string.h>

#include "ui_cdkey_under_test.inc"

static void row(const char *label, const char *key) {
    printf("%s|%d\n", label, UI_CDKeyMenu_PreValidateKey(key));
}

int main(void) {
    row("empty", "");
    row("short", "237abcdghjlprst");
    row("valid", "237abcdghjlprstw");
    row("bad", "237abcdghjlprstx");
    row("upper", "237ABCDGHJLPRSTW");
    return 0;
}
