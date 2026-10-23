import mq3.client.cg_local as cg
function require(value,message) if not value then print("FAIL: "+message);return 1 end if;return 0 end function
function main(args)
  failures=0;count=0
  count=count+1;failures=failures+require(cg.validFootstep(cg.FOOTSTEP_NORMAL) and cg.validFootstep(cg.FOOTSTEP_SPLASH) and not cg.validFootstep(cg.FOOTSTEP_TOTAL),"footstep range")
  count=count+1;failures=failures+require(cg.validImpactSound(cg.IMPACTSOUND_DEFAULT) and cg.validImpactSound(cg.IMPACTSOUND_FLESH) and not cg.validImpactSound(3),"impact range")
  count=count+1;failures=failures+require(cg.validLocalEntityType(cg.LE_SCOREPLUM,false) and not cg.validLocalEntityType(cg.LE_KAMIKAZE,false),"base local entity range")
  count=count+1;failures=failures+require(cg.validLocalEntityType(cg.LE_KAMIKAZE,true) and cg.validLocalEntityType(cg.LE_SHOWREFENTITY,true) and not cg.validLocalEntityType(13,true),"missionpack local entity range")
  count=count+1;failures=failures+require(cg.LE_EXPLOSION==1 and cg.LE_FADE_RGB==6 and cg.LE_SCOREPLUM==8,"local entity ordinals")
  count=count+1;failures=failures+require(cg.LEF_PUFF_DONT_SCALE==1 and cg.LEF_SOUND2==8,"local entity flags")
  count=count+1;failures=failures+require(cg.nextSoundBufferSlot(0)==1 and cg.nextSoundBufferSlot(19)==0,"sound ring")
  count=count+1;failures=failures+require(cg.nextRewardSlot(0)==1 and cg.nextRewardSlot(9)==0,"reward ring")
  count=count+1;failures=failures+require(cg.validCrosshair(0) and cg.validCrosshair(9) and not cg.validCrosshair(10),"crosshair bounds")
  count=count+1;failures=failures+require(cg.validMarkPolygon(0) and cg.validMarkPolygon(10) and not cg.validMarkPolygon(11),"mark polygon bounds")
  count=count+1;failures=failures+require(cg.powerupBlinkWindow(0) and cg.powerupBlinkWindow(5000) and not cg.powerupBlinkWindow(5001),"powerup blink window")
  count=count+1;failures=failures+require(cg.clampTeamChatHeight(-1)==0 and cg.clampTeamChatHeight(4)==4 and cg.clampTeamChatHeight(12)==8,"team chat clamp")
  count=count+1;failures=failures+require(cg.DEFAULT_MODEL=="sarge" and cg.DEFAULT_TEAM_MODEL=="sarge" and cg.MISSIONPACK_DEFAULT_TEAM_MODEL=="james","model defaults")
  count=count+1;failures=failures+require(len(cg.typeNames())==21 and len(cg.declarationNames())==243,"type/declaration inventory")
  count=count+1;failures=failures+require(len(cg.globalNames())==114 and len(cg.cgMediaFieldNames())==258,"global/media inventory")
  if failures!=0 then return 1 end if
  print("PASS: "+str(count)+" cg_local.h ABI contracts");return 0
end function
