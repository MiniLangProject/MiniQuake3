// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// UnifyWhiteSpaces, BotReplaceSynonyms and syn.c loading from be_ai_chat.c.
package mq3.botlib.ai_chat_strings

import mq3.vm.pc_parser as pc
import std.string as textStrings

const OP_UNIFY_WHITE_SPACES=520
const OP_REPLACE_SYNONYMS=521
const MAX_MESSAGE_SIZE=256

/// `Synonym` record for ai chat strings, containing `value` and `weight`.
struct Synonym value weight end struct
/// `Group` record for ai chat strings, containing `context` and `synonyms`.
struct Group context synonyms end struct
/// `Loader` record for ai chat strings, containing `state`.
struct Loader state end struct
/// `State` record for ai chat strings, containing `context`, `readFn`, `groups`, `loaded` and `fileReads`.
struct State context readFn groups loaded fileReads end struct

/// Construct error `7595` with diagnostic text `"AI chat strings: "+message`.
/// @param message Message text supplied to the diagnostic or chat operation.
function fail(message) return error(7595,"AI chat strings: "+message) end function
/// Create a `mq3.botlib.ai_chat_strings.State` record, initializing `context` from `context` and `readFn` from `readFn`.
/// @param context Context forwarded to the configured host callbacks.
/// @param readFn Callback that loads a named resource through the supplied context.
function create(context,readFn) return State(context,readFn,[],false,0) end function
/// Normalize a ai chat strings resource path by removing leading slashes and ensuring the botfiles prefix.
/// @param name Name used to identify the requested entry.
function botPath(name)
  value=name;while textStrings.startsWith(value,"/") value=decode(slice(bytes(value),1,len(bytes(value))-1)) end while
  if textStrings.startsWith(textStrings.toLowerAscii(value),"botfiles/") then return value end if;return "botfiles/"+value
end function
/// Set `loader.state.fileReads` to `loader.state.fileReads+1` in `mq3.botlib.ai_chat_strings.loadText`. Return paths include `loader.state.readFn(loader.state.context,botPath(name))`.
/// @param loader Loader record; accesses `state`. May update `loader.state.fileReads` in place.
/// @param name Name used to identify the requested entry.
function loadText(loader,name)
  if loader==void or loader.state==void or loader.state.readFn==void then return fail("file callback missing") end if
  loader.state.fileReads=loader.state.fileReads+1;return loader.state.readFn(loader.state.context,botPath(name))
end function
/// Forward `take` to `mq3.vm.pc_parser.read` and return the delegated result.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param source Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`.
function take(registry,source) return pc.read(registry,source) end function
/// Apply `mq3.botlib.ai_chat_strings.take` while evaluating `expect`. Return paths include `token`.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param source Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`.
/// @param text Text to parse, format or deliver.
function expect(registry,source,text)
  token=take(registry,source);if token==void or token is error then return fail("expected "+text) end if;if token.text!=text then return fail("expected "+text+", found "+token.text) end if;return token
end function
/// Build the `mq3.botlib.ai_chat_strings.Group` result for `parseGroup`. Return paths include `Group(context,values)`.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param source Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`.
/// @param context Context forwarded to the configured host callbacks.
function parseGroup(registry,source,context)
  values=[]
  while true
    if expect(registry,source,"(") is error then return fail("expected synonym entry") end if
    name=take(registry,source);if name==void or name is error or name.type!=pc.TT_STRING or name.text=="" then return fail("expected non-empty synonym string") end if
    if expect(registry,source,",") is error then return fail("expected synonym weight separator") end if
    weight=take(registry,source);if weight==void or weight is error or weight.type!=pc.TT_NUMBER then return fail("expected synonym weight") end if
    if expect(registry,source,")") is error then return fail("expected synonym entry end") end if
    values=values+[Synonym(name.text,weight.floatValue)]
    separator=take(registry,source);if separator==void or separator is error then return fail("unterminated synonym group") end if
    if separator.text=="]" then break end if
    if separator.text!="," then return fail("expected synonym separator") end if
  end while
  if len(values)<2 then return fail("synonym group needs at least two entries") end if
  return Group(context,values)
