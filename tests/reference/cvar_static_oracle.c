/* Host for unchanged generateHashValue and Cvar_ValidateString from cvar.c. */
#include <ctype.h>
#include <stdio.h>
#include <string.h>
typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define FILE_HASH_SIZE 256
#include "cvar_static_under_test.inc"
int main(void) {
    const char *hashes[]={"","abc","ABC","sv_cheats","textures\\base;\"x"};int i;
    for(i=0;i<5;i++)printf("H|%s|%ld\n",hashes[i],generateHashValue(hashes[i]));
    printf("V|%d|%d|%d|%d|%d\n",Cvar_ValidateString(NULL),Cvar_ValidateString("clean_name"),Cvar_ValidateString("bad\\name"),Cvar_ValidateString("bad\"name"),Cvar_ValidateString("bad;name"));
    return 0;
}
