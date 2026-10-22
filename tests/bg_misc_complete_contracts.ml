import mq3.game.bg_misc_runtime as bg
import mq3.game.constants as c
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.game.trajectory as trajectory

struct GrabEntity
  s
end struct

function require(value,message)
  if not value then print "FAIL " + message; return 1 end if
  return 0
end function

function main(args)
  failures = 0; checks = 0
  failures=failures+require(bg.BG_FindItemForWeapon(c.WP_ROCKET_LAUNCHER,false)==12,"base weapon lookup");checks=checks+1
  failures=failures+require(bg.BG_FindItemForWeapon(11,true)==49,"missionpack weapon lookup");checks=checks+1
  failures=failures+require(bg.BG_FindItemForHoldable(c.HI_MEDKIT,false)==27,"holdable lookup");checks=checks+1
  failures=failures+require(bg.BG_FindItemForPowerup(c.PW_QUAD,false)==28,"powerup lookup");checks=checks+1
  failures=failures+require(bg.BG_FindItemForPowerup(c.PW_NEUTRALFLAG,true)==46,"neutral flag lookup");checks=checks+1
  failures=failures+require(bg.BG_FindItem("rOcKeT lAuNcHeR",false)==12,"ASCII case-insensitive pickup lookup");checks=checks+1
  failures=failures+require(bg.BG_FindItem("Proximity Mines",true)==40,"missionpack pickup lookup");checks=checks+1
  failures=failures+require(bg.BG_FindItem("Proximity Mines",false)==0,"base table termination");checks=checks+1

  player = ps.create(); player.stats[c.STAT_MAX_HEALTH]=100; player.stats[c.STAT_HEALTH]=100
  bg.BG_AddPredictableEventToPlayerstate(31,7,player)
  failures=failures+require(player.eventSequence==1 and player.events[0]==31 and player.eventParms[0]==7,"predictable event ring");checks=checks+1

  tr = trajectory.Trajectory(c.TR_LINEAR,1000,0,[1.0,2.0,3.0],[10.0,-20.0,30.0])
  position = bg.BG_EvaluateTrajectory(tr,1500); delta = bg.BG_EvaluateTrajectoryDelta(tr,1500)
  failures=failures+require(position==[6.0,-8.0,18.0] and delta==[10.0,-20.0,30.0],"trajectory facade");checks=checks+1
  item = es.create(); item.pos=trajectory.Trajectory(c.TR_STATIONARY,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0])
  player.origin=[44.0,36.0,-36.0]
  failures=failures+require(bg.BG_PlayerTouchesItem(player,item,0),"item contact inclusive bounds");checks=checks+1

  grabState=es.create();grabState.modelindex=12;grab=GrabEntity(grabState)
  failures=failures+require(bg.BG_CanItemBeGrabbed(0,grab,player),"weapon pickup");checks=checks+1

  player.clientNum=7;player.origin=[1.75,-2.25,3.9];player.velocity=[4.0,5.0,6.0];player.stats[c.STAT_HEALTH]=100
  state=es.create();bg.BG_PlayerStateToEntityState(player,state,true)
  failures=failures+require(state.number==7 and state.pos.trType==c.TR_INTERPOLATE and state.pos.trBase==[1.0,-2.0,3.0],"playerstate snapshot");checks=checks+1
  extra=es.create();bg.BG_PlayerStateToEntityStateExtraPolate(player,extra,1234,false)
  failures=failures+require(extra.pos.trType==c.TR_LINEAR_STOP and extra.pos.trTime==1234 and extra.pos.trDuration==50,"playerstate extrapolation");checks=checks+1

  jump=es.create();jump.number=19;jump.origin2=[400.0,0.0,400.0];player.pm_type=c.PM_NORMAL;player.powerups[c.PW_FLIGHT]=0
  bg.BG_TouchJumpPad(player,jump)
  slot=(player.eventSequence-1)&1
  failures=failures+require(player.jumppad_ent==19 and player.velocity==jump.origin2 and player.events[slot]==c.EV_JUMP_PAD,"jump pad facade");checks=checks+1

  if failures!=0 then return 1 end if
  print "PASS: " + str(checks) + " complete bg_misc contracts"
  return 0
end function
