import mq3.format.pk3 as pk3
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_chat_profiles as chat
import mq3.botlib.ai_chat_syscalls as traps
import mq3.compat.numeric as n

struct Context archive reads end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7577,"Sarge chat: "+label) end if;return 1 end function
function readFile(c,path) c.reads=c.reads+1;return pk3.read(c.archive,path) end function
function putString(vm,at,text) value=bytes(text);copyBytes(vm.data,at,value,0,len(value));vm.data[at+len(value)]=0 end function
function invoke(state,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return traps.dispatch(state,vm,base,values[0]) end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if
  c=Context(archive,0);resources=pools.create();state=chat.create(resources,c,readFile);handle=pools.allocChatState(resources);checks=0
  vm=Machine(bytes(1024,0),1023);base=900;putString(vm,100,"bots/sarge_t.c");putString(vm,140,"sarge")
  checks=checks+require(invoke(state,vm,base,[chat.OP_LOAD_CHAT_FILE,handle,100,140])==chat.BLERR_NOERROR,"retail load syscall")
  profile=pools.chatState(resources,handle).chat;checks=checks+require(profile!=void and profile.filename=="bots/sarge_t.c" and profile.chatName=="sarge","retail profile identity")
  checks=checks+require(chat.typeByName(profile,"whois")!=void and chat.typeByName(profile,"game_enter")!=void and chat.typeByName(profile,"random_misc")!=void,"included and Sarge chat types")
  checks=checks+require(len(chat.typeByName(profile,"whois").messages)==5 and len(chat.typeByName(profile,"game_enter").messages)==6,"retail exact message counts")
  enter=chat.typeByName(profile,"game_enter");checks=checks+require(enter.messages[1].components[1].kind==chat.COMPONENT_VARIABLE and enter.messages[0].components[0].kind==chat.COMPONENT_RANDOM and enter.messages[0].components[0].text=="HELLO5","retail variable and random references")
  invoke(state,vm,base,[chat.OP_SET_CHAT_GENDER,handle,chat.CHAT_GENDERMALE]);putString(vm,200,"Sarge");invoke(state,vm,base,[chat.OP_SET_CHAT_NAME,handle,200,0]);value=pools.chatState(resources,handle)
  checks=checks+require(value.gender==2 and value.name=="Sarge" and value.client==0,"retail SetupClient identity")
  reads=state.fileReads;second=pools.allocChatState(resources);checks=checks+require(chat.loadChatFile(state,second,"bots/sarge_t.c","sarge")==0 and state.fileReads==reads,"retail profile cache")
  checks=checks+require(profile.messageCount>200 and len(profile.types)>30,"complete included profile, not setup stub")
  print("PASS: retail Sarge chat checks="+str(checks)+" types="+str(len(profile.types))+" messages="+str(profile.messageCount)+" files="+str(state.fileReads));return 0
end function
