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

/// `Piece` record for ai chat matches, containing `variable` and `alternatives`.
struct Piece variable alternatives end struct
/// `Template` record for ai chat matches, containing `context`, `pieces`, `type` and `subtype`.
struct Template context pieces type subtype end struct
/// `Match` record for ai chat matches, containing `string`, `type`, `subtype`, `offsets` and `lengths`.
struct Match string type subtype offsets lengths end struct
/// `Loader` record for ai chat matches, containing `state`.
struct Loader state end struct
/// `State` record for ai chat matches, containing `context`, `readFn`, `templates`, `loaded` and `fileReads`.
struct State context readFn templates loaded fileReads end struct

/// Construct error `7597` with diagnostic text `"AI chat matches: "+message`.
/// @param message Message text supplied to the diagnostic or chat operation.
function fail(message) return error(7597,"AI chat matches: "+message) end function
/// Create a `mq3.botlib.ai_chat_matches.State` record, initializing `context` from `context` and `readFn` from `readFn`.
/// @param context Context forwarded to the configured host callbacks.
/// @param readFn Callback that loads a named resource through the supplied context.
function create(context,readFn) return State(context,readFn,[],false,0) end function
/// Create a `mq3.botlib.ai_chat_matches.Match` record, initializing `string` from `value`, `offsets` as `[-1,-1,-1,-1,-1,-1,-1,-1]` and `lengths` as `[0,0,0,0,0,0,0,0]`.
/// @param value Initial value stored in `mq3.botlib.ai_chat_matches.Match.string`.
function emptyMatch(value) return Match(value,0,0,[-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,0,0,0,0,0]) end function
/// Normalize a ai chat matches resource path by removing leading slashes and ensuring the botfiles prefix.
/// @param name Name used to identify the requested entry.
function botPath(name)
  value=name;while textStrings.startsWith(value,"/") value=decode(slice(bytes(value),1,len(bytes(value))-1)) end while
  if textStrings.startsWith(textStrings.toLowerAscii(value),"botfiles/") then return value end if;return "botfiles/"+value
end function
/// Set `loader.state.fileReads` to `loader.state.fileReads+1` in `mq3.botlib.ai_chat_matches.loadText`. Return paths include `loader.state.readFn(loader.state.context,botPath(name))`.
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
/// Apply `mq3.botlib.ai_chat_matches.take` while evaluating `expectText`. Return paths include `token`.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param source Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`.
/// @param value Operand used to evaluate the returned expression `fail("expected "+value)`.
function expectText(registry,source,value)
  token=take(registry,source);if token==void or token is error then return fail("expected "+value) end if
  if token.text!=value then return fail("expected "+value+", found "+token.text) end if;return token
end function
/// Apply `mq3.botlib.ai_chat_matches.take` and `mq3.botlib.ai_chat_matches.expectText` while evaluating `expectInteger`. Return paths include `fail("unsupported $evalint operator "+part.text)`.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param source Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`.
/// @param label Label retained with the diagnostic or action record.
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

/// Apply `mq3.botlib.ai_chat_matches.take` while evaluating `parsePieces`. Return paths include `fail("expected match piece separator, found "+separator.text)`.
/// @param registry Registry record; accesses `sources` and `defines`. May update `registry.defines` and `registry.defines[index]` in place.
/// @param source Value used by `read` in `if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if`.
/// @param firstToken Value used by `parsePieces` in `nextToken=firstToken`.
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

/// Apply `mq3.vm.pc_parser.create`, `mq3.vm.pc_parser.load` and `mq3.botlib.ai_chat_matches.take` while evaluating `parse`. Return paths include `templates.toArray()`.
/// @param state Initial value stored in `mq3.botlib.ai_chat_matches.Loader.state`.
/// @param filename Filename supplied to the configured loader or file service.
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
/// Set `state.templates` to `templates` and `state.loaded` to `true` in `mq3.botlib.ai_chat_matches.load`. Return paths include `len(templates)`.
/// @param state AI chat matches state; accesses `templates` and `loaded`. May update `state.templates` and `state.loaded` in place.
/// @param filename Filename supplied to the configured loader or file service.
function load(state,filename)
  if state==void then return fail("state missing") end if;templates=parse(state,filename);if templates is error then return templates end if
  state.templates=templates;state.loaded=true;return len(templates)
