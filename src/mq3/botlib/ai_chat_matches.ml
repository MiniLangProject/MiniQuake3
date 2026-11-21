// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// BotFindMatch, StringsMatch and match.c loading from be_ai_chat.c.
package mq3.botlib.ai_chat_matches

import mq3.vm.pc_parser as pc
import std.string as textStrings
import std.ds.list as lists

const OP_STRING_CONTAINS=517
const OP_FIND_MATCH=518
const OP_MATCH_VARIABLE=519
const MAX_MESSAGE_SIZE=256
const MAX_MATCH_VARIABLES=8
const MATCH_ABI_SIZE=328

struct Piece variable alternatives end struct
struct Template context pieces type subtype end struct
struct Match string type subtype offsets lengths end struct
struct Loader state end struct
struct State context readFn templates loaded fileReads end struct

function fail(message) return error(7597,"AI chat matches: "+message) end function
function create(context,readFn) return State(context,readFn,[],false,0) end function
function emptyMatch(value) return Match(value,0,0,[-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,0,0,0,0,0]) end function
function botPath(name)
  value=name;while textStrings.startsWith(value,"/") value=decode(slice(bytes(value),1,len(bytes(value))-1)) end while
  if textStrings.startsWith(textStrings.toLowerAscii(value),"botfiles/") then return value end if;return "botfiles/"+value
end function
function loadText(loader,name)
  if loader==void or loader.state==void or loader.state.readFn==void then return fail("file callback missing") end if
  loader.state.fileReads=loader.state.fileReads+1;return loader.state.readFn(loader.state.context,botPath(name))
end function
function take(registry,source) return pc.read(registry,source) end function
function expectText(registry,source,value)
  token=take(registry,source);if token==void or token is error then return fail("expected "+value) end if
  if token.text!=value then return fail("expected "+value+", found "+token.text) end if;return token
end function
function expectInteger(registry,source,label)
  token=take(registry,source);if token==void or token is error then return fail("expected integer "+label) end if
  if token.type==pc.TT_NUMBER and (token.subtype&pc.TT_INTEGER)!=0 then return token.intValue end if
  if token.text!="$" then return fail("expected integer "+label) end if
  name=take(registry,source);if name==void or name is error or name.text!="evalint" then return fail("expected $evalint for "+label) end if
  opened=expectText(registry,source,"(");if opened is error then return opened end if;value=0;needValue=true
  while true
    part=take(registry,source);if part==void or part is error then return fail("unterminated $evalint") end if
    if needValue then if part.type!=pc.TT_NUMBER or (part.subtype&pc.TT_INTEGER)==0 then return fail("expected $evalint operand") end if;value=value|part.intValue;needValue=false
    else
      if part.text==")" then return value end if;if part.text!="|" then return fail("unsupported $evalint operator "+part.text) end if;needValue=true
    end if
  end while
end function

function parsePieces(registry,source,firstToken)
  pieces=[];lastWasVariable=false;nextToken=firstToken
  while true
    token=nextToken;nextToken=void;if token==void then token=take(registry,source) end if;if token==void or token is error then return fail("unterminated match template") end if
    separator=void
    if token.type==pc.TT_NUMBER and (token.subtype&pc.TT_INTEGER)!=0 then
      variable=token.intValue;if variable<0 or variable>=MAX_MATCH_VARIABLES then return fail("match variable out of range") end if
      if lastWasVariable then return fail("adjacent match variables") end if
      pieces=pieces+[Piece(variable,[])];lastWasVariable=true
      separator=take(registry,source);if separator==void or separator is error then return fail("unterminated variable") end if
    else if token.type==pc.TT_STRING then
      alternatives=[token.text];hasEmpty=token.text=="";separator=take(registry,source)
      while separator!=void and not (separator is error) and separator.text=="|"
        alternative=take(registry,source);if alternative==void or alternative is error or alternative.type!=pc.TT_STRING then return fail("expected alternative string") end if
        alternatives=alternatives+[alternative.text];if alternative.text=="" then hasEmpty=true end if;separator=take(registry,source)
      end while
      if separator==void or separator is error then return fail("unterminated string piece") end if
      pieces=pieces+[Piece(-1,alternatives)];if not hasEmpty then lastWasVariable=false end if
    else return fail("invalid match piece "+token.text) end if
    if separator.text=="=" then return pieces end if
    if separator.text!="," then return fail("expected match piece separator, found "+separator.text) end if
  end while
end function

