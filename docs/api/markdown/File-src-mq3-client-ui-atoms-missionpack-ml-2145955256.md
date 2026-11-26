# `src/mq3/client/ui_atoms_missionpack.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_atoms_missionpack`](Package-mq3-client-ui-atoms-missionpack-90233106.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_syscalls_missionpack.ml` as `traps` → [src/mq3/client/ui_syscalls_missionpack.ml](File-src-mq3-client-ui-syscalls-missionpack-ml-1966791630.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.ui_atoms_missionpack.Action](Type-mq3-client-ui-atoms-missionpack-action-1248125558.md) — struct
<a id="constant-constant-mq3-client-ui-atoms-missionpack-bigchar-height-const-bigchar-height-16-src-mq3-client-ui-atoms-missionpack-ml-1288154650"></a>
### BIGCHAR_HEIGHT

```ml
const BIGCHAR_HEIGHT = 16
```

Bigchar font metric controlling height in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L25)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-bigchar-width-const-bigchar-width-16-src-mq3-client-ui-atoms-missionpack-ml-1504963056"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```

Bigchar font metric controlling width in virtual UI coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L23)

<a id="function-function-mq3-client-ui-atoms-missionpack-com-error-function-com-error-state-level-message-src-mq3-client-ui-atoms-missionpack-ml-2024267816"></a>
### Com_Error

```ml
function Com_Error(state, level, message)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_Error` from UI atoms missionpack `Com_Error`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |
| `level` | `dynamic` | — | Accepted for compatibility with `Com_Error`; the current implementation does not read it. |
| `message` | `dynamic` | — | Value used by `traps.trap_Error(state.syscalls,message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L167)

<a id="function-function-mq3-client-ui-atoms-missionpack-com-printf-function-com-printf-state-message-src-mq3-client-ui-atoms-missionpack-ml-1697642168"></a>
### Com_Printf

```ml
function Com_Printf(state, message)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_Print` from UI atoms missionpack `Com_Printf`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |
| `message` | `dynamic` | — | Value used by `traps.trap_Print(state.syscalls,message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L171)

<a id="function-function-mq3-client-ui-atoms-missionpack-create-function-create-syscalls-src-mq3-client-ui-atoms-missionpack-ml-201961226"></a>
### create

```ml
function create(syscalls)
```

Calls `mq3.client.ui_atoms_missionpack.State` from UI atoms missionpack `create`. The final path returns `State(syscalls,1.0,1.0,0,0,320,240,0,false,0,0,array(16,0),[],void,void,false)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `syscalls` | `dynamic` | — | Value used by `if syscalls==void then return error(7830,"Missionpack UI atoms: syscall state is required") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L129)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-cs-serverinfo-const-cs-serverinfo-0-src-mq3-client-ui-atoms-missionpack-ml-470540553"></a>
### CS_SERVERINFO

```ml
const CS_SERVERINFO = 0
```

Server configuration-string index for serverinfo; shared by the client and game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L19)

<a id="function-function-mq3-client-ui-atoms-missionpack-cvarset-function-cvarset-state-name-value-src-mq3-client-ui-atoms-missionpack-ml-1537404631"></a>
### cvarSet

```ml
function cvarSet(state, name, value)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_Cvar_Set` from UI atoms missionpack `cvarSet`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI atoms missionpack resource. |
| `value` | `dynamic` | — | Value used by `traps.trap_Cvar_Set(state.syscalls,name,value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L161)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-exec-append-const-exec-append-2-src-mq3-client-ui-atoms-missionpack-ml-1733218651"></a>
### EXEC_APPEND

```ml
const EXEC_APPEND = 2
```

Console execution mode that appends text to the pending command buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L13)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-fs-read-const-fs-read-0-src-mq3-client-ui-atoms-missionpack-ml-606593433"></a>
### FS_READ

```ml
const FS_READ = 0
```

Virtual-filesystem open mode requesting read access.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L15)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-fs-write-const-fs-write-1-src-mq3-client-ui-atoms-missionpack-ml-651762564"></a>
### FS_WRITE

```ml
const FS_WRITE = 1
```

Virtual-filesystem open mode requesting write access.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L17)

<a id="function-function-mq3-client-ui-atoms-missionpack-internal-function-internal-state-kind-arguments-src-mq3-client-ui-atoms-missionpack-ml-1428806665"></a>
### internal

```ml
function internal(state, kind, arguments)
```

Updates `state.actions` during UI atoms missionpack `internal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms missionpack record/storage; this routine assigns `state.actions`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `arguments` | `dynamic` | — | Value used by `action=Action(kind,arguments,state.internalFn!=void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L150)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-max-string-chars-const-max-string-chars-1024-src-mq3-client-ui-atoms-missionpack-ml-1576263358"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```

