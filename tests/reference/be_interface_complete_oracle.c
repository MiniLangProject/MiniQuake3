#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <time.h>

typedef int qboolean;
typedef float vec3_t[3];
typedef struct { int value; } bot_entitystate_t;
typedef struct { int botlibsetup, maxentities, maxclients; float time; } botlib_globals_t;
typedef struct { void (*Print)(int, const char *, ...); } botlib_import_t;

#define qfalse 0
#define qtrue 1
#define PRT_ERROR 3
#define PRT_MESSAGE 1
#define BLERR_NOERROR 0
#define BLERR_LIBRARYNOTSETUP 1
#define BLERR_INVALIDENTITYNUMBER 2

botlib_globals_t botlibglobals;
botlib_import_t botimport;
int bot_developer;
int botlibsetup;

static char calls[128];
static int call_count;
static int failure_at;
static char lib_name[64];
static char lib_value[128];

static void mark(char value) { calls[call_count++] = value; calls[call_count] = '\0'; }
static void print_stub(int level, const char *fmt, ...) { (void)level; (void)fmt; }
float LibVarGetValue(char *name) { (void)name; return 0; }
float LibVarValue(char *name, char *value) {
    if (!strcmp(name, "maxclients")) return 2;
    if (!strcmp(name, "maxentities")) return 4;
    return (float)atoi(value);
}
void LibVarSet(char *name, char *value) { strcpy(lib_name, name); strcpy(lib_value, value); }
char *LibVarGetString(char *name) { return !strcmp(name, lib_name) ? lib_value : ""; }
void LibVarDeAllocAll(void) { mark('D'); lib_name[0] = lib_value[0] = 0; }
void Log_Open(char *name) { (void)name; }
void Log_Shutdown(void) { mark('L'); }
int AAS_Setup(void) { mark('A'); return failure_at == 1 ? 11 : 0; }
int EA_Setup(void) { mark('E'); return failure_at == 2 ? 12 : 0; }
int BotSetupWeaponAI(void) { mark('W'); return failure_at == 3 ? 13 : 0; }
int BotSetupGoalAI(void) { mark('G'); return failure_at == 4 ? 14 : 0; }
int BotSetupChatAI(void) { mark('C'); return failure_at == 5 ? 15 : 0; }
int BotSetupMoveAI(void) { mark('M'); return failure_at == 6 ? 16 : 0; }
void BotShutdownChatAI(void) { mark('C'); }
void BotShutdownMoveAI(void) { mark('M'); }
void BotShutdownGoalAI(void) { mark('G'); }
void BotShutdownWeaponAI(void) { mark('W'); }
void BotShutdownWeights(void) { mark('T'); }
void BotShutdownCharacters(void) { mark('H'); }
void AAS_Shutdown(void) { mark('A'); }
void EA_Shutdown(void) { mark('E'); }
void PC_RemoveAllGlobalDefines(void) { mark('P'); }
void PC_CheckOpenSourceHandles(void) { mark('K'); }
int AAS_StartFrame(float value) { mark('F'); return value < 0 ? 17 : 0; }
int AAS_LoadMap(const char *name) { mark('Q'); return !strcmp(name, "bad") ? 18 : 0; }
void BotInitLevelItems(void) { mark('I'); }
void BotSetBrushModelTypes(void) { mark('B'); }
int AAS_UpdateEntity(int ent, bot_entitystate_t *state) { mark(state ? 'U' : 'R'); return ent + 20; }

#include "be_interface_under_test.inc"

static void reset_calls(void) { call_count = 0; calls[0] = 0; failure_at = 0; }
int main(void) {
    bot_entitystate_t entity = { 9 };
    char value[8];
    int result;
    botimport.Print = print_stub;
    memset(&botlibglobals, 0, sizeof(botlibglobals));
    botlibglobals.maxclients = 2; botlibglobals.maxentities = 4;
    printf("valid=%d,%d,%d,%d,%d,%d\n", ValidClientNumber(-1,"c"), ValidClientNumber(0,"c"), ValidClientNumber(2,"c"), ValidEntityNumber(-1,"e"), ValidEntityNumber(4,"e"), ValidEntityNumber(5,"e"));
    printf("guard=%d,%d,%d,%d\n", BotLibSetup("x"), Export_BotLibStartFrame(1.0f), Export_BotLibLoadMap("q3dm1"), Export_BotLibUpdateEntity(0,&entity));
    Export_BotLibVarSet("alpha", "abcdef"); memset(value, 'x', sizeof(value)); Export_BotLibVarGet("alpha", value, 4); printf("var=%s,%s\n", value, lib_name);
    reset_calls(); result=Export_BotLibSetup(); printf("setup=%d,%s,%d,%d,%d,%d\n", result, calls, botlibsetup, botlibglobals.botlibsetup, botlibglobals.maxclients, botlibglobals.maxentities);
    reset_calls(); result=Export_BotLibStartFrame(1.25f); printf("frame=%d,%s\n", result, calls);
    reset_calls(); result=Export_BotLibStartFrame(-1.0f); printf("framefail=%d,%s\n", result, calls);
    reset_calls(); result=Export_BotLibLoadMap("q3dm1"); printf("map=%d,%s\n", result, calls);
    reset_calls(); result=Export_BotLibLoadMap("bad"); printf("mapfail=%d,%s\n", result, calls);
    reset_calls(); result=Export_BotLibUpdateEntity(4,&entity); printf("entity=%d,%s\n", result, calls);
    reset_calls(); result=Export_BotLibUpdateEntity(0,NULL); printf("remove=%d,%s\n", result, calls);
    reset_calls(); result=Export_BotLibUpdateEntity(5,&entity); printf("entitybad=%d,%s\n", result, calls);
    reset_calls(); result=Export_BotLibShutdown(); printf("shutdown=%d,%s,%d,%d\n", result, calls, botlibsetup, botlibglobals.botlibsetup);
    reset_calls(); result=Export_BotLibShutdown(); printf("shutdown2=%d,%s\n", result, calls);
    memset(&botlibglobals, 0, sizeof(botlibglobals)); botlibglobals.maxclients=99; botlibglobals.maxentities=99; failure_at=4; reset_calls(); failure_at=4;
    result=Export_BotLibSetup(); printf("setupfail=%d,%s,%d,%d\n", result, calls, botlibsetup, botlibglobals.botlibsetup);
    printf("test=%d\n", BotExportTest(0,NULL,NULL,NULL));
    return 0;
}
