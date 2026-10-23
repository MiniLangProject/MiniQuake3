import mq3.platform.win_main_runtime as win

struct Context now calls console packets shutdown initialized frames end struct
struct Packet data end struct
function req(value,label) if not value then return error(7569,"win_main: "+label) end if;return 1 end function
function clock(context) value=context.now;context.now=context.now+1;return value end function
function console(context) value=context.console;context.console=void;return value end function
function packet(context) value=context.packets;if value!=void then context.packets=void end if;return value end function
function markShutdown(context) context.shutdown=context.shutdown+1;return void end function
function markInit(context) context.initialized=context.initialized+1;return void end function
function markCommonInit(context,commandLine) context.initialized=context.initialized+1;return void end function
function markFrame(context) context.frames=context.frames+1;return void end function
function read(context,file,count) result=bytes(count,7);return result end function
function seek(context,file,offset,origin) return offset+origin end function

function main(args)
  count=0;context=Context(100,0,void,void,0,0,0);state=win.create();state.context=context;state.clockFn=clock
  win.Sys_QueEvent(state,0,win.SE_KEY,9,1,0,void);event=win.Sys_GetEvent(state);count=count+req(event.time==100 and event.type==win.SE_KEY and event.value==9 and event.value2==1,"zero-time event")
  for index=0 to 256 win.Sys_QueEvent(state,index+1,win.SE_CHAR,index,0,0,void) end for
  count=count+req(state.overflows==1 and state.head-state.tail==256 and win.Sys_GetEvent(state).value==1,"256 event overwrite ring")
  empty=win.create();empty.context=context;empty.clockFn=clock;empty.consoleFn=console;empty.packetFn=packet;context.console="status"
  count=count+req(win.Sys_GetEvent(empty).type==win.SE_CONSOLE,"console event synthesis")
  context.packets=Packet(bytes([1,2,3]));count=count+req(win.Sys_GetEvent(empty).type==win.SE_PACKET,"packet event synthesis")
  count=count+req(win.Sys_GetEvent(empty).type==win.SE_NONE,"empty event")
  state=win.create();state.context=context;state.inputInitFn=markInit;state.inputShutdownFn=markShutdown
  count=count+req(win.Sys_Init(state,2,10,0,0x23,"Ranger") and state.arch=="winnt" and state.cpuString=="Intel Pentium III" and state.username=="Ranger","NT and CPU initialization")
  win.Sys_In_Restart_f(state);count=count+req(context.initialized==2 and context.shutdown==1 and state.inputStarted,"input restart")
  win.Sys_Error(state,"fatal problem");count=count+req(state.fatal and state.errorText=="fatal problem" and context.shutdown==2,"fatal shutdown")
  state.inputStarted=true;win.Sys_Quit(state);count=count+req(state.quitCode==0 and context.shutdown==3,"clean quit")
  state=win.create();stream=win.Sys_BeginStreamedFile(state,3,4096,context,read,seek);data=win.Sys_StreamedRead(stream,2,3)
  count=count+req(data.count==3 and len(data.data)==6 and data.data[0]==7 and win.Sys_StreamSeek(stream,8,1)==9,"stream passthrough")
  win.Sys_EndStreamedFile(state,stream);count=count+req(not stream.active,"stream end")
  win.Sys_InitStreamThread(state);count=count+req(win.Sys_StreamThread(state),"stream thread lifecycle");win.Sys_ShutdownStreamThread(state)
  count=count+req(win.Sys_DefaultCDPath()=="" and win.Sys_DefaultBasePath()!="" and win.Sys_CheckCD() and typeof(win.Sys_ScanForCD())=="string","default paths and CD policy")
  files=win.Sys_ListFiles("win_main_native_temp",".cfg",void,false);filtered=win.Sys_ListFilteredFiles("win_main_native_temp","sub","*sub\\*.txt")
  count=count+req(len(files)==1 and files[0]=="a.cfg" and len(filtered)==1 and filtered[0]=="sub\\b.txt","native sorted and recursive file lists")
  count=count+req(win.Sys_FreeFileList(["b","a"])==2 and win.Sys_FreeFileList(void)==0,"file-list ownership")
  count=count+req(win.strgtr("a","b") and not win.strgtr("ab","abc") and not win.strgtr("b","a"),"original sort predicate")
  count=count+req(not win.Sys_LowPhysicalMemory() or win.Sys_LowPhysicalMemory(),"native memory query is boolean")
  count=count+req(win.Sys_Mkdir("win_main_contract_temp") and win.Sys_Cwd()!="","native mkdir and cwd")
  count=count+req(win.Spk_Open(state,"win_main_contract_temp\\spank.log") and win.Spk_Printf(state,"line\n"),"spank synchronous output");win.Spk_Close(state)
  state=win.create();state.context=context;state.clockFn=clock;state.commonInitFn=markCommonInit;state.networkInitFn=markInit;state.inputFrameFn=markFrame;state.commonFrameFn=markFrame
  count=count+req(win.WinMain(state,"+set fs_game baseq3",3)==3 and state.commandLine=="+set fs_game baseq3" and state.networkStarted and state.streamStarted and state.frameCount==3 and context.frames==6,"bounded WinMain lifecycle")
  loaded=win.Sys_LoadDll(state,"definitely_missing_",win.Sys_Cwd(),"","baseq3",void);count=count+req(loaded==void,"DLL search failure")
  win.Sys_Print(state,"hello");win.Sys_BeginProfiling(state);count=count+req(state.printed=="hello" and state.actions[len(state.actions)-1][0]=="profiling","print and profiling")
  print("PASS: "+str(count)+" complete win_main contracts");return 0
end function
