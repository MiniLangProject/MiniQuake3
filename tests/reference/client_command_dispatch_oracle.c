/* Host for unchanged SV_ExecuteClientCommand extracted at test time. */
#include <stdio.h>
#include <string.h>
typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define SS_GAME 2
#define GAME_CLIENT_COMMAND 6
typedef struct client_s {
    int slot;
    char name[32];
} client_t;
typedef struct {int state;} server_t;typedef struct {client_t*clients;} serverStatic_t;typedef struct {char*name;void(*func)(client_t*);} ucmd_t;
static server_t sv;static serverStatic_t svs;static void*gvm;static char token[256],event[256];
static void Cmd_TokenizeString(const char*s){int i=0;while(*s&&*s<=32)s++;while(*s&&*s>32&&i<255)token[i++]=*s++;token[i]=0;}
static char*Cmd_Argv(int i){return i==0?token:"";}static void Com_DPrintf(const char*f,...){(void)f;strcpy(event,"ignored");}
static void bi(client_t*c){(void)c;strcpy(event,"builtin");}
static int VM_Call(void*v,int call,int slot){(void)v;(void)call;(void)slot;strcpy(event,"game");return 0;}
static ucmd_t ucmds[]={{"userinfo",bi},{"disconnect",bi},{"cp",bi},{"vdr",bi},{"download",bi},{"nextdl",bi},{"stopdl",bi},{"donedl",bi},{0,0}};
#include "client_command_dispatch_under_test.inc"
static void run(const char*tag,const char*text,int ok,int state){client_t c={0};svs.clients=&c;sv.state=state;event[0]=0;SV_ExecuteClientCommand(&c,text,ok);printf("%s|%s\n",tag,event);}
int main(void){run("userinfo","userinfo x",1,SS_GAME);run("disconnect","disconnect",0,SS_GAME);run("cp","cp abc",1,SS_GAME);run("donedl","donedl",1,SS_GAME);run("game","say hi",1,SS_GAME);run("nogame","say hi",1,1);run("ignored","say hi",0,SS_GAME);run("case","UserInfo x",1,SS_GAME);run("empty","   ",0,SS_GAME);return 0;}
