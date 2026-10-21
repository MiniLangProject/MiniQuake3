#include <stdio.h>
#include <string.h>

typedef int sfxHandle_t;
typedef int qboolean;
#define qfalse 0
#define qtrue 1
#define MAX_MENUITEMS 64
#define MTYPE_SLIDER 1
#define MTYPE_ACTION 2
#define MTYPE_SPINCONTROL 3
#define MTYPE_FIELD 4
#define MTYPE_RADIOBUTTON 5
#define MTYPE_BITMAP 6
#define MTYPE_TEXT 7
#define MTYPE_SCROLLLIST 8
#define MTYPE_PTEXT 9
#define MTYPE_BTEXT 10
#define QMF_CENTER_JUSTIFY 8
#define QMF_RIGHT_JUSTIFY 16
#define QMF_HASMOUSEFOCUS 512
#define QMF_MOUSEONLY 2048
#define QMF_GRAYED 8192
#define QMF_INACTIVE 16384
#define QMF_SILENT 1048576
#define QM_GOTFOCUS 1
#define QM_LOSTFOCUS 2
#define QM_ACTIVATED 3
#define SMALLCHAR_WIDTH 8
#define SMALLCHAR_HEIGHT 16
#define BIGCHAR_WIDTH 16
#define BIGCHAR_HEIGHT 16
#define SLIDER_RANGE 10
#define K_ENTER 13
#define K_LEFTARROW 134
#define K_RIGHTARROW 135
#define K_KP_LEFTARROW 163
#define K_KP_RIGHTARROW 165
#define K_KP_ENTER 169
#define K_MOUSE1 178
#define K_JOY1 185
#define K_JOY2 186
#define K_JOY3 187
#define K_JOY4 188

typedef struct _tag_menuframework menuframework_s;
typedef struct menucommon_s {
  int type; const char *name; int id; int x,y,left,top,right,bottom;
  menuframework_s *parent; int menuPosition; unsigned flags;
  void (*callback)(void *,int); void (*statusbar)(void *); void (*ownerdraw)(void *);
} menucommon_s;
struct _tag_menuframework {
  int cursor,cursor_prev,nitems; void *items[MAX_MENUITEMS];
  void (*draw)(void); sfxHandle_t (*key)(int); qboolean wrapAround,fullscreen,showlogo;
};
typedef struct { menucommon_s generic; } menuaction_s;
typedef struct { menucommon_s generic; int curvalue; } menuradiobutton_s;
typedef struct { menucommon_s generic; float minvalue,maxvalue,curvalue,range; } menuslider_s;
typedef struct { menucommon_s generic; int oldvalue,curvalue,numitems,top; const char **itemnames; int width,height,columns,seperation; } menulist_s;
typedef struct { menucommon_s generic; char *focuspic,*errorpic; int shader,focusshader,width,height; float *focuscolor; } menubitmap_s;
typedef struct { menucommon_s generic; char *string; int style; float *color; } menutext_s;

static int menu_move_sound=2,menu_buzz_sound=4;
static struct { int cursorx,cursory; } uis;
static int callback_count,callback_event;
static void callback(void *self,int event){(void)self;callback_count++;callback_event=event;}

#include "ui_qmenu_under_test.inc"

static menucommon_s common(int type,const char *name,int x,int y,unsigned flags){
  menucommon_s c; memset(&c,0,sizeof(c));c.type=type;c.name=name;c.x=x;c.y=y;c.flags=flags;c.callback=callback;return c;
}

