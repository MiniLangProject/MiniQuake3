#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_EDIT_LINE 256
#define MAX_STRING_CHARS 1024
#define qtrue 1
#define qfalse 0
typedef int qboolean;
typedef int sfxHandle_t;
typedef float vec4_t[4];
typedef struct { char buffer[MAX_EDIT_LINE]; int cursor, scroll, widthInChars, maxchars; } mfield_t;
typedef struct menuframework_s { int cursor; } menuframework_s;
typedef struct { int flags,x,y,left,top,right,bottom,menuPosition; const char *name; menuframework_s *parent; } menucommon_s;
typedef struct { menucommon_s generic; mfield_t field; } menufield_s;

#define QMF_SMALLFONT 2
#define QMF_NUMBERSONLY 32
#define QMF_GRAYED 8192
#define QMF_LOWERCASE 262144
#define QMF_UPPERCASE 524288
#define UI_CENTER 1
#define UI_RIGHT 2
#define UI_BIGFONT 0
#define UI_SMALLFONT 16
#define UI_BLINK 32
#define UI_PULSE 64
#define UI_GIANTFONT 128
#define BIGCHAR_WIDTH 16
#define BIGCHAR_HEIGHT 16
#define SMALLCHAR_WIDTH 8
#define SMALLCHAR_HEIGHT 16
#define GIANTCHAR_WIDTH 32
#define K_TAB 9
#define K_ENTER 13
#define K_UPARROW 132
#define K_DOWNARROW 133
#define K_LEFTARROW 134
#define K_RIGHTARROW 135
#define K_CTRL 137
#define K_SHIFT 138
#define K_INS 139
#define K_DEL 140
#define K_HOME 143
#define K_END 144
#define K_KP_HOME 160
#define K_KP_UPARROW 161
#define K_KP_LEFTARROW 163
#define K_KP_RIGHTARROW 165
#define K_KP_END 166
#define K_KP_DOWNARROW 167
#define K_KP_ENTER 169
#define K_KP_INS 170
#define K_KP_DEL 171
#define K_JOY1 185
#define K_JOY2 186
#define K_JOY3 187
#define K_JOY4 188
#define K_CHAR_FLAG 1024
#define Q_islower(c) ((c)>='a'&&(c)<='z')
#define Q_isupper(c) ((c)>='A'&&(c)<='Z')
#define Q_isalpha(c) (Q_islower(c)||Q_isupper(c))

static int g_overstrike, g_shift, g_ctrl;
static char g_clipboard[64]="12";
static char g_drawn[1024];
static int g_draw_x, g_cursor_x, g_cursor_char;
static int menu_buzz_sound=4;
static float text_color_disabled[4],text_color_highlight[4],text_color_normal[4],listbar_color[4];
static int trap_Key_GetOverstrikeMode(void){ return g_overstrike; }
static void trap_Key_SetOverstrikeMode(int value){ g_overstrike=value; }
static int trap_Key_IsDown(int key){ return key==K_SHIFT?g_shift:(key==K_CTRL?g_ctrl:0); }
static void trap_GetClipboardData(char *out,int cap){ snprintf(out,(size_t)cap,"%s",g_clipboard); }
static void trap_Error(const char *msg){ fprintf(stderr,"%s\n",msg); exit(2); }
static void UI_DrawString(int x,int y,const char *s,int style,const float *color){ (void)y;(void)style;(void)color;g_draw_x=x;snprintf(g_drawn,sizeof(g_drawn),"%s",s); }
static void UI_DrawChar(int x,int y,int ch,int style,const float *color){ (void)y;(void)style;(void)color;g_cursor_x=x;g_cursor_char=ch; }
static void UI_FillRect(int x,int y,int w,int h,const float *color){(void)x;(void)y;(void)w;(void)h;(void)color;}
static void *Menu_ItemAtCursor(menuframework_s *m){(void)m;return NULL;}

void MField_Paste(mfield_t *edit);
void MField_CharEvent(mfield_t *edit,int ch);
void MField_Clear(mfield_t *edit);
#include "ui_mfield_under_test.inc"

static void show(const char *tag,mfield_t *f){ printf("%s|%s|%d|%d|%d\n",tag,f->buffer,f->cursor,f->scroll,g_overstrike); }
int main(void){
  mfield_t f; memset(&f,0,sizeof(f)); f.widthInChars=3; f.maxchars=8; strcpy(f.buffer,"abc"); f.cursor=1;
  g_overstrike=0; MField_CharEvent(&f,'X'); show("overwrite",&f);
  g_overstrike=1; MField_CharEvent(&f,'Y'); show("insert",&f);
  MField_CharEvent(&f,8); show("backspace",&f);
  MField_KeyDownEvent(&f,K_DEL); show("delete",&f);
  MField_KeyDownEvent(&f,K_END); show("end",&f);
  MField_KeyDownEvent(&f,K_LEFTARROW); show("left",&f);
  g_shift=1; MField_KeyDownEvent(&f,K_INS); g_shift=0; show("paste",&f);
  MField_CharEvent(&f,1); show("home",&f);
  MField_Clear(&f); show("clear",&f);
  strcpy(f.buffer,"abcdef");f.cursor=6;f.scroll=5;f.widthInChars=3;g_overstrike=0;g_drawn[0]=0;MField_Draw(&f,100,20,UI_SMALLFONT|UI_PULSE,text_color_normal);printf("draw|%s|%d|%d|%d|%d\n",g_drawn,f.scroll,g_draw_x,g_cursor_x,g_cursor_char);
  menufield_s mf;memset(&mf,0,sizeof(mf));mf.field.widthInChars=4;mf.field.maxchars=4;mf.generic.flags=QMF_UPPERCASE;int key=K_CHAR_FLAG|'b';MenuField_Key(&mf,&key);printf("menu|%s|%d\n",mf.field.buffer,key);
  mf.generic.flags=QMF_NUMBERSONLY;key=K_CHAR_FLAG|'x';printf("buzz|%d|%s\n",MenuField_Key(&mf,&key),mf.field.buffer);
  return 0;
}
