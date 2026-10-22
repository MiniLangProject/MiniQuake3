// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native facade for code/botlib/be_ai_chat.c.  The parser, profile,
// match, synonym and output implementations live in the focused modules this
// facade owns; this file supplies the original file-level lifecycle and names.
package mq3.botlib.ai_chat_runtime

import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_console_messages as console
import mq3.botlib.ai_chat_profiles as profiles
import mq3.botlib.ai_chat_strings as chatStrings
import mq3.botlib.ai_chat_matches as matches
import mq3.botlib.ai_chat_output as output
import mq3.compat.numeric as n
import std.string as strings

const MAX_MESSAGE_SIZE=256
const MAX_MATCH_VARIABLES=8

struct State pools profiles strings matches output console context readFn timeFn randomFn actions diagnostics setup end struct
struct AliasContext runtime requested canonical end struct

function create(context,readFn,timeFn,randomFn,actions)
  resourcePools=pools.create();profileState=profiles.create(resourcePools,context,readFn);stringState=chatStrings.create(context,readFn);matchState=matches.create(context,readFn);outputState=output.create(profileState,stringState,actions,context,readFn,timeFn,randomFn)
  return State(resourcePools,profileState,stringState,matchState,outputState,console.create(resourcePools),context,readFn,timeFn,randomFn,actions,[],false)
end function
function aliasRead(alias,path)
  canonicalPath=profiles.botPath(alias.canonical);if path==canonicalPath then return alias.runtime.readFn(alias.runtime.context,profiles.botPath(alias.requested)) end if;return alias.runtime.readFn(alias.runtime.context,path)
end function

// Console-message heap -----------------------------------------------------
function initConsoleMessageHeap(state,capacity) return console.configure(state.console,capacity) end function
function allocConsoleMessage(state)
  slot=console.popFree(state.console);if slot<0 then return void end if;message=console.Message(slot,0,state.console.time,0,console.messageData(""));state.console.nodes[slot]=message;return message
end function
function freeConsoleMessage(state,message) if message==void then return 0 end if;return console.freeSlot(state.console,message.slot) end function
function botQueueConsoleMessage(state,chatState,type,message) return console.queue(state.console,chatState,type,message) end function
function botRemoveConsoleMessage(state,chatState,handle) return console.remove(state.console,chatState,handle) end function
function botNextConsoleMessage(state,chatState) return console.next(state.console,chatState) end function
function botNumConsoleMessages(state,chatState) return console.count(state.console,chatState) end function

// Released string helpers -------------------------------------------------
function isWhiteSpace(value) return chatStrings.isWhiteSpace(value) end function
function botRemoveTildes(message) return output.removeTildes(message) end function
function unifyWhiteSpaces(value) return chatStrings.unifyWhiteSpaces(value) end function
function stringContains(value,needle,caseSensitive) return matches.stringContains(value,needle,caseSensitive) end function
function stringContainsWord(value,needle,caseSensitive)
  if caseSensitive then
    source=bytes(value);word=bytes(needle);if len(word)==0 then return -1 end if
    for at=0 to len(source)-len(word) equal=true;for index=0 to len(word)-1 if source[at+index]!=word[index] then equal=false end if end for;if equal and (at==0 or chatStrings.boundary(source[at-1])) and (at+len(word)==len(source) or chatStrings.boundary(source[at+len(word)])) then return at end if end for;return -1
  end if
  return chatStrings.findWord(value,needle,0)
end function
function stringReplaceWords(value,synonym,replacement) return chatStrings.replaceWords(value,synonym,replacement) end function

// Synonyms, random strings and matches -----------------------------------
function botDumpSynonymList(state,synonymList) state.diagnostics=state.diagnostics+["synonyms:"+str(len(synonymList))];return len(synonymList) end function
function botLoadSynonyms(state,filename) return chatStrings.load(state.strings,filename) end function
function botReplaceSynonyms(state,value,context) return chatStrings.replaceSynonyms(state.strings,value,context) end function
function botReplaceWeightedSynonyms(state,value,context) return output.replaceWeightedSynonyms(state.output,value,context) end function
function botReplaceReplySynonyms(state,value,context) return output.replaceReplySynonyms(state.output,value,context) end function
function botLoadChatMessage(registry,source,firstToken) return profiles.readMessage(registry,source,firstToken) end function
function botDumpRandomStringList(state,randomList) count=0;if randomList!=void then count=len(randomList.messages) end if;state.diagnostics=state.diagnostics+["random:"+str(count)];return count end function
function botLoadRandomStrings(state,filename)
  parser=state.output;if filename!="rnd.c" then alias=AliasContext(state,filename,"rnd.c");parser=output.create(state.profiles,state.strings,state.actions,alias,aliasRead,void,void) end if
  values=output.parseRandomLists(parser);if values is error then return values end if;state.output.randomLists=values;return len(values)
