// SPDX-License-Identifier: GPL-2.0-or-later
// QVM-facing subset of the botlib precompiler handle API used by UI menus/HUDs.
package mq3.vm.pc_parser

import mq3.compat.numeric as n
import std.time as time

const MAX_SOURCEFILES=64
const MAX_TOKENLENGTH=1024
const TOKEN_SIZE=1040
const TT_STRING=1
const TT_LITERAL=2
const TT_NUMBER=3
const TT_NAME=4
const TT_PUNCTUATION=5
const TT_DECIMAL=0x0008
const TT_HEX=0x0100
const TT_OCTAL=0x0200
const TT_FLOAT=0x0800
const TT_INTEGER=0x1000
const P_PRECOMP=51

/// Token record for vm.pc_parser, containing `type`, `subtype`, `intValue`, `floatValue`, `text`, `line`, and 1 further fields.
struct Token type subtype intValue floatValue text line leadingSpace end struct
/// Source record for vm.pc_parser, containing `name`, `data`, `offset`, `line`, `pending`.
struct Source name data offset line pending end struct
/// Define record for vm.pc_parser, containing `name`, `parameters`, `tokens`, `functionLike`.
struct Define name parameters tokens functionLike end struct
/// Conditional record for vm.pc_parser, containing `parentActive`, `branchTaken`, `active`, `elseSeen`.
struct Conditional parentActive branchTaken active elseSeen end struct
/// Expression record for vm.pc_parser, containing `registry`, `tokens`, `position`, `valid`, `depth`.
struct Expression registry tokens position valid depth end struct
/// ArgumentResult record for vm.pc_parser, containing `valid`, `next`, `arguments`.
struct ArgumentResult valid next arguments end struct
/// MacroExpansion record for vm.pc_parser, containing `valid`, `invoked`, `tokens`.
struct MacroExpansion valid invoked tokens end struct
/// Registry record for vm.pc_parser, containing `context`, `loadFn`, `sources`, `defines`.
struct Registry context loadFn sources defines end struct

/// Create the vm.pc_parser error for `fail` with 7691 and the supplied diagnostic text.
/// @param message Message used in `("PC parser: " + message)` and `error(7691, ("PC parser: " + message))`.
function fail(message) return error(7691,"PC parser: "+message) end function
/// Create `mq3.vm.pc_parser.Registry` with context=context; loadFn=loadFn; sources=array(MAX_SOURCEFILES, 0); defines=[].
/// @param context Initial `context` field stored in the returned or constructed `mq3.vm.pc_parser.Registry` record.
/// @param loadFn Initial `loadFn` field stored in the returned or constructed `mq3.vm.pc_parser.Registry` record.
function create(context,loadFn) return Registry(context,loadFn,array(MAX_SOURCEFILES,0),[]) end function
/// Compute at in vm.pc_parser; the normal completion returns `source.data[index]`.
/// @param source Record exposing `data`.
/// @param index Zero-based index into `source.data`.
function at(source,index) if index<0 or index>=len(source.data) then return 0 end if;return source.data[index] end function
/// Compute vm.pc_parser.isNameStart as `(((value == 95) or ((value >= 65) and (value <= 90))) or ((value >= 97) and (value <= 122)))`.
/// @param value Value used in `(value == 95)` and `(value >= 65)`.
function isNameStart(value) return value==95 or value>=65 and value<=90 or value>=97 and value<=122 end function
/// Compute vm.pc_parser.isName as `(isNameStart(value) or ((value >= 48) and (value <= 57)))`.
/// @param value Value passed as `value` to `mq3.vm.pc_parser.isNameStart`.
function isName(value) return isNameStart(value) or value>=48 and value<=57 end function
/// Compute vm.pc_parser.isDigit as `((value >= 48) and (value <= 57))`.
/// @param value Value used in `(value >= 48)` and `(value <= 57)`.
function isDigit(value) return value>=48 and value<=57 end function
/// List the 52 names in vm.pc_parser.punctuationStrings, beginning with `>>=`, `<<=`, `...`, `##`.
function punctuationStrings() return [">>=","<<=","...","##","&&","||",">=","<=","==","!=","*=","/=","%=","+=","-=","++","--","&=","|=","^=",">>","<<","->","::",".*","*","/","%","+","-","=","&","|","^","~","!",">","<",".",",",";",":","?","(",")","{","}","[","]","\\","#","$"] end function
/// Compute vm.pc_parser.punctuationNumber as `(index + 1)`.
/// @param index Index used in `(index + 1)`.
function punctuationNumber(index) return index+1 end function
/// Update `source.line`, `source.offset` in vm.pc_parser.
/// @param source Record exposing `offset`, `line`. Updated in place: `line`, `offset`.
function skip(source)
  while true
    value=at(source,source.offset)
    while value>0 and value<=32 if value==10 then source.line=source.line+1 end if;source.offset=source.offset+1;value=at(source,source.offset) end while
    if value==47 and at(source,source.offset+1)==47 then while at(source,source.offset)!=0 and at(source,source.offset)!=10 source.offset=source.offset+1 end while
    else if value==47 and at(source,source.offset+1)==42 then
      source.offset=source.offset+2;while at(source,source.offset)!=0 and not (at(source,source.offset)==42 and at(source,source.offset+1)==47) if at(source,source.offset)==10 then source.line=source.line+1 end if;source.offset=source.offset+1 end while;if at(source,source.offset)!=0 then source.offset=source.offset+2 end if
    else return value end if
  end while