Maximum length of a protocol, command, or configuration string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L27)

<a id="function-function-mq3-client-ui-atoms-missionpack-needcdaction-function-needcdaction-state-result-src-mq3-client-ui-atoms-missionpack-ml-504164636"></a>
### NeedCDAction

```ml
function NeedCDAction(state, result)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_Cmd_ExecuteText` from UI atoms missionpack `NeedCDAction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |
| `result` | `dynamic` | — | Value used by `if not result then traps.trap_Cmd_ExecuteText(state.syscalls,EXEC_APPEND,"quit\\n") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L183)

<a id="function-function-mq3-client-ui-atoms-missionpack-needcdkeyaction-function-needcdkeyaction-state-result-src-mq3-client-ui-atoms-missionpack-ml-407425336"></a>
### NeedCDKeyAction

```ml
function NeedCDKeyAction(state, result)
```

Adapts `mq3.client.ui_atoms_missionpack.NeedCDAction` to UI atoms missionpack `NeedCDKeyAction`, returning its result for `state, result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_atoms_missionpack.NeedCDAction`. |
| `result` | `dynamic` | — | Argument 2 of `mq3.client.ui_atoms_missionpack.NeedCDAction`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L187)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-postgame-info-size-const-postgame-info-size-64-src-mq3-client-ui-atoms-missionpack-ml-934025083"></a>
### POSTGAME_INFO_SIZE

```ml
const POSTGAME_INFO_SIZE = 64
```

Size in bytes of the native postgame-information record used by the compatibility ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L21)

<a id="function-function-mq3-client-ui-atoms-missionpack-postgameinfo-function-postgameinfo-src-mq3-client-ui-atoms-missionpack-ml-1442279660"></a>
### postGameInfo

```ml
function postGameInfo()
```

Creates a `mq3.client.ui_atoms_missionpack.PostGameInfo` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L126)

- [mq3.client.ui_atoms_missionpack.PostGameInfo](Type-mq3-client-ui-atoms-missionpack-postgameinfo-1834226824.md) — struct
<a id="function-function-mq3-client-ui-atoms-missionpack-readscorefile-function-readscorefile-state-filename-src-mq3-client-ui-atoms-missionpack-ml-2009607956"></a>
### readScoreFile

```ml
function readScoreFile(state, filename)
```

Calls `mq3.client.ui_atoms_missionpack.postGameInfo`, `mq3.client.ui_syscalls_missionpack.trap_FS_FOpenFile`, `mq3.client.ui_syscalls_missionpack.trap_FS_Read` and additional helpers from UI atoms missionpack `readScoreFile`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L213)

<a id="function-function-mq3-client-ui-atoms-missionpack-scorevalue-function-scorevalue-value-src-mq3-client-ui-atoms-missionpack-ml-992901973"></a>
### scoreValue

```ml
function scoreValue(value)
```

Converts to text `value` for UI atoms missionpack `scoreValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 of `str`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L156)

<a id="function-function-mq3-client-ui-atoms-missionpack-setdisplaycontext-function-setdisplaycontext-state-xscale-yscale-cursorx-cursory-whiteshader-src-mq3-client-ui-atoms-missionpack-ml-2133536575"></a>
### setDisplayContext

```ml
function setDisplayContext(state, xscale, yscale, cursorx, cursory, whiteShader)
```

Updates `state.xscale`, `state.yscale`, `state.cursorx`, `state.cursory` and additional values during UI atoms missionpack `setDisplayContext`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms missionpack record/storage; this routine assigns `state.xscale`, `state.yscale`, `state.cursorx`, `state.cursory` and additional values. |
| `xscale` | `dynamic` | — | Value assigned to `state.xscale`. |
| `yscale` | `dynamic` | — | Value assigned to `state.yscale`. |
| `cursorx` | `dynamic` | — | Value assigned to `state.cursorx`. |
| `cursory` | `dynamic` | — | Value assigned to `state.cursory`. |
| `whiteShader` | `dynamic` | — | Value assigned to `state.whiteShader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L140)

<a id="function-function-mq3-client-ui-atoms-missionpack-setinternalhandler-function-setinternalhandler-state-context-callback-src-mq3-client-ui-atoms-missionpack-ml-1928393467"></a>
### setInternalHandler

```ml
function setInternalHandler(state, context, callback)
```

