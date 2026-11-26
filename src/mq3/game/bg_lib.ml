// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/game/bg_lib.c, the Q3 VM libc subset.
package mq3.game.bg_lib

import mq3.compat.numeric as numeric
import mq3.compat.textnumbers as textnumbers
import mq3.compat.transcendental as transcendental

/// Printf flag requesting the alternate representation.
const ALT=1
/// Printf flag requesting a hexadecimal radix prefix.
const HEXPREFIX=2
/// Printf flag requesting left justification.
const LADJUST=4
/// Printf flag indicating a long-double conversion.
const LONGDBL=8
/// Printf flag indicating a long-integer conversion.
const LONGINT=16
/// Printf flag indicating a quad-width integer conversion.
const QUADINT=32
/// Printf flag indicating a short-integer conversion.
const SHORTINT=64
/// Printf flag requesting zero padding instead of spaces.
const ZEROPAD=128
/// Printf flag indicating a floating-point conversion.
const FPT=256
/// Circle constant used by the shared angle and trigonometric helpers.
const PI=3.14159265358979323846

// These original symbols are compiled out by #if 0 in bg_lib.c.  They are
// retained below for source completeness, but are never selected by Q3_VM.
function disabledIf0Symbols() return ["floor","memset","memcpy","strncpy","sqrt","sin","cos","create_acostable","acos","atan2"] end function

/// `ParseResult` record for bg lib, containing `value` and `next`.
struct ParseResult
  /// Numeric value parsed from the input text.
  value
  /// Position immediately after the parsed input.
  next
end struct
/// `ScanResult` record for bg lib, containing `count`, `values` and `next`.
struct ScanResult
  /// Number of conversions successfully matched by the scanner.
  count
  /// Values captured by successful format conversions.
  values
  /// Position immediately after the consumed input.
  next
end struct
/// `FormatResult` record for bg lib, containing `text` and `count`.
struct FormatResult
  /// Formatted output text.
  text
  /// Number of characters produced by formatting.
  count
end struct
/// `RandomState` record for bg lib, containing `seed`.
struct RandomState
  /// Current pseudo-random generator state, updated whenever a random value is drawn.
  seed
end struct

/// Create a `mq3.game.bg_lib.RandomState` record, initializing `seed` as `numeric.i32(seed)`.
/// @param seed State used to initialize the deterministic random sequence.
function randomState(seed) return RandomState(numeric.i32(seed)) end function
/// Retain an existing byte buffer or encode the string representation of another value as bytes.
/// @param value Value passed as argument 1 to `typeof`.
function rawBytes(value) if typeof(value)=="bytes" then return value end if;return bytes(str(value)) end function
/// Apply `mq3.game.bg_lib.rawBytes` while evaluating `cLength`. Return paths include `index`.
/// @param value Value passed as argument 1 to `typeof`.
function cLength(value) data=rawBytes(value);index=0;while index<len(data) and data[index]!=0 index=index+1 end while;return index end function
/// Copy every byte into a newly allocated buffer of the same length.
/// @param value Array or byte sequence accessed at `index`.
function cloneBytes(value) result=bytes(len(value),0);if len(value)>0 then for index=0 to len(value)-1 result[index]=value[index] end for end if;return result end function
/// Return the result of `decode(value)` for `byteString`.
/// @param value Value passed as argument 1 to `decode`.
function byteString(value) return decode(value) end function
/// Encode the low eight bits of a character code as one byte of text.
/// @param code Value used by `character` in `value[0]=code&255`.
function character(code) value=bytes(1,0);value[0]=code&255;return decode(value) end function

