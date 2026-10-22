import mq3.client.ui_atoms_missionpack as atoms
import mq3.client.ui_syscalls_missionpack as ui
import mq3.compat.numeric as n

struct Host argv cvars files fileIndex stage mode writes calls config internalActions end struct
function req(ok,label) if not ok then return error(7831,"Missionpack UI atoms: "+label) end if;return 1 end function
function findPair(values,name) if len(values)>0 then for index=0 to len(values)-1 if values[index][0]==name then return index end if end for end if;return -1 end function
function variable(host,name) index=findPair(host.cvars,name);if index<0 then return "" end if;return host.cvars[index][1] end function
function syscall(host,opcode,args)
  host.calls=host.calls+[[opcode,args]]
  if opcode==ui.UI_ARGC then return len(host.argv)
  else if opcode==ui.UI_ARGV then if args[0]>=0 and args[0]<len(host.argv) then args[1][0]=host.argv[args[0]] else args[1][0]="" end if;return 0
  else if opcode==ui.UI_CVAR_VARIABLESTRINGBUFFER then args[1][0]=variable(host,args[0]);return 0
  else if opcode==ui.UI_CVAR_VARIABLEVALUE then text=variable(host,args[0]);if text=="" then return 0 end if;return n.floatBits(toNumber(text))
  else if opcode==ui.UI_CVAR_SET then index=findPair(host.cvars,args[0]);if index<0 then host.cvars=host.cvars+[[args[0],args[1]]] else host.cvars[index][1]=args[1] end if;return 0
  else if opcode==ui.UI_GETCONFIGSTRING then args[1][0]=host.config;return 1
  else if opcode==ui.UI_FS_FOPENFILE then
    host.stage=0;host.mode=args[2];host.fileIndex=findPair(host.files,args[0]);args[1][0]=77
    if args[2]==atoms.FS_READ and host.fileIndex<0 then return -1 end if;return 64
  else if opcode==ui.UI_FS_READ then
    if host.stage==0 then args[0][0]=atoms.POSTGAME_INFO_SIZE else args[0][0]=host.files[host.fileIndex][1] end if;host.stage=host.stage+1;return 0
  else if opcode==ui.UI_FS_WRITE then if host.stage==1 then host.writes=host.writes+[[host.fileIndex,args[0][0]]] end if;host.stage=host.stage+1;return 0
  else if opcode==ui.UI_FS_GETFILELIST then args[2][0]=["one.game","two.game"];return 2
  else if opcode==ui.UI_R_REGISTERSHADERNOMIP then return 55
  else if opcode==ui.UI_CM_LERPTAG then return 1 end if
  return 0
end function
function captureInternal(host,kind,args) host.internalActions=host.internalActions+[[kind,args]];return 1 end function
function lastOp(host) return host.calls[len(host.calls)-1][0] end function
function sample(score,time) value=atoms.postGameInfo();value.score=score;value.time=time;value.redScore=2;value.blueScore=0;return value end function