Updates `state.internalContext`, `state.internalFn` during UI atoms missionpack `setInternalHandler`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms missionpack record/storage; this routine assigns `state.internalContext`, `state.internalFn`. |
| `context` | `dynamic` | — | Value assigned to `state.internalContext`. |
| `callback` | `dynamic` | — | Value assigned to `state.internalFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L145)

- [mq3.client.ui_atoms_missionpack.State](Type-mq3-client-ui-atoms-missionpack-state-1496372201.md) — struct
<a id="function-function-mq3-client-ui-atoms-missionpack-two-function-two-value-src-mq3-client-ui-atoms-missionpack-ml-1857542713"></a>
### two

```ml
function two(value)
```

Evaluates UI atoms missionpack `two` and returns `"0"+str(value)`, `str(value)` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<10 and value>=0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L153)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-adjustfrom640-function-ui-adjustfrom640-state-x-y-w-h-src-mq3-client-ui-atoms-missionpack-ml-1990680793"></a>
### UI_AdjustFrom640

```ml
function UI_AdjustFrom640(state, x, y, w, h)
```

Builds the UI atoms missionpack `UI_AdjustFrom640` sequence from `[x*state.xscale,y*state.yscale,w*state.xscale,h*state.yscale]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.xscale`, `state.yscale`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_AdjustFrom640`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_AdjustFrom640`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `UI_AdjustFrom640`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `UI_AdjustFrom640`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L277)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-argv-function-ui-argv-state-arg-src-mq3-client-ui-atoms-missionpack-ml-1148389317"></a>
### UI_Argv

```ml
function UI_Argv(state, arg)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_Argv` from UI atoms missionpack `UI_Argv`. The final path returns `buffer[0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |
| `arg` | `dynamic` | — | Value used by `traps.trap_Argv(state.syscalls,arg,buffer,MAX_STRING_CHARS)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L192)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-cache-f-function-ui-cache-f-state-src-mq3-client-ui-atoms-missionpack-ml-278725069"></a>
### UI_Cache_f

```ml
function UI_Cache_f(state)
```

Adapts `mq3.client.ui_atoms_missionpack.internal` to UI atoms missionpack `UI_Cache_f`, returning its result for `state, "display-cache-all", []`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_atoms_missionpack.internal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L241)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-calcpostgamestats-function-ui-calcpostgamestats-state-src-mq3-client-ui-atoms-missionpack-ml-875167285"></a>
### UI_CalcPostGameStats

```ml
function UI_CalcPostGameStats(state)
```

Updates `state.newHighScoreTime`, `state.newBestTime` during UI atoms missionpack `UI_CalcPostGameStats`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms missionpack record/storage; this routine assigns `state.newHighScoreTime`, `state.newBestTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L245)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-clampcvar-function-ui-clampcvar-minimum-maximum-value-src-mq3-client-ui-atoms-missionpack-ml-2113474779"></a>
### UI_ClampCvar

```ml
function UI_ClampCvar(minimum, maximum, value)
```

Evaluates UI atoms missionpack `UI_ClampCvar` and returns `minimum`, `maximum`, `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `minimum` | `dynamic` | — | Value used by `if value<minimum then return minimum end if`. |
| `maximum` | `dynamic` | — | Value used by `if value>maximum then return maximum end if`. |
| `value` | `dynamic` | — | Value tested by `value<minimum`, `value>maximum` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L176)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-clearscores-function-ui-clearscores-state-src-mq3-client-ui-atoms-missionpack-ml-2080293197"></a>
### UI_ClearScores

```ml
function UI_ClearScores(state)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_FS_GetFileList`, `mq3.client.ui_atoms_missionpack.postGameInfo`, `mq3.client.ui_atoms_missionpack.writeScoreFile` and additional helpers from UI atoms missionpack `UI_ClearScores`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L235)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-consolecommand-function-ui-consolecommand-state-realtime-src-mq3-client-ui-atoms-missionpack-ml-1217012918"></a>
### UI_ConsoleCommand

```ml
function UI_ConsoleCommand(state, realTime)
```

Updates `state.frametime`, `state.realtime` during UI atoms missionpack `UI_ConsoleCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms missionpack record/storage; this routine assigns `state.frametime`, `state.realtime`. |
| `realTime` | `dynamic` | — | Value assigned to `state.frametime`, `state.realtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L256)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-cursorinrect-function-ui-cursorinrect-state-x-y-width-height-src-mq3-client-ui-atoms-missionpack-ml-1559952853"></a>
### UI_CursorInRect

```ml
function UI_CursorInRect(state, x, y, width, height)
```

Computes `state.cursorx>=x and state.cursory>=y and state.cursorx<=x+width and state.cursory<=y+height` for UI atoms missionpack `UI_CursorInRect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.cursorx`, `state.cursory`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_CursorInRect`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_CursorInRect`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `UI_CursorInRect`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `UI_CursorInRect`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L344)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-cvar-variablestring-function-ui-cvar-variablestring-state-name-src-mq3-client-ui-atoms-missionpack-ml-572000414"></a>
### UI_Cvar_VariableString

```ml
function UI_Cvar_VariableString(state, name)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_Cvar_VariableStringBuffer` from UI atoms missionpack `UI_Cvar_VariableString`. The final path returns `buffer[0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI atoms missionpack resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L196)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-drawhandlepic-function-ui-drawhandlepic-state-x-y-w-h-shader-src-mq3-client-ui-atoms-missionpack-ml-1746293260"></a>
### UI_DrawHandlePic

