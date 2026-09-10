/* SPDX-License-Identifier: GPL-2.0-or-later
 * Native checks for the CRT and Q_CleanStr boundaries used by g_bot.c's
 * population commands. Policy/order is covered by MiniLang contracts. */
#include <stdio.h>
#include <string.h>

static void clean(char *string) {
  char *d = string, *s = string; int c;
  while ((c = *s) != 0) {
    if (s[0] == '^' && s[1] && s[1] != '^') { s += 2; continue; }
    if (c >= 0x20 && c <= 0x7E) *d++ = (char)c;
    s++;
  }
  *d = 0;
}
int main(void) {
  char text[] = "^1A^^B\1C"; char value[64];
  clean(text);
  if (strcmp(text,"A^C")) return 1;
  sprintf(value,"%f",(double)(float)3.5f);
  if (strcmp(value,"3.500000")) return 2;
  sprintf(value,"%5.2f",(double)(float)2.5f);
  if (strcmp(value," 2.50")) return 3;
  puts("PASS: native Baseq3 bot population boundary oracle");
  return 0;
}
