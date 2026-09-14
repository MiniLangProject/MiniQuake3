import mq3.botlib.ai_chat_matches as matches
import mq3.format.pk3 as pk3

struct Context archive reads end struct
function require(ok,label) if not ok then return error(7599,"retail chat matches: "+label) end if;return 1 end function
function readFile(context,path) context.reads=context.reads+1;data=pk3.read(context.archive,path);if data is error then return data end if;return decode(data) end function
function main(args)
  if len(args)!=1 then return error(7599,"usage: ai_chat_matches_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;context=Context(archive,0);state=matches.create(context,readFile);checks=0
  loaded=matches.ensureLoaded(state);checks=checks+require(not (loaded is error) and loaded>100 and context.reads==3,"retail match.c, game.h and match.h parse")
  entered=matches.findMatch(state,"Sarge entered the game",2);checks=checks+require(entered!=void and entered.type==2 and matches.matchVariable(entered,0,256)=="Sarge","retail enter-game template")
  command=matches.findMatch(state,"(Ranger) Atrium: get the Rocket Launcher",4);checks=checks+require(command!=void and command.type==24 and matches.matchVariable(command,0,256)=="Ranger" and matches.matchVariable(command,3,256)=="Rocket Launcher","retail initial-team get-item template")
  checks=checks+require(matches.findMatch(state,"Sarge entered the game",4)==void,"retail context mask")
  checks=checks+require(matches.ensureLoaded(state)==loaded and context.reads==3,"retail cache reuse")
  print("PASS: "+str(checks)+" retail match checks templates="+str(loaded));return 0
end function
