/* SPDX-License-Identifier: GPL-2.0-or-later
 * Deterministic host around unchanged Baseq3 common.c startup bodies.
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>
typedef unsigned char byte; typedef int qboolean;
typedef struct {byte*data;int maxsize,cursize;} cmd_t;
typedef struct {char name[64],value[256];int flags;} cvar_t;
#define MAX_CONSOLE_LINES 32
#define MAX_CMD_BUFFER 16384
#define MAX_STRING_TOKENS 1024
#define MAX_STRING_CHARS 1024
#define BIG_INFO_STRING 8192
#define CVAR_USER_CREATED 128
#define qfalse 0
#define qtrue 1
int com_numConsoleLines;char *com_consoleLines[MAX_CONSOLE_LINES];
int cmd_wait;cmd_t cmd_text;byte cmd_text_buf[MAX_CMD_BUFFER];
static int cmd_argc;static char*cmd_argv[MAX_STRING_TOKENS];static char cmd_tokenized[BIG_INFO_STRING+MAX_STRING_TOKENS],cmd_cmd[BIG_INFO_STRING];
static cvar_t vars[64];static int var_count;static char events[8192];static int event_len;
static void event(const char*format,...){va_list ap;va_start(ap,format);event_len+=vsnprintf(events+event_len,sizeof(events)-event_len,format,ap);va_end(ap);}
static void Com_Memcpy(void*d,const void*s,size_t n){memcpy(d,s,n);}static void Com_Printf(const char*format,...){(void)format;}
static void Q_strncpyz(char*d,const char*s,int n){if(n<1)return;strncpy(d,s,(size_t)n-1);d[n-1]=0;}
static int Q_stricmp(const char*a,const char*b){return _stricmp(a,b);}static int Q_stricmpn(const char*a,const char*b,int n){return _strnicmp(a,b,(size_t)n);}
static cvar_t*Cvar_Get(const char*name,const char*value,int flags){int i;event("G:%s:%s:%d|",name,value,flags);for(i=0;i<var_count;i++)if(!strcmp(vars[i].name,name))return &vars[i];Q_strncpyz(vars[var_count].name,name,64);Q_strncpyz(vars[var_count].value,value,256);vars[var_count].flags=flags;return &vars[var_count++];}
static void Cvar_Set(const char*name,const char*value){cvar_t*v;event("S:%s:%s|",name,value);v=Cvar_Get(name,value,0);Q_strncpyz(v->value,value,256);}
int Cmd_Argc(void);char*Cmd_Argv(int);void Cmd_TokenizeString(const char*);void Cbuf_AddText(const char*);
#include "startup_cmd_under_test.inc"
#include "startup_under_test.inc"
static void hexn(const void*p,int n){const unsigned char*s=p;while(n-->0)printf("%02x",*s++);}
static void snapshot(const char*label,int value){int i;printf("S|%s|%d|%d",label,value,com_numConsoleLines);for(i=0;i<com_numConsoleLines;i++){printf("|");hexn(com_consoleLines[i],(int)strlen(com_consoleLines[i]));}printf("|");hexn(cmd_text.data,cmd_text.cursize);printf("|");hexn(events,event_len);for(i=0;i<var_count;i++)printf("|%s=%s:%d",vars[i].name,vars[i].value,vars[i].flags);putchar('\n');event_len=0;}
static void reset(void){Cbuf_Init();var_count=0;event_len=0;}
int main(void){char a[1024],limit[1024];int i,at=0,value;
 reset();strcpy(a,"quake3 +set test blah +map test");Com_ParseCommandLine(a);snapshot("basic",0);
 reset();strcpy(a,"set a \"x+y\"+map q3dm1\nnext\r\rfinal+");Com_ParseCommandLine(a);snapshot("quotes_lines",0);
 reset();for(i=0;i<35;i++){if(i)limit[at++]='+';limit[at++]='c';limit[at++]=(char)('A'+i%26);}limit[at]=0;Com_ParseCommandLine(limit);snapshot("line_limit",0);
 reset();strcpy(a,"set x 1+SAFE +map x");Com_ParseCommandLine(a);value=Com_SafeMode();snapshot("safe",value);
 reset();strcpy(a,"set x 1+CvAr_ReStArT+safe");Com_ParseCommandLine(a);value=Com_SafeMode();snapshot("restart_first",value);value=Com_SafeMode();snapshot("safe_second",value);
 reset();strcpy(a,"set foo one+set foo \"two words\"+SET upper no+set developer+map q3dm1");Com_ParseCommandLine(a);Com_StartupVariable("foo");snapshot("variable_match",0);Com_StartupVariable(NULL);snapshot("variable_all",0);
 reset();strcpy(a,"set a 1+settings menu+SET b 2+map q3dm1++echo hi");Com_ParseCommandLine(a);value=Com_AddStartupCommands();snapshot("add_commands",value);
 reset();strcpy(a,"safe+set x 1+map q3dm2");Com_ParseCommandLine(a);value=Com_SafeMode();Com_StartupVariable(NULL);value=value*10+Com_AddStartupCommands();snapshot("integrated",value);
 return 0;}
