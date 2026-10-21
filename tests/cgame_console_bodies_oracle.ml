import mq3.client.cgame_console_commands as cgcmd
import mq3.qcommon.command_buffer as commands
import mq3.qcommon.cvar as cvar

function joined(values)
  text="";first=true;for each value in values if not first then text=text+";" end if;text=text+value;first=false end for;return text
end function
function pairs(values) text="";first=true;for each value in values if not first then text=text+";" end if;text=text+value[0]+"="+value[1];first=false end for;return text end function
function boolInt(value) if value then return 1 end if;return 0 end function
function row(tag,effect,state) print(tag+"|"+joined(effect.consoleCommands)+"|"+joined(effect.clientCommands)+"|"+pairs(effect.cvarSets)+"|"+joined(effect.prints)+"|"+str(boolInt(state.showScores))+"|"+str(state.numScores)+"|"+str(state.scoresRequestTime)+"|"+str(state.scoreFadeTime));return void end function
function main(args)
  registry=cvar.create();commandState=commands.create();state=cgcmd.create()
  commands.tokenizeString(commandState,"tcmd 12345");row("tcmd0",cgcmd.targetCommand(commandState,0),state);row("tcmd7",cgcmd.targetCommand(commandState,7),state)
  effect=cgcmd.result(true);effect.cvarSets=cgcmd.sizeUpState(state).cvarSets+cgcmd.sizeDownState(state).cvarSets;row("sizes",effect,state)
  row("viewpos",cgcmd.viewpos([1.9,-2.9,3.0],91.8),state)
  state.numScores=9;row("scores1",cgcmd.scoresDown(state,2001),state)
  effect=cgcmd.scoresDown(state,2100);up=cgcmd.scoresUp(state,2100);effect.clientCommands=effect.clientCommands+up.clientCommands;row("scores2",effect,state)
  commands.tokenizeString(commandState,"tell_target hello arena");effect=cgcmd.tellTarget(commandState,3);other=cgcmd.voiceTellTarget(commandState,3);effect.clientCommands=effect.clientCommands+other.clientCommands;row("telltarget",effect,state)
  effect=cgcmd.tellAttacker(commandState,5);other=cgcmd.voiceTellAttacker(commandState,5);effect.clientCommands=effect.clientCommands+other.clientCommands;row("tellattacker",effect,state)
  cvar.set2(registry,"developer","0",true);state.cameraOrbit=0.0;row("orbit0",cgcmd.startOrbitState(registry,state),state)
  cvar.set2(registry,"developer","1",true);row("orbiton",cgcmd.startOrbitState(registry,state),state)
  state.cameraOrbit=2.0;row("orbitoff",cgcmd.startOrbitState(registry,state),state)
  return 0
end function