end function
/// Compute escaped in vm.pc_parser; the normal completion returns `value`.
/// @param value Value used in `(value == 110)` and `(value == 114)`.
function escaped(value) if value==110 then return 10 else if value==114 then return 13 else if value==116 then return 9 end if;return value end function
/// Read string in vm.pc_parser; the normal completion returns `Token(type, subtype, 0, 0.0, decode(slice(result, 0, count)), started, leadingSpace)`.
///
/// Direct state writes: `source.offset`.
/// @param source Record exposing `line`, `offset`. Updated in place: `offset`.
/// @param quote Quote used in `(quote == 39)` and `(at(source, source.offset) != quote)`.
/// @param leadingSpace Initial `leadingSpace` field stored in the returned or constructed `mq3.vm.pc_parser.Token` record.
function readString(source,quote,leadingSpace)
  started=source.line;source.offset=source.offset+1;result=bytes(MAX_TOKENLENGTH,0);count=0
  while at(source,source.offset)!=0 and at(source,source.offset)!=quote and at(source,source.offset)!=10
    value=at(source,source.offset);source.offset=source.offset+1
    if value==92 and at(source,source.offset)!=0 then value=escaped(at(source,source.offset));source.offset=source.offset+1 end if
    if count>=MAX_TOKENLENGTH-1 then return fail("string token too long") end if;result[count]=value;count=count+1
  end while
  if at(source,source.offset)!=quote then return fail("unterminated string") end if;source.offset=source.offset+1
  type=TT_STRING;if quote==39 then type=TT_LITERAL end if;subtype=count+2;if type==TT_LITERAL and count>0 then subtype=result[0] end if
  return Token(type,subtype,0,0.0,decode(slice(result,0,count)),started,leadingSpace)
end function
/// Decode a validated ASCII decimal or hexadecimal digit into its numeric value.
/// @param value ASCII code for 0..9, A..F, or a..f; the lexer validates the character before calling.
function digitValue(value) if value>=48 and value<=57 then return value-48 else if value>=65 and value<=70 then return value-55 else return value-87 end if end function
/// Compute integer value in vm.pc_parser; the normal completion returns `value`.
/// @param text Text used in `bytes(text)`.
/// @param base Base used in `(value * base)` and `((value * base) + digitValue(data[index]))`.
/// @param start Start operand used by `integerValue`; its reads are shown in the implementation.
function integerValue(text,base,start)
  data=bytes(text);value=0;for index=start to len(data)-1 value=value*base+digitValue(data[index]) end for;return value
end function
/// Read number in vm.pc_parser; the normal completion returns `Token(TT_NUMBER, subtype, intValue, floatValue, text, started, leadingSpace)`.
///
/// Direct state writes: `source.offset`.
/// @param source Record exposing `line`, `offset`, `data`. Updated in place: `offset`.
/// @param leadingSpace Initial `leadingSpace` field stored in the returned or constructed `mq3.vm.pc_parser.Token` record.
function readNumber(source,leadingSpace)
  started=source.line;begin=source.offset;subtype=0;base=10;dot=false
  if at(source,begin)==48 and (at(source,begin+1)==120 or at(source,begin+1)==88) then
    source.offset=source.offset+2;base=16;subtype=TT_HEX
    while isDigit(at(source,source.offset)) or at(source,source.offset)>=65 and at(source,source.offset)<=70 or at(source,source.offset)>=97 and at(source,source.offset)<=102 source.offset=source.offset+1 end while
  else
    if at(source,begin)==48 then base=8 end if
    while isDigit(at(source,source.offset)) or at(source,source.offset)==46 if at(source,source.offset)==46 then dot=true end if;if at(source,source.offset)==56 or at(source,source.offset)==57 then base=10 end if;source.offset=source.offset+1 end while
    if dot then subtype=TT_DECIMAL|TT_FLOAT;base=10 else if base==8 then subtype=TT_OCTAL|TT_INTEGER else subtype=TT_DECIMAL|TT_INTEGER end if
  end if
  if (subtype&TT_FLOAT)==0 then subtype=subtype|TT_INTEGER end if
  text=decode(slice(source.data,begin,source.offset-begin));intValue=0;floatValue=0.0
  if base==16 then intValue=integerValue(text,16,2);floatValue=intValue else if base==8 and len(bytes(text))>1 then intValue=integerValue(text,8,1);floatValue=intValue else floatValue=toNumber(text);intValue=n.trunc32(floatValue) end if
  return Token(TT_NUMBER,subtype,intValue,floatValue,text,started,leadingSpace)
end function
/// Update `source.offset` in vm.pc_parser; the normal completion returns `fail(((("unrecognized token at " + source.name) + ":") + str(source.line)))`.
///
/// Direct state writes: `source.offset`.
/// @param source Record exposing `offset`, `line`, `data`, `name`. Updated in place: `offset`.
function raw(source)
  before=source.offset;value=skip(source);if value==0 then return void end if;started=source.line;leadingSpace=source.offset!=before
  if value==34 or value==39 then return readString(source,value,leadingSpace) end if
  if isDigit(value) or value==46 and isDigit(at(source,source.offset+1)) then return readNumber(source,leadingSpace) end if
  if isNameStart(value) then begin=source.offset;while isName(at(source,source.offset)) source.offset=source.offset+1 end while;text=decode(slice(source.data,begin,source.offset-begin));return Token(TT_NAME,len(bytes(text)),0,0.0,text,started,leadingSpace) end if
  values=punctuationStrings();for index=0 to len(values)-1 candidate=bytes(values[index]);matches=true;for cursor=0 to len(candidate)-1 if at(source,source.offset+cursor)!=candidate[cursor] then matches=false;break end if end for;if matches then source.offset=source.offset+len(candidate);return Token(TT_PUNCTUATION,punctuationNumber(index),0,0.0,values[index],started,leadingSpace) end if end for
  return fail("unrecognized token at "+source.name+":"+str(source.line))
