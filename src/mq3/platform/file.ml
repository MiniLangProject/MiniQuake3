// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.platform.file
import mq3.compat.numeric as n

extern function CreateFileW(name as wstr, access as u32, share as u32, security as ptr, creation as u32, attributes as u32, templateHandle as ptr) from "kernel32.dll" returns ptr
extern function CloseHandle(handle as ptr) from "kernel32.dll" returns bool
extern function GetFileSizeEx(handle as ptr, result as bytes) from "kernel32.dll" returns bool
extern function SetFilePointerEx(handle as ptr, offset as i64, position as ptr, origin as u32) from "kernel32.dll" returns bool
extern function ReadFile(handle as ptr, buffer as ptr, count as u32, transferred as bytes, overlapped as ptr) from "kernel32.dll" returns bool

function readRange(path, offset, count)
  if offset < 0 or count < 0 or count > 268435456 then return error(3100, "file range invalid") end if
  handle = CreateFileW(path, 0x80000000, 1, 0, 3, 0x80, 0)
  if handle == -1 then return error(3100, "cannot open " + path) end if
  defer CloseHandle(handle)
  sizeBytes = bytes(8, 0)
  if not GetFileSizeEx(handle, sizeBytes) then return error(3100, "cannot size " + path) end if
  size = n.readU32(sizeBytes, 0) + (n.readU32(sizeBytes, 4) << 32)
  if offset + count > size then return error(3100, "read beyond file " + path) end if
  if not SetFilePointerEx(handle, offset, 0, 0) then return error(3100, "cannot seek " + path) end if
  result = bytes(count, 0)
  transferred = bytes(4, 0)
  done = 0
  while done < count
    if not ReadFile(handle, nativeBytesPtr(result) + done, count - done, transferred, 0) then return error(3100, "read failed " + path) end if
    amount = n.readU32(transferred, 0)
    if amount == 0 then return error(3100, "unexpected file end " + path) end if
    done = done + amount
  end while
  return result
end function
