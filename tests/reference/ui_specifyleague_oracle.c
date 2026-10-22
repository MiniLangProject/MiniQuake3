#include <stdio.h>
#include <string.h>

#define QM_GOTFOCUS 1
#define QM_LOSTFOCUS 2
#define QM_ACTIVATED 3
#define K_UPARROW 128
#define K_DOWNARROW 129
#define ID_SPECIFYLEAGUENAME 100
#define ID_SPECIFYLEAGUELIST 101
#define ID_SPECIFYLEAGUEUP 102
#define ID_SPECIFYLEAGUEDOWN 103
#define ID_SPECIFYLEAGUEBACK 104
#define MAX_LISTBOXWIDTH 40
#define MAX_LEAGUENAME 80
#define MAX_LISTBOXITEMS 128

typedef struct { int id; } menucommon_s;
typedef struct { char buffer[80]; } field_t;
typedef struct { field_t field; } menufield_s;
typedef struct { int curvalue; int numitems; } menulist_s;
typedef struct { menufield_s rankname; menulist_s list; } specifyleague_t;
typedef struct { char buff[MAX_LISTBOXWIDTH]; char leaguename[MAX_LEAGUENAME]; } table_t;

static specifyleague_t s_specifyleague;
static table_t league_table[MAX_LISTBOXITEMS];
static char playername[80];
static int refreshes;
static int last_key;
static int pops;
static char cvar_name[80];
static char cvar_value[80];

static void SpecifyLeague_GetList(void) { refreshes++; }
static int Q_strncmp(const char *a, const char *b, size_t n) { return strncmp(a, b, n); }
static void ScrollList_Key(menulist_s *list, int key) {
    last_key = key;
    if (key == K_UPARROW && list->curvalue > 0) list->curvalue--;
    if (key == K_DOWNARROW && list->curvalue + 1 < list->numitems) list->curvalue++;
}
static void trap_Cvar_Set(const char *name, const char *value) {
    snprintf(cvar_name, sizeof(cvar_name), "%s", name);
    snprintf(cvar_value, sizeof(cvar_value), "%s", value);
}
static void UI_PopMenu(void) { pops++; }

#include "ui_specifyleague_under_test.inc"

static void reset(void) {
    memset(&s_specifyleague, 0, sizeof(s_specifyleague));
    memset(league_table, 0, sizeof(league_table));
    strcpy(playername, "Player");
    strcpy(s_specifyleague.rankname.field.buffer, "Player");
    strcpy(league_table[0].leaguename, "Alpha League");
    strcpy(league_table[1].leaguename, "Beta League");
    s_specifyleague.list.numitems = 3;
    s_specifyleague.list.curvalue = 1;
    refreshes = last_key = pops = 0;
    cvar_name[0] = cvar_value[0] = '\0';
}

static void fire(int id, int event) {
    menucommon_s item = { id };
    SpecifyLeague_Event(&item, event);
    printf("%d %d %d %d %d %s %s\n", id, event, s_specifyleague.list.curvalue,
           refreshes, pops, cvar_name, cvar_value);
}

int main(void) {
    reset(); fire(ID_SPECIFYLEAGUELIST, QM_GOTFOCUS);
    reset(); fire(ID_SPECIFYLEAGUEUP, QM_ACTIVATED);
    reset(); fire(ID_SPECIFYLEAGUEDOWN, QM_ACTIVATED);
    reset(); strcpy(s_specifyleague.rankname.field.buffer, "Play"); fire(ID_SPECIFYLEAGUENAME, QM_LOSTFOCUS);
    reset(); strcpy(s_specifyleague.rankname.field.buffer, "Other"); fire(ID_SPECIFYLEAGUENAME, QM_LOSTFOCUS);
    reset(); fire(ID_SPECIFYLEAGUEBACK, QM_ACTIVATED);
    return 0;
}
