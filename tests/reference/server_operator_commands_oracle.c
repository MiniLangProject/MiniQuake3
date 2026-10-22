#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "server.h"

server_t sv;serverStatic_t svs;vm_t *gvm;int com_frameTime;
static cvar_t runningStore,maxStore,typeStore,mapStore,dedicatedStore;
cvar_t *com_sv_running=&runningStore,*sv_maxclients=&maxStore,*sv_gametype=&typeStore,*sv_mapname=&mapStore,*com_dedicated=&dedicatedStore;
static client_t clients[4];static playerState_t players[4];static char *av[16];static int ac;static char raw[256],events[8192],consoleText[8192],cvarGametype[16],cvarWarmup[16],cvarCheats[16],cvarServerId[16],cvarMap[64];
static void add(char *dest,const char *fmt,...){va_list ap;size_t used=strlen(dest);va_start(ap,fmt);vsnprintf(dest+used,8192-used,fmt,ap);va_end(ap);}
short ShortSwap(short value){return value;}
void QDECL Com_sprintf(char *dest,int size,const char *fmt,...){va_list ap;va_start(ap,fmt);vsnprintf(dest,size,fmt,ap);va_end(ap);if(size>0)dest[size-1]=0;}
int Q_stricmp(const char *a,const char *b){return _stricmp(a,b);}int Q_stricmpn(const char *a,const char *b,int n){return _strnicmp(a,b,n);}
void Q_strncpyz(char *dest,const char *src,int size){if(size>0){strncpy(dest,src,size-1);dest[size-1]=0;}}
char *Q_CleanStr(char *text){char *d=text,*s=text;while(*s){if(*s=='^'&&s[1]>='0'&&s[1]<='7'){s+=2;continue;}if((unsigned char)*s>32&&(unsigned char)*s<=126)*d++=*s;s++;}*d=0;return text;}
char *QDECL va(char *fmt,...){static char text[4096];va_list ap;va_start(ap,fmt);vsnprintf(text,sizeof(text),fmt,ap);va_end(ap);return text;}
void QDECL Com_Printf(const char *fmt,...){va_list ap;size_t used=strlen(consoleText);va_start(ap,fmt);vsnprintf(consoleText+used,sizeof(consoleText)-used,fmt,ap);va_end(ap);}
int Cmd_Argc(void){return ac;}char *Cmd_Argv(int n){return n>=0&&n<ac?av[n]:"";}char *Cmd_Args(void){return raw;}
int FS_ReadFile(const char *name,void **buffer){(void)buffer;return strstr(name,"missing")?-1:1;}
cvar_t *Cvar_Get(const char *name,const char *value,int flags){(void)name;(void)value;(void)flags;return &typeStore;}
void Cvar_SetValue(const char *name,float value){if(!strcmp(name,"g_gametype")){sprintf(cvarGametype,"%g",value);typeStore.integer=(int)value;}}
void Cvar_SetLatched(const char *name,const char *value){add(events,"latched:%s=%s;",name,value);}
void Cvar_Set(const char *name,const char *value){if(!strcmp(name,"sv_cheats"))strcpy(cvarCheats,value);else if(!strcmp(name,"sv_serverid"))strcpy(cvarServerId,value);add(events,"cvar:%s=%s;",name,value);}
float Cvar_VariableValue(const char *name){return !strcmp(name,"g_doWarmup")?atof(cvarWarmup):0;}
char *Cvar_VariableString(const char *name){return !strcmp(name,"mapname")?cvarMap:"";}
void SV_SpawnServer(char *map,qboolean killBots){add(events,"spawn:%s:%d;",map,killBots);strcpy(mapStore.string,map);}
void SV_SetConfigstring(int index,const char *value){add(events,"config:%d=%s;",index,value);}
void SV_RestartGameProgs(void){add(events,"restart;");}
intptr_t QDECL VM_Call(vm_t *vm,int callnum,...){(void)vm;add(events,"vm:%d;",callnum);return 0;}
void *VM_ExplicitArgPtr(vm_t *vm,intptr_t value){(void)vm;(void)value;return NULL;}
void SV_AddServerCommand(client_t *cl,const char *cmd){add(events,"clientcmd:%s:%s;",cl?cl->name:"all",cmd);}
void SV_DropClient(client_t *cl,const char *reason){add(events,"drop:%s:%s;",cl->name,reason);cl->state=CS_ZOMBIE;}
void SV_ClientEnterWorld(client_t *cl,usercmd_t *cmd){(void)cmd;add(events,"enter:%s;",cl->name);}
void QDECL SV_SendServerCommand(client_t *cl,const char *fmt,...){char text[1024];va_list ap;va_start(ap,fmt);vsnprintf(text,sizeof(text),fmt,ap);va_end(ap);add(events,"send:%s:%s;",cl?cl->name:"all",text);}
qboolean NET_StringToAdr(const char *s,netadr_t *a){(void)s;a->type=NA_IP;a->ip[0]=1;a->ip[1]=2;a->ip[2]=3;a->ip[3]=4;return qtrue;}
void QDECL NET_OutOfBandPrint(netsrc_t sock,netadr_t adr,const char *fmt,...){char text[256];va_list ap;(void)sock;(void)adr;va_start(ap,fmt);vsnprintf(text,sizeof(text),fmt,ap);va_end(ap);add(events,"oob:%s;",text);}
const char *NET_AdrToString(netadr_t a){static char text[64];sprintf(text,"%u.%u.%u.%u:%u",a.ip[0],a.ip[1],a.ip[2],a.ip[3],a.port);return text;}
playerState_t *SV_GameClientNum(int n){return &players[n];}
char *Cvar_InfoString(int bit){return bit==CVAR_SERVERINFO?"\\sv_hostname\\Arena":"\\sv_serverid\\1";}
void Info_Print(const char *text){add(events,"info:%s;",text);}
void SV_Shutdown(char *message){add(events,"shutdown:%s;",message);runningStore.integer=0;}
void Cmd_AddCommand(const char *name,xcommand_t fn){(void)fn;add(events,"add:%s;",name);}
void SV_SectorList_f(void){}

