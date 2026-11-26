// SPDX-License-Identifier: GPL-2.0-or-later
// Stateful minizip-compatible archive navigation for Baseq3's unzip.c API.
package mq3.format.unzip
import mq3.format.pk3 as pk3
import mq3.format.deflate as raw
import mq3.qcommon.headers as qcommonHeaders
import std.fs as fs

const UNZ_OK=qcommonHeaders.UNZ_OK
const UNZ_END_OF_LIST_OF_FILE=qcommonHeaders.UNZ_END_OF_LIST_OF_FILE
const UNZ_EOF=qcommonHeaders.UNZ_EOF
const UNZ_PARAMERROR=qcommonHeaders.UNZ_PARAMERROR
const UNZ_BADZIPFILE=qcommonHeaders.UNZ_BADZIPFILE
const UNZ_INTERNALERROR=qcommonHeaders.UNZ_INTERNALERROR
const UNZ_CRCERROR=qcommonHeaders.UNZ_CRCERROR
const UNZ_CASESENSITIVE=qcommonHeaders.UNZ_CASESENSITIVE
const UNZ_NOTCASESENSITIVE=qcommonHeaders.UNZ_NOTCASESENSITIVE
const UNZ_OSDEFAULTCASE=qcommonHeaders.UNZ_OSDEFAULTCASE
const Z_OK=0
const Z_STREAM_END=1
const Z_STREAM_ERROR=-2
const Z_DATA_ERROR=-3
const Z_BUF_ERROR=-5

/// TmUnz record for format.unzip, containing `tmSec`, `tmMin`, `tmHour`, `tmMday`, `tmMon`, `tmYear`.
struct TmUnz tmSec tmMin tmHour tmMday tmMon tmYear end struct
/// GlobalInfo record for format.unzip, containing `numberEntry`, `sizeComment`.
struct GlobalInfo numberEntry sizeComment end struct
/// FileInfo record for format.unzip, containing `version`, `versionNeeded`, `flag`, `compressionMethod`, `dosDate`, `crc`, and 12 further fields.
struct FileInfo version versionNeeded flag compressionMethod dosDate crc compressedSize uncompressedSize sizeFilename sizeFileExtra sizeFileComment diskNumStart internalFa externalFa tmuDate name extra comment end struct
/// LocalHeader record for format.unzip, containing `dataOffset`, `extra`.
struct LocalHeader dataOffset extra end struct
/// Handle record for format.unzip, containing `archive`, `current`, `currentOk`, `readData`, `readPosition`, `localExtra`, and 1 further fields.
struct Handle archive current currentOk readData readPosition localExtra closed end struct
/// InflateState record for format.unzip, containing `windowBits`, `initialized`, `totalIn`, `totalOut`, `output`, `dictionary`, and 1 further fields.
struct InflateState windowBits initialized totalIn totalOut output dictionary syncPoint end struct

/// Compute ascii fold in format.unzip; the normal completion returns `value`.
/// @param value Value used in `(value - 32)` and `(value >= 97)`.
function asciiFold(value) if value>=97 and value<=122 then return value-32 end if;return value end function
/// Compute compare bytes in format.unzip; the normal completion returns `0`.
/// @param left Left used in `bytes(left)`.
/// @param right Right used in `bytes(right)`.
/// @param fold Fold operand used by `compareBytes`; its reads are shown in the implementation.
function compareBytes(left,right,fold)
  a=bytes(left);b=bytes(right);count=len(a);if len(b)<count then count=len(b) end if
  for index=0 to count-1 x=a[index];y=b[index];if fold then x=asciiFold(x);y=asciiFold(y) end if;if x<y then return -1 end if;if x>y then return 1 end if end for
  if len(a)<len(b) then return -1 end if;if len(a)>len(b) then return 1 end if;return 0
end function
/// Return `mq3.format.unzip.compareBytes(left, right, true)` from `format.unzip.strcmpcasenosensitive_internal`.
/// @param left Left passed as `left` to `mq3.format.unzip.compareBytes`.
/// @param right Right passed as `right` to `mq3.format.unzip.compareBytes`.
function strcmpcasenosensitive_internal(left,right) return compareBytes(left,right,true) end function
/// Compute unz string file name compare in format.unzip; the normal completion returns `compareBytes(left, right, (caseSensitivity != UNZ_CASESENSITIVE))`.
/// @param left Left passed as `left` to `mq3.format.unzip.compareBytes`.
/// @param right Right passed as `right` to `mq3.format.unzip.compareBytes`.
/// @param caseSensitivity Case sensitivity used in `(caseSensitivity == UNZ_OSDEFAULTCASE)` and `(caseSensitivity != UNZ_CASESENSITIVE)`.
function unzStringFileNameCompare(left,right,caseSensitivity)
  if caseSensitivity==UNZ_OSDEFAULTCASE then caseSensitivity=UNZ_CASESENSITIVE end if
  return compareBytes(left,right,caseSensitivity!=UNZ_CASESENSITIVE)
