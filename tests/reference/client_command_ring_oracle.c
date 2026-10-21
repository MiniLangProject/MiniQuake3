// Differential harness for unchanged CL_CreateNewCommands / CL_GetUserCmd.
#include <stdarg.h>
#include <stdio.h>

typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define CA_PRIMED 7
#define CMD_BACKUP 64
#define CMD_MASK 63
#define ERR_DROP 1

typedef struct { int marker; } usercmd_t;
typedef struct { int state; } clientStatic_t;
typedef struct { int cmdNumber; usercmd_t cmds[CMD_BACKUP]; } clientActive_t;

clientStatic_t cls;
clientActive_t cl;
int frame_msec;
int com_frameTime;
int old_com_frameTime;
static int createCount;
static int errorCount;

static usercmd_t CL_CreateCmd(void) {
    usercmd_t value;
    createCount++;
    value.marker = 1000 + frame_msec + createCount;
    return value;
}

static void Com_Error(int code, const char *format, ...) {
    (void)code;
    (void)format;
    errorCount++;
}

#include "client_command_ring_under_test.inc"

static void reset(int state, int frameTime, int oldFrameTime, int commandNumber) {
    int index;
    cls.state = state;
    com_frameTime = frameTime;
    old_com_frameTime = oldFrameTime;
    cl.cmdNumber = commandNumber;
    frame_msec = -999;
    createCount = 0;
    errorCount = 0;
    for (index = 0; index < CMD_BACKUP; index++) cl.cmds[index].marker = 2000 + index;
}

int main(void) {
    usercmd_t command;
    qboolean found;

    reset(5, 250, 10, 3);
    CL_CreateNewCommands();
    printf("advance %d %d %d %d %d\n", frame_msec, old_com_frameTime, cl.cmdNumber, createCount, cl.cmds[3].marker);

    reset(CA_PRIMED, 250, 0, 0);
    CL_CreateNewCommands();
    printf("advance %d %d %d %d %d\n", frame_msec, old_com_frameTime, cl.cmdNumber, createCount, cl.cmds[1].marker);

    reset(CA_PRIMED, 300, 250, 63);
    CL_CreateNewCommands();
    printf("advance %d %d %d %d %d\n", frame_msec, old_com_frameTime, cl.cmdNumber, createCount, cl.cmds[0].marker);

    reset(CA_PRIMED, 240, 300, 9);
    CL_CreateNewCommands();
    printf("advance %d %d %d %d %d\n", frame_msec, old_com_frameTime, cl.cmdNumber, createCount, cl.cmds[10].marker);

    reset(CA_PRIMED, 0, 0, 70);
    printf("current %d\n", CL_GetCurrentCmdNumber());
    found = CL_GetUserCmd(70, &command);
    printf("get %d %d %d\n", 70, found, command.marker);
    found = CL_GetUserCmd(7, &command);
    printf("get %d %d %d\n", 7, found, command.marker);
    command.marker = -1;
    found = CL_GetUserCmd(6, &command);
    printf("get %d %d %d\n", 6, found, command.marker);
    (void)CL_GetUserCmd(71, &command);
    printf("future %d\n", errorCount);
    return 0;
}
