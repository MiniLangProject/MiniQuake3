import mq3.botlib.ai_characters as chars
import mq3.botlib.ai_character_syscalls as traps
import mq3.compat.numeric as n

struct Context paths texts reads end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7559,"character contract: "+label) end if;return 1 end function
function close(a,b) difference=a-b;if difference<0 then difference=0-difference end if;return difference<0.00001 end function
function readFile(c,path) c.reads=c.reads+1;for index=0 to len(c.paths)-1 if c.paths[index]==path then return c.texts[index] end if end for;return error(7558,"missing "+path) end function
function context()
  header="#define CH_NAME 0\n#define CH_COUNT 1\n#define CH_FLOAT 2\n#define CH_DEFAULT 3\n#define CH_EXTRA 4\n"
  defaults="#include \"chars.h\"\nskill 1 { CH_NAME \"default-low\" CH_COUNT 1 CH_DEFAULT 0.1 CH_EXTRA \"fallback\" }\nskill 4 { CH_NAME \"default-high\" CH_COUNT 4 CH_DEFAULT 0.7 CH_EXTRA \"fallback\" }\nskill 5 { CH_NAME \"default-five\" CH_COUNT 5 CH_DEFAULT 1.0 CH_EXTRA \"fallback\" }\n"
  target="#include \"chars.h\"\nskill 1 { CH_NAME \"low\" CH_COUNT 10 CH_FLOAT 0.2 }\nskill 4 { CH_NAME \"high\" CH_COUNT 40 CH_FLOAT 0.8 }\nskill 5 { CH_NAME \"five\" CH_COUNT 50 CH_FLOAT 1.0 }\n"
  bad="#include \"chars.h\"\nskill 4 { CH_COUNT 1 CH_COUNT 2 }\n"
  return Context(["botfiles/chars.h","botfiles/bots/default_c.c","botfiles/bots/test_c.c","botfiles/bots/bad_c.c"],[header,defaults,target,bad],0)
