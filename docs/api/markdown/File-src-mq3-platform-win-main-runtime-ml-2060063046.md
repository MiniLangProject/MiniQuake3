# `src/mq3/platform/win_main_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.win_main_runtime`](Package-mq3-platform-win-main-runtime-1472400096.md)

Reachable from entry: **yes**

## Imports

- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-clipboardnative-extern-function-clipboardnative-output-as-bytes-capacity-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-clipboard-returns-i32-src-mq3-platform-win-main-runtime-ml-250386343"></a>
### clipboardNative

```ml
extern function clipboardNative(output as bytes, capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_clipboard" returns i32
```

Reads Unicode clipboard text as UTF-8 and truncates at newline, carriage return, or backspace.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — | Writable UTF-8 text buffer, including space for NUL. |
| `capacity` | `i32` | — | Output-buffer capacity in bytes. |


**Returns:** UTF-8 byte length, or -1 if the clipboard cannot be read or converted.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L39)

<a id="function-function-mq3-platform-win-main-runtime-create-function-create-src-mq3-platform-win-main-runtime-ml-507331032"></a>
### create

```ml
function create()
```

Constructs `mq3.platform.win_main_runtime.Runtime` with `commandLine` = `""`, `events` = `array(MAX_QUED_EVENTS,void)`, `head` = `0`, `tail` = `0` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L108)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-cwdnative-extern-function-cwdnative-output-as-bytes-capacity-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-cwd-returns-i32-src-mq3-platform-win-main-runtime-ml-1875347203"></a>
### cwdNative

```ml
extern function cwdNative(output as bytes, capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_cwd" returns i32
```

Copies the current directory as NUL-terminated UTF-8 text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — | Writable UTF-8 text buffer, including space for NUL. |
| `capacity` | `i32` | — | Output-buffer capacity in bytes. |


**Returns:** UTF-8 byte length excluding NUL, or -1 on query/conversion failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L29)

<a id="function-function-mq3-platform-win-main-runtime-decodefilelist-function-decodefilelist-data-size-src-mq3-platform-win-main-runtime-ml-115241125"></a>
### decodeFileList

```ml
function decodeFileList(data, size)
```

Returns `result` from `mq3.platform.win_main_runtime.decodeFileList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `slice`. |
| `size` | `dynamic` | — | Input used by `for index=0 to size-1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L182)

- [mq3.platform.win_main_runtime.Dll](Type-mq3-platform-win-main-runtime-dll-1708592090.md) — struct
<a id="extern_function-extern-function-mq3-platform-win-main-runtime-dllattachnative-extern-function-dllattachnative-handle-as-ptr-systemcalls-as-ptr-from-miniquake3-winmain-dll-symbol-mq3-winmain-dll-attach-returns-i32-src-mq3-platform-win-main-runtime-ml-2056586367"></a>
### dllAttachNative

```ml
extern function dllAttachNative(handle as ptr, systemCalls as ptr) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_attach" returns i32
```

Calls a module's dllEntry export with the engine syscall callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — | Loaded HMODULE returned by mq3_winmain_dll_load. |
| `systemCalls` | `ptr` | — | Address of the engine syscall callback passed to dllEntry. |


**Returns:** 1 after dllEntry is called; 0 for invalid handles/callbacks or a missing export.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L83)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-dllloadnative-extern-function-dllloadnative-path-as-ptr-length-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-dll-load-returns-ptr-src-mq3-platform-win-main-runtime-ml-415310635"></a>
### dllLoadNative

```ml
extern function dllLoadNative(path as ptr, length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_load" returns ptr
```

Loads a native module from a UTF-8 path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `ptr` | — | Pointer to the UTF-8 path bytes. |
| `length` | `i32` | — | Path length in UTF-8 bytes, excluding any trailing NUL. |


**Returns:** The module handle, or 0 if path conversion or LoadLibraryW fails.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L73)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-dllsymbolnative-extern-function-dllsymbolnative-handle-as-ptr-name-as-ptr-from-miniquake3-winmain-dll-symbol-mq3-winmain-dll-symbol-returns-ptr-src-mq3-platform-win-main-runtime-ml-832282803"></a>
### dllSymbolNative

```ml
extern function dllSymbolNative(handle as ptr, name as ptr) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_symbol" returns ptr
```

Looks up an exported symbol in a loaded native module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — | Loaded HMODULE returned by mq3_winmain_dll_load. |
| `name` | `ptr` | — | NUL-terminated native export name. |


