// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native MiniLang port of code/game/bg_lib.c, the Q3 VM libc subset.
package mq3.game.bg_lib

import mq3.compat.numeric as numeric
import mq3.compat.textnumbers as textnumbers
import mq3.compat.transcendental as transcendental

const ALT=1
const HEXPREFIX=2
const LADJUST=4
const LONGDBL=8
const LONGINT=16
const QUADINT=32
const SHORTINT=64
const ZEROPAD=128
const FPT=256
const PI=3.14159265358979323846

// These original symbols are compiled out by #if 0 in bg_lib.c.  They are
// retained below for source completeness, but are never selected by Q3_VM.
function disabledIf0Symbols() return ["floor","memset","memcpy","strncpy","sqrt","sin","cos","create_acostable","acos","atan2"] end function

struct ParseResult value next end struct
struct ScanResult count values next end struct
struct FormatResult text count end struct
struct RandomState seed end struct

function randomState(seed) return RandomState(numeric.i32(seed)) end function
function rawBytes(value) if typeof(value)=="bytes" then return value end if;return bytes(str(value)) end function
function cLength(value) data=rawBytes(value);index=0;while index<len(data) and data[index]!=0 index=index+1 end while;return index end function
function cloneBytes(value) result=bytes(len(value),0);if len(value)>0 then for index=0 to len(value)-1 result[index]=value[index] end for end if;return result end function
function byteString(value) return decode(value) end function
function character(code) value=bytes(1,0);value[0]=code&255;return decode(value) end function

// strlen
function strlen(string) return cLength(string) end function
// strcat
function strcat(destination,source) dest=cloneBytes(destination);src=rawBytes(source);at=cLength(dest);needed=at+cLength(src)+1;if len(dest)<needed then grown=bytes(needed,0);for index=0 to len(dest)-1 grown[index]=dest[index] end for;dest=grown end if;count=cLength(src);if count>0 then for index=0 to count-1 dest[at+index]=src[index] end for end if;dest[at+count]=0;return dest end function
// strcpy
function strcpy(destination,source) dest=cloneBytes(destination);src=rawBytes(source);count=cLength(src);if len(dest)<count+1 then dest=bytes(count+1,0) end if;if count>0 then for index=0 to count-1 dest[index]=src[index] end for end if;dest[count]=0;return dest end function
// strcmp
function strcmp(left,right) a=rawBytes(left);b=rawBytes(right);index=0;while index<len(a) and index<len(b) and a[index]!=0 and b[index]!=0 and a[index]==b[index] index=index+1 end while;av=0;bv=0;if index<len(a) then av=a[index] end if;if index<len(b) then bv=b[index] end if;return av-bv end function
// strchr -- a C pointer result is represented by its byte offset, or -1.
function strchr(string,code) data=rawBytes(string);index=0;while index<len(data) and data[index]!=0 if data[index]==(code&255) then return index end if;index=index+1 end while;return -1 end function
// strstr -- a C pointer result is represented by its byte offset, or -1.
function strstr(string,needle) data=rawBytes(string);query=rawBytes(needle);queryLength=cLength(query);index=0;while index<len(data) and data[index]!=0 matched=true;for offset=0 to queryLength-1 if index+offset>=len(data) or data[index+offset]!=query[offset] then matched=false;break end if end for;if matched then return index end if;index=index+1 end while;return -1 end function
// tolower
function tolower(code) if code>=65 and code<=90 then return code+32 end if;return code end function
// toupper
function toupper(code) if code>=97 and code<=122 then return code-32 end if;return code end function

// memmove; offsets make pointer aliasing explicit in the safe runtime.
function memmove(destination,destinationOffset,source,sourceOffset,count)
  if destinationOffset<0 or sourceOffset<0 or count<0 or destinationOffset+count>len(destination) or sourceOffset+count>len(source) then return error(7990,"bg_lib memmove range") end if
  if destination==source and destinationOffset>sourceOffset then i=count-1;while i>=0 destination[destinationOffset+i]=source[sourceOffset+i];i=i-1 end while else if count>0 then for i=0 to count-1 destination[destinationOffset+i]=source[sourceOffset+i] end for end if;return destination
end function

function skipSpace(data,index) while index<len(data) and data[index]<=32 index=index+1 end while;return index end function
function digit(code) return code>=48 and code<=57 end function
// atof
function atof(string)
  data=rawBytes(string);index=skipSpace(data,0);if index>=len(data) then return 0.0 end if;sign=1.0;if data[index]==43 then index=index+1 else if data[index]==45 then sign=-1.0;index=index+1 end if;value=0.0;c=0
  if index<len(data) then c=data[index] end if;if c!=46 then while index<len(data) c=data[index];index=index+1;if not digit(c) then break end if;value=numeric.f32(value*10.0+(c-48)) end while else index=index+1 end if
  if c==46 then fraction=0.1;while index<len(data) c=data[index];index=index+1;if not digit(c) then break end if;value=numeric.f32(value+(c-48)*fraction);fraction=fraction*0.1 end while end if;return numeric.f32(value*sign)
