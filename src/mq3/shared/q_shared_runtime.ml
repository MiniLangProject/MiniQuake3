// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native facade for code/game/q_shared.c.
package mq3.shared.q_shared_runtime

import mq3.compat.numeric as n
import mq3.compat.textnumbers as numbers
import mq3.shared.info as info
import mq3.shared.parser as parser
import std.string as strings

const MAX_TOKEN_CHARS=1024
const MAX_INFO_STRING=1024
const BIG_INFO_STRING=8192
/// ParseSession record for shared.q_shared_runtime, containing `name`, `state`, `diagnostics`.
struct ParseSession name state diagnostics end struct
/// InfoPair record for shared.q_shared_runtime, containing `head`, `key`, `value`.
struct InfoPair head key value end struct

/// Clamp q shared runtime in shared.q_shared_runtime; the normal completion returns `value`.
/// @param minimum Minimum used in `(value < minimum)`.
/// @param maximum Maximum used in `(value > maximum)`.
/// @param value Value used in `(value < minimum)` and `(value > maximum)`.
function com_Clamp(minimum,maximum,value) if value<minimum then return minimum end if;if value>maximum then return maximum end if;return value end function
/// Compute skip path in shared.q_shared_runtime; the normal completion returns `decode(slice(data, start, (len(data) - start)))`.
/// @param path Path used in `bytes(path)`.
function com_SkipPath(path) data=bytes(path);start=0;for index=0 to len(data)-1 if data[index]==47 then start=index+1 end if end for;return decode(slice(data,start,len(data)-start)) end function
/// Compute strip extension in shared.q_shared_runtime; the normal completion returns `decode(slice(data, 0, count))`.
/// @param path Path used in `bytes(path)`.
function com_StripExtension(path) data=bytes(path);count=0;while count<len(data) and data[count]!=46 count=count+1 end while;return decode(slice(data,0,count)) end function
/// Compute default extension in shared.q_shared_runtime; the normal completion returns `com_sprintf(maxSize, "%s%s", [path, extension])`.
/// @param path Text passed as `text` to `mq3.shared.q_shared_runtime.q_strncpyz`.
/// @param maxSize Size passed as `size` to `mq3.shared.q_shared_runtime.q_strncpyz`.
/// @param extension Extension used in `com_sprintf(maxSize, "%s%s", [path, extension])`.
function com_DefaultExtension(path,maxSize,extension)
  data=bytes(path);index=len(data)-1;while index>0 and data[index]!=47 if data[index]==46 then return q_strncpyz(path,maxSize) end if;index=index-1 end while;return com_sprintf(maxSize,"%s%s",[path,extension])
end function

/// Compute short swap in shared.q_shared_runtime; the normal completion returns `n.i16((((value & 255) << 8) | ((value >> 8) & 255)))`.
/// @param value Value used in `(value >> 8)` and `(value & 255)`.
function shortSwap(value) value=value&0xffff;return n.i16(((value&255)<<8)|((value>>8)&255)) end function
/// Return `mq3.compat.numeric.i16(value)` from `shared.q_shared_runtime.shortNoSwap`.
/// @param value Integer whose low 16 bits are retained.
function shortNoSwap(value) return n.i16(value) end function
/// Compute long swap in shared.q_shared_runtime; the normal completion returns `n.i32((((((value & 255) << 24) | ((value & 65280) << 8)) | ((value >> 8) & 65280)) | ((value >> 24) & 255)))`.
/// @param value Integer whose low 32 bits are retained.
function longSwap(value) value=n.u32(value);return n.i32(((value&255)<<24)|((value&0xff00)<<8)|((value>>8)&0xff00)|((value>>24)&255)) end function
/// Return `mq3.compat.numeric.i32(value)` from `shared.q_shared_runtime.longNoSwap`.
/// @param value Integer whose low 32 bits are retained.
function longNoSwap(value) return n.i32(value) end function
/// Compute long64 bytes in shared.q_shared_runtime; the normal completion returns `output`.
///
/// Validation failures include `qint64 requires eight bytes`.
/// @param value Value used in `len(value)` and `typeof(value)`.
function long64Bytes(value)
  if typeof(value)=="bytes" then if len(value)!=8 then return error(7670,"qint64 requires eight bytes") end if;return value end if
  output=bytes(8,0);current=value;for index=0 to 7 output[index]=current&255;current=current>>8 end for;return output