end function

/// Compute unzlocal get byte in format.unzip; the normal completion returns `[UNZ_OK, data[offset], (offset + 1)]`.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
function unzlocal_getByte(data,offset) if offset<0 or offset>=len(data) then return [UNZ_EOF,0,offset] end if;return [UNZ_OK,data[offset],offset+1] end function
/// Compute unzlocal get short in format.unzip; the normal completion returns `[UNZ_OK, (data[offset] | (data[(offset + 1)] << 8)), (offset + 2)]`.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
function unzlocal_getShort(data,offset) if offset<0 or offset+2>len(data) then return [UNZ_EOF,0,offset] end if;return [UNZ_OK,data[offset]|(data[offset+1]<<8),offset+2] end function
/// Provide the unzlocal get long lookup table in format.unzip.
/// @param data Data used in `len(data)` and `data[offset]`.
/// @param offset Zero-based index into `data`.
function unzlocal_getLong(data,offset) if offset<0 or offset+4>len(data) then return [UNZ_EOF,0,offset] end if;return [UNZ_OK,data[offset]|(data[offset+1]<<8)|(data[offset+2]<<16)|(data[offset+3]<<24),offset+4] end function

/// Compute unzlocal search central dir in format.unzip; the normal completion returns `0`.
/// @param data Data used in `len(data)` and `typeof(data)`.
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

/// Apply `mq3.format.unzip.TmUnz` for unzlocal dos date to tmu date in format.unzip.
/// @param dosDate Dos date used in `(dosDate & 31)` and `(dosDate >> 5)`.
function unzlocal_DosDateToTmuDate(dosDate)
  date=(dosDate>>16)&0xffff
  return TmUnz(2*(dosDate&0x1f),(dosDate>>5)&0x3f,(dosDate>>11)&0x1f,date&0x1f,((date>>5)&0x0f)-1,((date>>9)&0x7f)+1980)
end function
/// Create `mq3.format.unzip.FileInfo` with version=entry.version; versionNeeded=entry.versionNeeded; flag=entry.flags; compressionMethod=entry.method; 14 further fields.
/// @param entry Record exposing `version`, `versionNeeded`, `flags`, `method`, `dosDate`, `checksum`, `compressedSize` and further fields.
function fileInfo(entry)
  return FileInfo(entry.version,entry.versionNeeded,entry.flags,entry.method,entry.dosDate,entry.checksum,entry.compressedSize,entry.size,len(bytes(entry.name)),len(entry.centralExtra),len(bytes(entry.comment)),entry.diskStart,entry.internalAttributes,entry.externalAttributes,unzlocal_DosDateToTmuDate(entry.dosDate),entry.name,entry.centralExtra,entry.comment)
end function
/// Compute format.unzip.valid as `((handle != void) and not handle.closed)`.
/// @param handle Record exposing `closed`.
function valid(handle) return handle!=void and not handle.closed end function
/// Compute current entry in format.unzip; the normal completion returns `handle.archive.entries[handle.current]`.
/// @param handle Record exposing `currentOk`, `current`, `archive`.
function currentEntry(handle) if not valid(handle) or not handle.currentOk or handle.current<0 or handle.current>=len(handle.archive.entries) then return void end if;return handle.archive.entries[handle.current] end function

/// Compute unz open in format.unzip; the normal completion returns `Handle(archive, - 1, false, void, 0, void, false)`.
/// @param path Path passed as `path` to `mq3.format.pk3.open`.
function unzOpen(path)
  archive=try(pk3.open(path));if archive is error then return void end if
  return Handle(archive,-1,false,void,0,void,false)
end function
/// Compute unz re open in format.unzip; the normal completion returns `result`.
/// @param path Path passed as `path` to `mq3.format.unzip.unzOpen`.
/// @param file Record exposing `currentOk`.
function unzReOpen(path,file)
  if not valid(file) then return void end if;result=unzOpen(path);if result==void then return void end if
  if file.currentOk then unzSetCurrentFileInfoPosition(result,unzGetCurrentFileInfoPosition(file)) end if
  return result
