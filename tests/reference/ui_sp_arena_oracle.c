/* Focused host for the unchanged UI_SPArena_Start body. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
static float maxclients;static int tiers;static char events[1024];
static void append(const char *text){strcat(events,text);}
static float trap_Cvar_VariableValue(const char *name){append("get:");append(name);append("|");return maxclients;}
static void trap_Cvar_SetValue(const char *name,float value){char row[80];sprintf(row,"set:%s:%g|",name,value);append(row);if(!strcmp(name,"sv_maxclients"))maxclients=value;}
static int UI_GetNumSPTiers(void){append("tiers|");return tiers;}
#define EXEC_APPEND 2
#define ARENAS_PER_TIER 4
static void trap_Cmd_ExecuteText(int when,const char *text){char row[160];sprintf(row,"exec:%d:%s",when,text);append(row);}
static int Q_stricmp(const char *a,const char *b){while(*a&&*b){int x=tolower((unsigned char)*a++),y=tolower((unsigned char)*b++);if(x!=y)return x-y;}return (unsigned char)*a-(unsigned char)*b;}
static const char *Info_ValueForKey(const char *info,const char *key){static char value[2][128];static int slot;const char *p=info;char k[128];slot^=1;value[slot][0]=0;while(*p){int n=0;if(*p=='\\')p++;while(*p&&*p!='\\'&&n<127)k[n++]=*p++;k[n]=0;if(*p=='\\')p++;n=0;while(*p&&*p!='\\'&&n<127)value[slot][n++]=*p++;value[slot][n]=0;if(!Q_stricmp(k,key))return value[slot];}return "";}
static char va_buffer[256];static char *va(const char *format,const char *value){sprintf(va_buffer,format,value);return va_buffer;}
#include "ui_sparena_under_test.inc"
static void row(const char *name,float max,int count,const char *info){events[0]=0;maxclients=max;tiers=count;UI_SPArena_Start(info);printf("%s|%s\n",name,events);}
int main(void){row("ordinary",4,7,"\\num\\3\\map\\q3dm7");row("training",8,7,"\\num\\9\\special\\TrAiNiNg\\map\\q3dm0");row("final",12,6,"\\num\\9\\special\\FINAL\\map\\q3tourney6");row("fallback",8,1,"\\num\\garbage\\special\\bonus\\map\\");return 0;}
