#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include "ui_local.h"

uiInfo_t uiInfo;
vmCvar_t ui_currentMap;
vec4_t colorBlack={0,0,0,1};
vec4_t colorWhite={1,1,1,1};

static int bits(float value){union {float f;int i;} cast;cast.f=value;return cast.i;}
void trap_Cmd_ExecuteText(int when,const char *text){printf("cmd|%d|%s",when,text);}
qhandle_t trap_R_RegisterShaderNoMip(const char *name){printf("shader|%s\n",name);return 77;}
void trap_R_DrawStretchPic(float x,float y,float w,float h,float s0,float t0,float s1,float t1,qhandle_t shader){printf("draw|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",bits(x),bits(y),bits(w),bits(h),bits(s0),bits(t0),bits(s1),bits(t1),shader);}
void trap_R_SetColor(const float *color){if(!color)printf("color|null\n");else printf("color|%d|%d|%d|%d\n",bits(color[0]),bits(color[1]),bits(color[2]),bits(color[3]));}
void trap_UpdateScreen(void){printf("update\n");}
void trap_Print(const char *text){(void)text;}
void trap_Error(const char *text){(void)text;}
void trap_Cvar_Set(const char *name,const char *value){(void)name;(void)value;}
float trap_Cvar_VariableValue(const char *name){(void)name;return 0;}
void trap_Cvar_VariableStringBuffer(const char *name,char *buffer,int size){(void)name;if(size)buffer[0]=0;}
int trap_Argc(void){return 0;}
void trap_Argv(int n,char *buffer,int size){(void)n;if(size)buffer[0]=0;}
int trap_FS_FOpenFile(const char *name,fileHandle_t *f,fsMode_t mode){(void)name;(void)f;(void)mode;return -1;}
void trap_FS_Read(void *buffer,int len,fileHandle_t f){(void)buffer;(void)len;(void)f;}
void trap_FS_Write(const void *buffer,int len,fileHandle_t f){(void)buffer;(void)len;(void)f;}
void trap_FS_FCloseFile(fileHandle_t f){(void)f;}
int trap_FS_GetFileList(const char *path,const char *ext,char *buffer,int size){(void)path;(void)ext;(void)buffer;(void)size;return 0;}
int trap_GetConfigString(int index,char *buffer,int size){(void)index;if(size)buffer[0]=0;return 0;}
void trap_R_RemapShader(const char *a,const char *b,const char *c){(void)a;(void)b;(void)c;}
void Display_CacheAll(void){}
void UI_Report(void){}
void UI_Load(void){}
void UI_ShowPostGame(qboolean high){(void)high;}
int Q_stricmp(const char *a,const char *b){return _stricmp(a,b);}
void Q_strncpyz(char *dest,const char *src,int size){if(size>0){strncpy(dest,src,size-1);dest[size-1]=0;}}
void QDECL Com_sprintf(char *dest,int size,const char *fmt,...){va_list ap;va_start(ap,fmt);_vsnprintf(dest,size,fmt,ap);va_end(ap);if(size>0)dest[size-1]=0;}
char *QDECL va(char *fmt,...){static char text[4096];va_list ap;va_start(ap,fmt);_vsnprintf(text,sizeof(text),fmt,ap);va_end(ap);return text;}
char *Info_ValueForKey(const char *info,const char *key){(void)info;(void)key;return "";}

int main(void){
  float x=10,y=20,w=30,h=40;
  uiInfo.uiDC.xscale=2.0f;uiInfo.uiDC.yscale=0.5f;uiInfo.uiDC.whiteShader=9;uiInfo.uiDC.cursorx=50;uiInfo.uiDC.cursory=70;
  printf("clamp|%d|%d|%d\n",bits(UI_ClampCvar(1,3,0)),bits(UI_ClampCvar(1,3,2)),bits(UI_ClampCvar(1,3,4)));
  UI_StartDemoLoop();UI_AdjustFrom640(&x,&y,&w,&h);printf("adjust|%d|%d|%d|%d\n",bits(x),bits(y),bits(w),bits(h));
  UI_DrawNamedPic(1,2,3,4,"gfx/2d/bigchars");UI_DrawHandlePic(1,2,-3,-4,5);UI_FillRect(1,2,3,4,colorBlack);UI_DrawSides(1,2,3,4);UI_DrawTopBottom(1,2,3,4);UI_DrawRect(1,2,3,4,colorWhite);UI_SetColor(colorBlack);UI_UpdateScreen();UI_DrawTextBox(2,3,4,5);
  printf("cursor|%d|%d|%d\n",UI_CursorInRect(50,70,0,0),UI_CursorInRect(0,0,50,70),UI_CursorInRect(51,70,10,10));
  return 0;
}
