#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef int qboolean;
#define PATH_SEP '\\'
#define MAX_STRING_TOKENS 1024

#include "files_runtime_under_test.inc"

int main(void) {
  const char *names[] = {"A/B.TGA", "a\\b.jpg", "vm/cgame.qvm", "scripts/common.shader", "", "pak0.pk3"};
  int i;
  for (i = 0; i < 6; ++i) printf("H %ld\n", FS_HashFileName(names[i], 1024));
  printf("F %d %d %d\n", FS_FilenameCompare("Maps:A.BSP", "maps/a.bsp"), FS_FilenameCompare("a", "b"), FS_FilenameCompare("A\\B", "a/b"));
  {
    char *found = FS_ShiftedStrStr("xxcgame.qvmzz", "\\`Zf^'jof", 7);
    printf("S %ld\n", found ? (long)(found - "xxcgame.qvmzz") : -1L);
  }
  {
    char a[64] = "a\\b:c"; char b[64] = "maps\\q3dm1.bsp";
    FS_ConvertPath(a); FS_ConvertPath(b); printf("C %s %s\n", a, b);
  }
  printf("P %d %d %d\n", FS_PathCmp("B\\x", "a/x"), FS_PathCmp("same", "SAME"), FS_PathCmp("a", "aa"));
  {
    char output[128]; int depth = -1; int length = FS_ReturnPath("maps/q3dm1.bsp", output, &depth);
    printf("R %d %d %s\n", length, depth, output);
  }
  return 0;
}
