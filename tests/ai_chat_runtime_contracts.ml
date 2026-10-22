import mq3.botlib.ai_chat_runtime as chat
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_chat_profiles as profiles
import mq3.botlib.ai_chat_matches as matches
import mq3.botlib.ai_chat_output as output
import mq3.botlib.elementary_actions as ea

struct Context paths texts clock randoms randomAt commands end struct
function require(ok,label) if not ok then return error(7636,"AI chat runtime contract: "+label) end if;return 1 end function
function readFile(context,path) for index=0 to len(context.paths)-1 if context.paths[index]==path then return context.texts[index] end if end for;return error(7635,"missing "+path) end function
function time(context) return context.clock end function
function random(context) if context.randomAt>=len(context.randoms) then return 0.0 end if;value=context.randoms[context.randomAt];context.randomAt=context.randomAt+1;return value end function
function command(context,client,text) context.commands=context.commands+[str(client)+":"+text];return 0 end function

function main(args)
  profileText="chat \"sarge\" { type \"hello\" { \"Hello \" , 0; GREETING, \" \" , 1; } }"
  randomText="GREETING = { \"Hi\"; \"Yo\"; } weapon = { \"rocket\"; }"
  replyText="[\"hello\"] = 5 { \"Reply \" , 0; }"
  matchText="1 { \"hello \", 0 = (7, 3); }"
  synonymText="1 { [(\"canonical\",1),(\"alias\",0)] }"
  context=Context(["botfiles/bots/t.c","botfiles/rnd.c","botfiles/rchat.c","botfiles/match.c","botfiles/syn.c"],[profileText,randomText,replyText,matchText,synonymText],100.0,[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],0,[])
  actions=ea.create(8,command,context);state=chat.create(context,readFile,time,random,actions);checks=0

  checks=checks+require(chat.botSetupChatAI(state,false,8)==0 and state.setup,"complete setup lifecycle")
  checks=checks+require(len(state.strings.groups)==1 and len(state.output.randomLists)==2 and len(state.output.replies)==1 and len(state.matches.templates)==1,"four retail parser families owned")
  handle=chat.botAllocChatState(state);checks=checks+require(handle==1 and chat.botChatStateFromHandle(state,handle)!=void,"chat-state allocation and lookup")
  checks=checks+require(chat.botLoadChatFile(state,handle,"bots/t.c","sarge")==0,"initial chat profile load")
  chat.botSetChatName(state,handle,"Sarge",3);chat.botSetChatGender(state,handle,profiles.CHAT_GENDERMALE);cs=chat.botChatStateFromHandle(state,handle)
  checks=checks+require(cs.name=="Sarge" and cs.client==3 and cs.gender==profiles.CHAT_GENDERMALE,"name gender and client state")
  checks=checks+require(chat.botNumInitialChats(state,handle,"hello")==2,"initial chat count")
  selected=chat.botChooseInitialChatMessage(state,handle,"hello");checks=checks+require(selected!=void,"initial message selection")
  checks=checks+require(len(chat.botCheckInitialChatIntegrety(state,cs.chat))==0,"initial random-reference integrity")
  chat.botInitialChat(state,handle,"hello",1,["Ranger",void,void,void,void,void,void,void]);checks=checks+require(chat.botChatLength(state,handle)>0,"initial construction and byte length")
  message=chat.botGetChatMessage(state,handle,256);checks=checks+require(len(bytes(message))>0 and chat.stringContains(message,"Ranger",true)>=0,"get consumes constructed message")
  checks=checks+require(chat.botChatLength(state,handle)==0,"get clears chat buffer")

  checks=checks+require(chat.botQueueConsoleMessage(state,handle,4,"hello console")>0 and chat.botNumConsoleMessages(state,handle)==1,"console allocation and queue")
  queued=chat.botNextConsoleMessage(state,handle);checks=checks+require(queued!=void and queued.type==4,"console FIFO copy")
  chat.botRemoveConsoleMessage(state,handle,queued.handle);checks=checks+require(chat.botNumConsoleMessages(state,handle)==0,"console remove and free list")
  raw=chat.allocConsoleMessage(state);checks=checks+require(raw!=void,"raw heap allocation");chat.freeConsoleMessage(state,raw)

  checks=checks+require(chat.botReplaceSynonyms(state,"an alias",1)=="an canonical","canonical synonym replacement")
  checks=checks+require(chat.botReplaceReplySynonyms(state,"alias now",1)=="canonical now","reply synonym replacement")
  checks=checks+require(chat.randomString(state,"weapon")=="rocket","named random string")
  checks=checks+require(chat.stringContains("Alpha beta","BETA",false)==6 and chat.stringContains("Alpha beta","BETA",true)==-1,"case-sensitive substring modes")
  checks=checks+require(chat.stringContainsWord("alpha,beta!gamma","BETA",false)==6,"whole-word search")
  checks=checks+require(chat.stringReplaceWords("alias alias","alias","canonical")=="canonical alias","released adjacent-word replacement traversal")
  checks=checks+require(chat.unifyWhiteSpaces("  alpha\n beta  ")=="alpha beta" and chat.botRemoveTildes("a~~b~c")=="a~bc","released whitespace and tilde quirks")
  checks=checks+require(not chat.isWhiteSpace(63) and chat.isWhiteSpace(32),"whitespace classifier")

  found=chat.botFindMatch(state,"hello Ranger",1);checks=checks+require(found!=void and found.type==7 and chat.botMatchVariable(found,0,256)=="Ranger","match template and variable")
  pieces=[matches.Piece(-1,["hello "]),matches.Piece(0,[])];scratch=matches.emptyMatch("hello Xaero");checks=checks+require(chat.stringsMatch(pieces,scratch) and chat.botMatchVariable(scratch,0,256)=="Xaero","piece matcher")
  checks=checks+require(chat.botFindStringInList(["One","TWO"],"two")==1,"string-list lookup")
  absent=profiles.Message("",[profiles.Component(profiles.COMPONENT_RANDOM,"ABSENT",0)],0.0);checks=checks+require(len(chat.botCheckChatMessageIntegrety(absent,["GREETING"]))==1,"missing random reference detected")
  checks=checks+require(chat.botCheckValidReplyChatKeySet([output.ReplyKey(output.KEY_STRING,"x",[])]) and not chat.botCheckValidReplyChatKeySet([output.ReplyKey(output.KEY_NOT|output.KEY_STRING,"x",[])]),"reply-key set validation")
  checks=checks+require(len(chat.botCheckReplyChatIntegrety(state,state.output.replies))==0,"reply integrity")

  chat.botReplyChat(state,handle,"hello there",1,1,["Arena",void,void,void,void,void,void,void]);checks=checks+require(cs.chatMessage=="Reply Arena","reply selection and construction")
  checks=checks+require(chat.botEnterChat(state,handle,0,output.CHAT_TEAM)==0 and context.commands[len(context.commands)-1]=="3:say_team Reply Arena","typed chat output boundary")
  state.output.replies[0].messages[0].recentTime=90.0;chat.botResetChatAI(state);checks=checks+require(state.output.replies[0].messages[0].recentTime==0.0,"reply recency reset")
  checks=checks+require(chat.botPrintReplyChatKeys(state,state.output.replies)==1 and len(state.diagnostics)>0,"deterministic diagnostics")

  chat.botFreeChatFile(state,handle);checks=checks+require(cs.chat==void,"per-state chat-file release")
  chat.botFreeChatState(state,handle);checks=checks+require(chat.botChatStateFromHandle(state,handle)==void,"chat state release")
  chat.botShutdownChatAI(state);checks=checks+require(not state.setup and not state.output.loaded and len(state.matches.templates)==0 and len(state.strings.groups)==0,"complete shutdown lifecycle")
  print("PASS: "+str(checks)+" complete be_ai_chat runtime contracts");return 0
end function
