// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Full AAS_ClientMovementPrediction port from code/botlib/be_aas_move.c.
package mq3.botlib.aas_client_movement

import mq3.compat.numeric as n
import mq3.botlib.aas_runtime as aasRuntime

const CONTENTS_SOLID=1
const CONTENTS_LAVA=8
const CONTENTS_SLIME=16
const CONTENTS_WATER=32
const AREACONTENTS_WATER=1
const AREACONTENTS_LAVA=2
const AREACONTENTS_SLIME=4
const AREACONTENTS_CLUSTERPORTAL=8
const AREACONTENTS_TELEPORTER=64
const AREACONTENTS_JUMPPAD=128

const SE_NONE=0
const SE_HITGROUND=1
const SE_LEAVEGROUND=2
const SE_ENTERWATER=4
const SE_ENTERSLIME=8
const SE_ENTERLAVA=16
const SE_HITGROUNDDAMAGE=32
const SE_GAP=64
const SE_TOUCHJUMPPAD=128
const SE_TOUCHTELEPORTER=256
const SE_ENTERAREA=512
const SE_HITGROUNDAREA=1024
const SE_TOUCHCLUSTERPORTAL=4096
const SE_HITBOUNDINGBOX=2048

struct Settings friction stopspeed gravity waterfriction watergravity maxwalkvelocity maxcrouchvelocity maxswimvelocity walkaccelerate airaccelerate swimaccelerate maxstep maxsteepness maxbarrier jumpvel end struct
struct Trace startsolid fraction endpos ent lastarea area planenum normal end struct
struct AreaTrace areas points end struct
struct Movement success endpos endarea velocity trace presencetype stopevent endcontents time frames end struct
struct Services context traceFn pointContentsFn pointAreaFn pointPresenceFn areaContentsFn traceAreasFn settings end struct

function settings() return Settings(6.0,100.0,800.0,1.0,400.0,320.0,100.0,150.0,10.0,1.0,4.0,19.0,0.7,33.0,270.0) end function
function services(context) return Services(context,void,void,void,void,void,void,settings()) end function
function fail(message) return error(7540,"AAS client movement: "+message) end function
function copy(v) return [v[0],v[1],v[2]] end function
function zeroTrace() return Trace(false,0.0,[0.0,0.0,0.0],0,0,0,0,[0.0,0.0,0.0]) end function
function dot(a,b) return n.fadd(n.fadd(n.fmul(a[0],b[0]),n.fmul(a[1],b[1])),n.fmul(a[2],b[2])) end function
function add(a,b) return [n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])] end function
function sub(a,b) return [n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])] end function
function scale(a,value) return [n.fmul(a[0],value),n.fmul(a[1],value),n.fmul(a[2],value)] end function
function ma(a,value,b) return add(a,scale(b,value)) end function
function length(v) return n.fsqrt(dot(v,v)) end function
function normalize(v)
  magnitude=length(v);if magnitude==0.0 then return [0.0,[0.0,0.0,0.0]] end if;return [magnitude,scale(v,n.fdiv(1.0,magnitude))]
end function
function callTrace(s,start,finish,presence,passEntity) if s==void or s.traceFn==void then return fail("trace callback missing") end if;return s.traceFn(s.context,start,finish,presence,passEntity) end function
function pointContents(s,point) if s.pointContentsFn==void then return 0 end if;return s.pointContentsFn(s.context,point) end function
function pointArea(s,point) if s.pointAreaFn==void then return 0 end if;return s.pointAreaFn(s.context,point) end function
function pointPresence(s,point) if s.pointPresenceFn==void then return 0 end if;return s.pointPresenceFn(s.context,point) end function
function callAreaContents(s,area) if s.areaContentsFn==void then return 0 end if;return s.areaContentsFn(s.context,area) end function
function callTraceAreas(s,start,finish) if s.traceAreasFn==void then return AreaTrace([],[]) end if;return s.traceAreasFn(s.context,start,finish,20) end function

function swimming(s,origin)
  test=copy(origin);test[2]=n.fsub(test[2],2.0);return (pointContents(s,test)&(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))!=0
end function
function accelerate(velocity,frametime,wishdir,wishspeed,acceleration)
  current=dot(velocity,wishdir);additional=n.fsub(wishspeed,current);if additional<=0.0 then return velocity end if
  amount=n.fmul(n.fmul(acceleration,frametime),wishspeed);if amount>additional then amount=additional end if
  for axis=0 to 2 velocity[axis]=n.fadd(velocity[axis],n.fmul(amount,wishdir[axis])) end for;return velocity
