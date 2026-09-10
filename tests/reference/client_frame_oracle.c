/* Host for unchanged CL_CheckTimeout, CL_CheckUserinfo and CL_Frame. */
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
typedef int qboolean;
enum { qfalse=0,qtrue=1,CA_DISCONNECTED=1,CA_CHALLENGING=4,CA_CONNECTED=5,CA_ACTIVE=8,CA_CINEMATIC=9,
       KEYCATCH_UI=2,CVAR_USERINFO=2,UI_SET_ACTIVE_MENU=177,UIMENU_MAIN=1,UIMENU_NEED_CD=3,EXEC_NOW=0 };
typedef struct { int integer; float value; } cvar_t;
typedef struct { int state,keyCatchers,cddialog,framecount,frametime,realtime,realFrametime; } clientStatic_t;
typedef struct { int timeoutcount; } clientActive_t;
typedef struct { int lastPacketTime; } clientConnection_t;
static clientStatic_t cls; static clientActive_t cl; static clientConnection_t clc;
static cvar_t runningV,serverV,aviV,forceV,scaleV,graphV,pauseV,serverPauseV,timeoutV;
static cvar_t *com_cl_running=&runningV,*com_sv_running=&serverV,*cl_avidemo=&aviV,*cl_forceavidemo=&forceV;
static cvar_t *com_timescale=&scaleV,*cl_timegraph=&graphV,*cl_paused=&pauseV,*sv_paused=&serverPauseV,*cl_timeout=&timeoutV;
static int cvar_modifiedFlags; static void *uivm; static char events[2048]; static char vaBuf[512];
static void mark(const char *fmt,...){char b[512];va_list a;va_start(a,fmt);vsprintf(b,fmt,a);va_end(a);strcat(events,b);strcat(events,";");}
static int VM_Call(void *vm,int call,int menu){(void)vm;(void)call;mark("menu:%d",menu);return 0;}
static void S_StopAllSounds(void){mark("stop");}
static void Cbuf_ExecuteText(int when,const char *s){(void)when;mark("text:%s",strstr(s,"screenshot")?"shot":"other");}
static void SCR_DebugGraph(float v,int c){(void)c;mark("graph:%5.2f",v);}
static const char *Cvar_InfoString(int flags){mark("info:%d",flags);return "\\name\\Ranger";}
static char *va(const char *fmt,...){va_list a;va_start(a,fmt);vsprintf(vaBuf,fmt,a);va_end(a);return vaBuf;}
static void CL_AddReliableCommand(const char *s){mark("reliable:%s",s);}
static void Com_Printf(const char *fmt,...){(void)fmt;mark("print");}
static void CL_Disconnect(qboolean show){mark("disconnect:%d",show);cls.state=CA_DISCONNECTED;}
static void CL_SendCmd(void){mark("send");}
static void CL_CheckForResend(void){mark("resend");}
static void CL_SetCGameTime(void){mark("cgame");}
static void SCR_UpdateScreen(void){mark("screen");}
static void S_Update(void){mark("sound");}
static void SCR_RunCinematic(void){mark("cinematic");}
static void Con_RunConsole(void){mark("console");}
#include "client_frame_under_test.inc"

static void run(const char *tag,int msec,int running,int state,int cd,int keys,int server,int avi,int force,float scale,int graph,int paused,int svpaused,int flags,int realtime,int last,int timeoutCount,float timeout){
 memset(&cls,0,sizeof(cls));memset(&cl,0,sizeof(cl));memset(&clc,0,sizeof(clc));events[0]=0;
 runningV.integer=running;serverV.integer=server;aviV.integer=avi;forceV.integer=force;scaleV.value=scale;graphV.integer=graph;
 pauseV.integer=paused;serverPauseV.integer=svpaused;timeoutV.value=timeout;cvar_modifiedFlags=flags;
 cls.state=state;cls.cddialog=cd;cls.keyCatchers=keys;cls.realtime=realtime;cls.framecount=7;clc.lastPacketTime=last;cl.timeoutcount=timeoutCount;
 CL_Frame(msec);
 printf("%s|state=%d|cd=%d|flags=%d|real=%d|frame=%d|now=%d|count=%d|frames=%d|%s\n",tag,cls.state,cls.cddialog,cvar_modifiedFlags,cls.realFrametime,cls.frametime,cls.realtime,cl.timeoutcount,cls.framecount,events);
}
int main(void){
 run("stopped",16,0,CA_ACTIVE,0,0,0,0,0,1,0,0,0,0,100,90,0,30);
 run("cd",16,1,CA_DISCONNECTED,1,0,0,0,0,1,0,0,0,0,100,90,0,30);
 run("menu",16,1,CA_DISCONNECTED,0,0,0,0,0,1,0,0,0,0,100,90,0,30);
 run("avi",17,1,CA_ACTIVE,0,0,0,25,0,.5f,0,0,0,0,100,90,0,30);
 run("avi-clamp",17,1,CA_CONNECTED,0,0,0,2000,1,.25f,1,0,0,0,100,90,0,30);
 run("userinfo",10,1,CA_CONNECTED,0,KEYCATCH_UI,0,0,0,1,0,0,0,CVAR_USERINFO|16,100,90,0,30);
 run("early-info",10,1,CA_DISCONNECTED,0,KEYCATCH_UI,0,0,0,1,0,0,0,CVAR_USERINFO,100,90,0,30);
 run("paused-info",10,1,CA_CONNECTED,0,0,0,0,0,1,0,1,1,CVAR_USERINFO,100,90,0,30);
 run("timeout-five",10,1,CA_CONNECTED,0,0,0,0,0,1,0,0,0,0,40000,0,4,30);
 run("timeout-six",10,1,CA_CONNECTED,0,0,0,0,0,1,0,0,0,0,40000,0,5,30);
 run("both-paused",10,1,CA_CONNECTED,0,0,0,0,0,1,0,1,1,0,40000,0,5,30);
 run("cinematic",10,1,CA_CINEMATIC,0,0,0,0,0,1,0,0,0,0,40000,0,5,30);
 run("full",20,1,CA_ACTIVE,0,KEYCATCH_UI,0,0,0,1,1,0,0,CVAR_USERINFO,500,490,0,30);
 return 0;
}
