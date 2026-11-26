// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/botlib/l_log.c.
package mq3.botlib.log

import mq3.botlib.lib_variables as libvars
import mq3.compat.numeric as numeric

/// Format a native C argument buffer through the Universal C Runtime into the supplied bounded byte buffer.
/// @param options Formatting option bits forwarded to the C runtime.
/// @param output Writable byte buffer receiving the formatted text and terminating zero.
/// @param length Capacity of the output buffer in bytes, including space for the terminating zero.
/// @param format C-style format string.
/// @param locale Native C locale pointer used by formatting.
/// @param arguments Packed native variadic-argument storage consumed by the C formatter.
/// @returns The native formatter result: a nonnegative character count or a negative value on failure.
extern function __stdio_common_vsprintf(options as u64,output as bytes,length as u64,format as cstr,locale as ptr,arguments as bytes) from "ucrtbase.dll" returns i32

const PRT_MESSAGE=2
const PRT_ERROR=3
const MAX_LOGFILENAMESIZE=1024

/// `FormatArg` record for log, containing `kind`, `text`, `integer` and `real`.
struct FormatArg kind text integer real end struct
/// `Action` record for log, containing `boundary`, `kind`, `severity`, `filename` and `text` and related fields.
struct Action boundary kind severity filename text handle dispatched end struct
/// `Services` record for log, containing `context`, `openFn`, `closeFn`, `writeFn` and `flushFn` and related fields.
struct Services context openFn closeFn writeFn flushFn printFn end struct
/// `State` record for log, containing `variables`, `services`, `filename`, `handle` and `numwrites` and related fields.
struct State variables services filename handle numwrites time content actions retailActive flushes end struct

/// Create a `mq3.botlib.log.Services` record with the declared empty defaults.
function services() return Services(void,void,void,void,void,void) end function
/// Build the `mq3.botlib.log.State` result for `create`. Return paths include `State(variables,serviceSet,"",0,0,0.0,"",[],retailActive,0)`.
/// @param variables Chat substitution values in their numbered slots.
/// @param serviceSet Initial value stored in `mq3.botlib.log.State.services`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function create(variables,serviceSet,retailActive) if serviceSet==void then serviceSet=services() end if;return State(variables,serviceSet,"",0,0,0.0,"",[],retailActive,0) end function
/// Build the `mq3.botlib.log.FormatArg` result for `stringArg`. Return paths include `FormatArg("string",value,0,0.0)`.
/// @param value Initial value stored in `mq3.botlib.log.FormatArg.text`.
function stringArg(value) if value==void then value="(null)" end if;return FormatArg("string",value,0,0.0) end function
/// Create a `mq3.botlib.log.FormatArg` record, initializing `kind` as `"integer"` and `integer` as `numeric.i32(value)`.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.i32`.
function intArg(value) return FormatArg("integer","",numeric.i32(value),0.0) end function
/// Create a `mq3.botlib.log.FormatArg` record, initializing `kind` as `"float"` and `real` as `numeric.f32(value)`.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.f32`.
function floatArg(value) return FormatArg("float","",0,numeric.f32(value)) end function
/// Create a `mq3.botlib.log.FormatArg` record, initializing `kind` as `"pointer"` and `integer` from `value`.
/// @param value Initial value stored in `mq3.botlib.log.FormatArg.integer`.
function pointerArg(value) return FormatArg("pointer","",value,0.0) end function
/// Set `state.actions` to `state.actions+[item]` in `mq3.botlib.log.emit`. Return paths include `item`.
/// @param state Log state; accesses `retailActive` and `actions`. May update `state.actions` in place.
/// @param kind Initial value stored in `mq3.botlib.log.Action.kind`.
/// @param severity Initial value stored in `mq3.botlib.log.Action.severity`.
/// @param filename Filename supplied to the configured loader or file service.
/// @param text Text to parse, format or deliver.
/// @param handle Resource handle resolved by the owning pool or host service.
function emit(state,kind,severity,filename,text,handle) item=Action("botlib-log",kind,severity,filename,text,handle,not state.retailActive);state.actions=state.actions+[item];return item end function
/// Record or dispatch `"print"` actions in `printMessage`. Return paths include `text`.
/// @param state Log state; accesses `filename`, `handle`, `retailActive` and `services`.
/// @param severity Initial value stored in `mq3.botlib.log.Action.severity`.
/// @param text Text to parse, format or deliver.
function printMessage(state,severity,text) emit(state,"print",severity,state.filename,text,state.handle);if not state.retailActive and state.services.printFn!=void then state.services.printFn(state.services.context,severity,text) end if;return text end function

