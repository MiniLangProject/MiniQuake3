import mq3.botlib.ai_characters as chars
import mq3.botlib.be_ai_char as complete
struct Context paths texts end struct
function require(ok,label) if not ok then return error(7900,"be_ai_char complete: "+label) end if;return 1 end function
function near(a,b) difference=a-b;if difference<0.0 then difference=0.0-difference end if;return difference<0.00001 end function
function readFile(context,path) for index=0 to len(context.paths)-1 if context.paths[index]==path then return context.texts[index] end if end for;return void end function
function main(args)
  count=0;defaults="skill 1 { 3 0.25 4 \"fallback\" } skill 4 { 3 0.75 4 \"fallback\" }";target="skill 1 { 0 \"low\" 1 10 2 0.2 } skill 4 { 0 \"high\" 1 40 2 0.8 } skill 5 { 0 \"five\" 1 50 2 1.0 }"
  context=Context(["botfiles/bots/default_c.c","botfiles/bots/test_c.c"],[defaults,target]);state=chars.create(16,context,readFile)
  raw=complete.BotLoadCharacterFromFile(state,"bots/test_c.c",4);count=count+require(raw!=void and raw.skill==4.0 and raw.values[0].stringValue=="high","load file")
  complete.BotFreeCharacterStrings(raw);count=count+require(raw.values[0].stringValue=="","free strings")
  handle=complete.BotLoadCharacter(state,"bots/test_c.c",2.5);count=count+require(handle==5 and complete.BotCharacterFromHandle(state,handle)!=void,"load and handle")
  count=count+require(complete.BotFindCachedCharacter(state,"bots/test_c.c",2.5)==handle,"cache lookup")
  count=count+require(near(complete.Characteristic_Float(state,handle,2),0.5) and complete.Characteristic_Integer(state,handle,1)==10,"typed numeric")
  count=count+require(complete.Characteristic_String(state,handle,0)=="low" and complete.CheckCharacteristicIndex(state,handle,0),"typed string and index")
  count=count+require(complete.Characteristic_BFloat(state,handle,2,0.0,0.4)==0.4 and complete.Characteristic_BInteger(state,handle,1,20,30)==20,"bounded queries")
  count=count+require(near(complete.Characteristic_Float(state,handle,3),0.5) and complete.Characteristic_String(state,handle,4)=="fallback","defaults interpolate")
  dump=complete.BotDumpCharacter(complete.BotCharacterFromHandle(state,handle));count=count+require(len(bytes(dump))>20,"character dump")
  copy=complete.BotLoadCachedCharacter(state,"bots/test_c.c",5.0,false);count=count+require(copy>0 and complete.BotLoadCharacterSkill(state,"bots/test_c.c",5.0)==copy,"cached and skill loader")
  manual=complete.BotInterpolateCharacters(state,2,4,3.0);count=count+require(manual>0 and near(complete.BotCharacterFromHandle(state,manual).skill,3.0),"interpolate symbol")
  complete.BotFreeCharacter(state,handle);count=count+require(complete.BotCharacterFromHandle(state,handle)!=void,"cached free")
  chars.setReloadCharacters(state,1);complete.BotFreeCharacter(state,handle);count=count+require(complete.BotCharacterFromHandle(state,handle)==void,"reload free")
  temp=complete.BotLoadCachedCharacter(state,"bots/test_c.c",4.0,true);complete.BotFreeCharacter2(state,temp);count=count+require(complete.BotCharacterFromHandle(state,temp)==void,"unconditional free")
  complete.BotShutdownCharacters(state);count=count+require(complete.BotCharacterFromHandle(state,1)==void,"shutdown")
  print("PASS: "+str(count)+" complete be_ai_char contracts");return 0
end function
