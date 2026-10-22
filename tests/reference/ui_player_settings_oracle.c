#include <stdarg.h>
#include <stdio.h>
#include <string.h>
typedef int qboolean; typedef int sfxHandle_t; typedef float vec3_t[3];
#define qfalse 0
#define YAW 1
#define PITCH 0
#define ROLL 2
#define LEGS_IDLE 22
#define TORSO_STAND 11
#define WP_MACHINEGUN 2
#define QM_ACTIVATED 3
#define K_MOUSE2 179
#define K_ESCAPE 27
#define ID_HANDICAP 11
#define ID_BACK 13
#define ID_MODEL 14
#define MAX_QPATH 64
typedef struct { int id; } menucommon_s;
typedef struct { char buffer[256]; int cursor,scroll,widthInChars,maxchars; } mfield_t;
typedef struct { menucommon_s generic; mfield_t field; } menufield_s;
typedef struct { menucommon_s generic; int curvalue; } menulist_s;
typedef struct { int dummy; } playerInfo_t;
typedef struct { int dummy; } menuframework_s;
typedef struct { menuframework_s menu; menufield_s name; menulist_s handicap,effects; playerInfo_t playerinfo; char playerModel[MAX_QPATH]; } playersettings_t;
static playersettings_t s_playersettings;
static int gamecodetoui[]={4,2,3,0,5,1,6};
static int uitogamecode[]={4,6,2,3,1,5,7};
static vec3_t vec3_origin={0,0,0};
static const char *g_name="^1Ranger",*g_model="sarge/default"; static float g_color=1,g_handicap=100;static char writes[16][128];static int nwrites,model_menu,popped;
static const char *UI_Cvar_VariableString(const char *name){return strcmp(name,"name")==0?g_name:g_model;}
static float trap_Cvar_VariableValue(const char *name){return strcmp(name,"color1")==0?g_color:g_handicap;}
static void trap_Cvar_Set(const char *name,const char *value){snprintf(writes[nwrites++],128,"%s=%s",name,value);}
static void trap_Cvar_SetValue(const char *name,float value){snprintf(writes[nwrites++],128,"%s=%g",name,(double)value);}
static float Com_Clamp(float low,float high,float value){return value<low?low:(value>high?high:value);}
static void UI_PlayerInfo_SetModel(playerInfo_t *p,const char *m){(void)p;(void)m;}
static void UI_PlayerInfo_SetInfo(playerInfo_t *p,int l,int t,vec3_t a,vec3_t b,int w,qboolean c){(void)p;(void)l;(void)t;(void)a;(void)b;(void)w;(void)c;}
static void UI_PlayerModelMenu(void){model_menu=1;} static void UI_PopMenu(void){popped=1;}
static sfxHandle_t Menu_DefaultKey(menuframework_s *m,int key){(void)m;(void)key;return 3;}
static char va_buffer[64]; static char *va(const char *fmt,...){va_list ap;va_start(ap,fmt);vsnprintf(va_buffer,sizeof(va_buffer),fmt,ap);va_end(ap);return va_buffer;}
static void Q_strncpyz(char *d,const char *s,size_t n){if(n){snprintf(d,n,"%s",s);}}
static void PlayerSettings_SaveChanges(void);
#include "ui_player_settings_under_test.inc"
static void dump(const char *tag){printf("%s|%s|%d|%d|%s\n",tag,s_playersettings.name.field.buffer,s_playersettings.handicap.curvalue,s_playersettings.effects.curvalue,s_playersettings.playerModel);}
int main(void){
 memset(&s_playersettings,0,sizeof(s_playersettings));g_color=1;g_handicap=97;PlayerSettings_SetMenuItems();dump("set1");g_color=99;g_handicap=1;PlayerSettings_SetMenuItems();dump("set2");
 strcpy(s_playersettings.name.field.buffer,"Xaero");s_playersettings.handicap.curvalue=7;s_playersettings.effects.curvalue=5;nwrites=0;PlayerSettings_SaveChanges();for(int i=0;i<nwrites;i++)printf("save|%s\n",writes[i]);
 menucommon_s item={ID_HANDICAP};nwrites=0;PlayerSettings_MenuEvent(&item,QM_ACTIVATED);printf("event|%s\n",writes[0]);item.id=ID_MODEL;nwrites=0;PlayerSettings_MenuEvent(&item,QM_ACTIVATED);printf("model|%d|%d\n",model_menu,nwrites);item.id=ID_BACK;nwrites=0;PlayerSettings_MenuEvent(&item,QM_ACTIVATED);printf("back|%d|%d\n",popped,nwrites);nwrites=0;printf("key|%d|",PlayerSettings_MenuKey(K_ESCAPE));printf("%d\n",nwrites);return 0;
}