**Returns:** The export address, or 0 for invalid arguments or an absent symbol.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L78)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-dllunloadnative-extern-function-dllunloadnative-handle-as-ptr-from-miniquake3-winmain-dll-symbol-mq3-winmain-dll-unload-returns-i32-src-mq3-platform-win-main-runtime-ml-1640381653"></a>
### dllUnloadNative

```ml
extern function dllUnloadNative(handle as ptr) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_unload" returns i32
```

Releases a loaded native module reference.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — | Loaded HMODULE returned by mq3_winmain_dll_load. |


**Returns:** 1 when FreeLibrary succeeds; 0 otherwise.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L87)

<a id="function-function-mq3-platform-win-main-runtime-emit-function-emit-state-kind-text-value-src-mq3-platform-win-main-runtime-ml-1246652025"></a>
### emit

```ml
function emit(state, kind, text, value)
```

Updates `state.actions` in `mq3.platform.win_main_runtime.emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.actions`. |
| `kind` | `dynamic` | — | Input used by `state.actions=state.actions+[[kind,text,value]]`. |
| `text` | `dynamic` | — | Input used by `state.actions=state.actions+[[kind,text,value]]`. |
| `value` | `dynamic` | — | Input used by `state.actions=state.actions+[[kind,text,value]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L119)

- [mq3.platform.win_main_runtime.Event](Type-mq3-platform-win-main-runtime-event-1151323654.md) — struct
<a id="function-function-mq3-platform-win-main-runtime-joinpath-function-joinpath-base-game-name-src-mq3-platform-win-main-runtime-ml-174494912"></a>
### joinPath

```ml
function joinPath(base, game, name)
```

Returns `result+name` from `mq3.platform.win_main_runtime.joinPath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `base` | `dynamic` | — | Input used by `result=base`. |
| `game` | `dynamic` | — | Input tested by `game!=""`. |
| `name` | `dynamic` | — | Input used in the result expression `result+name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L251)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-listfilesnative-extern-function-listfilesnative-directory-as-ptr-directorylength-as-i32-extension-as-ptr-extensionlength-as-i32-filter-as-ptr-filterlength-as-i32-wantsubs-as-i32-output-as-bytes-capacity-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-list-files-returns-i32-src-mq3-platform-win-main-runtime-ml-821449092"></a>
### listFilesNative

```ml
extern function listFilesNative(directory as ptr, directoryLength as i32, extension as ptr, extensionLength as i32, filter as ptr, filterLength as i32, wantSubs as i32, output as bytes, capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_list_files" returns i32
```

Enumerates matching paths into a NUL-separated UTF-8 result buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `directory` | `ptr` | — | UTF-8 directory path. |
| `directoryLength` | `i32` | — | Directory-path length in bytes. |
| `extension` | `ptr` | — | UTF-8 extension filter used when no recursive filter is supplied. |
| `extensionLength` | `i32` | — | Extension-filter length in bytes. |
| `filter` | `ptr` | — | Optional UTF-8 recursive path filter. |
| `filterLength` | `i32` | — | Recursive-filter length in bytes. |
| `wantSubs` | `i32` | — | Nonzero requests directories; zero requests files in the nonrecursive branch. |
| `output` | `bytes` | — | Writable buffer for NUL-separated UTF-8 names. |
| `capacity` | `i32` | — | Output-buffer capacity in bytes. |


**Returns:** Bytes used, negative required size if capacity is insufficient, or 0 for no results/conversion failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L68)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-lowmemorynative-extern-function-lowmemorynative-from-miniquake3-winmain-dll-symbol-mq3-winmain-low-physical-memory-returns-i32-src-mq3-platform-win-main-runtime-ml-1570351603"></a>
### lowMemoryNative

```ml
extern function lowMemoryNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_low_physical_memory" returns i32
```

Tests the legacy low-memory threshold of at most 96 MiB total physical memory.


**Returns:** 1 below or at the threshold; 0 otherwise or if the memory query fails.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L21)

<a id="constant-constant-mq3-platform-win-main-runtime-max-found-files-const-max-found-files-4096-src-mq3-platform-win-main-runtime-ml-74934640"></a>
### MAX_FOUND_FILES

```ml
const MAX_FOUND_FILES = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L9)

<a id="constant-constant-mq3-platform-win-main-runtime-max-qued-events-const-max-qued-events-256-src-mq3-platform-win-main-runtime-ml-519483546"></a>
### MAX_QUED_EVENTS

