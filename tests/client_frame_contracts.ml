import mq3.client.frame as frame
struct Context events state disconnects end struct
function mark(h,s) h.context.events=h.context.events+[s];return void end function
function menu(h,m) return mark(h,"menu:"+str(m)) end function
function stop(h) return mark(h,"stop") end function
function text(h,s) return mark(h,"text") end function
function graph(h,v,c) return mark(h,"graph:"+str(v)) end function
function info(h,f) mark(h,"info");return "\\name\\Ranger" end function
function reliable(h,s) return mark(h,"reliable:"+s) end function
function diagnostic(h,s) return mark(h,"print") end function
function disconnect(h,show) h.context.disconnects=h.context.disconnects+1;h.context.state.state=frame.CA_DISCONNECTED;return mark(h,"disconnect") end function
function send(h) return mark(h,"send") end function
function resend(h) return mark(h,"resend") end function
function cgame(h) return mark(h,"cgame") end function
function screen(h) return mark(h,"screen") end function
function sound(h) return mark(h,"sound") end function
function cinematic(h) return mark(h,"cinematic") end function
function console(h) return mark(h,"console") end function
function host(s)
 h=frame.services();h.context=Context([],s,0);h.menuFn=menu;h.stopSoundsFn=stop;h.commandTextFn=text;h.debugGraphFn=graph;h.infoStringFn=info;h.reliableFn=reliable;h.diagnosticFn=diagnostic;h.disconnectFn=disconnect;h.sendCmdFn=send;h.resendFn=resend;h.setCGameTimeFn=cgame;h.screenFn=screen;h.soundFn=sound;h.cinematicFn=cinematic;h.consoleFn=console;return h
end function
function active()
 s=frame.runtime();s.running=1;s.state=frame.CA_ACTIVE;s.timeScale=1.0;s.timeoutSeconds=30.0;return s
