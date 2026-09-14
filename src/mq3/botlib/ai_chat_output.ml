// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Initial/reply chat construction and delivery from be_ai_chat.c.
package mq3.botlib.ai_chat_output

import mq3.botlib.ai_chat_profiles as profiles
import mq3.botlib.ai_chat_matches as matches
import mq3.botlib.ai_chat_strings as chatStrings
import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.elementary_actions as ea
import mq3.vm.pc_parser as pc
import mq3.compat.numeric as n
import std.string as strings

const OP_INITIAL_CHAT=513
const OP_REPLY_CHAT=514
const OP_CHAT_LENGTH=515
const OP_ENTER_CHAT=516
const CHAT_ALL=0
const CHAT_TEAM=1
const CHAT_TELL=2
const RECENT_TIME=20.0
const MAX_MESSAGE_SIZE=256

const KEY_AND=1
const KEY_NOT=2
const KEY_NAME=4
const KEY_STRING=8
const KEY_VARIABLES=16
const KEY_BOTNAMES=32
const KEY_FEMALE=64
const KEY_MALE=128
const KEY_GENDERLESS=256

struct RandomList name messages end struct
struct ReplyKey flags text pieces end struct
struct Reply keys priority messages end struct
struct Reader registry source pending end struct
struct Loader state end struct
struct State profiles strings actions context readFn timeFn randomFn randomLists replies loaded fileReads end struct

function fail(message) return error(7574,"AI chat output: "+message) end function
function create(profileState,stringState,actions,context,readFn,timeFn,randomFn) return State(profileState,stringState,actions,context,readFn,timeFn,randomFn,[],[],false,0) end function
function clear(state) if state!=void then state.randomLists=[];state.replies=[];state.loaded=false end if;return 0 end function
function shutdown(state) return clear(state) end function
function now(state) if state.timeFn==void then return 0.0 end if;return state.timeFn(state.context) end function
function randomValue(state) if state.randomFn==void then return 0.0 end if;value=state.randomFn(state.context);if value<0.0 then return 0.0 else if value>=1.0 then return 0.999999 end if;return value end function
function loadText(loader,name)
  if loader==void or loader.state==void or loader.state.readFn==void then return fail("file callback missing") end if
  loader.state.fileReads=loader.state.fileReads+1;return loader.state.readFn(loader.state.context,profiles.botPath(name))
end function
function next(reader) if reader.pending!=void then value=reader.pending;reader.pending=void;return value end if;return pc.read(reader.registry,reader.source) end function
function unread(reader,value) reader.pending=value;return 0 end function
function expect(reader,text) value=next(reader);if value==void or value is error or value.text!=text then return fail("expected "+text) end if;return value end function
function message(reader,first) return profiles.readMessage(reader.registry,reader.source,first) end function

function parseRandomLists(state)
  loader=Loader(state);registry=pc.create(loader,loadText);source=pc.load(registry,"rnd.c");if source==0 then return fail("cannot load rnd.c") end if;reader=Reader(registry,source,void);values=[]
  while true
    name=next(reader);if name==void then break end if;if name is error or name.type!=pc.TT_NAME then pc.free(registry,source);return fail("expected random-list name") end if
    if expect(reader,"=") is error or expect(reader,"{") is error then pc.free(registry,source);return fail("invalid random-list header") end if;messages=[]
    while true
      first=next(reader);if first==void or first is error then pc.free(registry,source);return fail("unterminated random list "+name.text) end if
      if first.text=="}" then break end if;value=message(reader,first);if value is error then pc.free(registry,source);return value end if;messages=[value]+messages
    end while;values=values+[RandomList(name.text,messages)]
  end while;pc.free(registry,source);return values
end function
function parseReplyPieces(reader)
  pieces=[];lastVariable=false
  while true
    token=next(reader);if token==void or token is error then return fail("unterminated reply match") end if
    if token.type==pc.TT_NUMBER and (token.subtype&pc.TT_INTEGER)!=0 then
      if token.intValue<0 or token.intValue>=8 or lastVariable then return fail("invalid adjacent reply variable") end if;pieces=pieces+[matches.Piece(token.intValue,[])];lastVariable=true
    else if token.type==pc.TT_STRING then
      alternatives=[token.text];hasEmpty=token.text=="";separator=next(reader)
      while separator!=void and not (separator is error) and separator.text=="|"
        alternative=next(reader);if alternative==void or alternative is error or alternative.type!=pc.TT_STRING then return fail("invalid reply alternative") end if;alternatives=alternatives+[alternative.text];if alternative.text=="" then hasEmpty=true end if;separator=next(reader)
      end while;if separator==void or separator is error then return fail("unterminated reply match") end if;unread(reader,separator);pieces=pieces+[matches.Piece(-1,alternatives)];if not hasEmpty then lastVariable=false end if
    else return fail("invalid reply match piece") end if
    separator=next(reader);if separator==void or separator is error then return fail("unterminated reply match") end if;if separator.text==")" then return pieces end if;if separator.text!="," then return fail("invalid reply match separator") end if
  end while
