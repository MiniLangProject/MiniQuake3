/* SPDX-License-Identifier: GPL-2.0-or-later */
#include "q_shared.h"
#include "qcommon.h"
#include <stdarg.h>
extern cvar_t *Cvar_Set2(const char *,const char *,qboolean);
static int cargc;static const char *cargv[16];
static struct { const char *name; xcommand_t fn; } commands[32];static int numCommands;
static char output[8192];static int outputLength;
void QDECL Com_Printf(const char *fmt, ...) { va_list a;int n;va_start(a,fmt);n=_vsnprintf(output+outputLength,sizeof(output)-outputLength-1,fmt,a);va_end(a);if(n>0) outputLength+=n;output[outputLength]=0; }
void QDECL Com_DPrintf(const char *fmt, ...) { (void)fmt; }
void QDECL Com_Error(int code,const char *fmt,...) { (void)fmt; exit(20+code); }
void Z_Free(void *p) { free(p); }
void Com_Memset(void *p,int c,size_t count) { memset(p,c,count); }
char *CopyString(const char *s) { return _strdup(s); }
int Cmd_Argc(void) { return cargc; }
char *Cmd_Argv(int n) { return (char *)((n>=0&&n<cargc)?cargv[n]:""); }
char *Cmd_Args(void) { return ""; }
char *Cmd_ArgsFrom(int n) { (void)n; return ""; }
void Cmd_AddCommand(const char *n,xcommand_t fn) { commands[numCommands].name=n;commands[numCommands].fn=fn;numCommands++; }
int Com_Filter(char *f,char *n,int cs) { (void)f;(void)n;(void)cs;return 1; }
void QDECL FS_Printf(fileHandle_t f,const char *fmt,...) { (void)f;(void)fmt; }
static void invoke(int count,...) { va_list a;int i,j;cargc=count;va_start(a,count);for(i=0;i<count;i++)cargv[i]=va_arg(a,const char*);va_end(a);for(j=0;j<numCommands;j++)if(!strcmp(commands[j].name,cargv[0])){commands[j].fn();return;} }
static void escaped(void) { int i;for(i=0;i<outputLength;i++){unsigned char c=(unsigned char)output[i];if(c=='\n')printf("\\n");else if(c=='\\')printf("\\\\");else putchar(c);} }
static void record(const char *label,const char *name,int exists) { cvar_t *v=exists?Cvar_Get(name,"",0):NULL;printf("%s|",label);if(v)printf("%s|%s|%s|%d|%d",v->name,v->string,v->resetString,v->flags,v->modificationCount);else printf("<missing>");printf("|out=");escaped();putchar('\n');outputLength=0;output[0]=0; }
int main(void) {
 Cvar_Init();
 invoke(1,"set");record("set_usage","alpha",0);
 invoke(4,"set","alpha","one","two");record("set_multi","alpha",1);
 invoke(3,"seta","alpha","archived");record("seta","alpha",1);
 invoke(3,"setu","userinfo","value");record("setu","userinfo",1);
 invoke(3,"sets","serverinfo","value");record("sets","serverinfo",1);
 invoke(2,"toggle","flag");record("toggle_new","flag",1);
 invoke(2,"toggle","flag");record("toggle_old","flag",1);
 invoke(2,"reset","alpha");record("reset","alpha",1);
 cargc=1;cargv[0]="alpha";Cvar_Command();record("direct_print","alpha",1);
 cargc=3;cargv[0]="alpha";cargv[1]="next";cargv[2]="ignored";Cvar_Command();record("direct_set","alpha",1);
 invoke(2,"setu","bad");record("setu_usage","bad",0);
 return 0;
}