/// Repeat a formatting fragment the requested number of times, returning an empty string for a nonpositive count.
/// @param value Value used by `repeat` in `if count>0 then for i=1 to count result=result+value end for end if`.
/// @param count Number of entries or bytes processed by this call.
function repeat(value,count) result="";if count>0 then for i=1 to count result=result+value end for end if;return result end function
/// Apply `mq3.botlib.log.repeat` while evaluating `pad`. Return paths include `repeat(fill,missing)+value`.
/// @param value Array or byte sequence accessed at `0`.
/// @param width Value used by `pad` in `missing=width-len(value)`.
/// @param left Value used by `pad` in `if left then return value+repeat(fill,missing) end if`.
/// @param zero Value used by `pad` in `if zero then fill="0" end if`.
function pad(value,width,left,zero) missing=width-len(value);if missing<=0 then return value end if;fill=" ";if zero then fill="0" end if;if left then return value+repeat(fill,missing) end if;if zero and len(value)>0 and (value[0]=="-" or value[0]=="+") then return value[0]+repeat(fill,missing)+decode(slice(bytes(value),1,len(bytes(value))-1)) end if;return repeat(fill,missing)+value end function
/// Format an unsigned 32-bit value in hexadecimal without leading zeroes and with the requested letter case.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.u32`.
/// @param upper Value used by `hex32` in `if upper then digits="0123456789ABCDEF" end if`.
function hex32(value,upper) digits="0123456789abcdef";if upper then digits="0123456789ABCDEF" end if;value=numeric.u32(value);result="";started=false;index=7;while index>=0 nibble=(value>>(index*4))&15;if nibble!=0 or started or index==0 then result=result+digits[nibble];started=true end if;index=index-1 end while;return result end function
/// Format a pointer-sized value as sixteen uppercase hexadecimal digits.
/// @param value Value used by `pointerText` in `while index>=0 result=result+digits[(value>>(index*4))&15]`.
function pointerText(value) digits="0123456789ABCDEF";result="";index=15;while index>=0 result=result+digits[(value>>(index*4))&15];index=index-1 end while;return result end function
/// Apply `mq3.botlib.log.__stdio_common_vsprintf` while evaluating `floatText`. Return paths include `decode(slice(output,0,count))`.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.floatBits`.
/// @param token C-style format string.
function floatText(value,token)
  bits=numeric.floatBits(value);exponent=(bits>>23)&255;fraction=bits&0x7fffff;hi=bits&0x80000000;lo=0;if exponent==255 then hi=hi|0x7ff00000 else if exponent!=0 then hi=hi|((exponent+896)<<20) else if fraction!=0 then exponent=1;while fraction<0x800000 fraction=fraction<<1;exponent=exponent-1 end while;fraction=fraction&0x7fffff;hi=hi|((exponent+896)<<20) end if;hi=hi|(fraction>>3);lo=(fraction&7)<<29;arguments=bytes(8,0);output=bytes(65536,0);for b=0 to 3 arguments[b]=(lo>>(b*8))&255;arguments[b+4]=(hi>>(b*8))&255 end for;count=__stdio_common_vsprintf(32,output,65536,token,0,arguments);if count<0 or count>=65536 then return error(7842,"botlib log float format overflow") end if;return decode(slice(output,0,count))
end function

/// Apply `mq3.botlib.log.hex32`, `mq3.botlib.log.pointerText` and `mq3.botlib.log.floatText` while evaluating `format`.
/// @param fmt Value passed as argument 1 to `bytes`.
/// @param args Array or byte sequence accessed at `argAt`.
function format(fmt,args)
  if fmt==void then return error(7842,"botlib log format is missing") end if;data=bytes(fmt);result="";at=0;argAt=0;while at<len(data) if data[at]!=37 then result=result+decode(bytes([data[at]]));at=at+1;continue end if;start=at;at=at+1;if at<len(data) and data[at]==37 then result=result+"%";at=at+1;continue end if;left=false;zero=false;while at<len(data) and (data[at]==45 or data[at]==48 or data[at]==43 or data[at]==32 or data[at]==35) if data[at]==45 then left=true end if;if data[at]==48 then zero=true end if;at=at+1 end while;width=0;while at<len(data) and data[at]>=48 and data[at]<=57 width=width*10+data[at]-48;at=at+1 end while;if at<len(data) and data[at]==46 then at=at+1;while at<len(data) and data[at]>=48 and data[at]<=57 at=at+1 end while end if;while at<len(data) and (data[at]==104 or data[at]==108 or data[at]==76 or data[at]==122 or data[at]==116 or data[at]==106) at=at+1 end while;if at>=len(data) then return error(7842,"botlib log has incomplete format") end if;if argAt>=len(args) then return error(7842,"botlib log has too few arguments") end if;spec=data[at];at=at+1;arg=args[argAt];argAt=argAt+1;value="";if spec==115 then value=arg.text else if spec==100 or spec==105 then value=str(arg.integer) else if spec==117 then value=str(numeric.u32(arg.integer)) else if spec==120 then value=hex32(arg.integer,false) else if spec==88 then value=hex32(arg.integer,true) else if spec==99 then value=decode(bytes([arg.integer&255])) else if spec==112 then value=pointerText(arg.integer) else if spec==102 or spec==70 or spec==101 or spec==69 or spec==103 or spec==71 then token=decode(slice(data,start,at-start));value=floatText(arg.real,token);width=0 else return error(7842,"botlib log has unsupported format") end if;result=result+pad(value,width,left,zero) end while;if argAt!=len(args) then return error(7842,"botlib log has too many arguments") end if;return result
