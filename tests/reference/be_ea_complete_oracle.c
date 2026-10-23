/* Compile-time harness for functions extracted verbatim from Baseq3 be_ea.c. */
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef float vec3_t[3];
typedef struct bot_input_s {
    float thinktime;
    vec3_t dir;
    float speed;
    vec3_t viewangles;
    int actionflags;
    int weapon;
} bot_input_t;
typedef struct { int maxclients; } botlib_globals_t;
typedef struct { void (*BotClientCommand)(int, char *); } botlib_import_t;

#define BLERR_NOERROR 0
#define qfalse 0
#define MAX_USERMOVE 400
#define ACTION_ATTACK 0x0000001
#define ACTION_USE 0x0000002
#define ACTION_RESPAWN 0x0000008
#define ACTION_JUMP 0x0000010
#define ACTION_MOVEUP 0x0000020
#define ACTION_CROUCH 0x0000080
#define ACTION_MOVEDOWN 0x0000100
#define ACTION_MOVEFORWARD 0x0000200
#define ACTION_MOVEBACK 0x0000800
#define ACTION_MOVELEFT 0x0001000
#define ACTION_MOVERIGHT 0x0002000
#define ACTION_DELAYEDJUMP 0x0008000
#define ACTION_TALK 0x0010000
#define ACTION_GESTURE 0x0020000
#define ACTION_WALK 0x0080000
#define ACTION_AFFIRMATIVE 0x0100000
#define ACTION_FOLLOWME 0x8000000
#define ACTION_JUMPEDLASTFRAME 128
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorClear(a) memset((a),0,sizeof(vec3_t))
#define Com_Memcpy memcpy

bot_input_t *botinputs;
botlib_globals_t botlibglobals;
botlib_import_t botimport;
static int allocation_count;
static int command_count;
static char commands[8][96];

static void *GetClearedHunkMemory(size_t size) { allocation_count++; return calloc(1, size); }
static void FreeMemory(void *value) { if (value) allocation_count--; free(value); }
static char *va(const char *format, ...) {
    static char buffer[256]; va_list ap; va_start(ap, format);
    vsnprintf(buffer, sizeof(buffer), format, ap); va_end(ap); return buffer;
}
static void client_command(int client, char *text) {
    snprintf(commands[command_count], sizeof(commands[command_count]), "%d:%s", client, text);
    command_count++;
}

#include "be_ea_complete_under_test.inc"

int main(void) {
    bot_input_t out, before;
    vec3_t direction = { 1.25f, -2.5f, 3.75f };
    vec3_t angles = { 10.0f, 20.0f, 30.0f };
    botlibglobals.maxclients = 3; botimport.BotClientCommand = client_command;
    printf("setup=%d,%d\n", EA_Setup(), allocation_count);
    EA_Say(1,"hello"); EA_SayTeam(1,"red"); EA_Tell(1,2,"cover");
    EA_UseItem(1,"Medkit"); EA_DropItem(1,"Quad"); EA_UseInv(1,"key"); EA_DropInv(1,"rune"); EA_Command(2,"team blue");
    printf("commands=%d\n", command_count);
    for (int i=0;i<command_count;i++) printf("cmd=%s\n",commands[i]);
    EA_Attack(0); EA_Use(0); EA_Respawn(0); EA_Gesture(0); EA_Talk(0); EA_Crouch(0); EA_Walk(0);
    EA_MoveUp(0); EA_MoveDown(0); EA_MoveForward(0); EA_MoveBack(0); EA_MoveLeft(0); EA_MoveRight(0);
    EA_Action(0,ACTION_AFFIRMATIVE|ACTION_FOLLOWME); EA_SelectWeapon(0,300);
    EA_Move(0,direction,900.0f); EA_View(0,angles); EA_GetInput(0,0.125f,&out);
    printf("input=%.3f,%.2f,%.2f,%.2f,%.1f,%.1f,%.1f,%.1f,%d,%d\n",out.thinktime,out.dir[0],out.dir[1],out.dir[2],out.speed,out.viewangles[0],out.viewangles[1],out.viewangles[2],out.actionflags,out.weapon);
    EA_Move(0,direction,-900.0f); EA_GetInput(0,0.25f,&out); printf("clamp=%.1f\n",out.speed);
    before=out; EA_EndRegular(0,99.0f); EA_GetInput(0,0.25f,&out); printf("end=%d\n",memcmp(&before,&out,sizeof(out))==0);
    EA_Jump(1); EA_ResetInput(1); EA_GetInput(1,0.2f,&out); printf("latch=%d,%.1f,%.1f\n",out.actionflags,out.dir[0],out.speed);
    EA_Jump(1); EA_DelayedJump(1); EA_GetInput(1,0.2f,&out); printf("held=%d\n",out.actionflags);
    EA_ResetInput(1); EA_DelayedJump(1); EA_GetInput(1,0.2f,&out); printf("delayed=%d\n",out.actionflags);
    EA_Shutdown(); printf("shutdown=%d,%d\n",botinputs==NULL,allocation_count);
    return 0;
}