end function
// _atof
function _atof(string,start)
  data=rawBytes(string);index=skipSpace(data,start);if index>=len(data) then return ParseResult(0.0,index) end if;sign=1.0;if data[index]==43 then index=index+1 else if data[index]==45 then sign=-1.0;index=index+1 end if;value=0.0;c=48
  if index<len(data) and data[index]!=46 then while index<len(data) c=data[index];index=index+1;if not digit(c) then break end if;value=numeric.f32(value*10.0+(c-48)) end while end if
  if c==46 then fraction=0.1;while index<len(data) c=data[index];index=index+1;if not digit(c) then break end if;value=numeric.f32(value+(c-48)*fraction);fraction=fraction*0.1 end while end if;return ParseResult(numeric.f32(value*sign),index)
end function
// atoi
function atoi(string) return _atoi(string,0).value end function
// _atoi
function _atoi(string,start)
  data=rawBytes(string);index=skipSpace(data,start);if index>=len(data) then return ParseResult(0,index) end if;sign=1;if data[index]==43 then index=index+1 else if data[index]==45 then sign=-1;index=index+1 end if;value=0;while index<len(data) c=data[index];index=index+1;if not digit(c) then break end if;value=numeric.add32(numeric.mul32(value,10),c-48) end while;return ParseResult(numeric.i32(value*sign),index)
end function
// abs
function abs(value) if value<0 then return numeric.i32(0-value) end if;return value end function
// fabs
function fabs(value) if value<0.0 then return 0.0-value end if;return value end function

// srand / rand use the original 32-bit LCG.
function srand(state,seed) state.seed=numeric.i32(seed);return state end function
function rand(state) state.seed=numeric.add32(numeric.mul32(69069,state.seed),1);return state.seed&0x7fff end function

function exchange(values,left,right) saved=values[left];values[left]=values[right];values[right]=saved;return true end function
function medianIndex(values,a,b,c,compare) if compare(values[a],values[b])<0 then if compare(values[b],values[c])<0 then return b end if;if compare(values[a],values[c])<0 then return c end if;return a end if;if compare(values[b],values[c])>0 then return b end if;if compare(values[a],values[c])<0 then return a end if;return c end function
function insertionSort(values,low,count,compare) if count>1 then for current=low+1 to low+count-1 position=current;while position>low and compare(values[position-1],values[position])>0 exchange(values,position,position-1);position=position-1 end while end for end if;return values end function
function quickSortRange(values,low,count,compare)
  if count<7 then return insertionSort(values,low,count,compare) end if;middle=low+(count>>1);last=low+count-1
  if count>7 then first=low;if count>40 then distance=count>>3;first=medianIndex(values,first,first+distance,first+2*distance,compare);middle=medianIndex(values,middle-distance,middle,middle+distance,compare);last=medianIndex(values,last-2*distance,last-distance,last,compare) end if;middle=medianIndex(values,first,middle,last,compare) end if
  pivot=values[middle];less=[];equal=[];greater=[];for index=low to low+count-1 result=compare(values[index],pivot);if result<0 then less=less+[values[index]] else if result>0 then greater=greater+[values[index]] else equal=equal+[values[index]] end if end for;position=low;for each item in less values[position]=item;position=position+1 end for;for each item in equal values[position]=item;position=position+1 end for;for each item in greater values[position]=item;position=position+1 end for;if len(less)>1 then quickSortRange(values,low,len(less),compare) end if;if len(greater)>1 then quickSortRange(values,low+len(less)+len(equal),len(greater),compare) end if;return values
end function
// qsort -- native typed-array equivalent of the original byte/element API.
function qsort(values,count,compare) if count<0 or count>len(values) then return error(7990,"bg_lib qsort count") end if;return quickSortRange(values,0,count,compare) end function

function repeat(code,count) if count<=0 then return "" end if;data=bytes(count,code&255);return decode(data) end function
// AddInt
function AddInt(value,width,flags)
  negative=value<0;magnitude=value;if negative then magnitude=0-magnitude end if;digits="";while true digitValue=magnitude%10;digits=character(48+digitValue)+digits;magnitude=textnumbers.truncDouble32((magnitude-digitValue)/10.0);if magnitude==0 then break end if end while;if negative then digits="-"+digits end if;padding=width-len(bytes(digits));if padding<0 then padding=0 end if;pad=32;if (flags&ZEROPAD)!=0 then pad=48 end if;if (flags&LADJUST)!=0 then return digits+repeat(pad,padding) end if;return repeat(pad,padding)+digits