end function
/// Compute define index in vm.pc_parser; the normal completion returns `- 1`.
/// @param registry Record exposing `defines`.
/// @param name Name used in `(registry.defines[index].name == name)`.
function defineIndex(registry,name) if len(registry.defines)==0 then return -1 end if;for index=0 to len(registry.defines)-1 if registry.defines[index].name==name then return index end if end for;return -1 end function
/// Compute vm.pc_parser.isBuiltin as `((((name == "__LINE__") or (name == "__FILE__")) or (name == "__DATE__")) or (name == "__TIME__"))`.
/// @param name Name used in `(name == "__LINE__")` and `(name == "__FILE__")`.
function isBuiltin(name) return name=="__LINE__" or name=="__FILE__" or name=="__DATE__" or name=="__TIME__" end function
/// Compute vm.pc_parser.definedName as `(isBuiltin(name) or (defineIndex(registry, name) >= 0))`.
/// @param registry Registry passed as `registry` to `mq3.vm.pc_parser.defineIndex`.
/// @param name Name passed as `name` to `mq3.vm.pc_parser.isBuiltin`.
function definedName(registry,name) return isBuiltin(name) or defineIndex(registry,name)>=0 end function
/// Compute two digits in vm.pc_parser; the normal completion returns `str(value)`.
/// @param value Value used in `str(value)` and `(value < 10)`.
function twoDigits(value) if value<10 then return "0"+str(value) end if;return str(value) end function
/// Compute vm.pc_parser.monthName as `["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"][(value - 1)]`.
/// @param value Value used in `(value - 1)` and `["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"][(value - 1)]`.
function monthName(value) return ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"][value-1] end function
/// Compute builtin token in vm.pc_parser; the normal completion returns `Token(TT_NAME, len(bytes(text)), 0, 0.0, text, token.line, token.leadingSpace)`.
/// @param entry Entry used in `entry[1]` and `len(entry[1])`.
/// @param token Record exposing `text`, `line`, `leadingSpace`.
function builtinToken(entry,token)
  text=""
  if token.text=="__LINE__" then text=str(token.line);return Token(TT_NUMBER,TT_DECIMAL|TT_INTEGER,token.line,n.f32(token.line),text,token.line,token.leadingSpace) end if
  source=entry[1][len(entry[1])-1]
  if token.text=="__FILE__" then return Token(TT_NAME,len(bytes(source.name)),0,0.0,source.name,token.line,token.leadingSpace) end if
  local=time.datetime.nowLocal();if local==void or not time.datetime.isValid(local) then return fail("wall clock unavailable for "+token.text) end if
  if token.text=="__DATE__" then
    // l_precomp.c copies ctime's seven-byte month/day field and four-byte year,
    // preserving the leading blank before one-digit days and the quote bytes.
    day=str(local.date.day);if local.date.day<10 then day=" "+day end if
    text="\""+monthName(local.date.month)+" "+day+" "+str(local.date.year)+"\""
  else text="\""+twoDigits(local.time.hour)+":"+twoDigits(local.time.minute)+":"+twoDigits(local.time.second)+"\"" end if
  return Token(TT_NAME,len(bytes(text)),0,0.0,text,token.line,token.leadingSpace)
end function
/// Compute token list append in vm.pc_parser; the normal completion returns `(list + [token])`.
/// @param list List used in `(list == 0)` and `(list == void)`.
/// @param token Token used in `(list + [token])`.
function tokenListAppend(list,token) if list==0 or list==void then return [token] end if;return list+[token] end function
/// Compute parameter index in vm.pc_parser; the normal completion returns `- 1`.
/// @param definition Record exposing `parameters`.
/// @param name Name used in `(definition.parameters[index] == name)`.
function parameterIndex(definition,name)
  if definition.parameters==0 then return -1 end if;for index=0 to len(definition.parameters)-1 if definition.parameters[index]==name then return index end if end for;return -1
end function
/// Compute definition in vm.pc_parser; the normal completion returns `Define(name, parameters, body, functionLike)`.
/// @param values Values used in `values[0]` and `values[1]`.
function definition(values)
  if values==void or len(values)==0 or values[0].type!=TT_NAME then return fail("invalid #define") end if
  name=values[0].text;parameters=0;functionLike=false;bodyStart=1
  if len(values)>1 and values[1].text=="(" and not values[1].leadingSpace then
    functionLike=true;parametersList=[];cursor=2
    if cursor<len(values) and values[cursor].text==")" then bodyStart=cursor+1
    else
      while cursor<len(values)
        parameter=values[cursor];if parameter.type!=TT_NAME then return fail("invalid define parameter") end if
        if parametersList!=void then for each existing in parametersList if existing==parameter.text then return fail("duplicate define parameter "+parameter.text) end if end for end if
        parametersList=parametersList+[parameter.text];cursor=cursor+1
        if cursor>=len(values) then return fail("unterminated define parameters") end if
        if values[cursor].text==")" then bodyStart=cursor+1;break end if
        if values[cursor].text!="," then return fail("invalid define parameter separator") end if;cursor=cursor+1
      end while
      if bodyStart==1 then return fail("unterminated define parameters") end if
    end if
    if parametersList!=void and len(parametersList)>0 then parameters=parametersList end if
  end if
  body=0
  if bodyStart<len(values) then
    collected=[];for cursor=bodyStart to len(values)-1 if not (values[cursor].type==TT_NAME and values[cursor].text==name) then collected=collected+[values[cursor]] end if end for
    if collected!=void and len(collected)>0 then body=collected end if
  end if
  if body!=0 and (body[0].text=="##" or body[len(body)-1].text=="##") then return fail("misplaced ## in define "+name) end if
  return Define(name,parameters,body,functionLike)