```ml
const MAX_QUED_EVENTS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L10)

<a id="constant-constant-mq3-platform-win-main-runtime-mem-threshold-const-mem-threshold-100663296-src-mq3-platform-win-main-runtime-ml-744323022"></a>
### MEM_THRESHOLD

```ml
const MEM_THRESHOLD = 100663296
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L8)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-millisecondsnative-extern-function-millisecondsnative-from-miniquake3-winmain-dll-symbol-mq3-winmain-milliseconds-returns-u32-src-mq3-platform-win-main-runtime-ml-1252643997"></a>
### millisecondsNative

```ml
extern function millisecondsNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_milliseconds" returns u32
```

Reads the Windows multimedia clock.


**Returns:** The unsigned 32-bit millisecond counter returned by timeGetTime.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L24)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-mkdirnative-extern-function-mkdirnative-path-as-ptr-length-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-mkdir-returns-i32-src-mq3-platform-win-main-runtime-ml-154117721"></a>
### mkdirNative

```ml
extern function mkdirNative(path as ptr, length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_mkdir" returns i32
```

Creates a directory from a UTF-8 path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `ptr` | — | Pointer to the UTF-8 path bytes. |
| `length` | `i32` | — | Path length in UTF-8 bytes, excluding any trailing NUL. |


**Returns:** 1 if created or already present, 0 on creation failure, or -1 for invalid UTF-8 input.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L34)

<a id="function-function-mq3-platform-win-main-runtime-nativelist-function-nativelist-directory-extension-filter-wantsubs-src-mq3-platform-win-main-runtime-ml-977291299"></a>
### nativeList

```ml
function nativeList(directory, extension, filter, wantSubs)
```

Computes `nativeList` from `decodeFileList(output,size)` using `mq3.platform.win_main_runtime.listFilesNative`, `mq3.platform.win_main_runtime.decodeFileList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `directory` | `dynamic` | — | Argument 1 supplied to `bytes`. |
| `extension` | `dynamic` | — | Argument 1 supplied to `bytes`. |
| `filter` | `dynamic` | — | Argument 1 supplied to `bytes`. |
| `wantSubs` | `dynamic` | — | Input tested by `wantSubs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L194)

<a id="function-function-mq3-platform-win-main-runtime-now-function-now-state-src-mq3-platform-win-main-runtime-ml-1451425981"></a>
### now

```ml
function now(state)
```

Returns `millisecondsNative()` from `mq3.platform.win_main_runtime.now`; earlier branches return `state.clockFn(state.context)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.clockFn`, `state.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L316)

<a id="function-function-mq3-platform-win-main-runtime-popevent-function-popevent-state-src-mq3-platform-win-main-runtime-ml-1051158625"></a>
### popEvent

```ml
function popEvent(state)
```

Updates `state.tail` in `mq3.platform.win_main_runtime.popEvent`; returns `event`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.tail`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L332)

- [mq3.platform.win_main_runtime.Runtime](Type-mq3-platform-win-main-runtime-runtime-1096450402.md) — struct
<a id="extern_function-extern-function-mq3-platform-win-main-runtime-scancdnative-extern-function-scancdnative-output-as-bytes-capacity-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-scan-cd-returns-i32-src-mq3-platform-win-main-runtime-ml-1311117002"></a>
### scanCdNative

```ml
extern function scanCdNative(output as bytes, capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_scan_cd" returns i32
```

Searches CD-ROM drives for a recognized Quake III installation directory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — | Writable UTF-8 text buffer, including space for NUL. |
| `capacity` | `i32` | — | Output-buffer capacity in bytes. |


**Returns:** UTF-8 directory length, 0 if no installation is found, or -1 on conversion failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L44)

<a id="constant-constant-mq3-platform-win-main-runtime-se-char-const-se-char-2-src-mq3-platform-win-main-runtime-ml-1183054911"></a>
### SE_CHAR

```ml
const SE_CHAR = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L13)

<a id="constant-constant-mq3-platform-win-main-runtime-se-console-const-se-console-5-src-mq3-platform-win-main-runtime-ml-376326042"></a>
### SE_CONSOLE

```ml
const SE_CONSOLE = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L16)

<a id="constant-constant-mq3-platform-win-main-runtime-se-joystick-axis-const-se-joystick-axis-4-src-mq3-platform-win-main-runtime-ml-56219933"></a>
### SE_JOYSTICK_AXIS