end function
// AddFloat
function AddFloat(value,width,precision)
  magnitude=numeric.f32(value);negative=magnitude<0.0;if negative then magnitude=numeric.f32(0.0-magnitude) end if;integer=textnumbers.truncDouble32(magnitude);digits=AddInt(integer,0,0);if negative then digits="-"+digits end if;padding=width-len(bytes(digits));if padding<0 then padding=0 end if;whole=repeat(32,padding)+digits;if precision<0 then precision=6 end if;if precision<=0 then return whole end if;fraction="";work=magnitude;for index=0 to precision-1 work=numeric.f32(work-textnumbers.truncDouble32(work));work=numeric.f32(work*10.0);digitValue=textnumbers.truncDouble32(work)%10;fraction=fraction+character(48+digitValue) end for;return whole+"."+fraction
end function
// AddString
function AddString(value,width,precision) if value is void then value="(null)";precision=-1 end if;text=str(value);length=len(bytes(text));if precision>=0 and length>precision then text=decode(slice(bytes(text),0,precision));length=precision end if;return text+repeat(32,width-length) end function

// vsprintf uses an array as the typed va_list boundary.
function vsprintf(format,arguments)
  data=bytes(format);at=0;argument=0;output="";while at<len(data) if data[at]!=37 then output=output+character(data[at]);at=at+1;continue end if;at=at+1;flags=0;width=0;precision=-1;ready=false;while not ready and at<len(data) code=data[at];at=at+1;if code==45 then flags=flags|LADJUST else if code==46 then precision=0;while at<len(data) and digit(data[at]) precision=precision*10+(data[at]-48);at=at+1 end while else if code==48 then flags=flags|ZEROPAD else if code>=49 and code<=57 then width=code-48;while at<len(data) and digit(data[at]) width=width*10+(data[at]-48);at=at+1 end while else ready=true;if code==99 then output=output+character(arguments[argument]);argument=argument+1 else if code==100 or code==105 then output=output+AddInt(arguments[argument],width,flags);argument=argument+1 else if code==102 then output=output+AddFloat(arguments[argument],width,precision);argument=argument+1 else if code==115 then output=output+AddString(arguments[argument],width,precision);argument=argument+1 else if code==37 then output=output+"%" else output=output+character(arguments[argument]);argument=argument+1 end if end if end while end while;return FormatResult(output,len(bytes(output)))
end function
// sscanf preserves the original implementation's count bug (always zero).
function sscanf(buffer,format)
  formatData=bytes(format);at=0;cursor=0;values=[];while at<len(formatData) if formatData[at]!=37 then at=at+1;continue end if;if at+1>=len(formatData) then break end if;command=formatData[at+1];at=at+2;if command==105 or command==100 or command==117 then result=_atoi(buffer,cursor);values=values+[result.value];cursor=result.next else if command==102 then result=_atof(buffer,cursor);values=values+[result.value];cursor=result.next end if end while;return ScanResult(0,values,cursor)
end function

// The following are complete callable translations of the original #if 0 block.
// floor (#if 0)
function floor(value) return textnumbers.truncDouble32(value+1073741824.0)-1073741824 end function
// memset (#if 0)
function memset(destination,offset,code,count) if offset<0 or count<0 or offset+count>len(destination) then return error(7990,"bg_lib memset range") end if;if count>0 then for index=0 to count-1 destination[offset+index]=code&255 end for end if;return destination end function
// memcpy (#if 0; original copies backwards)
function memcpy(destination,destinationOffset,source,sourceOffset,count) if destinationOffset<0 or sourceOffset<0 or count<0 or destinationOffset+count>len(destination) or sourceOffset+count>len(source) then return error(7990,"bg_lib memcpy range") end if;i=count-1;while i>=0 destination[destinationOffset+i]=source[sourceOffset+i];i=i-1 end while;return destination end function
// strncpy (#if 0)
function strncpy(destination,offset,source,count) if offset<0 or count<0 or offset+count>len(destination) then return error(7990,"bg_lib strncpy range") end if;data=rawBytes(source);index=0;while index<count and index<len(data) and data[index]!=0 destination[offset+index]=data[index];index=index+1 end while;while index<count destination[offset+index]=0;index=index+1 end while;return destination end function
// sqrt (#if 0)
function sqrt(value) if value<=0.0 then return 0.0 end if;guess=value/2.0;maxError=value*0.001;while true delta=guess*guess-value;guess=guess-delta/(2.0*guess);if delta<=maxError and delta>=0.0-maxError then break end if end while;return guess end function
// sin (#if 0)
function sin(value) return transcendental.sin(value) end function
// cos (#if 0)
function cos(value) return transcendental.cos(value) end function
// create_acostable (#if 0 and additionally block-commented in the original)
function create_acostable() result=array(1024,0.0);for index=0 to 1023 x=-1.0+index/512.0;result[index]=acos(x) end for;return result end function
// acos (#if 0)
function acos(value) if value<(-1.0) then value=-1.0 end if;if value>1.0 then value=1.0 end if;return transcendental.atan2(transcendental.sqrt(1.0-value*value),value) end function
// atan2 (#if 0)
function atan2(y,x) return transcendental.atan2(y,x) end function
// tan is active in Q3_VM and uses the active sine/cosine intrinsics.
function tan(value) return transcendental.sin(value)/transcendental.cos(value) end function