end function
function parseReplyKey(reader)
  flags=0;token=next(reader);if token==void or token is error then return fail("missing reply key") end if
  if token.text=="&" then flags=KEY_AND;token=next(reader) else if token.text=="!" then flags=KEY_NOT;token=next(reader) end if
  if token==void or token is error then return fail("missing reply key body") end if
  if token.text=="name" then return ReplyKey(flags|KEY_NAME,"",[]) end if
  if token.text=="female" then return ReplyKey(flags|KEY_FEMALE,"",[]) end if
  if token.text=="male" then return ReplyKey(flags|KEY_MALE,"",[]) end if
  if token.text=="it" then return ReplyKey(flags|KEY_GENDERLESS,"",[]) end if
  if token.text=="(" then pieces=parseReplyPieces(reader);if pieces is error then return pieces end if;return ReplyKey(flags|KEY_VARIABLES,"",pieces) end if
  if token.text=="<" then
    names="";while true value=next(reader);if value==void or value is error or value.type!=pc.TT_STRING then return fail("invalid reply bot name") end if;if names!="" then names=names+"\\" end if;names=names+value.text;separator=next(reader);if separator==void or separator is error then return fail("unterminated bot names") end if;if separator.text==">" then break end if;if separator.text!="," then return fail("invalid bot-name separator") end if end while;return ReplyKey(flags|KEY_BOTNAMES,names,[])
  end if
  if token.type!=pc.TT_STRING then return fail("reply string key expected, found "+token.text) end if;return ReplyKey(flags|KEY_STRING,token.text,[])
end function
function parseReplies(state)
  loader=Loader(state);registry=pc.create(loader,loadText);source=pc.load(registry,"rchat.c");if source==0 then return fail("cannot load rchat.c") end if;reader=Reader(registry,source,void);values=[]
  while true
    token=next(reader);if token==void then break end if;if token is error or token.text!="[" then pc.free(registry,source);return fail("expected reply key list") end if;keys=[]
    while true
      key=parseReplyKey(reader);if key is error then pc.free(registry,source);return key end if;keys=[key]+keys;separator=next(reader);if separator==void or separator is error then pc.free(registry,source);return fail("unterminated reply keys") end if
      while separator.type==pc.TT_STRING and (key.flags&KEY_STRING)!=0 key.text=key.text+separator.text;separator=next(reader);if separator==void or separator is error then pc.free(registry,source);return fail("unterminated reply keys") end if end while
      if separator.text=="]" then break end if;if separator.text!="," then pc.free(registry,source);return fail("invalid reply-key separator, found "+separator.text) end if
      afterComma=next(reader);if afterComma==void or afterComma is error then pc.free(registry,source);return fail("unterminated reply keys") end if;if afterComma.text=="]" then break end if;unread(reader,afterComma)
    end while
    if expect(reader,"=") is error then pc.free(registry,source);return fail("missing reply priority") end if;priority=next(reader);if priority==void or priority is error or priority.type!=pc.TT_NUMBER then pc.free(registry,source);return fail("invalid reply priority") end if
    if expect(reader,"{") is error then pc.free(registry,source);return fail("missing reply body") end if;messages=[]
    while true
      first=next(reader);if first==void or first is error then pc.free(registry,source);return fail("unterminated reply body") end if;if first.text=="}" then break end if
      value=message(reader,first);if value is error then pc.free(registry,source);return value end if;value.recentTime=-40.0;messages=[value]+messages
    end while;values=[Reply(keys,priority.floatValue,messages)]+values
  end while;pc.free(registry,source);return values
end function
function setup(state,noChat)
  if state==void then return fail("state missing") end if;if state.loaded then return 0 end if
  if state.strings!=void then loadedSynonyms=chatStrings.ensureLoaded(state.strings);if loadedSynonyms is error then return loadedSynonyms end if end if
  randomLists=parseRandomLists(state);if randomLists is error then return randomLists end if;replies=[]
  if not noChat then replies=parseReplies(state);if replies is error then return replies end if end if
  state.randomLists=randomLists;state.replies=replies;state.loaded=true;return 0
end function
function ensureLoaded(state) return setup(state,false) end function

function choose(messages,state,updateRecent)
  time=now(state);available=[];for each value in messages if value.recentTime<=time then available=available+[value] end if end for
  if len(available)==0 then best=void;bestTime=0.0;for each value in messages if bestTime==0.0 or value.recentTime<bestTime then best=value;bestTime=value.recentTime end if end for;return best end if
  index=n.trunc32(randomValue(state)*len(available));value=available[index];if updateRecent then value.recentTime=time+RECENT_TIME end if;return value
