/* SPDX-License-Identifier: GPL-2.0-or-later
 * Differential harness for the unchanged Baseq3 Cvar_WriteVariables.
 */
#include "q_shared.h"
#include "qcommon.h"
#include <stdint.h>
extern void Cvar_WriteVariables(fileHandle_t f);
extern cvar_t *Cvar_Set2(const char *,const char *,qboolean);
static char captured[16384];
static size_t capturedLength;
void QDECL Com_Printf(const char *fmt,...) {(void)fmt;}
void QDECL Com_DPrintf(const char *fmt,...) {(void)fmt;}
void QDECL Com_Error(int code,const char *fmt,...) {(void)fmt;exit(20+code);}
void Z_Free(void *p) {free(p);}
void Com_Memset(void *p,int c,size_t n) {memset(p,c,n);}
char *CopyString(const char *s) {return _strdup(s);}
int Cmd_Argc(void) {return 0;}
char *Cmd_Argv(int n) {(void)n;return "";}
char *Cmd_Args(void) {return "";}
char *Cmd_ArgsFrom(int n) {(void)n;return "";}
void Cmd_AddCommand(const char *n,xcommand_t fn) {(void)n;(void)fn;}
int Com_Filter(char *f,char *n,int cs) {(void)f;(void)n;(void)cs;return 0;}
void QDECL FS_Printf(fileHandle_t f,const char *fmt,...) {
    va_list args;int count;(void)f;
    va_start(args,fmt);count=_vsnprintf(captured+capturedLength,sizeof(captured)-capturedLength-1,fmt,args);va_end(args);
    if(count>0) capturedLength+=(size_t)count;
}
static void record(const char *name) {
    static const char digits[]="0123456789abcdef";size_t i;
    printf("%s|",name);for(i=0;i<capturedLength;i++) printf("%c%c",digits[(captured[i]>>4)&15],digits[captured[i]&15]);printf("\n");
    capturedLength=0;captured[0]=0;
}
int main(void) {
    Cvar_Init();Cvar_Get("alpha","one",CVAR_ARCHIVE);Cvar_Get("beta","two",CVAR_ARCHIVE|CVAR_LATCH);
    Cvar_Set2("beta","pending",qfalse);Cvar_Get("plain","ignored",0);Cvar_Get("CL_CDKEY","secret",CVAR_ARCHIVE);
    Cvar_Get("CaseName","mixed",CVAR_ARCHIVE);Cvar_WriteVariables(1);record("initial");
    Cvar_Set2("alpha","changed",qtrue);Cvar_WriteVariables(1);record("forced");
    Cvar_Set2("beta","live",qtrue);Cvar_WriteVariables(1);record("latch_applied");
    puts("PASS: 3 original Cvar_WriteVariables records");return 0;
}
