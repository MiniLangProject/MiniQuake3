import mq3.game.g_local as g
function req(ok,label) if not ok then return error(7955,"g_local.h: "+label) end if;return 1 end function
function main(args)
  count=0
  count=count+req(g.GAMEVERSION=="baseq3" and g.SP_PODIUM_MODEL=="models/mapobjects/podium/podium4.md3","identity strings")
  count=count+req(g.BODY_QUEUE_SIZE==8 and g.FRAMETIME==100 and g.INFINITE==1000000,"core limits")
  count=count+req(g.CARNAGE_REWARD_TIME==3000 and g.REWARD_SPRITE_TIME==2000 and g.INTERMISSION_DELAY_TIME==1000 and g.SP_INTERMISSION_DELAY_TIME==5000,"timing contracts")
  count=count+req(g.FL_GODMODE==16 and g.FL_NOTARGET==32 and g.FL_TEAMSLAVE==1024 and g.FL_FORCE_GESTURE==32768,"entity flags")
  count=count+req(g.validMoverState(0) and g.validMoverState(3) and not g.validMoverState(-1) and not g.validMoverState(4),"mover state domain")
  count=count+req(g.CON_DISCONNECTED==0 and g.CON_CONNECTED==2 and g.SPECTATOR_NOT==0 and g.SPECTATOR_SCOREBOARD==3 and g.TEAM_ACTIVE==1,"client enum ordinals")
  count=count+req(g.isFollowSentinel(-1) and g.isFollowSentinel(-2) and not g.isFollowSentinel(0),"follow sentinels")
  count=count+req(g.MAX_NETNAME==36 and g.MAX_VOTE_COUNT==3 and g.MAX_FILEPATH==144,"bounded names")
  count=count+req(g.validSpawnStorage(0,0) and g.validSpawnStorage(64,4096) and not g.validSpawnStorage(65,0) and not g.validSpawnStorage(0,4097),"spawn storage")
  count=count+req(g.damageUsesArmor(g.DAMAGE_RADIUS) and not g.damageUsesArmor(g.DAMAGE_NO_ARMOR) and not g.damageUsesArmor(g.DAMAGE_NO_PROTECTION),"damage armor policy")
  count=count+req(g.nextBodyQueueSlot(0)==1 and g.nextBodyQueueSlot(7)==0 and try(g.nextBodyQueueSlot(8)) is error,"body queue ring")
  count=count+req(len(g.typeNames())==11 and len(g.entityFieldNames())==69 and len(g.clientFieldNames())==32 and len(g.levelFieldNames())==51,"complete record inventory")
  count=count+req(len(g.declarationNames())==328 and g.declarationNames()[0]=="G_SpawnString" and g.declarationNames()[327]=="trap_SnapVector","complete declaration inventory")
  count=count+req(g.FOFS("s")==0 and g.FOFS("item")==68 and try(g.FOFS("missing")) is error,"managed FOFS selector")
  team=g.PlayerTeamState(g.TEAM_BEGIN,4,1,2,3,4,5,6,7.0,8.0,9.0,10.0)
  session=g.ClientSession(2,100,g.SPECTATOR_FOLLOW,7,3,1,true)
  bot=g.BotSettings("bots/sarge_c.c",4.0,"red")
  count=count+req(team.location==4 and team.assists==6 and session.spectatorClient==7 and session.teamLeader and bot.skill==4.0,"managed record mirrors")
  print("PASS: "+str(count)+" g_local.h ABI contracts")
  return 0
end function
