#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define MAX_BOTS 1024
#define MAX_ARENAS 1024
#define MAX_TOKEN_CHARS 1024
#define MAX_INFO_STRING 1024
#define MAX_ARENAS_TEXT 8192
#define MAX_BOTS_TEXT 8192
#define MAX_MAPS 128
#define FS_READ 0
#define CVAR_INIT 1
#define CVAR_ROM 2
#define GT_FFA 0
#define GT_TOURNAMENT 1
#define GT_CTF 4
#define GT_1FCTF 5
#define GT_OBELISK 6
#define GT_HARVESTER 7
#define S_COLOR_RED "^1"
#define S_COLOR_YELLOW "^3"

static int ui_numBots;
static char *ui_botInfos[MAX_BOTS];
static int ui_numArenas;
static char *ui_arenaInfos[MAX_ARENAS];
static char tokenBuffer[1024];
typedef int fileHandle_t;
typedef struct { char string[256]; } vmCvar_t;
typedef struct { int cinematic; char *mapLoadName,*mapName; int levelShot; char *imageName; int typeBits; } mapInfo_t;
static struct { int mapCount; mapInfo_t mapList[MAX_MAPS]; } uiInfo;
static const char *arenaFile="{ map a longname Alpha type \"ffa tourney\" } { map b longname Beta type \"ctf oneflag overload harvester\" } { map c longname Gamma } { map d longname Delta type FFA }";
static const char *botFile="{ name Sarge model sarge/default } { name Visor model visor/default }";
static const char *openData;

static char *va(const char *format,...) { static char out[2048]; va_list args; va_start(args,format); vsnprintf(out,sizeof(out),format,args); va_end(args); return out; }
static void Com_Printf(const char *format,...) { (void)format; }
static void trap_Print(const char *text) { (void)text; }
static int Q_stricmp(const char *a,const char *b) { return _stricmp(a,b); }
static void Q_strncpyz(char *out,const char *in,int size) { if(size<=0)return;strncpy_s(out,(size_t)size,in,_TRUNCATE); }
static void *UI_Alloc(int size) { return calloc(1,(size_t)size); }
static int trap_FS_FOpenFile(const char *name,fileHandle_t *handle,int mode) { (void)mode;openData=strstr(name,"bots")?botFile:arenaFile;*handle=1;return (int)strlen(openData); }
static void trap_FS_Read(void *out,int size,fileHandle_t handle) { (void)handle;memcpy(out,openData,(size_t)size); }
static void trap_FS_FCloseFile(fileHandle_t handle) { (void)handle; }
static int trap_FS_GetFileList(const char *path,const char *extension,char *out,int size) { (void)path;(void)extension;(void)out;(void)size;return 0; }
static void trap_Cvar_Register(vmCvar_t *value,const char *name,const char *initial,int flags) { (void)name;(void)flags;strcpy_s(value->string,sizeof(value->string),initial); }
static qboolean UI_OutOfMemory(void) { return qfalse; }
static char *String_Alloc(const char *text) { return _strdup(text); }
static void COM_Compress(char *text) { (void)text; }
static char *parseExt(char **cursor,int allowLines) {
    char *p=*cursor;int crossed=0;
    while(1) {
        while(*p && (unsigned char)*p<=32) { if(*p=='\n') crossed=1; p++; }
        if(!*p) { *cursor=p;tokenBuffer[0]=0;return tokenBuffer; }
        if(crossed && !allowLines) { *cursor=p;tokenBuffer[0]=0;return tokenBuffer; }
        if(p[0]=='/' && p[1]=='/') { while(*p && *p!='\n') p++; continue; }
        if(p[0]=='/' && p[1]=='*') { p+=2;while(*p && !(p[0]=='*'&&p[1]=='/'))p++;if(*p)p+=2;continue; }
        break;
    }
    int n=0;if(*p=='"') { p++;while(*p&&*p!='"'&&n<1023)tokenBuffer[n++]=*p++;if(*p=='"')p++; }
    else while(*p&&(unsigned char)*p>32&&n<1023)tokenBuffer[n++]=*p++;
    tokenBuffer[n]=0;*cursor=p;return tokenBuffer;
}
static char *COM_Parse(char **cursor) { return parseExt(cursor,1); }
static char *COM_ParseExt(char **cursor,int allowLines) { return parseExt(cursor,allowLines); }
static const char *Info_ValueForKey(const char *text,const char *wanted) {
    static char values[2][1024];static int slot;slot^=1;values[slot][0]=0;const char *p=text;
    while(p&&*p) { if(*p=='\\')p++;const char *ks=p;while(*p&&*p!='\\')p++;size_t kn=(size_t)(p-ks);if(!*p)break;p++;const char *vs=p;while(*p&&*p!='\\')p++;size_t vn=(size_t)(p-vs);if(strlen(wanted)==kn&&!_strnicmp(ks,wanted,kn)){memcpy(values[slot],vs,vn);values[slot][vn]=0;return values[slot];} }
    return values[slot];
}
static void Info_SetValueForKey(char *text,const char *key,const char *value) {
    char old[1024],rebuilt[1024]="",result[1024];strcpy_s(old,sizeof(old),text);const char *p=old;
    while(*p){if(*p=='\\')p++;const char *ks=p;while(*p&&*p!='\\')p++;int kn=(int)(p-ks);if(!*p)break;p++;const char *vs=p;while(*p&&*p!='\\')p++;int vn=(int)(p-vs);if((int)strlen(key)!=kn||strncmp(ks,key,(size_t)kn)){strcat_s(rebuilt,sizeof(rebuilt),"\\");strncat_s(rebuilt,sizeof(rebuilt),ks,(size_t)kn);strcat_s(rebuilt,sizeof(rebuilt),"\\");strncat_s(rebuilt,sizeof(rebuilt),vs,(size_t)vn);}}
    if(*value){sprintf_s(result,sizeof(result),"\\%s\\%s%s",key,value,rebuilt);strcpy_s(text,1024,result);}else strcpy_s(text,1024,rebuilt);
}

