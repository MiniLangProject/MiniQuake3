/* Deterministic host for unchanged ui_connect.c helpers and screen transitions. */
#include <stdio.h>
#include <stdarg.h>
#include <string.h>

#define qtrue 1
#define qfalse 0
#define MAX_INFO_VALUE 1024
#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 480
#define UI_LEFT 0
#define UI_CENTER 1
#define UI_SMALLFONT 2
#define UI_BIGFONT 4
#define UI_DROPSHADOW 8
#define CS_SERVERINFO 0
#define CA_CONNECTING 3
#define CA_CHALLENGING 4
#define CA_CONNECTED 5
#define CA_LOADING 6
#define CA_PRIMED 7
#define K_ESCAPE 27
#define EXEC_APPEND 2

typedef int qboolean;
typedef int connstate_t;
typedef int menufield_s;
typedef float vec4_t[4];
typedef struct {
    int connState;
    int connectPacketCount;
    char servername[128];
    char updateInfoString[MAX_INFO_VALUE];
    char messageString[MAX_INFO_VALUE];
} uiClientState_t;
static struct { int realtime; int frametime; int menuBackShader; } uis;
static float white[4] = {1,1,1,1};
static float colorMenu[4] = {1,1,1,1};
#define color_white white
#define menu_text_color colorMenu
static connstate_t lastConnState;
static char lastLoadingText[MAX_INFO_VALUE];
static void UI_ReadableSize(char *buf, int bufsize, int value);
static void UI_PrintTime(char *buf, int bufsize, int time);

static int cvSize, cvCount, cvTime;
static char cvName[MAX_INFO_VALUE];
static uiClientState_t currentClient;
static char currentServerInfo[MAX_INFO_VALUE];
static int cacheCalls, backgroundCalls, disconnectCalls;
static char at16[256], at64[256], at128[256], at160[256], at192[256], at224[256], at448[256], wrapped[256];

static void copy(char *target, size_t size, const char *text) { snprintf(target, size, "%s", text ? text : ""); }
static char *va(const char *format, ...) {
    static char buffers[4][2048]; static int index;
    char *buffer = buffers[index++ & 3]; va_list args;
    va_start(args, format); vsnprintf(buffer, 2048, format, args); va_end(args); return buffer;
}
static void Com_sprintf(char *buffer, int size, const char *format, ...) {
    va_list args; va_start(args, format); vsnprintf(buffer, (size_t)size, format, args); va_end(args);
}
static int trap_Cvar_VariableValue(const char *name) {
    if (!strcmp(name,"cl_downloadSize")) return cvSize;
    if (!strcmp(name,"cl_downloadCount")) return cvCount;
    if (!strcmp(name,"cl_downloadTime")) return cvTime;
    return 0;
}
static void trap_Cvar_VariableStringBuffer(const char *name, char *buffer, int size) {
    copy(buffer, (size_t)size, !strcmp(name,"cl_downloadName") ? cvName : "");
}
static int UI_ProportionalStringWidth(const char *text) {
    if (!strcmp(text,"Downloading:")) return 231;
    if (!strcmp(text,"Estimated time left:")) return 328;
    if (!strcmp(text,"Transfer rate:")) return 244;
    return (int)strlen(text) * 12;
}
static float UI_ProportionalSizeScale(int style) { (void)style; return 0.75f; }
static void UI_DrawProportionalString(int x, int y, const char *text, int style, const float *color) {
    (void)style; (void)color;
    if (x == 8) return;
    if (y==16) copy(at16,sizeof(at16),text); else if (y==64) copy(at64,sizeof(at64),text);
    else if (y==128) copy(at128,sizeof(at128),text); else if (y==160) copy(at160,sizeof(at160),text);
    else if (y==192) copy(at192,sizeof(at192),text); else if (y==224) copy(at224,sizeof(at224),text);
    else if (y==448) copy(at448,sizeof(at448),text);
}
static void UI_DrawProportionalString_AutoWrapped(int x,int y,int width,int height,const char *text,int style,const float *color) {
    (void)x;(void)y;(void)width;(void)height;(void)style;(void)color;copy(wrapped,sizeof(wrapped),text);
}
static void Menu_Cache(void) { cacheCalls++; }
static void UI_SetColor(const float *color) { (void)color; }
static void UI_DrawHandlePic(int x,int y,int w,int h,int shader) { (void)x;(void)y;(void)w;(void)h;(void)shader;backgroundCalls++; }
static void trap_GetClientState(uiClientState_t *state) { *state=currentClient; }
static int trap_GetConfigString(int index,char *buffer,int size) { (void)index;copy(buffer,(size_t)size,currentServerInfo);return currentServerInfo[0]!=0; }
static const char *Info_ValueForKey(const char *value,const char *key) {
    static char result[256]; const char *start; const char *end; size_t size;
    result[0]=0;if (!value || !key) return result;
    start=strstr(value,!strcmp(key,"mapname")?"\\mapname\\":"\\motd\\");if (!start) return result;
    start += strlen(key)+2;end=strchr(start,'\\');if (!end) end=start+strlen(start);size=(size_t)(end-start);if(size>=sizeof(result))size=sizeof(result)-1;memcpy(result,start,size);result[size]=0;return result;
}
static void trap_Cmd_ExecuteText(int when,const char *text) { if (when==EXEC_APPEND && !strcmp(text,"disconnect\n")) disconnectCalls++; }

