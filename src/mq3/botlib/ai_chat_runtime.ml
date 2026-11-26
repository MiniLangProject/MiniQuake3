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

/// Maximum character capacity of a bot chat or console message.
const MAX_MESSAGE_SIZE=256
/// Maximum number of captured variables in a bot chat match.
const MAX_MATCH_VARIABLES=8

/// `State` record for ai chat runtime, containing `pools`, `profiles`, `strings`, `matches` and `output` and related fields.
struct State
  /// Managed pools containing bot chat, goal, movement, and weapon resources.
  pools
  /// Loaded initial-chat profiles and their cached message selections.
  profiles
  /// Whitespace and synonym-normalization runtime used by chat processing.
  strings
  /// Chat-match template runtime used by the combined chat interface.
  matches
  /// Runtime that expands and dispatches initial-chat and reply-chat messages.
  output
  /// Queued-console-message runtime used by the combined chat interface.
  console
  /// Caller-supplied data associated with shared chat-resource loading, chat timing, and random reply
  /// selection.
  context
  /// Host callback that provides shared file loading to the assembled bot chat runtimes.
  readFn
  /// Host callback that supplies the current time used by the bot runtime.
  timeFn
  /// Host callback that supplies the random values used by bot selection and fuzzy logic.
  randomFn
  /// Shared elementary-action runtime passed to the assembled chat output handlers.
  actions
  /// Diagnostics collected while processing the subsystem's requests.
  diagnostics
  /// True after the bot-library setup sequence has completed.
  setup
end struct
/// `AliasContext` record for ai chat runtime, containing `runtime`, `requested` and `canonical`.
struct AliasContext
  /// Chat runtime whose file reader supplies the aliased chat resource.
  runtime
  /// Operation name requested by the caller before alias resolution.
  requested
  /// Canonical operation name selected after alias resolution.
  canonical
end struct

/// Build the `mq3.botlib.ai_chat_runtime.State` result for `create`.
/// @param context Context forwarded to the configured host callbacks.
/// @param readFn Callback that loads a named resource through the supplied context.
/// @param timeFn Callback that supplies the current botlib time.
/// @param randomFn Callback that supplies the random value used by selection.
/// @param actions Initial value stored in `mq3.botlib.ai_chat_output.State.actions`.
function create(context,readFn,timeFn,randomFn,actions)
  resourcePools=pools.create();profileState=profiles.create(resourcePools,context,readFn);stringState=chatStrings.create(context,readFn);matchState=matches.create(context,readFn);outputState=output.create(profileState,stringState,actions,context,readFn,timeFn,randomFn)
  return State(resourcePools,profileState,stringState,matchState,outputState,console.create(resourcePools),context,readFn,timeFn,randomFn,actions,[],false)
end function
/// Redirect the canonical chat file to the requested filename while forwarding all other reads to the original loader.
/// @param alias Alias record; accesses `canonical`, `runtime` and `requested`.
/// @param path Resource path supplied to the file or parser operation.
function aliasRead(alias,path)
  canonicalPath=profiles.botPath(alias.canonical);if path==canonicalPath then return alias.runtime.readFn(alias.runtime.context,profiles.botPath(alias.requested)) end if;return alias.runtime.readFn(alias.runtime.context,path)
end function

// Console-message heap -----------------------------------------------------
/// @param state AI chat runtime state; accesses `console`.
/// @param capacity Maximum number of entries to allocate or retain.
function initConsoleMessageHeap(state,capacity) return console.configure(state.console,capacity) end function
/// Allocate a free console-message slot, initialize its timestamp and text, and return void when the heap is exhausted.
/// @param state AI chat runtime state; accesses `console`. May update `state.console.nodes[slot]` in place.
function allocConsoleMessage(state)
  slot=console.popFree(state.console);if slot<0 then return void end if;message=console.Message(slot,0,state.console.time,0,console.messageData(""));state.console.nodes[slot]=message;return message
