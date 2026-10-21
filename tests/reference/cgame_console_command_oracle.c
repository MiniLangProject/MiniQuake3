#include <stdio.h>
#include <string.h>

typedef int qboolean;
#define qfalse 0
#define qtrue 1

typedef struct {
  char *cmd;
  void (*function)(void);
} consoleCommand_t;

static const char *current_command;
static int calls;
static const char *CG_Argv(int index) { return index == 0 ? current_command : ""; }
#ifdef _MSC_VER
#define Q_stricmp _stricmp
#else
#define Q_stricmp strcasecmp
#endif
static void command_hit(void) { calls++; }

/* The non-Missionpack command names from the original commands[] table. */
static consoleCommand_t commands[] = {
  {"testgun",command_hit},{"testmodel",command_hit},{"nextframe",command_hit},
  {"prevframe",command_hit},{"nextskin",command_hit},{"prevskin",command_hit},
  {"viewpos",command_hit},{"+scores",command_hit},{"-scores",command_hit},
  {"+zoom",command_hit},{"-zoom",command_hit},{"sizeup",command_hit},
  {"sizedown",command_hit},{"weapnext",command_hit},{"weapprev",command_hit},
  {"weapon",command_hit},{"tell_target",command_hit},{"tell_attacker",command_hit},
  {"vtell_target",command_hit},{"vtell_attacker",command_hit},{"tcmd",command_hit},
  {"startOrbit",command_hit},{"loaddeferred",command_hit}
};

#include "cgame_console_command_under_test.inc"

static void emit(const char *command) {
  int result;
  current_command=command;calls=0;result=CG_ConsoleCommand();
  if ((result != 0) != (calls != 0)) {
    printf("dispatch invariant failed\n");
    return;
  }
  /* One CG_CONSOLE_COMMAND export call was made for every input. */
  printf("%s|%d|1\n",command,result);
}

int main(void) {
  emit("sizeup");emit("SIZEDOWN");emit("+scores");emit("-scores");
  emit("+zoom");emit("-zoom");emit("startOrbit");emit("unknown");emit("kill");
  return 0;
}
