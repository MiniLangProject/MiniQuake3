// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Initial-chat loading and chat-state identity from code/botlib/be_ai_chat.c.
package mq3.botlib.ai_chat_profiles

import mq3.botlib.ai_resource_pools as pools
import mq3.vm.pc_parser as pc
import std.string as strings

const OP_LOAD_CHAT_FILE=522
const OP_SET_CHAT_GENDER=523
const OP_SET_CHAT_NAME=524
const BLERR_NOERROR=0
const BLERR_CANNOTLOADICHAT=8
const CHAT_GENDERLESS=0
const CHAT_GENDERFEMALE=1
const CHAT_GENDERMALE=2
const MAX_MESSAGE_SIZE=256
const MAX_CHAT_NAME=32

const COMPONENT_FIXED=1
const COMPONENT_VARIABLE=2
const COMPONENT_RANDOM=3

struct Component kind text number end struct
struct Message encoded components recentTime end struct
struct ChatType name messages end struct
struct Profile filename chatName types messageCount end struct
struct Cached filename chatName profile end struct
struct Loader state end struct
struct State pools context readFn cache reload fileReads end struct

function fail(message) return error(7570,"AI chat: "+message) end function
function create(resourcePools,context,readFn) return State(resourcePools,context,readFn,[],false,0) end function
function setReload(state,value) if state!=void then state.reload=value!=0 end if;return 0 end function
function botPath(name)
  value=name;while strings.startsWith(value,"/") value=decode(slice(bytes(value),1,len(bytes(value))-1)) end while
  if strings.startsWith(strings.toLowerAscii(value),"botfiles/") then return value end if;return "botfiles/"+value
end function
function loadText(loader,name)
  if loader==void or loader.state==void or loader.state.readFn==void then return fail("file callback missing") end if
  loader.state.fileReads=loader.state.fileReads+1;return loader.state.readFn(loader.state.context,botPath(name))
end function
function marker() return decode(bytes(1,1)) end function
function appendChecked(text,piece)
  value=text+piece;if len(bytes(value))>=MAX_MESSAGE_SIZE then return fail("chat message too long") end if;return value
end function
function readMessage(registry,source,first)
  encoded="";components=[];token=first
  while true
    if token==void or token is error then return fail("missing chat message component") end if
    if token.type==pc.TT_STRING then
      encoded=appendChecked(encoded,token.text);if encoded is error then return encoded end if;components=components+[Component(COMPONENT_FIXED,token.text,0)]
    else if token.type==pc.TT_NUMBER and (token.subtype&pc.TT_INTEGER)!=0 then
      piece=marker()+"v"+str(token.intValue)+marker();encoded=appendChecked(encoded,piece);if encoded is error then return encoded end if;components=components+[Component(COMPONENT_VARIABLE,"",token.intValue)]
    else if token.type==pc.TT_NAME then
      piece=marker()+"r"+token.text+marker();encoded=appendChecked(encoded,piece);if encoded is error then return encoded end if;components=components+[Component(COMPONENT_RANDOM,token.text,0)]
    else return fail("unknown message component "+token.text) end if
    separator=pc.read(registry,source);if separator==void or separator is error then return fail("unterminated chat message") end if
    if separator.text==";" then return Message(encoded,components,-40.0) end if
    // l_script joins adjacent quoted strings before be_ai_chat sees them.  The
    // retail teamplay.h contains one such pair in the joined-team response.
    if separator.type==pc.TT_STRING then token=separator;continue end if
    if separator.text!="," then return fail("expected comma or semicolon in chat message, found "+separator.text) end if
    token=pc.read(registry,source)
  end while
end function
function skipBlock(registry,source)
  depth=1;while depth>0 token=pc.read(registry,source);if token==void or token is error then return fail("unterminated chat block") end if;if token.text=="{" then depth=depth+1 else if token.text=="}" then depth=depth-1 end if end while;return 0