end function
function applyFriction(velocity,friction,stopspeed,frametime)
  speed=n.fsqrt(n.fadd(n.fmul(velocity[0],velocity[0]),n.fmul(velocity[1],velocity[1])));if speed==0.0 then return velocity end if
  control=speed;if control<stopspeed then control=stopspeed end if;newspeed=n.fsub(speed,n.fmul(n.fmul(frametime,control),friction));if newspeed<0.0 then newspeed=0.0 end if;ratio=n.fdiv(newspeed,speed)
  velocity[0]=n.fmul(velocity[0],ratio);velocity[1]=n.fmul(velocity[1],ratio);return velocity
end function
function onGround(s,origin,presence,passEntity,maxSteepness)
  finish=copy(origin);finish[2]=n.fsub(finish[2],10.0);trace=callTrace(s,origin,finish,presence,passEntity);if trace is error or trace.startsolid or trace.fraction>=1.0 then return false end if
  if n.fsub(origin[2],trace.endpos[2])>10.0 then return false end if;return trace.normal[2]>=maxSteepness
end function
function clipToBBox(start,finish,presence,mins,maxs)
  if mins==void or maxs==void then return void end if;bounds=aasRuntime.presenceTypeBoundingBox(presence);if bounds is error then return void end if
  absmins=sub(mins,bounds[1]);absmaxs=sub(maxs,bounds[0]);direction=sub(finish,start)
  for axis=0 to 2 if start[axis]<absmins[axis] and finish[axis]<absmins[axis] or start[axis]>absmaxs[axis] and finish[axis]>absmaxs[axis] then return void end if end for
  for axis=0 to 2
    plane=absmaxs[axis];if direction[axis]>0.0 then plane=absmins[axis] end if
    front=n.fsub(start[axis],plane);back=n.fsub(finish[axis],plane);denominator=n.fsub(front,back);if denominator==0.0 then continue end if;fraction=n.fdiv(front,denominator)
    first=(axis+1)%3;second=(first+1)%3;firstValue=n.fadd(start[first],n.fmul(direction[first],fraction));secondValue=n.fadd(start[second],n.fmul(direction[second],fraction))
    if firstValue>absmins[first] and firstValue<absmaxs[first] and secondValue>absmins[second] and secondValue<absmaxs[second] then
      endpos=ma(start,fraction,direction);return Trace(false,fraction,endpos,0,0,0,0,[0.0,0.0,0.0])
    end if
  end for;return void
end function
function result(success,origin,velocity,frametime,presence,event,contents,frames,trace,s)
  outputVelocity=copy(velocity);if frametime!=0.0 then outputVelocity=scale(velocity,n.fdiv(1.0,frametime)) end if
  return Movement(success,copy(origin),pointArea(s,origin),outputVelocity,trace,presence,event,contents,n.fmul(frames,frametime),frames)
end function
function stopped(s,origin,velocity,frametime,presence,event,contents,frame,trace,area)
  value=result(true,origin,velocity,frametime,presence,event,contents,frame,trace,s);if area>=0 then value.endarea=area end if;return value
end function

