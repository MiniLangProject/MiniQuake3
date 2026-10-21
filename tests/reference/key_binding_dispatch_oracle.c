// Differential harness for unchanged Baseq3 CL_KeyEvent binding expansion.
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define MAX_KEYS 256
#define K_ESCAPE 27
#define K_MOUSE1 178
#define KEYCATCH_CONSOLE 1
#define KEYCATCH_UI 2
#define KEYCATCH_MESSAGE 4
#define KEYCATCH_CGAME 8
#define CA_DISCONNECTED 0
#define CA_CINEMATIC 6
#define CA_ACTIVE 8
#define CG_EVENT_HANDLING 1
#define CGAME_EVENT_NONE 0
#define UI_SET_ACTIVE_MENU 2
#define UI_KEY_EVENT 3
#define CG_KEY_EVENT 4
#define UIMENU_INGAME 1
#define UIMENU_MAIN 2

typedef struct { qboolean down; int repeats; char *binding; } qkey_t;
typedef struct { int state; int keyCatchers; } clientStatic_t;
typedef struct { int demoplaying; } clientConnection_t;

qkey_t keys[MAX_KEYS];
qboolean anykeydown;
clientStatic_t cls;
clientConnection_t clc;
void *cgvm;
void *uivm;
int time;
static char captured[8192];

static void Cbuf_AddText(const char *text) {
    size_t used = strlen(captured);
    size_t length = strlen(text);
    size_t available = sizeof(captured) - used - 1;
    if (length > available) length = available;
    memcpy(captured + used, text, length);
    captured[used + length] = '\0';
}
static void Com_sprintf(char *dest, int size, const char *format, ...) {
    va_list args; va_start(args, format); vsnprintf(dest, (size_t)size, format, args); va_end(args);
}
static double Cvar_VariableValue(const char *name) { (void)name; return 0.0; }
static void Cvar_Set(const char *name, const char *value) { (void)name; (void)value; }
static void Con_ToggleConsole_f(void) {}
static void Message_Key(int key) { (void)key; }
static int VM_Call(void *vm, int command, ...) { (void)vm; (void)command; return 0; }
static void CL_Disconnect_f(void) {}
static void S_StopAllSounds(void) {}
static void Console_Key(int key) { (void)key; }
static void Com_Printf(const char *format, ...) { (void)format; }
static const char *Key_KeynumToString(int key) { (void)key; return "KEY"; }

#include "key_binding_dispatch_under_test.inc"

static void reset(char *binding) {
    memset(keys, 0, sizeof(keys));
    memset(captured, 0, sizeof(captured));
    keys[119].binding = binding;
    cls.state = CA_ACTIVE;
    cls.keyCatchers = 0;
    clc.demoplaying = 0;
    anykeydown = 0;
    cgvm = uivm = NULL;
}

static void dump(const char *label) {
    const unsigned char *at = (const unsigned char *)captured;
    printf("%s ", label);
    while (*at) printf("%02x", *at++);
    putchar('\n');
    captured[0] = '\0';
}

int main(void) {
    reset("+forward"); time = 100; CL_KeyEvent(119, qtrue, 100); dump("forward-down");
    time = 140; CL_KeyEvent(119, qfalse, 140); dump("forward-up");
    reset("+attack; say fire; +moveup"); time = 200; CL_KeyEvent(119, qtrue, 200); dump("compound-down");
    time = 260; CL_KeyEvent(119, qfalse, 260); dump("compound-up");
    reset("weapnext; say untouched"); time = 300; CL_KeyEvent(119, qtrue, 300); dump("plain-down");
    time = 320; CL_KeyEvent(119, qfalse, 320); dump("plain-up");
    return 0;
}