end function
/// Compute long64 swap in shared.q_shared_runtime; the normal completion returns `output`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.long64Bytes`.
function long64Swap(value) input=long64Bytes(value);output=bytes(8,0);for index=0 to 7 output[index]=input[7-index] end for;return output end function
/// Compute long64 no swap in shared.q_shared_runtime; the normal completion returns `output`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.long64Bytes`.
function long64NoSwap(value) input=long64Bytes(value);output=bytes(8,0);for index=0 to 7 output[index]=input[index] end for;return output end function
/// Return `mq3.compat.numeric.bitsFloat(n.u32(longSwap(n.floatBits(value))))` from `shared.q_shared_runtime.floatSwap`.
/// @param value Floating-point value to narrow and reinterpret.
function floatSwap(value) return n.bitsFloat(n.u32(longSwap(n.floatBits(value)))) end function
/// Return `mq3.compat.numeric.f32(value)` from `shared.q_shared_runtime.floatNoSwap`.
/// @param value Floating-point value to narrow to binary32.
function floatNoSwap(value) return n.f32(value) end function
/// Return `mq3.shared.q_shared_runtime.shortSwap(value)` from `shared.q_shared_runtime.bigShort`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.shortSwap`.
function bigShort(value) return shortSwap(value) end function
/// Return `mq3.shared.q_shared_runtime.shortNoSwap(value)` from `shared.q_shared_runtime.littleShort`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.shortNoSwap`.
function littleShort(value) return shortNoSwap(value) end function
/// Return `mq3.shared.q_shared_runtime.longSwap(value)` from `shared.q_shared_runtime.bigLong`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.longSwap`.
function bigLong(value) return longSwap(value) end function
/// Return `mq3.shared.q_shared_runtime.longNoSwap(value)` from `shared.q_shared_runtime.littleLong`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.longNoSwap`.
function littleLong(value) return longNoSwap(value) end function
/// Return `mq3.shared.q_shared_runtime.long64Swap(value)` from `shared.q_shared_runtime.bigLong64`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.long64Swap`.
function bigLong64(value) return long64Swap(value) end function
/// Return `mq3.shared.q_shared_runtime.long64NoSwap(value)` from `shared.q_shared_runtime.littleLong64`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.long64NoSwap`.
function littleLong64(value) return long64NoSwap(value) end function
/// Return `mq3.shared.q_shared_runtime.floatSwap(value)` from `shared.q_shared_runtime.bigFloat`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.floatSwap`.
function bigFloat(value) return floatSwap(value) end function
/// Return `mq3.shared.q_shared_runtime.floatNoSwap(value)` from `shared.q_shared_runtime.littleFloat`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.floatNoSwap`.
function littleFloat(value) return floatNoSwap(value) end function
/// Compute shared.q_shared_runtime.swap_Init as `"little"`.
function swap_Init() return "little" end function

