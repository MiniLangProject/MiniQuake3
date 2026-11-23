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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L23)

<a id="function-function-mq3-platform-win-main-runtime-create-function-create-src-mq3-platform-win-main-runtime-ml-507331032"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L47)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-cwdnative-extern-function-cwdnative-output-as-bytes-capacity-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-cwd-returns-i32-src-mq3-platform-win-main-runtime-ml-1875347203"></a>
### cwdNative

```ml
extern function cwdNative(output as bytes, capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_cwd" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L21)

<a id="function-function-mq3-platform-win-main-runtime-decodefilelist-function-decodefilelist-data-size-src-mq3-platform-win-main-runtime-ml-115241125"></a>
### decodeFileList

```ml
function decodeFileList(data, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L89)

- [mq3.platform.win_main_runtime.Dll](Type-mq3-platform-win-main-runtime-dll-1708592090.md) — struct
<a id="extern_function-extern-function-mq3-platform-win-main-runtime-dllattachnative-extern-function-dllattachnative-handle-as-ptr-systemcalls-as-ptr-from-miniquake3-winmain-dll-symbol-mq3-winmain-dll-attach-returns-i32-src-mq3-platform-win-main-runtime-ml-2056586367"></a>
### dllAttachNative

```ml
extern function dllAttachNative(handle as ptr, systemCalls as ptr) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_attach" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — |  |
| `systemCalls` | `ptr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L31)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-dllloadnative-extern-function-dllloadnative-path-as-ptr-length-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-dll-load-returns-ptr-src-mq3-platform-win-main-runtime-ml-415310635"></a>
### dllLoadNative

```ml
extern function dllLoadNative(path as ptr, length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_load" returns ptr
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `ptr` | — |  |
| `length` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L29)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-dllsymbolnative-extern-function-dllsymbolnative-handle-as-ptr-name-as-ptr-from-miniquake3-winmain-dll-symbol-mq3-winmain-dll-symbol-returns-ptr-src-mq3-platform-win-main-runtime-ml-832282803"></a>
### dllSymbolNative

```ml
extern function dllSymbolNative(handle as ptr, name as ptr) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_symbol" returns ptr
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — |  |
| `name` | `ptr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L30)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-dllunloadnative-extern-function-dllunloadnative-handle-as-ptr-from-miniquake3-winmain-dll-symbol-mq3-winmain-dll-unload-returns-i32-src-mq3-platform-win-main-runtime-ml-1640381653"></a>
### dllUnloadNative

```ml
extern function dllUnloadNative(handle as ptr) from "miniquake3_winmain.dll" symbol "mq3_winmain_dll_unload" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `ptr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L32)

<a id="function-function-mq3-platform-win-main-runtime-emit-function-emit-state-kind-text-value-src-mq3-platform-win-main-runtime-ml-1246652025"></a>
### emit

```ml
function emit(state, kind, text, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L53)

- [mq3.platform.win_main_runtime.Event](Type-mq3-platform-win-main-runtime-event-1151323654.md) — struct
<a id="function-function-mq3-platform-win-main-runtime-joinpath-function-joinpath-base-game-name-src-mq3-platform-win-main-runtime-ml-174494912"></a>
### joinPath

```ml
function joinPath(base, game, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `base` | `dynamic` | — |  |
| `game` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L129)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-listfilesnative-extern-function-listfilesnative-directory-as-ptr-directorylength-as-i32-extension-as-ptr-extensionlength-as-i32-filter-as-ptr-filterlength-as-i32-wantsubs-as-i32-output-as-bytes-capacity-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-list-files-returns-i32-src-mq3-platform-win-main-runtime-ml-821449092"></a>
### listFilesNative

```ml
extern function listFilesNative(directory as ptr, directoryLength as i32, extension as ptr, extensionLength as i32, filter as ptr, filterLength as i32, wantSubs as i32, output as bytes, capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_list_files" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `directory` | `ptr` | — |  |
| `directoryLength` | `i32` | — |  |
| `extension` | `ptr` | — |  |
| `extensionLength` | `i32` | — |  |
| `filter` | `ptr` | — |  |
| `filterLength` | `i32` | — |  |
| `wantSubs` | `i32` | — |  |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L28)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-lowmemorynative-extern-function-lowmemorynative-from-miniquake3-winmain-dll-symbol-mq3-winmain-low-physical-memory-returns-i32-src-mq3-platform-win-main-runtime-ml-1570351603"></a>
### lowMemoryNative

