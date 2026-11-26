# `src/mq3/platform/file.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.file`](Package-mq3-platform-file-892084419.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="extern_function-extern-function-mq3-platform-file-closehandle-extern-function-closehandle-handle-as-ptr-from-kernel32-dll-returns-bool-src-mq3-platform-file-ml-2079455426"></a>
### CloseHandle

```ml
extern function CloseHandle(handle as ptr) from "kernel32.dll" returns bool
```

Releases a Win32 handle owned by the caller.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — | Valid file handle to close; ownership ends on successful closure. |


**Returns:** True if the handle was closed; false on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/file.ml#L18)

<a id="extern_function-extern-function-mq3-platform-file-createfilew-extern-function-createfilew-name-as-wstr-access-as-u32-share-as-u32-security-as-ptr-creation-as-u32-attributes-as-u32-templatehandle-as-ptr-from-kernel32-dll-returns-ptr-src-mq3-platform-file-ml-433807682"></a>
### CreateFileW

```ml
extern function CreateFileW(name as wstr, access as u32, share as u32, security as ptr, creation as u32, attributes as u32, templateHandle as ptr) from "kernel32.dll" returns ptr
```

Opens or creates a Win32 file using a UTF-16 path and the supplied access/share flags.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — | UTF-16 path to open. |
| `access` | `u32` | — | Win32 desired-access flags; readRange uses GENERIC_READ. |
| `share` | `u32` | — | Win32 share-mode flags; readRange permits shared reads. |
| `security` | `ptr` | — | SECURITY_ATTRIBUTES pointer, or null for default attributes. |
| `creation` | `u32` | — | Creation disposition; readRange uses OPEN_EXISTING. |
| `attributes` | `u32` | — | File attribute/flag mask; readRange uses FILE_ATTRIBUTE_NORMAL. |
| `templateHandle` | `ptr` | — | Optional template file handle, or null. |


**Returns:** A file handle; INVALID_HANDLE_VALUE (-1) on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/file.ml#L14)

<a id="extern_function-extern-function-mq3-platform-file-getfilesizeex-extern-function-getfilesizeex-handle-as-ptr-result-as-bytes-from-kernel32-dll-returns-bool-src-mq3-platform-file-ml-2107832562"></a>
### GetFileSizeEx

```ml
extern function GetFileSizeEx(handle as ptr, result as bytes) from "kernel32.dll" returns bool
```

Writes the 64-bit byte length of an open file into the caller-provided buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — | Open file handle to query. |
| `result` | `bytes` | — | Writable buffer of at least eight bytes for the signed 64-bit file size. |


**Returns:** True when the file size was written; false on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/file.ml#L23)

<a id="extern_function-extern-function-mq3-platform-file-readfile-extern-function-readfile-handle-as-ptr-buffer-as-ptr-count-as-u32-transferred-as-bytes-overlapped-as-ptr-from-kernel32-dll-returns-bool-src-mq3-platform-file-ml-441956998"></a>
### ReadFile

```ml
extern function ReadFile(handle as ptr, buffer as ptr, count as u32, transferred as bytes, overlapped as ptr) from "kernel32.dll" returns bool
```

Reads bytes from a Win32 file into native storage and records the transferred byte count.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — | Open file handle to read. |
| `buffer` | `ptr` | — | Writable native destination for at least count bytes. |
| `count` | `u32` | — | Maximum number of bytes to read. |
| `transferred` | `bytes` | — | Writable buffer of at least four bytes for the actual byte count. |
| `overlapped` | `ptr` | — | Optional OVERLAPPED pointer; readRange uses null for synchronous reads. |


**Returns:** True when the native read succeeds; false on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/file.ml#L38)

<a id="function-function-mq3-platform-file-readrange-function-readrange-path-offset-count-src-mq3-platform-file-ml-1541978289"></a>
### readRange

```ml
function readRange(path, offset, count)
```

Computes `readRange` from `bytes(count, 0)` using `mq3.platform.file.CreateFileW`, `mq3.platform.file.CloseHandle`, `mq3.platform.file.GetFileSizeEx`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Value forwarded as `name` to `mq3.platform.file.CreateFileW`. |
| `offset` | `dynamic` | — | Value forwarded as `offset` to `mq3.platform.file.SetFilePointerEx`. |
| `count` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/file.ml#L44)

<a id="extern_function-extern-function-mq3-platform-file-setfilepointerex-extern-function-setfilepointerex-handle-as-ptr-offset-as-i64-position-as-ptr-origin-as-u32-from-kernel32-dll-returns-bool-src-mq3-platform-file-ml-747388909"></a>
### SetFilePointerEx

```ml
extern function SetFilePointerEx(handle as ptr, offset as i64, position as ptr, origin as u32) from "kernel32.dll" returns bool
```

Moves the Win32 file position by a signed 64-bit displacement.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — | Open file handle to reposition. |
| `offset` | `i64` | — | Signed displacement in bytes from the selected origin. |
| `position` | `ptr` | — | Optional native pointer for the resulting 64-bit position; null when unused. |
| `origin` | `u32` | — | Seek origin; readRange passes FILE_BEGIN (0). |


**Returns:** True when the file position was changed; false on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/file.ml#L30)
