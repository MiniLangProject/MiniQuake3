import mq3.botlib.ai_chat_strings as chatStrings
import mq3.botlib.ai_chat_string_syscalls as traps
import mq3.botlib.ai_chat_profiles as profiles
import mq3.botlib.ai_resource_pools as pools
import mq3.compat.numeric as n

struct Context paths texts reads end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7599,"AI chat string: "+label) end if;return 1 end function
function readFile(context,path) context.reads=context.reads+1;for index=0 to len(context.paths)-1 if context.paths[index]==path then return context.texts[index] end if end for;return error(7599,"missing "+path) end function
function fixture()
  source="1 { [(\"do not\",1),(\"dont\",0),(\"don't\",1)] [(\"can not\",1),(\"cant\",0)] }\n2 { [(\"Rocket Launcher\",1),(\"rl\",0)] }\n"
  return Context(["botfiles/syn.c"],[source],0)
end function
function put(vm,address,value) data=bytes(value);copyBytes(vm.data,address,data,0,len(data));vm.data[address+len(data)]=0;return void end function
function qvmString(vm,address) endAt=address;while vm.data[endAt]!=0 endAt=endAt+1 end while;return decode(slice(vm.data,address,endAt-address)) end function
function arg(vm,base,index,value) n.writeU32(vm.data,base+index*4,value);return void end function

function main(args)
  checks=0
  checks=checks+require(chatStrings.unifyWhiteSpaces(" \tHello!!!\nworld?  [x]\r")=="Hello world? [x]","original whitespace classifier and collapse")
  punctuation="a/b+c=d_e-[x],y.z:(q)?'s";checks=checks+require(chatStrings.unifyWhiteSpaces(punctuation)==punctuation,"original non-whitespace punctuation set")
  c=fixture();state=chatStrings.create(c,readFile);checks=checks+require(chatStrings.load(state,"syn.c")==3 and c.reads==1,"synonym groups and contexts")
  checks=checks+require(chatStrings.replaceSynonyms(state,"DONT, don't! dont.",1)=="do not, don't! dont.","original pointer scan across adjacent separators")
  checks=checks+require(chatStrings.replaceSynonyms(state,"DONT don't dont",1)=="do not do not do not","case-insensitive canonical replacement")
  checks=checks+require(chatStrings.replaceSynonyms(state,"scant cant,cant!cant.",1)=="scant can not,cant!can not.","partial words and original separator scan")
  checks=checks+require(chatStrings.replaceSynonyms(state,"rl dont",2)=="Rocket Launcher dont","context mask selects groups")
  checks=checks+require(chatStrings.replaceSynonyms(state,"do not dont",1)=="do not do not","canonical text is not recursively replaced")
  checks=checks+require(chatStrings.ensureLoaded(state)==3 and c.reads==1,"loaded synonym cache reused")

  resourcePools=pools.create();chatHandle=pools.allocChatState(resourcePools);profileState=profiles.create(resourcePools,c,readFile)
  vm=Machine(bytes(1024,0),1023);base=900;at=100;put(vm,at,"  dont!!! rl  ");arg(vm,base,1,at)
  checks=checks+require(traps.dispatch(state,profileState,vm,base,chatStrings.OP_UNIFY_WHITE_SPACES)==0 and qvmString(vm,at)=="dont rl","op520 mutates 256-byte QVM buffer")
  arg(vm,base,2,3);checks=checks+require(traps.dispatch(state,profileState,vm,base,chatStrings.OP_REPLACE_SYNONYMS)==0 and qvmString(vm,at)=="do not Rocket Launcher","op521 context and QVM ABI")
  put(vm,200,"Ranger");arg(vm,base,1,chatHandle);arg(vm,base,2,200);arg(vm,base,3,7)
  checks=checks+require(traps.dispatch(state,profileState,vm,base,profiles.OP_SET_CHAT_NAME)==0 and pools.chatState(resourcePools,chatHandle).name=="Ranger" and pools.chatState(resourcePools,chatHandle).client==7,"op524 delegates to existing profile dispatcher")
  checks=checks+require((try(traps.dispatch(state,profileState,vm,base,519))) is error,"composite dispatcher rejects adjacent unimplemented opcode")
  print("PASS: "+str(checks)+" AI chat-string contracts");return 0
end function
