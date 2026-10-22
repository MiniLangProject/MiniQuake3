// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful native port of code/qcommon/common.c.
package mq3.qcommon.common

import mq3.qcommon.startup_commands as startup
import mq3.qcommon.command_buffer as command
import mq3.qcommon.config_persistence as config
import mq3.qcommon.network_pump as network
import mq3.platform.engine_loop as engine
import mq3.compat.numeric as n

extern function acos(value as double) from "ucrtbase.dll" returns double

const ERR_FATAL=0
const ERR_DROP=1
const ERR_SERVERDISCONNECT=2
const ERR_DISCONNECT=3
const ERR_NEED_CD=4
const MAX_PUSHED_EVENTS=1024
const MAX_EDIT_LINE=256
const MAX_TOKEN_CHARS=1024
const TAG_FREE=0
const TAG_GENERAL=1
const TAG_BOTLIB=2
const TAG_RENDERER=3
const HUNK_LOW=0
const HUNK_HIGH=1

struct Services context printFn errorFn quitFn clockFn realTimeFn realEventFn readFn writeFn appendFn validateKeyFn shutdownClientFn shutdownServerFn shutdownFsFn initFn shutdownFn consoleEventFn packetEventFn end struct
struct SysEvent time type value value2 data end struct
struct Redirect capacity text flushFn context end struct
struct CommonError code message fatal end struct
struct Allocation handle data size tag temporary bank freed label end struct
struct Zone capacity used nextHandle allocations end struct
struct Hunk capacity lowPermanent highPermanent lowTemp highTemp markLow markHigh markHandle nextHandle allocations permanentBank tempBank end struct
struct Field buffer cursor scroll end struct
struct State services commandState startupState configState networkPump engineRuntime redirect developer errorEntered errorMessage lastErrorTime errorCount buildScript fullyInitialized pushed head tail journalMode journalEvents journalIndex journalPath journalDirty frameTime frameMsec frameNumber lastTime dedicated maxFps timedemo fixedTime timescale cameraMode svRunning zone smallZone hunk cdKey shutdown lastPrint completionString shortestMatch matchCount completionField end struct

