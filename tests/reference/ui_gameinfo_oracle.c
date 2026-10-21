#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <ctype.h>

typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define POOLSIZE (128*1024)
#define MAX_BOTS 1024
#define MAX_ARENAS 1024
#define MAX_TOKEN_CHARS 1024
#define MAX_INFO_STRING 1024
#define MAX_INFO_VALUE 1024
#define ARENAS_PER_TIER 4
#define AWARD_PERFECT 5
#define S_COLOR_RED "^1"

int ui_numBots;
char *ui_botInfos[MAX_BOTS];
int ui_numArenas;
char *ui_arenaInfos[MAX_ARENAS];
int ui_numSinglePlayerArenas;
int ui_numSpecialSinglePlayerArenas;
char memoryPool[POOLSIZE];
int allocPoint,outOfMemory;
struct { int demoversion; } uis;

static char cvarNames[32][32],cvarValues[32][1024];static int cvarCount;
static int findCvar(const char *name){for(int i=0;i<cvarCount;i++)if(!strcmp(cvarNames[i],name))return i;return -1;}
static void trap_Cvar_Set(const char *name,const char *value){int i=findCvar(name);if(i<0){i=cvarCount++;strcpy(cvarNames[i],name);}strcpy(cvarValues[i],value);}
static void trap_Cvar_VariableStringBuffer(const char *name,char *out,int size){int i=findCvar(name);snprintf(out,size,"%s",i<0?"":cvarValues[i]);}
static float trap_Cvar_VariableValue(const char *name){int i=findCvar(name);return i<0?0.0f:(float)atof(cvarValues[i]);}
static char vaBuffer[4096];static char *va(const char *fmt,...){va_list ap;va_start(ap,fmt);vsnprintf(vaBuffer,sizeof(vaBuffer),fmt,ap);va_end(ap);return vaBuffer;}
static void Com_sprintf(char *out,int size,const char *fmt,...){va_list ap;va_start(ap,fmt);vsnprintf(out,size,fmt,ap);va_end(ap);}
static void Com_Printf(const char *fmt,...){(void)fmt;}
static void trap_Print(const char *text){(void)text;}
static int Q_stricmp(const char *a,const char *b){return _stricmp(a,b);}
static void Q_strncpyz(char *out,const char *in,int size){if(size<=0)return;strncpy(out,in,size-1);out[size-1]=0;}

static const char *Info_ValueForKey(const char *text,const char *wanted){static char out[2][1024];static int slot;slot^=1;out[slot][0]=0;if(!text)return out[slot];const char *p=text;while(*p){if(*p=='\\')p++;const char *ks=p;while(*p&&*p!='\\')p++;size_t kn=(size_t)(p-ks);if(!*p)break;p++;const char *vs=p;while(*p&&*p!='\\')p++;size_t vn=(size_t)(p-vs);if(strlen(wanted)==kn&&!_strnicmp(ks,wanted,kn)){memcpy(out[slot],vs,vn);out[slot][vn]=0;return out[slot];}}return out[slot];}
static void Info_SetValueForKey(char *text,const char *key,const char *value){char old[1024],rebuilt[1024]="";strcpy(old,text);const char *p=old;while(*p){if(*p=='\\')p++;const char *ks=p;while(*p&&*p!='\\')p++;int kn=(int)(p-ks);if(!*p)break;p++;const char *vs=p;while(*p&&*p!='\\')p++;int vn=(int)(p-vs);if((int)strlen(key)!=kn||strncmp(ks,key,(size_t)kn)){strcat(rebuilt,"\\");strncat(rebuilt,ks,(size_t)kn);strcat(rebuilt,"\\");strncat(rebuilt,vs,(size_t)vn);}}if(*value){char result[1024];snprintf(result,sizeof(result),"\\%s\\%s%s",key,value,rebuilt);strcpy(text,result);}else strcpy(text,rebuilt);}

static char parseToken[1024];
static char *parseExt(char **cursor,int allowLines){char *p=*cursor;int crossed=0;while(1){while(*p&&(unsigned char)*p<=32){if(*p=='\n')crossed=1;p++;}if(!*p){*cursor=p;parseToken[0]=0;return parseToken;}if(crossed&&!allowLines){*cursor=p;parseToken[0]=0;return parseToken;}if(p[0]=='/'&&p[1]=='/'){while(*p&&*p!='\n')p++;continue;}if(p[0]=='/'&&p[1]=='*'){p+=2;while(*p&&!(p[0]=='*'&&p[1]=='/'))p++;if(*p)p+=2;continue;}break;}int n=0;if(*p=='"'){p++;while(*p&&*p!='"'&&n<1023)parseToken[n++]=*p++;if(*p=='"')p++;}else while(*p&&(unsigned char)*p>32&&n<1023)parseToken[n++]=*p++;parseToken[n]=0;*cursor=p;return parseToken;}
static char *COM_Parse(char **p){return parseExt(p,1);}static char *COM_ParseExt(char **p,int allow){return parseExt(p,allow);}