end function
/// Compute parameter count in vm.pc_parser; the normal completion returns `len(value.parameters)`.
/// @param value Record exposing `parameters`.
function parameterCount(value) if value.parameters==0 then return 0 end if;return len(value.parameters) end function
/// Parse arguments in vm.pc_parser; the normal completion returns `ArgumentResult(false, index, 0)`.
/// @param tokens Tokens used in `len(tokens)` and `tokens[index]`.
/// @param openIndex Initial `next` field stored in the returned or constructed `mq3.vm.pc_parser.ArgumentResult` record.
/// @param expected Expected used in `(expected > 0)` and `(expected == 0)`.
function parseArguments(tokens,openIndex,expected)
  if tokens==void or openIndex>=len(tokens) or tokens[openIndex].text!="(" then return ArgumentResult(false,openIndex,0) end if
  arguments=[];current=0;depth=0;index=openIndex+1
  if index<len(tokens) and tokens[index].text==")" then
    if expected>0 then arguments=[0];while len(arguments)<expected arguments=arguments+[0] end while end if
    return ArgumentResult(expected==0 or expected>=1,index+1,arguments)
  end if
  while index<len(tokens)
    token=tokens[index]
    if token.text=="(" then depth=depth+1;current=tokenListAppend(current,token)
    else if token.text==")" then
      if depth==0 then arguments=arguments+[current];if len(arguments)>expected then return ArgumentResult(false,index+1,0) end if;while len(arguments)<expected arguments=arguments+[0] end while;return ArgumentResult(true,index+1,arguments) end if
      depth=depth-1;current=tokenListAppend(current,token)
    else if token.text=="," and depth==0 then arguments=arguments+[current];current=0;if len(arguments)>=expected then return ArgumentResult(false,index+1,0) end if
    else current=tokenListAppend(current,token) end if
    index=index+1
  end while
  return ArgumentResult(false,index,0)
end function
/// Compute stringized in vm.pc_parser; the normal completion returns `Token(TT_STRING, (len(bytes(text)) + 2), 0, 0.0, text, line, false)`.
/// @param argument Argument used in `(argument != 0)`.
/// @param line Initial `line` field stored in the returned or constructed `mq3.vm.pc_parser.Token` record.
function stringized(argument,line)
  text=""
  if argument!=0 then for each token in argument if token.type==TT_STRING then text=text+"\""+token.text+"\"" else if token.type==TT_LITERAL then text=text+"'"+token.text+"'" else text=text+token.text end if end for end if
  return Token(TT_STRING,len(bytes(text))+2,0,0.0,text,line,false)
end function
/// Compute merged token in vm.pc_parser; the normal completion returns `fail(((("can't merge " + left.text) + " with ") + right.text))`.
/// @param left Record exposing `type`, `text`, `line`, `leadingSpace`.
/// @param right Record exposing `type`, `text`.
function mergedToken(left,right)
  if left.type==TT_NAME and (right.type==TT_NAME or right.type==TT_NUMBER) then text=left.text+right.text;return Token(TT_NAME,len(bytes(text)),0,0.0,text,left.line,left.leadingSpace) end if
  if left.type==TT_STRING and right.type==TT_STRING then text=left.text+right.text;return Token(TT_STRING,len(bytes(text))+2,0,0.0,text,left.line,left.leadingSpace) end if
  return fail("can't merge "+left.text+" with "+right.text)
end function
/// Compute substitute macro in vm.pc_parser; the normal completion returns `merged`.
/// @param value Record exposing `tokens`.
/// @param arguments Arguments used in `arguments[parameter]` and `stringized(arguments[parameter], line)`.
/// @param line Line passed as `line` to `mq3.vm.pc_parser.stringized`.
function substituteMacro(value,arguments,line)
  expanded=[];index=0
  if value.tokens!=0 then
    while index<len(value.tokens)
      token=value.tokens[index]
      if token.text=="#" and index+1<len(value.tokens) then
        parameter=parameterIndex(value,value.tokens[index+1].text)
        if parameter>=0 then expanded=expanded+[stringized(arguments[parameter],line)];index=index+2;continue end if
        index=index+1;continue
      end if
      parameter=-1;if token.type==TT_NAME then parameter=parameterIndex(value,token.text) end if
      if parameter>=0 then argument=arguments[parameter];if argument!=0 then expanded=expanded+argument end if
      else expanded=expanded+[token] end if
      index=index+1
    end while
  end if
  if expanded==void or len(expanded)==0 then return 0 end if
  merged=[];index=0
  while index<len(expanded)
    token=expanded[index]
    if token.text=="##" then
      if merged==void or len(merged)==0 or index+1>=len(expanded) then return fail("misplaced ## during expansion") end if
      joined=mergedToken(merged[len(merged)-1],expanded[index+1]);if joined is error then return joined end if;merged[len(merged)-1]=joined;index=index+2
    else merged=merged+[token];index=index+1 end if
  end while
  return merged
end function
/// Compute source macro expansion in vm.pc_parser; the normal completion returns `MacroExpansion(true, true, tokens)`.
/// @param entry Entry passed as `entry` to `mq3.vm.pc_parser.take`.
/// @param value Record exposing `functionLike`, `tokens`, `name`.
/// @param line Line passed as `line` to `mq3.vm.pc_parser.substituteMacro`.
function sourceMacroExpansion(entry,value,line)
  if not value.functionLike then return MacroExpansion(true,true,value.tokens) end if
  first=take(entry);if first==void then return MacroExpansion(true,false,0) end if;if first is error then return first end if
  if first.text!="(" then unread(entry,first);return MacroExpansion(true,false,0) end if
  invocation=[first];depth=0
  while true
    token=take(entry);if token==void or token is error then return fail("unterminated invocation of "+value.name) end if;invocation=invocation+[token]
    if token.text=="(" then depth=depth+1 else if token.text==")" then if depth==0 then break end if;depth=depth-1 end if
  end while
  parsed=parseArguments(invocation,0,parameterCount(value));if not parsed.valid then return fail("argument count mismatch for "+value.name) end if
  tokens=substituteMacro(value,parsed.arguments,line);if tokens is error then return tokens end if;return MacroExpansion(true,true,tokens)
