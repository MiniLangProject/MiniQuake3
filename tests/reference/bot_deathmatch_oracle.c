/* GPL-2.0-or-later. Harness for verbatim ai_dmq3.c helper bodies. */
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#define qboolean int
#define qtrue 1
#define qfalse 0
#define PW_QUAD 1
#define PW_INVIS 4
#define PW_REDFLAG 7
#define PW_BLUEFLAG 8
#define EF_FIRING 0x100
#define EF_TALK 0x1000
typedef struct { int number,powerups,flags; } aas_entityinfo_t;
#include "bot_deathmatch_under_test.inc"
int main(void) {
  aas_entityinfo_t e={1,0,0};
  printf("empty|%d|%d|%d|%d|%d\n",EntityCarriesFlag(&e),EntityIsInvisible(&e),EntityIsShooting(&e),EntityIsChatting(&e),EntityHasQuad(&e));
  e.powerups=(1<<PW_REDFLAG)|(1<<PW_INVIS)|(1<<PW_QUAD);e.flags=EF_FIRING|EF_TALK;
  printf("powered|%d|%d|%d|%d|%d\n",EntityCarriesFlag(&e),EntityIsInvisible(&e),EntityIsShooting(&e),EntityIsChatting(&e),EntityHasQuad(&e));
  e.powerups=(1<<PW_INVIS);printf("invis|%d\n",EntityIsInvisible(&e));
  { const char *base="AlphaROCKETomega";char *p=stristr((char*)base,"rocket");printf("find|%d|%d\n",p?(int)(p-base):-1,stristr((char*)base,"rail")?1:0); }
  return 0;
}