end function
/// Apply `mq3.botlib.ai_console_messages.freeSlot` while evaluating `freeConsoleMessage`. Return paths include `console.freeSlot(state.console,message.slot)`.
/// @param state AI chat runtime state; accesses `console`.
/// @param message Message record; accesses `slot`.
function freeConsoleMessage(state,message) if message==void then return 0 end if;return console.freeSlot(state.console,message.slot) end function
/// Forward `botQueueConsoleMessage` to `mq3.botlib.ai_console_messages.queue` and return the delegated result.
/// @param state AI chat runtime state; accesses `console`.
/// @param chatState Handle of the pooled bot chat state.
/// @param type Initial value stored in `mq3.botlib.ai_console_messages.Message.type`.
/// @param message Message text supplied to the diagnostic or chat operation.
function botQueueConsoleMessage(state,chatState,type,message) return console.queue(state.console,chatState,type,message) end function
/// Forward `botRemoveConsoleMessage` to `mq3.botlib.ai_console_messages.remove` and return the delegated result.
/// @param state AI chat runtime state; accesses `console`.
/// @param chatState Handle of the pooled bot chat state.
/// @param handle Resource handle resolved by the owning pool or host service.
function botRemoveConsoleMessage(state,chatState,handle) return console.remove(state.console,chatState,handle) end function
/// Forward `botNextConsoleMessage` to `mq3.botlib.ai_console_messages.next` and return the delegated result.
/// @param state AI chat runtime state; accesses `console`.
/// @param chatState Handle of the pooled bot chat state.
function botNextConsoleMessage(state,chatState) return console.next(state.console,chatState) end function
/// Forward `botNumConsoleMessages` to `mq3.botlib.ai_console_messages.count` and return the delegated result.
/// @param state AI chat runtime state; accesses `console`.
/// @param chatState Handle of the pooled bot chat state.
function botNumConsoleMessages(state,chatState) return console.count(state.console,chatState) end function

// Released string helpers -------------------------------------------------
/// @param value Value used by `isWhiteSpace` in `if value>=97 and value<=122 or value>=65 and value<=90 or value>=48 and value<=57 then return false end if`.
function isWhiteSpace(value) return chatStrings.isWhiteSpace(value) end function
/// Forward `botRemoveTildes` to `mq3.botlib.ai_chat_output.removeTildes` and return the delegated result.
/// @param message Message text supplied to the diagnostic or chat operation.
function botRemoveTildes(message) return output.removeTildes(message) end function
/// Forward `unifyWhiteSpaces` to `mq3.botlib.ai_chat_strings.unifyWhiteSpaces` and return the delegated result.
/// @param value Value passed as argument 1 to `bytes`.
function unifyWhiteSpaces(value) return chatStrings.unifyWhiteSpaces(value) end function
/// Forward `stringContains` to `mq3.botlib.ai_chat_matches.stringContains` and return the delegated result.
/// @param value Value passed as argument 1 to `bytes`.
/// @param needle Text or value to search for.
/// @param caseSensitive Whether comparisons distinguish letter case.
function stringContains(value,needle,caseSensitive) return matches.stringContains(value,needle,caseSensitive) end function
/// Find a complete word with optional case sensitivity and return its byte offset, or -1 when no word matches.
/// @param value Value passed as argument 1 to `bytes`.
/// @param needle Text or value to search for.
/// @param caseSensitive Whether comparisons distinguish letter case.
function stringContainsWord(value,needle,caseSensitive)
  if caseSensitive then
    source=bytes(value);word=bytes(needle);if len(word)==0 then return -1 end if
    for at=0 to len(source)-len(word) equal=true;for index=0 to len(word)-1 if source[at+index]!=word[index] then equal=false end if end for;if equal and (at==0 or chatStrings.boundary(source[at-1])) and (at+len(word)==len(source) or chatStrings.boundary(source[at+len(word)])) then return at end if end for;return -1
  end if
  return chatStrings.findWord(value,needle,0)
end function
/// Forward `stringReplaceWords` to `mq3.botlib.ai_chat_strings.replaceWords` and return the delegated result.
/// @param value Value passed as argument 1 to `bytes`.
/// @param synonym Word or synonym selected for replacement.
/// @param replacement Text substituted for a matching word or token.
function stringReplaceWords(value,synonym,replacement) return chatStrings.replaceWords(value,synonym,replacement) end function