end function
function parseType(registry,source)
  name=pc.read(registry,source);brace=pc.read(registry,source)
  if name==void or name is error or name.type!=pc.TT_STRING then return fail("expected chat type name") end if
  if brace==void or brace is error or brace.text!="{" then return fail("expected chat type block") end if
  messages=[]
  while true
    first=pc.read(registry,source);if first==void or first is error then return fail("unterminated chat type "+name.text) end if
    if first.text=="}" then return ChatType(name.text,messages) end if
    // be_ai_chat links each parsed message at the head of the type list.
    message=readMessage(registry,source,first);if message is error then return message end if;messages=[message]+messages
  end while
end function
function parseSelectedChat(registry,source,filename,chatName)
  types=[];count=0
  while true
    token=pc.read(registry,source);if token==void or token is error then return fail("unterminated chat "+chatName) end if
    if token.text=="}" then return Profile(filename,chatName,types,count) end if
    if token.text!="type" then return fail("expected type, found "+token.text) end if
    value=parseType(registry,source);if value is error then return value end if;types=[value]+types;count=count+len(value.messages)
  end while
end function
function parseProfile(state,filename,wantedName)
  loader=Loader(state);registry=pc.create(loader,loadText);source=pc.load(registry,filename)
  if source==0 then return void end if
  while true
    token=pc.read(registry,source);if token==void then pc.free(registry,source);return void end if
    if token is error then pc.free(registry,source);return token end if
    if token.text!="chat" then pc.free(registry,source);return fail("unknown definition "+token.text) end if
    name=pc.read(registry,source);brace=pc.read(registry,source)
    if name==void or name is error or name.type!=pc.TT_STRING then pc.free(registry,source);return fail("expected chat name") end if
    if brace==void or brace is error or brace.text!="{" then pc.free(registry,source);return fail("expected chat block") end if
    if strings.toLowerAscii(name.text)==strings.toLowerAscii(wantedName) then result=parseSelectedChat(registry,source,filename,name.text);pc.free(registry,source);return result end if
    skipped=skipBlock(registry,source);if skipped is error then pc.free(registry,source);return skipped end if
  end while
end function
function cachedProfile(state,filename,chatName)
  lowerFile=strings.toLowerAscii(filename);lowerName=strings.toLowerAscii(chatName)
  for each item in state.cache if strings.toLowerAscii(item.filename)==lowerFile and strings.toLowerAscii(item.chatName)==lowerName then return item.profile end if end for;return void
end function
function loadChatFile(state,handle,filename,chatName)
  if state==void or state.pools==void then return BLERR_CANNOTLOADICHAT end if
  chatState=pools.chatState(state.pools,handle);if chatState==void or filename==void or filename=="" or chatName==void or chatName=="" then return BLERR_CANNOTLOADICHAT end if
  chatState.chat=void;profile=void
  if not state.reload then profile=cachedProfile(state,filename,chatName) end if
  if profile==void then profile=try(parseProfile(state,filename,chatName));if profile is error or profile==void then return BLERR_CANNOTLOADICHAT end if;if not state.reload then state.cache=state.cache+[Cached(filename,chatName,profile)] end if end if
  chatState.chat=profile;return BLERR_NOERROR
end function
function setChatGender(state,handle,gender)
  if state==void then return 0 end if;chatState=pools.chatState(state.pools,handle);if chatState==void then return 0 end if
  if gender==CHAT_GENDERFEMALE or gender==CHAT_GENDERMALE then chatState.gender=gender else chatState.gender=CHAT_GENDERLESS end if;return 0
end function
function setChatName(state,handle,name,client)
  if state==void then return 0 end if;chatState=pools.chatState(state.pools,handle);if chatState==void then return 0 end if
  data=bytes(name);count=len(data);if count>=MAX_CHAT_NAME then count=MAX_CHAT_NAME-1 end if
  chatState.name=decode(slice(data,0,count));chatState.client=client;return 0
end function
function typeByName(profile,name)
  if profile==void then return void end if;lower=strings.toLowerAscii(name);for each value in profile.types if strings.toLowerAscii(value.name)==lower then return value end if end for;return void
end function
function clearCache(state) if state!=void then state.cache=[] end if;return 0 end function