```ml
extern function lowMemoryNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_low_physical_memory" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L19)

<a id="constant-constant-mq3-platform-win-main-runtime-max-found-files-const-max-found-files-4096-src-mq3-platform-win-main-runtime-ml-74934640"></a>
### MAX_FOUND_FILES

```ml
const MAX_FOUND_FILES = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L9)

<a id="constant-constant-mq3-platform-win-main-runtime-max-qued-events-const-max-qued-events-256-src-mq3-platform-win-main-runtime-ml-519483546"></a>
### MAX_QUED_EVENTS

```ml
const MAX_QUED_EVENTS = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L10)

<a id="constant-constant-mq3-platform-win-main-runtime-mem-threshold-const-mem-threshold-100663296-src-mq3-platform-win-main-runtime-ml-744323022"></a>
### MEM_THRESHOLD

```ml
const MEM_THRESHOLD = 100663296
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L8)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-millisecondsnative-extern-function-millisecondsnative-from-miniquake3-winmain-dll-symbol-mq3-winmain-milliseconds-returns-u32-src-mq3-platform-win-main-runtime-ml-1252643997"></a>
### millisecondsNative

```ml
extern function millisecondsNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_milliseconds" returns u32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L20)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-mkdirnative-extern-function-mkdirnative-path-as-ptr-length-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-mkdir-returns-i32-src-mq3-platform-win-main-runtime-ml-154117721"></a>
### mkdirNative

```ml
extern function mkdirNative(path as ptr, length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_mkdir" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `ptr` | — |  |
| `length` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L22)

<a id="function-function-mq3-platform-win-main-runtime-nativelist-function-nativelist-directory-extension-filter-wantsubs-src-mq3-platform-win-main-runtime-ml-977291299"></a>
### nativeList

```ml
function nativeList(directory, extension, filter, wantSubs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `directory` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |
| `filter` | `dynamic` | — |  |
| `wantSubs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L96)

<a id="function-function-mq3-platform-win-main-runtime-now-function-now-state-src-mq3-platform-win-main-runtime-ml-1451425981"></a>
### now

```ml
function now(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L159)

<a id="function-function-mq3-platform-win-main-runtime-popevent-function-popevent-state-src-mq3-platform-win-main-runtime-ml-1051158625"></a>
### popEvent

```ml
function popEvent(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L165)

- [mq3.platform.win_main_runtime.Runtime](Type-mq3-platform-win-main-runtime-runtime-1096450402.md) — struct
<a id="extern_function-extern-function-mq3-platform-win-main-runtime-scancdnative-extern-function-scancdnative-output-as-bytes-capacity-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-scan-cd-returns-i32-src-mq3-platform-win-main-runtime-ml-1311117002"></a>
### scanCdNative

```ml
extern function scanCdNative(output as bytes, capacity as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_scan_cd" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `bytes` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L24)

<a id="constant-constant-mq3-platform-win-main-runtime-se-char-const-se-char-2-src-mq3-platform-win-main-runtime-ml-1183054911"></a>
### SE_CHAR

```ml
const SE_CHAR = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L13)

<a id="constant-constant-mq3-platform-win-main-runtime-se-console-const-se-console-5-src-mq3-platform-win-main-runtime-ml-376326042"></a>
### SE_CONSOLE

```ml
const SE_CONSOLE = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L16)

<a id="constant-constant-mq3-platform-win-main-runtime-se-joystick-axis-const-se-joystick-axis-4-src-mq3-platform-win-main-runtime-ml-56219933"></a>
### SE_JOYSTICK_AXIS

```ml
const SE_JOYSTICK_AXIS = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L15)

<a id="constant-constant-mq3-platform-win-main-runtime-se-key-const-se-key-1-src-mq3-platform-win-main-runtime-ml-90342426"></a>
### SE_KEY

```ml
const SE_KEY = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L12)

<a id="constant-constant-mq3-platform-win-main-runtime-se-mouse-const-se-mouse-3-src-mq3-platform-win-main-runtime-ml-1222589344"></a>
### SE_MOUSE

```ml
const SE_MOUSE = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L14)