function predictWithBBox(s,entnum,origin,presence,onground,velocity,cmdmove,cmdframes,maxframes,frametime,stopevents,stoparea,mins,maxs,visualize)
  if s==void or origin==void or velocity==void or cmdmove==void or len(origin)!=3 or len(velocity)!=3 or len(cmdmove)!=3 then return fail("invalid prediction input") end if
  if frametime<=0.0 then frametime=0.1 end if;frametime=n.f32(frametime);cfg=s.settings;if cfg==void then cfg=settings() end if
  org=copy(origin);org[2]=n.fadd(org[2],0.25);frameVelocity=scale(velocity,frametime);jumpFrame=-1;lastTrace=zeroTrace();frame=0
  while frame<maxframes
    inWater=swimming(s,org);gravity=cfg.gravity;if inWater then gravity=cfg.watergravity end if
    frameVelocity[2]=n.fsub(frameVelocity[2],n.fmul(n.fmul(gravity,0.1),frametime))
    if onground or inWater then friction=cfg.waterfriction;if inWater then friction=cfg.friction end if;frameVelocity=scale(frameVelocity,n.fdiv(1.0,frametime));applyFriction(frameVelocity,friction,cfg.stopspeed,frametime);frameVelocity=scale(frameVelocity,frametime) end if
    crouch=false
    if frame<cmdframes then
      maxVelocity=cfg.maxwalkvelocity;acceleration=cfg.airaccelerate;wishdir=copy(cmdmove)
      if onground then
        if cmdmove[2]<-300.0 then crouch=true;maxVelocity=cfg.maxcrouchvelocity end if
        if not inWater and cmdmove[2]>1.0 then frameVelocity[2]=n.fadd(n.fsub(n.fmul(cfg.jumpvel,frametime),n.fmul(n.fmul(gravity,0.1),frametime)),5.0);jumpFrame=frame;acceleration=cfg.airaccelerate else acceleration=cfg.walkaccelerate end if
      end if
      if inWater then maxVelocity=cfg.maxswimvelocity;acceleration=cfg.swimaccelerate else wishdir[2]=0.0 end if
      normalized=normalize(wishdir);wishspeed=normalized[0];wishdir=normalized[1];if wishspeed>maxVelocity then wishspeed=maxVelocity end if
      frameVelocity=scale(frameVelocity,n.fdiv(1.0,frametime));accelerate(frameVelocity,frametime,wishdir,wishspeed,acceleration);frameVelocity=scale(frameVelocity,frametime)
    end if
    if crouch then presence=aasRuntime.PRESENCE_CROUCH else if presence==aasRuntime.PRESENCE_CROUCH and (pointPresence(s,org)&aasRuntime.PRESENCE_NORMAL)!=0 then presence=aasRuntime.PRESENCE_NORMAL end if
    lastorg=copy(org);leftVelocity=copy(frameVelocity);slides=0
    while true
      finish=add(org,leftVelocity);trace=callTrace(s,org,finish,presence,entnum);if trace is error then return trace end if;lastTrace=trace
      if (stopevents&(SE_ENTERAREA|SE_TOUCHJUMPPAD|SE_TOUCHTELEPORTER|SE_TOUCHCLUSTERPORTAL))!=0 then
        crossed=callTraceAreas(s,org,trace.endpos);if crossed is error then return crossed end if
        for index=0 to len(crossed.areas)-1 area=crossed.areas[index];event=0
          if (stopevents&SE_ENTERAREA)!=0 and area==stoparea then event=SE_ENTERAREA
          else if (stopevents&SE_TOUCHJUMPPAD)!=0 and frame!=0 and (callAreaContents(s,area)&AREACONTENTS_JUMPPAD)!=0 then event=SE_TOUCHJUMPPAD
          else if (stopevents&SE_TOUCHTELEPORTER)!=0 and (callAreaContents(s,area)&AREACONTENTS_TELEPORTER)!=0 then event=SE_TOUCHTELEPORTER
          else if (stopevents&SE_TOUCHCLUSTERPORTAL)!=0 and (callAreaContents(s,area)&AREACONTENTS_CLUSTERPORTAL)!=0 then event=SE_TOUCHCLUSTERPORTAL end if
          if event!=0 then return stopped(s,crossed.points[index],frameVelocity,frametime,presence,event,0,frame,trace,area) end if
        end for
      end if
      if (stopevents&SE_HITBOUNDINGBOX)!=0 then bboxTrace=clipToBBox(org,trace.endpos,presence,mins,maxs);if bboxTrace!=void then return stopped(s,bboxTrace.endpos,frameVelocity,frametime,presence,SE_HITBOUNDINGBOX,0,frame,bboxTrace,-1) end if end if
      org=copy(trace.endpos)
      if trace.fraction<1.0 then
        if (stopevents&SE_HITGROUNDAREA)!=0 and trace.normal[2]>cfg.maxsteepness then test=copy(org);test[2]=n.fadd(test[2],0.5);if pointArea(s,test)==stoparea then return stopped(s,test,frameVelocity,frametime,presence,SE_HITGROUNDAREA,0,frame,trace,stoparea) end if end if
        stepped=false
        if trace.normal[2]==0.0 and (jumpFrame<0 or frame-jumpFrame>2) then
          start=ma(org,-0.25,trace.normal);stepend=copy(start);start[2]=n.fadd(start[2],cfg.maxstep);steptrace=callTrace(s,start,stepend,presence,entnum);if steptrace is error then return steptrace end if
          if not steptrace.startsolid and steptrace.normal[2]>cfg.maxsteepness then leftVelocity=sub(finish,steptrace.endpos);leftVelocity[2]=0.0;frameVelocity[2]=0.0;org[2]=steptrace.endpos[2];stepped=true end if
        end if
        if not stepped then
          leftVelocity=ma(leftVelocity,0.0-dot(leftVelocity,trace.normal),trace.normal);oldVelocity=copy(frameVelocity);frameVelocity=ma(frameVelocity,0.0-dot(frameVelocity,trace.normal),trace.normal)
          landed=trace.normal[2]>cfg.maxsteepness;if landed then onground=true end if
          if (stopevents&SE_HITGROUNDDAMAGE)!=0 then delta=0.0;if oldVelocity[2]<0.0 and frameVelocity[2]>oldVelocity[2] and not onground then delta=oldVelocity[2] else if onground then delta=n.fsub(frameVelocity[2],oldVelocity[2]) end if
            if delta!=0.0 then delta=n.fmul(delta,10.0);delta=n.fmul(n.fmul(delta,delta),0.0001);if inWater then delta=0.0 end if;if delta>40.0 then value=stopped(s,org,frameVelocity,1.0,presence,SE_HITGROUNDDAMAGE,0,frame,trace,-1);value.time=n.fmul(frame,frametime);return value end if end if
          end if
        end if
      end if
      slides=slides+1;if slides>20 then return Movement(false,copy(org),0,[0.0,0.0,0.0],zeroTrace(),presence,0,0,0.0,0) end if
      if trace.fraction>=1.0 then break end if
    end while
    if frameVelocity[2]<=10.0 then
      feet=copy(org);feet[2]=n.fsub(feet[2],22.0);contents=pointContents(s,feet);event=0;if (contents&CONTENTS_LAVA)!=0 then event=event|SE_ENTERLAVA end if;if (contents&CONTENTS_SLIME)!=0 then event=event|SE_ENTERSLIME end if;if (contents&CONTENTS_WATER)!=0 then event=event|SE_ENTERWATER end if
      area=pointArea(s,org);areaFlags=callAreaContents(s,area);if (areaFlags&AREACONTENTS_LAVA)!=0 then event=event|SE_ENTERLAVA end if;if (areaFlags&AREACONTENTS_SLIME)!=0 then event=event|SE_ENTERSLIME end if;if (areaFlags&AREACONTENTS_WATER)!=0 then event=event|SE_ENTERWATER end if
      if (event&stopevents)!=0 then return stopped(s,org,frameVelocity,frametime,presence,event&stopevents,contents,frame,zeroTrace(),area) end if
    end if
    onground=onGround(s,org,presence,entnum,cfg.maxsteepness)
    if onground and (stopevents&SE_HITGROUND)!=0 then return stopped(s,org,frameVelocity,frametime,presence,SE_HITGROUND,0,frame,lastTrace,-1)
    else if not onground and (stopevents&SE_LEAVEGROUND)!=0 then return stopped(s,org,frameVelocity,frametime,presence,SE_LEAVEGROUND,0,frame,lastTrace,-1)
    else if not onground and (stopevents&SE_GAP)!=0 then
      finish=copy(org);finish[2]=n.fsub(finish[2],n.fadd(48.0,cfg.maxbarrier));gaptrace=callTrace(s,org,finish,aasRuntime.PRESENCE_CROUCH,-1);if gaptrace is error then return gaptrace end if
      if not gaptrace.startsolid and gaptrace.endpos[2]<n.fsub(n.fsub(org[2],cfg.maxstep),1.0) and (pointContents(s,finish)&CONTENTS_WATER)==0 then return stopped(s,lastorg,frameVelocity,frametime,presence,SE_GAP,0,frame,lastTrace,-1) end if
    end if
    frame=frame+1
  end while
  return result(true,org,frameVelocity,frametime,presence,SE_NONE,0,frame,zeroTrace(),s)
end function

function predict(s,entnum,origin,presence,onground,velocity,cmdmove,cmdframes,maxframes,frametime,stopevents,stoparea,visualize)
  return predictWithBBox(s,entnum,origin,presence,onground,velocity,cmdmove,cmdframes,maxframes,frametime,stopevents,stoparea,void,void,visualize)
end function
