#include <math.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_CLIENTS 64
#define MAX_QPATH 64
#define MAX_CHARACTERISTICS 80
#define CT_INTEGER 1
#define CT_FLOAT 2
#define CT_STRING 3
#define qfalse 0
#define qtrue 1
#define PRT_ERROR 3
#define PRT_FATAL 4
typedef union cvalue { int integer; float _float; char *string; } cvalue;
typedef struct bot_characteristic_s { char type; union cvalue value; } bot_characteristic_t;
typedef struct bot_character_s { char filename[MAX_QPATH]; float skill; bot_characteristic_t c[1]; } bot_character_t;
typedef struct { void (*Print)(int,const char *,...); } bot_import_t;
static bot_import_t botimport;
static bot_character_t *botcharacters[MAX_CLIENTS+1];
static int allocations,reload_characters;
static void print_stub(int level,const char *format,...) { (void)level;(void)format; }
static void Log_Write(const char *format,...) { (void)format; }
static void *GetMemory(size_t size) { void *p=malloc(size);if(p)allocations++;return p; }
static void *GetClearedMemory(size_t size) { void *p=calloc(1,size);if(p)allocations++;return p; }
static void FreeMemory(void *p) { if(p){allocations--;free(p);} }
static float LibVarGetValue(const char *name) { (void)name;return (float)reload_characters; }
#include "be_ai_char_complete_under_test.inc"

static bot_character_t *make_character(const char *name,float skill) {
 bot_character_t *c=(bot_character_t *)GetClearedMemory(sizeof(bot_character_t)+MAX_CHARACTERISTICS*sizeof(bot_characteristic_t));
 strcpy(c->filename,name);c->skill=skill;return c;
}
static char *copy_text(const char *text) { char *p=(char *)GetMemory(strlen(text)+1);strcpy(p,text);return p; }
int main(void) {
 char text[16]="unchanged";int h;
 botimport.Print=print_stub;botcharacters[1]=make_character("bots/test_c.c",1.0f);botcharacters[2]=make_character("bots/test_c.c",4.0f);
 botcharacters[1]->c[0].type=CT_FLOAT;botcharacters[1]->c[0].value._float=.2f;botcharacters[2]->c[0].type=CT_FLOAT;botcharacters[2]->c[0].value._float=.8f;
 botcharacters[1]->c[1].type=CT_INTEGER;botcharacters[1]->c[1].value.integer=10;botcharacters[2]->c[1].type=CT_INTEGER;botcharacters[2]->c[1].value.integer=40;
 botcharacters[1]->c[2].type=CT_STRING;botcharacters[1]->c[2].value.string=copy_text("low");botcharacters[2]->c[2].type=CT_STRING;botcharacters[2]->c[2].value.string=copy_text("high");
 botcharacters[2]->c[3].type=CT_FLOAT;botcharacters[2]->c[3].value._float=.75f;BotDefaultCharacteristics(botcharacters[1],botcharacters[2]);
 printf("default=%g\n",botcharacters[1]->c[3].value._float);printf("cache=%d,%d\n",BotFindCachedCharacter("bots/test_c.c",1.0f),BotFindCachedCharacter("bots/test_c.c",-1.0f));
 h=BotInterpolateCharacters(1,2,2.5f);printf("interp=%d,%g,%d,%s\n",h,Characteristic_Float(h,0),Characteristic_Integer(h,1),botcharacters[h]->c[2].value.string);
 printf("query=%g,%d\n",Characteristic_BFloat(h,0,0.0f,.4f),Characteristic_BInteger(h,1,20,30));
 printf("bounds=%d,%d,%g\n",CheckCharacteristicIndex(h,79),CheckCharacteristicIndex(h,80),Characteristic_BFloat(h,0,1.0f,0.0f));
 Characteristic_String(h,2,text,sizeof(text));printf("string=%s\n",text);
 reload_characters=0;BotFreeCharacter(h);printf("cached=%d\n",botcharacters[h]!=NULL);reload_characters=1;BotFreeCharacter(h);printf("freed=%d\n",botcharacters[h]==NULL);
 BotShutdownCharacters();printf("shutdown=%d,%d\n",botcharacters[1]==NULL&&botcharacters[2]==NULL,allocations);return 0;
}
