// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful minizip-compatible archive navigation for Baseq3's unzip.c API.
package mq3.format.unzip
import mq3.format.pk3 as pk3
import mq3.format.deflate as raw
import std.fs as fs

const UNZ_OK=0
const UNZ_END_OF_LIST_OF_FILE=-100
const UNZ_EOF=0
const UNZ_PARAMERROR=-102
const UNZ_BADZIPFILE=-103
const UNZ_INTERNALERROR=-104
const UNZ_CRCERROR=-105
const UNZ_CASESENSITIVE=1
const UNZ_NOTCASESENSITIVE=2
const UNZ_OSDEFAULTCASE=0
const Z_OK=0
const Z_STREAM_END=1
const Z_STREAM_ERROR=-2
const Z_DATA_ERROR=-3
const Z_BUF_ERROR=-5

struct TmUnz tmSec tmMin tmHour tmMday tmMon tmYear end struct
struct GlobalInfo numberEntry sizeComment end struct
struct FileInfo version versionNeeded flag compressionMethod dosDate crc compressedSize uncompressedSize sizeFilename sizeFileExtra sizeFileComment diskNumStart internalFa externalFa tmuDate name extra comment end struct
struct LocalHeader dataOffset extra end struct
struct Handle archive current currentOk readData readPosition localExtra closed end struct
struct InflateState windowBits initialized totalIn totalOut output dictionary syncPoint end struct

function asciiFold(value) if value>=97 and value<=122 then return value-32 end if;return value end function
function compareBytes(left,right,fold)
  a=bytes(left);b=bytes(right);count=len(a);if len(b)<count then count=len(b) end if
  for index=0 to count-1 x=a[index];y=b[index];if fold then x=asciiFold(x);y=asciiFold(y) end if;if x<y then return -1 end if;if x>y then return 1 end if end for
  if len(a)<len(b) then return -1 end if;if len(a)>len(b) then return 1 end if;return 0
end function
function strcmpcasenosensitive_internal(left,right) return compareBytes(left,right,true) end function
function unzStringFileNameCompare(left,right,caseSensitivity)
  if caseSensitivity==UNZ_OSDEFAULTCASE then caseSensitivity=UNZ_CASESENSITIVE end if
  return compareBytes(left,right,caseSensitivity!=UNZ_CASESENSITIVE)
end function

function unzlocal_getByte(data,offset) if offset<0 or offset>=len(data) then return [UNZ_EOF,0,offset] end if;return [UNZ_OK,data[offset],offset+1] end function
function unzlocal_getShort(data,offset) if offset<0 or offset+2>len(data) then return [UNZ_EOF,0,offset] end if;return [UNZ_OK,data[offset]|(data[offset+1]<<8),offset+2] end function
function unzlocal_getLong(data,offset) if offset<0 or offset+4>len(data) then return [UNZ_EOF,0,offset] end if;return [UNZ_OK,data[offset]|(data[offset+1]<<8)|(data[offset+2]<<16)|(data[offset+3]<<24),offset+4] end function

function unzlocal_SearchCentralDir(data)
  if typeof(data)=="string" then data=fs.readAllBytes(data) end if
  if len(data)<22 then return 0 end if
  low=len(data)-65557;if low<0 then low=0 end if;position=len(data)-22
  while position>=low
    if data[position]==0x50 and data[position+1]==0x4b and data[position+2]==0x05 and data[position+3]==0x06 then return position end if
    position=position-1
  end while
  return 0
end function

function unzlocal_DosDateToTmuDate(dosDate)
  date=(dosDate>>16)&0xffff
  return TmUnz(2*(dosDate&0x1f),(dosDate>>5)&0x3f,(dosDate>>11)&0x1f,date&0x1f,((date>>5)&0x0f)-1,((date>>9)&0x7f)+1980)
end function
function fileInfo(entry)
  return FileInfo(entry.version,entry.versionNeeded,entry.flags,entry.method,entry.dosDate,entry.checksum,entry.compressedSize,entry.size,len(bytes(entry.name)),len(entry.centralExtra),len(bytes(entry.comment)),entry.diskStart,entry.internalAttributes,entry.externalAttributes,unzlocal_DosDateToTmuDate(entry.dosDate),entry.name,entry.centralExtra,entry.comment)