// Synonyms, random strings and matches -----------------------------------
/// @param state AI chat runtime state; accesses `diagnostics`. May update `state.diagnostics` in place.
/// @param synonymList Sequence whose length bounds the iteration or lookup in `botDumpSynonymList`.
function botDumpSynonymList(state,synonymList) state.diagnostics=state.diagnostics+["synonyms:"+str(len(synonymList))];return len(synonymList) end function
/// Forward `botLoadSynonyms` to `mq3.botlib.ai_chat_strings.load` and return the delegated result.
/// @param state AI chat runtime state; accesses `strings`.
/// @param filename Filename supplied to the configured loader or file service.
function botLoadSynonyms(state,filename) return chatStrings.load(state.strings,filename) end function
/// Forward `botReplaceSynonyms` to `mq3.botlib.ai_chat_strings.replaceSynonyms` and return the delegated result.
/// @param state AI chat runtime state; accesses `strings`.
/// @param value Value passed as argument 1 to `bytes`.
/// @param context Bit mask selecting the bot-chat contexts accepted by this operation.
function botReplaceSynonyms(state,value,context) return chatStrings.replaceSynonyms(state.strings,value,context) end function
/// Forward `botReplaceWeightedSynonyms` to `mq3.botlib.ai_chat_output.replaceWeightedSynonyms` and return the delegated result.
/// @param state AI chat runtime state; accesses `output`.
/// @param value Value passed as argument 1 to `bytes`.
/// @param context Bit mask selecting the bot-chat contexts accepted by this operation.
function botReplaceWeightedSynonyms(state,value,context) return output.replaceWeightedSynonyms(state.output,value,context) end function
/// Forward `botReplaceReplySynonyms` to `mq3.botlib.ai_chat_output.replaceReplySynonyms` and return the delegated result.
/// @param state AI chat runtime state; accesses `output`.
/// @param value Value passed as argument 1 to `bytes`.
/// @param context Bit mask selecting the bot-chat contexts accepted by this operation.
function botReplaceReplySynonyms(state,value,context) return output.replaceReplySynonyms(state.output,value,context) end function
/// Forward `botLoadChatMessage` to `mq3.botlib.ai_chat_profiles.readMessage` and return the delegated result.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param source Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`.
/// @param firstToken Value used by `readMessage` in `token=first`.
function botLoadChatMessage(registry,source,firstToken) return profiles.readMessage(registry,source,firstToken) end function
/// Set `state.diagnostics` to `state.diagnostics+["random:"+str(count)]` in `mq3.botlib.ai_chat_runtime.botDumpRandomStringList`. Return paths include `count`.
/// @param state AI chat runtime state; accesses `diagnostics`. May update `state.diagnostics` in place.
/// @param randomList Random list record; accesses `messages`.
function botDumpRandomStringList(state,randomList) count=0;if randomList!=void then count=len(randomList.messages) end if;state.diagnostics=state.diagnostics+["random:"+str(count)];return count end function
/// Set `state.output.randomLists` to `values` in `mq3.botlib.ai_chat_runtime.botLoadRandomStrings`. Return paths include `len(values)`.
/// @param state AI chat runtime state; accesses `output`, `profiles`, `strings` and `actions`. May update `state.output.randomLists` in place.
/// @param filename Filename supplied to the configured loader or file service.
function botLoadRandomStrings(state,filename)
  parser=state.output;if filename!="rnd.c" then alias=AliasContext(state,filename,"rnd.c");parser=output.create(state.profiles,state.strings,state.actions,alias,aliasRead,void,void) end if
  values=output.parseRandomLists(parser);if values is error then return values end if;state.output.randomLists=values;return len(values)