// strlen
/// @param string Value passed as argument 1 to `typeof`.
function strlen(string) return cLength(string) end function
// strcat
/// @param destination Array or byte sequence accessed at `index`.
/// @param source Value passed as argument 1 to `typeof`.
function strcat(destination,source) dest=cloneBytes(destination);src=rawBytes(source);at=cLength(dest);needed=at+cLength(src)+1;if len(dest)<needed then grown=bytes(needed,0);for index=0 to len(dest)-1 grown[index]=dest[index] end for;dest=grown end if;count=cLength(src);if count>0 then for index=0 to count-1 dest[at+index]=src[index] end for end if;dest[at+count]=0;return dest end function
// strcpy
/// @param destination Array or byte sequence accessed at `index`.
/// @param source Value passed as argument 1 to `typeof`.
function strcpy(destination,source) dest=cloneBytes(destination);src=rawBytes(source);count=cLength(src);if len(dest)<count+1 then dest=bytes(count+1,0) end if;if count>0 then for index=0 to count-1 dest[index]=src[index] end for end if;dest[count]=0;return dest end function
// strcmp
/// @param left Value passed as argument 1 to `typeof`.
/// @param right Value passed as argument 1 to `typeof`.
function strcmp(left,right) a=rawBytes(left);b=rawBytes(right);index=0;while index<len(a) and index<len(b) and a[index]!=0 and b[index]!=0 and a[index]==b[index] index=index+1 end while;av=0;bv=0;if index<len(a) then av=a[index] end if;if index<len(b) then bv=b[index] end if;return av-bv end function
// strchr -- a C pointer result is represented by its byte offset, or -1.
/// @param string Value passed as argument 1 to `typeof`.
/// @param code Value used by `strchr` in `while index<len(data) and data[index]!=0 if data[index]==(code&255) then return index end if`.
function strchr(string,code) data=rawBytes(string);index=0;while index<len(data) and data[index]!=0 if data[index]==(code&255) then return index end if;index=index+1 end while;return -1 end function
// strstr -- a C pointer result is represented by its byte offset, or -1.
/// @param string Value passed as argument 1 to `typeof`.
/// @param needle Text or value to search for.
function strstr(string,needle) data=rawBytes(string);query=rawBytes(needle);queryLength=cLength(query);index=0;while index<len(data) and data[index]!=0 matched=true;for offset=0 to queryLength-1 if index+offset>=len(data) or data[index+offset]!=query[offset] then matched=false;break end if end for;if matched then return index end if;index=index+1 end while;return -1 end function
// tolower
/// @param code Operand used to evaluate the returned expression `code+32`.
function tolower(code) if code>=65 and code<=90 then return code+32 end if;return code end function
// toupper
/// @param code Operand used to evaluate the returned expression `code-32`.
function toupper(code) if code>=97 and code<=122 then return code-32 end if;return code end function

// memmove; offsets make pointer aliasing explicit in the safe runtime.
/// @param destination Array or byte sequence accessed at `destinationOffset+i`. Entries are written in place.
/// @param destinationOffset Value used by `memmove` in `if destinationOffset<0 or sourceOffset<0 or count<0 or destinationOffset+count>len(destination) or sourceOffset+...`.
/// @param source Array or byte sequence accessed at `sourceOffset+i`.
/// @param sourceOffset Value used by `memmove` in `if destinationOffset<0 or sourceOffset<0 or count<0 or destinationOffset+count>len(destination) or sourceOffset+...`.
/// @param count Number of entries or bytes processed by this call.
function memmove(destination,destinationOffset,source,sourceOffset,count)
  if destinationOffset<0 or sourceOffset<0 or count<0 or destinationOffset+count>len(destination) or sourceOffset+count>len(source) then return error(7990,"bg_lib memmove range") end if
  if destination==source and destinationOffset>sourceOffset then i=count-1;while i>=0 destination[destinationOffset+i]=source[sourceOffset+i];i=i-1 end while else if count>0 then for i=0 to count-1 destination[destinationOffset+i]=source[sourceOffset+i] end for end if;return destination
end function