end function
function randomString(state,name)
  if not state.output.loaded then ready=output.ensureLoaded(state.output);if ready is error then return void end if end if;value=output.randomList(state.output,name);if value==void or len(value.messages)==0 then return void end if;selected=output.choose(value.messages,state.output,false);if selected==void then return void end if;return selected.encoded
end function
function botDumpMatchTemplates(state,templates) state.diagnostics=state.diagnostics+["matches:"+str(len(templates))];return len(templates) end function
function botFreeMatchPieces(pieces) return [] end function
function botLoadMatchPieces(registry,source,firstToken) return matches.parsePieces(registry,source,firstToken) end function
function botFreeMatchTemplates(state) return matches.clear(state.matches) end function
function botLoadMatchTemplates(state,filename) return matches.load(state.matches,filename) end function
function stringsMatch(pieces,match) return matches.stringsMatch(pieces,match) end function
function botFindMatch(state,value,context) return matches.findMatch(state.matches,value,context) end function
function botMatchVariable(match,variable,size) return matches.matchVariable(match,variable,size) end function

// Integrity and parsed chat ownership ------------------------------------
function botFindStringInList(list,value)
  wanted=strings.toLowerAscii(value);if len(list)==0 then return -1 end if;for index=0 to len(list)-1 if strings.toLowerAscii(list[index])==wanted then return index end if end for;return -1
end function
function randomReferences(message)
  values=[];if message==void then return values end if;for each component in message.components if component.kind==profiles.COMPONENT_RANDOM then values=values+[component.text] end if end for;return values
end function
function botCheckChatMessageIntegrety(message,stringList)
  missing=[];for each value in randomReferences(message) if botFindStringInList(stringList,value)<0 and botFindStringInList(missing,value)<0 then missing=missing+[value] end if end for;return missing
end function
function botCheckInitialChatIntegrety(state,chat)
  if chat==void then return ["missing chat"] end if;available=[];for each list in state.output.randomLists available=available+[list.name] end for;missing=[];for each chatType in chat.types for each message in chatType.messages for each value in botCheckChatMessageIntegrety(message,available) if botFindStringInList(missing,value)<0 then missing=missing+[value] end if end for end for end for;return missing
end function
function botCheckReplyChatIntegrety(state,replyChat)
  missing=[];if replyChat==void then return ["missing reply chat"] end if;available=[];for each list in state.output.randomLists available=available+[list.name] end for;for each reply in replyChat for each message in reply.messages for each value in botCheckChatMessageIntegrety(message,available) if botFindStringInList(missing,value)<0 then missing=missing+[value] end if end for end for end for;return missing
end function
function botDumpReplyChat(state,replyChat) state.diagnostics=state.diagnostics+["replies:"+str(len(replyChat))];return len(replyChat) end function
function botFreeReplyChat(state) state.output.replies=[];return 0 end function
function botCheckValidReplyChatKeySet(keys)
  positive=false;for each key in keys if (key.flags&output.KEY_AND)==0 and (key.flags&output.KEY_NOT)==0 then positive=true end if end for;return positive
end function
function botLoadReplyChat(state,filename)
  parser=state.output;if filename!="rchat.c" then alias=AliasContext(state,filename,"rchat.c");parser=output.create(state.profiles,state.strings,state.actions,alias,aliasRead,void,void) end if
  values=output.parseReplies(parser);if values is error then return values end if;state.output.replies=values;return len(values)
end function
function botDumpInitialChat(state,chat) count=0;if chat!=void then count=chat.messageCount end if;state.diagnostics=state.diagnostics+["initial:"+str(count)];return count end function
function botLoadInitialChat(state,chatFile,chatName) return profiles.parseProfile(state.profiles,chatFile,chatName) end function
function botFreeChatFile(state,chatState) value=pools.chatState(state.pools,chatState);if value==void then return 0 end if;value.chat=void;return 0 end function
function botLoadChatFile(state,chatState,chatFile,chatName) return profiles.loadChatFile(state.profiles,chatState,chatFile,chatName) end function

