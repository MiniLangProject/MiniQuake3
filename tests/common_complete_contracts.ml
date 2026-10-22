import mq3.qcommon.common as common
import mq3.qcommon.command_buffer as command
import mq3.qcommon.cvar as cvar
import mq3.qcommon.config_persistence as config

struct Host prints flushes errors quits clock events files init shutdown end struct
struct Time sec min hour mday mon year wday yday isdst end struct
struct Var flags end struct
function req(ok,label) if not ok then return error(7570,"common contract: "+label) end if;return 1 end function
function printFn(h,text) h.prints=h.prints+[text];return void end function
function flushFn(h,text) h.flushes=h.flushes+[text];return void end function
function errorFn(h,value) h.errors=h.errors+[[value.code,value.message,value.fatal]];return void end function
function quitFn(h) h.quits=h.quits+1;return void end function
function clockFn(h) value=h.clock;h.clock=h.clock+10;return value end function
function realTimeFn(h) return [1234,5,4,3,2,1,126,6,7,0] end function
function realEventFn(h) if len(h.events)==0 then return common.SysEvent(clockFn(h),0,0,0,void) end if;value=h.events[0];rest=[];if len(h.events)>1 then for i=1 to len(h.events)-1 rest=rest+[h.events[i]] end for end if;h.events=rest;return value end function
function readFn(h,path) for each pair in h.files if pair[0]==path then return pair[1] end if end for;return void end function
function writeFn(h,path,data) h.files=h.files+[[path,data]];return true end function
function validKey(h,key) return len(bytes(key))==16 and key!="0000000000000000" end function
function initFn(h,state) h.init=h.init+1;return void end function
function shutdownFn(h,state) h.shutdown=h.shutdown+1;return void end function
function setVar(s,name,value) return void end function
function getVar(s,name,value,flags) return Var(0) end function
function configWrite(h,path,text) return writeFn(h,path,text) end function
function bindings(h) return "bind w \"+forward\"\n" end function