```ml
const SE_JOYSTICK_AXIS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L15)

<a id="constant-constant-mq3-platform-win-main-runtime-se-key-const-se-key-1-src-mq3-platform-win-main-runtime-ml-90342426"></a>
### SE_KEY

```ml
const SE_KEY = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L12)

<a id="constant-constant-mq3-platform-win-main-runtime-se-mouse-const-se-mouse-3-src-mq3-platform-win-main-runtime-ml-1222589344"></a>
### SE_MOUSE

```ml
const SE_MOUSE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L14)

<a id="constant-constant-mq3-platform-win-main-runtime-se-none-const-se-none-0-src-mq3-platform-win-main-runtime-ml-10255469"></a>
### SE_NONE

```ml
const SE_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L11)

<a id="constant-constant-mq3-platform-win-main-runtime-se-packet-const-se-packet-6-src-mq3-platform-win-main-runtime-ml-1690933667"></a>
### SE_PACKET

```ml
const SE_PACKET = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L17)

<a id="function-function-mq3-platform-win-main-runtime-spk-close-function-spk-close-state-src-mq3-platform-win-main-runtime-ml-1210033455"></a>
### Spk_Close

```ml
function Spk_Close(state)
```

Returns `void` from `mq3.platform.win_main_runtime.Spk_Close`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.win_main_runtime.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L130)

<a id="function-function-mq3-platform-win-main-runtime-spk-open-function-spk-open-state-name-src-mq3-platform-win-main-runtime-ml-1016680966"></a>
### Spk_Open

```ml
function Spk_Open(state, name)
```

Returns `result` from `mq3.platform.win_main_runtime.Spk_Open`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.win_main_runtime.emit`. |
| `name` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L124)

<a id="function-function-mq3-platform-win-main-runtime-spk-printf-function-spk-printf-state-text-src-mq3-platform-win-main-runtime-ml-1691994042"></a>
### Spk_Printf

```ml
function Spk_Printf(state, text)
```

Returns `ok` from `mq3.platform.win_main_runtime.Spk_Printf`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.win_main_runtime.emit`. |
| `text` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L134)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-spkclosenative-extern-function-spkclosenative-from-miniquake3-winmain-dll-symbol-mq3-winmain-spk-close-returns-void-src-mq3-platform-win-main-runtime-ml-1294959200"></a>
### spkCloseNative

```ml
extern function spkCloseNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_spk_close" returns void
```

Closes the current diagnostic output file and clears its native handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L56)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-spkopennative-extern-function-spkopennative-path-as-ptr-length-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-spk-open-returns-i32-src-mq3-platform-win-main-runtime-ml-1337106103"></a>
### spkOpenNative

```ml
extern function spkOpenNative(path as ptr, length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_spk_open" returns i32
```

Replaces the currently open diagnostic output file with a UTF-8-selected binary file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `ptr` | — | Pointer to the UTF-8 path bytes. |
| `length` | `i32` | — | Path length in UTF-8 bytes, excluding any trailing NUL. |


**Returns:** 1 when the output file opens; 0 on path conversion or open failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L49)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-spkwritenative-extern-function-spkwritenative-text-as-ptr-length-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-spk-write-returns-i32-src-mq3-platform-win-main-runtime-ml-613055826"></a>
### spkWriteNative

```ml
extern function spkWriteNative(text as ptr, length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_spk_write" returns i32
```

Writes and flushes bytes to the currently open diagnostic output file.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `ptr` | — | Read-only bytes written to the diagnostic output file. |
| `length` | `i32` | — | Number of bytes to write and flush. |


**Returns:** 1 if every requested byte is written; 0 for invalid state/input or a short write.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L54)

- [mq3.platform.win_main_runtime.Stream](Type-mq3-platform-win-main-runtime-stream-174207922.md) — struct
- [mq3.platform.win_main_runtime.StreamRead](Type-mq3-platform-win-main-runtime-streamread-1544338586.md) — struct
<a id="function-function-mq3-platform-win-main-runtime-strgtr-function-strgtr-s0-s1-src-mq3-platform-win-main-runtime-ml-1969248015"></a>
### strgtr

```ml
function strgtr(s0, s1)
```

Compares common string bytes and reports whether the second string first differs with a larger byte; prefixes compare false.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s0` | `dynamic` | — | Argument 1 supplied to `bytes`. |
| `s1` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L213)

<a id="function-function-mq3-platform-win-main-runtime-sys-beginprofiling-function-sys-beginprofiling-state-src-mq3-platform-win-main-runtime-ml-870702333"></a>
### Sys_BeginProfiling

```ml
function Sys_BeginProfiling(state)
```

Returns `void` from `mq3.platform.win_main_runtime.Sys_BeginProfiling`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.win_main_runtime.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L143)

