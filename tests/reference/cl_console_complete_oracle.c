/* Host for unchanged functions extracted from code/client/cl_console.c. */
#include <stdio.h>
#include <string.h>
typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define MAC_STATIC static
#define NUM_CON_TIMES 4
#define CON_TEXTSIZE 32768
#define DEFAULT_CONSOLE_WIDTH 78
#define SMALLCHAR_WIDTH 8
#define KEYCATCH_CONSOLE 1
#define COLOR_WHITE '7'
#define ColorIndex(c) ((c)&7)
#define Q_IsColorString(p) ((p)[0]=='^' && (p)[1] && (p)[1]!='^')
#define Q_strncmp strncmp
#define Com_Memcpy memcpy
static int screen_width=640;
#define SCREEN_WIDTH screen_width
typedef struct { int integer; float value; } cvar_t;
typedef struct { int realtime,realFrametime,keyCatchers,state; } clientStatic_t;
typedef struct { qboolean initialized; short text[CON_TEXTSIZE]; int current,x,display,linewidth,totallines; float xadjust,displayFrac,finalFrac; int vislines,times[NUM_CON_TIMES]; float color[4]; } console_t;
console_t con; clientStatic_t cls; cvar_t noPrint={0,0},speed={3,3};cvar_t *cl_noprint=&noPrint,*con_conspeed=&speed;
void Con_ClearNotify(void);void Con_CheckResize(void);void Con_Linefeed(qboolean skipnotify);
#include "cl_console_complete_under_test.inc"
static int cellch(int line,int col){return con.text[(line%con.totallines)*con.linewidth+col]&255;}
static int cellcolor(int line,int col){return (con.text[(line%con.totallines)*con.linewidth+col]>>8)&7;}
static void reset(void){memset(&con,0,sizeof(con));memset(&cls,0,sizeof(cls));screen_width=640;speed.value=3;}
int main(void){int before;
 reset();cls.realtime=100;CL_ConsolePrint("alpha ^1red\nline");printf("print|%d|%d|%d|%d|%d|%c|%c|%d|%c|%d\n",con.linewidth,con.totallines,con.current,con.display,con.x,cellch(con.current-1,0),cellch(con.current-1,6),cellcolor(con.current-1,6),cellch(con.current,0),con.times[con.current%4]);
 before=con.current;cls.realtime=200;CL_ConsolePrint("[skipnotify] hidden\n");printf("skip|%d|%d|%d\n",con.current-before,con.times[(con.current+3)%4],con.times[con.current%4]);
 Con_Bottom();before=con.display;Con_PageUp();printf("scroll|%d|",con.display-before);Con_PageDown();printf("%d|",con.display-before);Con_Top();printf("%d\n",con.current-con.display);
 cls.keyCatchers=1;cls.realFrametime=50;con.displayFrac=0;Con_RunConsole();printf("animate|%d|%d\n",(int)(con.displayFrac*100),(int)(con.finalFrac*100));Con_RunConsole();Con_RunConsole();Con_RunConsole();printf("clamp|%d\n",(int)(con.displayFrac*100));
 screen_width=800;Con_CheckResize();printf("resize|%d|%d|%c|%c\n",con.linewidth,con.totallines,cellch(con.current-2,0),cellch(con.current-1,0));
 return 0;}