end function
/// Update `file.readData`, `file.localExtra`, `file.closed` in format.unzip; the normal completion returns `UNZ_OK`.
///
/// Direct state writes: `file.readData`, `file.localExtra`, `file.closed`.
/// @param file Updated in place: `readData`, `localExtra`, `closed`.
function unzClose(file) if not valid(file) then return UNZ_PARAMERROR end if;file.readData=void;file.localExtra=void;file.closed=true;return UNZ_OK end function
/// Compute unz get global info in format.unzip; the normal completion returns `GlobalInfo(len(file.archive.entries), len(bytes(file.archive.comment)))`.
/// @param file Record exposing `archive`.
function unzGetGlobalInfo(file) if not valid(file) then return void end if;return GlobalInfo(len(file.archive.entries),len(bytes(file.archive.comment))) end function
/// Compute unz get global comment in format.unzip; the normal completion returns `decode(data)`.
/// @param file Record exposing `archive`.
/// @param size Size used in `(size < 0)` and `(len(data) > size)`.
function unzGetGlobalComment(file,size) if not valid(file) or size<0 then return void end if;data=bytes(file.archive.comment);if len(data)>size then data=slice(data,0,size) end if;return decode(data) end function

/// Compute unzlocal get current file info internal in format.unzip; the normal completion returns `fileInfo(entry)`.
/// @param file Handle passed as `handle` to `mq3.format.unzip.currentEntry`.
function unzlocal_GetCurrentFileInfoInternal(file)
  entry=currentEntry(file);if entry==void then return void end if;return fileInfo(entry)
end function
/// Return `mq3.format.unzip.unzlocal_GetCurrentFileInfoInternal(file)` from `format.unzip.unzGetCurrentFileInfo`.
/// @param file File passed as `file` to `mq3.format.unzip.unzlocal_GetCurrentFileInfoInternal`.
function unzGetCurrentFileInfo(file) return unzlocal_GetCurrentFileInfoInternal(file) end function
/// Update `file.current`, `file.currentOk`, `file.readData` in format.unzip; the normal completion returns `UNZ_OK`.
///
/// Direct state writes: `file.current`, `file.currentOk`, `file.readData`.
/// @param file Record exposing `archive`. Updated in place: `current`, `currentOk`, `readData`.
function unzGoToFirstFile(file)
  if not valid(file) then return UNZ_PARAMERROR end if
  if len(file.archive.entries)==0 then file.current=-1;file.currentOk=false;return UNZ_END_OF_LIST_OF_FILE end if
  file.current=0;file.currentOk=true;file.readData=void;return UNZ_OK
end function
/// Update `file.current`, `file.readData` in format.unzip; the normal completion returns `UNZ_OK`.
///
/// Direct state writes: `file.current`, `file.readData`.
/// @param file Record exposing `currentOk`, `current`, `archive`. Updated in place: `current`, `readData`.
function unzGoToNextFile(file)
  if not valid(file) then return UNZ_PARAMERROR end if;if not file.currentOk or file.current+1>=len(file.archive.entries) then return UNZ_END_OF_LIST_OF_FILE end if
  file.current=file.current+1;file.readData=void;return UNZ_OK
end function
/// Compute unz get current file info position in format.unzip; the normal completion returns `(entry.centralOffset - file.archive.byteBeforeZip)`.
/// @param file Record exposing `archive`.
function unzGetCurrentFileInfoPosition(file)
  entry=currentEntry(file);if entry==void then return UNZ_PARAMERROR end if;return entry.centralOffset-file.archive.byteBeforeZip
end function
/// Update `file.current`, `file.currentOk`, `file.readData` in format.unzip; the normal completion returns `UNZ_OK`.
///
/// Direct state writes: `file.current`, `file.currentOk`, `file.readData`.
/// @param file Record exposing `archive`. Updated in place: `current`, `currentOk`, `readData`.
/// @param position Position used in `((file.archive.entries[index].centralOffset - file.archive.byteBeforeZip) == position)`.
function unzSetCurrentFileInfoPosition(file,position)
  if not valid(file) then return UNZ_PARAMERROR end if
  for index=0 to len(file.archive.entries)-1
    if file.archive.entries[index].centralOffset-file.archive.byteBeforeZip==position then file.current=index;file.currentOk=true;file.readData=void;return UNZ_OK end if
  end for
  file.currentOk=false;return UNZ_OK
