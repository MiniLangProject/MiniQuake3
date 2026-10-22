import mq3.server.operator_commands as op
import std.string as strings
struct Context events deny end struct
function req(ok,label) if not ok then return error(7840,"server operator commands: "+label) end if;return 1 end function
function stringsContains(text,part) return strings.indexOf(text,part,0)>=0 end function
function host(context,action) context.events=context.events+[[action.kind,action.target,action.text,action.values]];if action.kind=="client-connect" then return context.deny end if;if action.kind=="resolve-authorize" then return [op.NA_IP,[10,20,30,40]] end if;return void end function
function make()
  context=Context([],"");state=op.create();op.setHost(state,context,host);state.running=true;state.dedicated=true;state.maxclients=4;state.mapFiles=["maps/q3dm1.bsp","maps/q3dm2.bsp"];state.clients=[op.client(op.CS_ACTIVE,"^1Alice",op.NA_IP,"1.2.3.4:27960",[1,2,3,4],1234,25000,50,900,12),op.client(op.CS_ACTIVE,"Host",op.NA_LOOPBACK,"loopback",[127,0,0,1],0,25000,0,950,2),op.client(op.CS_ACTIVE,"Bot",op.NA_BOT,"bot",[0,0,0,0],0,25000,0,1000,4),op.client(op.CS_FREE,"",op.NA_BAD,"",[0,0,0,0],0,0,0,0,0)];state.time=1000;state.frameTime=2000;state.serverId=100;state.mapname="q3dm1";state.cvars=[["g_doWarmup","0"],["mapname","q3dm1"],["serverinfo","\\hostname\\Arena"],["systeminfo","\\sv_serverid\\100"]];return [state,context]