<a id="constant-constant-mq3-platform-win-main-runtime-se-none-const-se-none-0-src-mq3-platform-win-main-runtime-ml-10255469"></a>
### SE_NONE

```ml
const SE_NONE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L11)

<a id="constant-constant-mq3-platform-win-main-runtime-se-packet-const-se-packet-6-src-mq3-platform-win-main-runtime-ml-1690933667"></a>
### SE_PACKET

```ml
const SE_PACKET = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L17)

<a id="function-function-mq3-platform-win-main-runtime-spk-close-function-spk-close-state-src-mq3-platform-win-main-runtime-ml-1210033455"></a>
### Spk_Close

```ml
function Spk_Close(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L59)

<a id="function-function-mq3-platform-win-main-runtime-spk-open-function-spk-open-state-name-src-mq3-platform-win-main-runtime-ml-1016680966"></a>
### Spk_Open

```ml
function Spk_Open(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L55)

<a id="function-function-mq3-platform-win-main-runtime-spk-printf-function-spk-printf-state-text-src-mq3-platform-win-main-runtime-ml-1691994042"></a>
### Spk_Printf

```ml
function Spk_Printf(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L60)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-spkclosenative-extern-function-spkclosenative-from-miniquake3-winmain-dll-symbol-mq3-winmain-spk-close-returns-void-src-mq3-platform-win-main-runtime-ml-1294959200"></a>
### spkCloseNative

```ml
extern function spkCloseNative() from "miniquake3_winmain.dll" symbol "mq3_winmain_spk_close" returns void
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L27)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-spkopennative-extern-function-spkopennative-path-as-ptr-length-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-spk-open-returns-i32-src-mq3-platform-win-main-runtime-ml-1337106103"></a>
### spkOpenNative

```ml
extern function spkOpenNative(path as ptr, length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_spk_open" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `ptr` | — |  |
| `length` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L25)

<a id="extern_function-extern-function-mq3-platform-win-main-runtime-spkwritenative-extern-function-spkwritenative-text-as-ptr-length-as-i32-from-miniquake3-winmain-dll-symbol-mq3-winmain-spk-write-returns-i32-src-mq3-platform-win-main-runtime-ml-613055826"></a>
### spkWriteNative

```ml
extern function spkWriteNative(text as ptr, length as i32) from "miniquake3_winmain.dll" symbol "mq3_winmain_spk_write" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `ptr` | — |  |
| `length` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L26)

- [mq3.platform.win_main_runtime.Stream](Type-mq3-platform-win-main-runtime-stream-174207922.md) — struct
- [mq3.platform.win_main_runtime.StreamRead](Type-mq3-platform-win-main-runtime-streamread-1544338586.md) — struct
<a id="function-function-mq3-platform-win-main-runtime-strgtr-function-strgtr-s0-s1-src-mq3-platform-win-main-runtime-ml-1969248015"></a>
### strgtr

```ml
function strgtr(s0, s1)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s0` | `dynamic` | — |  |
| `s1` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L108)

<a id="function-function-mq3-platform-win-main-runtime-sys-beginprofiling-function-sys-beginprofiling-state-src-mq3-platform-win-main-runtime-ml-870702333"></a>
### Sys_BeginProfiling

```ml
function Sys_BeginProfiling(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L66)

<a id="function-function-mq3-platform-win-main-runtime-sys-beginstreamedfile-function-sys-beginstreamedfile-state-file-readahead-context-readfn-seekfn-src-mq3-platform-win-main-runtime-ml-46284591"></a>
### Sys_BeginStreamedFile

```ml
function Sys_BeginStreamedFile(state, file, readAhead, context, readFn, seekFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |
| `readAhead` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `readFn` | `dynamic` | — |  |
| `seekFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L147)

<a id="function-function-mq3-platform-win-main-runtime-sys-checkcd-function-sys-checkcd-src-mq3-platform-win-main-runtime-ml-640671266"></a>
### Sys_CheckCD

```ml
function Sys_CheckCD()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L121)

<a id="function-function-mq3-platform-win-main-runtime-sys-cwd-function-sys-cwd-src-mq3-platform-win-main-runtime-ml-922687696"></a>
### Sys_Cwd

