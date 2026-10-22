import mq3.client.ui_gameinfo_missionpack as game
import mq3.shared.info as info
import mq3.client.ui_gameinfo as base

function req(ok,label) if not ok then return error(7998,"missionpack gameinfo: "+label) end if;return 1 end function
function main(args)
  count=0;s=game.create(false)
  parsed=game.UI_ParseInfos(s,"// comment\n{ map q3dm1 longname \"Arena Gate\" type \"ffa tourney\" } { name Ranger empty\nnext }",4)
  count=count+req(len(parsed)==2 and info.value(parsed[0],"longname")=="Arena Gate","quoted/comment parsing")
  count=count+req(info.value(parsed[1],"empty")=="<NULL>","missing same-line value")
  limited=game.UI_ParseInfos(s,"{ a 1 } { b 2 }",1);count=count+req(len(limited)==1 and s.diagnostics[len(s.diagnostics)-1]=="Max infos exceeded\n","parser max")
  missing=game.create(false);count=count+req(game.UI_LoadArenasFromFile(missing,"missing",void)==0 and len(missing.diagnostics)==1,"missing arena file")
  huge=decode(bytes(base.MAX_ARENAS_TEXT,65));count=count+req(game.UI_LoadArenasFromFile(missing,"huge",huge)==0,"arena size bound")
  arenas="{ map a longname Alpha type \"ffa tourney\" } { map b longname Beta type \"ctf oneflag overload harvester\" } { map c longname Gamma } { map d longname Delta type FFA }"
  state=game.create(false);loaded=game.UI_LoadArenas(state,"scripts/arenas.txt",arenas,[["scripts/extra.arena","{ map e longname Extra type ffa }"]])
  count=count+req(loaded==5 and len(state.arenaInfos)==5,"arena primary and extension load")
  count=count+req(state.maps[0].mapLoadName=="a" and state.maps[0].mapName=="Alpha" and state.maps[0].imageName=="levelshots/a","map metadata")
  count=count+req(state.maps[0].cinematic==-1 and state.maps[0].levelShot==-1 and state.maps[4].skirmishNumber==4,"skirmish numbering and handles")
  count=count+req(state.maps[0].typeBits==3 and state.maps[1].typeBits==240 and state.maps[2].typeBits==1 and state.maps[3].typeBits==0,"original type substring semantics")
  count=count+req(state.gameTypeCounts[game.GT_FFA]==3 and state.gameTypeCounts[game.GT_TOURNAMENT]==1 and state.gameTypeCounts[game.GT_CTF]==1,"gametype counts")
  bots="{ name Sarge model sarge/default } // split\n{ name Visor model visor/default }";count=count+req(game.UI_LoadBots(state,"scripts/bots.txt",bots,[["scripts/extra.bot","{ name Xaero model xaero }"]])==3,"bot primary and extension load")
  count=count+req(game.UI_GetNumBots(state)==3 and game.UI_GetBotNameByNumber(state,1)=="Visor","bot count/name")
  count=count+req(info.value(game.UI_GetBotInfoByName(state,"xAeRo"),"model")=="xaero","case-insensitive bot lookup")
  count=count+req(game.UI_GetBotNameByNumber(state,99)=="Sarge" and game.UI_GetBotInfoByNumber(state,-1)==void,"invalid bot fallback")
  count=count+req(state.diagnostics[len(state.diagnostics)-1]=="^1Invalid bot number: -1\n","invalid bot diagnostic")
  count=count+req(len(state.actions)==4 and state.actions[0].boundary=="filesystem","typed file actions")
  silent=game.create(true);game.UI_LoadArenas(silent,"a","{ map a }",[]);ok=true;for each action in silent.actions if action.dispatched then ok=false end if end for;count=count+req(ok,"retail host suppression")
  many="";for index=0 to 129 many=many+"{ map m"+str(index)+" type ffa } " end for;cap=game.create(false);count=count+req(game.UI_LoadArenas(cap,"many",many,[])==game.MAX_MAPS and len(cap.arenaInfos)==130,"map display cap preserves parsed arenas")
  print("PASS: "+str(count)+" Missionpack UI gameinfo contracts");return 0
end function
