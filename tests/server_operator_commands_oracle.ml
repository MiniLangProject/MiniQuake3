import mq3.server.operator_commands as op
struct Context events end struct
function flag(value) if value then return 1 end if;return 0 end function
function host(context,action)
  if action.kind=="spawn" then context.events=context.events+"spawn:"+action.target+":"+str(flag(action.values[0]))+";"
  else if action.kind=="set" and action.target=="sv_cheats" then context.events=context.events+"cvar:sv_cheats="+action.text+";"
  else if action.kind=="set" and action.target=="sv_maxclients" then context.events=context.events+"latched:sv_maxclients="+action.text+";"
  else if action.kind=="broadcast" then context.events=context.events+"send:all:"+action.text+";"
  else if action.kind=="set-configstring" then context.events=context.events+"config:"+action.target+"="+action.text+";"
  else if action.kind=="drop-client" then context.events=context.events+"drop:"+action.target+":"+action.text+";"
  else if action.kind=="register" then context.events=context.events+"add:"+action.target+";" end if;return void
end function
function setup(context) state=op.create();op.setHost(state,context,host);state.running=true;state.dedicated=true;state.maxclients=4;state.clients=[op.client(op.CS_FREE,"",op.NA_BAD,"",[0,0,0,0],0,0,0,0,0),op.client(op.CS_FREE,"",op.NA_BAD,"",[0,0,0,0],0,0,0,0,0),op.client(op.CS_FREE,"",op.NA_BAD,"",[0,0,0,0],0,0,0,0,0),op.client(op.CS_FREE,"",op.NA_BAD,"",[0,0,0,0],0,0,0,0,0)];state.mapFiles=["maps/q3dm1.bsp","maps/q3dm2.bsp","maps/q3dm3.bsp"];state.time=1000;state.serverState=op.SS_GAME;state.frameTime=2000;state.mapname="q3dm1";return state end function
function main(args)
  context=Context("");state=setup(context);state.nextHeartbeat=123;op.SV_Heartbeat_f(state);print("heart|"+str(state.nextHeartbeat))
  state.args=["map","q3dm1"];op.SV_Map_f(state);print("map|"+context.events+"|"+op.cvar(state,"sv_cheats",""));context.events=""
  state.args=["devmap","q3dm2"];op.SV_Map_f(state);print("dev|"+context.events+"|"+op.cvar(state,"sv_cheats",""));context.events=""
  state.args=["spmap","q3dm3"];op.SV_Map_f(state);print("sp|"+context.events+"|"+op.cvar(state,"sv_cheats","")+"|"+str(state.gametype));context.events=""
  state.args=["say","hello"];state.rawArgs="\"hello world\"";op.SV_ConSay_f(state);print("say|"+context.events);context.events="";state.rawArgs=""
  state.args=["map_restart","3"];op.SV_MapRestart_f(state);print("restart|"+str(state.restartTime)+"|"+context.events);context.events=""
  value=state.clients[1];value.name="Player";value.state=op.CS_ACTIVE;value.addressType=op.NA_IP;state.args=["clientkick","1"];op.SV_KickNum_f(state);print("kick|"+str(value.state)+"|"+str(value.lastPacketTime)+"|"+context.events);context.events=""
  op.SV_AddOperatorCommands(state);print("commands|"+context.events);return 0
end function

