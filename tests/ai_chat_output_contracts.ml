import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_chat_profiles as profiles
import mq3.botlib.ai_chat_strings as chatText
import mq3.botlib.ai_chat_output as chat
import mq3.botlib.ai_chat_output_syscalls as traps
import mq3.botlib.ai_chat_matches as matches
import mq3.botlib.elementary_actions as ea
import mq3.compat.numeric as n

struct Context paths texts clock randoms randomAt commands end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7573,"chat output contract: "+label) end if;return 1 end function
function readFile(c,path) for index=0 to len(c.paths)-1 if c.paths[index]==path then return c.texts[index] end if end for;return error(7572,"missing "+path) end function
function time(c) return c.clock end function
function random(c) if c.randomAt>=len(c.randoms) then return 0.1 end if;value=c.randoms[c.randomAt];c.randomAt=c.randomAt+1;return value end function
function command(c,client,text) c.commands=c.commands+[str(client)+":"+text];return 0 end function
function putString(vm,at,text) value=bytes(text);copyBytes(vm.data,at,value,0,len(value));vm.data[at+len(value)]=0 end function
function invoke(state,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return traps.dispatch(state,vm,base,values[0]) end function
function main(args)
  profileText="chat \"sarge\" { type \"hello\" { \"fixed \" , 0; GREETING, \" \" , 1; } }"
  randomText="GREETING = { \"Hi\"; \"Yo\"; }\nweapon = { \"rocket\"; }"
  replyText="[\"hello\"] = 5 { \"Reply \" , 0; }\n[!\"bye\", (\"who is \" , 0)] = 8 { \"It is \" , 0; }"
  synonymText=""
  c=Context(["botfiles/bots/t.c","botfiles/rnd.c","botfiles/rchat.c","botfiles/syn.c"],[profileText,randomText,replyText,synonymText],100.0,[0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1],0,[])
  resources=pools.create();handle=pools.allocChatState(resources);profileState=profiles.create(resources,c,readFile);stringState=chatText.create(c,readFile);actions=ea.create(4,command,c);state=chat.create(profileState,stringState,actions,c,readFile,time,random);checks=0
  checks=checks+require(profiles.loadChatFile(profileState,handle,"bots/t.c","sarge")==0,"profile fixture loads");profiles.setChatName(profileState,handle,"Sarge",2)
  checks=checks+require(chat.ensureLoaded(state)==0 and len(state.randomLists)==2 and len(state.replies)==2,"random and reply data parse")
  chat.initialChat(state,handle,"hello",0,["Alice",void,void,void,void,void,void,void]);message=pools.chatState(resources,handle).chatMessage
  checks=checks+require(message=="Yo " or message=="Hi ","initial random expansion and nullable variable")
  checks=checks+require(chat.chatLength(state,handle)==len(bytes(message)),"byte chat length")
  pools.chatState(resources,handle).chatMessage="a~~b~c";chat.enterChat(state,handle,0,chat.CHAT_TEAM)
  checks=checks+require(c.commands[len(c.commands)-1]=="2:say_team a~bc" and pools.chatState(resources,handle).chatMessage=="","team delivery and released tilde behavior")
  pools.chatState(resources,handle).chatMessage="tell";chat.enterChat(state,handle,7,chat.CHAT_TELL);checks=checks+require(c.commands[len(c.commands)-1]=="2:tell 7 tell","tell delivery")
  result=chat.replyChat(state,handle,"hello there",0,0,["Bob",void,void,void,void,void,void,void]);checks=checks+require(result==1 and pools.chatState(resources,handle).chatMessage=="Reply Bob","reply string key and explicit variable")
  result=chat.replyChat(state,handle,"who is Ranger",0,0,[void,void,void,void,void,void,void,void]);checks=checks+require(result==1 and pools.chatState(resources,handle).chatMessage=="It is Ranger","reply template captures variable")

  vm=Machine(bytes(1024,0),1023);base=900;putString(vm,100,"hello");putString(vm,130,"QVM")
  checks=checks+require(invoke(state,vm,base,[chat.OP_INITIAL_CHAT,handle,100,0,130,0,0,0,0,0,0,0])==0 and invoke(state,vm,base,[chat.OP_CHAT_LENGTH,handle])>0,"initial and length syscall ABI")
  checks=checks+require(invoke(state,vm,base,[chat.OP_ENTER_CHAT,handle,0,chat.CHAT_ALL])==0 and c.commands[len(c.commands)-1]=="2:say fixed QVM","enter syscall ABI")
  putString(vm,160,"hello again");checks=checks+require(invoke(state,vm,base,[chat.OP_REPLY_CHAT,handle,160,0,0,130,0,0,0,0,0,0,0])==1,"reply syscall ABI")
  vm.data[1023]=65;checks=checks+require((try(invoke(state,vm,base,[chat.OP_INITIAL_CHAT,handle,1023,0,0,0,0,0,0,0,0,0]))) is error and (try(traps.dispatch(state,vm,base,517))) is error,"pointer and opcode validation")

  // Released selection quirks: a zero besttime is treated as unset, and the
  // reply loop decrements before rejecting a recent line.
  c.clock=0.0-1.0;zero=profiles.Message("zero",[],0.0);ten=profiles.Message("ten",[],10.0);twenty=profiles.Message("twenty",[],20.0)
  checks=checks+require(chat.choose([zero,ten,twenty],state,false)==ten,"initial-chat zero-time oldest fallback")
  c.clock=100.0;recent=profiles.Message("recent",[],200.0);available=profiles.Message("available",[],50.0)
  checks=checks+require(chat.chooseReply([recent,available],state)==recent,"released reply decrement precedes recent check")

  // bestpriority is an int in be_ai_chat.c: 5.9 stores as 5, allowing a later
  // 5.1 rule to replace it even though its float priority is lower.
  high=profiles.Message("high",[profiles.Component(profiles.COMPONENT_FIXED,"high",0)],-40.0);low=profiles.Message("low",[profiles.Component(profiles.COMPONENT_FIXED,"low",0)],-40.0);key=chat.ReplyKey(chat.KEY_STRING,"priority",[])
  state.replies=[chat.Reply([key],5.9,[high]),chat.Reply([key],5.1,[low])];state.loaded=true
  checks=checks+require(chat.replyChat(state,handle,"priority",0,0,[void,void,void,void,void,void,void,void])==1 and pools.chatState(resources,handle).chatMessage=="low","released integer best-priority truncation")
  failedPieces=[matches.Piece(-1,["prefix "]),matches.Piece(0,[]),matches.Piece(-1,[" chosen"]),matches.Piece(-1,["missing"])]
  capture=profiles.Message("",[profiles.Component(profiles.COMPONENT_VARIABLE,"",0)],-40.0);state.replies=[chat.Reply([chat.ReplyKey(chat.KEY_VARIABLES,"",failedPieces)],9.0,[high]),chat.Reply([chat.ReplyKey(chat.KEY_STRING,"chosen",[])],8.0,[capture])]
  checks=checks+require(chat.replyChat(state,handle,"prefix leaked chosen",0,0,[void,void,void,void,void,void,void,void])==1 and pools.chatState(resources,handle).chatMessage=="leaked","reply rules share the released match scratch state")

  // Weighted replacements happen after every random expansion, and reply
  // synonyms are canonicalized at each whitespace-delimited word.
  nested=Context(["botfiles/rnd.c","botfiles/rchat.c","botfiles/syn.c"],["OUTER = { \"alias \", INNER; } INNER = { \"done\"; }","", "1 { [(\"canon\",1),(\"alias\",0),(\"cant\",0)] }"],100.0,[0.0,0.5,0.0,0.5],0,[])
  nestedStrings=chatText.create(nested,readFile);nestedState=chat.create(profileState,nestedStrings,actions,nested,readFile,time,random);checks=checks+require(chat.setup(nestedState,true)==0 and len(nestedState.replies)==0,"nochat setup omits reply file")
  outer=profiles.Message("",[profiles.Component(profiles.COMPONENT_RANDOM,"OUTER",0)],-40.0);checks=checks+require(chat.construct(nestedState,outer,[void,void,void,void,void,void,void,void],1,0,false)=="canon done","weighted synonym replacement on recursive expansions")
  checks=checks+require(chat.replaceReplySynonyms(nestedState,"I cant today",1)=="I canon today","reply synonym scans beyond the first word")
  before=state.fileReads;chat.shutdown(state);checks=checks+require(not state.loaded and len(state.randomLists)==0 and len(state.replies)==0,"chat shutdown releases global output tables");checks=checks+require(chat.ensureLoaded(state)==0 and state.fileReads==before+2,"chat setup reloads rnd and reply tables")
  print("PASS: "+str(checks)+" AI chat-output contracts");return 0
end function
