// SPDX-License-Identifier: GPL-2.0-or-later
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#define MAX_CONFIGSTRINGS 1024
#define MAX_CLIENTS 64
#define MAX_INFO_STRING 1024
#define MAX_NAME_LENGTH 32
#define MAX_STRING_CHARS 1024
#define MAX_QPATH 64
#define PACKET_BACKUP 32
#define CS_SERVERINFO 0
#define CS_CONNECTED 2
#define CS_PRIMED 3
#define SS_GAME 2
#define SVF_NOSERVERINFO 1
#define ERR_DROP 1
#define ERR_FATAL 2
#define qfalse 0
#define qtrue 1
#define h_high 0
typedef int qboolean; typedef int fileHandle_t;
typedef struct { int number,eType,modelindex; } entityState_t;
typedef struct { qboolean linked; int svFlags; } entityShared_t;
typedef struct { entityState_t s; entityShared_t r; } sharedEntity_t;
typedef struct { entityState_t baseline; } svEntity_t;
typedef struct { int integer,modified; } cvar_t;
typedef struct { int type; } netadr_t; typedef struct { netadr_t remoteAddress; } netchan_t;
typedef struct client_s { int state,id; char userinfo[MAX_INFO_STRING],name[MAX_NAME_LENGTH]; sharedEntity_t *gentity; netchan_t netchan; char commands[12][1100]; int commandCount; } client_t;
typedef struct { char *configstrings[MAX_CONFIGSTRINGS]; int state,restarting,num_entities; svEntity_t svEntities[MAX_CONFIGSTRINGS]; } server_t;
typedef struct { client_t *clients; int initialized,numSnapshotEntities; entityState_t *snapshotEntities; int nextSnapshotEntities,snapFlagServerBit,time; } serverStatic_t;
server_t sv; serverStatic_t svs; cvar_t maxvar={3,0},dedicated={0,0}; int pendingMax=-1; cvar_t *sv_maxclients=&maxvar,*com_dedicated=&dedicated; sharedEntity_t entities[MAX_CONFIGSTRINGS];
void Com_Error(int code,const char *fmt,...){ fprintf(stderr,"unexpected Com_Error\n"); exit(3); }
void Z_Free(void *p){ free(p); } void *Z_Malloc(size_t n){ return calloc(1,n); }
char *CopyString(const char *s){ size_t n=strlen(s)+1;char *p=(char*)malloc(n);memcpy(p,s,n);return p; }
void Q_strncpyz(char *d,const char *s,int n){ if(n<=0)return;strncpy(d,s,n-1);d[n-1]=0; }
char *Info_ValueForKey(const char *s,const char *key){ static char out[1024];const char *p=s;out[0]=0;while(*p){if(*p=='\\')p++;const char *k=p;while(*p&&*p!='\\')p++;size_t kn=p-k;if(*p)p++;const char *v=p;while(*p&&*p!='\\')p++;if(strlen(key)==kn&&!strncmp(k,key,kn)){size_t vn=p-v;if(vn>1023)vn=1023;memcpy(out,v,vn);out[vn]=0;return out;}}return out; }
void SV_SendServerCommand(client_t *cl,const char *fmt,...){va_list ap;va_start(ap,fmt);vsnprintf(cl->commands[cl->commandCount++],1100,fmt,ap);va_end(ap);}
sharedEntity_t *SV_GentityNum(int n){return &entities[n];}
cvar_t *Cvar_Get(const char *n,const char *v,int f){if(pendingMax>=0){maxvar.integer=pendingMax;pendingMax=-1;}return &maxvar;} char vaBuf[64];char *va(const char *fmt,...){va_list ap;va_start(ap,fmt);vsnprintf(vaBuf,sizeof(vaBuf),fmt,ap);va_end(ap);return vaBuf;}
void Cvar_Set(const char *name,const char *v){if(!strcmp(name,"sv_maxclients"))maxvar.integer=atoi(v);}
void *Hunk_AllocateTempMemory(size_t n){return calloc(1,n);}void Hunk_FreeTempMemory(void *p){free(p);}void *Hunk_Alloc(size_t n,int pref){return calloc(1,n);}
#define Com_Memset memset
int openResult=0,closeCount=0;int FS_FOpenFileRead(const char *n,fileHandle_t *f,qboolean u){*f=openResult;return 0;}void FS_FCloseFile(fileHandle_t f){closeCount++;}
int Com_sprintf(char *d,int n,const char *fmt,...){va_list ap;va_start(ap,fmt);int r=vsnprintf(d,n,fmt,ap);va_end(ap);return r;}