/// Advance past consecutive character codes at or below ASCII space.
/// @param data Array or byte sequence accessed at `index`.
/// @param index Index of the entry to access.
function skipSpace(data,index) while index<len(data) and data[index]<=32 index=index+1 end while;return index end function
/// Test `code>=48 and code<=57` as the condition for `digit`.
/// @param code Operand used to evaluate the returned expression `code>=48 and code<=57`.
function digit(code) return code>=48 and code<=57 end function
// atof
/// @param string Value passed as argument 1 to `typeof`.
function atof(string)
  data=rawBytes(string);index=skipSpace(data,0);if index>=len(data) then return 0.0 end if;sign=1.0;if data[index]==43 then index=index+1 else if data[index]==45 then sign=-1.0;index=index+1 end if;value=0.0;c=0
  if index<len(data) then c=data[index] end if;if c!=46 then while index<len(data) c=data[index];index=index+1;if not digit(c) then break end if;value=numeric.f32(value*10.0+(c-48)) end while else index=index+1 end if
  if c==46 then fraction=0.1;while index<len(data) c=data[index];index=index+1;if not digit(c) then break end if;value=numeric.f32(value+(c-48)*fraction);fraction=fraction*0.1 end while end if;return numeric.f32(value*sign)
end function
// _atof
/// @param string Value passed as argument 1 to `typeof`.
/// @param start Index of the entry to access.
function _atof(string,start)
  data=rawBytes(string);index=skipSpace(data,start);if index>=len(data) then return ParseResult(0.0,index) end if;sign=1.0;if data[index]==43 then index=index+1 else if data[index]==45 then sign=-1.0;index=index+1 end if;value=0.0;c=48
  if index<len(data) and data[index]!=46 then while index<len(data) c=data[index];index=index+1;if not digit(c) then break end if;value=numeric.f32(value*10.0+(c-48)) end while end if
  if c==46 then fraction=0.1;while index<len(data) c=data[index];index=index+1;if not digit(c) then break end if;value=numeric.f32(value+(c-48)*fraction);fraction=fraction*0.1 end while end if;return ParseResult(numeric.f32(value*sign),index)
end function
// atoi
/// @param string Value passed as argument 1 to `typeof`.
function atoi(string) return _atoi(string,0).value end function
// _atoi
/// @param string Value passed as argument 1 to `typeof`.
/// @param start Index of the entry to access.
function _atoi(string,start)
  data=rawBytes(string);index=skipSpace(data,start);if index>=len(data) then return ParseResult(0,index) end if;sign=1;if data[index]==43 then index=index+1 else if data[index]==45 then sign=-1;index=index+1 end if;value=0;while index<len(data) c=data[index];index=index+1;if not digit(c) then break end if;value=numeric.add32(numeric.mul32(value,10),c-48) end while;return ParseResult(numeric.i32(value*sign),index)
end function
// abs
/// @param value Operand used to evaluate the returned expression `numeric.i32(0-value)`.
function abs(value) if value<0 then return numeric.i32(0-value) end if;return value end function
// fabs
/// @param value Operand used to evaluate the returned expression `0.0-value`.
function fabs(value) if value<0.0 then return 0.0-value end if;return value end function

// srand / rand use the original 32-bit LCG.
/// @param state Bg lib state; accesses `seed`. May update `state.seed` in place.
/// @param seed State used to initialize the deterministic random sequence.
function srand(state,seed) state.seed=numeric.i32(seed);return state end function
/// Set `state.seed` to `numeric.add32(numeric.mul32(69069,state.seed),1)` in `mq3.game.bg_lib.rand`. Return paths include `state.seed&0x7fff`.
/// @param state Bg lib state; accesses `seed`. May update `state.seed` in place.
function rand(state) state.seed=numeric.add32(numeric.mul32(69069,state.seed),1);return state.seed&0x7fff end function

