import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_chat_profiles as chat
import mq3.botlib.ai_chat_syscalls as traps
import mq3.compat.numeric as n

struct Context paths texts reads end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7579,"chat contract: "+label) end if;return 1 end function
function readFile(c,path) c.reads=c.reads+1;for index=0 to len(c.paths)-1 if c.paths[index]==path then return c.texts[index] end if end for;return error(7578,"missing "+path) end function
function fixture()
  shared="type \"whois\" { \"Who is \", 0, \"?\"; neutral, \" \", 1; }\n"
  profile="chat \"other\" { type \"unused\" { \"skip\"; } }\nchat \"Sarge\" {\n#include \"teamplay.h\"\ntype \"game_enter\" { \"Hello \", 1, \"!\"; HELLO5; } }\n"
  return Context(["botfiles/bots/sarge_t.c","botfiles/teamplay.h"],[profile,shared],0)
end function
function putString(vm,at,text) value=bytes(text);copyBytes(vm.data,at,value,0,len(value));vm.data[at+len(value)]=0 end function
function invoke(state,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return traps.dispatch(state,vm,base,values[0]) end function
function main(args)
  checks=0;resources=pools.create();handle=pools.allocChatState(resources);checks=checks+require(handle==1 and pools.chatState(resources,handle).handle==0,"allocated state starts message handle counter at zero")
  c=fixture();state=chat.create(resources,c,readFile)
  checks=checks+require(chat.botPath("bots/sarge_t.c")=="botfiles/bots/sarge_t.c" and chat.botPath("botfiles/teamplay.h")=="botfiles/teamplay.h","botfiles callback boundary")
  parsed=chat.parseProfile(state,"bots/sarge_t.c","sArGe");checks=checks+require(not (parsed is error) and parsed!=void and len(parsed.types)==2 and parsed.messageCount==4,"case-insensitive profile and include parse")
  who=chat.typeByName(parsed,"WHOIS");enter=chat.typeByName(parsed,"game_enter")
  checks=checks+require(who!=void and len(who.messages)==2 and enter!=void and len(enter.messages)==2,"included and local chat types")
  checks=checks+require(who.messages[1].components[0].kind==chat.COMPONENT_FIXED and who.messages[1].components[1].kind==chat.COMPONENT_VARIABLE and who.messages[1].components[1].number==0,"fixed and variable components")
  checks=checks+require(who.messages[0].components[0].kind==chat.COMPONENT_RANDOM and who.messages[0].components[0].text=="neutral" and enter.messages[0].components[0].text=="HELLO5","random-string/template references preserved")
  encoded=bytes(enter.messages[1].encoded);checks=checks+require(encoded[6]==1 and decode(slice(encoded,7,2))=="v1" and encoded[9]==1,"Baseq3 escape encoding")

  before=state.fileReads;checks=checks+require(chat.loadChatFile(state,handle,"bots/sarge_t.c","sarge")==chat.BLERR_NOERROR and pools.chatState(resources,handle).chat.messageCount==4,"load installs parsed profile")
  loadedReads=state.fileReads;second=pools.allocChatState(resources);checks=checks+require(chat.loadChatFile(state,second,"bots/sarge_t.c","sarge")==0 and state.fileReads==loadedReads and pools.chatState(resources,second).chat==pools.chatState(resources,handle).chat,"initial-chat cache shared")
  checks=checks+require(chat.loadChatFile(state,handle,"bots/sarge_t.c","missing")==chat.BLERR_CANNOTLOADICHAT and pools.chatState(resources,handle).chat==void,"failed replacement clears prior chat")
  checks=checks+require(chat.loadChatFile(state,99,"bots/sarge_t.c","sarge")==chat.BLERR_CANNOTLOADICHAT,"invalid handle error code")
  chat.setChatGender(state,second,chat.CHAT_GENDERMALE);checks=checks+require(pools.chatState(resources,second).gender==2,"male gender")
  chat.setChatGender(state,second,99);checks=checks+require(pools.chatState(resources,second).gender==0,"unknown gender becomes genderless")
  chat.setChatName(state,second,"12345678901234567890123456789012345",7);checks=checks+require(pools.chatState(resources,second).name=="1234567890123456789012345678901" and pools.chatState(resources,second).client==7,"name is NUL-sized to 31 bytes")

  vm=Machine(bytes(1024,0),1023);base=900;third=pools.allocChatState(resources);putString(vm,100,"bots/sarge_t.c");putString(vm,140,"SARGE")
  checks=checks+require(invoke(state,vm,base,[chat.OP_LOAD_CHAT_FILE,third,100,140])==0 and pools.chatState(resources,third).chat.messageCount==4,"load trap ABI")
  invoke(state,vm,base,[chat.OP_SET_CHAT_GENDER,third,chat.CHAT_GENDERFEMALE]);putString(vm,200,"Ranger");invoke(state,vm,base,[chat.OP_SET_CHAT_NAME,third,200,5])
  checks=checks+require(pools.chatState(resources,third).gender==1 and pools.chatState(resources,third).name=="Ranger" and pools.chatState(resources,third).client==5,"identity trap ABI")
  vm.data[1022]=65;vm.data[1023]=66;checks=checks+require((try(invoke(state,vm,base,[chat.OP_LOAD_CHAT_FILE,third,1022,140]))) is error and (try(traps.dispatch(state,vm,base,525))) is error,"trap pointer and opcode bounds")
  checks=checks+require(before==2 and c.reads==state.fileReads,"loader read accounting includes preprocess includes")
  print("PASS: "+str(checks)+" AI chat profile contracts");return 0
end function