end function
function putString(vm,at,text) value=bytes(text);copyBytes(vm.data,at,value,0,len(value));vm.data[at+len(value)]=0 end function
function textAt(vm,at) stop=at;while vm.data[stop]!=0 stop=stop+1 end while;return decode(slice(vm.data,at,stop-at)) end function
function invoke(state,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return traps.dispatch(state,vm,base,values[0]) end function
function main(args)
  checks=0;c=context();state=chars.create(16,c,readFile)
  checks=checks+require(chars.botPath("bots/test_c.c")=="botfiles/bots/test_c.c" and chars.botPath("botfiles/chars.h")=="botfiles/chars.h","botfiles callback boundary")
  parsed=chars.parseCharacter(state,"bots/test_c.c",4);checks=checks+require(not (parsed is error) and parsed.found and parsed.character.values[0].stringValue=="high" and parsed.character.values[1].integer==40 and close(parsed.character.values[2].floatValue,0.8),"preprocessed typed character parse")
  checks=checks+require((try(chars.parseCharacter(state,"bots/bad_c.c",4))) is error,"duplicate characteristic rejected")

  c=context();state=chars.create(8,c,readFile);handle=chars.loadCharacter(state,"bots/test_c.c",4.0)
  checks=checks+require(handle==2 and chars.characterAt(state,1).filename==chars.DEFAULT_CHARACTER,"exact skill loads default then requested character")
  checks=checks+require(chars.characteristicString(state,handle,0)=="high" and close(chars.characteristicFloat(state,handle,2),0.8),"string and float queries")
  checks=checks+require(close(chars.characteristicFloat(state,handle,1),40.0) and chars.characteristicInteger(state,handle,2)==0,"numeric type conversion")
  checks=checks+require(close(chars.characteristicFloat(state,handle,3),0.7) and chars.characteristicString(state,handle,4)=="fallback","default characteristics copied")
  checks=checks+require(chars.characteristicBFloat(state,handle,2,0.0,0.5)==0.5 and chars.characteristicBFloat(state,handle,2,1.0,0.0)==0.0,"bounded float semantics")
  checks=checks+require(chars.characteristicBInteger(state,handle,1,20,30)==30 and chars.characteristicBInteger(state,handle,1,50,20)==0,"bounded integer semantics")
  reads=state.fileReads;again=chars.loadCharacter(state,"bots/test_c.c",4.0);checks=checks+require(again==handle and state.fileReads==reads,"exact skill cache")
  chars.freeCharacter(state,handle);checks=checks+require(chars.characterAt(state,handle)!=void,"free is cached by default")
  chars.setReloadCharacters(state,1);chars.freeCharacter(state,handle);checks=checks+require(chars.characterAt(state,handle)==void and chars.loadCharacter(state,"bots/test_c.c",4.0)==handle,"reload mode frees and reloads slot")

  c=context();state=chars.create(16,c,readFile);mixed=chars.loadCharacter(state,"bots/test_c.c",2.5);character=chars.characterAt(state,mixed)
  checks=checks+require(mixed==5 and close(character.skill,2.5),"interpolated handle allocation")
  checks=checks+require(close(chars.characteristicFloat(state,mixed,2),0.5) and close(chars.characteristicFloat(state,mixed,3),0.4),"float interpolation including defaults")
  checks=checks+require(chars.characteristicInteger(state,mixed,1)==10 and chars.characteristicString(state,mixed,0)=="low","integer and string copied from lower skill")
  reads=state.fileReads;checks=checks+require(chars.loadCharacter(state,"bots/test_c.c",2.5)==mixed and state.fileReads==reads,"interpolated cache")
  checks=checks+require(chars.loadCharacter(state,"bots/test_c.c",0.0)==2 and chars.characterAt(state,chars.loadCharacter(state,"bots/test_c.c",9.0)).skill==5.0,"skill clamps to one through five")
  checks=checks+require(chars.loadCharacter(state,"bots/missing_c.c",4.0)!=0,"missing requested character falls back to default")
  checks=checks+require(chars.characteristicFloat(state,999,2)==0.0 and chars.characteristicInteger(state,mixed,79)==0 and chars.characteristicString(state,mixed,2)==void,"invalid query semantics")

  vm=Machine(bytes(2048,0),2047);base=1900;putString(vm,100,"bots/test_c.c");loaded=invoke(state,vm,base,[chars.OP_LOAD_CHARACTER,100,n.floatBits(5.0)]);checks=checks+require(loaded>0,"load trap")
  checks=checks+require(n.bitsFloat(invoke(state,vm,base,[chars.OP_CHARACTERISTIC_FLOAT,loaded,2]))==1.0 and invoke(state,vm,base,[chars.OP_CHARACTERISTIC_INTEGER,loaded,1])==50,"numeric trap ABI")
  checks=checks+require(n.bitsFloat(invoke(state,vm,base,[chars.OP_CHARACTERISTIC_BFLOAT,loaded,2,n.floatBits(0.0),n.floatBits(0.75)]))==0.75 and invoke(state,vm,base,[chars.OP_CHARACTERISTIC_BINTEGER,loaded,1,1,20])==20,"bounded trap ABI")
  vm.data[300]=88;invoke(state,vm,base,[chars.OP_CHARACTERISTIC_STRING,loaded,0,300,4]);checks=checks+require(textAt(vm,300)=="fiv","string trap truncation and terminator")
  vm.data[320]=77;invoke(state,vm,base,[chars.OP_CHARACTERISTIC_STRING,loaded,2,320,8]);checks=checks+require(vm.data[320]==77,"wrong string type leaves output untouched")
  checks=checks+require((try(invoke(state,vm,base,[chars.OP_CHARACTERISTIC_STRING,loaded,0,2044,8]))) is error and (try(traps.dispatch(state,vm,base,507))) is error,"trap bounds")
  chars.shutdown(state);checks=checks+require(chars.characterAt(state,mixed)==void,"shutdown releases cache")
  print("PASS: "+str(checks)+" AI character contracts");return 0
end function