/// Set `values[left]` to `values[right]` and `values[right]` to `saved` in `mq3.game.bg_lib.exchange`.
/// @param values Array or byte sequence accessed at `left` and `right`. Entries are written in place.
/// @param left Value used by `exchange` in `saved=values[left]`.
/// @param right Value used by `exchange` in `values[left]=values[right]`.
function exchange(values,left,right) saved=values[left];values[left]=values[right];values[right]=saved;return true end function
/// Choose the median of three array indices using the supplied comparison callback.
/// @param values Array or byte sequence accessed at `a`, `b` and `c`.
/// @param a Operand used to evaluate the returned expression `a`.
/// @param b Operand used to evaluate the returned expression `b`.
/// @param c Operand used to evaluate the returned expression `c`.
/// @param compare Value used by `medianIndex` in `if compare(values[a],values[b])<0 then if compare(values[b],values[c])<0 then return b end if`.
function medianIndex(values,a,b,c,compare) if compare(values[a],values[b])<0 then if compare(values[b],values[c])<0 then return b end if;if compare(values[a],values[c])<0 then return c end if;return a end if;if compare(values[b],values[c])>0 then return b end if;if compare(values[a],values[c])<0 then return a end if;return c end function
/// Apply `mq3.game.bg_lib.exchange` while evaluating `insertionSort`. Return paths include `values`.
/// @param values Array or byte sequence accessed at `left` and `right`. Entries are written in place.
/// @param low Value used by `insertionSort` in `if count>1 then for current=low+1 to low+count-1 position=current`.
/// @param count Number of entries or bytes processed by this call.
/// @param compare Value used by `insertionSort` in `while position>low and compare(values[position-1],values[position])>0 exchange(values,position,position-1)`.
function insertionSort(values,low,count,compare) if count>1 then for current=low+1 to low+count-1 position=current;while position>low and compare(values[position-1],values[position])>0 exchange(values,position,position-1);position=position-1 end while end for end if;return values end function
/// Set `values[position]` to `item` in `mq3.game.bg_lib.quickSortRange`. Return paths include `values`.
/// @param values Array or byte sequence accessed at `left` and `right`. Entries are written in place.
/// @param low Value used by `insertionSort` in `if count>1 then for current=low+1 to low+count-1 position=current`.
/// @param count Number of entries or bytes processed by this call.
/// @param compare Value used by `insertionSort` in `while position>low and compare(values[position-1],values[position])>0 exchange(values,position,position-1)`.
function quickSortRange(values,low,count,compare)
  if count<7 then return insertionSort(values,low,count,compare) end if;middle=low+(count>>1);last=low+count-1
  if count>7 then first=low;if count>40 then distance=count>>3;first=medianIndex(values,first,first+distance,first+2*distance,compare);middle=medianIndex(values,middle-distance,middle,middle+distance,compare);last=medianIndex(values,last-2*distance,last-distance,last,compare) end if;middle=medianIndex(values,first,middle,last,compare) end if
  pivot=values[middle];less=[];equal=[];greater=[];for index=low to low+count-1 result=compare(values[index],pivot);if result<0 then less=less+[values[index]] else if result>0 then greater=greater+[values[index]] else equal=equal+[values[index]] end if end for;position=low;for each item in less values[position]=item;position=position+1 end for;for each item in equal values[position]=item;position=position+1 end for;for each item in greater values[position]=item;position=position+1 end for;if len(less)>1 then quickSortRange(values,low,len(less),compare) end if;if len(greater)>1 then quickSortRange(values,low+len(less)+len(equal),len(greater),compare) end if;return values
end function
// qsort -- native typed-array equivalent of the original byte/element API.
/// @param values Array or byte sequence accessed at `left` and `right`. Entries are written in place.
/// @param count Number of entries or bytes processed by this call.
/// @param compare Value used by `insertionSort` in `while position>low and compare(values[position-1],values[position])>0 exchange(values,position,position-1)`.
function qsort(values,count,compare) if count<0 or count>len(values) then return error(7990,"bg_lib qsort count") end if;return quickSortRange(values,0,count,compare) end function

/// Build text containing the requested number of copies of one byte-valued character.
/// @param code Value used by `repeat` in `data=bytes(count,code&255)`.
/// @param count Number of entries or bytes processed by this call.
function repeat(code,count) if count<=0 then return "" end if;data=bytes(count,code&255);return decode(data) end function
// AddInt
/// @param value Value used by `AddInt` in `negative=value<0`.
/// @param width Value used by `AddInt` in `padding=width-len(bytes(digits))`.
/// @param flags Value used by `AddInt` in `if (flags&ZEROPAD)!=0 then pad=48 end if`.
function AddInt(value,width,flags)
  negative=value<0;magnitude=value;if negative then magnitude=0-magnitude end if;digits="";while true digitValue=magnitude%10;digits=character(48+digitValue)+digits;magnitude=textnumbers.truncDouble32((magnitude-digitValue)/10.0);if magnitude==0 then break end if end while;if negative then digits="-"+digits end if;padding=width-len(bytes(digits));if padding<0 then padding=0 end if;pad=32;if (flags&ZEROPAD)!=0 then pad=48 end if;if (flags&LADJUST)!=0 then return digits+repeat(pad,padding) end if;return repeat(pad,padding)+digits
