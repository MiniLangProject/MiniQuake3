/* SPDX-License-Identifier: GPL-2.0-or-later
 * Host services around verbatim Baseq3 qcommon/cmd.c registry/dispatch bodies.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <ctype.h>
typedef unsigned char byte; typedef void (*xcommand_t)(void);
typedef struct { byte *data; int maxsize,cursize; } cmd_t;
typedef struct cmd_function_s { struct cmd_function_s *next; char *name; xcommand_t function; } cmd_function_t;
typedef struct { int integer; } cvar_t;
#define MAX_CMD_BUFFER 16384
#define MAX_CMD_LINE 1024
#define MAX_STRING_TOKENS 1024
#define MAX_STRING_CHARS 1024
#define BIG_INFO_STRING 8192
#define MAX_TOKEN_CHARS 1024
#define MAX_QPATH 64
#define qfalse 0
#define qtrue 1
#define ERR_FATAL 0
enum { EXEC_NOW,EXEC_INSERT,EXEC_APPEND };
int cmd_wait; cmd_t cmd_text; byte cmd_text_buf[MAX_CMD_BUFFER];
static int cmd_argc; static char *cmd_argv[MAX_STRING_TOKENS];
static char cmd_tokenized[BIG_INFO_STRING+MAX_STRING_TOKENS],cmd_cmd[BIG_INFO_STRING];
static cmd_function_t *cmd_functions;
static cvar_t clrun={1},svrun={1}; cvar_t *com_cl_running=&clrun,*com_sv_running=&svrun;
static char events[32768]; static int event_len;
static void event(const char *format,...){va_list ap;va_start(ap,format);event_len+=vsnprintf(events+event_len,sizeof(events)-event_len,format,ap);va_end(ap);}
static void Com_Memcpy(void*d,const void*s,size_t n){memcpy(d,s,n);}
static void Com_Printf(const char *format,...){char b[2048];va_list ap;va_start(ap,format);vsnprintf(b,sizeof(b),format,ap);va_end(ap);event("P:%s|",b);}
static void Com_Error(int code,const char *message){(void)code;event("E:%s|",message);}
static void Q_strncpyz(char*d,const char*s,int n){if(n<1)return;strncpy(d,s,(size_t)n-1);d[n-1]=0;}
static int Q_stricmp(const char*a,const char*b){return _stricmp(a,b);}
static void *S_Malloc(size_t n){return malloc(n);}
static char *CopyString(const char *s){size_t n=strlen(s)+1;char*r=malloc(n);memcpy(r,s,n);return r;}
static void Z_Free(void*p){free(p);}
static void Com_sprintf(char*out,int size,const char*format,...){va_list ap;va_start(ap,format);vsnprintf(out,(size_t)size,format,ap);va_end(ap);}
static char va_buffer[4096]; static char *va(const char*format,...){va_list ap;va_start(ap,format);vsnprintf(va_buffer,sizeof(va_buffer),format,ap);va_end(ap);return va_buffer;}
static int FS_ReadFile(const char *name,void **out){if(strcmp(name,"ok.cfg")){*out=NULL;event("R:%s|",name);return -1;}*out="echo fromfile;alpha";event("R:%s|",name);return 19;}
static void FS_FreeFile(void *data){(void)data;event("FREE|");}
static char *Cvar_VariableString(const char *name){event("V:%s|",name);return !strcmp(name,"sequence")?"echo vvalue;beta":"";}
int Cmd_Argc(void); char *Cmd_Argv(int); void Cmd_TokenizeString(const char*); void Cbuf_Execute(void); void Cmd_ExecuteString(const char*);
int Com_Filter(char*,char*,int); void COM_DefaultExtension(char*,int,const char*);
static int Cvar_Command(void){event("C:%s|",Cmd_Argv(0));return !strcmp(Cmd_Argv(0),"cvarhit");}
static int CL_GameCommand(void){event("G:%s|",Cmd_Argv(0));return !strcmp(Cmd_Argv(0),"clienthit");}
static int SV_GameCommand(void){event("S:%s|",Cmd_Argv(0));return !strcmp(Cmd_Argv(0),"serverhit");}
static int UI_GameCommand(void){event("U:%s|",Cmd_Argv(0));return !strcmp(Cmd_Argv(0),"uihit");}
static void CL_ForwardCommandToServer(const char *text){event("F:%s|",text);}

#include "cmd_registry_under_test.inc"
#include "cmd_filter_under_test.inc"

static void alpha(void){event("A:%s|",Cmd_Args());} static void beta(void){event("B:%s|",Cmd_Args());}
static void completion(const char *name){event("K:%s|",name);}
static void hexn(const void *p,int n){const unsigned char*s=p;while(n-->0)printf("%02x",*s++);}
static void snapshot(const char *label){cmd_function_t*c;printf("R|%s|",label);hexn(events,event_len);printf("|");for(c=cmd_functions;c;c=c->next)printf("%s,",c->name);printf("|");hexn(cmd_text.data,cmd_text.cursize);printf("|%d\n",cmd_wait);event_len=0;}
int main(void){
 Cbuf_Init();Cmd_Init();Cmd_AddCommand("alpha",alpha);Cmd_AddCommand("beta",beta);Cmd_AddCommand("delegated",NULL);snapshot("init");
 Cmd_AddCommand("alpha",alpha);Cmd_AddCommand("delegated",NULL);Cmd_CommandCompletion(completion);snapshot("duplicate_completion");
 Cmd_ExecuteString("ALPHA one two");snapshot("registered_case_move");
 Cmd_ExecuteString("delegated x");snapshot("null_delegates");
 Cmd_ExecuteString("cvarhit");Cmd_ExecuteString("clienthit");Cmd_ExecuteString("serverhit");Cmd_ExecuteString("uihit");Cmd_ExecuteString("unknown raw \"q v\"");snapshot("dispatch_chain");
 Cmd_ExecuteString("echo hello \"two words\"");snapshot("echo");
 Cmd_ExecuteString("vstr sequence");snapshot("vstr_insert");Cbuf_Execute();snapshot("vstr_execute");
 Cmd_ExecuteString("exec ok");snapshot("exec_insert");Cbuf_Execute();snapshot("exec_execute");
 Cmd_ExecuteString("exec missing");Cmd_ExecuteString("exec");Cmd_ExecuteString("vstr");snapshot("builtin_errors");
 Cmd_ExecuteString("cmdlist *a*");snapshot("filtered_list");
 Cmd_ExecuteString("cmdlist ?e*");Cmd_ExecuteString("cmdlist [a-c]*");snapshot("filter_grammar");
 Cmd_ExecuteString("exec dir.with/ok");Cmd_ExecuteString("exec dir.with\\ok");snapshot("default_extension");
 clrun.integer=0;Cmd_ExecuteString("clienthit");snapshot("running_gates");clrun.integer=1;
 Cmd_RemoveCommand("beta");Cmd_RemoveCommand("missing");Cmd_CommandCompletion(completion);snapshot("remove_completion");
 return 0;
}
