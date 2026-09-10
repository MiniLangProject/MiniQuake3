/* SPDX-License-Identifier: GPL-2.0-or-later
 * Harness for exact function bodies extracted from Baseq3 qcommon/cmd.c.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

typedef unsigned char byte;
typedef struct { byte *data; int maxsize; int cursize; } cmd_t;
#define MAX_CMD_BUFFER 16384
#define MAX_CMD_LINE 1024
#define MAX_STRING_TOKENS 1024
#define MAX_STRING_CHARS 1024
#define BIG_INFO_STRING 8192
enum { EXEC_NOW, EXEC_INSERT, EXEC_APPEND };
#define ERR_FATAL 0

int cmd_wait;
cmd_t cmd_text;
byte cmd_text_buf[MAX_CMD_BUFFER];
static int cmd_argc;
static char *cmd_argv[MAX_STRING_TOKENS];
static char cmd_tokenized[BIG_INFO_STRING+MAX_STRING_TOKENS];
static char cmd_cmd[BIG_INFO_STRING];
static char lines[64][17000], prints[8][128];
static int line_count, print_count;

static void Com_Memcpy(void *d,const void *s,size_t n) { memcpy(d,s,n); }
static void Q_strncpyz(char *d,const char *s,int n) { if(n<1) return; strncpy(d,s,(size_t)n-1); d[n-1]=0; }
static void Com_Printf(const char *format,...) { va_list ap; va_start(ap,format); vsnprintf(prints[print_count++],128,format,ap); va_end(ap); }
static void Com_Error(int code,const char *message) { (void)code; Com_Printf("ERROR:%s",message); }

int Cmd_Argc(void); char *Cmd_Argv(int); void Cmd_TokenizeString(const char *);
void Cbuf_InsertText(const char *); void Cbuf_AddText(const char *); void Cmd_Wait_f(void);
void Cbuf_Execute(void);
static void Cmd_ExecuteString(const char *line) {
  Q_strncpyz(lines[line_count++],line,17000);
  Cmd_TokenizeString(line);
  if (!strcmp(Cmd_Argv(0),"wait")) Cmd_Wait_f();
  else if (!strcmp(Cmd_Argv(0),"insert")) Cbuf_InsertText(Cmd_Argv(1));
  else if (!strcmp(Cmd_Argv(0),"append")) Cbuf_AddText(Cmd_Argv(1));
}

#include "cmd_under_test.inc"

static void hexn(const void *s,int n) { const unsigned char *p=(const unsigned char *)s; while(n-->0) printf("%02x",*p++); }
static void hex(const char *s) { hexn(s,(int)strlen(s)); }
static void token_case(const char *name,const char *input,int joins) {
  int i; Cmd_TokenizeString(input); printf("T|%s|%d|",name,Cmd_Argc()); hex(Cmd_Cmd());
  for(i=0;i<Cmd_Argc();i++){ putchar('|'); hex(Cmd_Argv(i)); }
  if(joins){ printf("|A:"); hex(Cmd_Args()); printf("|F:"); hex(Cmd_ArgsFrom(-2));
    printf("|V:"); { char b[4]; Cmd_ArgvBuffer(1,b,sizeof(b)); hex(b); }
    printf("|B:"); { char b[7]; Cmd_ArgsBuffer(b,sizeof(b)); hex(b); }
  }
  putchar('\n');
}
static void reset_buffer(void){ Cbuf_Init();cmd_wait=0;line_count=0;print_count=0; }
static void buffer_result(const char *name) {
  int i; printf("B|%s|%d|%d|",name,line_count,cmd_wait); hexn(cmd_text.data,cmd_text.cursize);
  for(i=0;i<line_count;i++){putchar('|');hex(lines[i]);}
  for(i=0;i<print_count;i++){printf("|P:");hex(prints[i]);}
  putchar('\n');
}
static void repeated(char *out,int count,char value){memset(out,value,(size_t)count);out[count]=0;}
int main(void) {
  char many[9000], large[17000], longline[1200]; int at=0,i;
  token_case("empty","",1); token_case("space"," \t\r\n a\tb  c ",1);
  token_case("quotes","say \"hello world\" tail",1); token_case("adjacent","ab\"cd ef\"gh",1);
  token_case("linecomment","a b//ignored c",1); token_case("blockcomment","a/* ignored */b / lone",1);
  token_case("unterminated_block","a /* missing",1); token_case("unterminated_quote","a \"missing tail",1);
  token_case("quoted_comments","a \"// x /* y */\" z",1); token_case("semicolon","a;b ; c",1);
  token_case("slash","/ // stop",1); token_case("controls","a\001b\037c",1);
  token_case("signed_char","a\200 b \"c\200d\"",1);
  Cmd_TokenizeString("preserved"); token_case("null",NULL,1);
  for(i=0;i<1025;i++){many[at++]='x';many[at++]=' ';}many[at]=0;token_case("token_limit",many,0);
  repeated(many,8300,'q');token_case("command_limit",many,0);

  reset_buffer(); Cbuf_AddText("echo one;echo \"a;b\"\nlast\rend"); Cbuf_Execute(); buffer_result("breaks");
  reset_buffer(); Cbuf_AddText("echo \"odd;still\";after"); Cbuf_Execute(); buffer_result("quoted_semicolon");
  reset_buffer(); Cbuf_AddText("a //comment;hidden\nb /* x;y */;c"); Cbuf_Execute(); buffer_result("comment_boundaries");
  reset_buffer(); Cbuf_AddText("insert \"first;second\";tail"); Cbuf_Execute(); buffer_result("callback_insert");
  reset_buffer(); Cbuf_AddText("one;wait 2;two;three"); Cbuf_Execute(); Cbuf_Execute(); Cbuf_Execute(); buffer_result("wait");
  reset_buffer(); Cbuf_AddText("foo"); Cbuf_AddText("bar"); Cbuf_Execute(); buffer_result("append_no_newline");
  reset_buffer(); Cbuf_AddText("held"); Cbuf_ExecuteText(EXEC_NOW,"direct now"); buffer_result("now_direct");
  Cbuf_ExecuteText(EXEC_NOW,""); buffer_result("now_empty_drains");
  reset_buffer(); Cbuf_ExecuteText(EXEC_INSERT,"head"); Cbuf_ExecuteText(EXEC_APPEND,"tail"); Cbuf_Execute(); buffer_result("execute_modes");
  reset_buffer(); repeated(large,16382,'z'); Cbuf_AddText(large); Cbuf_AddText("x"); Cbuf_AddText("y"); buffer_result("add_overflow");
  reset_buffer(); repeated(large,16383,'i'); Cbuf_InsertText(large); Cbuf_InsertText(""); buffer_result("insert_boundary");
  reset_buffer(); repeated(longline,1100,'l'); strcat(longline,";z"); Cbuf_AddText(longline); Cbuf_Execute(); buffer_result("long_line_chunks");
  return 0;
}
