/* Host for unchanged SV_Frame extracted from the pinned Baseq3 source. */
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
typedef struct { int integer; } cvar_t;
typedef struct { int timeResidual,restartTime; } server_t;
typedef struct { int time,nextSnapshotEntities,numSnapshotEntities; } serverStatic_t;
enum { CVAR_SERVERINFO=4,CVAR_SYSTEMINFO=8,CS_SERVERINFO=0,CS_SYSTEMINFO=1,GAME_RUN_FRAME=7 };
static server_t sv; static serverStatic_t svs;
static cvar_t killv,runv,fpsv,dedv,speedv;
static cvar_t *sv_killserver=&killv,*com_sv_running=&runv,*sv_fps=&fpsv,*com_dedicated=&dedv,*com_speeds=&speedv;
static int cvar_modifiedFlags,time_game,pauseResult,clockValues[2],clockIndex;
static void *gvm;
static char events[1024];
static void mark(const char *fmt,...){char b[128];va_list a;va_start(a,fmt);vsprintf(b,fmt,a);va_end(a);strcat(events,b);strcat(events,";");}
static void SV_Shutdown(const char *s){mark("shutdown:%s",strstr(s,"killed")?"killed":strstr(s,"numSnapshot")?"snapwrap":"timewrap");}
static void Cvar_Set(const char *n,const char *v){mark("cvar:%s=%s",n,v);if(!strcmp(n,"sv_killserver"))killv.integer=0;if(!strcmp(n,"sv_fps"))fpsv.integer=10;}
static int SV_CheckPaused(void){mark("pause");return pauseResult;}
static void SV_BotFrame(int t){mark("bot:%d",t);}
static void NET_Sleep(int t){mark("sleep:%d",t);}
static void Cbuf_AddText(const char *s){mark("cmd:%s",strstr(s,"map_restart")?"restart":"nextmap");}
static const char *Cvar_InfoString(int f){mark("info:%d",f);return "server";}
static const char *Cvar_InfoString_Big(int f){mark("biginfo:%d",f);return "system";}
static void SV_SetConfigstring(int i,const char *s){mark("config:%d=%s",i,s);}
static int Sys_Milliseconds(void){mark("millis");return clockValues[clockIndex++];}
static void SV_CalcPings(void){mark("pings");}
static int VM_Call(void *vm,int call,int t){(void)vm;(void)call;mark("game:%d",t);return 0;}
static void SV_CheckTimeouts(void){mark("timeouts");}
static void SV_SendClientMessages(void){mark("messages");}
static void SV_MasterHeartbeat(void){mark("heartbeat");}
#include "server_frame_under_test.inc"

static void run(const char *tag,int msec,int kill,int running,int paused,int fps,int dedicated,int speeds,int flags,int residual,int time,int restart,int next,int count,int c0,int c1){
 memset(&sv,0,sizeof(sv));memset(&svs,0,sizeof(svs));events[0]=0;clockIndex=0;time_game=-1;
 killv.integer=kill;runv.integer=running;pauseResult=paused;fpsv.integer=fps;dedv.integer=dedicated;speedv.integer=speeds;cvar_modifiedFlags=flags;
 sv.timeResidual=residual;sv.restartTime=restart;svs.time=time;svs.nextSnapshotEntities=next;svs.numSnapshotEntities=count;clockValues[0]=c0;clockValues[1]=c1;
 SV_Frame(msec);
 printf("%s|kill=%d|fps=%d|flags=%d|res=%d|time=%d|restart=%d|game=%d|%s\n",tag,killv.integer,fpsv.integer,cvar_modifiedFlags,sv.timeResidual,svs.time,sv.restartTime,time_game,events);
}
int main(void){
 run("kill",5,1,1,0,20,0,0,0,0,100,0,0,64,0,0);
 run("stopped",5,0,0,0,20,0,0,0,0,100,0,0,64,0,0);
 run("paused",5,0,1,1,20,0,0,0,0,100,0,0,64,0,0);
 run("listen-clamp",30,0,1,0,0,0,0,0,80,100,0,0,64,0,0);
 run("dedicated-sleep",10,0,1,0,20,1,0,0,5,100,0,0,64,0,0);
 run("time-wrap",1,0,1,0,20,0,0,0,0,1879048193,0,0,64,0,0);
 run("snapshot-wrap",1,0,1,0,20,0,0,0,0,100,0,2147483582,64,0,0);
 run("restart",1,0,1,0,20,0,0,0,0,100,100,0,64,0,0);
 run("full",125,0,1,0,20,1,1,12,0,100,0,7,64,500,537);
 return 0;
}
