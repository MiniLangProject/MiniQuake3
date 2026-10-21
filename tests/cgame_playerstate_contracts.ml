import mq3.client.cgame_playerstate as subject
import mq3.game.playerstate as playerstate
function req(ok,text) if not ok then print("FAIL: "+text);return 1 end if;return 0 end function
function has(state,kind,value) for each action in state.actions if action[0]==kind and action[1]==value then return true end if end for;return false end function
function fresh() p=playerstate.create();p.stats[subject.STAT_HEALTH]=100;return p end function
function main(args)
  count=0;state=subject.create();p=fresh();p.stats[subject.STAT_WEAPONS]=1<<subject.WP_MACHINEGUN;p.ammo[subject.WP_MACHINEGUN]=25;subject.checkAmmo(state,p);count=count+req(state.lowAmmoWarning==0,"ample ammo")
  p.ammo[subject.WP_MACHINEGUN]=4;subject.checkAmmo(state,p);count=count+req(state.lowAmmoWarning==1 and has(state,"localSound",subject.S_NO_AMMO),"low ammo transition")
  p.ammo[subject.WP_MACHINEGUN]=0;before=len(state.actions);subject.checkAmmo(state,p);count=count+req(state.lowAmmoWarning==2 and len(state.actions)==before+1,"empty ammo transition")
  old=fresh();p=fresh();p.externalEvent=21;p.externalEventParm=7;p.clientNum=3;p.eventSequence=2;p.events=[31,32];p.eventParms=[4,5];subject.checkPlayerstateEvents(state,p,old);count=count+req(has(state,"entityEvent",21) and state.eventSequence==2,"external and predictable events")
  state.eventSequence=2;state.predictableEvents[1]=99;p.eventSequence=2;p.events=[31,32];subject.checkChangedPredictableEvents(state,p);count=count+req(has(state,"changedPredicted",32),"changed predicted correction")
  old=fresh();p=fresh();p.persistant[subject.PERS_HITS]=1;subject.checkLocalSounds(state,p,old);count=count+req(has(state,"localSound",subject.S_HIT),"hit sound")
  old.persistant[subject.PERS_HITS]=2;p.persistant[subject.PERS_HITS]=1;subject.checkLocalSounds(state,p,old);count=count+req(has(state,"localSound",subject.S_HIT_TEAM),"team hit sound")
  old=fresh();p=fresh();old.stats[subject.STAT_HEALTH]=100;p.stats[subject.STAT_HEALTH]=75;subject.checkLocalSounds(state,p,old);count=count+req(has(state,"pain",75),"pain event")
  old=fresh();p=fresh();p.persistant[subject.PERS_CAPTURES]=2;p.persistant[subject.PERS_IMPRESSIVE_COUNT]=3;p.persistant[subject.PERS_EXCELLENT_COUNT]=4;p.persistant[subject.PERS_GAUNTLET_FRAG_COUNT]=5;p.persistant[subject.PERS_DEFEND_COUNT]=6;p.persistant[subject.PERS_ASSIST_COUNT]=7;subject.checkLocalSounds(state,p,old);count=count+req(state.rewardStack==6 and state.rewardCount[1]==2 and state.rewardCount[6]==7,"reward stack")
  old=fresh();p=fresh();p.persistant[subject.PERS_PLAYEREVENTS]=subject.PLAYEREVENT_DENIEDREWARD;subject.checkLocalSounds(state,p,old);count=count+req(has(state,"localSound",subject.S_DENIED),"denied reward")
  old=fresh();p=fresh();state.gametype=subject.GT_TEAM;p.powerups[subject.PW_REDFLAG]=900;subject.checkLocalSounds(state,p,old);count=count+req(has(state,"localSound",subject.S_YOU_HAVE_FLAG),"flag pickup")
  old=fresh();p=fresh();state.gametype=0;old.persistant[subject.PERS_RANK]=1;p.persistant[subject.PERS_RANK]=0;subject.checkLocalSounds(state,p,old);count=count+req(has(state,"bufferedSound",subject.S_TAKEN_LEAD),"lead change")
  old=fresh();p=fresh();state.time=301000;state.levelStartTime=0;state.timelimit=10;subject.checkLocalSounds(state,p,old);count=count+req(state.timelimitWarnings==1 and has(state,"localSound",subject.S_FIVE_MINUTE),"five minute warning")
  state.time=541000;subject.checkLocalSounds(state,p,old);count=count+req(state.timelimitWarnings==3 and has(state,"localSound",subject.S_ONE_MINUTE),"one minute warning")
  state.time=602001;subject.checkLocalSounds(state,p,old);count=count+req(state.timelimitWarnings==7 and has(state,"localSound",subject.S_SUDDEN_DEATH),"sudden death warning")
  state.gametype=0;state.fraglimit=10;state.scores1=7;subject.checkLocalSounds(state,p,old);count=count+req(state.fraglimitWarnings==1 and has(state,"bufferedSound",subject.S_THREE_FRAG),"three frag warning")
  state.scores1=8;subject.checkLocalSounds(state,p,old);count=count+req(state.fraglimitWarnings==3 and has(state,"bufferedSound",subject.S_TWO_FRAG),"two frag warning")
  state.scores1=9;subject.checkLocalSounds(state,p,old);count=count+req(state.fraglimitWarnings==7 and has(state,"bufferedSound",subject.S_ONE_FRAG),"one frag warning")
  old=fresh();p=fresh();state.time=1000;state.serverTime=990;p.damageEvent=1;p.damageCount=9;p.damageYaw=255;p.damagePitch=255;p.persistant[subject.PERS_SPAWN_COUNT]=1;p.weapon=7;p.viewheight=12;old.viewheight=26;subject.transitionPlayerState(state,p,old);count=count+req(state.damageValue>0.0 and state.weaponSelect==7 and state.duckChange== -14,"damage respawn duck transition")
  old=fresh();p=fresh();old.clientNum=1;p.clientNum=2;p.damageEvent=1;p.damageCount=8;before=len(state.actions);subject.transitionPlayerState(state,p,old);count=count+req(state.thisFrameTeleport and len(state.actions)==before,"follow switch suppresses transition effects")
  old=fresh();p=fresh();state.mapRestart=true;p.weapon=5;subject.transitionPlayerState(state,p,old);count=count+req(not state.mapRestart and state.weaponSelect==5,"map restart respawn")
  old=fresh();p=fresh();p.persistant[subject.PERS_TEAM]=subject.TEAM_SPECTATOR;p.persistant[subject.PERS_HITS]=2;before=len(state.actions);subject.transitionPlayerState(state,p,old);count=count+req(not has(state,"localSound",subject.S_HIT) or len(state.actions)==before,"spectator skips local sounds")
  stack=subject.create();for index=0 to 20 subject.pushReward(stack,1,2,index) end for;count=count+req(stack.rewardStack==subject.MAX_REWARDSTACK-1 and stack.rewardCount[9]==8,"reward stack bound")
  if count!=0 then return count end if;print("PASS: 23 playerstate contracts");return 0
end function