end function
function valid(handle) return handle!=void and not handle.closed end function
function currentEntry(handle) if not valid(handle) or not handle.currentOk or handle.current<0 or handle.current>=len(handle.archive.entries) then return void end if;return handle.archive.entries[handle.current] end function

function unzOpen(path)
  archive=try(pk3.open(path));if archive is error then return void end if
  return Handle(archive,-1,false,void,0,void,false)
end function
function unzReOpen(path,file)
  if not valid(file) then return void end if;result=unzOpen(path);if result==void then return void end if
  if file.currentOk then unzSetCurrentFileInfoPosition(result,unzGetCurrentFileInfoPosition(file)) end if
  return result
end function
function unzClose(file) if not valid(file) then return UNZ_PARAMERROR end if;file.readData=void;file.localExtra=void;file.closed=true;return UNZ_OK end function
function unzGetGlobalInfo(file) if not valid(file) then return void end if;return GlobalInfo(len(file.archive.entries),len(bytes(file.archive.comment))) end function
function unzGetGlobalComment(file,size) if not valid(file) or size<0 then return void end if;data=bytes(file.archive.comment);if len(data)>size then data=slice(data,0,size) end if;return decode(data) end function

function unzlocal_GetCurrentFileInfoInternal(file)
  entry=currentEntry(file);if entry==void then return void end if;return fileInfo(entry)
end function
function unzGetCurrentFileInfo(file) return unzlocal_GetCurrentFileInfoInternal(file) end function
function unzGoToFirstFile(file)
  if not valid(file) then return UNZ_PARAMERROR end if
  if len(file.archive.entries)==0 then file.current=-1;file.currentOk=false;return UNZ_END_OF_LIST_OF_FILE end if
  file.current=0;file.currentOk=true;file.readData=void;return UNZ_OK
end function
function unzGoToNextFile(file)
  if not valid(file) then return UNZ_PARAMERROR end if;if not file.currentOk or file.current+1>=len(file.archive.entries) then return UNZ_END_OF_LIST_OF_FILE end if
  file.current=file.current+1;file.readData=void;return UNZ_OK
end function
function unzGetCurrentFileInfoPosition(file)
  entry=currentEntry(file);if entry==void then return UNZ_PARAMERROR end if;return entry.centralOffset-file.archive.byteBeforeZip
end function
function unzSetCurrentFileInfoPosition(file,position)
  if not valid(file) then return UNZ_PARAMERROR end if
  for index=0 to len(file.archive.entries)-1
    if file.archive.entries[index].centralOffset-file.archive.byteBeforeZip==position then file.current=index;file.currentOk=true;file.readData=void;return UNZ_OK end if
  end for
  file.currentOk=false;return UNZ_OK
end function
function unzLocateFile(file,name,caseSensitivity)
  if not valid(file) or len(bytes(name))>=256 then return UNZ_PARAMERROR end if
  saved=file.current;savedOk=file.currentOk
  for index=0 to len(file.archive.entries)-1
    if unzStringFileNameCompare(file.archive.entries[index].name,name,caseSensitivity)==0 then file.current=index;file.currentOk=true;file.readData=void;return UNZ_OK end if
  end for
  file.current=saved;file.currentOk=savedOk;return UNZ_END_OF_LIST_OF_FILE
end function

function unzlocal_CheckCurrentFileCoherencyHeader(file)
  entry=currentEntry(file);if entry==void then return void end if
  local=try(pk3.localInfo(file.archive,entry));if local is error then return void end if
  return LocalHeader(local[0],local[1])
end function
function unzOpenCurrentFile(file)
  entry=currentEntry(file);if entry==void then return UNZ_PARAMERROR end if
  local=unzlocal_CheckCurrentFileCoherencyHeader(file);if local==void then return UNZ_BADZIPFILE end if
  data=try(pk3.readEntry(file.archive,entry));if data is error then return UNZ_BADZIPFILE end if
  file.readData=data;file.readPosition=0;file.localExtra=local.extra;return UNZ_OK
