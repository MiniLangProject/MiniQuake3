import mq3.client.frame as frame
import mq3.compat.textnumbers as textnumbers
struct Context events state end struct
function mark(h,s) h.context.events=h.context.events+s+";";return void end function
function menu(h,m) return mark(h,"menu:"+str(m)) end function
function stop(h) return mark(h,"stop") end function
function text(h,s) if s=="screenshot silent\n" then return mark(h,"text:shot") end if;return mark(h,"text:other") end function
function graph(h,v,c) return mark(h,"graph:"+textnumbers.fixed2(v)) end function
function info(h,f) mark(h,"info:"+str(f));return "\\name\\Ranger" end function
function reliable(h,s) return mark(h,"reliable:"+s) end function
function diagnostic(h,s) return mark(h,"print") end function
function disconnect(h,show) value=0;if show then value=1 end if;mark(h,"disconnect:"+str(value));h.context.state.state=frame.CA_DISCONNECTED;return void end function
function send(h) return mark(h,"send") end function
function resend(h) return mark(h,"resend") end function
function cgame(h) return mark(h,"cgame") end function
function screen(h) return mark(h,"screen") end function
function sound(h) return mark(h,"sound") end function
function cinematic(h) return mark(h,"cinematic") end function
function console(h) return mark(h,"console") end function
function host(s)
 h=frame.services();h.context=Context("",s);h.menuFn=menu;h.stopSoundsFn=stop;h.commandTextFn=text;h.debugGraphFn=graph;h.infoStringFn=info;h.reliableFn=reliable;h.diagnosticFn=diagnostic;h.disconnectFn=disconnect;h.sendCmdFn=send;h.resendFn=resend;h.setCGameTimeFn=cgame;h.screenFn=screen;h.soundFn=sound;h.cinematicFn=cinematic;h.consoleFn=console;return h
end function
function runCase(tag,msec,running,state,cd,keys,server,avi,force,scale,graphOn,paused,svpaused,flags,realtime,last,count,timeout)
 s=frame.runtime();s.running=running;s.state=state;s.cdDialog=cd;s.keyCatchers=keys;s.serverRunning=server;s.aviDemo=avi;s.forceAviDemo=force;s.timeScale=scale;s.timeGraph=graphOn;s.paused=paused;s.serverPaused=svpaused;s.modifiedFlags=flags;s.realtime=realtime;s.lastPacketTime=last;s.timeoutCount=count;s.timeoutSeconds=timeout;s.framecount=7
 h=host(s);frame.run(s,msec,h)
 print tag+"|state="+str(s.state)+"|cd="+str(s.cdDialog)+"|flags="+str(s.modifiedFlags)+"|real="+str(s.realFrametime)+"|frame="+str(s.frametime)+"|now="+str(s.realtime)+"|count="+str(s.timeoutCount)+"|frames="+str(s.framecount)+"|"+h.context.events
 return void
end function
function main(args)
 runCase("stopped",16,0,frame.CA_ACTIVE,0,0,0,0,0,1.0,0,0,0,0,100,90,0,30.0)
 runCase("cd",16,1,frame.CA_DISCONNECTED,1,0,0,0,0,1.0,0,0,0,0,100,90,0,30.0)
 runCase("menu",16,1,frame.CA_DISCONNECTED,0,0,0,0,0,1.0,0,0,0,0,100,90,0,30.0)
 runCase("avi",17,1,frame.CA_ACTIVE,0,0,0,25,0,0.5,0,0,0,0,100,90,0,30.0)
 runCase("avi-clamp",17,1,frame.CA_CONNECTED,0,0,0,2000,1,0.25,1,0,0,0,100,90,0,30.0)
 runCase("userinfo",10,1,frame.CA_CONNECTED,0,frame.KEYCATCH_UI,0,0,0,1.0,0,0,0,frame.CVAR_USERINFO|16,100,90,0,30.0)
 runCase("early-info",10,1,frame.CA_DISCONNECTED,0,frame.KEYCATCH_UI,0,0,0,1.0,0,0,0,frame.CVAR_USERINFO,100,90,0,30.0)
 runCase("paused-info",10,1,frame.CA_CONNECTED,0,0,0,0,0,1.0,0,1,1,frame.CVAR_USERINFO,100,90,0,30.0)
 runCase("timeout-five",10,1,frame.CA_CONNECTED,0,0,0,0,0,1.0,0,0,0,0,40000,0,4,30.0)
 runCase("timeout-six",10,1,frame.CA_CONNECTED,0,0,0,0,0,1.0,0,0,0,0,40000,0,5,30.0)
 runCase("both-paused",10,1,frame.CA_CONNECTED,0,0,0,0,0,1.0,0,1,1,0,40000,0,5,30.0)
 runCase("cinematic",10,1,frame.CA_CINEMATIC,0,0,0,0,0,1.0,0,0,0,0,40000,0,5,30.0)
 runCase("full",20,1,frame.CA_ACTIVE,0,frame.KEYCATCH_UI,0,0,0,1.0,1,0,0,frame.CVAR_USERINFO,500,490,0,30.0)
 return 0
end function
