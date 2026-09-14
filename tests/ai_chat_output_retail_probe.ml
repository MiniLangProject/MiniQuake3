import mq3.format.pk3 as pk3
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_chat_profiles as profiles
import mq3.botlib.ai_chat_strings as chatText
import mq3.botlib.ai_chat_output as chat
import mq3.botlib.elementary_actions as ea

struct Context archive commands random end struct
function require(ok,label) if not ok then return error(7576,"retail chat output: "+label) end if;return 1 end function
function readFile(c,path) return pk3.read(c.archive,path) end function
function time(c) return 100.0 end function
function random(c) return c.random end function
function command(c,client,text) c.commands=c.commands+[str(client)+":"+text];return 0 end function
function main(args)
  if len(args)!=1 then return 2 end if;archive=pk3.open(args[0]);if archive is error then return archive end if;c=Context(archive,[],0.0);resources=pools.create();handle=pools.allocChatState(resources)
  profileState=profiles.create(resources,c,readFile);stringState=chatText.create(c,readFile);actions=ea.create(4,command,c);state=chat.create(profileState,stringState,actions,c,readFile,time,random);checks=0
  checks=checks+require(profiles.loadChatFile(profileState,handle,"bots/sarge_t.c","sarge")==0,"Sarge profile loads");profiles.setChatName(profileState,handle,"Sarge",0);profiles.setChatGender(profileState,handle,profiles.CHAT_GENDERMALE)
  checks=checks+require(chat.ensureLoaded(state)==0 and len(state.randomLists)>100 and len(state.replies)>100,"complete rnd.c and rchat.c parse")
  checks=checks+require(chat.initialChat(state,handle,"game_enter",0,["Sarge","Ranger",void,void,"Q3DM1",void,void,void])==0 and chat.chatLength(state,handle)>0,"retail initial-chat construction")
  message=pools.chatState(resources,handle).chatMessage;checks=checks+require(len(bytes(message))<256,"retail message bound")
  checks=checks+require(chat.enterChat(state,handle,0,chat.CHAT_ALL)==0 and len(c.commands)==1 and pools.chatState(resources,handle).chatMessage=="","retail command delivery")
  reply=chat.replyChat(state,handle,"hello Sarge",0,0,[void,void,void,void,void,void,void,void]);checks=checks+require(reply==1 and chat.chatLength(state,handle)>0,"retail reply selection")
  print("PASS: retail chat-output checks="+str(checks)+" random="+str(len(state.randomLists))+" replies="+str(len(state.replies)));return 0
end function
