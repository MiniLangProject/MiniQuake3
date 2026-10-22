import mq3.server.operator_commands as op
import mq3.format.pk3 as pk3
struct Context spawns end struct
function req(ok,label) if not ok then return error(7841,"Retail server operator commands: "+label) end if;return 1 end function
function host(context,action) if action.kind=="spawn" then context.spawns=context.spawns+[[action.target,action.values[0]]] end if;return void end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;dm1=pk3.read(archive,"maps/q3dm1.bsp");if dm1 is error then return dm1 end if;dm17=pk3.read(archive,"maps/q3dm17.bsp");if dm17 is error then return dm17 end if
  context=Context([]);state=op.create();op.setHost(state,context,host);state.running=true;state.dedicated=true;state.maxclients=1;state.mapFiles=["maps/q3dm1.bsp","maps/q3dm17.bsp"];state.cvars=[["g_doWarmup","0"]];count=0
  state.args=["map","q3dm1"];count=count+req(op.SV_Map_f(state) and state.mapname=="q3dm1" and len(dm1)>100000,"Retail q3dm1 spawn")
  state.args=["devmap","q3dm17"];count=count+req(op.SV_Map_f(state) and op.cvar(state,"sv_cheats","")=="1" and context.spawns[1][1] and len(dm17)>100000,"Retail devmap spawn")
  state.args=["map","not_a_retail_map"];count=count+req(not op.SV_Map_f(state),"missing Retail map guard")
  count=count+req(op.SV_AddOperatorCommands(state)==17 and state.commandNames[11]=="map" and state.commandNames[12]=="devmap","operator map registration")
  state.mapname="q3dm1";text=op.SV_Status_f(state);count=count+req(text=="map: q3dm1\nnum score ping name            lastmsg address               qport rate\n--- ----- ---- --------------- ------- --------------------- ----- -----\n\n","empty Retail server status")
  state.args=["map_restart","5"];state.time=12000;state.frameTime=13000;count=count+req(op.SV_MapRestart_f(state) and state.restartTime==17000,"Retail server scheduled restart")
  print("PASS: "+str(count)+" Retail server operator probes q3dm1="+str(len(dm1))+" q3dm17="+str(len(dm17)));return 0
end function
