/* Host for unchanged SV_ClientCommand extracted at test time. */
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
typedef int qboolean;
#define qtrue 1
#define qfalse 0
#define MAX_STRING_CHARS 1024
enum {CS_FREE,CS_ZOMBIE,CS_CONNECTED,CS_PRIMED,CS_ACTIVE};
typedef struct { int integer; } cvar_t;
typedef struct { int sequence; const char *text; } msg_t;
typedef struct client_s {
 int state,lastClientCommand,nextReliableTime;
 char name[32],lastClientCommandString[MAX_STRING_CHARS];
} client_t;
typedef struct { int time; } serverStatic_t;
static serverStatic_t svs;
static cvar_t floodVar,clientRunningVar;
static cvar_t *sv_floodProtect=&floodVar,*com_cl_running=&clientRunningVar;
static char events[2048];
static void add(const char *format,...){char part[1200];va_list ap;va_start(ap,format);vsnprintf(part,sizeof(part),format,ap);va_end(ap);if(events[0])strcat(events,",");strcat(events,part);}
static int MSG_ReadLong(msg_t *m){return m->sequence;}
static const char *MSG_ReadString(msg_t *m){return m->text;}
static void Com_DPrintf(const char *format,...){(void)format;}
static void Com_Printf(const char *format,...){(void)format;}
static void Com_sprintf(char *dest,int size,const char *format,...){va_list ap;va_start(ap,format);vsnprintf(dest,size,format,ap);va_end(ap);}
static void SV_DropClient(client_t *cl,const char *reason){(void)cl;add("drop:%s",reason);}
static void SV_ExecuteClientCommand(client_t *cl,const char *text,qboolean clientOk){(void)cl;add("exec:%d:%s",clientOk,text);}
#include "server_client_command_under_test.inc"
static void run(const char *tag,int prior,int seq,const char *text,int state,int now,int next,int flood,int local){
 client_t cl;msg_t msg;memset(&cl,0,sizeof(cl));memset(events,0,sizeof(events));strcpy(cl.name,"Player");
 cl.lastClientCommand=prior;strcpy(cl.lastClientCommandString,"prior");cl.state=state;cl.nextReliableTime=next;
 msg.sequence=seq;msg.text=text;svs.time=now;floodVar.integer=flood;clientRunningVar.integer=local;
 int result=SV_ClientCommand(&cl,&msg);
 printf("%s|%d|%d|%d|%s|%s\n",tag,result,cl.lastClientCommand,cl.nextReliableTime,cl.lastClientCommandString,events);
}
int main(void){
 run("next",4,5,"say hi",CS_ACTIVE,100,0,1,0);
 run("duplicate",5,5,"ignored",CS_ACTIVE,100,50,1,0);
 run("old",5,3,"ignored",CS_ACTIVE,100,50,1,0);
 run("gap",4,7,"lost",CS_ACTIVE,100,50,1,0);
 run("flood",4,5,"say flood",CS_ACTIVE,100,500,1,0);
 run("boundary",4,5,"say edge",CS_ACTIVE,500,500,1,0);
 run("primed",4,5,"nextdl 1",CS_PRIMED,100,500,1,0);
 run("noflood",4,5,"say free",CS_ACTIVE,100,500,0,0);
 run("listen",4,5,"say local",CS_ACTIVE,100,500,1,1);
 run("zombie",4,5,"disconnect",CS_ZOMBIE,100,500,1,0);
 run("negative",-2,-1,"neg",CS_ACTIVE,-20,0,1,0);
 return 0;
}
