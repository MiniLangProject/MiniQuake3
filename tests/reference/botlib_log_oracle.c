/* Deterministic host for the unchanged botlib l_log.c implementation. */
#include <stdio.h>
#include <stdarg.h>
#include <string.h>

#define QDECL
#define PRT_MESSAGE 2
#define PRT_ERROR 3
#define MAX_LOGFILENAMESIZE 1024

typedef struct logfile_s { char filename[MAX_LOGFILENAMESIZE]; FILE *fp; int numwrites; } logfile_t;
static logfile_t logfile;
static struct { float time; } botlibglobals;
static int logEnabled;
static int printCount;
static int lastSeverity;
static char lastPrint[2048];

static void BotPrint(int severity, const char *format, ...) {
    va_list args; lastSeverity=severity; printCount++;
    va_start(args,format);vsnprintf(lastPrint,sizeof(lastPrint),format,args);va_end(args);
}
static struct { void (*Print)(int,const char *,...); } botimport = { BotPrint };
static float LibVarValue(const char *name,const char *fallback) { (void)name;(void)fallback;return (float)logEnabled; }

void Log_Open(char *filename);
void Log_Close(void);
void Log_Shutdown(void);
void QDECL Log_Write(char *fmt,...);
void QDECL Log_WriteTimeStamped(char *fmt,...);
FILE *Log_FilePointer(void);
void Log_Flush(void);

#include "l_log_under_test.inc"

static void resetPrint(void) { printCount=0;lastSeverity=0;lastPrint[0]=0; }
static void escaped(const char *prefix,const unsigned char *data,size_t size) {
    size_t index;printf("%s",prefix);for(index=0;index<size;index++){if(data[index]=='\r')printf("<r>");else if(data[index]=='\n')printf("<n>");else putchar(data[index]);}putchar('\n');
}
int main(void) {
    const char *path="oracle_log.tmp";FILE *read;unsigned char data[4096];size_t size;
    remove(path);logEnabled=0;resetPrint();Log_Open((char*)path);printf("disabled|%d|%d\n",Log_FilePointer()!=0,printCount);
    logEnabled=1;resetPrint();Log_Open("");printf("empty|%d|%d|%d|%s",Log_FilePointer()!=0,printCount,lastSeverity,lastPrint);
    resetPrint();Log_Open((char*)path);printf("open|%d|%d|%d|%s",Log_FilePointer()!=0,printCount,lastSeverity,lastPrint);
    resetPrint();Log_Open("other.tmp");printf("duplicate|%d|%d|%d|%s",Log_FilePointer()!=0,printCount,lastSeverity,lastPrint);
    Log_Write("value=%4d name=%s float=%1.1f ptr=%p",7,"bot",1.26,(void*)0x1234);
    botlibglobals.time=3661.25f;Log_WriteTimeStamped(" step %d",9);Log_Flush();printf("pointer|%d\n",Log_FilePointer()!=0);
    resetPrint();Log_Close();printf("close|%d|%d|%d|%s",Log_FilePointer()!=0,printCount,lastSeverity,lastPrint);
    read=fopen(path,"rb");size=fread(data,1,sizeof(data),read);fclose(read);escaped("file|",data,size);remove(path);
    resetPrint();Log_Shutdown();printf("shutdown|%d|%d\n",Log_FilePointer()!=0,printCount);
    resetPrint();Log_Open("missing/path/log.txt");printf("failure|%d|%d|%d|%s",Log_FilePointer()!=0,printCount,lastSeverity,lastPrint);
    return 0;
}
