// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.platform.file
import mq3.compat.numeric as n

/// Opens or creates a Win32 file using a UTF-16 path and the supplied access/share flags.
/// @param name UTF-16 path to open.
/// @param access Win32 desired-access flags; readRange uses GENERIC_READ.
/// @param share Win32 share-mode flags; readRange permits shared reads.
/// @param security SECURITY_ATTRIBUTES pointer, or null for default attributes.
/// @param creation Creation disposition; readRange uses OPEN_EXISTING.
/// @param attributes File attribute/flag mask; readRange uses FILE_ATTRIBUTE_NORMAL.
/// @param templateHandle Optional template file handle, or null.
/// @returns A file handle; INVALID_HANDLE_VALUE (-1) on failure.
extern function CreateFileW(name as wstr, access as u32, share as u32, security as ptr, creation as u32, attributes as u32, templateHandle as ptr) from "kernel32.dll" returns ptr
/// Releases a Win32 handle owned by the caller.
/// @param handle Valid file handle to close; ownership ends on successful closure.
/// @returns True if the handle was closed; false on failure.
extern function CloseHandle(handle as ptr) from "kernel32.dll" returns bool
/// Writes the 64-bit byte length of an open file into the caller-provided buffer.
/// @param handle Open file handle to query.
/// @param result Writable buffer of at least eight bytes for the signed 64-bit file size.
/// @returns True when the file size was written; false on failure.
extern function GetFileSizeEx(handle as ptr, result as bytes) from "kernel32.dll" returns bool
/// Moves the Win32 file position by a signed 64-bit displacement.
/// @param handle Open file handle to reposition.
/// @param offset Signed displacement in bytes from the selected origin.
/// @param position Optional native pointer for the resulting 64-bit position; null when unused.
/// @param origin Seek origin; readRange passes FILE_BEGIN (0).
/// @returns True when the file position was changed; false on failure.
extern function SetFilePointerEx(handle as ptr, offset as i64, position as ptr, origin as u32) from "kernel32.dll" returns bool
/// Reads bytes from a Win32 file into native storage and records the transferred byte count.
/// @param handle Open file handle to read.
/// @param buffer Writable native destination for at least count bytes.
/// @param count Maximum number of bytes to read.
/// @param transferred Writable buffer of at least four bytes for the actual byte count.
/// @param overlapped Optional OVERLAPPED pointer; readRange uses null for synchronous reads.
/// @returns True when the native read succeeds; false on failure.
extern function ReadFile(handle as ptr, buffer as ptr, count as u32, transferred as bytes, overlapped as ptr) from "kernel32.dll" returns bool

/// Computes `readRange` from `bytes(count, 0)` using `mq3.platform.file.CreateFileW`, `mq3.platform.file.CloseHandle`, `mq3.platform.file.GetFileSizeEx`.
/// @param path Value forwarded as `name` to `mq3.platform.file.CreateFileW`.
/// @param offset Value forwarded as `offset` to `mq3.platform.file.SetFilePointerEx`.
/// @param count Argument 1 supplied to `bytes`.
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