end function

/// Record or dispatch `"flush"` actions in `flush`.
/// @param state Log state; accesses `handle`, `flushes`, `filename`, `retailActive` and `services`. May update `state.flushes` in place.
function flush(state) if state.handle==0 then return false end if;state.flushes=state.flushes+1;emit(state,"flush",0,state.filename,"",state.handle);if not state.retailActive and state.services.flushFn!=void then state.services.flushFn(state.services.context,state.handle) end if;return true end function

// Log_Open
/// @param state Log state; accesses `variables`, `handle`, `filename`, `retailActive` and `services` and related fields. May update `state.handle`, `state.content` and `state.filename` in place.
/// @param filename Filename supplied to the configured loader or file service.
function open(state,filename)
  if libvars.variableValue(state.variables,"log","0")==0.0 then return false end if;if filename==void or len(filename)==0 then printMessage(state,PRT_MESSAGE,"openlog <filename>\n");return false end if;if state.handle!=0 then printMessage(state,PRT_ERROR,"log file "+state.filename+" is already opened\n");return false end if;emit(state,"open",0,filename,"",0);handle=1;if not state.retailActive then if state.services.openFn==void then return error(7843,"botlib log open service is missing") end if;handle=state.services.openFn(state.services.context,filename,"wb") end if;if handle==0 then printMessage(state,PRT_ERROR,"can't open the log file "+filename+"\n");return false end if;state.handle=handle;state.content="";state.filename=filename;if len(state.filename)>=MAX_LOGFILENAMESIZE then state.filename=decode(slice(bytes(state.filename),0,MAX_LOGFILENAMESIZE-1)) end if;printMessage(state,PRT_MESSAGE,"Opened log "+state.filename+"\n");return true
end function

// Log_Close
/// @param state Log state; accesses `handle`, `filename`, `retailActive` and `services`. May update `state.handle` in place.
function close(state)
  if state.handle==0 then return false end if;emit(state,"close",0,state.filename,"",state.handle);failed=0;if not state.retailActive then if state.services.closeFn==void then return error(7844,"botlib log close service is missing") end if;failed=state.services.closeFn(state.services.context,state.handle) end if;if failed!=0 then printMessage(state,PRT_ERROR,"can't close log file "+state.filename+"\n");return false end if;state.handle=0;printMessage(state,PRT_MESSAGE,"Closed log "+state.filename+"\n");return true
end function

// Log_Shutdown
/// @param state Log state; accesses `handle`.
function shutdown(state) if state.handle!=0 then return close(state) end if;return false end function
/// Record or dispatch `"write"` actions in `writeText`.
/// @param state Log state; accesses `handle`, `content`, `filename`, `retailActive` and `services`. May update `state.content` in place.
/// @param text Text to parse, format or deliver.
function writeText(state,text) if state.handle==0 then return false end if;state.content=state.content+text;emit(state,"write",0,state.filename,text,state.handle);if not state.retailActive then if state.services.writeFn==void then return error(7845,"botlib log write service is missing") end if;state.services.writeFn(state.services.context,state.handle,text) end if;flush(state);return true end function

// Log_Write
/// @param state Log state; accesses `handle`.
/// @param fmt Value passed as argument 1 to `bytes`.
/// @param args Array or byte sequence accessed at `argAt`.
function write(state,fmt,args) if state.handle==0 then return false end if;text=format(fmt,args);if text is error then return text end if;return writeText(state,text) end function
// Log_WriteTimeStamped
/// @param state Log state; accesses `handle`, `time` and `numwrites`. May update `state.numwrites` in place.
/// @param fmt Value passed as argument 1 to `bytes`.
/// @param args Array or byte sequence accessed at `argAt`.
function writeTimeStamped(state,fmt,args)
  if state.handle==0 then return false end if;text=format(fmt,args);if text is error then return text end if;seconds=numeric.trunc32(state.time);hundredths=numeric.trunc32(state.time*100.0)-seconds*100;hours=numeric.trunc32(state.time/3600.0);minutes=numeric.trunc32(state.time/60.0);prefix=str(state.numwrites)+"   "+pad(str(hours),2,false,true)+":"+pad(str(minutes),2,false,true)+":"+pad(str(seconds),2,false,true)+":"+pad(str(hundredths),2,false,true)+"   ";state.numwrites=state.numwrites+1;return writeText(state,prefix+text+"\r\n")
end function
// Log_FilePointer
/// @param state Log state; accesses `handle`.
function filePointer(state) return state.handle end function
// Log_Flush
/// @param state Log state; accesses `handle`, `flushes`, `filename`, `retailActive` and `services`. May update `state.flushes` in place.
function logFlush(state) return flush(state) end function
