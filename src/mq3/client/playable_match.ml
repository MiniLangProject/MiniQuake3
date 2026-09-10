// SPDX-License-Identifier: GPL-2.0-or-later
// Small Baseq3-style warmup, fraglimit, timelimit and intermission controller.
package mq3.client.playable_match

import mq3.compat.numeric as numeric

const PHASE_WAITING=0
const PHASE_WARMUP=1
const PHASE_ACTIVE=2
const PHASE_INTERMISSION=3
const WINNER_NONE=0
const WINNER_PLAYER=1
const WINNER_ENEMIES=2
const ANNOUNCER_NONE=0
const ANNOUNCER_THREE=1
const ANNOUNCER_TWO=2
const ANNOUNCER_ONE=3
const ANNOUNCER_FIGHT=4

struct State phase fragLimit timeLimitMilliseconds warmupMilliseconds warmupStart matchStart intermissionAt winner end struct
struct Update phase changed message playerScore enemyScore remainingSeconds clock end struct

function fail(message) return error(7620,"preview match: "+message) end function

function create(fragLimit,timeLimitMinutes,warmupMilliseconds)
  if fragLimit<1 or timeLimitMinutes<1 or warmupMilliseconds<0 then return fail("positive limits and non-negative warmup required") end if
  return State(PHASE_WAITING,fragLimit,timeLimitMinutes*60000,warmupMilliseconds,0,0,0,WINNER_NONE)
end function

function start(state,now)
  if state==void or now<0 then return fail("state and non-negative time required") end if
  state.warmupStart=now;state.matchStart=now+state.warmupMilliseconds;state.intermissionAt=0;state.winner=WINNER_NONE
  if state.warmupMilliseconds==0 then state.phase=PHASE_ACTIVE else state.phase=PHASE_WARMUP end if
  return state.phase
end function

function secondsCeil(milliseconds)
  if milliseconds<=0 then return 0 end if
  return numeric.trunc32((milliseconds+999)/1000)
end function

function twoDigits(value)
  if value<10 then return "0"+str(value) end if
  return str(value)
end function

function clock(state,now)
  if state==void or state.phase==PHASE_WAITING then return "00:00" end if
  elapsed=now-state.matchStart;if elapsed<0 then elapsed=0 end if
  total=numeric.trunc32(elapsed/1000);minutes=numeric.trunc32(total/60);seconds=total-minutes*60
  return twoDigits(minutes)+":"+twoDigits(seconds)
end function

function warmupMessage(state,now)
  if state.phase!=PHASE_WARMUP then return "" end if
  remaining=secondsCeil(state.matchStart-now)
  if remaining>3 then return "PREPARE TO FIGHT" end if
  if remaining<1 then return "FIGHT!" end if
  return str(remaining)
end function

function announcerCue(message)
  if message=="3" then return ANNOUNCER_THREE end if
  if message=="2" then return ANNOUNCER_TWO end if
  if message=="1" then return ANNOUNCER_ONE end if
  if message=="FIGHT!" then return ANNOUNCER_FIGHT end if
  return ANNOUNCER_NONE
end function

function snapshot(state,changed,message,playerScore,enemyScore,now)
  remaining=0
  if state.phase==PHASE_ACTIVE then remaining=secondsCeil(state.timeLimitMilliseconds-(now-state.matchStart)) end if
  return Update(state.phase,changed,message,playerScore,enemyScore,remaining,clock(state,now))
end function

function update(state,now,playerScore,enemyScore)
  if state==void or now<0 or playerScore<0 or enemyScore<0 then return fail("valid state, time and scores required") end if
  changed=false;message=""
  if state.phase==PHASE_WARMUP then
    if now>=state.matchStart then state.phase=PHASE_ACTIVE;changed=true;message="FIGHT!"
    else message=warmupMessage(state,now) end if
  end if
  if state.phase==PHASE_ACTIVE then
    if playerScore>=state.fragLimit or enemyScore>=state.fragLimit or now-state.matchStart>=state.timeLimitMilliseconds then
      state.phase=PHASE_INTERMISSION;state.intermissionAt=now;changed=true
      if playerScore>enemyScore then state.winner=WINNER_PLAYER;message="YOU WIN"
      else if enemyScore>playerScore then state.winner=WINNER_ENEMIES;message="YOU LOSE"
      else state.winner=WINNER_NONE;message="TIED GAME" end if
    end if
  end if
  if state.phase==PHASE_INTERMISSION and message=="" then
    if state.winner==WINNER_PLAYER then message="YOU WIN"
    else if state.winner==WINNER_ENEMIES then message="YOU LOSE"
    else message="TIED GAME" end if
  end if
  return snapshot(state,changed,message,playerScore,enemyScore,now)
end function
