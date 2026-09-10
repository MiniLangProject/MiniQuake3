import mq3.client.cgame_time as timing
struct Context events reads clock end struct
function event(c,text) c.events=c.events+text+",";return void end function
function addText(c,text) event(c,"add:"+text) end function
function clearAction(c) event(c,"clear") end function
function profile(c) event(c,"profile") end function
function timingDiagnostic(c,text) event(c,text) end function
function milliseconds(c) event(c,"clock");return c.clock end function
function hostReadDemo(c,state) c.reads=c.reads+1;event(c,"read");state.snapServerTime=state.snapServerTime+100;return void end function
function req(value,label) if not value then return error(3469,"cgame time contract: "+label) end if;return 1 end function
function fixture()
  c=Context("",0,444);host=timing.services();host.context=c;host.addTextFn=addText;host.clearActiveActionFn=clearAction;host.beginProfilingFn=profile;host.readDemoFn=hostReadDemo;host.millisecondsFn=milliseconds;host.diagnosticFn=timingDiagnostic
  state=timing.create(host);state.connectionState=timing.CA_ACTIVE;state.snapValid=true;state.snapServerTime=1000;state.realtime=900;state.serverTimeDelta=100;state.oldServerTime=900;return [state,c]
end function
function main(args)
  count=0;f=fixture();s=f[0];c=f[1];s.newSnapshots=true;s.demoPlaying=true;timing.adjustTimeDelta(s)
  count=count+req(not s.newSnapshots and s.serverTimeDelta==100,"demo delta fixed")
  s.demoPlaying=false;s.snapServerTime=2000;s.realtime=900;s.serverTimeDelta=0;timing.adjustTimeDelta(s)
  count=count+req(s.serverTimeDelta==1100 and s.serverTime==2000 and s.oldServerTime==2000,"large reset")
  count=count+req(c.events=="reset,","reset diagnostic")
  s.snapServerTime=1200;s.realtime=900;s.serverTimeDelta=100;timing.adjustTimeDelta(s);count=count+req(s.serverTimeDelta==200,"fast average")
  s.snapServerTime=1000;s.realtime=900;s.serverTimeDelta=95;s.extrapolatedSnapshot=true;timing.adjustTimeDelta(s)
  count=count+req(s.serverTimeDelta==93 and not s.extrapolatedSnapshot,"slow extrapolated")
  s.serverTimeDelta=95;timing.adjustTimeDelta(s);count=count+req(s.serverTimeDelta==96,"slow forward")
  s.timescale=0.5;s.serverTimeDelta=95;timing.adjustTimeDelta(s);count=count+req(s.serverTimeDelta==95,"scaled time no drift")
  f=fixture();s=f[0];c=f[1];s.connectionState=timing.CA_PRIMED;s.snapFlags=timing.SNAPFLAG_NOT_ACTIVE
  count=count+req(not timing.firstSnapshot(s) and s.connectionState==timing.CA_PRIMED,"inactive first snapshot")
  s.snapFlags=0;s.activeAction="timedemo 1\n";count=count+req(timing.firstSnapshot(s),"first snapshot accepted")
  count=count+req(s.connectionState==timing.CA_ACTIVE and s.serverTimeDelta==100 and s.timeDemoBaseTime==1000,"first timing")
  count=count+req(s.activeAction=="" and c.events=="add:timedemo 1\n,clear,profile,","first callbacks")
  f=fixture();s=f[0];s.connectionState=6;count=count+req(not timing.setCGameTime(s),"non primed inactive")
  f=fixture();s=f[0];s.connectionState=timing.CA_PRIMED;s.demoPlaying=true;count=count+req(not timing.setCGameTime(s) and s.firstDemoFrameSkipped,"demo first-frame skip")
  s.newSnapshots=true;count=count+req(timing.setCGameTime(s) and s.connectionState==timing.CA_ACTIVE,"demo priming")
  f=fixture();s=f[0];s.serverPaused=true;s.clientPaused=true;s.serverRunning=true;count=count+req(not timing.setCGameTime(s),"single player pause")
  f=fixture();s=f[0];s.timeNudge=99;count=count+req(timing.setCGameTime(s) and s.serverTime==970,"positive nudge clamp")
  count=count+req(s.extrapolatedSnapshot,"extrapolation mark")
  f=fixture();s=f[0];s.timeNudge=-99;timing.setCGameTime(s);count=count+req(s.serverTime==1030,"negative nudge clamp")
  f=fixture();s=f[0];s.oldServerTime=1200;timing.setCGameTime(s);count=count+req(s.serverTime==1200,"monotonic time")
  f=fixture();s=f[0];s.demoPlaying=true;s.freezeDemo=true;s.serverTime=777;s.snapServerTime=1000;timing.setCGameTime(s);count=count+req(s.serverTime==777,"frozen demo")
  f=fixture();s=f[0];c=f[1];s.demoPlaying=true;s.timedemo=true;s.timeDemoBaseTime=800;s.snapServerTime=1000;timing.setCGameTime(s)
  count=count+req(s.timeDemoStart==444 and s.timeDemoFrames==1 and s.serverTime==850,"timedemo sample")
  count=count+req(c.events=="clock,","timedemo clock")
  f=fixture();s=f[0];c=f[1];s.demoPlaying=true;s.serverTime=1050;s.snapServerTime=1000;timing.setCGameTime(s)
  count=count+req(c.reads==1 and s.snapServerTime==1100,"demo catchup")
  f=fixture();s=f[0];s.snapValid=false;count=count+req(try(timing.setCGameTime(s)) is error,"invalid snapshot")
  f=fixture();s=f[0];s.oldFrameServerTime=1100;count=count+req(try(timing.setCGameTime(s)) is error,"backward snapshot")
  f=fixture();s=f[0];s.demoPlaying=true;s.serverTime=1000;s.host.readDemoFn=void;count=count+req(try(timing.setCGameTime(s)) is error,"missing demo reader")
  print "PASS: "+str(count)+" cgame timing contracts";return 0
end function