end function
/// Add define in vm.pc_parser; the normal completion returns `1`.
///
/// Direct state writes: `registry.defines`.
/// @param registry Record exposing `defines`. Updated in place: `defines`.
/// @param text Text used in `bytes(text)` and `Source("<global define>", bytes(text), 0, 1, 0)`.
function addDefine(registry,text)
  source=Source("<global define>",bytes(text),0,1,0);values=[];while true token=raw(source);if token==void then break end if;if token is error then return 0 end if;values=values+[token] end while
  value=try(definition(values));if value is error or isBuiltin(value.name) then return 0 end if;index=defineIndex(registry,value.name);if index<0 then registry.defines=registry.defines+[value] else registry.defines[index]=value end if;return 1
end function
/// Clear defines in vm.pc_parser; updates `registry.defines`.
///
/// Direct state writes: `registry.defines`.
/// @param registry Updated in place: `defines`.
function clearDefines(registry) if registry!=void then registry.defines=[] end if;return void end function
/// Load pc parser in vm.pc_parser; the normal completion returns `slot`.
/// @param registry Record exposing `loadFn`, `sources`, `context`.
/// @param name Initial `name` field stored in the returned or constructed `mq3.vm.pc_parser.Source` record.
function load(registry,name)
  if registry==void or registry.loadFn==void or name=="" then return 0 end if
  slot=1;while slot<MAX_SOURCEFILES and registry.sources[slot]!=0 slot=slot+1 end while;if slot>=MAX_SOURCEFILES then return 0 end if
  data=try(registry.loadFn(registry.context,name));if data is error or data==void then return 0 end if;if typeof(data)=="string" then data=bytes(data) end if
  inputs=[];inputs=inputs+[Source(name,data,0,1,0)];registry.sources[slot]=[name,inputs,0,0];return slot
end function
/// Compute free in vm.pc_parser; the normal completion returns `1`.
/// @param registry Record exposing `sources`.
/// @param handle Zero-based index into `registry.sources`.
function free(registry,handle) if handle<1 or handle>=MAX_SOURCEFILES or registry.sources[handle]==0 then return 0 end if;registry.sources[handle]=0;return 1 end function
/// Update `entry entries` in vm.pc_parser; the normal completion returns `true`.
///
/// Direct state writes: `entry elements`.
/// @param registry Record exposing `loadFn`, `context`.
/// @param entry Mutable sequence written at `1`.
/// @param name Initial `name` field stored in the returned or constructed `mq3.vm.pc_parser.Source` record.
function pushInclude(registry,entry,name)
  data=try(registry.loadFn(registry.context,name));if data is error or data==void then return false end if;if typeof(data)=="string" then data=bytes(data) end if
  entry[1]=entry[1]+[Source(name,data,0,1,0)];return true
end function
/// Update `source.pending` in vm.pc_parser; the normal completion returns `token`.
///
/// Direct state writes: `source.pending`.
/// @param source Record exposing `pending`. Updated in place: `pending`.
function sourceTake(source)
  if source.pending==0 then return raw(source) end if
  token=source.pending[0]
  if len(source.pending)==1 then source.pending=0
  else remaining=array(len(source.pending)-1,0);for index=1 to len(source.pending)-1 remaining[index-1]=source.pending[index] end for;source.pending=remaining end if
  return token
end function
/// Update `entry entries` in vm.pc_parser.
///
/// Direct state writes: `entry elements`.
/// @param entry Mutable sequence written at `1`.
function pcNextRaw(entry)
  inputs=entry[1]
  while len(inputs)>0
    last=len(inputs)-1
    source=inputs[last]
    token=sourceTake(source)
    if token!=void then return token end if
    if last==0 then return void end if
    remaining=array(last,void)
    for index=0 to last-1 remaining[index]=inputs[index] end for
    inputs=remaining
    entry[1]=inputs
  end while
  return void
end function

/// Compute unread in vm.pc_parser.
/// @param entry Entry used in `entry[1]` and `len(entry[1])`.
/// @param token Token used in `(token == void)` and `([token] + source.pending)`.
function unread(entry,token)
  if token==void then return void end if
  source=entry[1][len(entry[1])-1];if source.pending==0 then source.pending=[token] else source.pending=[token]+source.pending end if
  return void
end function
/// Queue front in vm.pc_parser.
/// @param entry Entry used in `entry[1]` and `len(entry[1])`.
/// @param tokens Tokens used in `(tokens + source.pending)`.
function queueFront(entry,tokens)
  source=entry[1][len(entry[1])-1];if source.pending==0 then source.pending=tokens else source.pending=tokens+source.pending end if;return void
end function
/// Return `mq3.vm.pc_parser.pcNextRaw(entry)` from `vm.pc_parser.take`.
/// @param entry Entry passed as `entry` to `mq3.vm.pc_parser.pcNextRaw`.
function take(entry)
  return pcNextRaw(entry)
end function
/// Apply `mq3.vm.pc_parser.pcNextRaw`, `mq3.vm.pc_parser.unread` for line tokens in vm.pc_parser.
/// @param entry Entry passed as `entry` to `mq3.vm.pc_parser.pcNextRaw`.
/// @param line Line used in `(token.line != activeLine)`.
function lineTokens(entry,line)
  tokens=[]
  activeLine=line;continued=false
  while true
    token=pcNextRaw(entry);if token==void or token is error then return tokens end if
    if token.line!=activeLine then
      if not continued then unread(entry,token);return tokens end if
      activeLine=token.line;continued=false
    end if
    // PC_ReadLine discards every backslash and permits the next token to cross
    // one physical line. A second backslash can continue another line.
    if token.text=="\\" then continued=true;continue end if
    continued=false
    tokens=tokens+[token]
  end while
end function
/// Compute conditional active in vm.pc_parser; the normal completion returns `entry[3][(len(entry[3]) - 1)].active`.
/// @param entry Entry used in `entry[3]` and `len(entry[3])`.
function conditionalActive(entry)
  if entry[3]==0 then return true end if
  return entry[3][len(entry[3])-1].active