end function
function unzReadCurrentFile(file,length)
  if not valid(file) or file.readData==void or length<0 then return void end if
  remaining=len(file.readData)-file.readPosition;if length>remaining then length=remaining end if
  result=slice(file.readData,file.readPosition,length);file.readPosition=file.readPosition+length;return result
end function
function unztell(file) if not valid(file) or file.readData==void then return UNZ_PARAMERROR end if;return file.readPosition end function
function unzeof(file) if not valid(file) or file.readData==void then return UNZ_PARAMERROR end if;if file.readPosition==len(file.readData) then return 1 end if;return 0 end function
function unzGetLocalExtrafield(file,length)
  if not valid(file) or file.readData==void or length<0 then return void end if
  count=len(file.localExtra);if length<count then count=length end if;return slice(file.localExtra,0,count)
end function
function unzCloseCurrentFile(file) if not valid(file) or file.readData==void then return UNZ_PARAMERROR end if;file.readData=void;file.readPosition=0;file.localExtra=void;return UNZ_OK end function

// The original file embeds zlib 1.1.3. These names own that internal surface;
// the port funnels all actual DEFLATE work through the bounded RFC1951 decoder.
function adler32(adler,data)
  if data==void then return 1 end if;s1=adler&0xffff;s2=(adler>>16)&0xffff
  for each value in data s1=(s1+value)%65521;s2=(s2+s1)%65521 end for;return (s2<<16)|s1
end function
function inflateInit2_(windowBits) if windowBits==0 or windowBits< -15 or windowBits>15 then return void end if;return InflateState(windowBits,true,0,0,void,void,false) end function
function inflateInit_() return inflateInit2_(15) end function
function inflateReset(state) if state==void or not state.initialized then return Z_STREAM_ERROR end if;state.totalIn=0;state.totalOut=0;state.output=void;state.syncPoint=false;return Z_OK end function
function inflateEnd(state) if state==void or not state.initialized then return Z_STREAM_ERROR end if;state.initialized=false;state.output=void;return Z_OK end function
function inflate(state,data,expectedSize)
  if state==void or not state.initialized then return void end if;decoded=try(raw.inflate(data,expectedSize));if decoded is error then return decoded end if
  state.totalIn=len(data);state.totalOut=len(decoded);state.output=decoded;state.syncPoint=true;return decoded
end function
function inflateSetDictionary(state,dictionary) if state==void or not state.initialized then return Z_STREAM_ERROR end if;state.dictionary=dictionary;return Z_OK end function
function inflateSync(state,data)
  if state==void or not state.initialized then return Z_STREAM_ERROR end if
  marker=[0,0,255,255];matched=0
  for each value in data
    if value==marker[matched] then matched=matched+1 else if value==0 then matched=4-matched else matched=0 end if
    if matched==4 then state.syncPoint=true;return Z_OK end if
  end for
  return Z_DATA_ERROR
end function
function inflateSyncPoint(state) if state==void or not state.initialized then return Z_STREAM_ERROR end if;if state.syncPoint then return 1 end if;return 0 end function
function inflate_blocks_new(windowBits) return inflateInit2_(windowBits) end function
function inflate_blocks(state,data,expectedSize) return inflate(state,data,expectedSize) end function
function inflate_blocks_reset(state) return inflateReset(state) end function
function inflate_blocks_free(state) return inflateEnd(state) end function
function inflate_blocks_sync_point(state) return inflateSyncPoint(state) end function
function inflate_set_dictionary(state,dictionary) return inflateSetDictionary(state,dictionary) end function
function inflate_codes_new(windowBits) return inflateInit2_(windowBits) end function
function inflate_codes(state,data,expectedSize) return inflate(state,data,expectedSize) end function
function inflate_codes_free(state) return inflateEnd(state) end function
function inflate_fast(state,data,expectedSize) return inflate(state,data,expectedSize) end function
function inflate_flush(state) if state==void or not state.initialized then return void end if;return state.output end function
function zcalloc(opaque,items,size) if items<0 or size<0 or items*size>268435456 then return void end if;return bytes(items*size,0) end function
function zcfree(opaque,value) return void end function