```ml
function UI_DrawHandlePic(state, x, y, w, h, shader)
```

Calls `mq3.client.ui_atoms_missionpack.UI_AdjustFrom640`, `mq3.client.ui_syscalls_missionpack.trap_R_DrawStretchPic` from UI atoms missionpack `UI_DrawHandlePic`. The final path returns `value+[s0,t0,s1,t1]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawHandlePic`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawHandlePic`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `UI_DrawHandlePic`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `UI_DrawHandlePic`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L293)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-drawnamedpic-function-ui-drawnamedpic-state-x-y-width-height-picname-src-mq3-client-ui-atoms-missionpack-ml-1703293908"></a>
### UI_DrawNamedPic

```ml
function UI_DrawNamedPic(state, x, y, width, height, picname)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_R_RegisterShaderNoMip`, `mq3.client.ui_atoms_missionpack.UI_AdjustFrom640`, `mq3.client.ui_syscalls_missionpack.trap_R_DrawStretchPic` from UI atoms missionpack `UI_DrawNamedPic`. The final path returns `shader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawNamedPic`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawNamedPic`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `UI_DrawNamedPic`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `UI_DrawNamedPic`. |
| `picname` | `dynamic` | — | Value used by `shader=traps.trap_R_RegisterShaderNoMip(state.syscalls,picname)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L285)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-drawrect-function-ui-drawrect-state-x-y-width-height-color-src-mq3-client-ui-atoms-missionpack-ml-504821366"></a>
### UI_DrawRect

```ml
function UI_DrawRect(state, x, y, width, height, color)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_R_SetColor`, `mq3.client.ui_atoms_missionpack.UI_DrawTopBottom`, `mq3.client.ui_atoms_missionpack.UI_DrawSides` from UI atoms missionpack `UI_DrawRect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawRect`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawRect`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `UI_DrawRect`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `UI_DrawRect`. |
| `color` | `dynamic` | — | Color value used by the UI atoms missionpack drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L323)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-drawsides-function-ui-drawsides-state-x-y-w-h-src-mq3-client-ui-atoms-missionpack-ml-135711177"></a>
### UI_DrawSides

```ml
function UI_DrawSides(state, x, y, w, h)
```

Calls `mq3.client.ui_atoms_missionpack.UI_AdjustFrom640`, `mq3.client.ui_syscalls_missionpack.trap_R_DrawStretchPic` from UI atoms missionpack `UI_DrawSides`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`, `state.whiteShader`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawSides`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawSides`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `UI_DrawSides`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `UI_DrawSides`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L308)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-drawtextbox-function-ui-drawtextbox-state-x-y-width-lines-src-mq3-client-ui-atoms-missionpack-ml-1883866093"></a>
### UI_DrawTextBox

```ml
function UI_DrawTextBox(state, x, y, width, lines)
```

Calls `mq3.client.ui_atoms_missionpack.UI_FillRect`, `mq3.client.ui_atoms_missionpack.UI_DrawRect` from UI atoms missionpack `UI_DrawTextBox`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI atoms missionpack state passed to the helper calls in `UI_DrawTextBox`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawTextBox`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawTextBox`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `UI_DrawTextBox`. |
| `lines` | `dynamic` | — | Value used by `UI_FillRect(state,x+BIGCHAR_WIDTH/2,y+BIGCHAR_HEIGHT/2,(width+1)*BIGCHAR_WIDTH,(lines+1)*BIGCHAR_HEIGHT,[0.0,0.0,0.0,1.0])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L337)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-drawtopbottom-function-ui-drawtopbottom-state-x-y-w-h-src-mq3-client-ui-atoms-missionpack-ml-440562421"></a>
### UI_DrawTopBottom

```ml
function UI_DrawTopBottom(state, x, y, w, h)
```

