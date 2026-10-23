/* SPDX-License-Identifier: GPL-2.0-or-later
 * Differential harness for the unchanged Baseq3 qcommon/cvar.c public API.
 */
#include "q_shared.h"
#include "qcommon.h"
#include <stdarg.h>

extern cvar_t *Cvar_Set2(const char *,const char *,qboolean);
extern int cvar_modifiedFlags;

static int argcValue;
static const char *argvValue[8];
static char completion[2048];
static int completionCount;

void QDECL Com_Printf(const char *fmt,...) {(void)fmt;}
void QDECL Com_DPrintf(const char *fmt,...) {(void)fmt;}
void QDECL Com_Error(int code,const char *fmt,...) {(void)fmt;exit(20+code);}
void Z_Free(void *p) {free(p);}
void Com_Memset(void *p,int c,size_t n) {memset(p,c,n);}
char *CopyString(const char *s) {return _strdup(s);}
int Cmd_Argc(void) {return argcValue;}
char *Cmd_Argv(int n) {return (char *)((n>=0&&n<argcValue)?argvValue[n]:"");}
char *Cmd_Args(void) {return "";}
char *Cmd_ArgsFrom(int n) {(void)n;return "";}
void Cmd_AddCommand(const char *n,xcommand_t fn) {(void)n;(void)fn;}
int Com_Filter(char *f,char *n,int cs) {(void)f;(void)n;(void)cs;return 1;}
void QDECL FS_Printf(fileHandle_t f,const char *fmt,...) {(void)f;(void)fmt;}

static void complete(const char *name) {
    if (completionCount) strcat(completion,",");
    strcat(completion,name);completionCount++;
}

int main(void) {
    char buffer[5];vmCvar_t vm; cvar_t *v;
    Cvar_Init();

    Cvar_Get("MiXeD","12.75",0);
    printf("lookup|%.6f|%d|%s\n",Cvar_VariableValue("mixed"),Cvar_VariableIntegerValue("MIXED"),Cvar_VariableString("mIxEd"));
    Cvar_VariableStringBuffer("mixed",buffer,sizeof(buffer));printf("buffer|%s|missing=%s\n",buffer,Cvar_VariableString("absent"));

    Cvar_Get("bad;name","one",0);Cvar_Get("bad\\name","two",0);Cvar_Get("bad\"name","three",0);
    printf("validation|%s|%d\n",Cvar_VariableString("BADNAME"),Cvar_VariableIntegerValue("bad;name"));

    cvar_modifiedFlags=0;v=Cvar_Set2("adopt","user",qfalse);printf("adopt0|%s|%s|%d\n",v->string,v->resetString,v->flags);
    v=Cvar_Get("adopt","engine",CVAR_SERVERINFO);printf("adopt1|%s|%s|%d|dirty=%d\n",v->string,v->resetString,v->flags,cvar_modifiedFlags);

    v=Cvar_Get("latched","base",CVAR_LATCH);Cvar_SetLatched("latched","next");
    printf("latch0|%s|%s|%d\n",v->string,v->latchedString,v->modificationCount);
    Cvar_Get("latched","base",CVAR_LATCH);printf("latch1|%s|%s|%d\n",v->string,v->latchedString?v->latchedString:"<null>",v->modificationCount);

    Cvar_Get("number","0",0);Cvar_SetValue("number",2.0f);printf("setvalue0|%s\n",Cvar_VariableString("number"));
    Cvar_SetValue("number",1.25f);printf("setvalue1|%s\n",Cvar_VariableString("number"));
    Cvar_Reset("number");printf("reset|%s\n",Cvar_VariableString("number"));

    Cvar_Get("alpha","one",CVAR_SERVERINFO);Cvar_Get("beta","two",CVAR_SERVERINFO);
    printf("info|%s\n",Cvar_InfoString(CVAR_SERVERINFO));
    printf("big|%s\n",Cvar_InfoString_Big(CVAR_SERVERINFO));
    memset(buffer,'x',sizeof(buffer));Cvar_InfoStringBuffer(CVAR_SERVERINFO,buffer,sizeof(buffer));printf("infobuf|%s\n",buffer);

    memset(&vm,0,sizeof(vm));Cvar_Register(&vm,"vmprobe","7.5",CVAR_ARCHIVE);
    printf("vm0|%d|%d|%.6f|%d|%s\n",vm.handle,vm.modificationCount,vm.value,vm.integer,vm.string);
    Cvar_Set("vmprobe","9");printf("vmstale|%d|%s\n",vm.modificationCount,vm.string);Cvar_Update(&vm);
    printf("vm1|%d|%.6f|%d|%s\n",vm.modificationCount,vm.value,vm.integer,vm.string);

    v=Cvar_Get("cheatprobe","safe",CVAR_CHEAT);Cvar_Set("cheatprobe","unsafe");Cvar_SetCheatState();
    printf("cheat|%s|%d\n",v->string,v->modificationCount);

    Cvar_CommandCompletion(complete);printf("completion|%d|%s\n",completionCount,completion);
    puts("PASS: 18 original cvar API records");return 0;
}