#include "ui_connect_under_test.inc"

static void clearDraw(void) {
    at16[0]=at64[0]=at128[0]=at160[0]=at192[0]=at224[0]=at448[0]=wrapped[0]=0;
    cacheCalls=backgroundCalls=0;
}
static void sizeRow(int value) { char out[64];UI_ReadableSize(out,sizeof(out),value);printf("size|%d|%s\n",value,out); }
static void timeRow(int value) { char out[64];UI_PrintTime(out,sizeof(out),value);printf("time|%d|%s\n",value,out); }
static void downloadRow(const char *label,int size,int count,int start,int now) {
    clearDraw();cvSize=size;cvCount=count;cvTime=start;uis.realtime=now;UI_DisplayDownloadInfo("pak0.pk3");
    printf("download|%s|%s|%s|%s|%s\n",label,at128,at160,at192,at224);
}
static void screenRow(const char *label,int state,int packets,int overlay,const char *download) {
    clearDraw();memset(&currentClient,0,sizeof(currentClient));currentClient.connState=state;currentClient.connectPacketCount=packets;
    copy(currentClient.servername,sizeof(currentClient.servername),"quake.example");copy(currentClient.updateInfoString,sizeof(currentClient.updateInfoString),"\\motd\\Welcome");copy(currentClient.messageString,sizeof(currentClient.messageString),"Server says wait");copy(currentServerInfo,sizeof(currentServerInfo),"\\mapname\\q3dm1");copy(cvName,sizeof(cvName),download);cvSize=8192;cvCount=4096;cvTime=1000;uis.realtime=3000;UI_DrawConnectScreen(overlay);
    printf("screen|%s|%d|%d|%s|%s|%s|%s|%s|%s\n",label,cacheCalls,backgroundCalls,at16,at64,at448,wrapped,at128,at160);
}
int main(void) {
    sizeRow(1024);sizeRow(1025);sizeRow(1048576);sizeRow(1572864);sizeRow(1073741824);sizeRow(1610612736);
    timeRow(60000);timeRow(61000);timeRow(3600000);timeRow(3661000);
    downloadRow("estimate",8192,2048,1000,3000);downloadRow("rate",8192,4096,1000,3000);downloadRow("unknown",0,8192,1000,3000);
    screenRow("connecting",CA_CONNECTING,4,0,"");screenRow("challenging",CA_CHALLENGING,2,1,"");screenRow("connected",CA_CONNECTED,0,1,"");screenRow("download",CA_CONNECTED,0,1,"pak0.pk3");screenRow("loading",CA_LOADING,0,1,"");
    disconnectCalls=0;UI_KeyConnect(13);printf("key|enter|%d\n",disconnectCalls);UI_KeyConnect(K_ESCAPE);printf("key|escape|%d\n",disconnectCalls);return 0;
}
