#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define qtrue 1
#define qfalse 0
#define QM_ACTIVATED 3
#define QMF_GRAYED 0x00000008
#define QMF_HIDDEN 0x00000020
#define QMF_INACTIVE 0x00000040
#define EXEC_APPEND 2
typedef int qboolean;

typedef struct { int flags; int id; } generic_t;
typedef struct { generic_t generic; int curvalue; } menulist_s;
typedef struct { generic_t generic; float curvalue; } menuslider_s;
typedef struct { generic_t generic; } menubitmap_s;
typedef struct {
  menulist_s list,mode,driver;
  menuslider_s tq;
  menulist_s fs,lighting,allow_extensions,texturebits,colordepth,geometry,filter;
  menubitmap_s apply;
} graphicsoptions_t;
typedef struct {
  int mode;
  qboolean fullscreen;
  int tq;
  int lighting;
  int colordepth;
  int texturebits;
  int geometry;
  int filter;
  int driver;
  qboolean extensions;
} InitialVideoOptions_s;

static InitialVideoOptions_s s_ivo;
static graphicsoptions_t s_graphicsoptions;
static InitialVideoOptions_s s_ivo_templates[] = {
  {4,qtrue,2,0,2,2,1,1,0,qtrue},
  {3,qtrue,2,0,0,0,1,0,0,qtrue},
  {2,qtrue,1,0,1,0,0,0,0,qtrue},
  {2,qtrue,1,1,1,0,0,0,0,qtrue},
  {3,qtrue,1,0,0,0,1,0,0,qtrue}
};
#define NUM_IVO_TEMPLATES (sizeof(s_ivo_templates)/sizeof(s_ivo_templates[0]))
static const char *s_drivers[]={"opengl32","3dfxvgl",0};

static double cv_mode,cv_fullscreen,cv_extensions,cv_picmip,cv_vertex,cv_texturebits,cv_lod,cv_subdivisions,cv_colorbits;
static const char *cv_texturemode="GL_LINEAR_MIPMAP_NEAREST";
static double trap_Cvar_VariableValue(const char *name) {
  if(!strcmp(name,"r_mode"))return cv_mode;
  if(!strcmp(name,"r_fullscreen"))return cv_fullscreen;
  if(!strcmp(name,"r_allowExtensions"))return cv_extensions;
  if(!strcmp(name,"r_picmip"))return cv_picmip;
  if(!strcmp(name,"r_vertexLight"))return cv_vertex;
  if(!strcmp(name,"r_texturebits"))return cv_texturebits;
  if(!strcmp(name,"r_lodBias"))return cv_lod;
  if(!strcmp(name,"r_subdivisions"))return cv_subdivisions;
  if(!strcmp(name,"r_colorbits"))return cv_colorbits;
  return 0;
}
static const char *UI_Cvar_VariableString(const char *name) { return !strcmp(name,"r_textureMode")?cv_texturemode:""; }
static int Q_stricmp(const char *a,const char *b) {
  while(*a&&*b){int x=tolower((unsigned char)*a++),y=tolower((unsigned char)*b++);if(x!=y)return x-y;}
  return (unsigned char)*a-(unsigned char)*b;
}
static void trap_Cvar_SetValue(const char *name,double value){printf("write|%s|%.15g\n",name,value);}
static void trap_Cvar_Set(const char *name,const char *value){printf("write|%s|%s\n",name,value);}
static void trap_Cmd_ExecuteText(int mode,const char *text){(void)mode;printf("command|%s",text);}

#include "ui_video_under_test.inc"

static void clear_graphics(void){memset(&s_graphicsoptions,0,sizeof(s_graphicsoptions));memset(&s_ivo,0,sizeof(s_ivo));}
static void print_state(const char *tag){
  printf("%s|%d|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",tag,
    s_graphicsoptions.mode.curvalue,s_graphicsoptions.fs.curvalue,(int)s_graphicsoptions.tq.curvalue,
    s_graphicsoptions.lighting.curvalue,s_graphicsoptions.colordepth.curvalue,s_graphicsoptions.texturebits.curvalue,
    s_graphicsoptions.geometry.curvalue,s_graphicsoptions.filter.curvalue,s_graphicsoptions.driver.curvalue,
    s_graphicsoptions.allow_extensions.curvalue);
}

int main(void){
  clear_graphics();
  cv_mode=-1;cv_fullscreen=0;cv_extensions=1;cv_picmip=5;cv_vertex=1;cv_texturebits=16;
  cv_lod=1;cv_subdivisions=20;cv_colorbits=32;cv_texturemode="GL_LINEAR_MIPMAP_NEAREST";
  GraphicsOptions_SetMenuItems();
  print_state("set");
  GraphicsOptions_GetInitialVideo();
  printf("initial|%d|%d|%d|%d\n",s_ivo.mode,s_ivo.fullscreen,s_ivo.tq,s_ivo.colordepth);

  s_graphicsoptions.driver.curvalue=1;s_graphicsoptions.mode.curvalue=0;
  s_graphicsoptions.allow_extensions.curvalue=0;s_graphicsoptions.texturebits.curvalue=0;
  GraphicsOptions_UpdateMenuItems();
  printf("update|%d|%d|%d|%d|%d|%d\n",s_graphicsoptions.mode.curvalue,s_graphicsoptions.fs.curvalue,
    s_graphicsoptions.colordepth.curvalue,s_graphicsoptions.texturebits.curvalue,
    !!(s_graphicsoptions.apply.generic.flags&(QMF_HIDDEN|QMF_INACTIVE)),s_graphicsoptions.list.curvalue);

  clear_graphics();
  s_graphicsoptions.mode.curvalue=4;s_graphicsoptions.fs.curvalue=1;s_graphicsoptions.tq.curvalue=2;
  s_graphicsoptions.colordepth.curvalue=2;s_graphicsoptions.texturebits.curvalue=1;
  s_graphicsoptions.geometry.curvalue=1;s_graphicsoptions.filter.curvalue=1;
  GraphicsOptions_CheckConfig();
  printf("template|%d\n",s_graphicsoptions.list.curvalue);
  s_graphicsoptions.tq.curvalue=1.6f;GraphicsOptions_TQEvent(0,QM_ACTIVATED);
  printf("tq|%d\n",(int)s_graphicsoptions.tq.curvalue);

  s_graphicsoptions.mode.curvalue=5;s_graphicsoptions.fs.curvalue=1;s_graphicsoptions.tq.curvalue=2;
  s_graphicsoptions.allow_extensions.curvalue=1;s_graphicsoptions.texturebits.curvalue=2;
  s_graphicsoptions.colordepth.curvalue=2;s_graphicsoptions.lighting.curvalue=1;
  s_graphicsoptions.geometry.curvalue=1;s_graphicsoptions.filter.curvalue=1;s_graphicsoptions.driver.curvalue=0;
  GraphicsOptions_ApplyChanges(0,QM_ACTIVATED);
  return 0;
}
