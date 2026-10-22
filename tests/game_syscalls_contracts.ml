import mq3.game.syscalls as traps
import mq3.game.syscall_qagame_host as qhost
import mq3.vm.syscall_common as common
import mq3.vm.syscall_qagame as qagame
import mq3.compat.numeric as n

struct Capture opcode arguments result end struct
struct Vm data mask end struct
struct Timer milliseconds extendedOpcode seekArgs end struct

function hostCall(value,opcode,arguments) value.opcode=opcode;value.arguments=arguments;return value.result end function
function milliseconds(value) return value.milliseconds end function
function seek(value,handle,offset,origin) value.seekArgs=[handle,offset,origin];return 23 end function
function extended(value,vm,base,opcode) value.extendedOpcode=opcode;return 29 end function
function req(ok,text) if not ok then print("FAIL: "+text);return 1 end if;return 0 end function
function fresh(result) value=Capture(0,[],result);return [traps.dllEntry(hostCall,value),value] end function

function main(args)
  failures=0
  failures=failures+req(traps.PASSFLOAT(1.5)==0x3fc00000 and traps.PASSFLOAT(-2.25)==-1072693248,"PASSFLOAT preserves binary32 bits")
  failures=failures+req(traps.promotedFloatLow(1.5)==0 and traps.promotedFloatLow(1.1)==-1610612736,"original promoted-float ABI quirk is explicit")
  pair=fresh(77);binding=pair[0];capture=pair[1];failures=failures+req(traps.trap_Milliseconds(binding)==77 and capture.opcode==traps.G_MILLISECONDS and capture.arguments==[],"engine return wrapper")
  result=traps.trap_Printf(binding,4096);failures=failures+req(result==void and capture.opcode==traps.G_PRINT and capture.arguments==[4096],"engine pointer wrapper")
  failures=failures+req(traps.trap_Argv(binding,3,8192,64)==void and capture.opcode==traps.G_ARGV and capture.arguments==[3,8192,64],"command output ABI order")
  failures=failures+req(traps.trap_FS_FOpenFile(binding,100,104,2)==77 and capture.opcode==traps.G_FS_FOPEN_FILE and capture.arguments==[100,104,2],"filesystem open ABI")
  failures=failures+req(traps.trap_FS_Seek(binding,4,-12,2)==77 and capture.opcode==traps.G_FS_SEEK and capture.arguments==[4,-12,2],"filesystem seek signed offset")
  failures=failures+req(traps.trap_Cvar_Register(binding,100,200,300,4)==void and capture.opcode==traps.G_CVAR_REGISTER and capture.arguments==[100,200,300,4],"cvar register pointers and flags")
  failures=failures+req(traps.trap_LocateGameData(binding,1000,64,128,2000,1024)==void and capture.opcode==traps.G_LOCATE_GAME_DATA and capture.arguments==[1000,64,128,2000,1024],"game-data layout ABI")
  failures=failures+req(traps.trap_Trace(binding,4,8,12,16,20,24,28)==void and capture.opcode==traps.G_TRACE and capture.arguments==[4,8,12,16,20,24,28],"world trace pointer order")
  failures=failures+req(traps.trap_TraceCapsule(binding,4,8,12,16,20,24,28)==void and capture.opcode==traps.G_TRACECAPSULE,"capsule trace opcode")
  failures=failures+req(traps.trap_EntityContactCapsule(binding,8,12,16)==77 and capture.opcode==traps.G_ENTITY_CONTACTCAPSULE,"capsule contact opcode")
  failures=failures+req(traps.trap_BotLibSetup(binding)==77 and capture.opcode==traps.BOTLIB_SETUP,"botlib setup opcode")
  failures=failures+req(traps.trap_BotLibStartFrame(binding,1.5)==77 and capture.arguments==[0x3fc00000],"botlib frame float bits")
  failures=failures+req(traps.trap_BotLibUpdateEntity(binding,7,900)==77 and capture.opcode==traps.BOTLIB_UPDATENTITY and capture.arguments==[7,900],"botlib entity pointer")
  failures=failures+req(traps.trap_AAS_PredictRoute(binding,1,2,3,4,5,6,7,8,9,10,11)==77 and capture.opcode==traps.BOTLIB_AAS_PREDICT_ROUTE and len(capture.arguments)==11 and capture.arguments[10]==11,"AAS predict-route full ABI")
  failures=failures+req(traps.trap_AAS_PredictClientMovement(binding,1,2,3,4,5,6,7,8,9,1.5,11,12,13)==77 and capture.arguments[9]==0x3fc00000 and capture.arguments[12]==13,"AAS movement frame-time bits")
  floatPair=fresh(0x3fc00000);failures=failures+req(traps.trap_AAS_Time(floatPair[0])==1.5 and floatPair[1].opcode==traps.BOTLIB_AAS_TIME,"AAS float result bits")
  failures=failures+req(traps.trap_EA_Move(binding,2,300,1.5)==void and capture.opcode==traps.BOTLIB_EA_MOVE and capture.arguments==[2,300,0x3fc00000],"EA move speed bits")
  failures=failures+req(traps.trap_EA_GetInput(binding,2,1.5,500)==void and capture.arguments==[2,0x3fc00000,500],"EA input think-time bits")
  failures=failures+req(traps.trap_BotLoadCharacter(binding,700,1.5)==77 and capture.opcode==traps.BOTLIB_AI_LOAD_CHARACTER and capture.arguments==[700,0x3fc00000],"AI character skill bits")
  failures=failures+req(traps.trap_Characteristic_BFloat(floatPair[0],4,5,-2.25,1.5)==1.5 and floatPair[1].arguments==[4,5,-1072693248,0x3fc00000],"AI bounded characteristic float ABI")
  failures=failures+req(traps.trap_BotInitialChat(binding,1,2,3,4,5,6,7,8,9,10,11)==void and capture.opcode==traps.BOTLIB_AI_INITIAL_CHAT and len(capture.arguments)==11,"AI initial-chat var slots")
  failures=failures+req(traps.trap_BotReplyChat(binding,1,2,3,4,5,6,7,8,9,10,11,12)==77 and capture.opcode==traps.BOTLIB_AI_REPLY_CHAT and len(capture.arguments)==12,"AI reply-chat var slots")
  failures=failures+req(traps.trap_BotChooseNBGItem(binding,1,2,3,4,5,1.5)==77 and capture.arguments[5]==0x3fc00000,"AI NBG max-time bits")
  failures=failures+req(traps.trap_BotMutateGoalFuzzyLogic(binding,1,1.5)==void and capture.arguments==[1,0],"original mutate fuzzy raw-float DLL quirk")
  failures=failures+req(traps.trap_BotAddAvoidSpot(binding,1,2,1.5,3)==void and capture.arguments==[1,2,0x3fc00000,3],"AI avoid radius bits")
  failures=failures+req(traps.trap_PC_ReadToken(binding,4,800)==77 and capture.opcode==traps.BOTLIB_PC_READ_TOKEN and capture.arguments==[4,800],"parser token pointer ABI")
  failures=failures+req(traps.trap_PC_SourceFileAndLine(binding,4,800,900)==77 and capture.opcode==traps.BOTLIB_PC_SOURCE_FILE_AND_LINE,"parser source-line opcode")
  failures=failures+req(len(binding.calls)==25 and binding.calls[0].opcode==traps.G_MILLISECONDS and binding.calls[24].opcode==traps.BOTLIB_PC_SOURCE_FILE_AND_LINE,"binding records every completed host call")
  failures=failures+req(try(traps.trap_Milliseconds(traps.dllEntry(void,void))) is error,"missing syscall entry fails")
  failureCapture=Capture(0,[],error(7862,"host failure"));failures=failures+req(try(traps.trap_BotLibSetup(traps.dllEntry(hostCall,failureCapture))) is error,"host errors propagate")
  timer=Timer(31337,0,[]);shared=common.services(void,void,timer);shared.millisecondsFn=milliseconds;server=qagame.services(shared,timer);server.seekFn=seek;server.extendedFn=extended;vm=Vm(bytes(256,0),255);qbinding=qhost.bind(server,vm,64)
  failures=failures+req(traps.trap_Milliseconds(qbinding)==31337,"native wrapper reaches existing qagame common dispatcher")
  failures=failures+req(traps.trap_FS_Seek(qbinding,4,-12,2)==23 and timer.seekArgs==[4,-12,2],"native wrapper reaches server-specific qagame dispatcher")
  failures=failures+req(traps.trap_BotLibSetup(qbinding)==29 and timer.extendedOpcode==traps.BOTLIB_SETUP,"native wrapper reaches existing extended botlib host")
  failures=failures+req(try(traps.trap_Printf(qbinding,"not-an-address")) is error,"QVM adapter requires explicit VM pointer addresses")
  tiny=Vm(bytes(8,0),7);tinyBinding=qhost.bind(server,tiny,8);failures=failures+req(try(traps.trap_Milliseconds(tinyBinding)) is error,"QVM adapter validates argument vector")
  if failures!=0 then return failures end if;print("PASS: 37 native game syscall contracts (185 symbols)");return 0
end function