end function
/// Apply `mq3.botlib.ai_chat_output.ensureLoaded`, `mq3.botlib.ai_chat_output.randomList` and `mq3.botlib.ai_chat_output.choose` while evaluating `randomString`. Return paths include `selected.encoded`.
/// @param state AI chat runtime state; accesses `output`.
/// @param name Name used to identify the requested entry.
function randomString(state,name)
  if not state.output.loaded then ready=output.ensureLoaded(state.output);if ready is error then return void end if end if;value=output.randomList(state.output,name);if value==void or len(value.messages)==0 then return void end if;selected=output.choose(value.messages,state.output,false);if selected==void then return void end if;return selected.encoded
end function
/// Set `state.diagnostics` to `state.diagnostics+["matches:"+str(len(templates))]` in `mq3.botlib.ai_chat_runtime.botDumpMatchTemplates`. Return paths include `len(templates)`.
/// @param state AI chat runtime state; accesses `diagnostics`. May update `state.diagnostics` in place.
/// @param templates Sequence whose length bounds the iteration or lookup in `botDumpMatchTemplates`.
function botDumpMatchTemplates(state,templates) state.diagnostics=state.diagnostics+["matches:"+str(len(templates))];return len(templates) end function
/// Return an empty match-piece array; the incoming array remains owned by the caller.
/// @param pieces Not read by this implementation; retained in the `botFreeMatchPieces` signature.
function botFreeMatchPieces(pieces) return [] end function
/// Forward `botLoadMatchPieces` to `mq3.botlib.ai_chat_matches.parsePieces` and return the delegated result.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param source Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`.
/// @param firstToken Value used by `parsePieces` in `nextToken=firstToken`.
function botLoadMatchPieces(registry,source,firstToken) return matches.parsePieces(registry,source,firstToken) end function
/// Forward `botFreeMatchTemplates` to `mq3.botlib.ai_chat_matches.clear` and return the delegated result.
/// @param state AI chat runtime state; accesses `matches`.
function botFreeMatchTemplates(state) return matches.clear(state.matches) end function
/// Forward `botLoadMatchTemplates` to `mq3.botlib.ai_chat_matches.load` and return the delegated result.
/// @param state AI chat runtime state; accesses `matches`.
/// @param filename Filename supplied to the configured loader or file service.
function botLoadMatchTemplates(state,filename) return matches.load(state.matches,filename) end function
/// Forward `stringsMatch` to `mq3.botlib.ai_chat_matches.stringsMatch` and return the delegated result.
/// @param pieces Value used by `stringsMatch` in `for each piece in pieces`.
/// @param match Parsed match record; accesses `offsets`, `string` and `lengths`. May update `match.offsets[piece.variable]` and `match.lengths[lastVariable]` in place.
function stringsMatch(pieces,match) return matches.stringsMatch(pieces,match) end function
/// Forward `botFindMatch` to `mq3.botlib.ai_chat_matches.findMatch` and return the delegated result.
/// @param state AI chat runtime state; accesses `matches`.
/// @param value Value passed as argument 1 to `bytes`.
/// @param context Bit mask selecting the bot-chat contexts accepted by this operation.
function botFindMatch(state,value,context) return matches.findMatch(state.matches,value,context) end function
/// Forward `botMatchVariable` to `mq3.botlib.ai_chat_matches.matchVariable` and return the delegated result.
/// @param match Parsed match record; accesses `offsets`, `lengths` and `string`.
/// @param variable Operand used to evaluate the returned expression `decode(slice(bytes(match.string),match.offsets[variable],count))`.
/// @param size Size or capacity supplied to the buffer operation.
function botMatchVariable(match,variable,size) return matches.matchVariable(match,variable,size) end function

// Integrity and parsed chat ownership ------------------------------------
/// @param list Array or byte sequence accessed at `index`.
/// @param value Value passed as argument 1 to `std.string.toLowerAscii`.
function botFindStringInList(list,value)
  wanted=strings.toLowerAscii(value);if len(list)==0 then return -1 end if;for index=0 to len(list)-1 if strings.toLowerAscii(list[index])==wanted then return index end if end for;return -1
end function
/// Collect random-list names referenced by the parsed components of a chat message.
/// @param message Message record; accesses `components`.
function randomReferences(message)
  values=[];if message==void then return values end if;for each component in message.components if component.kind==profiles.COMPONENT_RANDOM then values=values+[component.text] end if end for;return values
