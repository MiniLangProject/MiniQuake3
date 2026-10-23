#include <stdio.h>
#include <string.h>

typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define SE_KEY 1
#define K_MOUSE1 178
#define K_AUX1 217

typedef struct { int mouseInitialized; int oldButtonState; } mouseVars_t;
typedef struct { int sysMsgTime; } windowVars_t;
typedef struct { int time, type, value, value2; } event_t;
static mouseVars_t s_wmv;
static windowVars_t g_wv;
static event_t events[64];
static int eventCount;
static void Sys_QueEvent(int time, int type, int value, int value2, int ptrLength, void *ptr) {
    (void)ptrLength; (void)ptr;
    events[eventCount].time=time; events[eventCount].type=type;
    events[eventCount].value=value; events[eventCount].value2=value2; ++eventCount;
}

#include "win_input_complete_under_test.inc"

static void dump(const char *label) {
    int i;
    for (i=0;i<eventCount;++i) printf("%s %d %d %d %d\n",label,events[i].time,events[i].type,events[i].value,events[i].value2);
    eventCount=0;
}

int main(void) {
    int values[] = { -10,0,1,16384,32767,32768,49152,65535,65536,90000 };
    int i;
    for (i=0;i<(int)(sizeof(values)/sizeof(values[0]));++i)
        printf("J %d %d %d\n",values[i],(int)(JoyToF(values[i])*1000000.0f),JoyToI(values[i]));
    memset(&s_wmv,0,sizeof(s_wmv)); s_wmv.mouseInitialized=1; g_wv.sysMsgTime=123;
    IN_MouseEvent(5); dump("M"); IN_MouseEvent(2); dump("M"); IN_ClearStates(); IN_MouseEvent(1); dump("M");
    g_wv.sysMsgTime=456; MIDI_NoteOn(60,100); MIDI_NoteOn(61,0); MIDI_NoteOff(59); MIDI_NoteOff(99); dump("D");
    return 0;
}