end function
/// Apply `mq3.botlib.ai_chat_matches.load` while evaluating `ensureLoaded`. Return paths include `load(state,"match.c")`.
/// @param state AI chat matches state; accesses `loaded` and `templates`.
function ensureLoaded(state) if state==void then return fail("state missing") end if;if state.loaded then return len(state.templates) end if;return load(state,"match.c") end function
/// Set `state.templates` to `[]` and `state.loaded` to `false` in `mq3.botlib.ai_chat_matches.clear`.
/// @param state AI chat matches state; accesses `templates` and `loaded`. May update `state.templates` and `state.loaded` in place.
function clear(state) if state!=void then state.templates=[];state.loaded=false end if;return 0 end function

/// Convert an ASCII lowercase letter to uppercase while preserving other byte values.
/// @param value Operand used to evaluate the returned expression `value-32`.
function upper(value) if value>=97 and value<=122 then return value-32 end if;return value end function
/// Apply `mq3.botlib.ai_chat_matches.upper` while evaluating `stringContains`. Return paths include `-1`.
/// @param value Value passed as argument 1 to `bytes`.
/// @param needle Text or value to search for.
/// @param caseSensitive Whether comparisons distinguish letter case.
function stringContains(value,needle,caseSensitive)
  input=bytes(value);wanted=bytes(needle);if len(wanted)==0 then return 0 end if;remaining=len(input)-len(wanted);if remaining<0 then return -1 end if
  for index=0 to remaining
    equal=true;for cursor=0 to len(wanted)-1 left=input[index+cursor];right=wanted[cursor];if not caseSensitive then left=upper(left);right=upper(right) end if;if left!=right then equal=false;break end if end for
    if equal then return index end if
  end for;return -1
end function
/// Return the text suffix beginning at the supplied byte offset, or an empty string beyond the end.
/// @param value Value passed as argument 1 to `bytes`.
/// @param start Value passed as argument 2 to `slice`.
function suffix(value,start) data=bytes(value);if start>=len(data) then return "" end if;return decode(slice(data,start,len(data)-start)) end function
/// Update `match.offsets[piece.variable]` and `match.lengths[lastVariable]` during `stringsMatch`. Return paths include `position==len(bytes(match.string))`.
/// @param pieces Value used by `stringsMatch` in `for each piece in pieces`.
/// @param match Parsed match record; accesses `offsets`, `string` and `lengths`. May update `match.offsets[piece.variable]` and `match.lengths[lastVariable]` in place.
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
/// Remove trailing line-feed bytes from chat text.
/// @param value Value passed as argument 1 to `bytes`.
function trimEnters(value) data=bytes(value);count=len(data);while count>0 and data[count-1]==10 count=count-1 end while;return decode(slice(data,0,count)) end function
/// Apply `mq3.botlib.ai_chat_matches.ensureLoaded`, `mq3.botlib.ai_chat_matches.emptyMatch` and `mq3.botlib.ai_chat_matches.trimEnters` while evaluating `findMatch`.
/// @param state AI chat matches state; accesses `templates`.
/// @param value Value passed as argument 1 to `bytes`.
/// @param context Bit mask selecting the bot-chat contexts accepted by this operation.
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
/// Extract a matched chat variable and truncate it to the supplied buffer capacity minus its terminator.
/// @param match Parsed match record; accesses `offsets`, `lengths` and `string`.
/// @param variable Operand used to evaluate the returned expression `decode(slice(bytes(match.string),match.offsets[variable],count))`.
/// @param size Size or capacity supplied to the buffer operation.
function matchVariable(match,variable,size)
  if match==void or variable<0 or variable>=MAX_MATCH_VARIABLES or size<=0 or match.offsets[variable]<0 then return "" end if
  count=match.lengths[variable];if count>=size then count=size-1 end if;if count<=0 then return "" end if
  return decode(slice(bytes(match.string),match.offsets[variable],count))
end function
