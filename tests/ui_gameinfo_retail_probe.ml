import mq3.client.ui_gameinfo as game
import mq3.format.pk3 as pk3
import mq3.shared.info as info
function req(ok,label) if not ok then return error(7961,"Retail UI gameinfo: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if
  arenaData=pk3.read(archive,"scripts/arenas.txt");if arenaData is error then return arenaData end if;botData=pk3.read(archive,"scripts/bots.txt");if botData is error then return botData end if
  s=game.create();game.UI_InitMemory(s);game.UI_LoadArenas(s,"scripts/arenas.txt",decode(arenaData),[]);game.UI_LoadBots(s,"scripts/bots.txt",decode(botData),[]);count=0
  count=count+req(game.UI_GetNumArenas(s)==30,"retail arena count");count=count+req(game.UI_GetNumBots(s)==32,"retail bot count");count=count+req(game.UI_GetNumSPArenas(s)==24 and game.UI_GetNumSPTiers(s)==6,"retail SP tiers");count=count+req(info.value(game.UI_GetArenaInfoByMap(s,"q3dm1"),"longname")=="Arena Gate","retail map metadata");count=count+req(info.value(game.UI_GetBotInfoByName(s,"Xaero"),"model")=="xaero","retail bot metadata");count=count+req(info.value(game.UI_GetSpecialArenaInfo(s,"training"),"map")=="q3dm0","retail training arena");count=count+req(info.value(game.UI_GetSpecialArenaInfo(s,"final"),"map")=="q3tourney6","retail final arena")
  print("PASS: "+str(count)+" retail arena/bot contracts arenas="+str(game.UI_GetNumArenas(s))+" bots="+str(game.UI_GetNumBots(s)))
  return 0
end function