function services(context) return Services(context,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
function createZone(capacity) if capacity<0 then capacity=0 end if;return Zone(capacity,0,1,[]) end function
function createHunk(capacity) if capacity<0 then capacity=0 end if;return Hunk(capacity,0,0,0,0,0,0,1,1,[],HUNK_LOW,HUNK_HIGH) end function
function create(host,commandState)
  if host==void then host=services(void) end if;if commandState==void then commandState=command.create() end if;startupState=startup.create(commandState)
  return State(host,commandState,startupState,void,void,void,void,false,false,"",0,0,false,false,array(MAX_PUSHED_EVENTS,void),0,0,0,[],0,"journal.dat",false,0,0,0,0,false,85,false,0,1.0,false,false,createZone(16*1024*1024),createZone(512*1024),createHunk(56*1024*1024),"                                ",false,"","","",0,void)
end function
function visible(text) data=bytes(text);count=0;while count<len(data) and data[count]!=0 count=count+1 end while;return decode(slice(data,0,count)) end function
function lower(value) if value>=65 and value<=90 then return value+32 end if;return value end function
function samePrefix(left,right,count,casesensitive) a=bytes(left);b=bytes(right);if len(a)<count or len(b)<count then return false end if;for i=0 to count-1 av=a[i];bv=b[i];if not casesensitive then av=lower(av);bv=lower(bv) end if;if av!=bv then return false end if end for;return true end function
function emit(state,text) state.lastPrint=text;if state.services.printFn!=void then state.services.printFn(state.services.context,text) end if;return void end function

function Com_BeginRedirect(state,capacity,flushFn,context) if state==void or capacity<=0 or flushFn==void then return false end if;state.redirect=Redirect(capacity,"",flushFn,context);return true end function
function Com_EndRedirect(state) if state==void or state.redirect==void then return false end if;state.redirect.flushFn(state.redirect.context,state.redirect.text);state.redirect=void;return true end function
function Com_Printf(state,text)
  if state==void then return void end if;text=visible(text)
  if state.redirect!=void then if len(bytes(text))+len(bytes(state.redirect.text))>state.redirect.capacity-1 then state.redirect.flushFn(state.redirect.context,state.redirect.text);state.redirect.text="" end if;room=state.redirect.capacity-1-len(bytes(state.redirect.text));if room>0 then data=bytes(text);if len(data)>room then data=slice(data,0,room) end if;state.redirect.text=state.redirect.text+decode(data) end if;return void end if
  emit(state,text);return void
end function
function Com_DPrintf(state,text) if state!=void and state.developer then return Com_Printf(state,text) end if;return void end function
function Com_Error(state,code,message)
  if state==void then return CommonError(code,message,true) end if;now=Com_Milliseconds(state);if now-state.lastErrorTime<100 then state.errorCount=state.errorCount+1;if state.errorCount>3 then code=ERR_FATAL end if else state.errorCount=0 end if;state.lastErrorTime=now;if state.buildScript then code=ERR_FATAL end if
  if state.errorEntered then code=ERR_FATAL;message="recursive error after: "+state.errorMessage end if;state.errorEntered=true;state.errorMessage=message;fatal=code==ERR_FATAL
  result=CommonError(code,message,fatal);if state.services.errorFn!=void then state.services.errorFn(state.services.context,result) end if
  if code==ERR_SERVERDISCONNECT or code==ERR_DROP or code==ERR_DISCONNECT or code==ERR_NEED_CD then state.errorEntered=false else Com_Shutdown(state) end if;return result
end function
function Com_Quit_f(state) if state==void then return false end if;if not state.errorEntered then if state.services.shutdownServerFn!=void then state.services.shutdownServerFn(state.services.context,"Server quit\n") end if;if state.services.shutdownClientFn!=void then state.services.shutdownClientFn(state.services.context) end if;Com_Shutdown(state);if state.services.shutdownFsFn!=void then state.services.shutdownFsFn(state.services.context,true) end if end if;if state.services.quitFn!=void then state.services.quitFn(state.services.context) end if;return true end function
function Com_Error_f(state) return Com_Error(state,ERR_DROP,"Testing drop error") end function
function Com_Freeze_f(state,seconds) if seconds<0.0 then seconds=0.0 end if;start=Com_Milliseconds(state);while (Com_Milliseconds(state)-start)*0.001<=seconds end while;return true end function
function Com_Crash_f(state) return Com_Error(state,ERR_FATAL,"Testing crash") end function

function Com_ParseCommandLine(state,text) return startup.parseCommandLine(state.startupState,text) end function
function Com_SafeMode(state) return startup.safeMode(state.startupState) end function
function Com_StartupVariable(state,match) return startup.startupVariable(state.startupState,match) end function
function Com_AddStartupCommands(state) return startup.addStartupCommands(state.startupState) end function
function Info_Print(state,text)
  data=bytes(visible(text));at=0;if at<len(data) and data[at]==92 then at=at+1 end if;lines=[]
  while at<len(data) start=at;while at<len(data) and data[at]!=92 at=at+1 end while;key=decode(slice(data,start,at-start));if at>=len(data) then line=key;while len(bytes(line))<20 line=line+" " end while;line=line+"MISSING VALUE\n";lines=lines+[line];Com_Printf(state,line);return lines end if;at=at+1;start=at;while at<len(data) and data[at]!=92 at=at+1 end while;value=decode(slice(data,start,at-start));if at<len(data) then at=at+1 end if;line=key;while len(bytes(line))<20 line=line+" " end while;line=line+value+"\n";lines=lines+[line];Com_Printf(state,line)
  end while;return lines
end function
function Com_StringContains(str1,str2,casesensitive)
  a=bytes(visible(str1));b=bytes(visible(str2));if len(b)==0 then return 0 end if;if len(a)<len(b) then return -1 end if
  for i=0 to len(a)-len(b) found=true;for j=0 to len(b)-1 av=a[i+j];bv=b[j];if not casesensitive then av=lower(av);bv=lower(bv) end if;if av!=bv then found=false;break end if end for;if found then return i end if end for;return -1
end function
function Com_Filter(filter,name,casesensitive)
  pattern=bytes(visible(filter));value=bytes(visible(name));pi=0;ni=0
  while pi<len(pattern)
    if pattern[pi]==42 then pi=pi+1;start=pi;while pi<len(pattern) and pattern[pi]!=42 and pattern[pi]!=63 pi=pi+1 end while;if pi>start then token=decode(slice(pattern,start,pi-start));found=Com_StringContains(decode(slice(value,ni,len(value)-ni)),token,casesensitive);if found<0 then return false end if;ni=ni+found+(pi-start) end if
    else if pattern[pi]==63 then pi=pi+1;ni=ni+1;if ni>len(value) then return false end if
    else if pattern[pi]==91 and pi+1<len(pattern) and pattern[pi+1]==91 then pi=pi+1
    else if pattern[pi]==91 then pi=pi+1;matched=false
      while pi<len(pattern) and not matched
        if pattern[pi]==93 and (pi+1>=len(pattern) or pattern[pi+1]!=93) then break end if
        if pi+2<len(pattern) and pattern[pi+1]==45 and (pattern[pi+2]!=93 or (pi+3<len(pattern) and pattern[pi+3]==93)) then low=pattern[pi];high=pattern[pi+2];test=0;if ni<len(value) then test=value[ni] end if;if not casesensitive then low=lower(low);high=lower(high);test=lower(test) end if;if test>=low and test<=high then matched=true end if;pi=pi+3 else test=0;if ni<len(value) then test=value[ni] end if;want=pattern[pi];if not casesensitive then test=lower(test);want=lower(want) end if;if test==want then matched=true end if;pi=pi+1 end if
      end while;if not matched then return false end if;while pi<len(pattern) and not (pattern[pi]==93 and (pi+1>=len(pattern) or pattern[pi+1]!=93)) pi=pi+1 end while;pi=pi+1;ni=ni+1
    else if ni>=len(value) then return false else av=pattern[pi];bv=value[ni];if not casesensitive then av=lower(av);bv=lower(bv) end if;if av!=bv then return false end if;pi=pi+1;ni=ni+1 end if
  end while;return true
end function
function normalizePath(value) data=bytes(visible(value));count=len(data);if count>63 then count=63 end if;result=bytes(count,0);if count>0 then for i=0 to count-1 ch=data[i];if ch==92 or ch==58 then ch=47 end if;result[i]=ch end for end if;return decode(result) end function
function Com_FilterPath(filter,name,casesensitive) return Com_Filter(normalizePath(filter),normalizePath(name),casesensitive) end function
function Com_HashKey(text,maxLength) data=bytes(visible(text));count=len(data);if count>maxLength then count=maxLength end if;hash=0;if count>0 then for i=0 to count-1 value=data[i];if value>=128 then value=value-256 end if;hash=hash+value*(119+i) end for end if;return hash^(hash>>10)^(hash>>20) end function
function Com_RealTime(state,target) if state==void or state.services.realTimeFn==void then return 0 end if;value=state.services.realTimeFn(state.services.context);if target!=void and len(value)>1 then target.sec=value[1];target.min=value[2];target.hour=value[3];target.mday=value[4];target.mon=value[5];target.year=value[6];target.wday=value[7];target.yday=value[8];target.isdst=value[9] end if;return value[0] end function

function findAllocation(zone,handle) if zone==void then return void end if;for each value in zone.allocations if value.handle==handle and not value.freed then return value end if end for;return void end function
function Z_ClearZone(zone,size) zone.capacity=size;zone.used=0;zone.nextHandle=1;zone.allocations=[];return void end function
function Z_AvailableZoneMemory(zone) if zone==void then return 0 end if;return zone.capacity-zone.used end function
function Z_AvailableMemory(state) return Z_AvailableZoneMemory(state.zone) end function
function Z_TagMallocDebug(state,size,tag,label,file,line)
  if state==void or size<0 or tag==TAG_FREE then return void end if;zone=state.zone;if size+zone.used>zone.capacity then return void end if;value=Allocation(zone.nextHandle,bytes(size,0),size,tag,false,HUNK_LOW,false,label);zone.nextHandle=zone.nextHandle+1;zone.used=zone.used+size;zone.allocations=zone.allocations+[value];return value
end function
function Z_TagMalloc(state,size,tag) return Z_TagMallocDebug(state,size,tag,"","",0) end function
function Z_MallocDebug(state,size,label,file,line) return Z_TagMallocDebug(state,size,TAG_GENERAL,label,file,line) end function
function Z_Malloc(state,size) return Z_MallocDebug(state,size,"","",0) end function
function S_MallocDebug(state,size,label,file,line) saved=state.zone;state.zone=state.smallZone;value=Z_TagMallocDebug(state,size,TAG_GENERAL,label,file,line);state.zone=saved;return value end function
function S_Malloc(state,size) return S_MallocDebug(state,size,"","",0) end function
function Z_Free(state,value)
  if state==void or value==void or value.freed then return false end if;value.freed=true;inMain=false;for each candidate in state.zone.allocations if candidate==value then inMain=true;break end if end for
  if inMain then state.zone.used=state.zone.used-value.size;if state.zone.used<0 then state.zone.used=0 end if else state.smallZone.used=state.smallZone.used-value.size;if state.smallZone.used<0 then state.smallZone.used=0 end if end if;return true
end function
function Z_FreeTags(state,tag) count=0;for each value in state.zone.allocations if not value.freed and value.tag==tag then Z_Free(state,value);count=count+1 end if end for;return count end function
function Z_CheckHeap(state) if state==void then return false end if;used=0;for each value in state.zone.allocations if not value.freed then used=used+value.size end if end for;return used==state.zone.used end function
function Z_LogZoneHeap(state,zone,name) result=[name,zone.used,zone.capacity,len(zone.allocations)];return result end function
function Z_LogHeap(state) return [Z_LogZoneHeap(state,state.zone,"MAIN"),Z_LogZoneHeap(state,state.smallZone,"SMALL")] end function
function CopyString(state,text) return decode(bytes(visible(text))) end function
function Com_InitSmallZoneMemory(state) state.smallZone=createZone(512*1024);return true end function
function Com_InitZoneMemory(state) state.zone=createZone(16*1024*1024);return true end function
function Com_Meminfo_f(state) return [state.zone.used,state.zone.capacity,state.smallZone.used,state.smallZone.capacity,state.hunk.lowPermanent,state.hunk.highPermanent,state.hunk.capacity] end function
function Com_TouchMemory(state) sum=0;for each value in state.zone.allocations if not value.freed and value.size>0 then for each byte in value.data sum=sum+byte end for end if end for;for each value in state.hunk.allocations if not value.freed and value.size>0 then for each byte in value.data sum=sum+byte end for end if end for;return sum end function

function Com_InitHunkMemory(state) if state==void then return false end if;state.hunk=createHunk(state.hunk.capacity);return true end function
function Hunk_MemoryRemaining(state) h=state.hunk;return h.capacity-(h.lowPermanent+h.highPermanent+h.lowTemp+h.highTemp) end function
function Hunk_SetMark(state) state.hunk.markLow=state.hunk.lowPermanent;state.hunk.markHigh=state.hunk.highPermanent;state.hunk.markHandle=state.hunk.nextHandle;return void end function
function Hunk_ClearToMark(state) h=state.hunk;h.lowPermanent=h.markLow;h.highPermanent=h.markHigh;for each value in h.allocations if not value.temporary and value.handle>=h.markHandle then value.freed=true end if end for;return void end function
function Hunk_CheckMark(state) return state.hunk.markLow!=0 or state.hunk.markHigh!=0 end function
function Hunk_Clear(state) state.hunk=createHunk(state.hunk.capacity);return void end function
function Hunk_SwapBanks(state)
  h=state.hunk
  if h.lowTemp>h.lowPermanent then h.permanentBank=HUNK_HIGH
  else if h.highTemp>h.highPermanent then h.permanentBank=HUNK_LOW
  else if h.lowPermanent>h.highPermanent then h.permanentBank=HUNK_HIGH
  else h.permanentBank=HUNK_LOW
  end if
  h.tempBank=HUNK_HIGH;if h.permanentBank==HUNK_HIGH then h.tempBank=HUNK_LOW end if;return h.permanentBank
end function
function Hunk_Alloc(state,size,preference) h=state.hunk;size=(size+31)&~31;if size>Hunk_MemoryRemaining(state) then return void end if;bank=preference;if bank!=HUNK_LOW and bank!=HUNK_HIGH then bank=Hunk_SwapBanks(state) end if;value=Allocation(h.nextHandle,bytes(size,0),size,TAG_GENERAL,false,bank,false,"");h.nextHandle=h.nextHandle+1;if bank==HUNK_LOW then h.lowPermanent=h.lowPermanent+size else h.highPermanent=h.highPermanent+size end if;h.allocations=h.allocations+[value];return value end function
function Hunk_AllocateTempMemory(state,size) h=state.hunk;size=(size+15)&~15;if size>Hunk_MemoryRemaining(state) then return void end if;Hunk_SwapBanks(state);bank=h.tempBank;value=Allocation(h.nextHandle,bytes(size,0),size,TAG_GENERAL,true,bank,false,"");h.nextHandle=h.nextHandle+1;if bank==HUNK_LOW then h.lowTemp=h.lowTemp+size else h.highTemp=h.highTemp+size end if;h.allocations=h.allocations+[value];return value end function
function Hunk_FreeTempMemory(state,value) if state==void or value==void or value.freed or not value.temporary then return false end if;value.freed=true;if value.bank==HUNK_LOW then state.hunk.lowTemp=state.hunk.lowTemp-value.size else state.hunk.highTemp=state.hunk.highTemp-value.size end if;return true end function
function Hunk_ClearTempMemory(state) state.hunk.lowTemp=0;state.hunk.highTemp=0;for each value in state.hunk.allocations if value.temporary then value.freed=true end if end for;return void end function
function Hunk_Log(state) return state.hunk.allocations end function
function Hunk_SmallLog(state) result=[];for each value in state.hunk.allocations if value.size<1024 and not value.freed then result=result+[value] end if end for;return result end function
function Hunk_Trash(state) return void end function

function Com_InitJournaling(state,mode,path) state.journalMode=mode;state.journalEvents=[];state.journalIndex=0;if path!=void then state.journalPath=path end if;if mode==2 and state.services.readFn!=void then loaded=state.services.readFn(state.services.context,state.journalPath);if loaded!=void then state.journalEvents=loaded end if end if;return mode end function
function Com_InitPushEvent(state) state.head=0;state.tail=0;state.pushed=array(MAX_PUSHED_EVENTS,void);return void end function
function Com_PushEvent(state,event) if state.head-state.tail>=MAX_PUSHED_EVENTS then state.tail=state.tail+1 end if;state.pushed[state.head&(MAX_PUSHED_EVENTS-1)]=event;state.head=state.head+1;return void end function
function Com_GetRealEvent(state)
  if state.journalMode==2 then if state.journalIndex>=len(state.journalEvents) then return SysEvent(Com_Milliseconds(state),0,0,0,void) end if;value=state.journalEvents[state.journalIndex];state.journalIndex=state.journalIndex+1;return value end if
  value=SysEvent(0,0,0,0,void);if state.services.realEventFn!=void then value=state.services.realEventFn(state.services.context) end if;if state.journalMode==1 then state.journalEvents=state.journalEvents+[value];state.journalDirty=true end if;return value
end function
function Com_GetEvent(state) if state.head>state.tail then value=state.pushed[state.tail&(MAX_PUSHED_EVENTS-1)];state.tail=state.tail+1;return value end if;return Com_GetRealEvent(state) end function
function Com_RunAndTimeServerPacket(state,address,data) if state.services.packetEventFn!=void then return state.services.packetEventFn(state.services.context,address,data,true) end if;return void end function
function Com_EventLoop(state,maxEvents)
  count=0;last=state.frameTime;while count<maxEvents event=Com_GetEvent(state);if event==void then break end if;if event.time>last then last=event.time end if;if event.type==0 then break end if;if event.type==5 and state.services.consoleEventFn!=void then state.services.consoleEventFn(state.services.context,event.data) else if event.type==6 and state.services.packetEventFn!=void then state.services.packetEventFn(state.services.context,event.value,event.data,false) end if;count=count+1 end while
  if state.networkPump!=void then network.drain(state.networkPump,maxEvents-count) end if;state.frameTime=last;return last
end function
function Com_Milliseconds(state) if state==void then return 0 end if;if state.services.clockFn!=void then return state.services.clockFn(state.services.context) end if;return state.frameTime end function

function padKey() return "                " end function
function validKey(state,key) if len(bytes(key))!=16 then return false end if;if state.services.validateKeyFn==void then return true end if;return state.services.validateKeyFn(state.services.context,key) end function
function readKey(state,filename)
  key=padKey()
  if state.services.readFn!=void then
    value=state.services.readFn(state.services.context,filename+"/q3key")
    if value!=void then
      data=bytes(value)
      if len(data)>=16 then candidate=decode(slice(data,0,16));if validKey(state,candidate) then key=candidate end if end if
    end if
  end if
  return key
end function
function Com_ReadCDKey(state,filename) key=readKey(state,filename);state.cdKey=key+decode(slice(bytes(state.cdKey),16,16));return key end function
function Com_AppendCDKey(state,filename) key=readKey(state,filename);state.cdKey=decode(slice(bytes(state.cdKey),0,16))+key;return key end function
function Com_WriteCDKey(state,filename,key) key=decode(slice(bytes(key),0,16));if not validKey(state,key) or state.services.writeFn==void then return false end if;return state.services.writeFn(state.services.context,filename+"/q3key",key+"\n// generated by quake, do not modify\r\n// Do not give this file to ANYONE.\r\n// id Software and Activision will NOT ask you to send this file to them.\r\n") end function
function Com_Init(state,commandLine) Com_InitPushEvent(state);Com_InitSmallZoneMemory(state);Com_ParseCommandLine(state,commandLine);Com_InitZoneMemory(state);Com_InitHunkMemory(state);if state.services.initFn!=void then state.services.initFn(state.services.context,state) end if;state.frameTime=Com_Milliseconds(state);Com_AddStartupCommands(state);state.fullyInitialized=true;return true end function
function Com_WriteConfigToFile(state,filename) if state.configState==void then return false end if;return config.writeConfigToFile(state.configState,filename) end function
function Com_WriteConfiguration(state) if state.configState==void then return false end if;return config.writeConfiguration(state.configState) end function
function Com_WriteConfig_f(state) if state.configState==void then return false end if;return config.writeConfigCommand(state.configState,state.commandState) end function
function Com_ModifyMsec(state,msec)
  if state.fixedTime!=0 then msec=state.fixedTime
  else if state.timescale!=0.0 then msec=n.trunc32(msec*state.timescale)
  else if state.cameraMode then msec=n.trunc32(msec*state.timescale)
  end if
  if msec<1 and state.timescale!=0.0 then msec=1 end if;clamp=5000;if state.svRunning and not state.dedicated then clamp=200 end if;if msec>clamp then msec=clamp end if;return msec
end function
function Com_Frame(state)
  Com_WriteConfiguration(state);minimum=1;if not state.dedicated and state.maxFps>0 and not state.timedemo then minimum=1000/state.maxFps end if;current=Com_EventLoop(state,1024);msec=current-state.lastTime;spins=0
  while msec<minimum and spins<100000 previous=current;current=Com_EventLoop(state,1024);if current<=previous then current=Com_Milliseconds(state) end if;if current<=previous then break end if;msec=current-state.lastTime;spins=spins+1 end while
  if msec<minimum then return false end if;state.lastTime=current;state.frameMsec=msec;msec=Com_ModifyMsec(state,msec);command.execute(state.commandState)
  if state.engineRuntime!=void then engine.serverTick(state.engineRuntime,current,msec);if not state.dedicated then Com_EventLoop(state,1024);command.execute(state.commandState);engine.clientTick(state.engineRuntime,current,msec) end if end if;state.frameNumber=state.frameNumber+1;return true
end function
function Com_Shutdown(state) if state==void or state.shutdown then return false end if;if state.journalMode==1 and state.journalDirty and state.services.writeFn!=void then state.services.writeFn(state.services.context,state.journalPath,state.journalEvents) end if;if state.services.shutdownFn!=void then state.services.shutdownFn(state.services.context,state) end if;state.shutdown=true;return true end function

function Com_Memcpy(destination,source,count) if count<0 or count>len(source) or count>len(destination) then return false end if;if count>0 then temp=slice(source,0,count);for i=0 to count-1 destination[i]=temp[i] end for end if;return true end function
function Com_Memset(destination,value,count) if count<0 or count>len(destination) then return false end if;if count>0 then for i=0 to count-1 destination[i]=value&255 end for end if;return true end function
function Com_Memcmp(left,right,count) if count<0 or count>len(left) or count>len(right) then return false end if;if count>0 then for i=0 to count-1 if left[i]!=right[i] then return false end if end for end if;return true end function
function _copyDWord(destination,constant,count) if count<0 or count>len(destination) then return false end if;if count>0 then for i=0 to count-1 destination[i]=constant end for end if;return true end function
function Com_Prefetch(source,count,type) return void end function
function Q_acos(value) angle=n.f32(acos(value));if angle>3.141592653589793 or angle<(-3.141592653589793) then return n.f32(3.141592653589793) end if;return angle end function

function Field_Clear(edit) edit.buffer="";edit.cursor=0;edit.scroll=0;return void end function
function FindMatches(state,value) if not samePrefix(value,state.completionString,len(bytes(state.completionString)),false) then return false end if;state.matchCount=state.matchCount+1;if state.matchCount==1 then state.shortestMatch=value;return true end if;left=bytes(state.shortestMatch);right=bytes(value);count=len(left);if len(right)<count then count=len(right) end if;common=0;while common<count and lower(left[common])==lower(right[common]) common=common+1 end while;state.shortestMatch=decode(slice(left,0,common));return true end function
function PrintMatches(state,value) if samePrefix(value,state.shortestMatch,len(bytes(state.shortestMatch)),false) then Com_Printf(state,"    "+value+"\n");return true end if;return false end function
function quoteArg(value) for each ch in bytes(value) if ch==32 then return "\""+value+"\"" end if end for;return value end function
function keyConcatArgs(state) result="";if command.argc(state.commandState)>1 then for i=1 to command.argc(state.commandState)-1 result=result+" "+quoteArg(command.argv(state.commandState,i)) end for end if;state.completionField.buffer=state.completionField.buffer+result;return result end function
function ConcatRemaining(state,source,start) data=bytes(source);needle=bytes(start);at=-1;if len(needle)==0 then at=0 else if len(data)>=len(needle) then for i=0 to len(data)-len(needle) if decode(slice(data,i,len(needle)))==start then at=i+len(needle);break end if end for end if;if at<0 then return keyConcatArgs(state) end if;text=decode(slice(data,at,len(data)-at));state.completionField.buffer=state.completionField.buffer+text;return text end function
function Field_CompleteCommand(state,field,commandNames,cvarNames)
  state.completionField=field;command.tokenizeString(state.commandState,field.buffer);value=command.argv(state.commandState,0);if len(value)>0 and (bytes(value)[0]==92 or bytes(value)[0]==47) then value=decode(slice(bytes(value),1,len(bytes(value))-1)) end if;state.completionString=value;state.shortestMatch="";state.matchCount=0;if len(value)==0 then return 0 end if
  for each candidate in commandNames FindMatches(state,candidate) end for;for each candidate in cvarNames FindMatches(state,candidate) end for;if state.matchCount==0 then return 0 end if;original=field.buffer;field.buffer="\\"+state.shortestMatch;if state.matchCount==1 and command.argc(state.commandState)==1 then field.buffer=field.buffer+" " else ConcatRemaining(state,original,value) end if;field.cursor=len(bytes(field.buffer));if state.matchCount>1 then Com_Printf(state,"]"+field.buffer+"\n");for each candidate in commandNames PrintMatches(state,candidate) end for;for each candidate in cvarNames PrintMatches(state,candidate) end for end if;return state.matchCount
end function
function permanent(state,size,preference) return Hunk_Alloc(state,size,preference) end function
