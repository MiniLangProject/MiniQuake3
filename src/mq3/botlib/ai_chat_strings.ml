// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// UnifyWhiteSpaces, BotReplaceSynonyms and syn.c loading from be_ai_chat.c.
package mq3.botlib.ai_chat_strings

import mq3.vm.pc_parser as pc
import std.string as textStrings

const OP_UNIFY_WHITE_SPACES=520
const OP_REPLACE_SYNONYMS=521
const MAX_MESSAGE_SIZE=256

struct Synonym value weight end struct
struct Group context synonyms end struct
struct Loader state end struct
struct State context readFn groups loaded fileReads end struct

function fail(message) return error(7595,"AI chat strings: "+message) end function
function create(context,readFn) return State(context,readFn,[],false,0) end function
function botPath(name)
  value=name;while textStrings.startsWith(value,"/") value=decode(slice(bytes(value),1,len(bytes(value))-1)) end while
  if textStrings.startsWith(textStrings.toLowerAscii(value),"botfiles/") then return value end if;return "botfiles/"+value
end function
function loadText(loader,name)
  if loader==void or loader.state==void or loader.state.readFn==void then return fail("file callback missing") end if
  loader.state.fileReads=loader.state.fileReads+1;return loader.state.readFn(loader.state.context,botPath(name))
end function
function take(registry,source) return pc.read(registry,source) end function
function expect(registry,source,text)
  token=take(registry,source);if token==void or token is error then return fail("expected "+text) end if;if token.text!=text then return fail("expected "+text+", found "+token.text) end if;return token
end function
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
function load(state,filename)
  if state==void then return fail("state missing") end if;groups=parse(state,filename);if groups is error then return groups end if
  state.groups=groups;state.loaded=true;return len(groups)
end function
function ensureLoaded(state)
  if state==void then return fail("state missing") end if;if state.loaded then return len(state.groups) end if;return load(state,"syn.c")
end function
function clear(state) if state!=void then state.groups=[];state.loaded=false end if;return 0 end function

function isWhiteSpace(value)
  if value>=97 and value<=122 or value>=65 and value<=90 or value>=48 and value<=57 then return false end if
  return not (value==40 or value==41 or value==63 or value==58 or value==39 or value==47 or value==44 or value==46 or value==91 or value==93 or value==45 or value==95 or value==43 or value==61)
end function
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
function lower(value) if value>=65 and value<=90 then return value+32 end if;return value end function
function boundary(value) return value==32 or value==46 or value==44 or value==33 end function
function matchesAt(data,word,at)
  if at<0 or at+len(word)>len(data) then return false end if
  for index=0 to len(word)-1 if lower(data[at+index])!=lower(word[index]) then return false end if end for;return true
end function
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
function replaceRange(value,at,count,replacement)
  input=bytes(value);piece=bytes(replacement);output=bytes(len(input)-count+len(piece),0)
  if at>0 then copyBytes(output,0,input,0,at) end if;if len(piece)>0 then copyBytes(output,at,piece,0,len(piece)) end if
  tail=len(input)-at-count;if tail>0 then copyBytes(output,at+len(piece),input,at+count,tail) end if;return decode(output)
end function
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
function replaceSynonyms(state,value,context)
  ready=ensureLoaded(state);if ready is error then return ready end if
  for each group in state.groups
    if (group.context&context)!=0 then canonical=group.synonyms[0].value;for index=1 to len(group.synonyms)-1 value=replaceWords(value,group.synonyms[index].value,canonical) end for end if
  end for;return value
end function
