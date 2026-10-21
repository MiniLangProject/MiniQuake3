#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define QM_ACTIVATED 3
#define ID_ADD 100
#define ID_BACK 101
#define MAX_FAVORITESERVERS 16
typedef struct { int id; } menucommon_s;
static char current[128],favorites[16][128],setName[32],setValue[128];static int writes,pops;
static const char *va(const char *fmt,int value){static char out[32];snprintf(out,sizeof(out),fmt,value);return out;}
static void trap_Cvar_VariableStringBuffer(const char *name,char *out,int size){int index;if(!strcmp(name,"cl_currentServerAddress")){strncpy(out,current,size);out[size-1]=0;return;}index=atoi(name+6)-1;if(index>=0&&index<16){strncpy(out,favorites[index],size);out[size-1]=0;}else out[0]=0;}
static int Q_stricmp(const char *a,const char *b){return _stricmp(a,b);}
static void trap_Cvar_Set(const char *name,const char *value){int index=atoi(name+6)-1;writes++;strcpy(setName,name);strcpy(setValue,value);if(index>=0&&index<16)strcpy(favorites[index],value);}
static void UI_PopMenu(void){pops++;}
#include "ui_serverinfo_under_test.inc"
static void reset(void){memset(favorites,0,sizeof(favorites));current[0]=setName[0]=setValue[0]=0;writes=pops=0;}
int main(void){menucommon_s item;reset();Favorites_Add();printf("empty %d\n",writes);reset();strcpy(current,"127.0.0.1:27960");strcpy(favorites[0],"bad");Favorites_Add();printf("add %d %s %s\n",writes,setName,setValue);Favorites_Add();printf("duplicate %d\n",writes);reset();strcpy(current,"9.9.9.9:27960");for(int i=0;i<16;i++)snprintf(favorites[i],128,"%d.0.0.1",i+1);Favorites_Add();printf("full %d\n",writes);reset();strcpy(current,"8.8.8.8:27960");item.id=ID_ADD;ServerInfo_Event(&item,1);printf("ignore %d %d\n",writes,pops);ServerInfo_Event(&item,QM_ACTIVATED);printf("event_add %d %d %s\n",writes,pops,setName);item.id=ID_BACK;ServerInfo_Event(&item,QM_ACTIVATED);printf("event_back %d\n",pops);return 0;}