end function
// Preserve BotReplyChat's released loop order: --num is evaluated before the
// recent-message test, unlike BotChooseInitialChatMessage.
function chooseReply(messages,state)
  time=now(state);available=0;for each value in messages if value.recentTime<=time then available=available+1 end if end for;n=n.trunc32(randomValue(state)*available)
  for each value in messages n=n-1;if n<0 then return value end if;if value.recentTime>time then continue end if end for;return void
end function
function randomList(state,name) for each value in state.randomLists if value.name==name then return value end if end for;return void end function
function replaceReplySynonyms(state,value,context)
  if context==0 or state.strings==void then return value end if;ready=chatStrings.ensureLoaded(state.strings);if ready is error then return value end if
  cursor=0
  while cursor<len(bytes(value))
    data=bytes(value);while cursor<len(data) and data[cursor]<=32 cursor=cursor+1 end while;if cursor>=len(data) then break end if;replaced=false
    for each group in state.strings.groups
      if (group.context&context)!=0 then canonical=group.synonyms[0].value;for index=1 to len(group.synonyms)-1 if chatStrings.findWord(value,group.synonyms[index].value,cursor)==cursor and chatStrings.findWord(value,canonical,cursor)!=cursor then value=chatStrings.replaceRange(value,cursor,len(bytes(group.synonyms[index].value)),canonical);replaced=true;break end if end for end if
      if replaced then break end if
    end for;data=bytes(value);while cursor<len(data) and data[cursor]>32 cursor=cursor+1 end while
  end while;return value
end function
function replaceWeightedSynonyms(state,value,context)
  if context==0 or state.strings==void then return value end if;ready=chatStrings.ensureLoaded(state.strings);if ready is error then return value end if
  for each group in state.strings.groups
    if (group.context&context)!=0 then total=0.0;for each synonym in group.synonyms total=total+synonym.weight end for;weight=randomValue(state)*total;if weight!=0.0 then current=0.0;replacement=void;for each synonym in group.synonyms current=current+synonym.weight;if weight<current then replacement=synonym;break end if end for;if replacement!=void then for each synonym in group.synonyms if synonym!=replacement then value=chatStrings.replaceWords(value,synonym.value,replacement.value) end if end for end if end if end if
  end for;return value
end function
function expandOnce(state,components,variables,vcontext,reply)
  output="";expanded=false
  for each component in components
    piece=""
    if component.kind==profiles.COMPONENT_FIXED then piece=component.text
    else if component.kind==profiles.COMPONENT_VARIABLE then if component.number>=0 and component.number<len(variables) and variables[component.number]!=void then piece=variables[component.number];if reply then piece=replaceReplySynonyms(state,piece,vcontext) else if vcontext!=0 and state.strings!=void then changed=chatStrings.replaceSynonyms(state.strings,piece,vcontext);if not (changed is error) then piece=changed end if end if end if
    else if component.kind==profiles.COMPONENT_RANDOM then list=randomList(state,component.text);if list==void or len(list.messages)==0 then return fail("unknown random string "+component.text) end if;selected=choose(list.messages,state,false);piece=selected.encoded;expanded=true
    end if
    if len(bytes(output))+len(bytes(piece))>=MAX_MESSAGE_SIZE then return fail("constructed chat message too long") end if;output=output+piece
  end for;return [output,expanded]
end function
function componentsFromEncoded(value)
  data=bytes(value);fixed="";parts=[];index=0
  while index<len(data)
    if data[index]!=1 then fixed=fixed+decode(slice(data,index,1));index=index+1
    else
      if fixed!="" then parts=parts+[profiles.Component(profiles.COMPONENT_FIXED,fixed,0)];fixed="" end if;index=index+1;if index>=len(data) then break end if;kind=data[index];index=index+1;start=index;while index<len(data) and data[index]!=1 index=index+1 end while;body=decode(slice(data,start,index-start));if index<len(data) then index=index+1 end if
      if kind==118 then parts=parts+[profiles.Component(profiles.COMPONENT_VARIABLE,"",n.trunc32(toNumber(body)))] else if kind==114 then parts=parts+[profiles.Component(profiles.COMPONENT_RANDOM,body,0)] end if
    end if
  end while;if fixed!="" then parts=parts+[profiles.Component(profiles.COMPONENT_FIXED,fixed,0)] end if;return parts