end function
/// Apply `mq3.vm.pc_parser.create`, `mq3.vm.pc_parser.load` and `mq3.botlib.ai_chat_strings.take` while evaluating `parse`. Return paths include `groups`.
/// @param state Initial value stored in `mq3.botlib.ai_chat_strings.Loader.state`.
/// @param filename Filename supplied to the configured loader or file service.
function parse(state,filename)
  loader=Loader(state);registry=pc.create(loader,loadText);source=pc.load(registry,filename);if source==0 then return fail("cannot load "+filename) end if
  groups=[];context=0;contextStack=[]
  while true
    token=take(registry,source)
    if token==void then break end if
    if token is error then pc.free(registry,source);return token end if
    if token.type==pc.TT_NUMBER then
      if len(contextStack)>=32 then pc.free(registry,source);return fail("more than 32 context levels") end if
      context=context|token.intValue;contextStack=contextStack+[token.intValue]
      opened=expect(registry,source,"{");if opened is error then pc.free(registry,source);return opened end if
    else if token.text=="}" then
      if len(contextStack)==0 then pc.free(registry,source);return fail("too many context ends") end if
      index=len(contextStack)-1;context=context&(~contextStack[index]);next=[];if index>0 then for cursor=0 to index-1 next=next+[contextStack[cursor]] end for end if;contextStack=next
    else if token.text=="[" then
      group=parseGroup(registry,source,context);if group is error then pc.free(registry,source);return group end if;groups=groups+[group]
    else pc.free(registry,source);return fail("unexpected token "+token.text) end if
  end while
  pc.free(registry,source);if len(contextStack)!=0 then return fail("missing context end") end if;return groups
end function
/// Set `state.groups` to `groups` and `state.loaded` to `true` in `mq3.botlib.ai_chat_strings.load`. Return paths include `len(groups)`.
/// @param state AI chat strings state; accesses `groups` and `loaded`. May update `state.groups` and `state.loaded` in place.
/// @param filename Filename supplied to the configured loader or file service.
function load(state,filename)
  if state==void then return fail("state missing") end if;groups=parse(state,filename);if groups is error then return groups end if
  state.groups=groups;state.loaded=true;return len(groups)
end function
/// Apply `mq3.botlib.ai_chat_strings.load` while evaluating `ensureLoaded`. Return paths include `load(state,"syn.c")`.
/// @param state AI chat strings state; accesses `loaded` and `groups`.
function ensureLoaded(state)
  if state==void then return fail("state missing") end if;if state.loaded then return len(state.groups) end if;return load(state,"syn.c")
end function
/// Set `state.groups` to `[]` and `state.loaded` to `false` in `mq3.botlib.ai_chat_strings.clear`.
/// @param state AI chat strings state; accesses `groups` and `loaded`. May update `state.groups` and `state.loaded` in place.
function clear(state) if state!=void then state.groups=[];state.loaded=false end if;return 0 end function

/// Classify separators according to the released bot-chat character rules, which preserve letters, digits and listed punctuation.
/// @param value Value used by `isWhiteSpace` in `if value>=97 and value<=122 or value>=65 and value<=90 or value>=48 and value<=57 then return false end if`.
function isWhiteSpace(value)
  if value>=97 and value<=122 or value>=65 and value<=90 or value>=48 and value<=57 then return false end if
  return not (value==40 or value==41 or value==63 or value==58 or value==39 or value==47 or value==44 or value==46 or value==91 or value==93 or value==45 or value==95 or value==43 or value==61)
end function
/// Apply `mq3.botlib.ai_chat_strings.isWhiteSpace` while evaluating `unifyWhiteSpaces`. Return paths include `decode(slice(output,0,count))`.
/// @param value Value passed as argument 1 to `bytes`.
function unifyWhiteSpaces(value)
  input=bytes(value);output=bytes(len(input),0);count=0;pending=false
  for index=0 to len(input)-1
    byte=input[index]
    if isWhiteSpace(byte) then if count>0 then pending=true end if
    else
      if pending then output[count]=32;count=count+1;pending=false end if
      output[count]=byte;count=count+1
    end if
  end for
  return decode(slice(output,0,count))