end function
function actionCount(state,kind) count=0;for each action in state.actions if action.kind==kind then count=count+1 end if end for;return count end function
function main(args)
  pair=make();state=pair[0];context=pair[1];count=0
  state.args=["status","x"];count=count+req(op.Cmd_Argv(state,0)=="status" and op.Cmd_Argv(state,9)=="","Cmd_Argv")
  state.args=["map","missing"];count=count+req(not op.SV_Map_f(state) and state.prints[len(state.prints)-1]=="Can't find map maps/missing.bsp\n","missing map")
  state.args=["map","q3dm1"];count=count+req(op.SV_Map_f(state) and op.cvar(state,"sv_cheats","")=="0" and actionCount(state,"spawn")==1,"map")
  state.args=["devmap","q3dm2"];count=count+req(op.SV_Map_f(state) and op.cvar(state,"sv_cheats","")=="1" and state.actions[len(state.actions)-2].values[0],"devmap")
  state.args=["spmap","q3dm1"];count=count+req(op.SV_Map_f(state) and state.gametype==op.GT_SINGLE_PLAYER and op.cvar(state,"sv_maxclients","")=="8","spmap")
  state.gametype=op.GT_SINGLE_PLAYER;state.args=["map","q3dm2"];op.SV_Map_f(state);count=count+req(state.gametype==op.GT_FFA and op.cvar(state,"g_gametype","")=="0","single player reset")
  state.frameTime=state.serverId;state.args=["map_restart","0"];count=count+req(not op.SV_MapRestart_f(state),"same-frame restart guard")
  state.frameTime=3000;state.running=false;count=count+req(not op.SV_MapRestart_f(state) and state.prints[len(state.prints)-1]=="Server is not running.\n","restart running guard")
  state.running=true;state.restartTime=1;count=count+req(not op.SV_MapRestart_f(state),"restart pending guard")
  state.restartTime=0;state.args=["map_restart","3"];count=count+req(op.SV_MapRestart_f(state) and state.restartTime==4000 and state.configstrings[len(state.configstrings)-1][1]=="4000","scheduled restart")
  slow=make()[0];slow.args=["map_restart","0"];slow.maxclientsModified=true;count=count+req(op.SV_MapRestart_f(slow) and actionCount(slow,"spawn")==1,"latched slow restart")
  fastPair=make();fast=fastPair[0];fast.args=["map_restart","0"];fast.clients[1].state=op.CS_FREE;count=count+req(op.SV_MapRestart_f(fast) and fast.serverId==2000 and fast.snapFlag==op.SNAPFLAG_SERVERCOUNT and fast.time==1400,"fast restart state")
  count=count+req(fast.clients[0].state==op.CS_ACTIVE and actionCount(fast,"run-frame")==4 and actionCount(fast,"client-command")==2 and actionCount(fast,"enter-world")==2,"fast restart clients")
  deniedPair=make();denied=deniedPair[0];deniedPair[1].deny="denied";denied.args=["map_restart","0"];op.SV_MapRestart_f(denied);count=count+req(denied.clients[0].state==op.CS_ZOMBIE and actionCount(denied,"drop-client")>=1,"restart denial")
  kick=make()[0];kick.args=["kick","Alice"];count=count+req(op.SV_Kick_f(kick) and kick.clients[0].state==op.CS_ZOMBIE,"kick clean name")
  all=make()[0];all.args=["kick","all"];op.SV_Kick_f(all);count=count+req(all.clients[0].state==op.CS_ZOMBIE and all.clients[1].state==op.CS_ACTIVE and all.clients[2].state==op.CS_ZOMBIE,"kick all protects host")
  bots=make()[0];bots.args=["kick","allbots"];op.SV_Kick_f(bots);count=count+req(bots.clients[2].state==op.CS_ZOMBIE and bots.clients[0].state==op.CS_ACTIVE,"kick all bots")
  hostKick=make()[0];hostKick.args=["clientkick","1"];count=count+req(not op.SV_KickNum_f(hostKick) and actionCount(hostKick,"broadcast")==1,"kick host denied")
  bad=make()[0];bad.args=["clientkick","x"];count=count+req(not op.SV_KickNum_f(bad) and bad.prints[len(bad.prints)-1]=="Bad slot number: x\n","bad numeric slot")
  banPair=make();ban=banPair[0];ban.authorizeType=op.NA_IP;ban.authorizeIp=[9,9,9,9];ban.args=["banUser","Alice"];count=count+req(op.SV_Ban_f(ban) and actionCount(ban,"out-of-band")==1,"ban by name")
  resolvePair=make();resolve=resolvePair[0];resolve.authorizeType=op.NA_IP;resolve.authorizeIp=[0,0,0,0];resolve.args=["banClient","2"];count=count+req(op.SV_BanNum_f(resolve) and resolve.authorizeIp[0]==10 and actionCount(resolve,"resolve-authorize")==1,"ban resolve and number")
  status=make()[0];text=op.SV_Status_f(status);count=count+req(stringsContains(text,"map: q3dm1") and stringsContains(text,"^1Alice^7") and stringsContains(text,"1.2.3.4:27960"),"status table")
  chat=make()[0];chat.args=["say","hello","world"];chat.rawArgs="\"hello world\"";count=count+req(op.SV_ConSay_f(chat) and chat.actions[len(chat.actions)-1].text=="chat \"console: hello world\n\"","console say")
  state.nextHeartbeat=10;count=count+req(op.SV_Heartbeat_f(state)==-9999999,"heartbeat")
  before=len(state.actions);op.SV_Serverinfo_f(state);op.SV_Systeminfo_f(state);count=count+req(len(state.actions)==before+4 and state.actions[len(state.actions)-1].text=="\\sv_serverid\\100","info commands")
  dump=make()[0];dump.clients[0].userinfo="\\name\\Alice\\rate\\25000";dump.args=["dumpuser","Alice"];count=count+req(op.SV_DumpUser_f(dump) and dump.actions[len(dump.actions)-1].kind=="info-print","dump user")
  killed=make()[0];op.SV_KillServer_f(killed);count=count+req(not killed.running and killed.actions[len(killed.actions)-1].kind=="shutdown","kill server")
  registry=make()[0];registered=op.SV_AddOperatorCommands(registry);count=count+req(registered==17 and registry.commandNames[16]=="say" and op.SV_AddOperatorCommands(registry)==0,"operator registration")
  count=count+req(op.SV_RemoveOperatorCommands(registry)==0 and len(registry.commandNames)==17,"operator removal original no-op")
  print("PASS: "+str(count)+" server operator-command contracts");return 0
end function
