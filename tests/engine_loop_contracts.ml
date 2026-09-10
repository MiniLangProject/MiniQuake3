// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.platform.input_events as inputEvents
import mq3.platform.engine_loop as engineLoop
import mq3.server.frame as serverFrame
import mq3.server.timeouts as timeouts
import mq3.server.snapshot_schedule as schedule
import mq3.client.frame as clientFrame

struct Capture events end struct
function add(c,text) c.events=c.events+[text];return void end function
function clock(c) return 100 end function
function key(c,key,down,time) add(c,"key:"+str(key)+":"+str(down)+":"+str(time));return void end function
function character(c,value) add(c,"char:"+str(value));return void end function
function mouse(c,x,y,time) add(c,"mouse");return void end function
function joy(c,a,v,time) add(c,"joy");return void end function
function gameFrame(h,time) add(h.context,"game:"+str(time));return void end function
function heartbeat(h) add(h.context,"heartbeat");return void end function
function sendSnapshot(h,c) return void end function
function fragment(h,c) return void end function
function sendCmd(h) add(h.context,"send");return void end function
function resend(h) add(h.context,"resend");return void end function
function cgame(h) add(h.context,"cgame");return void end function
function screen(h) add(h.context,"screen");return void end function
function sound(h) add(h.context,"sound");return void end function
function cinematic(h) add(h.context,"cinematic");return void end function
function console(h) add(h.context,"console");return void end function
function req(value,label) if not value then return error(7129,"engine loop: "+label) end if;return 1 end function
function same(a,b) if len(a)!=len(b) then return false end if;for i=0 to len(a)-1 if a[i]!=b[i] then return false end if end for;return true end function
function main(args)
  n=0;c=Capture([]);queue=inputEvents.create(c,clock);handlers=inputEvents.handlers(c,key,character,mouse,joy)
  inputEvents.keyEvent(queue,25,13,true);inputEvents.charEvent(queue,26,97);inputEvents.keyEvent(queue,27,13,false)
  ss=serverFrame.runtime();ss.running=1;ss.fps=20;ss.pauseClients=[];ss.pingClients=[];ss.playerStates=[];ss.timeoutState=timeouts.runtime([]);ss.snapshotClients=[]
  sh=serverFrame.services();sh.context=c;sh.gameFrameFn=gameFrame;sh.heartbeatFn=heartbeat;sh.snapshotServices=schedule.services(sendSnapshot,fragment,c)
  cs=clientFrame.runtime();cs.running=1;cs.serverRunning=1
  ch=clientFrame.services();ch.context=c;ch.sendCmdFn=sendCmd;ch.resendFn=resend;ch.setCGameTimeFn=cgame;ch.screenFn=screen;ch.soundFn=sound;ch.cinematicFn=cinematic;ch.consoleFn=console
  runtime=engineLoop.create(queue,handlers,2,ss,sh,cs,ch)
  n=n+req(engineLoop.serverTick(runtime,50,50)=="frame","server tick")
  n=n+req(runtime.inputCount==2 and inputEvents.queued(queue)==1,"input budget")
  n=n+req(ss.time==50 and runtime.lastServerResult=="frame","server state")
  n=n+req(same(c.events,["key:13:true:25","char:97","game:50","heartbeat"]),"input before server")
  n=n+req(engineLoop.clientTick(runtime,50,50)=="frame","client tick")
  n=n+req(runtime.frameCount==1 and cs.realtime==50,"client state")
  n=n+req(same(c.events,["key:13:true:25","char:97","game:50","heartbeat","send","resend","cgame","screen","sound","cinematic","console"]),"full frame order")
  c.events=[];engineLoop.serverTick(runtime,50,0);engineLoop.clientTick(runtime,50,0)
  n=n+req(runtime.inputCount==3 and inputEvents.queued(queue)==0,"remaining input")
  n=n+req(c.events[0]=="key:13:false:27" and c.events[1]=="heartbeat","next input precedes server")
  n=n+req(runtime.frameCount==2 and cs.framecount==2,"frame accounting")
  live=engineLoop.liveServices(runtime,[1]);n=n+req(live.context.frameContext==runtime,"desktop binding")
  n=n+req(try(engineLoop.create(void,handlers,1,ss,sh,cs,ch)) is error,"configuration validation")
  n=n+req(try(engineLoop.create(queue,handlers,-1,ss,sh,cs,ch)) is error,"budget validation")
  n=n+req(try(engineLoop.serverTick(void,0,0)) is error,"server validation")
  n=n+req(try(engineLoop.liveServices(runtime,void)) is error,"live validation")
  print "PASS: "+str(n)+" engine-loop integration contracts";return 0
end function