```ml
function Sys_Cwd()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L85)

<a id="function-function-mq3-platform-win-main-runtime-sys-defaultbasepath-function-sys-defaultbasepath-src-mq3-platform-win-main-runtime-ml-939471538"></a>
### Sys_DefaultBasePath

```ml
function Sys_DefaultBasePath()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L87)

<a id="function-function-mq3-platform-win-main-runtime-sys-defaultcdpath-function-sys-defaultcdpath-src-mq3-platform-win-main-runtime-ml-205180742"></a>
### Sys_DefaultCDPath

```ml
function Sys_DefaultCDPath()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L86)

<a id="function-function-mq3-platform-win-main-runtime-sys-endstreamedfile-function-sys-endstreamedfile-state-stream-src-mq3-platform-win-main-runtime-ml-837972185"></a>
### Sys_EndStreamedFile

```ml
function Sys_EndStreamedFile(state, stream)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `stream` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L151)

<a id="function-function-mq3-platform-win-main-runtime-sys-error-function-sys-error-state-text-src-mq3-platform-win-main-runtime-ml-291893230"></a>
### Sys_Error

```ml
function Sys_Error(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L68)

<a id="function-function-mq3-platform-win-main-runtime-sys-freefilelist-function-sys-freefilelist-list-src-mq3-platform-win-main-runtime-ml-1729190668"></a>
### Sys_FreeFileList

```ml
function Sys_FreeFileList(list)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L118)

<a id="function-function-mq3-platform-win-main-runtime-sys-getclipboarddata-function-sys-getclipboarddata-src-mq3-platform-win-main-runtime-ml-470076584"></a>
### Sys_GetClipboardData

```ml
function Sys_GetClipboardData()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L122)

<a id="function-function-mq3-platform-win-main-runtime-sys-getevent-function-sys-getevent-state-src-mq3-platform-win-main-runtime-ml-402022929"></a>
### Sys_GetEvent

```ml
function Sys_GetEvent(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L166)

<a id="function-function-mq3-platform-win-main-runtime-sys-in-restart-f-function-sys-in-restart-f-state-src-mq3-platform-win-main-runtime-ml-1939687301"></a>
### Sys_In_Restart_f

```ml
function Sys_In_Restart_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L174)

<a id="function-function-mq3-platform-win-main-runtime-sys-init-function-sys-init-state-platform-major-build-cpuid-currentuser-src-mq3-platform-win-main-runtime-ml-2066092870"></a>
### Sys_Init

```ml
function Sys_Init(state, platform, major, build, cpuId, currentUser)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `platform` | `dynamic` | — |  |
| `major` | `dynamic` | — |  |
| `build` | `dynamic` | — |  |
| `cpuId` | `dynamic` | — |  |
| `currentUser` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L176)

<a id="function-function-mq3-platform-win-main-runtime-sys-initstreamthread-function-sys-initstreamthread-state-src-mq3-platform-win-main-runtime-ml-991337321"></a>
### Sys_InitStreamThread

```ml
function Sys_InitStreamThread(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L145)

<a id="function-function-mq3-platform-win-main-runtime-sys-listfiles-function-sys-listfiles-directory-extension-filter-wantsubs-src-mq3-platform-win-main-runtime-ml-815686933"></a>
### Sys_ListFiles

```ml
function Sys_ListFiles(directory, extension, filter, wantSubs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `directory` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |
| `filter` | `dynamic` | — |  |
| `wantSubs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L113)

<a id="function-function-mq3-platform-win-main-runtime-sys-listfilteredfiles-function-sys-listfilteredfiles-basedir-subdirs-filter-src-mq3-platform-win-main-runtime-ml-187056896"></a>
### Sys_ListFilteredFiles

```ml
function Sys_ListFilteredFiles(basedir, subdirs, filter)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basedir` | `dynamic` | — |  |
| `subdirs` | `dynamic` | — |  |
| `filter` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L102)

<a id="function-function-mq3-platform-win-main-runtime-sys-loaddll-function-sys-loaddll-state-name-basepath-cdpath-gamedir-systemcalls-src-mq3-platform-win-main-runtime-ml-358240253"></a>
### Sys_LoadDll

```ml
function Sys_LoadDll(state, name, basepath, cdpath, gamedir, systemCalls)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `basepath` | `dynamic` | — |  |
| `cdpath` | `dynamic` | — |  |
| `gamedir` | `dynamic` | — |  |
| `systemCalls` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L139)