end function
/// Update `entry entries` in vm.pc_parser.
///
/// Direct state writes: `entry elements`.
/// @param entry Mutable sequence written at `3`.
/// @param parent Initial `parentActive` field stored in the returned or constructed `mq3.vm.pc_parser.Conditional` record.
/// @param selected Initial `branchTaken` field stored in the returned or constructed `mq3.vm.pc_parser.Conditional` record.
function pushConditional(entry,parent,selected)
  frame=Conditional(parent,selected,selected,false)
  if entry[3]==0 then entry[3]=[frame] else entry[3]=entry[3]+[frame] end if
  return void
end function
/// Update `entry entries` in vm.pc_parser; the normal completion returns `true`.
///
/// Direct state writes: `entry elements`.
/// @param entry Mutable sequence written at `3`.
function popConditional(entry)
  if entry[3]==0 then return false end if
  count=len(entry[3]);if count==1 then entry[3]=0 else remaining=array(count-1,0);for index=0 to count-2 remaining[index]=entry[3][index] end for;entry[3]=remaining end if;return true
end function

/// Compute expand expression in vm.pc_parser; the normal completion returns `result`.
/// @param registry Record exposing `defines`.
/// @param tokens Tokens passed as `tokens` to `mq3.vm.pc_parser.parseArguments`.
/// @param depth Depth used in `(depth + 1)` and `(depth > 32)`.
function expandExpression(registry,tokens,depth)
  if tokens==void or depth>32 then return void end if
  result=[];index=0
  while index<len(tokens)
    token=tokens[index]
    if token.type==TT_NAME and token.text=="defined" then
      result=result+[token];index=index+1
      if index<len(tokens) and tokens[index].text=="(" then
        result=result+[tokens[index]];index=index+1;if index<len(tokens) then result=result+[tokens[index]];index=index+1 end if;if index<len(tokens) and tokens[index].text==")" then result=result+[tokens[index]];index=index+1 end if
      else if index<len(tokens) then result=result+[tokens[index]];index=index+1 end if
    else if token.type==TT_NAME then
      if token.text=="__LINE__" then result=result+[Token(TT_NUMBER,TT_DECIMAL|TT_INTEGER,token.line,n.f32(token.line),str(token.line),token.line,token.leadingSpace)];index=index+1;continue end if
      found=defineIndex(registry,token.text)
      if found>=0 then
        value=registry.defines[found]
        if value.functionLike then
          if index+1<len(tokens) and tokens[index+1].text=="(" then
            parsed=parseArguments(tokens,index+1,parameterCount(value));if not parsed.valid then return void end if;replacement=substituteMacro(value,parsed.arguments,token.line);if replacement is error then return void end if;if replacement!=0 then replacement=expandExpression(registry,replacement,depth+1);if replacement!=void then result=result+replacement end if end if;index=parsed.next
          else result=result+[token];index=index+1 end if
        else replacement=0;if value.tokens!=0 then replacement=expandExpression(registry,value.tokens,depth+1) end if;if replacement!=0 and replacement!=void then result=result+replacement end if;index=index+1 end if
      else result=result+[token];index=index+1 end if
    else result=result+[token];index=index+1 end if
  end while
  return result
end function
/// Compute expression peek in vm.pc_parser; the normal completion returns `state.tokens[state.position]`.
/// @param state Record exposing `position`, `tokens`.
function expressionPeek(state) if state.position>=len(state.tokens) then return void end if;return state.tokens[state.position] end function
/// Update `state.position` in vm.pc_parser; the normal completion returns `token`.
///
/// Direct state writes: `state.position`.
/// @param state Record exposing `position`. Updated in place: `position`.
function expressionTake(state) token=expressionPeek(state);if token!=void then state.position=state.position+1 end if;return token end function
/// Update `state.position` in vm.pc_parser; the normal completion returns `false`.
///
/// Direct state writes: `state.position`.
/// @param state Record exposing `position`. Updated in place: `position`.
/// @param text Text used in `(token.text == text)` and `((token != void) and (token.text == text))`.
function expressionMatch(state,text) token=expressionPeek(state);if token!=void and token.text==text then state.position=state.position+1;return true end if;return false end function
/// Canonicalize a numeric expression result to the preprocessor boolean values zero and one.
/// @param value Numeric expression result; zero is false and every nonzero value is true.
function booleanValue(value) if value!=0 then return 1 else return 0 end if end function

/// Parse conditional expression in vm.pc_parser; the normal completion returns `condition`.
///
/// Direct state writes: `state.valid`.
/// @param state Updated in place: `valid`.
function parseConditionalExpression(state)
  condition=parseLogicalOr(state)
  if expressionMatch(state,"?") then yes=parseConditionalExpression(state);if not expressionMatch(state,":") then state.valid=false;return 0 end if;no=parseConditionalExpression(state);if condition!=0 then return yes else return no end if end if
  return condition
end function
/// Parse primary in vm.pc_parser; the normal completion returns `0`.
///
/// Direct state writes: `state.valid`.
/// @param state Record exposing `registry`. Updated in place: `valid`.
function parsePrimary(state)
  token=expressionTake(state);if token==void then state.valid=false;return 0 end if
  if token.type==TT_NUMBER then return token.intValue end if
  if token.type==TT_LITERAL then return token.subtype end if
  if token.text=="(" then value=parseConditionalExpression(state);if not expressionMatch(state,")") then state.valid=false end if;return value end if
  if token.type==TT_NAME and token.text=="defined" then
    paren=expressionMatch(state,"(");name=expressionTake(state);if name==void or name.type!=TT_NAME then state.valid=false;return 0 end if;value=0;if definedName(state.registry,name.text) then value=1 end if;if paren and not expressionMatch(state,")") then state.valid=false end if;return value
  end if
  state.valid=false;return 0