/// Create `mq3.shared.q_shared_runtime.ParseSession` with name=name; state=parser.create(text); diagnostics=[].
/// @param name Initial `name` field stored in the returned or constructed `mq3.shared.q_shared_runtime.ParseSession` record.
/// @param text Text passed as `text` to `mq3.shared.parser.create`.
function com_BeginParseSession(name,text) return ParseSession(name,parser.create(text),[]) end function
/// Get current parse line in shared.q_shared_runtime; the normal completion returns `session.state.line`.
/// @param session Record exposing `state`.
function com_GetCurrentParseLine(session) if session==void or session.state==void then return 0 end if;return session.state.line end function
/// Return `mq3.shared.parser.parseExt(session.state, allowLineBreaks)` from `shared.q_shared_runtime.com_ParseExt`.
/// @param session Record exposing `state`.
/// @param allowLineBreaks Allow line breaks passed as `allowLineBreaks` to `mq3.shared.parser.parseExt`.
function com_ParseExt(session,allowLineBreaks) return parser.parseExt(session.state,allowLineBreaks) end function
/// Return `mq3.shared.q_shared_runtime.com_ParseExt(session, true)` from `shared.q_shared_runtime.com_Parse`.
/// @param session Session passed as `session` to `mq3.shared.q_shared_runtime.com_ParseExt`.
function com_Parse(session) return com_ParseExt(session,true) end function
/// Update `session.diagnostics` in shared.q_shared_runtime; the normal completion returns `text`.
///
/// Direct state writes: `session.diagnostics`.
/// @param session Record exposing `name`, `diagnostics`. Updated in place: `diagnostics`.
/// @param kind Kind used in `(kind + ": ")` and `((kind + ": ") + session.name)`.
/// @param message Message operand used by `diagnostic`; its reads are shown in the implementation.
function diagnostic(session,kind,message) text=kind+": "+session.name+", line "+str(com_GetCurrentParseLine(session))+": "+message;session.diagnostics=session.diagnostics+[text];return text end function
/// Return `mq3.shared.q_shared_runtime.diagnostic(session, "ERROR", message)` from `shared.q_shared_runtime.com_ParseError`.
/// @param session Session passed as `session` to `mq3.shared.q_shared_runtime.diagnostic`.
/// @param message Message passed as `message` to `mq3.shared.q_shared_runtime.diagnostic`.
function com_ParseError(session,message) return diagnostic(session,"ERROR",message) end function
/// Return `mq3.shared.q_shared_runtime.diagnostic(session, "WARNING", message)` from `shared.q_shared_runtime.com_ParseWarning`.
/// @param session Session passed as `session` to `mq3.shared.q_shared_runtime.diagnostic`.
/// @param message Message passed as `message` to `mq3.shared.q_shared_runtime.diagnostic`.
function com_ParseWarning(session,message) return diagnostic(session,"WARNING",message) end function
/// Compute skip whitespace in shared.q_shared_runtime; the normal completion returns `newLines`.
/// @param session Record exposing `state`.
function skipWhitespace(session)
  state=session.state;newLines=false;while state.offset>=0 and state.offset<len(state.data) and state.data[state.offset]<=32 if state.data[state.offset]==10 then state.line=state.line+1;newLines=true end if;state.offset=state.offset+1 end while;if state.offset>=len(state.data) then state.offset=-1 end if;return newLines
end function
/// Compress q shared runtime in shared.q_shared_runtime; the normal completion returns `decode(bytes(output))`.
/// @param text Text used in `bytes(text)`.
function com_Compress(text)
  input=bytes(text);output=[];index=0;newline=false;whitespace=false
  while index<len(input) value=input[index]
    if value==47 and index+1<len(input) and input[index+1]==47 then index=index+2;while index<len(input) and input[index]!=10 index=index+1 end while
    else if value==47 and index+1<len(input) and input[index+1]==42 then index=index+2;while index<len(input) and not (input[index]==42 and index+1<len(input) and input[index+1]==47) index=index+1 end while;if index<len(input) then index=index+2 end if
    else if value==10 or value==13 then newline=true;index=index+1
    else if value==32 or value==9 then whitespace=true;index=index+1
    else
      if newline then output=output+[10];newline=false;whitespace=false end if;if whitespace then output=output+[32];whitespace=false end if
      if value==34 then output=output+[value];index=index+1;while index<len(input) and input[index]!=34 output=output+[input[index]];index=index+1 end while;if index<len(input) then output=output+[34];index=index+1 end if
      else output=output+[value];index=index+1 end if
    end if
  end while;return decode(bytes(output))
