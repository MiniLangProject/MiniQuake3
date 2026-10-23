// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.botlib.public_headers as h
function require(condition,message) if not condition then return error(7821,"Botlib public header contract: "+message) end if;return 1 end function
function contains(values,needle) for each value in values if value==needle then return true end if end for;return false end function
function main(args)
  checks=0;counts=h.inventoryCounts()
  checks=checks+require(counts==[156,25,113,24,333],"complete inventory counts")
  checks=checks+require(len(h.constantNames())==156 and len(h.constantValues())==156,"constant inventory")
  checks=checks+require(len(h.typeNames())==25 and len(h.abiSizes())==25,"ABI inventory")
  checks=checks+require(len(h.declarationNames())==113,"declaration inventory")
  checks=checks+require(len(h.structNames())==24 and len(h.fieldNames())==333,"field inventory")
  checks=checks+require(h.validApiVersion(2) and not h.validApiVersion(1),"Botlib API version")
  checks=checks+require(h.TFL_DEFAULT==0x011c0fbe,"default travel flags include elevators")
  checks=checks+require(h.hasTravel(h.TFL_DEFAULT,h.TFL_ELEVATOR) and h.hasTravel(h.TFL_DEFAULT,h.TFL_JUMPPAD),"default travel membership")
  checks=checks+require(not h.hasTravel(h.TFL_DEFAULT,h.TFL_ROCKETJUMP),"special travel excluded by default")
  checks=checks+require(h.validChatGender(0) and h.validChatGender(2) and not h.validChatGender(3),"chat gender range")
  checks=checks+require(h.CHAT_ALL==0 and h.CHAT_TEAM==1 and h.CHAT_TELL==2,"chat destinations")
  checks=checks+require(h.GFL_ITEM==1 and h.GFL_ROAM==2 and h.GFL_DROPPED==4,"goal flags")
  checks=checks+require(h.MOVE_WALK==1 and h.MOVE_CROUCH==2 and h.MOVE_JUMP==4,"move types")
  checks=checks+require(h.MFL_ACTIVEGRAPPLE==128 and h.MFL_WALK==512,"move state flags")
  checks=checks+require(h.ACTION_ATTACK==1 and h.ACTION_FOLLOWME==0x8000000,"action flags")
  checks=checks+require(h.MAX_GOALSTACK==8 and h.MAX_AVOIDGOALS==256,"goal bounds")
  checks=checks+require(contains(h.typeNames(),"botlib_export_t") and contains(h.typeNames(),"aas_trace_t"),"public types")
  checks=checks+require(contains(h.declarationNames(),"GetBotLibAPI") and contains(h.declarationNames(),"BotMoveToGoal"),"public functions")
  checks=checks+require(contains(h.botlib_export_tFields(),"BotLibStartFrame") and contains(h.ai_export_tFields(),"GeneticParentsAndChildSelection"),"export tables")
  checks=checks+require(h.abiSizes()[24]==536 and h.abiSizes()[20]==88,"x86 export ABI sizes")
  print("PASS: "+str(checks)+" Botlib public header contracts");return 0
end function