end function
/// Update `file.current`, `file.currentOk`, `file.readData` in format.unzip; the normal completion returns `UNZ_END_OF_LIST_OF_FILE`.
///
/// Direct state writes: `file.current`, `file.currentOk`, `file.readData`.
/// @param file Record exposing `current`, `currentOk`, `archive`. Updated in place: `current`, `currentOk`, `readData`.
/// @param name Right passed as `right` to `mq3.format.unzip.unzStringFileNameCompare`.
/// @param caseSensitivity Case sensitivity passed as `caseSensitivity` to `mq3.format.unzip.unzStringFileNameCompare`.
function unzLocateFile(file,name,caseSensitivity)
  if not valid(file) or len(bytes(name))>=256 then return UNZ_PARAMERROR end if
  saved=file.current;savedOk=file.currentOk
  for index=0 to len(file.archive.entries)-1
    if unzStringFileNameCompare(file.archive.entries[index].name,name,caseSensitivity)==0 then file.current=index;file.currentOk=true;file.readData=void;return UNZ_OK end if
  end for
  file.current=saved;file.currentOk=savedOk;return UNZ_END_OF_LIST_OF_FILE
end function

/// Compute unzlocal check current file coherency header in format.unzip; the normal completion returns `LocalHeader(local[0], local[1])`.
/// @param file Record exposing `archive`.
function unzlocal_CheckCurrentFileCoherencyHeader(file)
  entry=currentEntry(file);if entry==void then return void end if
  local=try(pk3.localInfo(file.archive,entry));if local is error then return void end if
  return LocalHeader(local[0],local[1])
end function
/// Update `file.readData`, `file.readPosition`, `file.localExtra` in format.unzip; the normal completion returns `UNZ_OK`.
///
/// Direct state writes: `file.readData`, `file.readPosition`, `file.localExtra`.
/// @param file Record exposing `archive`. Updated in place: `readData`, `readPosition`, `localExtra`.
function unzOpenCurrentFile(file)
  entry=currentEntry(file);if entry==void then return UNZ_PARAMERROR end if
  local=unzlocal_CheckCurrentFileCoherencyHeader(file);if local==void then return UNZ_BADZIPFILE end if
  data=try(pk3.readEntry(file.archive,entry));if data is error then return UNZ_BADZIPFILE end if
  file.readData=data;file.readPosition=0;file.localExtra=local.extra;return UNZ_OK
end function
/// Update `file.readPosition` in format.unzip; the normal completion returns `result`.
///
/// Direct state writes: `file.readPosition`.
/// @param file Record exposing `readData`, `readPosition`. Updated in place: `readPosition`.
/// @param length Length used in `(length < 0)` and `(length > remaining)`.
function unzReadCurrentFile(file,length)
  if not valid(file) or file.readData==void or length<0 then return void end if
  remaining=len(file.readData)-file.readPosition;if length>remaining then length=remaining end if
  result=slice(file.readData,file.readPosition,length);file.readPosition=file.readPosition+length;return result
end function
/// Compute unztell in format.unzip; the normal completion returns `file.readPosition`.
/// @param file Record exposing `readData`, `readPosition`.
function unztell(file) if not valid(file) or file.readData==void then return UNZ_PARAMERROR end if;return file.readPosition end function
/// Compute unzeof in format.unzip; the normal completion returns `0`.
/// @param file Record exposing `readData`, `readPosition`.
function unzeof(file) if not valid(file) or file.readData==void then return UNZ_PARAMERROR end if;if file.readPosition==len(file.readData) then return 1 end if;return 0 end function
/// Compute unz get local extrafield in format.unzip; the normal completion returns `slice(file.localExtra, 0, count)`.
/// @param file Record exposing `readData`, `localExtra`.
/// @param length Length used in `(length < 0)` and `(length < count)`.
function unzGetLocalExtrafield(file,length)
  if not valid(file) or file.readData==void or length<0 then return void end if
  count=len(file.localExtra);if length<count then count=length end if;return slice(file.localExtra,0,count)
end function
/// Update `file.readData`, `file.readPosition`, `file.localExtra` in format.unzip; the normal completion returns `UNZ_OK`.
///
/// Direct state writes: `file.readData`, `file.readPosition`, `file.localExtra`.
/// @param file Record exposing `readData`. Updated in place: `readData`, `readPosition`, `localExtra`.
function unzCloseCurrentFile(file) if not valid(file) or file.readData==void then return UNZ_PARAMERROR end if;file.readData=void;file.readPosition=0;file.localExtra=void;return UNZ_OK end function

