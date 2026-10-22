/* SPDX-License-Identifier: GPL-2.0-or-later */
typedef unsigned long long size_t;
#define Q3_VM 1
#define NULL ((void*)0)
#define LADJUST 4
#define ZEROPAD 128
extern int printf(const char *, ...);
static int randSeed = 0;
#define strlen bg_strlen
#define strcat bg_strcat
#define strcpy bg_strcpy
#define strcmp bg_strcmp
#define strchr bg_strchr
#define strstr bg_strstr
#define tolower bg_tolower
#define toupper bg_toupper
#define memmove bg_memmove
#define srand bg_srand
#define rand bg_rand
#define atof bg_atof
#define atoi bg_atoi
#define abs bg_abs
#define fabs bg_fabs

#include "bg_lib_under_test.inc"

int main(void) {
  char a[32]="quake", b[32]="arena", move[8]="abcdef"; char *p; const char *scan;
  strcat(a,"3"); strcpy(b,"bot");
  printf("strings:%llu,%s,%s,%d,%lld,%lld,%d,%d\n",strlen(a),a,b,strcmp("abc","abd"),(long long)(strchr("arena",'e')-"arena"),(long long)(strstr("miniquake","quake")-"miniquake"),tolower('Q'),toupper('a'));
  memmove(move+1,move,5);printf("move:%s\n",move);
  srand(1);printf("rand:%d,%d,%d\n",rand(),rand(),rand());
  scan=" -12.75x";printf("numbers:%.8f,%d,",atof(scan),atoi(" +314z"));p=(char*)scan;printf("%.8f,%lld,",_atof((const char**)&p),(long long)(p-scan));p=(char*)" -42!";printf("%d,%lld,%d,%.1f\n",_atoi((const char**)&p),(long long)(p-" -42!"),abs(-7),fabs(-2.5));
  p=a;AddInt(&p,-42,6,ZEROPAD);*p=0;printf("addint:%s\n",a);p=a;AddInt(&p,17,5,LADJUST);*p=0;printf("left:%s\n",a);
  p=a;AddFloat(&p,-12.375f,6,3);*p=0;printf("float:%s\n",a);p=a;AddString(&p,"abcdef",8,3);*p=0;printf("string:%s\n",a);
  return 0;
}