end function
/// Collect distinct random-list references missing from the supplied chat string list.
/// @param message Message text supplied to the diagnostic or chat operation.
/// @param stringList Array or byte sequence accessed at `index`.
function botCheckChatMessageIntegrety(message,stringList)
  missing=[];for each value in randomReferences(message) if botFindStringInList(stringList,value)<0 and botFindStringInList(missing,value)<0 then missing=missing+[value] end if end for;return missing
end function
/// Check every initial-chat message for unresolved random-list references and report distinct missing names.
/// @param state AI chat runtime state; accesses `output`.
/// @param chat Chat record; accesses `types`.
function botCheckInitialChatIntegrety(state,chat)
  if chat==void then return ["missing chat"] end if;available=[];for each list in state.output.randomLists available=available+[list.name] end for;missing=[];for each chatType in chat.types for each message in chatType.messages for each value in botCheckChatMessageIntegrety(message,available) if botFindStringInList(missing,value)<0 then missing=missing+[value] end if end for end for end for;return missing
end function
/// Check reply-chat messages for unresolved random-list references and report distinct missing names.
/// @param state AI chat runtime state; accesses `output`.
/// @param replyChat Value used by `botCheckReplyChatIntegrety` in `if replyChat==void then return ["missing reply chat"] end if`.
function botCheckReplyChatIntegrety(state,replyChat)
  missing=[];if replyChat==void then return ["missing reply chat"] end if;available=[];for each list in state.output.randomLists available=available+[list.name] end for;for each reply in replyChat for each message in reply.messages for each value in botCheckChatMessageIntegrety(message,available) if botFindStringInList(missing,value)<0 then missing=missing+[value] end if end for end for end for;return missing
end function
/// Set `state.diagnostics` to `state.diagnostics+["replies:"+str(len(replyChat))]` in `mq3.botlib.ai_chat_runtime.botDumpReplyChat`. Return paths include `len(replyChat)`.
/// @param state AI chat runtime state; accesses `diagnostics`. May update `state.diagnostics` in place.
/// @param replyChat Sequence whose length bounds the iteration or lookup in `botDumpReplyChat`.
function botDumpReplyChat(state,replyChat) state.diagnostics=state.diagnostics+["replies:"+str(len(replyChat))];return len(replyChat) end function
/// Set `state.output.replies` to `[]` in `mq3.botlib.ai_chat_runtime.botFreeReplyChat`.
/// @param state AI chat runtime state; accesses `output`. May update `state.output.replies` in place.
function botFreeReplyChat(state) state.output.replies=[];return 0 end function
/// Check that a reply key set contains at least one positive key without the AND or NOT modifiers.
/// @param keys Value used by `botCheckValidReplyChatKeySet` in `for each key in keys if (key.flags&output.KEY_AND)==0 and (key.flags&output.KEY_NOT)==0 then positive=true end i...`.
function botCheckValidReplyChatKeySet(keys)
  positive=false;for each key in keys if (key.flags&output.KEY_AND)==0 and (key.flags&output.KEY_NOT)==0 then positive=true end if end for;return positive
end function
/// Set `state.output.replies` to `values` in `mq3.botlib.ai_chat_runtime.botLoadReplyChat`. Return paths include `len(values)`.
/// @param state AI chat runtime state; accesses `output`, `profiles`, `strings` and `actions`. May update `state.output.replies` in place.
/// @param filename Filename supplied to the configured loader or file service.
function botLoadReplyChat(state,filename)
  parser=state.output;if filename!="rchat.c" then alias=AliasContext(state,filename,"rchat.c");parser=output.create(state.profiles,state.strings,state.actions,alias,aliasRead,void,void) end if
  values=output.parseReplies(parser);if values is error then return values end if;state.output.replies=values;return len(values)