end function
/// Compute match token in shared.q_shared_runtime; the normal completion returns `token`.
/// @param session Session passed as `session` to `mq3.shared.q_shared_runtime.com_Parse`.
/// @param match Match used in `(token != match)` and `((("MatchToken: " + token) + " != ") + match)`.
function com_MatchToken(session,match) token=com_Parse(session);if token!=match then return error(7671,"MatchToken: "+token+" != "+match) end if;return token end function
/// Compute skip braced section in shared.q_shared_runtime; the normal completion returns `depth`.
/// @param session Record exposing `state`.
function skipBracedSection(session) depth=0;while true token=com_ParseExt(session,true);if token=="{" then depth=depth+1 else if token=="}" then depth=depth-1 end if;if depth==0 or session.state.offset<0 then break end if end while;return depth end function
/// Compute skip rest of line in shared.q_shared_runtime; the normal completion returns `state.offset`.
/// @param session Record exposing `state`.
function skipRestOfLine(session) state=session.state;while state.offset>=0 and state.offset<len(state.data) value=state.data[state.offset];state.offset=state.offset+1;if value==10 then state.line=state.line+1;break end if end while;return state.offset end function
/// Compute parse1 d matrix in shared.q_shared_runtime; the normal completion returns `result`.
/// @param session Session passed as `session` to `mq3.shared.q_shared_runtime.com_MatchToken`.
/// @param x X used in `(x - 1)`.
function parse1DMatrix(session,x) com_MatchToken(session,"(");result=[];for index=0 to x-1 result=result+[numbers.atof32(com_Parse(session))] end for;com_MatchToken(session,")");return result end function
/// Compute parse2 d matrix in shared.q_shared_runtime; the normal completion returns `result`.
/// @param session Session passed as `session` to `mq3.shared.q_shared_runtime.com_MatchToken`.
/// @param y Y used in `(y - 1)`.
/// @param x X passed as `x` to `mq3.shared.q_shared_runtime.parse1DMatrix`.
function parse2DMatrix(session,y,x) com_MatchToken(session,"(");result=[];for index=0 to y-1 result=result+[parse1DMatrix(session,x)] end for;com_MatchToken(session,")");return result end function
/// Compute parse3 d matrix in shared.q_shared_runtime; the normal completion returns `result`.
/// @param session Session passed as `session` to `mq3.shared.q_shared_runtime.com_MatchToken`.
/// @param z Z used in `(z - 1)`.
/// @param y Y passed as `y` to `mq3.shared.q_shared_runtime.parse2DMatrix`.
/// @param x X passed as `x` to `mq3.shared.q_shared_runtime.parse2DMatrix`.
function parse3DMatrix(session,z,y,x) com_MatchToken(session,"(");result=[];for index=0 to z-1 result=result+[parse2DMatrix(session,y,x)] end for;com_MatchToken(session,")");return result end function
/// Parse infos in shared.q_shared_runtime; the normal completion returns `result`.
/// @param text Text passed as `text` to `mq3.shared.q_shared_runtime.com_BeginParseSession`.
/// @param maximum Maximum used in `(len(result) < maximum)`.
function com_ParseInfos(text,maximum)
  session=com_BeginParseSession("infos",text);result=[]
  while len(result)<maximum token=com_Parse(session);if token=="" then break end if;if token!="{" then break end if;value="";while true key=com_ParseExt(session,true);if key=="" or key=="}" then break end if;field=com_ParseExt(session,false);if field=="" then field="<NULL>" end if;value=infoSet(value,key,field,MAX_INFO_STRING) end while;result=result+[value] end while;return result
end function

