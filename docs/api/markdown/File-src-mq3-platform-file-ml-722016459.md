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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/file.ml#L6)

<a id="extern_function-extern-function-mq3-platform-file-createfilew-extern-function-createfilew-name-as-wstr-access-as-u32-share-as-u32-security-as-ptr-creation-as-u32-attributes-as-u32-templatehandle-as-ptr-from-kernel32-dll-returns-ptr-src-mq3-platform-file-ml-433807682"></a>
### CreateFileW

```ml
extern function CreateFileW(name as wstr, access as u32, share as u32, security as ptr, creation as u32, attributes as u32, templateHandle as ptr) from "kernel32.dll" returns ptr
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `wstr` | — |  |
| `access` | `u32` | — |  |
| `share` | `u32` | — |  |
| `security` | `ptr` | — |  |
| `creation` | `u32` | — |  |
| `attributes` | `u32` | — |  |
| `templateHandle` | `ptr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/file.ml#L5)

<a id="extern_function-extern-function-mq3-platform-file-getfilesizeex-extern-function-getfilesizeex-handle-as-ptr-result-as-bytes-from-kernel32-dll-returns-bool-src-mq3-platform-file-ml-2107832562"></a>
### GetFileSizeEx

```ml
extern function GetFileSizeEx(handle as ptr, result as bytes) from "kernel32.dll" returns bool
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — |  |
| `result` | `bytes` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/file.ml#L7)

<a id="extern_function-extern-function-mq3-platform-file-readfile-extern-function-readfile-handle-as-ptr-buffer-as-ptr-count-as-u32-transferred-as-bytes-overlapped-as-ptr-from-kernel32-dll-returns-bool-src-mq3-platform-file-ml-441956998"></a>
### ReadFile

```ml
extern function ReadFile(handle as ptr, buffer as ptr, count as u32, transferred as bytes, overlapped as ptr) from "kernel32.dll" returns bool
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — |  |
| `buffer` | `ptr` | — |  |
| `count` | `u32` | — |  |
| `transferred` | `bytes` | — |  |
| `overlapped` | `ptr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/file.ml#L9)

<a id="function-function-mq3-platform-file-readrange-function-readrange-path-offset-count-src-mq3-platform-file-ml-1541978289"></a>
### readRange

```ml
function readRange(path, offset, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/file.ml#L11)

<a id="extern_function-extern-function-mq3-platform-file-setfilepointerex-extern-function-setfilepointerex-handle-as-ptr-offset-as-i64-position-as-ptr-origin-as-u32-from-kernel32-dll-returns-bool-src-mq3-platform-file-ml-747388909"></a>
### SetFilePointerEx

```ml
extern function SetFilePointerEx(handle as ptr, offset as i64, position as ptr, origin as u32) from "kernel32.dll" returns bool
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — |  |
| `offset` | `i64` | — |  |
| `position` | `ptr` | — |  |
| `origin` | `u32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/file.ml#L8)