end function
// AddFloat
/// @param value Value passed as argument 1 to `mq3.compat.numeric.f32`.
/// @param width Value used by `AddFloat` in `padding=width-len(bytes(digits))`.
/// @param precision Value used by `AddFloat` in `if precision<0 then precision=6 end if`.
function AddFloat(value,width,precision)
  magnitude=numeric.f32(value);negative=magnitude<0.0;if negative then magnitude=numeric.f32(0.0-magnitude) end if;integer=textnumbers.truncDouble32(magnitude);digits=AddInt(integer,0,0);if negative then digits="-"+digits end if;padding=width-len(bytes(digits));if padding<0 then padding=0 end if;whole=repeat(32,padding)+digits;if precision<0 then precision=6 end if;if precision<=0 then return whole end if;fraction="";work=magnitude;for index=0 to precision-1 work=numeric.f32(work-textnumbers.truncDouble32(work));work=numeric.f32(work*10.0);digitValue=textnumbers.truncDouble32(work)%10;fraction=fraction+character(48+digitValue) end for;return whole+"."+fraction
end function
// AddString
/// @param value Value passed as argument 1 to `str`.
/// @param width Operand used to evaluate the returned expression `text+repeat(32,width-length)`.
/// @param precision Value passed as argument 3 to `slice`.
function AddString(value,width,precision) if value is void then value="(null)";precision=-1 end if;text=str(value);length=len(bytes(text));if precision>=0 and length>precision then text=decode(slice(bytes(text),0,precision));length=precision end if;return text+repeat(32,width-length) end function

// vsprintf uses an array as the typed va_list boundary.
/// @param format C-style format string.
/// @param arguments Ordered arguments consumed by the call or formatter.
function vsprintf(format,arguments)
  data=bytes(format);at=0;argument=0;output="";while at<len(data) if data[at]!=37 then output=output+character(data[at]);at=at+1;continue end if;at=at+1;flags=0;width=0;precision=-1;ready=false;while not ready and at<len(data) code=data[at];at=at+1;if code==45 then flags=flags|LADJUST else if code==46 then precision=0;while at<len(data) and digit(data[at]) precision=precision*10+(data[at]-48);at=at+1 end while else if code==48 then flags=flags|ZEROPAD else if code>=49 and code<=57 then width=code-48;while at<len(data) and digit(data[at]) width=width*10+(data[at]-48);at=at+1 end while else ready=true;if code==99 then output=output+character(arguments[argument]);argument=argument+1 else if code==100 or code==105 then output=output+AddInt(arguments[argument],width,flags);argument=argument+1 else if code==102 then output=output+AddFloat(arguments[argument],width,precision);argument=argument+1 else if code==115 then output=output+AddString(arguments[argument],width,precision);argument=argument+1 else if code==37 then output=output+"%" else output=output+character(arguments[argument]);argument=argument+1 end if end if end while end while;return FormatResult(output,len(bytes(output)))
end function
// sscanf preserves the original implementation's count bug (always zero).
/// @param buffer Value passed as argument 1 to `typeof`.
/// @param format C-style format string.
function sscanf(buffer,format)
  formatData=bytes(format);at=0;cursor=0;values=[];while at<len(formatData) if formatData[at]!=37 then at=at+1;continue end if;if at+1>=len(formatData) then break end if;command=formatData[at+1];at=at+2;if command==105 or command==100 or command==117 then result=_atoi(buffer,cursor);values=values+[result.value];cursor=result.next else if command==102 then result=_atof(buffer,cursor);values=values+[result.value];cursor=result.next end if end while;return ScanResult(0,values,cursor)
end function

