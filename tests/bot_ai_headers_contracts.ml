// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_ai_headers as h

function require(condition,message)
  if not condition then return error(7811,"bot AI header contract: "+message) end if
  return 1
end function

function contains(values,needle)
  for index=0 to len(values)-1 if values[index]==needle then return true end if end for
  return false
end function

function main(args)
  checks=0
  counts=h.headerCounts()
  checks=checks+require(len(counts)==5 and counts[0]==55 and counts[1]==3 and counts[2]==135 and counts[3]==16 and counts[4]==163,"header inventory counts")
  checks=checks+require(len(h.constantNames())==55 and len(h.constantValues())==55,"constant inventory")
  checks=checks+require(h.BFL_STRAFERIGHT==1 and h.BFL_ATTACKED==2 and h.BFL_FIGHTSUICIDAL==64,"bot flags")
  checks=checks+require(h.PATROL_LOOP==1 and h.PATROL_REVERSE==2 and h.PATROL_BACK==4,"patrol flags")
  checks=checks+require(h.TEAMTP_DEFENDER==1 and h.TEAMTP_ATTACKER==2,"team task bits")
  checks=checks+require(h.PRESENCE_NONE==1 and h.PRESENCE_NORMAL==2 and h.PRESENCE_CROUCH==4,"presence bits")
  checks=checks+require(h.validPresence(1) and h.validPresence(2) and h.validPresence(4) and not h.validPresence(3),"presence validation")
  checks=checks+require(h.validTeamTaskPreference(1) and h.validTeamTaskPreference(2) and not h.validTeamTaskPreference(0),"team preference validation")
  checks=checks+require(h.validLongTermGoal(1) and h.validLongTermGoal(15) and not h.validLongTermGoal(0) and not h.validLongTermGoal(16),"long-term-goal range")
  checks=checks+require(h.nextPatrolDirection(0)==h.PATROL_LOOP and h.nextPatrolDirection(h.PATROL_REVERSE)==h.PATROL_BACK,"patrol direction")
  checks=checks+require(len(h.typeNames())==3 and contains(h.typeNames(),"bot_state_t"),"type declarations")
  checks=checks+require(len(h.waypointFieldNames())==5 and contains(h.waypointFieldNames(),"goal"),"waypoint fields")
  checks=checks+require(len(h.activateGoalFieldNames())==13 and contains(h.activateGoalFieldNames(),"areasdisabled"),"activate-goal fields")
  checks=checks+require(len(h.botStateFieldNames())==145 and contains(h.botStateFieldNames(),"patrolflags"),"bot-state fields")
  checks=checks+require(len(h.declarationNames())==135 and contains(h.declarationNames(),"BotDeathmatchAI") and contains(h.declarationNames(),"BotVoiceChatCommand"),"function declarations")
  checks=checks+require(len(h.globalNames())==16 and contains(h.globalNames(),"floattime"),"extern globals")
  print("PASS: "+str(checks)+" bot AI header contracts")
  return 0
end function