/// Compute shared.q_shared_runtime.q_isprint as `((value >= 32) and (value <= 126))`.
/// @param value Value used in `(value >= 32)` and `(value <= 126)`.
function q_isprint(value) return value>=0x20 and value<=0x7e end function
/// Compute shared.q_shared_runtime.q_islower as `((value >= 97) and (value <= 122))`.
/// @param value Value used in `(value >= 97)` and `(value <= 122)`.
function q_islower(value) return value>=97 and value<=122 end function
/// Compute shared.q_shared_runtime.q_isupper as `((value >= 65) and (value <= 90))`.
/// @param value Value used in `(value >= 65)` and `(value <= 90)`.
function q_isupper(value) return value>=65 and value<=90 end function
/// Compute shared.q_shared_runtime.q_isalpha as `(q_islower(value) or q_isupper(value))`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.q_islower`.
function q_isalpha(value) return q_islower(value) or q_isupper(value) end function
/// Compute strrchr in shared.q_shared_runtime; the normal completion returns `result`.
/// @param text Text used in `bytes(text)`.
/// @param value Value used in `(value & 255)`.
function q_strrchr(text,value) data=bytes(text);wanted=value&255;result=-1;for index=0 to len(data)-1 if data[index]==wanted then result=index end if end for;if wanted==0 then return len(data) end if;return result end function
/// Compute strncpyz in shared.q_shared_runtime; the normal completion returns `decode(data)`.
///
/// Validation failures include `Q_strncpyz invalid argument`.
/// @param text Text used in `bytes(text)` and `(text == void)`.
/// @param size Size used in `(size < 1)` and `(size - 1)`.
function q_strncpyz(text,size) if text==void or size<1 then return error(7672,"Q_strncpyz invalid argument") end if;data=bytes(text);if len(data)>=size then data=slice(data,0,size-1) end if;return decode(data) end function
/// Compute char at in shared.q_shared_runtime; the normal completion returns `data[index]`.
/// @param data Data used in `len(data)` and `data[index]`.
/// @param index Zero-based index into `data`.
function charAt(data,index) if index<0 or index>=len(data) then return 0 end if;return data[index] end function
/// Compute upper byte in shared.q_shared_runtime; the normal completion returns `value`.
/// @param value Value used in `(value - 32)` and `(value >= 97)`.
function upperByte(value) if value>=97 and value<=122 then return value-32 end if;return value end function
/// Apply `mq3.shared.q_shared_runtime.charAt`, `mq3.shared.q_shared_runtime.upperByte` for stricmpn in shared.q_shared_runtime.
/// @param first First used in `bytes(first)` and `(first == void)`.
/// @param second Second used in `bytes(second)` and `(second == void)`.
/// @param count Count operand used by `q_stricmpn`; its reads are shown in the implementation.
function q_stricmpn(first,second,count)
  if first==void then if second==void then return 0 end if;return -1 else if second==void then return 1 end if;left=bytes(first);right=bytes(second);index=0;remaining=count
  while true a=charAt(left,index);b=charAt(right,index);if remaining==0 then return 0 end if;remaining=remaining-1;if a!=b then a=upperByte(a);b=upperByte(b);if a!=b then if a<b then return -1 end if;return 1 end if end if;if a==0 then return 0 end if;index=index+1 end while