// The following are complete callable translations of the original #if 0 block.
// floor (#if 0)
/// @param value Operand used to evaluate the returned expression `textnumbers.truncDouble32(value+1073741824.0)-1073741824`.
function floor(value) return textnumbers.truncDouble32(value+1073741824.0)-1073741824 end function
// memset (#if 0)
/// @param destination Array or byte sequence accessed at `offset+index`. Entries are written in place.
/// @param offset Offset into the buffer or sequence used by this operation.
/// @param code Value used by `memset` in `if count>0 then for index=0 to count-1 destination[offset+index]=code&255 end for end if`.
/// @param count Number of entries or bytes processed by this call.
function memset(destination,offset,code,count) if offset<0 or count<0 or offset+count>len(destination) then return error(7990,"bg_lib memset range") end if;if count>0 then for index=0 to count-1 destination[offset+index]=code&255 end for end if;return destination end function
// memcpy (#if 0; original copies backwards)
/// @param destination Array or byte sequence accessed at `destinationOffset+i`. Entries are written in place.
/// @param destinationOffset Value used by `memcpy` in `if destinationOffset<0 or sourceOffset<0 or count<0 or destinationOffset+count>len(destination) or sourceOffset+...`.
/// @param source Array or byte sequence accessed at `sourceOffset+i`.
/// @param sourceOffset Value used by `memcpy` in `if destinationOffset<0 or sourceOffset<0 or count<0 or destinationOffset+count>len(destination) or sourceOffset+...`.
/// @param count Number of entries or bytes processed by this call.
function memcpy(destination,destinationOffset,source,sourceOffset,count) if destinationOffset<0 or sourceOffset<0 or count<0 or destinationOffset+count>len(destination) or sourceOffset+count>len(source) then return error(7990,"bg_lib memcpy range") end if;i=count-1;while i>=0 destination[destinationOffset+i]=source[sourceOffset+i];i=i-1 end while;return destination end function
// strncpy (#if 0)
/// @param destination Array or byte sequence accessed at `offset+index`. Entries are written in place.
/// @param offset Offset into the buffer or sequence used by this operation.
/// @param source Value passed as argument 1 to `typeof`.
/// @param count Number of entries or bytes processed by this call.
function strncpy(destination,offset,source,count) if offset<0 or count<0 or offset+count>len(destination) then return error(7990,"bg_lib strncpy range") end if;data=rawBytes(source);index=0;while index<count and index<len(data) and data[index]!=0 destination[offset+index]=data[index];index=index+1 end while;while index<count destination[offset+index]=0;index=index+1 end while;return destination end function
// sqrt (#if 0)
/// @param value Value used by `sqrt` in `if value<=0.0 then return 0.0 end if`.
function sqrt(value) if value<=0.0 then return 0.0 end if;guess=value/2.0;maxError=value*0.001;while true delta=guess*guess-value;guess=guess-delta/(2.0*guess);if delta<=maxError and delta>=0.0-maxError then break end if end while;return guess end function
// sin (#if 0)
/// @param value Value passed as argument 1 to `mq3.compat.transcendental.sin`.
function sin(value) return transcendental.sin(value) end function
// cos (#if 0)
/// @param value Value passed as argument 1 to `mq3.compat.transcendental.cos`.
function cos(value) return transcendental.cos(value) end function
// create_acostable (#if 0 and additionally block-commented in the original)
function create_acostable() result=array(1024,0.0);for index=0 to 1023 x=-1.0+index/512.0;result[index]=acos(x) end for;return result end function
// acos (#if 0)
/// @param value Value passed as argument 2 to `mq3.compat.transcendental.atan2`.
function acos(value) if value<(-1.0) then value=-1.0 end if;if value>1.0 then value=1.0 end if;return transcendental.atan2(transcendental.sqrt(1.0-value*value),value) end function
// atan2 (#if 0)
/// @param y Value passed as argument 1 to `mq3.compat.transcendental.atan2`.
/// @param x Value passed as argument 2 to `mq3.compat.transcendental.atan2`.
function atan2(y,x) return transcendental.atan2(y,x) end function
// tan is active in Q3_VM and uses the active sine/cosine intrinsics.
/// @param value Value passed as argument 1 to `mq3.compat.transcendental.sin`.
function tan(value) return transcendental.sin(value)/transcendental.cos(value) end function
