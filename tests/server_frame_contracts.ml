import mq3.server.frame as frame
import mq3.server.pause as pause
import mq3.server.client_pings as pings
import mq3.server.timeouts as timeouts
import mq3.server.snapshot_schedule as snapshots
struct Context events clocks clockIndex drops snapshots end struct
function mark(h,s) h.context.events=h.context.events+[s];return void end function
function shutdown(h,s) return mark(h,"shutdown") end function
function cvar(h,n,v) return mark(h,"cvar:"+n+"="+v) end function
function pauseSeen(h) return mark(h,"pause") end function
function pingsSeen(h) return mark(h,"pings") end function
function timeoutSeen(h) return mark(h,"timeouts") end function
function messagesSeen(h) return mark(h,"messages") end function
function bot(h,t) return mark(h,"bot:"+str(t)) end function
function sleep(h,t) return mark(h,"sleep:"+str(t)) end function
function command(h,s) return mark(h,"command") end function
function info(h,f,big) mark(h,"info:"+str(f));if big then return "big" end if;return "small" end function
function config(h,i,s) return mark(h,"config:"+str(i)+"="+s) end function
function millis(h) mark(h,"millis");v=h.context.clocks[h.context.clockIndex];h.context.clockIndex=h.context.clockIndex+1;return v end function
function game(h,t) return mark(h,"game:"+str(t)) end function
function heartbeat(h) return mark(h,"heartbeat") end function
function drop(th,c,reason) th.context.drops=th.context.drops+1;return void end function
function snap(sh,c) sh.context.snapshots=sh.context.snapshots+1;mark(sh,"snapshot");return void end function
function fragment(sh,c) return mark(sh,"fragment") end function
function host()
 h=frame.services();h.context=Context([], [100,137],0,0,0);h.shutdownFn=shutdown;h.cvarSetFn=cvar;h.pauseObservedFn=pauseSeen;h.pingsObservedFn=pingsSeen;h.timeoutObservedFn=timeoutSeen;h.messagesObservedFn=messagesSeen;h.botFrameFn=bot;h.sleepFn=sleep;h.commandFn=command;h.infoStringFn=info;h.setConfigstringFn=config;h.millisecondsFn=millis;h.gameFrameFn=game;h.heartbeatFn=heartbeat
 h.timeoutServices=timeouts.services();h.timeoutServices.context=h.context;h.timeoutServices.dropFn=drop
 h.snapshotServices=snapshots.services(snap,fragment,h.context);return h
end function
function state()
 s=frame.runtime();s.running=1;s.fps=20;s.pauseClients=[pause.client(pause.CS_ACTIVE,2),pause.client(pause.CS_ACTIVE,2)];s.pingClients=[];s.playerStates=[];s.timeoutState=timeouts.runtime([]);s.snapshotClients=[];return s