end function
function req(v,label) if not v then return error(7111,"client frame: "+label) end if;return 1 end function
function main(args)
 n=0
 d=frame.runtime();n=n+req(d.state==frame.CA_DISCONNECTED and d.timeScale==1.0 and d.timeoutSeconds==30.0,"runtime defaults")
 n=n+req(try(frame.run(void,1,frame.services())) is error and try(frame.run(d,1,void)) is error,"missing inputs")
 s=active();s.running=0;h=host(s);n=n+req(frame.run(s,16,h)=="not-running" and len(h.context.events)==0 and s.framecount==0,"running guard")
 s=active();s.state=frame.CA_DISCONNECTED;s.cdDialog=1;h=host(s);frame.run(s,16,h);n=n+req(s.cdDialog==0 and h.context.events[0]=="menu:3","cd menu and clear")
 n=n+req(h.context.events[1]=="send","cd menu suppresses main menu")
 s=active();s.state=frame.CA_DISCONNECTED;h=host(s);frame.run(s,16,h);n=n+req(h.context.events[0]=="stop" and h.context.events[1]=="menu:1","disconnected menu order")
 s=active();s.state=frame.CA_DISCONNECTED;s.keyCatchers=frame.KEYCATCH_UI;h=host(s);frame.run(s,16,h);n=n+req(h.context.events[0]=="send","ui catcher suppresses menu")
 s=active();s.state=frame.CA_DISCONNECTED;s.serverRunning=1;h=host(s);frame.run(s,16,h);n=n+req(h.context.events[0]=="send","local server suppresses menu")
 s=active();s.aviDemo=25;s.timeScale=0.5;h=host(s);frame.run(s,17,h);n=n+req(s.realFrametime==20 and s.frametime==20 and s.realtime==20,"avi fixed msec")
 n=n+req(h.context.events[0]=="text","active avi screenshot")
 s=active();s.aviDemo=2000;s.timeScale=0.25;h=host(s);frame.run(s,17,h);n=n+req(s.frametime==1,"avi zero clamp")
 s=active();s.aviDemo=25;h=host(s);frame.run(s,0,h);n=n+req(s.frametime==0 and len(h.context.events)==7,"zero msec bypasses avi")
 s=active();s.state=frame.CA_CONNECTED;s.aviDemo=25;s.forceAviDemo=1;h=host(s);frame.run(s,17,h);n=n+req(h.context.events[0]=="text","forced avi screenshot")
 s=active();s.realtime=100;s.timeGraph=1;h=host(s);frame.run(s,12,h);n=n+req(s.realtime==112 and h.context.events[0]=="graph:3","time and graph")
 s=active();s.state=frame.CA_CHALLENGING;s.modifiedFlags=frame.CVAR_USERINFO|16;h=host(s);n=n+req(frame.checkUserinfo(s,h) and s.modifiedFlags==16,"userinfo flag clear")
 n=n+req(h.context.events==["info","reliable:userinfo \"\\name\\Ranger\""],"userinfo payload/order")
 s=active();s.state=frame.CA_CHALLENGING-1;s.modifiedFlags=frame.CVAR_USERINFO;h=host(s);n=n+req(not frame.checkUserinfo(s,h) and s.modifiedFlags==frame.CVAR_USERINFO,"userinfo state guard")
 s=active();s.paused=1;s.modifiedFlags=frame.CVAR_USERINFO;h=host(s);n=n+req(not frame.checkUserinfo(s,h) and len(h.context.events)==0,"userinfo pause guard")
 s=active();s.modifiedFlags=16;h=host(s);n=n+req(not frame.checkUserinfo(s,h) and s.modifiedFlags==16,"userinfo unrelated flags")
 s=active();s.state=frame.CA_CONNECTED;s.realtime=30000;s.lastPacketTime=0;s.timeoutSeconds=30.0;s.timeoutCount=4;h=host(s);n=n+req(not frame.checkTimeout(s,h) and s.timeoutCount==0,"timeout strict boundary")
 s=active();s.state=frame.CA_CONNECTED;s.realtime=30001;s.lastPacketTime=0;s.timeoutSeconds=30.0;s.timeoutCount=4;h=host(s);n=n+req(not frame.checkTimeout(s,h) and s.timeoutCount==5,"timeout debugger grace")
 n=n+req(frame.checkTimeout(s,h) and h.context.disconnects==1 and s.state==frame.CA_DISCONNECTED,"sixth timeout disconnect")
 s=active();s.state=frame.CA_CONNECTED;s.realtime=40000;s.paused=1;s.serverPaused=0;s.timeoutCount=2;h=host(s);frame.checkTimeout(s,h);n=n+req(s.timeoutCount==3,"one-sided pause still times out")
 s=active();s.state=frame.CA_CONNECTED;s.realtime=40000;s.paused=1;s.serverPaused=1;s.timeoutCount=5;h=host(s);n=n+req(not frame.checkTimeout(s,h) and s.timeoutCount==0,"both paused suppress timeout")
 s=active();s.state=frame.CA_CINEMATIC;s.realtime=40000;s.timeoutCount=5;h=host(s);n=n+req(not frame.checkTimeout(s,h) and s.timeoutCount==0,"cinematic suppress timeout")
 s=active();s.modifiedFlags=frame.CVAR_USERINFO;s.timeGraph=1;h=host(s);frame.run(s,20,h);n=n+req(h.context.events==["graph:5","info","reliable:userinfo \"\\name\\Ranger\"","send","resend","cgame","screen","sound","cinematic","console"],"full callback order")
 n=n+req(s.framecount==1 and s.realFrametime==20,"frame counter and real time")
 s=active();h=host(s);a=[];b=[];c=[];h.networkRuntime=a;h.protocolRuntime=b;h.demoRuntime=c;n=n+req(h.networkRuntime==a and h.protocolRuntime==b and h.demoRuntime==c,"runtime service bindings")
 print "PASS: "+str(n)+" client-frame contracts";return 0
end function