end function
/// Convert an ASCII uppercase letter to lowercase while preserving other byte values.
/// @param value Operand used to evaluate the returned expression `value+32`.
function lower(value) if value>=65 and value<=90 then return value+32 end if;return value end function
/// Test `value==32 or value==46 or value==44 or value==33` as the condition for `boundary`.
/// @param value Operand used to evaluate the returned expression `value==32 or value==46 or value==44 or value==33`.
function boundary(value) return value==32 or value==46 or value==44 or value==33 end function
/// Apply `mq3.botlib.ai_chat_strings.lower` while evaluating `matchesAt`.
/// @param data Array or byte sequence accessed at `at+index`.
/// @param word Array or byte sequence accessed at `index`.
/// @param at Value used by `matchesAt` in `if at<0 or at+len(word)>len(data) then return false end if`.
function matchesAt(data,word,at)
  if at<0 or at+len(word)>len(data) then return false end if
  for index=0 to len(word)-1 if lower(data[at+index])!=lower(word[index]) then return false end if end for;return true
end function
/// Apply `mq3.botlib.ai_chat_strings.boundary` and `mq3.botlib.ai_chat_strings.matchesAt` while evaluating `findWord`. Return paths include `-1`.
/// @param value Value passed as argument 1 to `bytes`.
/// @param wordValue Value passed as argument 1 to `bytes`.
/// @param start Value used by `findWord` in `if len(word)==0 or start<0 then return -1 end if`.
function findWord(value,wordValue,start)
  data=bytes(value);word=bytes(wordValue);if len(word)==0 or start<0 then return -1 end if
  remaining=len(data)-start-len(word);at=start;iteration=0
  while iteration<=remaining
    if iteration>0 then
      while at<len(data) and not boundary(data[at]) at=at+1 end while
      if at>=len(data) then return -1 end if;at=at+1
    end if
    if matchesAt(data,word,at) then after=at+len(word);if after==len(data) or after<len(data) and boundary(data[after]) then return at end if end if
    iteration=iteration+1;at=at+1
  end while;return -1
end function
/// Replace a byte range in a string while preserving its prefix and suffix.
/// @param value Value passed as argument 1 to `bytes`.
/// @param at Value passed as argument 5 to `copyBytes`.
/// @param count Number of entries or bytes processed by this call.
/// @param replacement Text substituted for a matching word or token.
function replaceRange(value,at,count,replacement)
  input=bytes(value);piece=bytes(replacement);output=bytes(len(input)-count+len(piece),0)
  if at>0 then copyBytes(output,0,input,0,at) end if;if len(piece)>0 then copyBytes(output,at,piece,0,len(piece)) end if
  tail=len(input)-at-count;if tail>0 then copyBytes(output,at+len(piece),input,at+count,tail) end if;return decode(output)
end function
/// Apply `mq3.botlib.ai_chat_strings.findWord` and `mq3.botlib.ai_chat_strings.replaceRange` while evaluating `replaceWords`.
/// @param value Value passed as argument 1 to `bytes`.
/// @param synonym Word or synonym selected for replacement.
/// @param replacement Text substituted for a matching word or token.
function replaceWords(value,synonym,replacement)
  cursor=0
  while cursor<=len(bytes(value))
    at=findWord(value,synonym,cursor);if at<0 then break end if
    containing=false;replacementAt=findWord(value,replacement,0)
    while replacementAt>=0
      if replacementAt<=at and at<replacementAt+len(bytes(replacement)) then containing=true;break end if
      replacementAt=findWord(value,replacement,replacementAt+1)
    end while
    if not containing then value=replaceRange(value,at,len(bytes(synonym)),replacement) end if
    cursor=at+len(bytes(replacement))
  end while;return value
end function
/// Apply `mq3.botlib.ai_chat_strings.ensureLoaded` and `mq3.botlib.ai_chat_strings.replaceWords` while evaluating `replaceSynonyms`.
/// @param state AI chat strings state; accesses `groups`.
/// @param value Value passed as argument 1 to `bytes`.
/// @param context Bit mask selecting the bot-chat contexts accepted by this operation.
function replaceSynonyms(state,value,context)
  ready=ensureLoaded(state);if ready is error then return ready end if
  for each group in state.groups
    if (group.context&context)!=0 then canonical=group.synonyms[0].value;for index=1 to len(group.synonyms)-1 value=replaceWords(value,group.synonyms[index].value,canonical) end for end if
  end for;return value
end function