end function
/// Apply `mq3.shared.q_shared_runtime.charAt` for strncmp in shared.q_shared_runtime.
/// @param first First used in `bytes(first)`.
/// @param second Second used in `bytes(second)`.
/// @param count Count operand used by `q_strncmp`; its reads are shown in the implementation.
function q_strncmp(first,second,count) left=bytes(first);right=bytes(second);index=0;remaining=count;while true a=charAt(left,index);b=charAt(right,index);if remaining==0 then return 0 end if;remaining=remaining-1;if a!=b then if a<b then return -1 end if;return 1 end if;if a==0 then return 0 end if;index=index+1 end while end function
/// Compute stricmp in shared.q_shared_runtime; the normal completion returns `q_stricmpn(first, second, 99999)`.
/// @param first First passed as `first` to `mq3.shared.q_shared_runtime.q_stricmpn`.
/// @param second Second passed as `second` to `mq3.shared.q_shared_runtime.q_stricmpn`.
function q_stricmp(first,second) if first==void or second==void then return -1 end if;return q_stricmpn(first,second,99999) end function
/// Compute strlwr in shared.q_shared_runtime; the normal completion returns `decode(data)`.
/// @param text Text used in `bytes(text)`.
function q_strlwr(text) data=bytes(text);for index=0 to len(data)-1 if data[index]>=65 and data[index]<=90 then data[index]=data[index]+32 end if end for;return decode(data) end function
/// Compute strupr in shared.q_shared_runtime; the normal completion returns `decode(data)`.
/// @param text Text used in `bytes(text)`.
function q_strupr(text) data=bytes(text);for index=0 to len(data)-1 if data[index]>=97 and data[index]<=122 then data[index]=data[index]-32 end if end for;return decode(data) end function
/// Compute strcat in shared.q_shared_runtime; the normal completion returns `(destination + q_strncpyz(source, (size - len(bytes(destination)))))`.
///
/// Validation failures include `Q_strcat already overflowed`.
/// @param destination Destination used in `bytes(destination)` and `len(bytes(destination))`.
/// @param size Size used in `(size - len(bytes(destination)))` and `(len(bytes(destination)) >= size)`.
/// @param source Text passed as `text` to `mq3.shared.q_shared_runtime.q_strncpyz`.
function q_strcat(destination,size,source) if len(bytes(destination))>=size then return error(7673,"Q_strcat already overflowed") end if;return destination+q_strncpyz(source,size-len(bytes(destination))) end function
/// Compute shared.q_shared_runtime.colorAt as `(((((index + 1) < len(data)) and (data[index] == 94)) and (data[(index + 1)] != 94)) and (data[(index + 1)] != 0))`.
/// @param data Data used in `len(data)` and `data[index]`.
/// @param index Zero-based index into `data`.
function colorAt(data,index) return index+1<len(data) and data[index]==94 and data[index+1]!=94 and data[index+1]!=0 end function
/// Compute print strlen in shared.q_shared_runtime; the normal completion returns `count`.
/// @param text Text used in `bytes(text)` and `(text == void)`.
function q_PrintStrlen(text) if text==void then return 0 end if;data=bytes(text);index=0;count=0;while index<len(data) if colorAt(data,index) then index=index+2 else index=index+1;count=count+1 end if end while;return count end function
/// Compute clean str in shared.q_shared_runtime; the normal completion returns `decode(bytes(output))`.
/// @param text Text used in `bytes(text)`.
function q_CleanStr(text)
  data=bytes(text);output=[];index=0
  while index<len(data)
    if colorAt(data,index) then index=index+2
    else
      if q_isprint(data[index]) then output=output+[data[index]] end if
      index=index+1
    end if
  end while;return decode(bytes(output))
end function

/// Compute format unsigned in shared.q_shared_runtime; the normal completion returns `str(n.u32(value))`.
/// @param value Integer whose low 32 bits are retained.
function formatUnsigned(value) if value>=0 then return str(value) end if;return str(n.u32(value)) end function
/// Compute hex text in shared.q_shared_runtime; the normal completion returns `result`.
/// @param value Integer whose low 32 bits are retained.
/// @param upper Upper operand used by `hexText`; its reads are shown in the implementation.
function hexText(value,upper) digits="0123456789abcdef";if upper then digits="0123456789ABCDEF" end if;value=n.u32(value);result="";started=false;shift=28;while shift>=0 digit=(value>>shift)&15;if digit!=0 or started or shift==0 then result=result+digits[digit];started=true end if;shift=shift-4 end while;return result end function
/// Compute format value in shared.q_shared_runtime; the normal completion returns `("%" + code)`.
/// @param code Code used in `("%" + code)` and `(code == "s")`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.formatUnsigned`.
function formatValue(code,value) if code=="s" then return str(value) end if;if code=="d" or code=="i" then return str(value) end if;if code=="u" then return formatUnsigned(value) end if;if code=="x" then return hexText(value,false) end if;if code=="X" then return hexText(value,true) end if;if code=="f" then return numbers.fixed6(value) end if;if code=="c" then return decode(bytes([value&255])) end if;return "%"+code end function
/// Compute format text in shared.q_shared_runtime; the normal completion returns `result`.
///
/// Validation failures include `missing format argument`.
/// @param format Format used in `bytes(format)` and `error(7674, "missing format argument")`.
/// @param arguments Arguments used in `len(arguments)` and `arguments[argument]`.
function formatText(format,arguments)
  data=bytes(format);result="";index=0;argument=0
  while index<len(data)
    if data[index]!=37 then result=result+decode(bytes([data[index]]));index=index+1
    else if index+1<len(data) and data[index+1]==37 then result=result+"%";index=index+2
    else
      index=index+1;while index<len(data) and (data[index]==45 or data[index]==43 or data[index]==32 or data[index]==35 or data[index]==48 or (data[index]>=48 and data[index]<=57) or data[index]==46) index=index+1 end while;if index>=len(data) then break end if;code=decode(bytes([data[index]]));if argument>=len(arguments) then return error(7674,"missing format argument") end if;result=result+formatValue(code,arguments[argument]);argument=argument+1;index=index+1
    end if
  end while;return result
