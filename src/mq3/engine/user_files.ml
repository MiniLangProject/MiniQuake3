// SPDX-License-Identifier: GPL-2.0-or-later
// Read-only PK3 assets plus an explicitly selected per-user writable overlay.
// The native boundary validates paths and atomically replaces disk contents.
package mq3.engine.user_files
import mq3.format.pk3 as pk3
import std.fs as fs
import mq3.vm.syscall_common as common
const MAX_HANDLES=64
const MAX_BYTES=67108864
/// Cursor record for engine.user_files, containing `data`, `offset`, `size`, `mode`, `path`, `dirty`.
struct Cursor data offset size mode path dirty end struct
/// Store record for engine.user_files, containing `archive`, `root`, `files`.
struct Store archive root files end struct
/// Encode the selected MiniQuake3 writable user directory as UTF-8.
/// @param output Writable UTF-8 destination buffer.
/// @param capacity Destination capacity in bytes.
/// @returns The encoded byte length, or a negative value when the directory or output cannot be resolved.
extern function defaultRootNative(output as bytes,capacity as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_default_root" returns i32
/// Resolve a validated game-relative filename beneath the selected writable user directory.
/// @param root UTF-8 root-directory bytes.
/// @param rootLength Root-directory byte length.
/// @param name UTF-8 relative qpath bytes.
/// @param nameLength Relative qpath byte length.
/// @param output Writable UTF-8 resolved-path buffer.
/// @param capacity Resolved-path buffer capacity in bytes.
/// @returns The encoded resolved-path byte length, or a negative value for an invalid/inaccessible path or insufficient output.
extern function resolveNative(root as ptr,rootLength as i32,name as ptr,nameLength as i32,output as bytes,capacity as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_resolve" returns i32
/// Atomically replace a validated user file through a temporary file in the same directory.
/// @param root UTF-8 writable root-directory bytes.
/// @param rootLength Root byte length.
/// @param name UTF-8 game-relative filename bytes.
/// @param nameLength Filename byte length.
/// @param data Payload byte address; may be null for an empty payload.
/// @param length Payload length, from zero through 64 MiB.
/// @returns Nonzero after a successful atomic replacement; zero on path, size, or I/O failure.
extern function writeNative(root as ptr,rootLength as i32,name as ptr,nameLength as i32,data as ptr,length as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_write_atomic" returns i32
/// Inspect a validated regular user file while rejecting directories, reparse points, and oversized files.
/// @param root UTF-8 writable root-directory bytes.
/// @param rootLength Root byte length.
/// @param name UTF-8 relative filename bytes.
/// @param nameLength Filename byte length.
/// @returns File size in bytes; -2 means absent, and -1 means invalid, inaccessible, or larger than 64 MiB.
extern function sizeNative(root as ptr,rootLength as i32,name as ptr,nameLength as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_size" returns i32
/// Compare two validated user qpaths case-insensitively, resolving existing long-name aliases when needed.
/// @param root UTF-8 writable root-directory bytes.
/// @param rootLength Root byte length.
/// @param first First UTF-8 relative filename.
/// @param firstLength First filename byte length.
/// @param second Second UTF-8 relative filename.
/// @param secondLength Second filename byte length.
/// @returns 1 for the same path, 0 for distinct/unresolved paths, or -1 when either qpath is invalid.
extern function samePathNative(root as ptr,rootLength as i32,first as ptr,firstLength as i32,second as ptr,secondLength as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_same_path" returns i32
/// Compute same path in engine.user_files; the normal completion returns `samePathNative(nativeBytesPtr(root), len(root), nativeBytesPtr(a), len(a), nativeBytesPtr(b), len(b))`.
/// @param store Record exposing `root`.
/// @param first First used in `bytes(first)`.
/// @param second Second used in `bytes(second)`.
function samePath(store,first,second)
  root=bytes(store.root);a=bytes(first);b=bytes(second)
  return samePathNative(nativeBytesPtr(root),len(root),nativeBytesPtr(a),len(a),nativeBytesPtr(b),len(b))
end function
/// Compute default root in engine.user_files; the normal completion returns `decode(slice(output, 0, count))`.
///
/// Validation failures include `Cannot resolve MiniQuake3 user directory`.
function defaultRoot()
  output=bytes(98304,0);count=defaultRootNative(output,len(output))
  if count<0 or count>=len(output) then return error(7793,"Cannot resolve MiniQuake3 user directory") end if
  return decode(slice(output,0,count))
end function
/// Create `mq3.engine.user_files.Store` with archive=archive; root=root; files=array(MAX_HANDLES, void).
/// @param archive Initial `archive` field stored in the returned or constructed `mq3.engine.user_files.Store` record.
/// @param root Initial `root` field stored in the returned or constructed `mq3.engine.user_files.Store` record.
function create(archive,root) return Store(archive,root,array(MAX_HANDLES,void)) end function
// An absent user file is void; invalid/inaccessible files are errors, not
// archive fallbacks. In particular append never copies an archive asset.
/// @param store Record exposing `root`.
/// @param name Name used in `bytes(name)` and `("Cannot resolve user file: " + name)`.
function readUser(store,name)
  if store.root=="" then return void end if
  root=bytes(store.root);path=bytes(name);size=sizeNative(nativeBytesPtr(root),len(root),nativeBytesPtr(path),len(path))
  if size==-2 then return void end if
  if size<0 then return error(7793,"Invalid or inaccessible user file: "+name) end if
  output=bytes(98304,0);count=resolveNative(nativeBytesPtr(root),len(root),nativeBytesPtr(path),len(path),output,len(output))
  if count<=0 or count>=len(output) then return error(7793,"Cannot resolve user file: "+name) end if
  data=fs.readAllBytes(decode(slice(output,0,count)))
  if len(data)>MAX_BYTES then return error(7793,"User file exceeds size limit") end if
  return data
end function
/// Read the user overlay first and fall back to PK3 only when the user file is absent; propagate invalid or inaccessible overlay errors.
///
/// Validation failures include `File not found`.
/// @param store File store with the selected user root and optional PK3 archive.
/// @param name Game-relative asset or user-file path.
function readAll(store,name)
  data=readUser(store,name);if typeof(data)!="void" then return data end if
  if store.archive==void then return error(7793,"File not found") end if
  return pk3.read(store.archive,name)
end function
/// Apply `mq3.engine.user_files.writeNative`, `nativeBytesPtr` for atomic write in engine.user_files.
/// @param store Record exposing `root`.
/// @param name Name used in `bytes(name)`.
/// @param data Data used in `len(data)` and `nativeBytesPtr(data)`.
function atomicWrite(store,name,data)
  if store.root=="" or len(data)>MAX_BYTES then return false end if
  root=bytes(store.root);path=bytes(name)
  return writeNative(nativeBytesPtr(root),len(root),nativeBytesPtr(path),len(path),nativeBytesPtr(data),len(data))!=0
end function
/// Open an overlay/archive read handle or initialize a writable user file; return OpenResult(handle, length), with (0, -1) on failure.
/// @param store Mutable file store; usable handles are 1..63. Writable opens validate and atomically replace the selected overlay file.
/// @param name Game-relative path. Read mode prefers the user overlay; append loads only the overlay and never copies a PK3 asset.
/// @param mode 0=read, 1=truncate/write, 2=append, 3=append with immediate flush. Successful writable opens report length zero.
function open(store,name,mode)
  if mode<0 or mode>3 then return common.OpenResult(0,-1) end if
  number=0
  for index=1 to MAX_HANDLES-1 if store.files[index]==void then number=index;break end if end for
  if number==0 then return common.OpenResult(0,-1) end if
  data=bytes(0,0);offset=0
  if mode==0 then
    data=try(readAll(store,name));if data is error then return common.OpenResult(0,-1) end if
  else
    if store.root=="" then return common.OpenResult(0,-1) end if
    for index=1 to MAX_HANDLES-1
      cursor=store.files[index]
      if cursor!=void and cursor.mode!=0 then
        // Reject equivalent Windows paths before open-write can truncate.
        identity=samePath(store,cursor.path,name)
        if identity!=0 then return common.OpenResult(0,-1) end if
      end if
    end for
    if mode==2 or mode==3 then
      old=try(readUser(store,name));if old is error then return common.OpenResult(0,-1) end if;if typeof(old)!="void" then data=old end if
      offset=len(data)
    end if
    // Validate writability at open and implement truncation even without write.
    if not atomicWrite(store,name,data) then return common.OpenResult(0,-1) end if
  end if
  store.files[number]=Cursor(data,offset,len(data),mode,name,false)
  length=0;if mode==0 then length=len(data) end if
  return common.OpenResult(number,length)
end function
/// Compute engine.user_files.valid as `(((number > 0) and (number < MAX_HANDLES)) and (store.files[number] != void))`.
/// @param store Record exposing `files`.
/// @param number Zero-based index into `store.files`.
function valid(store,number) return number>0 and number<MAX_HANDLES and store.files[number]!=void end function
/// Read user files in engine.user_files; the normal completion returns `result`.
/// @param store Record exposing `files`.
/// @param number Number passed as `number` to `mq3.engine.user_files.valid`.
/// @param count Count used in `(count < 0)` and `(count > remaining)`.
function read(store,number,count)
  if not valid(store,number) or count<0 then return bytes(0,0) end if
  cursor=store.files[number];if cursor.mode!=0 then return bytes(0,0) end if
  remaining=cursor.size-cursor.offset;if remaining<=0 then return bytes(0,0) end if
  if count>remaining then count=remaining end if
  result=slice(cursor.data,cursor.offset,count);cursor.offset=cursor.offset+count;return result
end function
/// Atomically persist a dirty user-file buffer and clear its dirty flag only after a successful write.
/// @param store User-file store and selected writable root.
/// @param number Open file handle whose dirty buffer is flushed; invalid handles return false.
function flush(store,number)
  if not valid(store,number) then return false end if
  cursor=store.files[number];if not cursor.dirty then return true end if
  if not atomicWrite(store,cursor.path,slice(cursor.data,0,cursor.size)) then return false end if
  cursor.dirty=false;return true
end function
/// Write or append bytes to an open user buffer; mode 3 flushes immediately and may report zero after changing the dirty buffer and cursor.
/// @param store Mutable file store; failed immediate flushes retain dirty data for retry.
/// @param number Writable handle from 1..63. Read handles reject writes.
/// @param data Payload bytes; an empty payload is a no-op, and append modes always write at the current file end.
function write(store,number,data)
  if not valid(store,number) then return 0 end if
  cursor=store.files[number]
  if cursor.mode==0 or len(data)==0 then return 0 end if
  // fopen("ab") appends even after fseek. A zero-byte write is a no-op,
  // including after a seek beyond EOF; it must not allocate or extend a file.
  position=cursor.offset
  if cursor.mode==2 or cursor.mode==3 then position=cursor.size end if
  if position<0 or len(data)>MAX_BYTES or position>MAX_BYTES-len(data) then return 0 end if
  finish=position+len(data)
  if finish>len(cursor.data) then
    capacity=len(cursor.data);if capacity<4096 then capacity=4096 end if
    while capacity<finish capacity=capacity*2 end while
    if capacity>MAX_BYTES then capacity=MAX_BYTES end if
    grown=bytes(capacity,0);if cursor.size>0 then copyBytes(grown,0,cursor.data,0,cursor.size) end if;cursor.data=grown
  end if
  if len(data)>0 then copyBytes(cursor.data,position,data,0,len(data)) end if
  cursor.offset=finish;if finish>cursor.size then cursor.size=finish end if;cursor.dirty=true
  if cursor.mode==3 and not flush(store,number) then return 0 end if
  return len(data)
end function
/// Move a user-file cursor within the 64 MiB bound; return zero on success or -1 for an invalid handle, origin, or position.
/// @param store User-file store owning the cursor table.
/// @param number Open handle from 1 through MAX_HANDLES - 1.
/// @param offset Signed byte displacement from the selected origin.
/// @param origin Quake seek origin: 0=current cursor, 1=end of file, 2=start of file.
function seek(store,number,offset,origin)
  if not valid(store,number) then return -1 end if
  cursor=store.files[number];target=offset
  if origin==0 then target=cursor.offset+offset else if origin==1 then target=cursor.size+offset else if origin!=2 then return -1 end if
  if target<0 or target>MAX_BYTES then return -1 end if
  cursor.offset=target;return 0
end function
/// Flush and release an open user-file handle; a failed flush returns error 7793 and retains the handle for retry.
/// @param store Mutable user-file store.
/// @param number Open handle to flush and release; an invalid handle is a no-op.
function close(store,number)
  if not valid(store,number) then return void end if
  if not flush(store,number) then return error(7793,"Cannot flush user file: "+store.files[number].path) end if
  store.files[number]=void;return void
end function
/// Close all in engine.user_files.
///
/// Validation failures include `One or more user files could not be saved`.
/// @param store Record exposing `files`.
function closeAll(store)
  if store==void then return void end if
  failed=false
  for number=1 to MAX_HANDLES-1
    if store.files[number]!=void then result=try(close(store,number));if result is error then failed=true end if end if
  end for
  if failed then return error(7793,"One or more user files could not be saved") end if
  return void
end function