function main(args)
  host=Host([],[],[],0,1000,[],[],0,0);services=common.services(host);services.printFn=printFn;services.errorFn=errorFn;services.quitFn=quitFn;services.clockFn=clockFn;services.realTimeFn=realTimeFn;services.realEventFn=realEventFn;services.readFn=readFn;services.writeFn=writeFn;services.validateKeyFn=validKey;services.initFn=initFn;services.shutdownFn=shutdownFn;commands=command.create();state=common.create(services,commands);checks=0
  common.Com_Printf(state,"hello");checks=checks+req(host.prints==["hello"],"normal print")
  common.Com_BeginRedirect(state,8,flushFn,host);common.Com_Printf(state,"abcd");common.Com_Printf(state,"efgh");common.Com_EndRedirect(state);checks=checks+req(host.flushes==["abcd","efgh"],"redirect overflow and final flush")
  state.developer=false;common.Com_DPrintf(state,"hidden");state.developer=true;common.Com_DPrintf(state,"debug");checks=checks+req(host.prints[len(host.prints)-1]=="debug","developer print")
  state.startupState.cvarSetFn=setVar;state.startupState.cvarGetFn=getVar;common.Com_ParseCommandLine(state,"+set developer 1 +safe +map q3dm1");checks=checks+req(len(state.startupState.lines)==4 and common.Com_SafeMode(state),"startup parse and safe mode");common.Com_StartupVariable(state,void);checks=checks+req(common.Com_AddStartupCommands(state),"startup commands")
  checks=checks+req(common.Com_StringContains("AbCdEf","cde",false)==2 and common.Com_StringContains("abc","D",false)==(-1),"substring search")
  checks=checks+req(common.Com_Filter("maps/*.bsp","maps/q3dm1.bsp",false) and common.Com_Filter("foo?bar","fooXbar",true) and not common.Com_Filter("a[0-3]","a9",true),"wildcard filter")
  checks=checks+req(common.Com_FilterPath("maps\\*.bsp","maps:q3dm1.bsp",false),"path normalization")
  checks=checks+req(common.Com_HashKey("abc",3)==35312,"hash key")
  lines=common.Info_Print(state,"\\name\\value\\missing");checks=checks+req(len(lines)==2 and lines[1]=="missing             MISSING VALUE\n","info printer")
  time=Time(0,0,0,0,0,0,0,0,0);checks=checks+req(common.Com_RealTime(state,time)==1234 and time.year==126 and time.yday==7,"real time host projection")
  allocation=common.Z_Malloc(state,32);checks=checks+req(allocation!=void and state.zone.used==32 and common.Z_AvailableMemory(state)==state.zone.capacity-32,"zone allocation");checks=checks+req(common.Z_CheckHeap(state) and common.Z_Free(state,allocation) and state.zone.used==0,"zone free and heap check")
  a=common.Z_TagMalloc(state,8,common.TAG_BOTLIB);b=common.Z_TagMalloc(state,12,common.TAG_BOTLIB);checks=checks+req(common.Z_FreeTags(state,common.TAG_BOTLIB)==2 and common.Z_CheckHeap(state),"tag free")
  checks=checks+req(common.CopyString(state,"123")=="123","copy string")
  state.hunk=common.createHunk(256);low=common.Hunk_Alloc(state,33,common.HUNK_LOW);checks=checks+req(low.size==64 and state.hunk.lowPermanent==64 and common.Hunk_MemoryRemaining(state)==192,"permanent hunk alignment");common.Hunk_SetMark(state);common.Hunk_Alloc(state,16,common.HUNK_HIGH);common.Hunk_ClearToMark(state);checks=checks+req(state.hunk.highPermanent==0 and common.Hunk_CheckMark(state),"hunk mark restore")
  temp=common.Hunk_AllocateTempMemory(state,17);checks=checks+req(temp.size==32 and common.Hunk_FreeTempMemory(state,temp),"temporary hunk lifecycle");common.Hunk_ClearTempMemory(state);checks=checks+req(state.hunk.lowTemp==0 and state.hunk.highTemp==0,"temporary hunk clear")
  checks=checks+req(len(common.Com_Meminfo_f(state))==7 and len(common.Z_LogHeap(state))==2,"memory reports")
  destination=bytes(4,0);checks=checks+req(common.Com_Memcpy(destination,bytes([1,2,3,4]),4) and common.Com_Memcmp(destination,bytes([1,2,3,4]),4),"memory copy/compare");common.Com_Memset(destination,9,3);checks=checks+req(destination==bytes([9,9,9,4]),"memory set");values=[0,0,0];common._copyDWord(values,7,3);checks=checks+req(values==[7,7,7],"dword fill")
  common.Com_InitPushEvent(state);common.Com_PushEvent(state,common.SysEvent(10,1,2,3,"x"));checks=checks+req(common.Com_GetEvent(state).data=="x","pushed event FIFO")
  common.Com_InitJournaling(state,1,"events.jrn");host.events=[common.SysEvent(20,1,4,5,"record")];checks=checks+req(common.Com_GetRealEvent(state).data=="record" and len(state.journalEvents)==1,"journal record");state.journalMode=2;state.journalIndex=0;checks=checks+req(common.Com_GetRealEvent(state).value==4,"journal replay")
  host.files=host.files+[["baseq3/q3key","ABCDEFGHIJKLMNOP\n"]];checks=checks+req(common.Com_ReadCDKey(state,"baseq3")=="ABCDEFGHIJKLMNOP","CD key read");checks=checks+req(common.Com_WriteCDKey(state,"baseq3","ABCDEFGHIJKLMNOP"),"CD key write")
  state.fixedTime=0;state.timescale=0.5;checks=checks+req(common.Com_ModifyMsec(state,10)==5,"timescale");state.timescale=1.0;state.svRunning=true;checks=checks+req(common.Com_ModifyMsec(state,500)==200,"local server clamp");state.dedicated=true;checks=checks+req(common.Com_ModifyMsec(state,6000)==5000,"dedicated clamp")
  field=common.Field("",7,3);common.Field_Clear(field);checks=checks+req(field.buffer=="" and field.cursor==0 and field.scroll==0,"field clear");field.buffer="/ma";checks=checks+req(common.Field_CompleteCommand(state,field,["map","map_restart"],["maxfps"])==3 and field.buffer=="\\ma","multiple completion")
  field.buffer="/map";checks=checks+req(common.Field_CompleteCommand(state,field,["map"],[])==1 and field.buffer=="\\map ","single completion")
  checks=checks+req(common.Q_acos(1.0)==0.0,"acos wrapper")
  registry=cvar.create();cfgHost=config.services();cfgHost.context=host;cfgHost.writeFn=configWrite;cfgHost.bindingTextFn=bindings;cfg=config.create(registry,cfgHost);cfg.fullyInitialized=true;state.configState=cfg;cvar.get(registry,"name","player",cvar.ARCHIVE);checks=checks+req(common.Com_WriteConfigToFile(state,"x.cfg"),"config write adapter")
  state.journalMode=0;state.dedicated=true;state.lastTime=1000;host.events=[common.SysEvent(1100,0,0,0,void)];checks=checks+req(common.Com_Frame(state) and state.frameMsec==100 and state.frameNumber==1,"outer common frame")
  common.Com_Init(state,"+set x y");checks=checks+req(state.fullyInitialized and host.init==1,"common init lifecycle")
  state.lastErrorTime=0;failure=common.Com_Error(state,common.ERR_DROP,"drop");checks=checks+req(failure.code==common.ERR_DROP and not failure.fatal and len(host.errors)==1,"drop error transition")
  checks=checks+req(common.Com_Shutdown(state) and host.shutdown==1 and not common.Com_Shutdown(state),"idempotent shutdown")
  print("PASS: "+str(checks)+" complete common runtime contracts");return 0
end function
