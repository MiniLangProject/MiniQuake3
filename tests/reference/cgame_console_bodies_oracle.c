#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define MAX_TOKEN_CHARS 1024
#define YAW 1
typedef struct { int integer; float value; } vmCvar_t;
typedef struct { float vieworg[3]; } refdef_t;
typedef struct { int time,scoresRequestTime,showScores,numScores,scoreFadeTime; refdef_t refdef; float refdefViewAngles[3]; } cg_t;
cg_t cg; vmCvar_t cg_viewsize,cg_cameraOrbit;
static int target,attacker,developer;static char argv1[128],args_text[128];
static char console_text[1024],client_text[1024],cvar_text[1024],print_text[1024];
static void add(char *dst,size_t cap,const char *text){if(dst[0])strcat_s(dst,cap,";");strcat_s(dst,cap,text);}
char *va(const char *fmt,...){static char b[4][1024];static int n;char *p=b[n++&3];va_list a;va_start(a,fmt);vsprintf_s(p,1024,fmt,a);va_end(a);return p;}
void trap_Argv(int n,char *out,int size){(void)n;strncpy_s(out,(size_t)size,argv1,_TRUNCATE);}
void trap_Args(char *out,int size){strncpy_s(out,(size_t)size,args_text,_TRUNCATE);}
void trap_SendConsoleCommand(const char *s){add(console_text,sizeof(console_text),s);}
void trap_SendClientCommand(const char *s){add(client_text,sizeof(client_text),s);}
void trap_Cvar_Set(const char *n,const char *v){char b[256];sprintf_s(b,sizeof(b),"%s=%s",n,v);add(cvar_text,sizeof(cvar_text),b);}
void trap_Cvar_VariableStringBuffer(const char *n,char *out,int size){(void)n;sprintf_s(out,(size_t)size,"%d",developer);}
int CG_CrosshairPlayer(void){return target;} int CG_LastAttacker(void){return attacker;}
void CG_Printf(const char *fmt,...){char b[512];va_list a;va_start(a,fmt);vsprintf_s(b,sizeof(b),fmt,a);va_end(a);add(print_text,sizeof(print_text),b);}
#define Com_sprintf sprintf_s
#include "cgame_console_bodies_under_test.inc"
static void reset(void){console_text[0]=client_text[0]=cvar_text[0]=print_text[0]=0;}
static void row(const char *name){printf("%s|%s|%s|%s|%s|%d|%d|%d|%d\n",name,console_text,client_text,cvar_text,print_text,cg.showScores,cg.numScores,cg.scoresRequestTime,cg.scoreFadeTime);}
int main(void){
 reset();target=0;strcpy(argv1,"12345");CG_TargetCommand_f();row("tcmd0");
 reset();target=7;CG_TargetCommand_f();row("tcmd7");
 reset();cg_viewsize.integer=100;CG_SizeUp_f();CG_SizeDown_f();row("sizes");
 reset();cg.refdef.vieworg[0]=1.9f;cg.refdef.vieworg[1]=-2.9f;cg.refdef.vieworg[2]=3;cg.refdefViewAngles[YAW]=91.8f;CG_Viewpos_f();row("viewpos");
 reset();cg.time=2001;cg.scoresRequestTime=0;cg.showScores=0;cg.numScores=9;CG_ScoresDown_f();row("scores1");
 reset();cg.time=2100;CG_ScoresDown_f();CG_ScoresUp_f();row("scores2");
 reset();strcpy(args_text,"hello arena");target=3;CG_TellTarget_f();CG_VoiceTellTarget_f();row("telltarget");
 reset();attacker=5;CG_TellAttacker_f();CG_VoiceTellAttacker_f();row("tellattacker");
 reset();developer=0;cg_cameraOrbit.value=0;CG_StartOrbit_f();row("orbit0");
 reset();developer=1;cg_cameraOrbit.value=0;CG_StartOrbit_f();row("orbiton");
 reset();developer=1;cg_cameraOrbit.value=2;CG_StartOrbit_f();row("orbitoff");return 0;
}