#include "sv_init_under_test.inc"

static void reset(void){int i;for(i=0;i<MAX_CONFIGSTRINGS;i++){if(sv.configstrings[i])free(sv.configstrings[i]);}free(svs.clients);memset(&sv,0,sizeof(sv));memset(&svs,0,sizeof(svs));memset(entities,0,sizeof(entities));maxvar.integer=3;maxvar.modified=0;pendingMax=-1;dedicated.integer=0;openResult=0;closeCount=0;for(i=0;i<MAX_CONFIGSTRINGS;i++)sv.configstrings[i]=CopyString("");}
int main(void){char buf[32];reset();svs.clients=calloc(3,sizeof(client_t));sv.state=SS_GAME;svs.clients[0].state=CS_PRIMED;svs.clients[1].state=CS_PRIMED;svs.clients[1].gentity=&entities[1];entities[1].r.svFlags=SVF_NOSERVERINFO;
 SV_SetConfigstring(4,"warmup");SV_SetConfigstring(4,"warmup");SV_SetConfigstring(0,"server");printf("config|%s|%d|%d\n",sv.configstrings[4],svs.clients[0].commandCount,svs.clients[1].commandCount);
 {char longv[2000];memset(longv,'x',1999);longv[1999]=0;SV_SetConfigstring(5,longv);printf("chunks|%d|%.4s|%.4s|%.4s|%zu\n",svs.clients[0].commandCount,svs.clients[0].commands[2],svs.clients[0].commands[3],svs.clients[0].commands[4],strlen(svs.clients[0].commands[2]));}
 SV_GetConfigstring(4,buf,5);SV_SetUserinfo(0,"\\name\\ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789\\rate\\25000");printf("get|%s|%s|%zu\n",buf,svs.clients[0].name,strlen(svs.clients[0].name));SV_GetUserinfo(0,buf,8);printf("userinfo|%s\n",buf);
 sv.num_entities=4;entities[1].r.linked=1;entities[1].s.eType=7;entities[3].r.linked=1;entities[3].s.modelindex=9;SV_CreateBaseline();entities[1].s.eType=8;printf("base|%d|%d|%d|%d\n",sv.svEntities[1].baseline.number,sv.svEntities[1].baseline.eType,sv.svEntities[3].baseline.number,sv.svEntities[3].baseline.modelindex);
 reset();maxvar.integer=3;SV_Startup();printf("startup|%d|%d|%d\n",svs.initialized,maxvar.integer,svs.numSnapshotEntities);svs.clients[2].state=CS_CONNECTED;svs.clients[2].id=77;pendingMax=1;maxvar.modified=1;SV_ChangeMaxClients();printf("floor|%d|%d\n",maxvar.integer,svs.clients[2].id);svs.clients[2].state=0;pendingMax=6;maxvar.modified=1;SV_ChangeMaxClients();printf("grow|%d|%d\n",maxvar.integer,svs.numSnapshotEntities);
 sv.configstrings[9]=CopyString("x");sv.state=SS_GAME;SV_ClearServer();printf("clear|%d|%p\n",sv.state,(void*)sv.configstrings[9]);openResult=7;SV_TouchCGame();printf("touch|%d\n",closeCount);return 0;}
