import mq3.client.cgame_console_commands as cg
import mq3.qcommon.command_buffer as commands
import mq3.qcommon.cvar as cvar

function req(ok,label) if not ok then return error(7814,"cgame console commands: "+label) end if;return 1 end function
function has(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function
function hasAction(runtime,kind,name) for each action in runtime.actions if action.kind==kind and action.name==name then return true end if end for;return false end function

function main(args)
  count=0;registry=cvar.create();runtime=cg.createRuntime(registry,false,false)
  count=count+req(cg.CG_InitConsoleCommands(runtime)==50 and len(runtime.registeredCommands)==50,"base and server registration count")
  count=count+req(has(runtime.registeredCommands,"loaddeferred") and has(runtime.registeredCommands,"loaddefered") and has(runtime.registeredCommands,"teamtask"),"original registration spellings")
  commands.tokenizeString(runtime.commandState,"SIZEDOWN extra");count=count+req(cg.Cmd_Argv(runtime,0)=="SIZEDOWN" and cg.Cmd_Argv(runtime,1)=="extra","Cmd_Argv token state")
  runtime.state.viewsize=100;count=count+req(cg.CG_ConsoleCommand(runtime) and cvar.find(registry,"cg_viewsize").string=="90","case insensitive size dispatch")
  runtime.actions=[];commands.tokenizeString(runtime.commandState,"unknown tail");count=count+req(not cg.CG_ConsoleCommand(runtime) and len(runtime.actions)==0,"unknown command")
  commands.tokenizeString(runtime.commandState,"testmodel models/a.md3");count=count+req(cg.CG_ConsoleCommand(runtime) and runtime.actions[0].kind=="delegate" and runtime.actions[0].text=="models/a.md3","delegated command and args")
  runtime.actions=[];runtime.targetNum=0;commands.tokenizeString(runtime.commandState,"tcmd 12");cg.CG_TargetCommand_f(runtime);count=count+req(len(runtime.actions)==0,"target zero quirk")
  runtime.targetNum=-1;cg.CG_TargetCommand_f(runtime);count=count+req(runtime.actions[0].text=="gc -1 12","target minus one quirk")
  runtime.actions=[];runtime.targetNum=3;commands.tokenizeString(runtime.commandState,"tell_target hello arena");cg.CG_TellTarget_f(runtime);count=count+req(runtime.actions[0].text=="tell 3 hello arena","tell target")
  runtime.actions=[];runtime.attackerNum=7;commands.tokenizeString(runtime.commandState,"vtell_attacker incoming");cg.CG_VoiceTellAttacker_f(runtime);count=count+req(runtime.actions[0].text=="vtell 7 incoming","voice tell attacker")
  runtime.actions=[];runtime.viewOrigin=[1.9,-2.9,3.0];runtime.viewYaw=91.8;cg.CG_Viewpos_f(runtime);count=count+req(runtime.actions[0].text=="(1 -2 3) : 91\n","view position truncation")
  runtime.actions=[];runtime.time=2001;runtime.state.numScores=8;cg.CG_ScoresDown_f(runtime);count=count+req(runtime.state.showScores and runtime.state.numScores==0 and runtime.state.scoresRequestTime==2001 and runtime.actions[0].text=="score","fresh scores")
  runtime.actions=[];runtime.time=2100;cg.CG_ScoresUp_f(runtime);count=count+req(not runtime.state.showScores and runtime.state.scoreFadeTime==2100,"score fade")
  runtime.actions=[];cvar.set2(registry,"developer","1",true);runtime.state.cameraOrbit=0.0;cg.CG_StartOrbit_f(runtime);count=count+req(len(runtime.actions)==4 and runtime.actions[0].name=="cg_cameraOrbit" and runtime.actions[3].text=="100","orbit enable")
  silentRegistry=cvar.create();silent=cg.createRuntime(silentRegistry,false,true);silent.state.viewsize=100;commands.tokenizeString(silent.commandState,"sizeup");cg.CG_ConsoleCommand(silent);count=count+req(cvar.find(silentRegistry,"cg_viewsize")==void and not silent.actions[0].dispatched,"retail suppression")

  missionRegistry=cvar.create();mission=cg.createRuntime(missionRegistry,true,false);count=count+req(cg.CG_InitConsoleCommands(mission)==74 and has(mission.registeredCommands,"taskEscort") and has(mission.registeredCommands,"scoresUp"),"missionpack registration")
  mission.actions=[];cvar.set2(missionRegistry,"cg_hudFiles","",true);commands.tokenizeString(mission.commandState,"loadhud");cg.CG_ConsoleCommand(mission);count=count+req(mission.state.hudFile=="ui/hud.txt" and mission.actions[0].kind=="load","hud fallback")
  mission.actions=[];mission.state.scoreboardShowing=true;cg.CG_scrollScoresDown_f(mission);count=count+req(len(mission.actions)==3 and mission.actions[0].text2=="down","three scoreboard feeders")
  mission.actions=[];cg.CG_spWin_f(mission);count=count+req(len(mission.actions)==7 and hasAction(mission,"buffered-sound","winner"),"single player win presentation")
  mission.state.teamPlayerCount=3;mission.state.selectedPlayer=0;cg.CG_PrevTeamMember_f(mission);count=count+req(mission.state.selectedPlayer==2,"previous team member wraps")
  mission.state.currentOrder=cg.TEAMTASK_FOLLOW;mission.state.teamLeader=true;mission.state.otherTeamHasFlag=false;mission.state.yourTeamHasFlag=false;mission.time=500;cg.CG_NextOrder_f(mission);count=count+req(mission.state.currentOrder==cg.TEAMTASK_CAMP and mission.state.orderPending and mission.state.orderTime==3500,"order skips unavailable flag tasks")
  mission.actions=[];mission.state.acceptLeader=2;mission.state.acceptTask=cg.TEAMTASK_DEFENSE;mission.state.acceptOrderTime=1000;mission.time=900;cg.CG_ConfirmOrder_f(mission);count=count+req(len(mission.actions)==3 and mission.actions[2].text=="teamtask 2\n" and mission.state.acceptOrderTime==0,"confirm active order")
  mission.actions=[];mission.state.gametype=cg.GT_CTF;cg.CG_TaskOffense_f(mission);count=count+req(mission.actions[0].text=="cmd vsay_team ongetflag\n" and mission.actions[1].text=="teamtask 1\n","ctf offense voice")
  mission.actions=[];cg.CG_TauntGauntlet_f(mission);count=count+req(mission.actions[0].text=="cmd vsay kill_guantlet\n","original gauntlet spelling")
  mission.actions=[];mission.targetNum=4;cg.CG_TaskSuicide_f(mission);count=count+req(mission.actions[0].text=="tell 4 suicide","task suicide target")
  mission.actions=[];commands.tokenizeString(mission.commandState,"camera intro.camera");mission.cameraLoadSucceeded=true;mission.time=1234;cg.CG_Camera_f(mission);count=count+req(mission.cameraMode and mission.cameraStartTime==1234 and len(mission.actions)==2,"dormant camera semantics")
  mission.actions=[];mission.keyCatcher=1;cg.CG_TeamMenu_f(mission);cg.CG_EditHud_f(mission);count=count+req(mission.keyCatcher==0 and mission.eventHandling==2,"dormant menu semantics")
  print("PASS: "+str(count)+" Cgame console command contracts");return 0
end function