end function
function req(v,label) if not v then return error(499,"server frame: "+label) end if;return 1 end function
function main(args)
 n=0;s=state();h=host();s.killServer=1;r=frame.run(s,5,h);n=n+req(r=="killserver" and s.killServer==0,"kill result/state");n=n+req(h.context.events==["shutdown","cvar:sv_killserver=0"],"kill order")
 s=state();s.running=0;h=host();n=n+req(frame.run(s,5,h)=="not-running" and len(h.context.events)==0,"not running early return")
 s=state();s.clPaused=1;s.pauseClients=[pause.client(pause.CS_ACTIVE,2)];h=host();n=n+req(frame.run(s,5,h)=="paused" and s.svPaused==1,"pause state");n=n+req(h.context.events==["pause","cvar:sv_paused=1"],"pause order/cvar")
 s=state();s.fps=0;s.timeResidual=80;h=host();frame.run(s,30,h);n=n+req(s.fps==10 and s.time==100 and s.timeResidual==10,"fps clamp and frame msec");n=n+req(h.context.events[1]=="cvar:sv_fps=10","fps cvar after pause")
 s=state();s.dedicated=1;s.timeResidual=5;h=host();n=n+req(frame.run(s,10,h)=="sleep" and s.timeResidual==15,"dedicated residual sleep");n=n+req(h.context.events==["pause","sleep:35"],"dedicated sleep order")
 s=state();s.time=1879048193;h=host();n=n+req(frame.run(s,0,h)=="time-wrap" and h.context.events==["pause","bot:1879048193","shutdown","command"],"time wrap order")
 s=state();s.time=1879048192;h=host();n=n+req(frame.run(s,0,h)=="frame","time wrap strict boundary")
 s=state();s.nextSnapshotEntities=2147483582;s.numSnapshotEntities=64;h=host();n=n+req(frame.run(s,0,h)=="snapshot-wrap","snapshot wrap equality")
 s=state();s.nextSnapshotEntities=2147483581;s.numSnapshotEntities=64;h=host();n=n+req(frame.run(s,0,h)=="frame","snapshot wrap below boundary")
 s=state();s.time=100;s.restartTime=100;h=host();n=n+req(frame.run(s,0,h)=="restart" and s.restartTime==0,"restart equality/reset")
 s=state();s.time=99;s.restartTime=100;h=host();n=n+req(frame.run(s,0,h)=="frame" and s.restartTime==100,"restart below boundary")
 s=state();s.modifiedFlags=frame.CVAR_SERVERINFO|frame.CVAR_SYSTEMINFO|32;h=host();frame.run(s,0,h);n=n+req(s.modifiedFlags==32,"info flags clear selectively");n=n+req(h.context.events[2]=="info:4" and h.context.events[3]=="config:0=small" and h.context.events[4]=="info:8" and h.context.events[5]=="config:1=big","info order")
 s=state();s.time=100;s.timeResidual=125;s.dedicated=1;s.speeds=1;h=host();frame.run(s,0,h);n=n+req(s.time==200 and s.timeResidual==25,"two game chunks");n=n+req(s.timeGame==37,"speeds duration")
 n=n+req(h.context.events==["pause","millis","pings","bot:100","game:150","game:200","millis","timeouts","messages","heartbeat"],"full service order")
 s=state();s.time=100;s.timeResidual=10;h=host();frame.run(s,5,h);n=n+req(h.context.events[1]=="bot:115","listen bot sees residual target")
 pc=pings.client();pc.state=pings.CS_ACTIVE;pc.gentity=pings.gameEntity(0);pc.frames[0]=pings.frame(10,30);ps=pings.playerState();s=state();s.pingClients=[pc];s.playerStates=[ps];h=host();frame.run(s,0,h);n=n+req(pc.ping==20 and ps.ping==20,"productive ping composition")
 tc=timeouts.client(timeouts.CS_CONNECTED,0,5);s=state();s.time=10000;s.timeoutState=timeouts.runtime([tc]);s.timeoutState.timeoutSeconds=2;h=host();frame.run(s,0,h);n=n+req(tc.state==timeouts.CS_FREE and h.context.drops==1,"productive timeout composition")
 sc=snapshots.client(3);sc.state=1;sc.nextSnapshotTime=0;s=state();s.time=100;s.snapshotClients=[sc];h=host();frame.run(s,0,h);n=n+req(h.context.snapshots==1,"productive snapshot composition")
 n=n+req(h.context.events[len(h.context.events)-1]=="heartbeat","heartbeat last")
 s=state();h=host();h.snapshotServices=void;n=n+req(try(frame.run(s,0,h)) is error,"missing snapshot services")
 s=state();s.timeoutState=void;n=n+req(try(frame.run(s,0,host())) is error,"missing timeout runtime")
 n=n+req(try(frame.run(void,0,host())) is error and try(frame.run(state(),0,void)) is error,"missing outer inputs")
 print "PASS: "+str(n)+" server-frame contracts";return 0
end function
