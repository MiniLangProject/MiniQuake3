#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdarg.h>

#define GT_FFA 0
#define GT_TOURNAMENT 1
#define GT_SINGLE_PLAYER 2
#define GT_TEAM 3
#define GT_CTF 4
#define PLAYER_SLOTS 12
#define MAX_QPATH 64
#define qfalse 0
#define qtrue 1
typedef int qboolean;

typedef struct { int curvalue; } oracleMenuList;
typedef struct {
  oracleMenuList playerType[PLAYER_SLOTS];
  oracleMenuList playerTeam[PLAYER_SLOTS];
  int gametype;
  int newBotIndex;
  char playerNameBuffers[PLAYER_SLOTS][16];
} oracleServerOptions;
static oracleServerOptions s_serveroptions;

static int registerSucceeds;
static int Q_stricmp(const char *a, const char *b) {
  while (*a && *b) {
    int x=tolower((unsigned char)*a++), y=tolower((unsigned char)*b++);
    if (x != y) return x-y;
  }
  return (unsigned char)*a-(unsigned char)*b;
}
static char *COM_ParseExt(char **p, int nl) {
  static char buffer[64];
  int i=0;
  (void)nl;
  while (**p && isspace((unsigned char)**p)) (*p)++;
  while (**p && !isspace((unsigned char)**p) && i<63) buffer[i++]=*(*p)++;
  buffer[i]=0;
  return buffer;
}
static void Q_strncpyz(char *out, const char *in, size_t size) {
  if (!size) return;
  strncpy(out,in,size-1);
  out[size-1]=0;
}
static char *Q_strrchr(const char *text, int ch) { return strrchr(text,ch); }
static void Com_sprintf(char *out, int size, const char *format, ...) {
  va_list args;
  va_start(args,format);
  vsnprintf(out,(size_t)size,format,args);
  va_end(args);
}
static int trap_R_RegisterShaderNoMip(const char *name) { (void)name; return registerSucceeds; }

#include "ui_start_server_under_test.inc"

int main(void) {
  char *values[]={"ffa","tourney","single","team","ctf","ffa single","TEAM ctf","unknown"};
  int i;
  for (i=0;i<8;i++) {
    char buffer[64];
    strcpy(buffer,values[i]);
    printf("bits|%s|%d\n",values[i],GametypeBits(buffer));
  }

  memset(&s_serveroptions,0,sizeof(s_serveroptions));
  s_serveroptions.gametype=GT_TEAM;
  s_serveroptions.newBotIndex=2;
  s_serveroptions.playerType[1].curvalue=1;
  strcpy(s_serveroptions.playerNameBuffers[1],"Sarge");
  printf("selected|same|%d\n",BotAlreadySelected("sarge"));
  s_serveroptions.playerTeam[1].curvalue=1;
  printf("selected|other-team|%d\n",BotAlreadySelected("SARGE"));
  s_serveroptions.gametype=GT_FFA;
  printf("selected|ffa|%d\n",BotAlreadySelected("SARGE"));

  {
    char icon[MAX_QPATH];
    registerSucceeds=0;
    ServerPlayerIcon("anarki/red",icon,sizeof(icon));
    printf("icon|fallback|%s\n",icon);
    ServerPlayerIcon("visor",icon,sizeof(icon));
    printf("icon|default|%s\n",icon);
    registerSucceeds=1;
    ServerPlayerIcon("major/blue",icon,sizeof(icon));
    printf("icon|found|%s\n",icon);
  }
  return 0;
}