end function
/// Set `state.diagnostics` to `state.diagnostics+["initial:"+str(count)]` in `mq3.botlib.ai_chat_runtime.botDumpInitialChat`. Return paths include `count`.
/// @param state AI chat runtime state; accesses `diagnostics`. May update `state.diagnostics` in place.
/// @param chat Chat record; accesses `messageCount`.
function botDumpInitialChat(state,chat) count=0;if chat!=void then count=chat.messageCount end if;state.diagnostics=state.diagnostics+["initial:"+str(count)];return count end function
/// Forward `botLoadInitialChat` to `mq3.botlib.ai_chat_profiles.parseProfile` and return the delegated result.
/// @param state AI chat runtime state; accesses `profiles`.
/// @param chatFile Bot chat-definition filename.
/// @param chatName Named chat profile within the chat-definition file.
function botLoadInitialChat(state,chatFile,chatName) return profiles.parseProfile(state.profiles,chatFile,chatName) end function
/// Apply `mq3.botlib.ai_resource_pools.chatState` while evaluating `botFreeChatFile`.
/// @param state AI chat runtime state; accesses `pools`.
/// @param chatState Handle of the pooled bot chat state.
function botFreeChatFile(state,chatState) value=pools.chatState(state.pools,chatState);if value==void then return 0 end if;value.chat=void;return 0 end function
/// Forward `botLoadChatFile` to `mq3.botlib.ai_chat_profiles.loadChatFile` and return the delegated result.
/// @param state AI chat runtime state; accesses `profiles`.
/// @param chatState Handle of the pooled bot chat state.
/// @param chatFile Bot chat-definition filename.
/// @param chatName Named chat profile within the chat-definition file.
function botLoadChatFile(state,chatState,chatFile,chatName) return profiles.loadChatFile(state.profiles,chatState,chatFile,chatName) end function

// Construction, selection and delivery -----------------------------------
/// @param state AI chat runtime state; accesses `output`.
/// @param message Message text supplied to the diagnostic or chat operation.
/// @param variables Chat substitution values in their numbered slots.
/// @param messageContext Context bit mask for selecting and expanding chat messages.
/// @param variableContext Context bit mask for substituting chat variables.
/// @param reply Value used by `expandOnce` in `if reply then piece=replaceReplySynonyms(state,piece,vcontext) else if vcontext!=0 and state.strings!=void then...`.
function botExpandChatMessage(state,message,variables,messageContext,variableContext,reply)
  current=profiles.Message(message,output.componentsFromEncoded(message),-40.0);expanded=output.expandOnce(state.output,current.components,variables,variableContext,reply);if expanded is error then return expanded end if;expanded[0]=output.replaceWeightedSynonyms(state.output,expanded[0],messageContext);return expanded
end function
/// Forward `botConstructChatMessage` to `mq3.botlib.ai_chat_output.construct` and return the delegated result.
/// @param state AI chat runtime state; accesses `output`.
/// @param message Message text supplied to the diagnostic or chat operation.
/// @param variables Chat substitution values in their numbered slots.
/// @param messageContext Context bit mask for selecting and expanding chat messages.
/// @param variableContext Context bit mask for substituting chat variables.
/// @param reply Value used by `expandOnce` in `if reply then piece=replaceReplySynonyms(state,piece,vcontext) else if vcontext!=0 and state.strings!=void then...`.
function botConstructChatMessage(state,message,variables,messageContext,variableContext,reply) return output.construct(state.output,message,variables,messageContext,variableContext,reply) end function
/// Apply `mq3.botlib.ai_resource_pools.chatState`, `mq3.botlib.ai_chat_profiles.typeByName` and `mq3.botlib.ai_chat_output.choose` while evaluating `botChooseInitialChatMessage`. Return paths include `output.choose(selected.messages,state.output,true)`.
/// @param state AI chat runtime state; accesses `pools` and `output`.
/// @param chatState Handle of the pooled bot chat state.
/// @param type Name used to identify the requested entry.
function botChooseInitialChatMessage(state,chatState,type)
  value=pools.chatState(state.pools,chatState);if value==void or value.chat==void then return void end if;selected=profiles.typeByName(value.chat,type);if selected==void then return void end if;return output.choose(selected.messages,state.output,true)
