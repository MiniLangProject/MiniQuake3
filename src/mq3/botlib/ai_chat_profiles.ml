// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Initial-chat loading and chat-state identity from code/botlib/be_ai_chat.c.
package mq3.botlib.ai_chat_profiles

import mq3.botlib.public_headers as publicHeaders
import mq3.botlib.ai_resource_pools as pools
import mq3.vm.pc_parser as pc
import std.string as strings

const OP_LOAD_CHAT_FILE=522
const OP_SET_CHAT_GENDER=523
const OP_SET_CHAT_NAME=524
const BLERR_NOERROR=publicHeaders.BLERR_NOERROR
const BLERR_CANNOTLOADICHAT=publicHeaders.BLERR_CANNOTLOADICHAT
const CHAT_GENDERLESS=publicHeaders.CHAT_GENDERLESS
const CHAT_GENDERFEMALE=publicHeaders.CHAT_GENDERFEMALE
const CHAT_GENDERMALE=publicHeaders.CHAT_GENDERMALE
const MAX_MESSAGE_SIZE=publicHeaders.MAX_MESSAGE_SIZE
const MAX_CHAT_NAME=32

const COMPONENT_FIXED=1
const COMPONENT_VARIABLE=2
const COMPONENT_RANDOM=3

/// `Component` record for ai chat profiles, containing `kind`, `text` and `number`.
struct Component kind text number end struct
/// `Message` record for ai chat profiles, containing `encoded`, `components` and `recentTime`.
struct Message encoded components recentTime end struct
/// `ChatType` record for ai chat profiles, containing `name` and `messages`.
struct ChatType name messages end struct
/// `Profile` record for ai chat profiles, containing `filename`, `chatName`, `types` and `messageCount`.
struct Profile filename chatName types messageCount end struct
/// `Cached` record for ai chat profiles, containing `filename`, `chatName` and `profile`.
struct Cached filename chatName profile end struct
/// `Loader` record for ai chat profiles, containing `state`.
struct Loader state end struct
/// `State` record for ai chat profiles, containing `pools`, `context`, `readFn`, `cache` and `reload` and related fields.
struct State pools context readFn cache reload fileReads end struct

/// Construct error `7570` with diagnostic text `"AI chat: "+message`.
/// @param message Message text supplied to the diagnostic or chat operation.
function fail(message) return error(7570,"AI chat: "+message) end function
/// Create a `mq3.botlib.ai_chat_profiles.State` record, initializing `pools` from `resourcePools`, `context` from `context` and `readFn` from `readFn`.
/// @param resourcePools Initial value stored in `mq3.botlib.ai_chat_profiles.State.pools`.
/// @param context Context forwarded to the configured host callbacks.
/// @param readFn Callback that loads a named resource through the supplied context.
function create(resourcePools,context,readFn) return State(resourcePools,context,readFn,[],false,0) end function
/// Set `state.reload` to `value!=0` in `mq3.botlib.ai_chat_profiles.setReload`.
/// @param state AI chat profiles state; accesses `reload`. May update `state.reload` in place.
/// @param value Value used by `setReload` in `if state!=void then state.reload=value!=0 end if`.
function setReload(state,value) if state!=void then state.reload=value!=0 end if;return 0 end function
/// Normalize a ai chat profiles resource path by removing leading slashes and ensuring the botfiles prefix.
/// @param name Name used to identify the requested entry.
function botPath(name)
  value=name;while strings.startsWith(value,"/") value=decode(slice(bytes(value),1,len(bytes(value))-1)) end while
  if strings.startsWith(strings.toLowerAscii(value),"botfiles/") then return value end if;return "botfiles/"+value
end function
/// Set `loader.state.fileReads` to `loader.state.fileReads+1` in `mq3.botlib.ai_chat_profiles.loadText`. Return paths include `loader.state.readFn(loader.state.context,botPath(name))`.
/// @param loader Loader record; accesses `state`. May update `loader.state.fileReads` in place.
/// @param name Name used to identify the requested entry.
function loadText(loader,name)
  if loader==void or loader.state==void or loader.state.readFn==void then return fail("file callback missing") end if
  loader.state.fileReads=loader.state.fileReads+1;return loader.state.readFn(loader.state.context,botPath(name))
end function
/// Return the result of `decode(bytes(1,1))` for `marker`.
function marker() return decode(bytes(1,1)) end function
/// Append a chat-message fragment and reject text reaching the fixed message-buffer capacity.
/// @param text Text to parse, format or deliver.
/// @param piece Value used by `appendChecked` in `value=text+piece`.
function appendChecked(text,piece)
  value=text+piece;if len(bytes(value))>=MAX_MESSAGE_SIZE then return fail("chat message too long") end if;return value
end function
/// Build the `mq3.botlib.ai_chat_profiles.Message` result for `readMessage`. Return paths include `fail("expected comma or semicolon in chat message, found "+separator.text)`.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param source Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`.
/// @param first Value used by `readMessage` in `token=first`.
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
/// Apply `mq3.vm.pc_parser.read` while evaluating `skipBlock`.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param source Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`.
function skipBlock(registry,source)
  depth=1;while depth>0 token=pc.read(registry,source);if token==void or token is error then return fail("unterminated chat block") end if;if token.text=="{" then depth=depth+1 else if token.text=="}" then depth=depth-1 end if end while;return 0