function main(args)
  old=sample(100,70);host=Host(["ui_report","x","x","75","2","3","4","5","6","200","1","5","0","65000","7"],[["protocol","68"],["ui_matchStartTime","5000"],["g_spSkill","2"],["ui_saveCaptureLimit","8"],["ui_saveFragLimit","20"],["ui_drawTimer","1"],["ui_doWarmup","0"],["ui_Warmup","10"],["ui_pure","1"],["ui_friendlyFire","0"]],[["games/q3dm1_4.game",old],["demos/q3dm1_4.dm_68",void]],-1,0,0,[],[],"\\mapname\\q3dm1\\g_gametype\\4",[])
  sys=ui.dllEntry(syscall,host);state=atoms.create(sys);atoms.setInternalHandler(state,host,captureInternal);atoms.setDisplayContext(state,2.0,0.5,50,70,9);count=0
  atoms.Com_Error(state,1,"fatal");count=count+req(lastOp(host)==ui.UI_ERROR,"Com_Error")
  atoms.Com_Printf(state,"hello");count=count+req(lastOp(host)==ui.UI_PRINT,"Com_Printf")
  count=count+req(atoms.UI_ClampCvar(1.0,3.0,0.0)==1.0 and atoms.UI_ClampCvar(1.0,3.0,2.0)==2.0 and atoms.UI_ClampCvar(1.0,3.0,4.0)==3.0,"Clamp")
  atoms.UI_StartDemoLoop(state);count=count+req(lastOp(host)==ui.UI_CMD_EXECUTETEXT and host.calls[len(host.calls)-1][1][1]=="d1\n","demo loop")
  before=len(host.calls);atoms.NeedCDAction(state,true);atoms.NeedCDKeyAction(state,false);count=count+req(len(host.calls)==before+1 and host.calls[len(host.calls)-1][1][1]=="quit\n","CD callbacks")
  count=count+req(atoms.UI_Argv(state,0)=="ui_report" and atoms.UI_Cvar_VariableString(state,"protocol")=="68","argv and cvar buffers")
  score=sample(321,125);score.accuracy=77;score.captures=4;atoms.UI_SetBestScores(state,score,true);count=count+req(variable(host,"ui_scoreAccuracy")=="77%" and variable(host,"ui_scoreTime")=="02:05" and variable(host,"ui_scoreCaptures2")=="4","best score cvars")
  loaded=atoms.UI_LoadBestScores(state,"q3dm1",4);count=count+req(loaded.score==100 and state.demoAvailable and variable(host,"ui_scoreScore")=="100","load score and versioned demo")
  cleared=atoms.UI_ClearScores(state);count=count+req(cleared==2 and len(host.writes)>=2 and variable(host,"ui_scoreScore")=="0","clear score files")
  atoms.UI_Cache_f(state);count=count+req(host.internalActions[len(host.internalActions)-1][0]=="display-cache-all","display cache")
  state.realtime=1000;state.timeToBeat[4]=90;host.argv[0]="postgame";result=atoms.UI_CalcPostGameStats(state);count=count+req(result.time==60 and result.timeBonus==300 and result.shutoutBonus==100 and result.score==1200,"postgame score calculation")
  count=count+req(variable(host,"capturelimit")=="8" and variable(host,"g_friendlyFire")=="0" and variable(host,"ui_scoreScore2")=="1200","postgame cvar restore")
  count=count+req(state.newHighScoreTime==21000 and host.internalActions[len(host.internalActions)-1][0]=="show-postgame","postgame high score/menu")
  host.argv=["ui_report"];count=count+req(atoms.UI_ConsoleCommand(state,2000) and state.frametime==1000 and host.internalActions[len(host.internalActions)-1][0]=="report","report command")
  host.argv=["ui_load"];count=count+req(atoms.UI_ConsoleCommand(state,2050) and host.internalActions[len(host.internalActions)-1][0]=="load","load command")
  host.argv=["remapShader","old","new","0.5"];count=count+req(atoms.UI_ConsoleCommand(state,2100) and lastOp(host)==ui.UI_R_REMAP_SHADER,"remap command")
  host.argv=["ui_cache"];count=count+req(atoms.UI_ConsoleCommand(state,2150) and host.internalActions[len(host.internalActions)-1][0]=="display-cache-all","cache command")
  host.argv=["ui_teamOrders"];count=count+req(atoms.UI_ConsoleCommand(state,2200),"team order command")
  host.argv=["ui_cdkey"];count=count+req(atoms.UI_ConsoleCommand(state,2250),"CD-key command")
  host.argv=["unknown"];count=count+req(not atoms.UI_ConsoleCommand(state,2300),"unknown command")
  before=len(host.calls);atoms.UI_Shutdown(state);count=count+req(len(host.calls)==before,"shutdown no-op")
  adjusted=atoms.UI_AdjustFrom640(state,1.0,2.0,3.0,4.0);count=count+req(adjusted[0]==2.0 and adjusted[1]==1.0 and adjusted[2]==6.0 and adjusted[3]==2.0,"display-context scaling")
  atoms.UI_DrawNamedPic(state,1.0,2.0,3.0,4.0,"pic");count=count+req(lastOp(host)==ui.UI_R_DRAWSTRETCHPIC,"named picture")
  flipped=atoms.UI_DrawHandlePic(state,1.0,2.0,-3.0,-4.0,5);count=count+req(flipped[4]==1.0 and flipped[5]==1.0 and flipped[6]==0.0 and flipped[7]==0.0,"handle flip")
  atoms.UI_FillRect(state,1.0,2.0,3.0,4.0,[1.0,0.0,0.0,1.0]);count=count+req(lastOp(host)==ui.UI_R_SETCOLOR,"fill color reset")
  before=len(host.calls);atoms.UI_DrawSides(state,1.0,2.0,3.0,4.0);count=count+req(len(host.calls)==before+2,"draw sides")
  before=len(host.calls);atoms.UI_DrawTopBottom(state,1.0,2.0,3.0,4.0);count=count+req(len(host.calls)==before+2,"draw top/bottom")
  before=len(host.calls);atoms.UI_DrawRect(state,1.0,2.0,3.0,4.0,[1.0,1.0,1.0,1.0]);count=count+req(len(host.calls)==before+6,"draw rect")
  atoms.UI_SetColor(state,[1.0,1.0,1.0,1.0]);count=count+req(lastOp(host)==ui.UI_R_SETCOLOR,"set color")
  atoms.UI_UpdateScreen(state);count=count+req(lastOp(host)==ui.UI_UPDATESCREEN,"update screen")
  before=len(host.calls);atoms.UI_DrawTextBox(state,2,3,4,5);count=count+req(len(host.calls)==before+9,"text box")
  count=count+req(atoms.UI_CursorInRect(state,50,70,0,0) and atoms.UI_CursorInRect(state,0,0,50,70) and not atoms.UI_CursorInRect(state,51,70,10,10),"cursor rectangle")
  print("PASS: "+str(count)+" Missionpack UI atoms contracts");return 0
end function



