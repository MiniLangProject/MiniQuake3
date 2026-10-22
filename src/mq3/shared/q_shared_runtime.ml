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
struct ParseSession name state diagnostics end struct
struct InfoPair head key value end struct

function com_Clamp(minimum,maximum,value) if value<minimum then return minimum end if;if value>maximum then return maximum end if;return value end function
function com_SkipPath(path) data=bytes(path);start=0;for index=0 to len(data)-1 if data[index]==47 then start=index+1 end if end for;return decode(slice(data,start,len(data)-start)) end function
function com_StripExtension(path) data=bytes(path);count=0;while count<len(data) and data[count]!=46 count=count+1 end while;return decode(slice(data,0,count)) end function
function com_DefaultExtension(path,maxSize,extension)
  data=bytes(path);index=len(data)-1;while index>0 and data[index]!=47 if data[index]==46 then return q_strncpyz(path,maxSize) end if;index=index-1 end while;return com_sprintf(maxSize,"%s%s",[path,extension])
end function

function shortSwap(value) value=value&0xffff;return n.i16(((value&255)<<8)|((value>>8)&255)) end function
function shortNoSwap(value) return n.i16(value) end function
function longSwap(value) value=n.u32(value);return n.i32(((value&255)<<24)|((value&0xff00)<<8)|((value>>8)&0xff00)|((value>>24)&255)) end function
function longNoSwap(value) return n.i32(value) end function
function long64Bytes(value)
  if typeof(value)=="bytes" then if len(value)!=8 then return error(7670,"qint64 requires eight bytes") end if;return value end if
  output=bytes(8,0);current=value;for index=0 to 7 output[index]=current&255;current=current>>8 end for;return output
end function
function long64Swap(value) input=long64Bytes(value);output=bytes(8,0);for index=0 to 7 output[index]=input[7-index] end for;return output end function
function long64NoSwap(value) input=long64Bytes(value);output=bytes(8,0);for index=0 to 7 output[index]=input[index] end for;return output end function
function floatSwap(value) return n.bitsFloat(n.u32(longSwap(n.floatBits(value)))) end function
function floatNoSwap(value) return n.f32(value) end function
function bigShort(value) return shortSwap(value) end function
function littleShort(value) return shortNoSwap(value) end function
function bigLong(value) return longSwap(value) end function
function littleLong(value) return longNoSwap(value) end function
function bigLong64(value) return long64Swap(value) end function
function littleLong64(value) return long64NoSwap(value) end function
function bigFloat(value) return floatSwap(value) end function
function littleFloat(value) return floatNoSwap(value) end function
function swap_Init() return "little" end function

function com_BeginParseSession(name,text) return ParseSession(name,parser.create(text),[]) end function
function com_GetCurrentParseLine(session) if session==void or session.state==void then return 0 end if;return session.state.line end function
function com_ParseExt(session,allowLineBreaks) return parser.parseExt(session.state,allowLineBreaks) end function
function com_Parse(session) return com_ParseExt(session,true) end function
function diagnostic(session,kind,message) text=kind+": "+session.name+", line "+str(com_GetCurrentParseLine(session))+": "+message;session.diagnostics=session.diagnostics+[text];return text end function
function com_ParseError(session,message) return diagnostic(session,"ERROR",message) end function
function com_ParseWarning(session,message) return diagnostic(session,"WARNING",message) end function
function skipWhitespace(session)
  state=session.state;newLines=false;while state.offset>=0 and state.offset<len(state.data) and state.data[state.offset]<=32 if state.data[state.offset]==10 then state.line=state.line+1;newLines=true end if;state.offset=state.offset+1 end while;if state.offset>=len(state.data) then state.offset=-1 end if;return newLines
