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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L18)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-bigchar-width-const-bigchar-width-16-src-mq3-client-ui-atoms-missionpack-ml-1504963056"></a>
### BIGCHAR_WIDTH

```ml
const BIGCHAR_WIDTH = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L17)

<a id="function-function-mq3-client-ui-atoms-missionpack-com-error-function-com-error-state-level-message-src-mq3-client-ui-atoms-missionpack-ml-2024267816"></a>
### Com_Error

```ml
function Com_Error(state, level, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L37)

<a id="function-function-mq3-client-ui-atoms-missionpack-com-printf-function-com-printf-state-message-src-mq3-client-ui-atoms-missionpack-ml-1697642168"></a>
### Com_Printf

```ml
function Com_Printf(state, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L38)

<a id="function-function-mq3-client-ui-atoms-missionpack-create-function-create-syscalls-src-mq3-client-ui-atoms-missionpack-ml-201961226"></a>
### create

```ml
function create(syscalls)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `syscalls` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L26)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-cs-serverinfo-const-cs-serverinfo-0-src-mq3-client-ui-atoms-missionpack-ml-470540553"></a>
### CS_SERVERINFO

```ml
const CS_SERVERINFO = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L15)

<a id="function-function-mq3-client-ui-atoms-missionpack-cvarset-function-cvarset-state-name-value-src-mq3-client-ui-atoms-missionpack-ml-1537404631"></a>
### cvarSet

```ml
function cvarSet(state, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L35)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-exec-append-const-exec-append-2-src-mq3-client-ui-atoms-missionpack-ml-1733218651"></a>
### EXEC_APPEND

```ml
const EXEC_APPEND = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L12)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-fs-read-const-fs-read-0-src-mq3-client-ui-atoms-missionpack-ml-606593433"></a>
### FS_READ

```ml
const FS_READ = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L13)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-fs-write-const-fs-write-1-src-mq3-client-ui-atoms-missionpack-ml-651762564"></a>
### FS_WRITE

```ml
const FS_WRITE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L14)

<a id="function-function-mq3-client-ui-atoms-missionpack-internal-function-internal-state-kind-arguments-src-mq3-client-ui-atoms-missionpack-ml-1428806665"></a>
### internal

```ml
function internal(state, kind, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L32)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-max-string-chars-const-max-string-chars-1024-src-mq3-client-ui-atoms-missionpack-ml-1576263358"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L19)

<a id="function-function-mq3-client-ui-atoms-missionpack-needcdaction-function-needcdaction-state-result-src-mq3-client-ui-atoms-missionpack-ml-504164636"></a>
### NeedCDAction

```ml
function NeedCDAction(state, result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L41)

<a id="function-function-mq3-client-ui-atoms-missionpack-needcdkeyaction-function-needcdkeyaction-state-result-src-mq3-client-ui-atoms-missionpack-ml-407425336"></a>
### NeedCDKeyAction

```ml
function NeedCDKeyAction(state, result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L42)

<a id="constant-constant-mq3-client-ui-atoms-missionpack-postgame-info-size-const-postgame-info-size-64-src-mq3-client-ui-atoms-missionpack-ml-934025083"></a>
### POSTGAME_INFO_SIZE

```ml
const POSTGAME_INFO_SIZE = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L16)

<a id="function-function-mq3-client-ui-atoms-missionpack-postgameinfo-function-postgameinfo-src-mq3-client-ui-atoms-missionpack-ml-1442279660"></a>
### postGameInfo

```ml
function postGameInfo()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L25)

- [mq3.client.ui_atoms_missionpack.PostGameInfo](Type-mq3-client-ui-atoms-missionpack-postgameinfo-1834226824.md) — struct
<a id="function-function-mq3-client-ui-atoms-missionpack-readscorefile-function-readscorefile-state-filename-src-mq3-client-ui-atoms-missionpack-ml-2009607956"></a>
### readScoreFile

```ml
function readScoreFile(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L55)

<a id="function-function-mq3-client-ui-atoms-missionpack-scorevalue-function-scorevalue-value-src-mq3-client-ui-atoms-missionpack-ml-992901973"></a>
### scoreValue

```ml
function scoreValue(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L34)

<a id="function-function-mq3-client-ui-atoms-missionpack-setdisplaycontext-function-setdisplaycontext-state-xscale-yscale-cursorx-cursory-whiteshader-src-mq3-client-ui-atoms-missionpack-ml-2133536575"></a>
### setDisplayContext

```ml
function setDisplayContext(state, xscale, yscale, cursorx, cursory, whiteShader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `xscale` | `dynamic` | — |  |
| `yscale` | `dynamic` | — |  |
| `cursorx` | `dynamic` | — |  |
| `cursory` | `dynamic` | — |  |
| `whiteShader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L30)

<a id="function-function-mq3-client-ui-atoms-missionpack-setinternalhandler-function-setinternalhandler-state-context-callback-src-mq3-client-ui-atoms-missionpack-ml-1928393467"></a>
### setInternalHandler

```ml
function setInternalHandler(state, context, callback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L31)

- [mq3.client.ui_atoms_missionpack.State](Type-mq3-client-ui-atoms-missionpack-state-1496372201.md) — struct
<a id="function-function-mq3-client-ui-atoms-missionpack-two-function-two-value-src-mq3-client-ui-atoms-missionpack-ml-1857542713"></a>
### two

```ml
function two(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L33)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-adjustfrom640-function-ui-adjustfrom640-state-x-y-w-h-src-mq3-client-ui-atoms-missionpack-ml-1990680793"></a>
### UI_AdjustFrom640