void *UI_Alloc(int);void UI_InitMemory(void);
const char *UI_GetArenaInfoByNumber(int);const char *UI_GetArenaInfoByMap(const char *);const char *UI_GetSpecialArenaInfo(const char *);
char *UI_GetBotInfoByNumber(int);char *UI_GetBotInfoByName(const char *);void UI_GetBestScore(int,int *,int *);int UI_GetNumSPTiers(void);qboolean UI_ShowTierVideo(int);
static void UI_LoadArenas(void){}static void UI_LoadBots(void){}static void UI_SPLevelMenu_ReInit(void){}

#include "ui_gameinfo_under_test.inc"

static void resetCvars(void){cvarCount=0;memset(cvarNames,0,sizeof(cvarNames));memset(cvarValues,0,sizeof(cvarValues));}
static void arenas(void){ui_numArenas=7;ui_numSinglePlayerArenas=4;ui_numSpecialSinglePlayerArenas=2;const char *v[]={"\\map\\a0\\num\\0\\type\\single","\\map\\a1\\num\\1\\type\\single","\\map\\a2\\num\\2\\type\\single","\\map\\a3\\num\\3\\type\\single","\\map\\train\\num\\4\\type\\single\\special\\training","\\map\\final\\num\\5\\type\\single\\special\\final","\\map\\duel\\num\\6\\type\\ffa"};for(int i=0;i<7;i++)ui_arenaInfos[i]=_strdup(v[i]);}
static void scoresAllOne(void){trap_Cvar_Set("g_spSkill","1");trap_Cvar_Set("g_spScores1","\\l0\\1\\l1\\1\\l2\\1\\l3\\1\\l4\\1");}

int main(void){
  UI_InitMemory();void *a=UI_Alloc(1),*b=UI_Alloc(33);printf("alloc|%td|%td|%d\n",(char*)a-memoryPool,(char*)b-memoryPool,allocPoint);allocPoint=POOLSIZE-16;int failed=UI_Alloc(32)==NULL;printf("oom|%d|%d\n",failed,outOfMemory);UI_InitMemory();
  char p0[64],p1[64],p2[64];arenas();ui_numBots=2;ui_botInfos[0]="\\name\\Sarge\\model\\sarge";ui_botInfos[1]="\\name\\Visor\\model\\visor";printf("counts|%d|%d|%d|%d\n",UI_GetNumArenas(),UI_GetNumSPArenas(),UI_GetNumSPTiers(),UI_GetNumBots());strcpy(p0,Info_ValueForKey(UI_GetArenaInfoByNumber(4),"map"));strcpy(p1,Info_ValueForKey(UI_GetArenaInfoByMap("DUEL"),"num"));strcpy(p2,Info_ValueForKey(UI_GetSpecialArenaInfo("FINAL"),"map"));char p3[64];strcpy(p3,Info_ValueForKey(UI_GetBotInfoByName("visor"),"model"));printf("lookup|%s|%s|%s|%s\n",p0,p1,p2,p3);
  resetCvars();trap_Cvar_Set("g_spScores1","\\l0\\3");trap_Cvar_Set("g_spScores2","\\l0\\2");trap_Cvar_Set("g_spScores3","\\l0\\2");int score,skill;UI_GetBestScore(0,&score,&skill);printf("best|%d|%d\n",score,skill);trap_Cvar_Set("g_spSkill","3");UI_SetBestScore(0,1);printf("setbest|%s\n",Info_ValueForKey(cvarValues[findCvar("g_spScores3")],"l0"));UI_SetBestScore(0,4);printf("worse|%s\n",Info_ValueForKey(cvarValues[findCvar("g_spScores3")],"l0"));
  trap_Cvar_Set("g_spAwards","\\a1\\7");UI_LogAwardData(1,3);printf("award|%d\n",UI_GetAwardLevel(1));int v0=UI_ShowTierVideo(1),v1=UI_ShowTierVideo(1),v2=UI_ShowTierVideo(0);printf("video|%d|%d|%d\n",v0,v1,v2);uis.demoversion=1;printf("canvideo|%d|%d\n",UI_CanShowTierVideo(1),UI_CanShowTierVideo(8));
  resetCvars();arenas();printf("current0|%d\n",UI_GetCurrentGame());scoresAllOne();printf("current1|%d\n",UI_GetCurrentGame());printf("tier|%d|%d|%d\n",UI_TierCompleted(3),UI_TierCompleted(4),UI_TierCompleted(5));
  resetCvars();arenas();UI_SPUnlock_f();printf("unlock|%s|%s\n",Info_ValueForKey(cvarValues[findCvar("g_spScores1")],"l5"),Info_ValueForKey(cvarValues[findCvar("g_spVideos")],"tier8"));UI_SPUnlockMedals_f();printf("medals|%d|%d\n",UI_GetAwardLevel(0),UI_GetAwardLevel(5));UI_NewGame();printf("new|%s|%s|%s\n",cvarValues[findCvar("g_spScores1")],cvarValues[findCvar("g_spAwards")],cvarValues[findCvar("g_spVideos")]);
  ui_numSinglePlayerArenas=4;ui_numSpecialSinglePlayerArenas=0;UI_InitGameinfo();printf("init|%d\n",uis.demoversion);return 0;
}
