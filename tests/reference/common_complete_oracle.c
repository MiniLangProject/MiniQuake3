#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
#define qfalse 0
#define qtrue 1
#define MAX_TOKEN_CHARS 1024
#define MAX_QPATH 64
#define MAX_EDIT_LINE 256
#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif
typedef int qboolean;
typedef struct { char buffer[MAX_EDIT_LINE]; int cursor; int scroll; int widthInChars; } field_t;
#define Com_Memset memset
#include "common_complete_under_test.inc"
static void filter(const char *pattern,const char *name,int sensitive) { char p[256],n[256];strcpy(p,pattern);strcpy(n,name);printf("filter:%s:%s:%d=%d\n",pattern,name,sensitive,Com_Filter(p,n,sensitive)); }
int main(void) {
  char a1[]="AbCdEf",a2[]="cde",a3[]="xyz"; char *found;
  found=Com_StringContains(a1,a2,0);printf("contains=%d\n",found?(int)(found-a1):-1);
  found=Com_StringContains(a1,a3,0);printf("contains=%d\n",found?(int)(found-a1):-1);
  filter("maps/*.bsp","maps/q3dm1.bsp",0);filter("foo?bar","fooXbar",1);filter("a[0-3]","a9",1);filter("[[abc","[abc",1);
  { char p[]="maps\\*.bsp",n[]="maps:q3dm1.bsp";printf("path=%d\n",Com_FilterPath(p,n,0)); }
  printf("hash=%d,%d\n",Com_HashKey("abc",3),Com_HashKey("\xE4x",2));
  printf("acos=%.9g,%.9g\n",Q_acos(1.0f),Q_acos(0.0f));
  { field_t f={{0},7,9,80};strcpy(f.buffer,"text");Field_Clear(&f);printf("field=%d,%d,%d\n",f.buffer[0],f.cursor,f.scroll); }
  return 0;
}
