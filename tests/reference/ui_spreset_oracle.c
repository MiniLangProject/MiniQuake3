#include <stdio.h>
#include <string.h>

#define QM_ACTIVATED 3
#define ID_NO 100
#define ID_YES 101
#define K_TAB 9
#define K_KP_LEFTARROW 163
#define K_LEFTARROW 134
#define K_KP_RIGHTARROW 165
#define K_RIGHTARROW 135
typedef int sfxHandle_t;
typedef struct { int id; } menucommon_s;
typedef struct { int marker; } menuframework_s;
typedef struct { menucommon_s generic; } menutext_s;
typedef struct { menuframework_s menu; menutext_s no; menutext_s yes; int slashX; } resetMenu_t;

static resetMenu_t s_reset;
static int pops, newGames, levelMenus, defaults, defaultKey, selectionWrites;
static void UI_PopMenu(void) { pops++; }
static void UI_NewGame(void) { newGames++; }
static void trap_Cvar_SetValue(const char *name, float value) { if (!strcmp(name,"ui_spSelection") && value==0) selectionWrites++; }
static void UI_SPLevelMenu(void) { levelMenus++; }
static int Menu_DefaultKey(menuframework_s *menu, int key) { (void)menu; defaults++; defaultKey=key; return key==K_TAB ? 2 : 0; }

#include "ui_spreset_under_test.inc"

static void reset_state(void) { memset(&s_reset,0,sizeof(s_reset));s_reset.no.generic.id=ID_NO;s_reset.yes.generic.id=ID_YES;pops=newGames=levelMenus=defaults=defaultKey=selectionWrites=0; }
static void row(const char *label) { printf("%s %d %d %d %d %d %d\n",label,pops,newGames,selectionWrites,levelMenus,defaults,defaultKey); }
int main(void) {
  reset_state(); Reset_MenuEvent(&s_reset.yes,1); row("event_ignore");
  reset_state(); Reset_MenuEvent(&s_reset.no,QM_ACTIVATED); row("event_no");
  reset_state(); Reset_MenuEvent(&s_reset.yes,QM_ACTIVATED); row("event_yes");
  reset_state(); printf("key_left %d",Reset_MenuKey(K_LEFTARROW)); row("");
  reset_state(); printf("key_n %d",Reset_MenuKey('n')); row("");
  reset_state(); printf("key_Y %d",Reset_MenuKey('Y')); row("");
  reset_state(); printf("key_other %d",Reset_MenuKey(65)); row("");
  return 0;
}