#include "sv_ccmds_under_test.inc"

static void args2(char *a,char *b){ac=2;av[0]=a;av[1]=b;raw[0]=0;}
static void reset(void){memset(&sv,0,sizeof(sv));memset(&svs,0,sizeof(svs));memset(clients,0,sizeof(clients));memset(players,0,sizeof(players));svs.clients=clients;runningStore.integer=1;maxStore.integer=4;typeStore.integer=0;mapStore.string=cvarMap;dedicatedStore.integer=1;strcpy(cvarMap,"q3dm1");cvarWarmup[0]=0;events[0]=consoleText[0]=cvarGametype[0]=cvarCheats[0]=cvarServerId[0]=0;svs.time=1000;sv.state=SS_GAME;com_frameTime=2000;}
int main(void){
  reset();svs.nextHeartbeatTime=123;SV_Heartbeat_f();printf("heart|%d\n",svs.nextHeartbeatTime);
  args2("map","q3dm1");SV_Map_f();printf("map|%s|%s\n",events,cvarCheats);
  events[0]=0;args2("devmap","q3dm2");SV_Map_f();printf("dev|%s|%s\n",events,cvarCheats);
  events[0]=0;args2("spmap","q3dm3");SV_Map_f();printf("sp|%s|%s|%d\n",events,cvarCheats,typeStore.integer);
  events[0]=0;ac=2;av[0]="say";av[1]="hello";strcpy(raw,"\"hello world\"");SV_ConSay_f();printf("say|%s\n",events);
  events[0]=0;args2("map_restart","3");SV_MapRestart_f();printf("restart|%d|%s\n",sv.restartTime,events);
  events[0]=0;strcpy(clients[1].name,"Player");clients[1].state=CS_ACTIVE;clients[1].netchan.remoteAddress.type=NA_IP;args2("clientkick","1");SV_KickNum_f();printf("kick|%d|%d|%s\n",clients[1].state,clients[1].lastPacketTime,events);
  events[0]=0;SV_AddOperatorCommands();printf("commands|%s\n",events);
  return 0;
}