// Construction, selection and delivery -----------------------------------
function botExpandChatMessage(state,message,variables,messageContext,variableContext,reply)
  current=profiles.Message(message,output.componentsFromEncoded(message),-40.0);expanded=output.expandOnce(state.output,current.components,variables,variableContext,reply);if expanded is error then return expanded end if;expanded[0]=output.replaceWeightedSynonyms(state.output,expanded[0],messageContext);return expanded
end function
function botConstructChatMessage(state,message,variables,messageContext,variableContext,reply) return output.construct(state.output,message,variables,messageContext,variableContext,reply) end function
function botChooseInitialChatMessage(state,chatState,type)
  value=pools.chatState(state.pools,chatState);if value==void or value.chat==void then return void end if;selected=profiles.typeByName(value.chat,type);if selected==void then return void end if;return output.choose(selected.messages,state.output,true)
end function
function botNumInitialChats(state,chatState,type)
  value=pools.chatState(state.pools,chatState);if value==void or value.chat==void then return 0 end if;selected=profiles.typeByName(value.chat,type);if selected==void then return 0 end if;return len(selected.messages)
end function
function botInitialChat(state,chatState,type,messageContext,variables) return output.initialChat(state.output,chatState,type,messageContext,variables) end function
function botPrintReplyChatKeys(state,replyChat)
  count=0;for each reply in replyChat count=count+len(reply.keys) end for;state.diagnostics=state.diagnostics+["reply-keys:"+str(count)];return count
end function
function botReplyChat(state,chatState,message,messageContext,variableContext,variables) return output.replyChat(state.output,chatState,message,messageContext,variableContext,variables) end function
function botChatLength(state,chatState) return output.chatLength(state.output,chatState) end function
function botEnterChat(state,chatState,clientTo,sendTo) return output.enterChat(state.output,chatState,clientTo,sendTo) end function
function botGetChatMessage(state,chatState,size)
  value=pools.chatState(state.pools,chatState);if value==void then return void end if;message=output.removeTildes(value.chatMessage);value.chatMessage="";if size<=0 then return "" end if;data=bytes(message);count=len(data);if count>=size then count=size-1 end if;return decode(slice(data,0,count))
end function
function botSetChatGender(state,chatState,gender) return profiles.setChatGender(state.profiles,chatState,gender) end function
function botSetChatName(state,chatState,name,client) return profiles.setChatName(state.profiles,chatState,name,client) end function

// Global and per-client lifecycle ----------------------------------------
function botResetChatAI(state)
  for each reply in state.output.replies for each message in reply.messages message.recentTime=0.0 end for end for;return 0
end function
function botAllocChatState(state) return pools.allocChatState(state.pools) end function
function botChatStateFromHandle(state,handle) return pools.chatState(state.pools,handle) end function
function botFreeChatState(state,handle)
  value=pools.chatState(state.pools,handle);if value==void then return 0 end if;console.clearChat(state.console,handle);if state.profiles.reload then botFreeChatFile(state,handle) end if;return pools.freeChatState(state.pools,handle)
end function
function botSetupChatAI(state,noChat,consoleCapacity)
  synonyms=chatStrings.ensureLoaded(state.strings);if synonyms is error then return synonyms end if;randomCount=botLoadRandomStrings(state,"rnd.c");if randomCount is error then return randomCount end if;matchCount=matches.ensureLoaded(state.matches);if matchCount is error then return matchCount end if
  if noChat then state.output.replies=[] else replyCount=botLoadReplyChat(state,"rchat.c");if replyCount is error then return replyCount end if end if
  state.output.loaded=true;configured=initConsoleMessageHeap(state,consoleCapacity);if configured is error then return configured end if;state.setup=true;return 0
end function
function botShutdownChatAI(state)
  if state==void then return 0 end if;for handle=1 to pools.MAX_CLIENTS if pools.chatState(state.pools,handle)!=void then botFreeChatState(state,handle) end if end for;profiles.clearCache(state.profiles);console.shutdown(state.console);matches.clear(state.matches);chatStrings.clear(state.strings);output.shutdown(state.output);state.setup=false;return 0
end function