end function
/// Build the `mq3.botlib.ai_chat_profiles.ChatType` result for `parseType`. Return paths include `message`.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param source Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`.
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
/// Build the `mq3.botlib.ai_chat_profiles.Profile` result for `parseSelectedChat`.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param source Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`.
/// @param filename Filename supplied to the configured loader or file service.
/// @param chatName Named chat profile within the chat-definition file.
function parseSelectedChat(registry,source,filename,chatName)
  types=[];count=0
  while true
    token=pc.read(registry,source);if token==void or token is error then return fail("unterminated chat "+chatName) end if
    if token.text=="}" then return Profile(filename,chatName,types,count) end if
    if token.text!="type" then return fail("expected type, found "+token.text) end if
    value=parseType(registry,source);if value is error then return value end if;types=[value]+types;count=count+len(value.messages)
  end while
end function
/// Apply `mq3.vm.pc_parser.create`, `mq3.vm.pc_parser.load` and `mq3.vm.pc_parser.read` while evaluating `parseProfile`. Return paths include `skipped`.
/// @param state Initial value stored in `mq3.botlib.ai_chat_profiles.Loader.state`.
/// @param filename Filename supplied to the configured loader or file service.
/// @param wantedName Value passed as argument 1 to `std.string.toLowerAscii`.
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
/// Find a cached chat profile by case-insensitive filename and profile name.
/// @param state AI chat profiles state; accesses `cache`.
/// @param filename Filename supplied to the configured loader or file service.
/// @param chatName Named chat profile within the chat-definition file.
function cachedProfile(state,filename,chatName)
  lowerFile=strings.toLowerAscii(filename);lowerName=strings.toLowerAscii(chatName)
  for each item in state.cache if strings.toLowerAscii(item.filename)==lowerFile and strings.toLowerAscii(item.chatName)==lowerName then return item.profile end if end for;return void
end function
/// Set `state.cache` to `state.cache+[Cached(filename,chatName,profile)]` in `mq3.botlib.ai_chat_profiles.loadChatFile`. Return paths include `BLERR_NOERROR`.
/// @param state AI chat profiles state; accesses `pools`, `reload` and `cache`. May update `state.cache` in place.
/// @param handle Handle identifying the allocated bot chat state.
/// @param filename Filename supplied to the configured loader or file service.
/// @param chatName Named chat profile within the chat-definition file.
function loadChatFile(state,handle,filename,chatName)
  if state==void or state.pools==void then return BLERR_CANNOTLOADICHAT end if
  chatState=pools.chatState(state.pools,handle);if chatState==void or filename==void or filename=="" or chatName==void or chatName=="" then return BLERR_CANNOTLOADICHAT end if
  chatState.chat=void;profile=void
  if not state.reload then profile=cachedProfile(state,filename,chatName) end if
  if profile==void then profile=try(parseProfile(state,filename,chatName));if profile is error or profile==void then return BLERR_CANNOTLOADICHAT end if;if not state.reload then state.cache=state.cache+[Cached(filename,chatName,profile)] end if end if
  chatState.chat=profile;return BLERR_NOERROR
end function
/// Apply `mq3.botlib.ai_resource_pools.chatState` while evaluating `setChatGender`.
/// @param state AI chat profiles state; accesses `pools`.
/// @param handle Handle identifying the allocated bot chat state.
/// @param gender Chat gender identifier.
function setChatGender(state,handle,gender)
  if state==void then return 0 end if;chatState=pools.chatState(state.pools,handle);if chatState==void then return 0 end if
  if gender==CHAT_GENDERFEMALE or gender==CHAT_GENDERMALE then chatState.gender=gender else chatState.gender=CHAT_GENDERLESS end if;return 0
end function
/// Apply `mq3.botlib.ai_resource_pools.chatState` while evaluating `setChatName`.
/// @param state AI chat profiles state; accesses `pools`.
/// @param handle Handle identifying the allocated bot chat state.
/// @param name Name used to identify the requested entry.
/// @param client Value used by `setChatName` in `chatState.client=client`.
function setChatName(state,handle,name,client)
  if state==void then return 0 end if;chatState=pools.chatState(state.pools,handle);if chatState==void then return 0 end if
  data=bytes(name);count=len(data);if count>=MAX_CHAT_NAME then count=MAX_CHAT_NAME-1 end if
  chatState.name=decode(slice(data,0,count));chatState.client=client;return 0
end function
/// Find a chat message type by an ASCII case-insensitive name, returning void when the profile or type is absent.
/// @param profile Profile record; accesses `types`.
/// @param name Name used to identify the requested entry.
function typeByName(profile,name)
  if profile==void then return void end if;lower=strings.toLowerAscii(name);for each value in profile.types if strings.toLowerAscii(value.name)==lower then return value end if end for;return void
end function
/// Set `state.cache` to `[]` in `mq3.botlib.ai_chat_profiles.clearCache`.
/// @param state AI chat profiles state; accesses `cache`. May update `state.cache` in place.
function clearCache(state) if state!=void then state.cache=[] end if;return 0 end function
