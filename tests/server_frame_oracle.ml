import mq3.server.frame as frame
import mq3.server.timeouts as timeouts
import mq3.server.snapshot_schedule as snapshots
import mq3.server.client_pings as pings
struct Context events clocks clockIndex end struct
function mark(h,s) h.context.events=h.context.events+s+";";return void end function
function shutdown(h,s) if s=="Server was killed.\n" then return mark(h,"shutdown:killed") end if;if s=="Restarting server due to numSnapshotEntities wrapping" then return mark(h,"shutdown:snapwrap") end if;return mark(h,"shutdown:timewrap") end function
function cvar(h,n,v) return mark(h,"cvar:"+n+"="+v) end function
function pauseSeen(h) return mark(h,"pause") end function
function pingsSeen(h) return mark(h,"pings") end function
function timeoutSeen(h) return mark(h,"timeouts") end function
function messagesSeen(h) return mark(h,"messages") end function
function bot(h,t) return mark(h,"bot:"+str(t)) end function
function sleep(h,t) return mark(h,"sleep:"+str(t)) end function
function command(h,s) if s=="map_restart 0\n" then return mark(h,"cmd:restart") end if;return mark(h,"cmd:nextmap") end function
function info(h,f,big) if big then mark(h,"biginfo:"+str(f));return "system" end if;mark(h,"info:"+str(f));return "server" end function
function config(h,i,s) return mark(h,"config:"+str(i)+"="+s) end function
function millis(h) mark(h,"millis");v=h.context.clocks[h.context.clockIndex];h.context.clockIndex=h.context.clockIndex+1;return v end function
function game(h,t) return mark(h,"game:"+str(t)) end function
function heartbeat(h) return mark(h,"heartbeat") end function
function timeoutDiagnostic(h,index) return void end function
function snapSend(h,c) return void end function
function snapFragment(h,c) return void end function
function makeHost(c0,c1)
 h=frame.services();h.context=Context("",[c0,c1],0);h.shutdownFn=shutdown;h.cvarSetFn=cvar;h.pauseObservedFn=pauseSeen;h.pingsObservedFn=pingsSeen;h.timeoutObservedFn=timeoutSeen;h.messagesObservedFn=messagesSeen;h.botFrameFn=bot;h.sleepFn=sleep;h.commandFn=command;h.infoStringFn=info;h.setConfigstringFn=config;h.millisecondsFn=millis;h.gameFrameFn=game;h.heartbeatFn=heartbeat
 h.timeoutServices=timeouts.services();h.timeoutServices.context=h.context;h.timeoutServices.diagnosticFn=timeoutDiagnostic
 h.snapshotServices=snapshots.services(snapSend,snapFragment,h.context);return h
end function
function makePingClients() return [] end function
function runCase(tag,msec,kill,running,paused,fps,dedicated,speeds,flags,residual,now,restart,next,count,c0,c1)
 s=frame.runtime();s.timeGame=-1;s.killServer=kill;s.running=running;s.clPaused=0;if paused!=0 then s.clPaused=1;s.svPaused=1 end if;s.fps=fps;s.dedicated=dedicated;s.speeds=speeds;s.modifiedFlags=flags;s.timeResidual=residual;s.time=now;s.restartTime=restart;s.nextSnapshotEntities=next;s.numSnapshotEntities=count;s.pauseClients=[];s.pingClients=[];s.playerStates=[];s.timeoutState=timeouts.runtime([]);s.snapshotClients=[]
 h=makeHost(c0,c1);result=frame.run(s,msec,h)
 print tag+"|kill="+str(s.killServer)+"|fps="+str(s.fps)+"|flags="+str(s.modifiedFlags)+"|res="+str(s.timeResidual)+"|time="+str(s.time)+"|restart="+str(s.restartTime)+"|game="+str(s.timeGame)+"|"+h.context.events
 return void
end function
function main(args)
 runCase("kill",5,1,1,0,20,0,0,0,0,100,0,0,64,0,0)
 runCase("stopped",5,0,0,0,20,0,0,0,0,100,0,0,64,0,0)
 runCase("paused",5,0,1,1,20,0,0,0,0,100,0,0,64,0,0)
 runCase("listen-clamp",30,0,1,0,0,0,0,0,80,100,0,0,64,0,0)
 runCase("dedicated-sleep",10,0,1,0,20,1,0,0,5,100,0,0,64,0,0)
 runCase("time-wrap",1,0,1,0,20,0,0,0,0,1879048193,0,0,64,0,0)
 runCase("snapshot-wrap",1,0,1,0,20,0,0,0,0,100,0,2147483582,64,0,0)
 runCase("restart",1,0,1,0,20,0,0,0,0,100,100,0,64,0,0)
 runCase("full",125,0,1,0,20,1,1,12,0,100,0,7,64,500,537)
 return 0
end function