end function
/// Apply `mq3.botlib.ai_resource_pools.chatState` and `mq3.botlib.ai_chat_profiles.typeByName` while evaluating `botNumInitialChats`. Return paths include `len(selected.messages)`.
/// @param state AI chat runtime state; accesses `pools`.
/// @param chatState Handle of the pooled bot chat state.
/// @param type Name used to identify the requested entry.
function botNumInitialChats(state,chatState,type)
  value=pools.chatState(state.pools,chatState);if value==void or value.chat==void then return 0 end if;selected=profiles.typeByName(value.chat,type);if selected==void then return 0 end if;return len(selected.messages)
end function
/// Forward `botInitialChat` to `mq3.botlib.ai_chat_output.initialChat` and return the delegated result.
/// @param state AI chat runtime state; accesses `output`.
/// @param chatState Handle of the pooled bot chat state.
/// @param type Name used to identify the requested entry.
/// @param messageContext Context bit mask for selecting and expanding chat messages.
/// @param variables Chat substitution values in their numbered slots.
function botInitialChat(state,chatState,type,messageContext,variables) return output.initialChat(state.output,chatState,type,messageContext,variables) end function
/// Set `state.diagnostics` to `state.diagnostics+["reply-keys:"+str(count)]` in `mq3.botlib.ai_chat_runtime.botPrintReplyChatKeys`. Return paths include `count`.
/// @param state AI chat runtime state; accesses `diagnostics`. May update `state.diagnostics` in place.
/// @param replyChat Value used by `botPrintReplyChatKeys` in `for each reply in replyChat count=count+len(reply.keys) end for`.
function botPrintReplyChatKeys(state,replyChat)
  count=0;for each reply in replyChat count=count+len(reply.keys) end for;state.diagnostics=state.diagnostics+["reply-keys:"+str(count)];return count
end function
/// Forward `botReplyChat` to `mq3.botlib.ai_chat_output.replyChat` and return the delegated result.
/// @param state AI chat runtime state; accesses `output`.
/// @param chatState Handle of the pooled bot chat state.
/// @param message Message text supplied to the diagnostic or chat operation.
/// @param messageContext Context bit mask for selecting and expanding chat messages.
/// @param variableContext Context bit mask for substituting chat variables.
/// @param variables Chat substitution values in their numbered slots.
function botReplyChat(state,chatState,message,messageContext,variableContext,variables) return output.replyChat(state.output,chatState,message,messageContext,variableContext,variables) end function
/// Forward `botChatLength` to `mq3.botlib.ai_chat_output.chatLength` and return the delegated result.
/// @param state AI chat runtime state; accesses `output`.
/// @param chatState Handle of the pooled bot chat state.
function botChatLength(state,chatState) return output.chatLength(state.output,chatState) end function
/// Forward `botEnterChat` to `mq3.botlib.ai_chat_output.enterChat` and return the delegated result.
/// @param state AI chat runtime state; accesses `output`.
/// @param chatState Handle of the pooled bot chat state.
/// @param clientTo Value passed as argument 1 to `str`.
/// @param sendTo Value used by `enterChat` in `if sendTo==CHAT_TEAM then result=ea.command(state.actions,cs.client,"say_team "+message) else if sendTo==CHAT_TE...`.
function botEnterChat(state,chatState,clientTo,sendTo) return output.enterChat(state.output,chatState,clientTo,sendTo) end function
/// Consume the pending chat message, remove tildes, and truncate the returned bytes to leave space for a terminator.
/// @param state AI chat runtime state; accesses `pools`.
/// @param chatState Handle of the pooled bot chat state.
/// @param size Size or capacity supplied to the buffer operation.
function botGetChatMessage(state,chatState,size)
  value=pools.chatState(state.pools,chatState);if value==void then return void end if;message=output.removeTildes(value.chatMessage);value.chatMessage="";if size<=0 then return "" end if;data=bytes(message);count=len(data);if count>=size then count=size-1 end if;return decode(slice(data,0,count))