end function
/// Parse unary in vm.pc_parser; the normal completion returns `parsePrimary(state)`.
/// @param state State passed as `state` to `mq3.vm.pc_parser.expressionMatch`.
function parseUnary(state)
  if expressionMatch(state,"!") then return booleanValue(parseUnary(state)==0) end if
  if expressionMatch(state,"~") then return n.i32(parseUnary(state)^0xffffffff) end if
  if expressionMatch(state,"+") then return parseUnary(state) end if
  if expressionMatch(state,"-") then return 0-parseUnary(state) end if
  return parsePrimary(state)
end function
/// Parse multiply in vm.pc_parser; updates `state.valid`.
///
/// Direct state writes: `state.valid`.
/// @param state Updated in place: `valid`.
function parseMultiply(state)
  value=parseUnary(state)
  while true
    if expressionMatch(state,"*") then value=n.i32(value*parseUnary(state))
    else if expressionMatch(state,"/") then right=parseUnary(state);if right==0 then state.valid=false;return 0 end if;value=n.trunc32(value/right)
    else if expressionMatch(state,"%") then right=parseUnary(state);if right==0 then state.valid=false;return 0 end if;value=value%right
    else return value end if
  end while
end function
/// Parse add in vm.pc_parser.
/// @param state State passed as `state` to `mq3.vm.pc_parser.parseMultiply`.
function parseAdd(state)
  value=parseMultiply(state);while true if expressionMatch(state,"+") then value=n.i32(value+parseMultiply(state)) else if expressionMatch(state,"-") then value=n.i32(value-parseMultiply(state)) else return value end if end while
end function
/// Parse shift in vm.pc_parser.
/// @param state State passed as `state` to `mq3.vm.pc_parser.parseAdd`.
function parseShift(state)
  value=parseAdd(state);while true if expressionMatch(state,"<<") then value=n.i32(value<<(parseAdd(state)&31)) else if expressionMatch(state,">>") then value=n.i32(value)>>(parseAdd(state)&31) else return value end if end while
end function
/// Parse relational in vm.pc_parser.
/// @param state State passed as `state` to `mq3.vm.pc_parser.parseShift`.
function parseRelational(state)
  value=parseShift(state);while true if expressionMatch(state,"<") then value=booleanValue(value<parseShift(state)) else if expressionMatch(state,">") then value=booleanValue(value>parseShift(state)) else if expressionMatch(state,"<=") then value=booleanValue(value<=parseShift(state)) else if expressionMatch(state,">=") then value=booleanValue(value>=parseShift(state)) else return value end if end while
end function
/// Parse equality in vm.pc_parser.
/// @param state State passed as `state` to `mq3.vm.pc_parser.parseRelational`.
function parseEquality(state)
  value=parseRelational(state);while true if expressionMatch(state,"==") then value=booleanValue(value==parseRelational(state)) else if expressionMatch(state,"!=") then value=booleanValue(value!=parseRelational(state)) else return value end if end while
end function
/// Parse bit and in vm.pc_parser; the normal completion returns `value`.
/// @param state State passed as `state` to `mq3.vm.pc_parser.parseEquality`.
function parseBitAnd(state) value=parseEquality(state);while expressionMatch(state,"&") value=n.i32(value&parseEquality(state)) end while;return value end function
/// Parse bit xor in vm.pc_parser; the normal completion returns `value`.
/// @param state State passed as `state` to `mq3.vm.pc_parser.parseBitAnd`.
function parseBitXor(state) value=parseBitAnd(state);while expressionMatch(state,"^") value=n.i32(value^parseBitAnd(state)) end while;return value end function
/// Parse bit or in vm.pc_parser; the normal completion returns `value`.
/// @param state State passed as `state` to `mq3.vm.pc_parser.parseBitXor`.
function parseBitOr(state) value=parseBitXor(state);while expressionMatch(state,"|") value=n.i32(value|parseBitXor(state)) end while;return value end function
/// Parse logical and in vm.pc_parser; the normal completion returns `value`.
/// @param state State passed as `state` to `mq3.vm.pc_parser.parseBitOr`.
function parseLogicalAnd(state) value=parseBitOr(state);while expressionMatch(state,"&&") right=parseBitOr(state);value=booleanValue(value!=0 and right!=0) end while;return value end function
/// Parse logical or in vm.pc_parser; the normal completion returns `value`.
/// @param state State passed as `state` to `mq3.vm.pc_parser.parseLogicalAnd`.
function parseLogicalOr(state) value=parseLogicalAnd(state);while expressionMatch(state,"||") right=parseLogicalAnd(state);value=booleanValue(value!=0 or right!=0) end while;return value end function
/// Compute evaluate expression in vm.pc_parser; the normal completion returns `[true, n.i32(value)]`.
/// @param registry Registry passed as `registry` to `mq3.vm.pc_parser.expandExpression`.
/// @param tokens Tokens passed as `tokens` to `mq3.vm.pc_parser.expandExpression`.
function evaluateExpression(registry,tokens)
  expanded=expandExpression(registry,tokens,0);if expanded==void or len(expanded)==0 then return [false,0] end if
  state=Expression(registry,expanded,0,true,0);value=parseConditionalExpression(state);if not state.valid or state.position!=len(state.tokens) then return [false,0] end if;return [true,n.i32(value)]
end function