// The original file embeds zlib 1.1.3. These names own that internal surface;
// the port funnels all actual DEFLATE work through the bounded RFC1951 decoder.
/// @param adler Adler used in `(adler >> 16)` and `(adler & 65535)`.
/// @param data Data used in `(data == void)`.
function adler32(adler,data)
  if data==void then return 1 end if;s1=adler&0xffff;s2=(adler>>16)&0xffff
  for each value in data s1=(s1+value)%65521;s2=(s2+s1)%65521 end for;return (s2<<16)|s1
end function
/// Compute inflate init2 in format.unzip; the normal completion returns `InflateState(windowBits, true, 0, 0, void, void, false)`.
/// @param windowBits Initial `windowBits` field stored in the returned or constructed `mq3.format.unzip.InflateState` record.
function inflateInit2_(windowBits) if windowBits==0 or windowBits< -15 or windowBits>15 then return void end if;return InflateState(windowBits,true,0,0,void,void,false) end function
/// Return `mq3.format.unzip.inflateInit2_(15)` from `format.unzip.inflateInit_`.
function inflateInit_() return inflateInit2_(15) end function
/// Update `state.totalIn`, `state.totalOut`, `state.output`, `state.syncPoint` in format.unzip; the normal completion returns `Z_OK`.
///
/// Direct state writes: `state.totalIn`, `state.totalOut`, `state.output`, `state.syncPoint`.
/// @param state Record exposing `initialized`. Updated in place: `totalIn`, `totalOut`, `output`, `syncPoint`.
function inflateReset(state) if state==void or not state.initialized then return Z_STREAM_ERROR end if;state.totalIn=0;state.totalOut=0;state.output=void;state.syncPoint=false;return Z_OK end function
/// Update `state.initialized`, `state.output` in format.unzip; the normal completion returns `Z_OK`.
///
/// Direct state writes: `state.initialized`, `state.output`.
/// @param state Record exposing `initialized`. Updated in place: `initialized`, `output`.
function inflateEnd(state) if state==void or not state.initialized then return Z_STREAM_ERROR end if;state.initialized=false;state.output=void;return Z_OK end function
/// Update `state.totalIn`, `state.totalOut`, `state.output`, `state.syncPoint` in format.unzip; the normal completion returns `decoded`.
///
/// Direct state writes: `state.totalIn`, `state.totalOut`, `state.output`, `state.syncPoint`.
/// @param state Record exposing `initialized`. Updated in place: `totalIn`, `totalOut`, `output`, `syncPoint`.
/// @param data Data passed as `data` to `mq3.format.deflate.inflate`.
/// @param expectedSize Expected size passed as `expectedSize` to `mq3.format.deflate.inflate`.
function inflate(state,data,expectedSize)
  if state==void or not state.initialized then return void end if;decoded=try(raw.inflate(data,expectedSize));if decoded is error then return decoded end if
  state.totalIn=len(data);state.totalOut=len(decoded);state.output=decoded;state.syncPoint=true;return decoded
end function
/// Update `state.dictionary` in format.unzip; the normal completion returns `Z_OK`.
///
/// Direct state writes: `state.dictionary`.
/// @param state Record exposing `initialized`. Updated in place: `dictionary`.
/// @param dictionary Dictionary operand used by `inflateSetDictionary`; its reads are shown in the implementation.
function inflateSetDictionary(state,dictionary) if state==void or not state.initialized then return Z_STREAM_ERROR end if;state.dictionary=dictionary;return Z_OK end function
/// Update `state.syncPoint` in format.unzip; the normal completion returns `Z_DATA_ERROR`.
///
/// Direct state writes: `state.syncPoint`.
/// @param state Record exposing `initialized`. Updated in place: `syncPoint`.
/// @param data Sequence traversed as `value` by the loop in `inflateSync`.
function inflateSync(state,data)
  if state==void or not state.initialized then return Z_STREAM_ERROR end if
  marker=[0,0,255,255];matched=0
  for each value in data
    if value==marker[matched] then matched=matched+1 else if value==0 then matched=4-matched else matched=0 end if
    if matched==4 then state.syncPoint=true;return Z_OK end if
  end for
  return Z_DATA_ERROR