#include "ui_gameinfo_missionpack_under_test.inc"

int main(void) {
    char text[]="// comment\n{ name Sarge model sarge/default } { name Visor model visor/default }";char *parsed[4]={0};int count=UI_ParseInfos(text,4,parsed);
    printf("parse|%d|%s|%s\n",count,Info_ValueForKey(parsed[0],"name"),Info_ValueForKey(parsed[1],"model"));
    char limited[]="{ a 1 } { b 2 }";char *one[1]={0};printf("limit|%d\n",UI_ParseInfos(limited,1,one));
    ui_numBots=count;for(int i=0;i<count;i++)ui_botInfos[i]=parsed[i];
    printf("number|%s|%s\n",Info_ValueForKey(UI_GetBotInfoByNumber(1),"name"),UI_GetBotInfoByNumber(-1)==NULL?"null":"bad");
    printf("name|%s|%s\n",Info_ValueForKey(UI_GetBotInfoByName("sArGe"),"model"),UI_GetBotInfoByName("none")==NULL?"null":"bad");
    printf("count|%d|%s|%s\n",UI_GetNumBots(),UI_GetBotNameByNumber(0),UI_GetBotNameByNumber(99));
    UI_LoadArenas();printf("arenas|%d|%s|%d|%d|%d|%d|%s\n",uiInfo.mapCount,uiInfo.mapList[0].mapLoadName,uiInfo.mapList[0].typeBits,uiInfo.mapList[1].typeBits,uiInfo.mapList[2].typeBits,uiInfo.mapList[3].typeBits,uiInfo.mapList[0].imageName);
    UI_LoadBots();printf("bots|%d|%s|%s\n",UI_GetNumBots(),UI_GetBotNameByNumber(0),UI_GetBotNameByNumber(1));
    return 0;
}
