import mq3.client.cl_cgame_runtime as cl
import mq3.game.entitystate as entitystate
import mq3.compat.numeric as n
struct Cmd serverTime angles buttons weapon forwardmove rightmove upmove end struct
function main(args)
  state=cl.create(void,void,void,void,void);state.gameState[17]=23;state.glconfig[9]=42
  print "copies|"+str(cl.CL_GetGameState(state)[17])+"|"+str(cl.CL_GetGlconfig(state)[9])
  state.cmdNumber=70;cmd=Cmd(321,[1,2,3],4,5,6,7,8);state.commands[69&63]=cmd
  fresh=cl.CL_GetUserCmd(state,69);stale=cl.CL_GetUserCmd(state,6);print "cmd|"+str(fresh.found)+"|"+str(n.readI32(fresh.data,0))+"|"+str(stale.found)+"|"+str(cl.CL_GetCurrentCmdNumber(state))
  state.snapshots.entityState.parseEntitiesNum=2100;e=entitystate.create();e.number=77;state.snapshots.entityState.parseEntities[2099&2047]=e;freshEntity=cl.CL_GetParseEntityState(state,2099);oldEntity=cl.CL_GetParseEntityState(state,52);print "entity|"+str(freshEntity.found)+"|"+str(freshEntity.value.number)+"|"+str(oldEntity.found)
  state.snapshots.snap.messageNum=11;state.snapshots.snap.serverTime=2222;pair=cl.CL_GetCurrentSnapshotNumber(state);print "snapshot|"+str(pair.number)+"|"+str(pair.serverTime)
  cl.CL_SetUserCmdValue(state,9,1.25);print "set|"+str(state.usercmd.weapon)+"|"+str(cl.FloatAsInt(state.usercmd.sensitivity))+"|"+str(cl.FloatAsInt(n.bitsFloat(-2147483648)));return 0
end function