<a id="function-function-mq3-platform-win-main-runtime-sys-beginstreamedfile-function-sys-beginstreamedfile-state-file-readahead-context-readfn-seekfn-src-mq3-platform-win-main-runtime-ml-46284591"></a>
### Sys_BeginStreamedFile

```ml
function Sys_BeginStreamedFile(state, file, readAhead, context, readFn, seekFn)
```

Updates `state.streams` in `mq3.platform.win_main_runtime.Sys_BeginStreamedFile`; returns `stream`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.streams`. |
| `file` | `dynamic` | — | Value used for `mq3.platform.win_main_runtime.Stream.file`. |
| `readAhead` | `dynamic` | — | Input tested by `readAhead<0 or readFn==void or seekFn==void`. |
| `context` | `dynamic` | — | Value used for `mq3.platform.win_main_runtime.Stream.context`. |
| `readFn` | `dynamic` | — | Value used for `mq3.platform.win_main_runtime.Stream.readFn`. |
| `seekFn` | `dynamic` | — | Value used for `mq3.platform.win_main_runtime.Stream.seekFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L289)

<a id="function-function-mq3-platform-win-main-runtime-sys-checkcd-function-sys-checkcd-src-mq3-platform-win-main-runtime-ml-640671266"></a>
### Sys_CheckCD

```ml
function Sys_CheckCD()
```

Returns `true` for the `mq3.platform.win_main_runtime.Sys_CheckCD` compatibility entry point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L235)

<a id="function-function-mq3-platform-win-main-runtime-sys-cwd-function-sys-cwd-src-mq3-platform-win-main-runtime-ml-922687696"></a>
### Sys_Cwd

```ml
function Sys_Cwd()
```

Returns `decode(slice(data,0,length))` from `mq3.platform.win_main_runtime.Sys_Cwd`; earlier branches return `""`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L173)

<a id="function-function-mq3-platform-win-main-runtime-sys-defaultbasepath-function-sys-defaultbasepath-src-mq3-platform-win-main-runtime-ml-939471538"></a>
### Sys_DefaultBasePath

```ml
function Sys_DefaultBasePath()
```

Calls `mq3.platform.win_main_runtime.Sys_Cwd` with `()` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L177)

<a id="function-function-mq3-platform-win-main-runtime-sys-defaultcdpath-function-sys-defaultcdpath-src-mq3-platform-win-main-runtime-ml-205180742"></a>
### Sys_DefaultCDPath

```ml
function Sys_DefaultCDPath()
```

Returns `""` for the `mq3.platform.win_main_runtime.Sys_DefaultCDPath` compatibility entry point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L175)

<a id="function-function-mq3-platform-win-main-runtime-sys-endstreamedfile-function-sys-endstreamedfile-state-stream-src-mq3-platform-win-main-runtime-ml-837972185"></a>
### Sys_EndStreamedFile

```ml
function Sys_EndStreamedFile(state, stream)
```

Updates `stream.active` in `mq3.platform.win_main_runtime.Sys_EndStreamedFile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `stream` | `dynamic` | — | Mutable record or buffer; this call updates `stream.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L296)

<a id="function-function-mq3-platform-win-main-runtime-sys-error-function-sys-error-state-text-src-mq3-platform-win-main-runtime-ml-291893230"></a>
### Sys_Error

```ml
function Sys_Error(state, text)
```

Updates `state.fatal`, `state.errorText`, `state.printed`, `state.consoleVisible`, `state.inputStarted` in `mq3.platform.win_main_runtime.Sys_Error`; returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.fatal`, `state.errorText`, `state.printed`, `state.consoleVisible`, `state.inputStarted`. |
| `text` | `dynamic` | — | Value assigned to `state.errorText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L148)

<a id="function-function-mq3-platform-win-main-runtime-sys-freefilelist-function-sys-freefilelist-list-src-mq3-platform-win-main-runtime-ml-1729190668"></a>
### Sys_FreeFileList

```ml
function Sys_FreeFileList(list)
```

Returns `len(list)` from `mq3.platform.win_main_runtime.Sys_FreeFileList`; earlier branches return `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Input tested by `list==void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L230)