end function
/// Compute sprintf in shared.q_shared_runtime; the normal completion returns `q_strncpyz(value, size)`.
///
/// Validation failures include `Com_sprintf bigbuffer overflow`.
/// @param size Size passed as `size` to `mq3.shared.q_shared_runtime.q_strncpyz`.
/// @param format Format passed as `format` to `mq3.shared.q_shared_runtime.formatText`.
/// @param arguments Arguments passed as `arguments` to `mq3.shared.q_shared_runtime.formatText`.
function com_sprintf(size,format,arguments) value=formatText(format,arguments);if len(bytes(value))>=32000 then return error(7675,"Com_sprintf bigbuffer overflow") end if;return q_strncpyz(value,size) end function
/// Compute va in shared.q_shared_runtime; the normal completion returns `value`.
///
/// Validation failures include `va buffer overflow`.
/// @param format Format passed as `format` to `mq3.shared.q_shared_runtime.formatText`.
/// @param arguments Arguments passed as `arguments` to `mq3.shared.q_shared_runtime.formatText`.
function va(format,arguments) value=formatText(format,arguments);if len(bytes(value))>=32000 then return error(7676,"va buffer overflow") end if;return value end function

/// Return `mq3.shared.info.value(text, key)` from `shared.q_shared_runtime.info_ValueForKey`.
/// @param text Info passed as `info` to `mq3.shared.info.value`.
/// @param key Key passed as `key` to `mq3.shared.info.value`.
function info_ValueForKey(text,key) return info.value(text,key) end function
/// Compute info next pair in shared.q_shared_runtime; the normal completion returns `InfoPair(index, key, decode(slice(data, valueStart, (index - valueStart))))`.
/// @param text Text used in `bytes(text)`.
/// @param head Head operand used by `info_NextPair`; its reads are shown in the implementation.
function info_NextPair(text,head)
  data=bytes(text);index=head;if index<len(data) and data[index]==92 then index=index+1 end if;keyStart=index;while index<len(data) and data[index]!=92 index=index+1 end while
  key=decode(slice(data,keyStart,index-keyStart));if index>=len(data) then return InfoPair(index,key,"") end if;index=index+1;valueStart=index;while index<len(data) and data[index]!=92 index=index+1 end while;return InfoPair(index,key,decode(slice(data,valueStart,index-valueStart)))
end function
/// Compute info remove in shared.q_shared_runtime; the normal completion returns `text`.
///
/// Validation failures include `Info_RemoveKey oversize`.
/// @param text Text used in `bytes(text)` and `len(bytes(text))`.
/// @param key Key used in `(found == key)` and `strings.indexOf(key, "\\", 0)`.
/// @param capacity Capacity used in `(len(bytes(text)) >= capacity)`.
function infoRemove(text,key,capacity)
  if len(bytes(text))>=capacity then return error(7677,"Info_RemoveKey oversize") end if;if strings.indexOf(key,"\\",0)>=0 then return text end if;data=bytes(text);index=0
  while index<len(data) start=index;if data[index]==92 then index=index+1 end if;keyStart=index;while index<len(data) and data[index]!=92 index=index+1 end while;if index==len(data) then return text end if;found=decode(slice(data,keyStart,index-keyStart));index=index+1;while index<len(data) and data[index]!=92 index=index+1 end while;if found==key then return decode(slice(data,0,start))+decode(slice(data,index,len(data)-index)) end if end while;return text
