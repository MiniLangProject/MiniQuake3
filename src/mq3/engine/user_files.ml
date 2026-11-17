// SPDX-License-Identifier: GPL-2.0-or-later
// Read-only PK3 assets plus an explicitly selected per-user writable overlay.
// The native boundary validates paths and atomically replaces disk contents.
package mq3.engine.user_files
import mq3.format.pk3 as pk3
import std.fs as fs
import mq3.vm.syscall_common as common
const MAX_HANDLES=64
const MAX_BYTES=67108864
struct Cursor data offset size mode path dirty end struct
struct Store archive root files end struct
extern function defaultRootNative(output as bytes,capacity as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_default_root" returns i32
extern function resolveNative(root as ptr,rootLength as i32,name as ptr,nameLength as i32,output as bytes,capacity as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_resolve" returns i32
extern function writeNative(root as ptr,rootLength as i32,name as ptr,nameLength as i32,data as ptr,length as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_write_atomic" returns i32
extern function sizeNative(root as ptr,rootLength as i32,name as ptr,nameLength as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_size" returns i32
extern function samePathNative(root as ptr,rootLength as i32,first as ptr,firstLength as i32,second as ptr,secondLength as i32) from "miniquake3_userfiles.dll" symbol "mq3_user_same_path" returns i32
function samePath(store,first,second)
  root=bytes(store.root);a=bytes(first);b=bytes(second)
  return samePathNative(nativeBytesPtr(root),len(root),nativeBytesPtr(a),len(a),nativeBytesPtr(b),len(b))
end function
function defaultRoot()
  output=bytes(98304,0);count=defaultRootNative(output,len(output))
  if count<0 or count>=len(output) then return error(7793,"Cannot resolve MiniQuake3 user directory") end if
  return decode(slice(output,0,count))
end function
function create(archive,root) return Store(archive,root,array(MAX_HANDLES,void)) end function
// An absent user file is void; invalid/inaccessible files are errors, not
// archive fallbacks. In particular append never copies an archive asset.
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
function readAll(store,name)
  data=readUser(store,name);if typeof(data)!="void" then return data end if
  if store.archive==void then return error(7793,"File not found") end if
  return pk3.read(store.archive,name)
end function
function atomicWrite(store,name,data)
  if store.root=="" or len(data)>MAX_BYTES then return false end if
  root=bytes(store.root);path=bytes(name)
  return writeNative(nativeBytesPtr(root),len(root),nativeBytesPtr(path),len(path),nativeBytesPtr(data),len(data))!=0
end function
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
function valid(store,number) return number>0 and number<MAX_HANDLES and store.files[number]!=void end function
function read(store,number,count)
  if not valid(store,number) or count<0 then return bytes(0,0) end if
  cursor=store.files[number];if cursor.mode!=0 then return bytes(0,0) end if
  remaining=cursor.size-cursor.offset;if remaining<=0 then return bytes(0,0) end if
  if count>remaining then count=remaining end if
  result=slice(cursor.data,cursor.offset,count);cursor.offset=cursor.offset+count;return result
end function
function flush(store,number)
  if not valid(store,number) then return false end if
  cursor=store.files[number];if not cursor.dirty then return true end if
  if not atomicWrite(store,cursor.path,slice(cursor.data,0,cursor.size)) then return false end if
  cursor.dirty=false;return true
end function
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
function seek(store,number,offset,origin)
  if not valid(store,number) then return -1 end if
  cursor=store.files[number];target=offset
  if origin==0 then target=cursor.offset+offset else if origin==1 then target=cursor.size+offset else if origin!=2 then return -1 end if
  if target<0 or target>MAX_BYTES then return -1 end if
  cursor.offset=target;return 0
end function
function close(store,number)
  if not valid(store,number) then return void end if
  if not flush(store,number) then return error(7793,"Cannot flush user file: "+store.files[number].path) end if
  store.files[number]=void;return void
end function
function closeAll(store)
  if store==void then return void end if
  failed=false
  for number=1 to MAX_HANDLES-1
    if store.files[number]!=void then result=try(close(store,number));if result is error then failed=true end if end if
  end for
  if failed then return error(7793,"One or more user files could not be saved") end if
  return void
end function