Calls `mq3.client.ui_atoms_missionpack.UI_AdjustFrom640`, `mq3.client.ui_syscalls_missionpack.trap_R_DrawStretchPic` from UI atoms missionpack `UI_DrawTopBottom`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`, `state.whiteShader`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_DrawTopBottom`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_DrawTopBottom`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `UI_DrawTopBottom`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `UI_DrawTopBottom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L315)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-fillrect-function-ui-fillrect-state-x-y-width-height-color-src-mq3-client-ui-atoms-missionpack-ml-1463609388"></a>
### UI_FillRect

```ml
function UI_FillRect(state, x, y, width, height, color)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_R_SetColor`, `mq3.client.ui_atoms_missionpack.UI_AdjustFrom640`, `mq3.client.ui_syscalls_missionpack.trap_R_DrawStretchPic` from UI atoms missionpack `UI_FillRect`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`, `state.whiteShader`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_FillRect`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_FillRect`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `UI_FillRect`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `UI_FillRect`. |
| `color` | `dynamic` | — | Color value used by the UI atoms missionpack drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L301)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-loadbestscores-function-ui-loadbestscores-state-map-game-src-mq3-client-ui-atoms-missionpack-ml-568786599"></a>
### UI_LoadBestScores

```ml
function UI_LoadBestScores(state, map, game)
```

Updates `state.demoAvailable` during UI atoms missionpack `UI_LoadBestScores`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI atoms missionpack record/storage; this routine assigns `state.demoAvailable`. |
| `map` | `dynamic` | — | map record passed to the UI atoms missionpack helper calls. |
| `game` | `dynamic` | — | Value used by `value=readScoreFile(state,"games/"+map+"_"+str(game)+".game")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L228)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-setbestscores-function-ui-setbestscores-state-value-postgame-src-mq3-client-ui-atoms-missionpack-ml-327776318"></a>
### UI_SetBestScores

```ml
function UI_SetBestScores(state, value, postGame)
```

Calls `mq3.client.ui_atoms_missionpack.cvarSet`, `mq3.client.ui_atoms_missionpack.scoreValue`, `mq3.client.ui_atoms_missionpack.two` and additional helpers from UI atoms missionpack `UI_SetBestScores`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI atoms missionpack state passed to the helper calls in `UI_SetBestScores`. |
| `value` | `dynamic` | — | Record read through `value.accuracy`, `value.impressives`, `value.excellents`, `value.defends` and additional values. |
| `postGame` | `dynamic` | — | Value used by `if postGame then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L202)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-setcolor-function-ui-setcolor-state-rgba-src-mq3-client-ui-atoms-missionpack-ml-13919123"></a>
### UI_SetColor

```ml
function UI_SetColor(state, rgba)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_R_SetColor` from UI atoms missionpack `UI_SetColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |
| `rgba` | `dynamic` | — | Value used by `traps.trap_R_SetColor(state.syscalls,rgba)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L327)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-shutdown-function-ui-shutdown-state-src-mq3-client-ui-atoms-missionpack-ml-1508148647"></a>
### UI_Shutdown

```ml
function UI_Shutdown(state)
```

Reads `void` for UI atoms missionpack `UI_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Accepted for compatibility with `UI_Shutdown`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L270)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-startdemoloop-function-ui-startdemoloop-state-src-mq3-client-ui-atoms-missionpack-ml-1985190305"></a>
### UI_StartDemoLoop

```ml
function UI_StartDemoLoop(state)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_Cmd_ExecuteText` from UI atoms missionpack `UI_StartDemoLoop`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L179)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-updatescreen-function-ui-updatescreen-state-src-mq3-client-ui-atoms-missionpack-ml-1091677581"></a>
### UI_UpdateScreen

```ml
function UI_UpdateScreen(state)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_UpdateScreen` from UI atoms missionpack `UI_UpdateScreen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L330)

<a id="function-function-mq3-client-ui-atoms-missionpack-writescorefile-function-writescorefile-state-filename-value-src-mq3-client-ui-atoms-missionpack-ml-60506737"></a>
### writeScoreFile

```ml
function writeScoreFile(state, filename, value)
```

Calls `mq3.client.ui_syscalls_missionpack.trap_FS_FOpenFile`, `mq3.client.ui_syscalls_missionpack.trap_FS_Write`, `mq3.client.ui_syscalls_missionpack.trap_FS_FCloseFile` from UI atoms missionpack `writeScoreFile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.syscalls`. |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. |
| `value` | `dynamic` | — | Value used by `traps.trap_FS_Write(state.syscalls,[value],POSTGAME_INFO_SIZE,handle[0])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L220)