end function
/// Compute inflate sync point in format.unzip; the normal completion returns `0`.
/// @param state Record exposing `initialized`, `syncPoint`.
function inflateSyncPoint(state) if state==void or not state.initialized then return Z_STREAM_ERROR end if;if state.syncPoint then return 1 end if;return 0 end function
/// Return `mq3.format.unzip.inflateInit2_(windowBits)` from `format.unzip.inflate_blocks_new`.
/// @param windowBits Window bits passed as `windowBits` to `mq3.format.unzip.inflateInit2_`.
function inflate_blocks_new(windowBits) return inflateInit2_(windowBits) end function
/// Return `mq3.format.unzip.inflate(state, data, expectedSize)` from `format.unzip.inflate_blocks`.
/// @param state State passed as `state` to `mq3.format.unzip.inflate`.
/// @param data Data passed as `data` to `mq3.format.unzip.inflate`.
/// @param expectedSize Expected size passed as `expectedSize` to `mq3.format.unzip.inflate`.
function inflate_blocks(state,data,expectedSize) return inflate(state,data,expectedSize) end function
/// Return `mq3.format.unzip.inflateReset(state)` from `format.unzip.inflate_blocks_reset`.
/// @param state State passed as `state` to `mq3.format.unzip.inflateReset`.
function inflate_blocks_reset(state) return inflateReset(state) end function
/// Return `mq3.format.unzip.inflateEnd(state)` from `format.unzip.inflate_blocks_free`.
/// @param state State passed as `state` to `mq3.format.unzip.inflateEnd`.
function inflate_blocks_free(state) return inflateEnd(state) end function
/// Return `mq3.format.unzip.inflateSyncPoint(state)` from `format.unzip.inflate_blocks_sync_point`.
/// @param state State passed as `state` to `mq3.format.unzip.inflateSyncPoint`.
function inflate_blocks_sync_point(state) return inflateSyncPoint(state) end function
/// Return `mq3.format.unzip.inflateSetDictionary(state, dictionary)` from `format.unzip.inflate_set_dictionary`.
/// @param state State passed as `state` to `mq3.format.unzip.inflateSetDictionary`.
/// @param dictionary Dictionary passed as `dictionary` to `mq3.format.unzip.inflateSetDictionary`.
function inflate_set_dictionary(state,dictionary) return inflateSetDictionary(state,dictionary) end function
/// Return `mq3.format.unzip.inflateInit2_(windowBits)` from `format.unzip.inflate_codes_new`.
/// @param windowBits Window bits passed as `windowBits` to `mq3.format.unzip.inflateInit2_`.
function inflate_codes_new(windowBits) return inflateInit2_(windowBits) end function
/// Return `mq3.format.unzip.inflate(state, data, expectedSize)` from `format.unzip.inflate_codes`.
/// @param state State passed as `state` to `mq3.format.unzip.inflate`.
/// @param data Data passed as `data` to `mq3.format.unzip.inflate`.
/// @param expectedSize Expected size passed as `expectedSize` to `mq3.format.unzip.inflate`.
function inflate_codes(state,data,expectedSize) return inflate(state,data,expectedSize) end function
/// Return `mq3.format.unzip.inflateEnd(state)` from `format.unzip.inflate_codes_free`.
/// @param state State passed as `state` to `mq3.format.unzip.inflateEnd`.
function inflate_codes_free(state) return inflateEnd(state) end function
/// Return `mq3.format.unzip.inflate(state, data, expectedSize)` from `format.unzip.inflate_fast`.
/// @param state State passed as `state` to `mq3.format.unzip.inflate`.
/// @param data Data passed as `data` to `mq3.format.unzip.inflate`.
/// @param expectedSize Expected size passed as `expectedSize` to `mq3.format.unzip.inflate`.
function inflate_fast(state,data,expectedSize) return inflate(state,data,expectedSize) end function
/// Compute inflate flush in format.unzip; the normal completion returns `state.output`.
/// @param state Record exposing `initialized`, `output`.
function inflate_flush(state) if state==void or not state.initialized then return void end if;return state.output end function
/// Compute zcalloc in format.unzip; the normal completion returns `bytes((items * size), 0)`.
/// @param opaque Reserved argument; this implementation does not read its value.
/// @param items Items used in `(items < 0)` and `(items * size)`.
/// @param size Size used in `(size < 0)` and `(items * size)`.
function zcalloc(opaque,items,size) if items<0 or size<0 or items*size>268435456 then return void end if;return bytes(items*size,0) end function
/// Compute format.unzip.zcfree as `void`.
/// @param opaque Reserved argument; this implementation does not read its value.
/// @param value Reserved argument; this implementation does not read its value.
function zcfree(opaque,value) return void end function