<a id="function-function-mq3-platform-win-main-runtime-sys-getclipboarddata-function-sys-getclipboarddata-src-mq3-platform-win-main-runtime-ml-470076584"></a>
### Sys_GetClipboardData

```ml
function Sys_GetClipboardData()
```

Returns `decode(slice(data,0,length))` from `mq3.platform.win_main_runtime.Sys_GetClipboardData`; earlier branches return `void`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L237)

<a id="function-function-mq3-platform-win-main-runtime-sys-getevent-function-sys-getevent-state-src-mq3-platform-win-main-runtime-ml-402022929"></a>
### Sys_GetEvent

```ml
function Sys_GetEvent(state)
```

Builds `mq3.platform.win_main_runtime.Event` using `state.pumpFn`, `state.consoleFn`, `state.packetFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.pumpFn`, `state.context`, `state.consoleFn`, `state.packetFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L335)

<a id="function-function-mq3-platform-win-main-runtime-sys-in-restart-f-function-sys-in-restart-f-state-src-mq3-platform-win-main-runtime-ml-1939687301"></a>
### Sys_In_Restart_f

```ml
function Sys_In_Restart_f(state)
```

Updates `state.inputStarted` in `mq3.platform.win_main_runtime.Sys_In_Restart_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.inputStarted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L345)

<a id="function-function-mq3-platform-win-main-runtime-sys-init-function-sys-init-state-platform-major-build-cpuid-currentuser-src-mq3-platform-win-main-runtime-ml-2066092870"></a>
### Sys_Init

```ml
function Sys_Init(state, platform, major, build, cpuId, currentUser)
```

Updates `state.arch`, `state.cpuId`, `state.cpuString`, `state.username`, `state.inputStarted` in `mq3.platform.win_main_runtime.Sys_Init`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.arch`, `state.cpuId`, `state.cpuString`, `state.username`, `state.inputStarted`. |
| `platform` | `dynamic` | — | Input tested by `major<4 or platform==0`. |
| `major` | `dynamic` | — | Input tested by `major<4 or platform==0`. |
| `build` | `dynamic` | — | Input tested by `build>=1998`. |
| `cpuId` | `dynamic` | — | Value assigned to `state.cpuId`. |
| `currentUser` | `dynamic` | — | Value assigned to `state.username`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L356)

<a id="function-function-mq3-platform-win-main-runtime-sys-initstreamthread-function-sys-initstreamthread-state-src-mq3-platform-win-main-runtime-ml-991337321"></a>
### Sys_InitStreamThread

```ml
function Sys_InitStreamThread(state)
```

Updates `state.streamStarted` in `mq3.platform.win_main_runtime.Sys_InitStreamThread`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.streamStarted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L278)

<a id="function-function-mq3-platform-win-main-runtime-sys-listfiles-function-sys-listfiles-directory-extension-filter-wantsubs-src-mq3-platform-win-main-runtime-ml-815686933"></a>
### Sys_ListFiles

```ml
function Sys_ListFiles(directory, extension, filter, wantSubs)
```

Computes `Sys_ListFiles` from `nativeList(directory,wanted,"",wantSubs or directories)` using `mq3.platform.win_main_runtime.nativeList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `directory` | `dynamic` | — | Value forwarded as `directory` to `mq3.platform.win_main_runtime.nativeList`. |
| `extension` | `dynamic` | — | Input used by `wanted=extension`. |
| `filter` | `dynamic` | — | Value forwarded as `filter` to `mq3.platform.win_main_runtime.nativeList`. |
| `wantSubs` | `dynamic` | — | Input used in the result expression `nativeList(directory,wanted,"",wantSubs or directories)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L223)

<a id="function-function-mq3-platform-win-main-runtime-sys-listfilteredfiles-function-sys-listfilteredfiles-basedir-subdirs-filter-src-mq3-platform-win-main-runtime-ml-187056896"></a>
### Sys_ListFilteredFiles

```ml
function Sys_ListFilteredFiles(basedir, subdirs, filter)
```

Obtains filtered native file names and optionally restricts results to a case-insensitive subdirectory prefix.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basedir` | `dynamic` | — | Value forwarded as `directory` to `mq3.platform.win_main_runtime.nativeList`. |
| `subdirs` | `dynamic` | — | Input tested by `found is error or subdirs==""`. |
| `filter` | `dynamic` | — | Value forwarded as `filter` to `mq3.platform.win_main_runtime.nativeList`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L204)