int main(void){
  int sound;
  menutext_s t;memset(&t,0,sizeof(t));t.generic=common(MTYPE_TEXT,"text",10,20,0);Text_Init(&t);printf("text|%u\n",t.generic.flags);
  memset(&t,0,sizeof(t));t.generic=common(MTYPE_BTEXT,"banner",10,20,0);BText_Init(&t);printf("btext|%u\n",t.generic.flags);

  menubitmap_s b;memset(&b,0,sizeof(b));b.generic=common(MTYPE_BITMAP,"pic",100,30,QMF_RIGHT_JUSTIFY);b.width=-20;b.height=-10;Bitmap_Init(&b);printf("bitmap|%d|%d|%d|%d|%d|%d\n",b.generic.left,b.generic.right,b.generic.top,b.generic.bottom,b.shader,b.focusshader);
  menuaction_s a;memset(&a,0,sizeof(a));a.generic=common(MTYPE_ACTION,"PLAY",100,50,0);Action_Init(&a);printf("action|%d|%d|%d|%d\n",a.generic.left,a.generic.right,a.generic.top,a.generic.bottom);
  menuradiobutton_s rb;memset(&rb,0,sizeof(rb));rb.generic=common(MTYPE_RADIOBUTTON,"Enabled",200,90,0);RadioButton_Init(&rb);printf("radio-init|%d|%d|%d|%d\n",rb.generic.left,rb.generic.right,rb.generic.top,rb.generic.bottom);
  callback_count=0;sound=RadioButton_Key(&rb,K_LEFTARROW);printf("radio-key|%d|%d|%d|%d\n",sound,rb.curvalue,callback_count,callback_event);
  rb.generic.flags=QMF_HASMOUSEFOCUS;sound=RadioButton_Key(&rb,K_MOUSE1);printf("radio-mouse|%d|%d\n",sound,rb.curvalue);

  menuslider_s s;memset(&s,0,sizeof(s));s.generic=common(MTYPE_SLIDER,"Volume",300,100,0);s.minvalue=0;s.maxvalue=10;s.curvalue=5;Slider_Init(&s);printf("slider-init|%d|%d|%d|%d\n",s.generic.left,s.generic.right,s.generic.top,s.generic.bottom);
  callback_count=0;sound=Slider_Key(&s,K_RIGHTARROW);printf("slider-right|%d|%.0f|%d\n",sound,s.curvalue,callback_count);s.curvalue=10;sound=Slider_Key(&s,K_RIGHTARROW);printf("slider-limit|%d|%.0f\n",sound,s.curvalue);uis.cursorx=316;s.curvalue=5;sound=Slider_Key(&s,K_MOUSE1);printf("slider-mouse|%d|%.0f\n",sound,s.curvalue);

  const char *names[]={"Easy","Nightmare",NULL};menulist_s spin;memset(&spin,0,sizeof(spin));spin.generic=common(MTYPE_SPINCONTROL,"Mode",200,120,0);spin.itemnames=names;SpinControl_Init(&spin);printf("spin-init|%d|%d|%d\n",spin.generic.left,spin.generic.right,spin.numitems);sound=SpinControl_Key(&spin,K_MOUSE1);printf("spin-key|%d|%d\n",sound,spin.curvalue);sound=SpinControl_Key(&spin,K_RIGHTARROW);printf("spin-limit|%d|%d\n",sound,spin.curvalue);

  const char *listnames[]={"A","B","C","D","E",NULL};menulist_s list;memset(&list,0,sizeof(list));list.generic=common(MTYPE_SCROLLLIST,"",100,150,0);list.width=8;list.height=3;list.itemnames=listnames;list.numitems=5;ScrollList_Init(&list);printf("scroll-init|%d|%d|%d|%d|%d|%d\n",list.generic.left,list.generic.right,list.generic.top,list.generic.bottom,list.columns,list.seperation);

  menuframework_s m;menucommon_s c0=common(MTYPE_ACTION,"A",0,0,0),c1=common(MTYPE_ACTION,"B",0,0,QMF_GRAYED),c2=common(MTYPE_ACTION,"C",0,0,QMF_MOUSEONLY),c3=common(MTYPE_ACTION,"D",0,0,0);memset(&m,0,sizeof(m));m.items[0]=&c0;m.items[1]=&c1;m.items[2]=&c2;m.items[3]=&c3;m.nitems=4;m.cursor=1;m.cursor_prev=0;m.wrapAround=1;Menu_AdjustCursor(&m,1);printf("adjust-next|%d\n",m.cursor);m.cursor=4;m.cursor_prev=3;Menu_AdjustCursor(&m,1);printf("adjust-wrap|%d\n",m.cursor);
  sound=Menu_ActivateItem(&m,&c0);printf("item|%d|%d\n",Menu_ItemAtCursor(&m)==&c0,sound);
  return 0;
}