end function
function construct(state,message,variables,context,vcontext,reply)
  current=message;iteration=0;output=""
  while iteration<10
    result=expandOnce(state,current.components,variables,vcontext,reply);if result is error then return result end if;output=replaceWeightedSynonyms(state,result[0],context);if not result[1] then return output end if
    current=profiles.Message(output,componentsFromEncoded(output),-40.0);iteration=iteration+1
  end while;return output
end function
function cloneMatch(value)
  offsets=[];lengths=[];for index=0 to 7 offsets=offsets+[value.offsets[index]];lengths=lengths+[value.lengths[index]] end for;return matches.Match(value.string,value.type,value.subtype,offsets,lengths)
end function
function chatState(state,handle) if state==void or state.profiles==void then return void end if;return pools.chatState(state.profiles.pools,handle) end function
function initialChat(state,handle,type,context,variables)
  cs=chatState(state,handle);if cs==void or cs.chat==void then return 0 end if;ready=ensureLoaded(state);if ready is error then return ready end if;selected=profiles.typeByName(cs.chat,type);if selected==void then return 0 end if;message=choose(selected.messages,state,true);if message==void then return 0 end if;value=construct(state,message,variables,context,0,false);if value is error then return value end if;cs.chatMessage=value;return 0
end function
function keyResult(key,cs,message,match)
  if (key.flags&KEY_NAME)!=0 then return matches.stringContains(message,cs.name,false)>=0 end if
  if (key.flags&KEY_BOTNAMES)!=0 then return matches.stringContains(key.text,cs.name,false)>=0 end if
  if (key.flags&KEY_FEMALE)!=0 then return cs.gender==profiles.CHAT_GENDERFEMALE end if
  if (key.flags&KEY_MALE)!=0 then return cs.gender==profiles.CHAT_GENDERMALE end if
  if (key.flags&KEY_GENDERLESS)!=0 then return cs.gender==profiles.CHAT_GENDERLESS end if
  if (key.flags&KEY_VARIABLES)!=0 then return matches.stringsMatch(key.pieces,match) end if
  return chatStrings.findWord(message,key.text,0)>=0
end function
function replyMatches(reply,cs,message,match)
  found=false
  for each key in reply.keys
    result=keyResult(key,cs,message,match)
    if (key.flags&KEY_AND)!=0 then if not result then return false end if
    else if (key.flags&KEY_NOT)!=0 then if result then return false end if
    else if result then found=true end if
  end for;return found
end function
function replyChat(state,handle,message,mcontext,vcontext,variables)
  cs=chatState(state,handle);if cs==void then return 0 end if;ready=ensureLoaded(state);if ready is error then return ready end if
  best=void;bestMessage=void;bestPriority=-1;bestMatch=void;match=matches.Match(message,0,0,[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0])
  for each reply in state.replies
    if replyMatches(reply,cs,message,match) and reply.priority>bestPriority then selected=chooseReply(reply.messages,state);if selected!=void then best=reply;bestMessage=selected;bestPriority=n.trunc32(reply.priority);bestMatch=cloneMatch(match) end if end if
  end for
  if bestMessage==void then return 0 end if
  combined=array(8,void);for index=0 to 7 if bestMatch.offsets[index]>=0 then combined[index]=matches.matchVariable(bestMatch,index,MAX_MESSAGE_SIZE) end if;if variables[index]!=void then combined[index]=variables[index] end if end for
  value=construct(state,bestMessage,combined,mcontext,vcontext,true);if value is error then return value end if;bestMessage.recentTime=now(state)+RECENT_TIME;cs.chatMessage=value;return 1
end function
function chatLength(state,handle) cs=chatState(state,handle);if cs==void then return 0 end if;return len(bytes(cs.chatMessage)) end function
function removeTildes(value)
  data=bytes(value);output=bytes(len(data),0);readAt=0;writeAt=0;while readAt<len(data) if data[readAt]==126 then readAt=readAt+1;if readAt<len(data) and data[readAt]==126 then output[writeAt]=126;writeAt=writeAt+1;readAt=readAt+1 end if else output[writeAt]=data[readAt];writeAt=writeAt+1;readAt=readAt+1 end if end while;return decode(slice(output,0,writeAt))
end function
function enterChat(state,handle,clientTo,sendTo)
  cs=chatState(state,handle);if cs==void or cs.chatMessage=="" then return 0 end if;message=removeTildes(cs.chatMessage);result=0
  if sendTo==CHAT_TEAM then result=ea.command(state.actions,cs.client,"say_team "+message) else if sendTo==CHAT_TELL then result=ea.command(state.actions,cs.client,"tell "+str(clientTo)+" "+message) else result=ea.command(state.actions,cs.client,"say "+message) end if
  if result is error then return result end if;cs.chatMessage="";return 0
end function
function supportsTrap(op) return op>=OP_INITIAL_CHAT and op<=OP_ENTER_CHAT end function