end function
/// Return `mq3.shared.q_shared_runtime.infoRemove(text, key, MAX_INFO_STRING)` from `shared.q_shared_runtime.info_RemoveKey`.
/// @param text Text passed as `text` to `mq3.shared.q_shared_runtime.infoRemove`.
/// @param key Key passed as `key` to `mq3.shared.q_shared_runtime.infoRemove`.
function info_RemoveKey(text,key) return infoRemove(text,key,MAX_INFO_STRING) end function
/// Return `mq3.shared.q_shared_runtime.infoRemove(text, key, BIG_INFO_STRING)` from `shared.q_shared_runtime.info_RemoveKey_Big`.
/// @param text Text passed as `text` to `mq3.shared.q_shared_runtime.infoRemove`.
/// @param key Key passed as `key` to `mq3.shared.q_shared_runtime.infoRemove`.
function info_RemoveKey_Big(text,key) return infoRemove(text,key,BIG_INFO_STRING) end function
/// Return `mq3.shared.info.valid(text)` from `shared.q_shared_runtime.info_Validate`.
/// @param text Info passed as `info` to `mq3.shared.info.valid`.
function info_Validate(text) return info.valid(text) end function
/// Compute info set in shared.q_shared_runtime; the normal completion returns `(pair + remaining)`.
///
/// Validation failures include `Info_SetValueForKey oversize`.
/// @param text Text passed as `text` to `mq3.shared.q_shared_runtime.infoRemove`.
/// @param key Key passed as `key` to `mq3.shared.q_shared_runtime.infoRemove`.
/// @param value Value used in `(value == "")` and `(value == void)`.
/// @param capacity Capacity passed as `capacity` to `mq3.shared.q_shared_runtime.infoRemove`.
function infoSet(text,key,value,capacity)
  if value==void then value="" end if;if len(bytes(text))>=capacity then return error(7678,"Info_SetValueForKey oversize") end if
  if strings.indexOf(key,"\\",0)>=0 or strings.indexOf(value,"\\",0)>=0 or strings.indexOf(key,";",0)>=0 or strings.indexOf(value,";",0)>=0 or strings.indexOf(key,"\"",0)>=0 or strings.indexOf(value,"\"",0)>=0 then return text end if
  remaining=infoRemove(text,key,capacity);if value=="" then return remaining end if;pair="\\"+key+"\\"+value;if len(bytes(pair))+len(bytes(remaining))>capacity then return remaining end if
  if capacity==BIG_INFO_STRING then return remaining+pair end if;return pair+remaining
end function
/// Return `mq3.shared.q_shared_runtime.infoSet(text, key, value, MAX_INFO_STRING)` from `shared.q_shared_runtime.info_SetValueForKey`.
/// @param text Text passed as `text` to `mq3.shared.q_shared_runtime.infoSet`.
/// @param key Key passed as `key` to `mq3.shared.q_shared_runtime.infoSet`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.infoSet`.
function info_SetValueForKey(text,key,value) return infoSet(text,key,value,MAX_INFO_STRING) end function
/// Return `mq3.shared.q_shared_runtime.infoSet(text, key, value, BIG_INFO_STRING)` from `shared.q_shared_runtime.info_SetValueForKey_Big`.
/// @param text Text passed as `text` to `mq3.shared.q_shared_runtime.infoSet`.
/// @param key Key passed as `key` to `mq3.shared.q_shared_runtime.infoSet`.
/// @param value Value passed as `value` to `mq3.shared.q_shared_runtime.infoSet`.
function info_SetValueForKey_Big(text,key,value) return infoSet(text,key,value,BIG_INFO_STRING) end function
