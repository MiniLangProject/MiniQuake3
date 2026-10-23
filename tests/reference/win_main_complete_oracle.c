/* Unchanged strgtr from win_main.c is included by the parity driver. */
#include <stdio.h>
#include <string.h>
typedef int qboolean;
#define qtrue 1
#define qfalse 0
#include "win_main_complete_under_test.inc"

int main(void) {
    static const char *pairs[][2] = {
        {"a", "b"}, {"b", "a"}, {"abc", "abc"}, {"ab", "abc"},
        {"abc", "ab"}, {"A", "a"}, {"pak10.pk3", "pak2.pk3"}, {"", "x"}
    };
    size_t index;
    for (index = 0; index < sizeof(pairs) / sizeof(pairs[0]); ++index)
        printf("%s|%s|%d\n", pairs[index][0], pairs[index][1], strgtr(pairs[index][0], pairs[index][1]));
    return 0;
}
