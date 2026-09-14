import mq3.botlib.ai_chat_strings as chatStrings
import mq3.format.pk3 as pk3

struct Context archive reads end struct
function require(ok,label) if not ok then return error(7599,"retail chat strings: "+label) end if;return 1 end function
function readFile(context,path) context.reads=context.reads+1;data=pk3.read(context.archive,path);if data is error then return data end if;return decode(data) end function
function main(args)
  if len(args)!=1 then return error(7599,"usage: ai_chat_strings_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;context=Context(archive,0);state=chatStrings.create(context,readFile);checks=0
  loaded=chatStrings.ensureLoaded(state);checks=checks+require(not (loaded is error) and loaded==175 and context.reads==3,"retail syn.c, game.h and syn.h parse")
  checks=checks+require(chatStrings.replaceSynonyms(state,"dont ya kwl",1)=="do not you cool","CONTEXT_NORMAL retail replacements")
  checks=checks+require(chatStrings.replaceSynonyms(state,"rl and mh",2)=="Rocket Launcher and Mega Health","CONTEXT_NEARBYITEM retail replacements")
  checks=checks+require(chatStrings.replaceSynonyms(state,"Honored Master",1024)=="Xaero","CONTEXT_NAMES retail replacement")
  checks=checks+require(chatStrings.ensureLoaded(state)==loaded and context.reads==3,"retail cache reuse")
  print("PASS: "+str(checks)+" retail synonym checks groups="+str(loaded));return 0
end function
