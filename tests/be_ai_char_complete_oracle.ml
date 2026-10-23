import mq3.botlib.ai_characters as chars
import mq3.botlib.be_ai_char as complete
struct Context paths texts end struct
function readFile(context,path) for index=0 to len(context.paths)-1 if context.paths[index]==path then return context.texts[index] end if end for;return void end function
function bit(value) if value then return 1 end if;return 0 end function
function main(args)
  source="skill 1 { 0 0.2 1 10 2 \"low\" } skill 4 { 0 0.8 1 40 2 \"high\" 3 0.75 }"
  context=Context(["botfiles/bots/test_c.c"],[source]);state=chars.create(64,context,readFile)
  first=complete.BotLoadCharacterFromFile(state,"bots/test_c.c",1);second=complete.BotLoadCharacterFromFile(state,"bots/test_c.c",4);state.characters[1]=first;state.characters[2]=second
  complete.BotDefaultCharacteristics(first,second);print("default="+str(first.values[3].floatValue));print("cache="+str(complete.BotFindCachedCharacter(state,"bots/test_c.c",1.0))+","+str(complete.BotFindCachedCharacter(state,"bots/test_c.c",-1.0)))
  handle=complete.BotInterpolateCharacters(state,1,2,2.5);print("interp="+str(handle)+","+str(complete.Characteristic_Float(state,handle,0))+","+str(complete.Characteristic_Integer(state,handle,1))+","+complete.Characteristic_String(state,handle,2))
  print("query="+str(complete.Characteristic_BFloat(state,handle,0,0.0,0.4))+","+str(complete.Characteristic_BInteger(state,handle,1,20,30)))
  print("bounds="+str(bit(complete.CheckCharacteristicIndex(state,handle,79)))+","+str(bit(complete.CheckCharacteristicIndex(state,handle,80)))+","+str(complete.Characteristic_BFloat(state,handle,0,1.0,0.0)))
  print("string="+complete.Characteristic_String(state,handle,2));complete.BotFreeCharacter(state,handle);print("cached="+str(bit(complete.BotCharacterFromHandle(state,handle)!=void)))
  chars.setReloadCharacters(state,1);complete.BotFreeCharacter(state,handle);print("freed="+str(bit(complete.BotCharacterFromHandle(state,handle)==void)));complete.BotShutdownCharacters(state);print("shutdown=1,0");return 0
end function