<a id="function-function-mq3-platform-win-main-runtime-sys-lowphysicalmemory-function-sys-lowphysicalmemory-src-mq3-platform-win-main-runtime-ml-1719926140"></a>
### Sys_LowPhysicalMemory

```ml
function Sys_LowPhysicalMemory()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L65)

<a id="function-function-mq3-platform-win-main-runtime-sys-mkdir-function-sys-mkdir-path-src-mq3-platform-win-main-runtime-ml-1818430721"></a>
### Sys_Mkdir

```ml
function Sys_Mkdir(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L84)

<a id="function-function-mq3-platform-win-main-runtime-sys-net-restart-f-function-sys-net-restart-f-state-src-mq3-platform-win-main-runtime-ml-195700041"></a>
### Sys_Net_Restart_f

```ml
function Sys_Net_Restart_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L175)

<a id="function-function-mq3-platform-win-main-runtime-sys-print-function-sys-print-state-message-src-mq3-platform-win-main-runtime-ml-1173935538"></a>
### Sys_Print

```ml
function Sys_Print(state, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L82)

<a id="function-function-mq3-platform-win-main-runtime-sys-queevent-function-sys-queevent-state-time-type-value-value2-ptrlength-data-src-mq3-platform-win-main-runtime-ml-1965425374"></a>
### Sys_QueEvent

```ml
function Sys_QueEvent(state, time, type, value, value2, ptrLength, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |
| `ptrLength` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L160)

<a id="function-function-mq3-platform-win-main-runtime-sys-quit-function-sys-quit-state-src-mq3-platform-win-main-runtime-ml-362461209"></a>
### Sys_Quit

```ml
function Sys_Quit(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L76)

<a id="function-function-mq3-platform-win-main-runtime-sys-scanforcd-function-sys-scanforcd-src-mq3-platform-win-main-runtime-ml-1652672946"></a>
### Sys_ScanForCD

```ml
function Sys_ScanForCD()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L120)

<a id="function-function-mq3-platform-win-main-runtime-sys-shutdownstreamthread-function-sys-shutdownstreamthread-state-src-mq3-platform-win-main-runtime-ml-513516045"></a>
### Sys_ShutdownStreamThread

```ml
function Sys_ShutdownStreamThread(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L146)

<a id="function-function-mq3-platform-win-main-runtime-sys-streamedread-function-sys-streamedread-stream-size-count-src-mq3-platform-win-main-runtime-ml-823657380"></a>
### Sys_StreamedRead

```ml
function Sys_StreamedRead(stream, size, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L152)

<a id="function-function-mq3-platform-win-main-runtime-sys-streamseek-function-sys-streamseek-stream-offset-origin-src-mq3-platform-win-main-runtime-ml-15878081"></a>
### Sys_StreamSeek

```ml
function Sys_StreamSeek(stream, offset, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L156)

<a id="function-function-mq3-platform-win-main-runtime-sys-streamthread-function-sys-streamthread-state-src-mq3-platform-win-main-runtime-ml-883851793"></a>
### Sys_StreamThread

```ml
function Sys_StreamThread(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L157)

<a id="function-function-mq3-platform-win-main-runtime-sys-unloaddll-function-sys-unloaddll-state-dll-src-mq3-platform-win-main-runtime-ml-1137417385"></a>
### Sys_UnloadDll

```ml
function Sys_UnloadDll(state, dll)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `dll` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L124)

<a id="function-function-mq3-platform-win-main-runtime-trydll-function-trydll-path-src-mq3-platform-win-main-runtime-ml-794174771"></a>
### tryDll

```ml
function tryDll(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L133)

<a id="function-function-mq3-platform-win-main-runtime-winmain-function-winmain-state-commandline-maxframes-src-mq3-platform-win-main-runtime-ml-1267629102"></a>
### WinMain

```ml
function WinMain(state, commandLine, maxFrames)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `commandLine` | `dynamic` | — |  |
| `maxFrames` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_main_runtime.ml#L190)