end function
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
function com_MatchToken(session,match) token=com_Parse(session);if token!=match then return error(7671,"MatchToken: "+token+" != "+match) end if;return token end function
function skipBracedSection(session) depth=0;while true token=com_ParseExt(session,true);if token=="{" then depth=depth+1 else if token=="}" then depth=depth-1 end if;if depth==0 or session.state.offset<0 then break end if end while;return depth end function
function skipRestOfLine(session) state=session.state;while state.offset>=0 and state.offset<len(state.data) value=state.data[state.offset];state.offset=state.offset+1;if value==10 then state.line=state.line+1;break end if end while;return state.offset end function
function parse1DMatrix(session,x) com_MatchToken(session,"(");result=[];for index=0 to x-1 result=result+[numbers.atof32(com_Parse(session))] end for;com_MatchToken(session,")");return result end function
function parse2DMatrix(session,y,x) com_MatchToken(session,"(");result=[];for index=0 to y-1 result=result+[parse1DMatrix(session,x)] end for;com_MatchToken(session,")");return result end function
function parse3DMatrix(session,z,y,x) com_MatchToken(session,"(");result=[];for index=0 to z-1 result=result+[parse2DMatrix(session,y,x)] end for;com_MatchToken(session,")");return result end function
function com_ParseInfos(text,maximum)
  session=com_BeginParseSession("infos",text);result=[]
  while len(result)<maximum token=com_Parse(session);if token=="" then break end if;if token!="{" then break end if;value="";while true key=com_ParseExt(session,true);if key=="" or key=="}" then break end if;field=com_ParseExt(session,false);if field=="" then field="<NULL>" end if;value=infoSet(value,key,field,MAX_INFO_STRING) end while;result=result+[value] end while;return result
end function

function q_isprint(value) return value>=0x20 and value<=0x7e end function
function q_islower(value) return value>=97 and value<=122 end function
function q_isupper(value) return value>=65 and value<=90 end function
function q_isalpha(value) return q_islower(value) or q_isupper(value) end function
function q_strrchr(text,value) data=bytes(text);wanted=value&255;result=-1;for index=0 to len(data)-1 if data[index]==wanted then result=index end if end for;if wanted==0 then return len(data) end if;return result end function
function q_strncpyz(text,size) if text==void or size<1 then return error(7672,"Q_strncpyz invalid argument") end if;data=bytes(text);if len(data)>=size then data=slice(data,0,size-1) end if;return decode(data) end function
function charAt(data,index) if index<0 or index>=len(data) then return 0 end if;return data[index] end function
function upperByte(value) if value>=97 and value<=122 then return value-32 end if;return value end function
function q_stricmpn(first,second,count)
  if first==void then if second==void then return 0 end if;return -1 else if second==void then return 1 end if;left=bytes(first);right=bytes(second);index=0;remaining=count
  while true a=charAt(left,index);b=charAt(right,index);if remaining==0 then return 0 end if;remaining=remaining-1;if a!=b then a=upperByte(a);b=upperByte(b);if a!=b then if a<b then return -1 end if;return 1 end if end if;if a==0 then return 0 end if;index=index+1 end while
end function
function q_strncmp(first,second,count) left=bytes(first);right=bytes(second);index=0;remaining=count;while true a=charAt(left,index);b=charAt(right,index);if remaining==0 then return 0 end if;remaining=remaining-1;if a!=b then if a<b then return -1 end if;return 1 end if;if a==0 then return 0 end if;index=index+1 end while end function
function q_stricmp(first,second) if first==void or second==void then return -1 end if;return q_stricmpn(first,second,99999) end function
function q_strlwr(text) data=bytes(text);for index=0 to len(data)-1 if data[index]>=65 and data[index]<=90 then data[index]=data[index]+32 end if end for;return decode(data) end function
function q_strupr(text) data=bytes(text);for index=0 to len(data)-1 if data[index]>=97 and data[index]<=122 then data[index]=data[index]-32 end if end for;return decode(data) end function
function q_strcat(destination,size,source) if len(bytes(destination))>=size then return error(7673,"Q_strcat already overflowed") end if;return destination+q_strncpyz(source,size-len(bytes(destination))) end function
function colorAt(data,index) return index+1<len(data) and data[index]==94 and data[index+1]!=94 and data[index+1]!=0 end function
function q_PrintStrlen(text) if text==void then return 0 end if;data=bytes(text);index=0;count=0;while index<len(data) if colorAt(data,index) then index=index+2 else index=index+1;count=count+1 end if end while;return count end function
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