/// Compute conditional directive in vm.pc_parser; the normal completion returns `fail("unknown conditional directive")`.
/// @param registry Registry passed as `registry` to `mq3.vm.pc_parser.evaluateExpression`.
/// @param entry Entry passed as `entry` to `mq3.vm.pc_parser.lineTokens`.
/// @param directive Directive used in `("#" + directive)` and `(directive == "if")`.
/// @param line Line passed as `line` to `mq3.vm.pc_parser.lineTokens`.
function conditionalDirective(registry,entry,directive,line)
  tokens=lineTokens(entry,line);parent=conditionalActive(entry)
  if directive=="if" then result=[true,0];if parent then result=evaluateExpression(registry,tokens) end if;if not result[0] then return fail("invalid #if expression") end if;pushConditional(entry,parent,parent and result[1]!=0);return 1 end if
  if directive=="ifdef" or directive=="ifndef" then
    valid=tokens!=void and len(tokens)==1 and tokens[0].type==TT_NAME;if not valid then return fail("invalid #"+directive) end if
    selected=definedName(registry,tokens[0].text);if directive=="ifndef" then selected=not selected end if;pushConditional(entry,parent,parent and selected);return 1
  end if
  if entry[3]==0 then return fail("#"+directive+" without #if at line "+str(line)) end if
  frame=entry[3][len(entry[3])-1]
  if directive=="elif" then
    if frame.elseSeen then return fail("#elif after #else") end if
    selected=false;if frame.parentActive and not frame.branchTaken then result=evaluateExpression(registry,tokens);if not result[0] then return fail("invalid #elif expression") end if;selected=result[1]!=0 end if
    frame.active=selected;if selected then frame.branchTaken=true end if;return 1
  end if
  if directive=="else" then if tokens!=void and len(tokens)>0 then return fail("tokens after #else") end if;if frame.elseSeen then return fail("duplicate #else") end if;frame.elseSeen=true;frame.active=frame.parentActive and not frame.branchTaken;if frame.active then frame.branchTaken=true end if;return 1 end if
  if directive=="endif" then if tokens!=void and len(tokens)>0 then return fail("tokens after #endif") end if;popConditional(entry);return 1 end if
  return fail("unknown conditional directive")
end function
/// Read pc parser in vm.pc_parser; updates `registry.defines`.
///
/// Direct state writes: `registry.defines`.
/// @param registry Record exposing `sources`, `defines`. Updated in place: `defines`.
/// @param sourceHandle Zero-based index into `registry.sources`.
function read(registry,sourceHandle)
  if sourceHandle<1 or sourceHandle>=MAX_SOURCEFILES or registry.sources[sourceHandle]==0 then return void end if;entry=registry.sources[sourceHandle]
  expansions=0
  while true
    token=take(entry)
    if token==void then if entry[3]!=0 then return fail("missing #endif") end if;return void end if
    if token is error then return token end if
    if token.type==TT_PUNCTUATION and token.subtype==P_PRECOMP then
      directive=pcNextRaw(entry);if directive==void or directive is error then return fail("invalid preprocessor directive at line "+str(token.line)) end if;if directive.line!=token.line or directive.type!=TT_NAME then return fail("invalid preprocessor directive "+directive.text+" at line "+str(token.line)) end if
      name=directive.text
      if name=="if" or name=="ifdef" or name=="ifndef" or name=="elif" or name=="else" or name=="endif" then result=conditionalDirective(registry,entry,name,directive.line);if result is error then return result end if
      else if not conditionalActive(entry) then lineTokens(entry,directive.line)
    else if name=="include" then
      values=lineTokens(entry,directive.line);includeName=""
      if values!=void and len(values)==1 and values[0].type==TT_STRING then includeName=values[0].text
      else if values!=void and len(values)>=3 and values[0].text=="<" and values[len(values)-1].text==">" then for index=1 to len(values)-2 includeName=includeName+values[index].text end for end if
      if includeName=="" or not pushInclude(registry,entry,includeName) then return fail("invalid #include") end if
      else if name=="define" then
        values=lineTokens(entry,directive.line);if values==void or values[0].type!=TT_NAME then return fail("invalid #define") end if
        parsed=definition(values);if parsed is error then return parsed end if;if isBuiltin(parsed.name) then return fail("can't redefine "+parsed.name) end if;index=defineIndex(registry,parsed.name);if index<0 then registry.defines=registry.defines+[parsed] else registry.defines[index]=parsed end if
      else if name=="undef" then
        values=lineTokens(entry,directive.line);if values==void or len(values)!=1 or values[0].type!=TT_NAME then return fail("invalid #undef") end if;if not isBuiltin(values[0].text) then index=defineIndex(registry,values[0].text);if index>=0 then registry.defines[index]=Define("",0,0,false) end if end if
      else return fail("unknown #"+name) end if
      continue
    end if
    if not conditionalActive(entry) then continue end if
    if token.type==TT_NAME then
      if isBuiltin(token.text) then return builtinToken(entry,token) end if
      index=defineIndex(registry,token.text)
      if index>=0 then
        expansion=sourceMacroExpansion(entry,registry.defines[index],token.line);if expansion is error then return expansion end if;if not expansion.valid then return fail("invalid invocation of "+token.text) end if;if not expansion.invoked then return token end if
        expansions=expansions+1;if expansions>64 then return fail("recursive macro expansion") end if
        if expansion.tokens!=0 then queueFront(entry,expansion.tokens) end if;continue
      end if
    end if
    return token
  end while
end function
/// Compute location in vm.pc_parser; the normal completion returns `[entry[0], source.line]`.
/// @param registry Record exposing `sources`.
/// @param handle Zero-based index into `registry.sources`.
function location(registry,handle)
  if handle<1 or handle>=MAX_SOURCEFILES or registry.sources[handle]==0 then return void end if;entry=registry.sources[handle];if len(entry[1])==0 then return [entry[0],0] end if;source=entry[1][len(entry[1])-1];return [entry[0],source.line]
end function
/// Encode pc parser in vm.pc_parser; the normal completion returns `data`.
/// @param token Record exposing `type`, `subtype`, `intValue`, `floatValue`, `text`.
function encode(token)
  if token==void then return fail("token is required") end if;data=bytes(TOKEN_SIZE,0);n.writeU32(data,0,token.type);n.writeU32(data,4,token.subtype);n.writeU32(data,8,token.intValue);n.writeU32(data,12,n.floatBits(token.floatValue));encoded=bytes(token.text);count=len(encoded);if count>=MAX_TOKENLENGTH then count=MAX_TOKENLENGTH-1 end if;if count>0 then copyBytes(data,16,encoded,0,count) end if;return data
end function
