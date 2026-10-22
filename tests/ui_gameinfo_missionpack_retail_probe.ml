import mq3.client.ui_gameinfo_missionpack as game
import mq3.format.pk3 as pk3
import mq3.shared.info as info
function req(ok,label) if not ok then return error(7999,"Missionpack retail gameinfo: "+label) end if;return 1 end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;arenas=pk3.read(archive,"scripts/arenas.txt");if arenas is error then return arenas end if;bots=pk3.read(archive,"scripts/bots.txt");if bots is error then return bots end if
  state=game.create(false);arenaCount=game.UI_LoadArenas(state,"scripts/arenas.txt",decode(arenas),[]);botCount=game.UI_LoadBots(state,"scripts/bots.txt",decode(bots),[]);count=0
  count=count+req(arenaCount==30 and botCount==32,"retail totals");count=count+req(state.maps[0].mapLoadName=="q3dm1" and state.maps[0].mapName=="Arena Gate" and state.maps[0].imageName=="levelshots/q3dm1","retail first map");count=count+req(state.maps[0].typeBits==3 and state.maps[0].skirmishNumber==0 and state.maps[29].skirmishNumber==29,"retail types and numbering");count=count+req(state.gameTypeCounts[0]==25 and state.gameTypeCounts[1]==8 and state.gameTypeCounts[4]==4,"retail game type counts");count=count+req(info.value(game.UI_GetBotInfoByName(state,"Xaero"),"model")=="xaero","retail bot metadata");count=count+req(game.UI_GetBotNameByNumber(state,0)=="Xaero" and game.UI_GetBotNameByNumber(state,99)=="Sarge","retail name and fallback")
  print("PASS: "+str(count)+" Missionpack retail contracts arenas="+str(arenaCount)+" bots="+str(botCount)+" types="+str(state.gameTypeCounts[0])+","+str(state.gameTypeCounts[1])+","+str(state.gameTypeCounts[4])+","+str(state.gameTypeCounts[5])+","+str(state.gameTypeCounts[6])+","+str(state.gameTypeCounts[7]));return 0
end function