<a id="function-function-mq3-platform-win-main-runtime-sys-loaddll-function-sys-loaddll-state-name-basepath-cdpath-gamedir-systemcalls-src-mq3-platform-win-main-runtime-ml-358240253"></a>
### Sys_LoadDll

```ml
function Sys_LoadDll(state, name, basepath, cdpath, gamedir, systemCalls)
```

Updates `state.dlls` in `mq3.platform.win_main_runtime.Sys_LoadDll`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.dlls`. |
| `name` | `dynamic` | — | Input used by `filename=name+"x86.dll"`. |
| `basepath` | `dynamic` | — | Value forwarded as `base` to `mq3.platform.win_main_runtime.joinPath`. |
| `cdpath` | `dynamic` | — | Value forwarded as `base` to `mq3.platform.win_main_runtime.joinPath`. |
| `gamedir` | `dynamic` | — | Value forwarded as `game` to `mq3.platform.win_main_runtime.joinPath`. |
| `systemCalls` | `dynamic` | — | Value forwarded as `systemCalls` to `mq3.platform.win_main_runtime.dllAttachNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L270)

<a id="function-function-mq3-platform-win-main-runtime-sys-lowphysicalmemory-function-sys-lowphysicalmemory-src-mq3-platform-win-main-runtime-ml-1719926140"></a>
### Sys_LowPhysicalMemory

```ml
function Sys_LowPhysicalMemory()
```

Computes `lowMemoryNative()!=0` for `mq3.platform.win_main_runtime.Sys_LowPhysicalMemory`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L140)

<a id="function-function-mq3-platform-win-main-runtime-sys-mkdir-function-sys-mkdir-path-src-mq3-platform-win-main-runtime-ml-1818430721"></a>
### Sys_Mkdir

```ml
function Sys_Mkdir(path)
```

Returns `mkdirNative(nativeBytesPtr(data),len(data))!=0` from `mq3.platform.win_main_runtime.Sys_Mkdir`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L171)

<a id="function-function-mq3-platform-win-main-runtime-sys-net-restart-f-function-sys-net-restart-f-state-src-mq3-platform-win-main-runtime-ml-195700041"></a>
### Sys_Net_Restart_f

```ml
function Sys_Net_Restart_f(state)
```

Returns `void` from `mq3.platform.win_main_runtime.Sys_Net_Restart_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.networkRestartFn`, `state.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L348)

<a id="function-function-mq3-platform-win-main-runtime-sys-print-function-sys-print-state-message-src-mq3-platform-win-main-runtime-ml-1173935538"></a>
### Sys_Print

```ml
function Sys_Print(state, message)
```

Updates `state.printed` in `mq3.platform.win_main_runtime.Sys_Print`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.printed`. |
| `message` | `dynamic` | — | Value forwarded as `text` to `mq3.platform.win_main_runtime.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L167)

<a id="function-function-mq3-platform-win-main-runtime-sys-queevent-function-sys-queevent-state-time-type-value-value2-ptrlength-data-src-mq3-platform-win-main-runtime-ml-1965425374"></a>
### Sys_QueEvent

```ml
function Sys_QueEvent(state, time, type, value, value2, ptrLength, data)
```

Updates `state.tail`, `state.overflows`, `state.events[index]`, `state.head` in `mq3.platform.win_main_runtime.Sys_QueEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.tail`, `state.overflows`, `state.events[index]`, `state.head`. |
| `time` | `dynamic` | — | Value used for `mq3.platform.win_main_runtime.Event.time`. |
| `type` | `dynamic` | — | Value used for `mq3.platform.win_main_runtime.Event.type`. |
| `value` | `dynamic` | — | Value used for `mq3.platform.win_main_runtime.Event.value`. |
| `value2` | `dynamic` | — | Value used for `mq3.platform.win_main_runtime.Event.value2`. |
| `ptrLength` | `dynamic` | — | Value used for `mq3.platform.win_main_runtime.Event.ptrLength`. |
| `data` | `dynamic` | — | Value used for `mq3.platform.win_main_runtime.Event.data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L325)

<a id="function-function-mq3-platform-win-main-runtime-sys-quit-function-sys-quit-state-src-mq3-platform-win-main-runtime-ml-362461209"></a>
### Sys_Quit

```ml
function Sys_Quit(state)
```

