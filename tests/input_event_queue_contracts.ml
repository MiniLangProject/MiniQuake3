import mq3.platform.input_events as input
struct Clock now calls end struct
struct Capture events end struct
function clock(c) c.calls=c.calls+1;return c.now end function
function key(c,k,d,t) c.events=c.events+[["key",k,d,t]];return void end function
function char(c,k) c.events=c.events+[["char",k]];return void end function
function mouse(c,x,y,t) c.events=c.events+[["mouse",x,y,t]];return void end function
function joy(c,a,v,t) c.events=c.events+[["joy",a,v,t]];return void end function
function req(value,label) if not value then return error(499,"input events: "+label) end if;return 1 end function
function main(args)
  n=0;c=Clock(1234,0);q=input.create(c,clock)
  n=n+req(input.queued(q)==0 and q.head==0 and q.tail==0,"empty queue")
  input.keyEvent(q,77,42,true);input.charEvent(q,78,65);input.mouseEvent(q,79,-5,8);input.joystickEvent(q,80,2,-127)
  n=n+req(input.queued(q)==4 and c.calls==0,"enqueue and explicit times")
  a=input.poll(q);b=input.poll(q);n=n+req(a.type==input.SE_KEY and a.value==42 and a.value2==1 and a.time==77,"key representation")
  n=n+req(b.type==input.SE_CHAR and b.value==65 and b.value2==0,"char representation")
  capture=Capture([]);sink=input.handlers(capture,key,char,mouse,joy);n=n+req(input.drain(q,sink,1)==1,"bounded drain")
  n=n+req(capture.events==[["mouse",-5,8,79]],"mouse callback")
  n=n+req(input.drain(q,sink,8)==1 and capture.events[1]==["joy",2,-127,80],"joystick callback")
  n=n+req(input.poll(q) is void and input.queued(q)==0,"empty poll")
  input.keyEvent(q,0,9,false);n=n+req(c.calls==1 and input.poll(q).time==1234,"zero time clock")
  input.mouseEvent(q,90,0,0);n=n+req(input.queued(q)==0,"zero mouse suppressed")
  input.wheelEvent(q,91,2);n=n+req(input.queued(q)==4,"wheel steps")
  capture=Capture([]);input.drain(q,input.handlers(capture,key,char,mouse,joy),10)
  n=n+req(capture.events==[["key",input.K_MWHEELUP,true,91],["key",input.K_MWHEELUP,false,91],["key",input.K_MWHEELUP,true,91],["key",input.K_MWHEELUP,false,91]],"wheel up impulses")
  input.wheelEvent(q,92,-1);capture=Capture([]);input.drain(q,input.handlers(capture,key,char,mouse,joy),10)
  n=n+req(capture.events==[["key",input.K_MWHEELDOWN,true,92],["key",input.K_MWHEELDOWN,false,92]],"wheel down impulse")
  for i=0 to 257 input.keyEvent(q,100+i,i,true) end for
  n=n+req(q.head-q.tail==256 and q.overflows==2,"overflow accounting")
  first=input.poll(q);last=void;while input.queued(q)>0 last=input.poll(q) end while
  n=n+req(first.value==2 and first.time==102,"overflow drops oldest")
  n=n+req(last.value==257 and last.time==357,"overflow preserves newest")
  q=input.create(c,clock);input.charEvent(q,1,90);input.keyEvent(q,2,7,false);capture=Capture([]);input.drain(q,input.handlers(capture,key,char,mouse,joy),10)
  n=n+req(capture.events==[["char",90],["key",7,false,2]],"callback FIFO and key up")
  n=n+req(input.drain(q,input.handlers(capture,key,char,mouse,joy),0)==0,"zero budget")
  q=input.create(c,clock);input.keyEvent(q,3,1,true);capture=Capture([]);input.drain(q,input.handlers(capture,void,void,void,void),1)
  n=n+req(len(capture.events)==0 and input.queued(q)==0,"optional callback consumes")
  n=n+req(try(input.queueEvent(void,1,input.SE_KEY,1,1)) is error,"missing queue rejected")
  n=n+req(try(input.queueEvent(q,1,input.SE_NONE,1,1)) is error,"bad type rejected")
  n=n+req(try(input.keyEvent(q,-1,1,true)) is error,"bad time rejected")
  n=n+req(try(input.joystickEvent(q,1,0,128)) is error,"joystick range rejected")
  n=n+req(try(input.charEvent(q,1,-1)) is error,"character range rejected")
  n=n+req(try(input.drain(q,void,1)) is error and try(input.drain(q,sink,-1)) is error,"drain validation")
  e=input.Event(5,input.SE_MOUSE,1,2);n=n+req(try(input.dispatch(e,void)) is error,"dispatch validation")
  print "PASS: "+str(n)+" input event queue contracts";return 0
end function