end function
/// Forward `botSetChatGender` to `mq3.botlib.ai_chat_profiles.setChatGender` and return the delegated result.
/// @param state AI chat runtime state; accesses `profiles`.
/// @param chatState Handle of the pooled bot chat state.
/// @param gender Chat gender identifier.
function botSetChatGender(state,chatState,gender) return profiles.setChatGender(state.profiles,chatState,gender) end function
/// Forward `botSetChatName` to `mq3.botlib.ai_chat_profiles.setChatName` and return the delegated result.
/// @param state AI chat runtime state; accesses `profiles`.
/// @param chatState Handle of the pooled bot chat state.
/// @param name Name used to identify the requested entry.
/// @param client Value used by `setChatName` in `chatState.client=client`.
function botSetChatName(state,chatState,name,client) return profiles.setChatName(state.profiles,chatState,name,client) end function

// Global and per-client lifecycle ----------------------------------------
/// @param state AI chat runtime state; accesses `output`.
function botResetChatAI(state)
  for each reply in state.output.replies for each message in reply.messages message.recentTime=0.0 end for end for;return 0
end function
/// Forward `botAllocChatState` to `mq3.botlib.ai_resource_pools.allocChatState` and return the delegated result.
/// @param state AI chat runtime state; accesses `pools`.
function botAllocChatState(state) return pools.allocChatState(state.pools) end function
/// Forward `botChatStateFromHandle` to `mq3.botlib.ai_resource_pools.chatState` and return the delegated result.
/// @param state AI chat runtime state; accesses `pools`.
/// @param handle Handle identifying the allocated bot chat state.
function botChatStateFromHandle(state,handle) return pools.chatState(state.pools,handle) end function
/// Apply `mq3.botlib.ai_resource_pools.chatState`, `mq3.botlib.ai_console_messages.clearChat` and `mq3.botlib.ai_chat_runtime.botFreeChatFile` while evaluating `botFreeChatState`. Return paths include `pools.freeChatState(state.pools,handle)`.
/// @param state AI chat runtime state; accesses `pools`, `console` and `profiles`.
/// @param handle Handle identifying the allocated bot chat state.
function botFreeChatState(state,handle)
  value=pools.chatState(state.pools,handle);if value==void then return 0 end if;console.clearChat(state.console,handle);if state.profiles.reload then botFreeChatFile(state,handle) end if;return pools.freeChatState(state.pools,handle)
end function
/// Update `state.output.replies`, `state.output.loaded` and `state.setup` during `botSetupChatAI`.
/// @param state AI chat runtime state; accesses `strings`, `matches`, `output` and `setup`. May update `state.output.replies`, `state.output.loaded` and `state.setup` in place.
/// @param noChat Value used by `botSetupChatAI` in `if noChat then state.output.replies=[] else replyCount=botLoadReplyChat(state,"rchat.c")`.
/// @param consoleCapacity Maximum number of entries to allocate or retain.
function botSetupChatAI(state,noChat,consoleCapacity)
  synonyms=chatStrings.ensureLoaded(state.strings);if synonyms is error then return synonyms end if;randomCount=botLoadRandomStrings(state,"rnd.c");if randomCount is error then return randomCount end if;matchCount=matches.ensureLoaded(state.matches);if matchCount is error then return matchCount end if
  if noChat then state.output.replies=[] else replyCount=botLoadReplyChat(state,"rchat.c");if replyCount is error then return replyCount end if end if
  state.output.loaded=true;configured=initConsoleMessageHeap(state,consoleCapacity);if configured is error then return configured end if;state.setup=true;return 0
end function
/// Set `state.setup` to `false` in `mq3.botlib.ai_chat_runtime.botShutdownChatAI`.
/// @param state AI chat runtime state; accesses `pools`, `profiles`, `console`, `matches` and `strings` and related fields. May update `state.setup` in place.
function botShutdownChatAI(state)
  if state==void then return 0 end if;for handle=1 to pools.MAX_CLIENTS if pools.chatState(state.pools,handle)!=void then botFreeChatState(state,handle) end if end for;profiles.clearCache(state.profiles);console.shutdown(state.console);matches.clear(state.matches);chatStrings.clear(state.strings);output.shutdown(state.output);state.setup=false;return 0
end function