function formatUnsigned(value) if value>=0 then return str(value) end if;return str(n.u32(value)) end function
function hexText(value,upper) digits="0123456789abcdef";if upper then digits="0123456789ABCDEF" end if;value=n.u32(value);result="";started=false;shift=28;while shift>=0 digit=(value>>shift)&15;if digit!=0 or started or shift==0 then result=result+digits[digit];started=true end if;shift=shift-4 end while;return result end function
function formatValue(code,value) if code=="s" then return str(value) end if;if code=="d" or code=="i" then return str(value) end if;if code=="u" then return formatUnsigned(value) end if;if code=="x" then return hexText(value,false) end if;if code=="X" then return hexText(value,true) end if;if code=="f" then return numbers.fixed6(value) end if;if code=="c" then return decode(bytes([value&255])) end if;return "%"+code end function
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
function com_sprintf(size,format,arguments) value=formatText(format,arguments);if len(bytes(value))>=32000 then return error(7675,"Com_sprintf bigbuffer overflow") end if;return q_strncpyz(value,size) end function
function va(format,arguments) value=formatText(format,arguments);if len(bytes(value))>=32000 then return error(7676,"va buffer overflow") end if;return value end function

function info_ValueForKey(text,key) return info.value(text,key) end function
function info_NextPair(text,head)
  data=bytes(text);index=head;if index<len(data) and data[index]==92 then index=index+1 end if;keyStart=index;while index<len(data) and data[index]!=92 index=index+1 end while
  key=decode(slice(data,keyStart,index-keyStart));if index>=len(data) then return InfoPair(index,key,"") end if;index=index+1;valueStart=index;while index<len(data) and data[index]!=92 index=index+1 end while;return InfoPair(index,key,decode(slice(data,valueStart,index-valueStart)))
end function
function infoRemove(text,key,capacity)
  if len(bytes(text))>=capacity then return error(7677,"Info_RemoveKey oversize") end if;if strings.indexOf(key,"\\",0)>=0 then return text end if;data=bytes(text);index=0
  while index<len(data) start=index;if data[index]==92 then index=index+1 end if;keyStart=index;while index<len(data) and data[index]!=92 index=index+1 end while;if index==len(data) then return text end if;found=decode(slice(data,keyStart,index-keyStart));index=index+1;while index<len(data) and data[index]!=92 index=index+1 end while;if found==key then return decode(slice(data,0,start))+decode(slice(data,index,len(data)-index)) end if end while;return text
end function
function info_RemoveKey(text,key) return infoRemove(text,key,MAX_INFO_STRING) end function
function info_RemoveKey_Big(text,key) return infoRemove(text,key,BIG_INFO_STRING) end function
function info_Validate(text) return info.valid(text) end function
function infoSet(text,key,value,capacity)
  if value==void then value="" end if;if len(bytes(text))>=capacity then return error(7678,"Info_SetValueForKey oversize") end if
  if strings.indexOf(key,"\\",0)>=0 or strings.indexOf(value,"\\",0)>=0 or strings.indexOf(key,";",0)>=0 or strings.indexOf(value,";",0)>=0 or strings.indexOf(key,"\"",0)>=0 or strings.indexOf(value,"\"",0)>=0 then return text end if
  remaining=infoRemove(text,key,capacity);if value=="" then return remaining end if;pair="\\"+key+"\\"+value;if len(bytes(pair))+len(bytes(remaining))>capacity then return remaining end if
  if capacity==BIG_INFO_STRING then return remaining+pair end if;return pair+remaining
end function
function info_SetValueForKey(text,key,value) return infoSet(text,key,value,MAX_INFO_STRING) end function
function info_SetValueForKey_Big(text,key,value) return infoSet(text,key,value,BIG_INFO_STRING) end function