Updates `state.inputStarted`, `state.quitCode` in `mq3.platform.win_main_runtime.Sys_Quit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.inputStarted`, `state.quitCode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L158)

<a id="function-function-mq3-platform-win-main-runtime-sys-scanforcd-function-sys-scanforcd-src-mq3-platform-win-main-runtime-ml-1652672946"></a>
### Sys_ScanForCD

```ml
function Sys_ScanForCD()
```

Returns `decode(slice(data,0,length))` from `mq3.platform.win_main_runtime.Sys_ScanForCD`; earlier branches return `""`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L233)

<a id="function-function-mq3-platform-win-main-runtime-sys-shutdownstreamthread-function-sys-shutdownstreamthread-state-src-mq3-platform-win-main-runtime-ml-513516045"></a>
### Sys_ShutdownStreamThread

```ml
function Sys_ShutdownStreamThread(state)
```

Updates `state.streamStarted`, `state.streams` in `mq3.platform.win_main_runtime.Sys_ShutdownStreamThread`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.streamStarted`, `state.streams`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L281)

<a id="function-function-mq3-platform-win-main-runtime-sys-streamedread-function-sys-streamedread-stream-size-count-src-mq3-platform-win-main-runtime-ml-823657380"></a>
### Sys_StreamedRead

```ml
function Sys_StreamedRead(stream, size, count)
```

Builds `mq3.platform.win_main_runtime.StreamRead` using `stream.readFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — | Record providing `stream.active`, `stream.readFn`, `stream.context`, `stream.file`. |
| `size` | `dynamic` | — | Input tested by `stream==void or not stream.active or size<=0 or count<0`. |
| `count` | `dynamic` | — | Input tested by `stream==void or not stream.active or size<=0 or count<0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L301)

<a id="function-function-mq3-platform-win-main-runtime-sys-streamseek-function-sys-streamseek-stream-offset-origin-src-mq3-platform-win-main-runtime-ml-15878081"></a>
### Sys_StreamSeek

```ml
function Sys_StreamSeek(stream, offset, origin)
```

Updates `stream.position` in `mq3.platform.win_main_runtime.Sys_StreamSeek`; returns `stream.position`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — | Mutable record or buffer; this call updates `stream.position`. |
| `offset` | `dynamic` | — | Argument 3 supplied to `stream.seekFn`. |
| `origin` | `dynamic` | — | Argument 4 supplied to `stream.seekFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L309)

<a id="function-function-mq3-platform-win-main-runtime-sys-streamthread-function-sys-streamthread-state-src-mq3-platform-win-main-runtime-ml-883851793"></a>
### Sys_StreamThread

```ml
function Sys_StreamThread(state)
```

Computes `state!=void and state.streamStarted` for `mq3.platform.win_main_runtime.Sys_StreamThread`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.streamStarted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L312)

<a id="function-function-mq3-platform-win-main-runtime-sys-unloaddll-function-sys-unloaddll-state-dll-src-mq3-platform-win-main-runtime-ml-1137417385"></a>
### Sys_UnloadDll

```ml
function Sys_UnloadDll(state, dll)
```

Updates `dll.handle`, `dll.entryPoint` in `mq3.platform.win_main_runtime.Sys_UnloadDll`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `dll` | `dynamic` | — | Mutable record or buffer; this call updates `dll.handle`, `dll.entryPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L242)

<a id="function-function-mq3-platform-win-main-runtime-trydll-function-trydll-path-src-mq3-platform-win-main-runtime-ml-794174771"></a>
### tryDll

```ml
function tryDll(path)
```

Builds `mq3.platform.win_main_runtime.Dll` for `mq3.platform.win_main_runtime.tryDll`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | Initial value for `mq3.platform.win_main_runtime.Dll.path`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L257)

<a id="function-function-mq3-platform-win-main-runtime-winmain-function-winmain-state-commandline-maxframes-src-mq3-platform-win-main-runtime-ml-1267629102"></a>
### WinMain

```ml
function WinMain(state, commandLine, maxFrames)
```

Updates `state.commandLine`, `state.consoleVisible`, `state.networkStarted`, `state.totalMsec`, `state.frameCount` in `mq3.platform.win_main_runtime.WinMain`; returns `state.frameCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.commandLine`, `state.consoleVisible`, `state.networkStarted`, `state.totalMsec`, `state.frameCount`. |
| `commandLine` | `dynamic` | — | Value assigned to `state.commandLine`. |
| `maxFrames` | `dynamic` | — | Input tested by `state==void or maxFrames<0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L374)