```ml
function UI_AdjustFrom640(state, x, y, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L94)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-argv-function-ui-argv-state-arg-src-mq3-client-ui-atoms-missionpack-ml-1148389317"></a>
### UI_Argv

```ml
function UI_Argv(state, arg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `arg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L44)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-cache-f-function-ui-cache-f-state-src-mq3-client-ui-atoms-missionpack-ml-278725069"></a>
### UI_Cache_f

```ml
function UI_Cache_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L71)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-calcpostgamestats-function-ui-calcpostgamestats-state-src-mq3-client-ui-atoms-missionpack-ml-875167285"></a>
### UI_CalcPostGameStats

```ml
function UI_CalcPostGameStats(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L73)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-clampcvar-function-ui-clampcvar-minimum-maximum-value-src-mq3-client-ui-atoms-missionpack-ml-2113474779"></a>
### UI_ClampCvar

```ml
function UI_ClampCvar(minimum, maximum, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `minimum` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L39)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-clearscores-function-ui-clearscores-state-src-mq3-client-ui-atoms-missionpack-ml-2080293197"></a>
### UI_ClearScores

```ml
function UI_ClearScores(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L67)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-consolecommand-function-ui-consolecommand-state-realtime-src-mq3-client-ui-atoms-missionpack-ml-1217012918"></a>
### UI_ConsoleCommand

```ml
function UI_ConsoleCommand(state, realTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `realTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L81)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-cursorinrect-function-ui-cursorinrect-state-x-y-width-height-src-mq3-client-ui-atoms-missionpack-ml-1559952853"></a>
### UI_CursorInRect

```ml
function UI_CursorInRect(state, x, y, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L104)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-cvar-variablestring-function-ui-cvar-variablestring-state-name-src-mq3-client-ui-atoms-missionpack-ml-572000414"></a>
### UI_Cvar_VariableString

```ml
function UI_Cvar_VariableString(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L45)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-drawhandlepic-function-ui-drawhandlepic-state-x-y-w-h-shader-src-mq3-client-ui-atoms-missionpack-ml-1746293260"></a>
### UI_DrawHandlePic

```ml
function UI_DrawHandlePic(state, x, y, w, h, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L96)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-drawnamedpic-function-ui-drawnamedpic-state-x-y-width-height-picname-src-mq3-client-ui-atoms-missionpack-ml-1703293908"></a>
### UI_DrawNamedPic

```ml
function UI_DrawNamedPic(state, x, y, width, height, picname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `picname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L95)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-drawrect-function-ui-drawrect-state-x-y-width-height-color-src-mq3-client-ui-atoms-missionpack-ml-504821366"></a>
### UI_DrawRect

```ml
function UI_DrawRect(state, x, y, width, height, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L100)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-drawsides-function-ui-drawsides-state-x-y-w-h-src-mq3-client-ui-atoms-missionpack-ml-135711177"></a>
### UI_DrawSides

```ml
function UI_DrawSides(state, x, y, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L98)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-drawtextbox-function-ui-drawtextbox-state-x-y-width-lines-src-mq3-client-ui-atoms-missionpack-ml-1883866093"></a>
### UI_DrawTextBox

```ml
function UI_DrawTextBox(state, x, y, width, lines)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `lines` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L103)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-drawtopbottom-function-ui-drawtopbottom-state-x-y-w-h-src-mq3-client-ui-atoms-missionpack-ml-440562421"></a>
### UI_DrawTopBottom

```ml
function UI_DrawTopBottom(state, x, y, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L99)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-fillrect-function-ui-fillrect-state-x-y-width-height-color-src-mq3-client-ui-atoms-missionpack-ml-1463609388"></a>
### UI_FillRect

```ml
function UI_FillRect(state, x, y, width, height, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L97)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-loadbestscores-function-ui-loadbestscores-state-map-game-src-mq3-client-ui-atoms-missionpack-ml-568786599"></a>
### UI_LoadBestScores

```ml
function UI_LoadBestScores(state, map, game)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `game` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L62)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-setbestscores-function-ui-setbestscores-state-value-postgame-src-mq3-client-ui-atoms-missionpack-ml-327776318"></a>
### UI_SetBestScores

```ml
function UI_SetBestScores(state, value, postGame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `postGame` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L47)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-setcolor-function-ui-setcolor-state-rgba-src-mq3-client-ui-atoms-missionpack-ml-13919123"></a>
### UI_SetColor

```ml
function UI_SetColor(state, rgba)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rgba` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L101)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-shutdown-function-ui-shutdown-state-src-mq3-client-ui-atoms-missionpack-ml-1508148647"></a>
### UI_Shutdown

```ml
function UI_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L93)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-startdemoloop-function-ui-startdemoloop-state-src-mq3-client-ui-atoms-missionpack-ml-1985190305"></a>
### UI_StartDemoLoop

```ml
function UI_StartDemoLoop(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L40)

<a id="function-function-mq3-client-ui-atoms-missionpack-ui-updatescreen-function-ui-updatescreen-state-src-mq3-client-ui-atoms-missionpack-ml-1091677581"></a>
### UI_UpdateScreen

```ml
function UI_UpdateScreen(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L102)

<a id="function-function-mq3-client-ui-atoms-missionpack-writescorefile-function-writescorefile-state-filename-value-src-mq3-client-ui-atoms-missionpack-ml-60506737"></a>
### writeScoreFile

```ml
function writeScoreFile(state, filename, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_atoms_missionpack.ml#L58)