function parse(state,filename)
  loader=Loader(state);registry=pc.create(loader,loadText);source=pc.load(registry,filename);if source==0 then return fail("cannot load "+filename) end if
  templates=lists.List.withCapacity(256)
  while true
    token=take(registry,source);if token==void then break end if
    if token is error or token.type!=pc.TT_NUMBER or (token.subtype&pc.TT_INTEGER)==0 then pc.free(registry,source);return fail("expected match context") end if
    context=token.intValue;opened=expectText(registry,source,"{");if opened is error then pc.free(registry,source);return opened end if
    while true
      first=take(registry,source);if first==void or first is error then pc.free(registry,source);return fail("unterminated context") end if
      if first.text=="}" then break end if
      pieces=parsePieces(registry,source,first);if pieces is error then pc.free(registry,source);return pieces end if
      openedType=expectText(registry,source,"(");if openedType is error then pc.free(registry,source);return openedType end if
      type=expectInteger(registry,source,"match type");if type is error then pc.free(registry,source);return type end if
      comma=expectText(registry,source,",");if comma is error then pc.free(registry,source);return comma end if
      subtype=expectInteger(registry,source,"match subtype");if subtype is error then pc.free(registry,source);return subtype end if
      closed=expectText(registry,source,")");if closed is error then pc.free(registry,source);return closed end if
      semicolon=expectText(registry,source,";");if semicolon is error then pc.free(registry,source);return semicolon end if
      templates.add(Template(context,pieces,type,subtype))
    end while
  end while
  pc.free(registry,source);return templates.toArray()
end function
function load(state,filename)
  if state==void then return fail("state missing") end if;templates=parse(state,filename);if templates is error then return templates end if
  state.templates=templates;state.loaded=true;return len(templates)
end function
function ensureLoaded(state) if state==void then return fail("state missing") end if;if state.loaded then return len(state.templates) end if;return load(state,"match.c") end function
function clear(state) if state!=void then state.templates=[];state.loaded=false end if;return 0 end function

function upper(value) if value>=97 and value<=122 then return value-32 end if;return value end function
function stringContains(value,needle,caseSensitive)
  input=bytes(value);wanted=bytes(needle);if len(wanted)==0 then return 0 end if;remaining=len(input)-len(wanted);if remaining<0 then return -1 end if
  for index=0 to remaining
    equal=true;for cursor=0 to len(wanted)-1 left=input[index+cursor];right=wanted[cursor];if not caseSensitive then left=upper(left);right=upper(right) end if;if left!=right then equal=false;break end if end for
    if equal then return index end if
  end for;return -1
end function
function suffix(value,start) data=bytes(value);if start>=len(data) then return "" end if;return decode(slice(data,start,len(data)-start)) end function
function stringsMatch(pieces,match)
  lastVariable=-1;position=0
  for each piece in pieces
    if piece.variable>=0 then match.offsets[piece.variable]=position;lastVariable=piece.variable
    else
      found=false;chosen="";chosenAt=position
      for each alternative in piece.alternatives
        if alternative=="" then found=true;chosen=alternative;chosenAt=position;break end if
        index=stringContains(suffix(match.string,position),alternative,false)
        if index>=0 then
          candidate=position+index
          if lastVariable>=0 then match.lengths[lastVariable]=candidate-match.offsets[lastVariable];lastVariable=-1;found=true;chosen=alternative;chosenAt=candidate;break
          else if index==0 then found=true;chosen=alternative;chosenAt=position;break end if
        end if
      end for
      if not found then return false end if;position=chosenAt+len(bytes(chosen))
    end if
  end for
  if lastVariable>=0 then match.lengths[lastVariable]=len(bytes(match.string))-match.offsets[lastVariable];return true end if
  return position==len(bytes(match.string))
end function
function trimEnters(value) data=bytes(value);count=len(data);while count>0 and data[count-1]==10 count=count-1 end while;return decode(slice(data,0,count)) end function
function findMatch(state,value,context)
  ready=ensureLoaded(state);if ready is error then return ready end if
  data=bytes(value);if len(data)>MAX_MESSAGE_SIZE then data=slice(data,0,MAX_MESSAGE_SIZE) end if;match=emptyMatch(trimEnters(decode(data)))
  for each template in state.templates
    if (template.context&context)!=0 then
      for index=0 to MAX_MATCH_VARIABLES-1 match.offsets[index]=-1 end for
      if stringsMatch(template.pieces,match) then match.type=template.type;match.subtype=template.subtype;return match end if
    end if
  end for;return void
end function
function matchVariable(match,variable,size)
  if match==void or variable<0 or variable>=MAX_MATCH_VARIABLES or size<=0 or match.offsets[variable]<0 then return "" end if
  count=match.lengths[variable];if count>=size then count=size-1 end if;if count<=0 then return "" end if
  return decode(slice(bytes(match.string),match.offsets[variable],count))
end function
