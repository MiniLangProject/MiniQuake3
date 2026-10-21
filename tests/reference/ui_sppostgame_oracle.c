#include <stdio.h>
#include <string.h>

#define QM_ACTIVATED 3
#define EXEC_APPEND 2
#define K_ESCAPE 27
#define K_MOUSE2 179
typedef int sfxHandle_t;
typedef struct { int marker; } menuframework_s;
typedef struct { int realtime; } uiStatic_t;
typedef struct { menuframework_s menu; int phase; int ignoreKeysTime; int starttime; } postgameMenuInfo_t;

static uiStatic_t uis;
static postgameMenuInfo_t postgameMenuInfo;
static int pops;
static int defaults;
static char commands[256];

static void UI_PopMenu(void) { pops++; }
static void trap_Cmd_ExecuteText(int when, const char *text) { (void)when; strcat(commands, text); }
static int Menu_DefaultKey(menuframework_s *menu, int key) { (void)menu; (void)key; defaults++; return 0; }

#include "ui_sppostgame_under_test.inc"

static void reset_state(void) { memset(&postgameMenuInfo, 0, sizeof(postgameMenuInfo)); pops=0; defaults=0; commands[0]=0; uis.realtime=0; }

int main(void) {
  reset_state(); UI_SPPostgameMenu_AgainEvent(NULL, 1); printf("again_ignore %d %d %s\n", pops, defaults, commands);
  reset_state(); UI_SPPostgameMenu_AgainEvent(NULL, QM_ACTIVATED); printf("again %d %d %s", pops, defaults, commands);
  reset_state(); UI_SPPostgameMenu_MenuEvent(NULL, 2); printf("menu_ignore %d %d %s\n", pops, defaults, commands);
  reset_state(); UI_SPPostgameMenu_MenuEvent(NULL, QM_ACTIVATED); printf("menu %d %d %s", pops, defaults, commands);
  reset_state(); postgameMenuInfo.phase=1; postgameMenuInfo.ignoreKeysTime=200; uis.realtime=100; printf("key_ignore %d %d %d %d %d\n", UI_SPPostgameMenu_MenuKey(13),postgameMenuInfo.phase,postgameMenuInfo.starttime,postgameMenuInfo.ignoreKeysTime,defaults);
  reset_state(); postgameMenuInfo.phase=1; uis.realtime=300; printf("key_phase1 %d", UI_SPPostgameMenu_MenuKey(13)); printf(" %d %d %d %d %s",postgameMenuInfo.phase,postgameMenuInfo.starttime,postgameMenuInfo.ignoreKeysTime,defaults,commands);
  reset_state(); postgameMenuInfo.phase=2; uis.realtime=600; printf("key_phase2 %d", UI_SPPostgameMenu_MenuKey(13)); printf(" %d %d %d %d %s\n",postgameMenuInfo.phase,postgameMenuInfo.starttime,postgameMenuInfo.ignoreKeysTime,defaults,commands);
  reset_state(); postgameMenuInfo.phase=3; uis.realtime=1; { int result=UI_SPPostgameMenu_MenuKey(K_ESCAPE); printf("key_escape %d %d\n",result,defaults); }
  reset_state(); postgameMenuInfo.phase=3; uis.realtime=1; { int result=UI_SPPostgameMenu_MenuKey(65); printf("key_default %d %d\n",result,defaults); }
  return 0;
}
