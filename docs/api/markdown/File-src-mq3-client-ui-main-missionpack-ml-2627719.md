# `src/mq3/client/ui_main_missionpack.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_main_missionpack`](Package-mq3-client-ui-main-missionpack-204777885.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawrect-function-ui-drawrect-state-x-y-width-height-size-color-src-mq3-client-ui-main-missionpack-ml-394696745"></a>
### _UI_DrawRect

```ml
function _UI_DrawRect(state, x, y, width, height, size, color)
```

Calls `mq3.client.ui_main_missionpack._UI_DrawSides`, `mq3.client.ui_main_missionpack._UI_DrawTopBottom`, `mq3.client.ui_main_missionpack.emit` from UI main missionpack `_UI_DrawRect`. The final path returns `emit(state,"renderer","set-color","","",[void])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `_UI_DrawRect`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `_UI_DrawRect`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `_UI_DrawRect`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `_UI_DrawRect`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `_UI_DrawRect`. |
| `size` | `dynamic` | — | Value used by `_UI_DrawSides(state,x,y,width,height,size)`. |
| `color` | `dynamic` | — | Accepted for compatibility with `_UI_DrawRect`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L665)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawsides-function-ui-drawsides-state-x-y-w-h-size-src-mq3-client-ui-main-missionpack-ml-1096284680"></a>
### _UI_DrawSides

```ml
function _UI_DrawSides(state, x, y, w, h, size)
```

Calls `mq3.client.ui_main_missionpack.emit` from UI main missionpack `_UI_DrawSides`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `_UI_DrawSides`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `_UI_DrawSides`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `_UI_DrawSides`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `_UI_DrawSides`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `_UI_DrawSides`. |
| `size` | `dynamic` | — | Value used by `emit(state,"renderer","rect-sides","white","",[x,y,w,h,size])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L648)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawtopbottom-function-ui-drawtopbottom-state-x-y-w-h-size-src-mq3-client-ui-main-missionpack-ml-2040813440"></a>
### _UI_DrawTopBottom

```ml
function _UI_DrawTopBottom(state, x, y, w, h, size)
```

Calls `mq3.client.ui_main_missionpack.emit` from UI main missionpack `_UI_DrawTopBottom`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `_UI_DrawTopBottom`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `_UI_DrawTopBottom`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `_UI_DrawTopBottom`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `_UI_DrawTopBottom`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `_UI_DrawTopBottom`. |
| `size` | `dynamic` | — | Value used by `emit(state,"renderer","rect-top-bottom","white","",[x,y,w,h,size])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L656)

<a id="function-function-mq3-client-ui-main-missionpack-ui-init-function-ui-init-state-ingameload-files-src-mq3-client-ui-main-missionpack-ml-882861563"></a>
### _UI_Init

```ml
function _UI_Init(state, inGameLoad, files)
```

Updates `state.initialized`, `state.shutdown`, `state.ingameLoad`, `state.realtime` and additional values during UI main missionpack `_UI_Init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.initialized`, `state.shutdown`, `state.ingameLoad`, `state.realtime` and additional values. |
| `inGameLoad` | `dynamic` | — | Value assigned to `state.ingameLoad`. |
| `files` | `dynamic` | — | File-name sequence by `_UI_Init`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1715)

<a id="function-function-mq3-client-ui-main-missionpack-ui-isfullscreen-function-ui-isfullscreen-state-src-mq3-client-ui-main-missionpack-ml-1958527099"></a>
### _UI_IsFullscreen

```ml
function _UI_IsFullscreen(state)
```

Reads `state.fullscreen` for UI main missionpack `_UI_IsFullscreen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.fullscreen`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1744)

<a id="function-function-mq3-client-ui-main-missionpack-ui-keyevent-function-ui-keyevent-state-key-down-src-mq3-client-ui-main-missionpack-ml-385682174"></a>
### _UI_KeyEvent

```ml
function _UI_KeyEvent(state, key, down)
```

Calls `mq3.client.ui_main_missionpack.emit`, `mq3.client.ui_main_missionpack._UI_SetActiveMenu` from UI main missionpack `_UI_KeyEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.activeMenu`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |
| `down` | `dynamic` | — | Whether this event presses the key/button; false represents its release. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1725)

<a id="function-function-mq3-client-ui-main-missionpack-ui-mouseevent-function-ui-mouseevent-state-dx-dy-src-mq3-client-ui-main-missionpack-ml-1461648234"></a>
### _UI_MouseEvent

```ml
function _UI_MouseEvent(state, dx, dy)
```

Updates `state.cursorx`, `state.cursory` during UI main missionpack `_UI_MouseEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.cursorx`, `state.cursory`. |
| `dx` | `dynamic` | — | Value used by `state.cursorx=clamp(state.cursorx+dx,0.0,640.0)`. |
| `dy` | `dynamic` | — | Value used by `state.cursory=clamp(state.cursory+dy,0.0,480.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1730)

<a id="function-function-mq3-client-ui-main-missionpack-ui-refresh-function-ui-refresh-state-realtime-src-mq3-client-ui-main-missionpack-ml-1224202626"></a>
### _UI_Refresh

```ml
function _UI_Refresh(state, realtime)
```

Updates `state.frametime`, `state.realtime` during UI main missionpack `_UI_Refresh`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.frametime`, `state.realtime`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1734)

<a id="function-function-mq3-client-ui-main-missionpack-ui-setactivemenu-function-ui-setactivemenu-state-menu-src-mq3-client-ui-main-missionpack-ml-586292668"></a>
### _UI_SetActiveMenu

```ml
function _UI_SetActiveMenu(state, menu)
```

Updates `state.activeMenu`, `state.fullscreen`, `state.keyCatcher` during UI main missionpack `_UI_SetActiveMenu`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.activeMenu`, `state.fullscreen`, `state.keyCatcher`. |
| `menu` | `dynamic` | — | Value assigned to `state.activeMenu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1738)

<a id="function-function-mq3-client-ui-main-missionpack-ui-shutdown-function-ui-shutdown-state-src-mq3-client-ui-main-missionpack-ml-1410658383"></a>
### _UI_Shutdown

```ml
function _UI_Shutdown(state)
```

Updates `state.shutdown`, `state.initialized` during UI main missionpack `_UI_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.shutdown`, `state.initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1720)

- [mq3.client.ui_main_missionpack.Action](Type-mq3-client-ui-main-missionpack-action-1405167819.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-alias-parse-function-alias-parse-state-tokens-start-src-mq3-client-ui-main-missionpack-ml-463988625"></a>
### Alias_Parse

```ml
function Alias_Parse(state, tokens, start)
```

Updates `state.aliases` during UI main missionpack `Alias_Parse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.aliases`. |
| `tokens` | `dynamic` | — | Sequence read at `tokens[at]`, `tokens[at+1]`, `tokens[at+2]`, `tokens[at+3]`. |
| `start` | `dynamic` | — | Value used by `at=parseOpen(tokens,start)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1565)

- [mq3.client.ui_main_missionpack.AliasInfo](Type-mq3-client-ui-main-missionpack-aliasinfo-764484831.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-arenaservers-maxping-function-arenaservers-maxping-state-src-mq3-client-ui-main-missionpack-ml-72279883"></a>
### ArenaServers_MaxPing

```ml
function ArenaServers_MaxPing(state)
```

Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_main_missionpack.cvarValue` from UI main missionpack `ArenaServers_MaxPing`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `ArenaServers_MaxPing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1679)

<a id="constant-constant-mq3-client-ui-main-missionpack-as-favorites-const-as-favorites-3-src-mq3-client-ui-main-missionpack-ml-2047987824"></a>
### AS_FAVORITES

```ml
const AS_FAVORITES = 3
```

Server-browser source selector for the favorites server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L63)

<a id="constant-constant-mq3-client-ui-main-missionpack-as-global-const-as-global-2-src-mq3-client-ui-main-missionpack-ml-1457839325"></a>
### AS_GLOBAL

```ml
const AS_GLOBAL = 2
```

Server-browser source selector for the global server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L61)

<a id="constant-constant-mq3-client-ui-main-missionpack-as-local-const-as-local-0-src-mq3-client-ui-main-missionpack-ml-8376953"></a>
### AS_LOCAL

```ml
const AS_LOCAL = 0
```

Server-browser source selector for the local server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L57)

<a id="constant-constant-mq3-client-ui-main-missionpack-as-mplayer-const-as-mplayer-1-src-mq3-client-ui-main-missionpack-ml-1586665464"></a>
### AS_MPLAYER

```ml
const AS_MPLAYER = 1
```

Server-browser source selector for the mplayer server list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L59)

<a id="function-function-mq3-client-ui-main-missionpack-asset-parse-function-asset-parse-state-tokens-start-src-mq3-client-ui-main-missionpack-ml-1618351233"></a>
### Asset_Parse

```ml
function Asset_Parse(state, tokens, start)
```

Updates `state.assets` during UI main missionpack `Asset_Parse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.assets`. |
| `tokens` | `dynamic` | — | Sequence read at `tokens[at]`, `tokens[at+1]`, `tokens[at+2]`. |
| `start` | `dynamic` | — | Value used by `at=start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L534)

<a id="function-function-mq3-client-ui-main-missionpack-assetcache-function-assetcache-state-src-mq3-client-ui-main-missionpack-ml-598332831"></a>
### AssetCache

```ml
function AssetCache(state)
```

AssetCache / Asset_Parse

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.assets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L526)

<a id="function-function-mq3-client-ui-main-missionpack-character-parse-function-character-parse-state-tokens-start-src-mq3-client-ui-main-missionpack-ml-271192055"></a>
### Character_Parse

```ml
function Character_Parse(state, tokens, start)
```

Updates `state.characters` during UI main missionpack `Character_Parse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.characters`. |
| `tokens` | `dynamic` | — | Sequence read at `tokens[at]`, `tokens[at+1]`, `tokens[at+2]`. |
| `start` | `dynamic` | — | Value used by `at=parseOpen(tokens,start)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1557)

<a id="function-function-mq3-client-ui-main-missionpack-characterinfo-function-characterinfo-name-base-image-src-mq3-client-ui-main-missionpack-ml-1150272191"></a>
### characterInfo

```ml
function characterInfo(name, base, image)
```

Creates a `mq3.client.ui_main_missionpack.CharacterInfo` record. Assigns `name` from `name`, `base` from `base`, `imageName` from `image`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value used to initialize `CharacterInfo.name`. |
| `base` | `dynamic` | — | Value used to initialize `CharacterInfo.base`. |
| `image` | `dynamic` | — | Value used to initialize `CharacterInfo.imageName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L453)

- [mq3.client.ui_main_missionpack.CharacterInfo](Type-mq3-client-ui-main-missionpack-characterinfo-59659872.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-clamp-function-clamp-value-minimum-maximum-src-mq3-client-ui-main-missionpack-ml-131076515"></a>
### clamp

```ml
function clamp(value, minimum, maximum)
```

Clamps `value` to the inclusive bounds `minimum` and `maximum` for UI main missionpack.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<minimum`, `value>maximum` before the calculation continues. |
| `minimum` | `dynamic` | — | Value used by `if value<minimum then return minimum end if`. |
| `maximum` | `dynamic` | — | Value used by `if value>maximum then return maximum end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L503)

<a id="function-function-mq3-client-ui-main-missionpack-comparetext-function-comparetext-left-right-src-mq3-client-ui-main-missionpack-ml-1003646047"></a>
### compareText

```ml
function compareText(left, right)
```

Calls `std.string.toLowerAscii` from UI main missionpack `compareText`. The final path returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Value used by `a=bytes(strings.toLowerAscii(left))`. |
| `right` | `dynamic` | — | Value used by `b=bytes(strings.toLowerAscii(right))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1272)

<a id="function-function-mq3-client-ui-main-missionpack-consolecommand-function-consolecommand-state-realtime-command-src-mq3-client-ui-main-missionpack-ml-1943036593"></a>
### consoleCommand

```ml
function consoleCommand(state, realtime, command)
```

Calls `std.string.toLowerAscii`, `mq3.client.ui_main_missionpack.UI_Report`, `mq3.client.ui_main_missionpack.emit` and additional helpers from UI main missionpack `consoleCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `consoleCommand`. |
| `realtime` | `dynamic` | — | Accepted for compatibility with `consoleCommand`; the current implementation does not read it. |
| `command` | `dynamic` | — | Value used by `lower=strings.toLowerAscii(command)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1749)

<a id="function-function-mq3-client-ui-main-missionpack-containsvalue-function-containsvalue-values-wanted-src-mq3-client-ui-main-missionpack-ml-1362641725"></a>
### containsValue

```ml
function containsValue(values, wanted)
```

Evaluates UI main missionpack `containsValue` and returns `true`, `false` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Value used by `for each value in values if value==wanted then return true end if end for`. |
| `wanted` | `dynamic` | — | Value used by `for each value in values if value==wanted then return true end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L522)

<a id="function-function-mq3-client-ui-main-missionpack-create-function-create-retailactive-src-mq3-client-ui-main-missionpack-ml-90513325"></a>
### create

```ml
function create(retailActive)
```

Calls `mq3.client.ui_main_missionpack.State` from UI main missionpack `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L465)

<a id="function-function-mq3-client-ui-main-missionpack-currentmap-function-currentmap-state-src-mq3-client-ui-main-missionpack-ml-1524989755"></a>
### currentMap

```ml
function currentMap(state)
```

Calls `mq3.client.ui_main_missionpack.clamp` from UI main missionpack `currentMap`. The final path returns `state.maps[clamp(state.currentMap,0,len(state.maps)-1)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.maps`, `state.currentMap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L807)

<a id="function-function-mq3-client-ui-main-missionpack-cvarindex-function-cvarindex-state-name-src-mq3-client-ui-main-missionpack-ml-1590189250"></a>
### cvarIndex

```ml
function cvarIndex(state, name)
```

Calls `std.string.toLowerAscii` from UI main missionpack `cvarIndex`. The final path returns `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.cvars`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI main missionpack resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L485)

<a id="function-function-mq3-client-ui-main-missionpack-cvarstring-function-cvarstring-state-name-src-mq3-client-ui-main-missionpack-ml-889077590"></a>
### cvarString

```ml
function cvarString(state, name)
```

Calls `mq3.client.ui_main_missionpack.cvarIndex` from UI main missionpack `cvarString`. The final path returns `state.cvars[index][1]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.cvars`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI main missionpack resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L489)

<a id="function-function-mq3-client-ui-main-missionpack-cvarvalue-function-cvarvalue-state-name-src-mq3-client-ui-main-missionpack-ml-2146989256"></a>
### cvarValue

```ml
function cvarValue(state, name)
```

Adapts `mq3.compat.textnumbers.atof32` to UI main missionpack `cvarValue`, returning its result for `cvarString(state,name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.compat.textnumbers.atof32`; passed as `cvarString(state,name)`. |
| `name` | `dynamic` | — | Argument 1 of `mq3.compat.textnumbers.atof32`; passed as `cvarString(state,name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L493)

<a id="function-function-mq3-client-ui-main-missionpack-cycle-function-cycle-value-count-key-src-mq3-client-ui-main-missionpack-ml-543074461"></a>
### cycle

```ml
function cycle(value, count, key)
```

Calls `mq3.client.ui_main_missionpack.direction` from UI main missionpack `cycle`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0`, `value>=count` before the calculation continues. |
| `count` | `dynamic` | — | Value tested by `count<=0`, `value>=count` before the calculation continues. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L514)

<a id="function-function-mq3-client-ui-main-missionpack-defaultcvars-function-defaultcvars-src-mq3-client-ui-main-missionpack-ml-551487662"></a>
### defaultCvars

```ml
function defaultCvars()
```

Evaluates UI main missionpack `defaultCvars` and returns `rows` according to its guard/selection conditions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1695)

<a id="function-function-mq3-client-ui-main-missionpack-direction-function-direction-key-src-mq3-client-ui-main-missionpack-ml-585294091"></a>
### direction

```ml
function direction(key)
```

Calls `mq3.client.ui_main_missionpack.leftKey` from UI main missionpack `direction`. The final path returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L509)

- [mq3.client.ui_main_missionpack.DispatchResult](Type-mq3-client-ui-main-missionpack-dispatchresult-989009638.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-draw-function-draw-state-name-rect-text-values-src-mq3-client-ui-main-missionpack-ml-1612523775"></a>
### draw

```ml
function draw(state, name, rect, text, values)
```

Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `draw`, returning its result for `state, "renderer", "owner-draw", name, text, [rect.x,rect.y,rect.w,rect.h]+values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.emit`. |
| `name` | `dynamic` | — | Argument 4 of `mq3.client.ui_main_missionpack.emit`. |
| `rect` | `dynamic` | — | Record read through `rect.x`, `rect.y`, `rect.w`, `rect.h`. |
| `text` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.emit`. |
| `values` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[rect.x,rect.y,rect.w,rect.h]+values`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L713)

<a id="function-function-mq3-client-ui-main-missionpack-emit-function-emit-state-boundary-kind-name-text-values-src-mq3-client-ui-main-missionpack-ml-499488985"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, values)
```

Appends a UI main missionpack action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI main missionpack resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI main missionpack path. |
| `values` | `dynamic` | — | Value used by `action=Action(boundary,kind,name,text,values,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L478)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-allmaps-const-feeder-allmaps-4-src-mq3-client-ui-main-missionpack-ml-98701557"></a>
### FEEDER_ALLMAPS

```ml
const FEEDER_ALLMAPS = 4
```

Menu data-feeder identifier supplying the allmaps list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L71)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-cinematics-const-feeder-cinematics-15-src-mq3-client-ui-main-missionpack-ml-998732703"></a>
### FEEDER_CINEMATICS

```ml
const FEEDER_CINEMATICS = 15
```

Menu data-feeder identifier supplying the cinematics list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L87)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-demos-const-feeder-demos-10-src-mq3-client-ui-main-missionpack-ml-76554794"></a>
### FEEDER_DEMOS

```ml
const FEEDER_DEMOS = 10
```

Menu data-feeder identifier supplying the demos list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L79)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-findplayer-const-feeder-findplayer-14-src-mq3-client-ui-main-missionpack-ml-351268964"></a>
### FEEDER_FINDPLAYER

```ml
const FEEDER_FINDPLAYER = 14
```

Menu data-feeder identifier supplying the findplayer list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L85)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-heads-const-feeder-heads-0-src-mq3-client-ui-main-missionpack-ml-2141826203"></a>
### FEEDER_HEADS

```ml
const FEEDER_HEADS = 0
```

Menu data-feeder identifier supplying the heads list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L65)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-maps-const-feeder-maps-1-src-mq3-client-ui-main-missionpack-ml-792557944"></a>
### FEEDER_MAPS

```ml
const FEEDER_MAPS = 1
```

Menu data-feeder identifier supplying the maps list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L67)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-mods-const-feeder-mods-9-src-mq3-client-ui-main-missionpack-ml-2032100472"></a>
### FEEDER_MODS

```ml
const FEEDER_MODS = 9
```

Menu data-feeder identifier supplying the mods list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L77)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-player-list-const-feeder-player-list-7-src-mq3-client-ui-main-missionpack-ml-398381712"></a>
### FEEDER_PLAYER_LIST

```ml
const FEEDER_PLAYER_LIST = 7
```

Menu data-feeder identifier supplying the player list list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L73)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-q3heads-const-feeder-q3heads-12-src-mq3-client-ui-main-missionpack-ml-1932127166"></a>
### FEEDER_Q3HEADS

```ml
const FEEDER_Q3HEADS = 12
```

Menu data-feeder identifier supplying the q3 heads list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L81)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-servers-const-feeder-servers-2-src-mq3-client-ui-main-missionpack-ml-644963135"></a>
### FEEDER_SERVERS

```ml
const FEEDER_SERVERS = 2
```

Menu data-feeder identifier supplying the servers list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L69)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-serverstatus-const-feeder-serverstatus-13-src-mq3-client-ui-main-missionpack-ml-506311553"></a>
### FEEDER_SERVERSTATUS

```ml
const FEEDER_SERVERSTATUS = 13
```

Menu data-feeder identifier supplying the serverstatus list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L83)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-team-list-const-feeder-team-list-8-src-mq3-client-ui-main-missionpack-ml-1149718953"></a>
### FEEDER_TEAM_LIST

```ml
const FEEDER_TEAM_LIST = 8
```

Menu data-feeder identifier supplying the team list list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L75)

<a id="function-function-mq3-client-ui-main-missionpack-font-report-function-font-report-state-src-mq3-client-ui-main-missionpack-ml-1636136543"></a>
### Font_Report

```ml
function Font_Report(state)
```

Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `Font_Report`, returning its result for `state, "ui", "font-report", "Font_Report", "", [len(state.fontWidths),state.fontHeight]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.fontWidths`, `state.fontHeight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L547)

<a id="function-function-mq3-client-ui-main-missionpack-gametype-parse-function-gametype-parse-state-tokens-start-join-src-mq3-client-ui-main-missionpack-ml-979721045"></a>
### GameType_Parse

```ml
function GameType_Parse(state, tokens, start, join)
```

Updates `state.joinGameTypes`, `state.gameTypes` during UI main missionpack `GameType_Parse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.joinGameTypes`, `state.gameTypes`. |
| `tokens` | `dynamic` | — | Sequence read at `tokens[at]`, `tokens[at+1]`, `tokens[at+2]`. |
| `start` | `dynamic` | — | Value used by `at=parseOpen(tokens,start)`. |
| `join` | `dynamic` | — | Value used by `if join then state.joinGameTypes=rows else state.gameTypes=rows end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1574)

<a id="function-function-mq3-client-ui-main-missionpack-getmenubuffer-function-getmenubuffer-state-filename-files-src-mq3-client-ui-main-missionpack-ml-373974073"></a>
### GetMenuBuffer

```ml
function GetMenuBuffer(state, filename, files)
```

Calls `std.string.toLowerAscii`, `mq3.client.ui_main_missionpack.emit` from UI main missionpack `GetMenuBuffer`. The final path returns `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `GetMenuBuffer`. |
| `filename` | `dynamic` | — | File name passed to the corresponding file/asset operation. |
| `files` | `dynamic` | — | Value used by `for each pair in files if strings.toLowerAscii(pair[0])==strings.toLowerAscii(filename) then emit(state,"filesystem","read",filename,"",[len(b...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L681)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-1fctf-const-gt-1fctf-5-src-mq3-client-ui-main-missionpack-ml-1926092530"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```

Native game-type identifier selecting one-flag capture the flag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L51)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-ctf-const-gt-ctf-4-src-mq3-client-ui-main-missionpack-ml-1348130815"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Native game-type value for capture the flag, used when filtering arenas and servers and selecting Missionpack game modes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L49)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-ffa-const-gt-ffa-0-src-mq3-client-ui-main-missionpack-ml-1057005019"></a>
### GT_FFA

```ml
const GT_FFA = 0
```

Native game-type identifier selecting free-for-all deathmatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L37)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-harvester-const-gt-harvester-7-src-mq3-client-ui-main-missionpack-ml-723233872"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```

Native game-type identifier selecting Harvester.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L55)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-obelisk-const-gt-obelisk-6-src-mq3-client-ui-main-missionpack-ml-920826693"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```

Native game-type identifier selecting Overload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L53)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-single-player-const-gt-single-player-2-src-mq3-client-ui-main-missionpack-ml-2001927291"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```

Native game-type value for single-player arena progression, used when filtering arenas and servers and selecting Missionpack game modes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L43)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-team-const-gt-team-3-src-mq3-client-ui-main-missionpack-ml-100041170"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Native game-type value for team deathmatch, used when filtering arenas and servers and selecting Missionpack game modes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L46)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-tournament-const-gt-tournament-1-src-mq3-client-ui-main-missionpack-ml-34497968"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```

Native game-type value for one-on-one tournament play, used when filtering arenas and servers and selecting Missionpack game modes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L40)

<a id="constant-constant-mq3-client-ui-main-missionpack-k-mouse1-const-k-mouse1-178-src-mq3-client-ui-main-missionpack-ml-568086145"></a>
### K_MOUSE1

```ml
const K_MOUSE1 = 178
```

Engine key code for the mouse1 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L89)

<a id="constant-constant-mq3-client-ui-main-missionpack-k-mouse2-const-k-mouse2-179-src-mq3-client-ui-main-missionpack-ml-1889243632"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```

Engine key code for the mouse2 input, used by menu and client key-event handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L91)

<a id="function-function-mq3-client-ui-main-missionpack-leftkey-function-leftkey-key-src-mq3-client-ui-main-missionpack-ml-619115961"></a>
### leftKey

```ml
function leftKey(key)
```

Computes `key==K_MOUSE2 or key==134 or key==132` for UI main missionpack `leftKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L506)

<a id="function-function-mq3-client-ui-main-missionpack-load-menu-function-load-menu-state-tokens-start-files-src-mq3-client-ui-main-missionpack-ml-494904032"></a>
### Load_Menu

```ml
function Load_Menu(state, tokens, start, files)
```

Calls `mq3.client.ui_main_missionpack.UI_ParseMenu`, `mq3.client.ui_main_missionpack.GetMenuBuffer`, `mq3.client.ui_main_missionpack.ParseResult` from UI main missionpack `Load_Menu`. The final path returns `ParseResult(true,at)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `Load_Menu`. |
| `tokens` | `dynamic` | — | Sequence read at `tokens[at]`. |
| `start` | `dynamic` | — | Value used by `at=start`. |
| `files` | `dynamic` | — | Value used by `UI_ParseMenu(state,filename,GetMenuBuffer(state,filename,files)) end while`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L692)

<a id="function-function-mq3-client-ui-main-missionpack-mapinfo-function-mapinfo-loadname-name-typebits-src-mq3-client-ui-main-missionpack-ml-608070002"></a>
### mapInfo

```ml
function mapInfo(loadName, name, typeBits)
```

Creates a `mq3.client.ui_main_missionpack.MapInfo` record. Assigns `mapLoadName` from `loadName`, `mapName` from `name`, `typeBits` from `typeBits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loadName` | `dynamic` | — | Value used to initialize `MapInfo.mapLoadName`, `MapInfo.imageName`. |
| `name` | `dynamic` | — | Value used to initialize `MapInfo.mapName`. |
| `typeBits` | `dynamic` | — | Value used to initialize `MapInfo.typeBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L443)

- [mq3.client.ui_main_missionpack.MapInfo](Type-mq3-client-ui-main-missionpack-mapinfo-1197732229.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-maplist-parse-function-maplist-parse-state-tokens-start-src-mq3-client-ui-main-missionpack-ml-234503017"></a>
### MapList_Parse

```ml
function MapList_Parse(state, tokens, start)
```

Updates `state.maps` during UI main missionpack `MapList_Parse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.maps`. |
| `tokens` | `dynamic` | — | Sequence read at `tokens[at]`, `tokens[at+1]`, `tokens[at+2]`, `tokens[at+3]`. |
| `start` | `dynamic` | — | Value used by `at=parseOpen(tokens,start)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1582)

- [mq3.client.ui_main_missionpack.ModInfo](Type-mq3-client-ui-main-missionpack-modinfo-1333120515.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-parseopen-function-parseopen-tokens-start-src-mq3-client-ui-main-missionpack-ml-339835356"></a>
### parseOpen

```ml
function parseOpen(tokens, start)
```

Evaluates UI main missionpack `parseOpen` and returns `-1`, `start+1` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tokens` | `dynamic` | — | Sequence read at `tokens[start]`. |
| `start` | `dynamic` | — | Value tested by `start>=len(tokens) or tokens[start]!="{"` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1542)

- [mq3.client.ui_main_missionpack.ParseResult](Type-mq3-client-ui-main-missionpack-parseresult-1086330969.md) — struct
- [mq3.client.ui_main_missionpack.Rect](Type-mq3-client-ui-main-missionpack-rect-1968236747.md) — struct
<a id="constant-constant-mq3-client-ui-main-missionpack-say-all-const-say-all-0-src-mq3-client-ui-main-missionpack-ml-968481251"></a>
### SAY_ALL

```ml
const SAY_ALL = 0
```

Chat routing mode that sends the message to all players.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L35)

<a id="function-function-mq3-client-ui-main-missionpack-serverinfo-function-serverinfo-address-hostname-mapname-clients-maxclients-gametype-ping-src-mq3-client-ui-main-missionpack-ml-582818694"></a>
### serverInfo

```ml
function serverInfo(address, hostname, mapname, clients, maxClients, gametype, ping)
```

Creates a `mq3.client.ui_main_missionpack.ServerInfo` record. Assigns `address` from `address`, `hostname` from `hostname`, `mapname` from `mapname`, `clients` from `clients`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Value used to initialize `ServerInfo.address`. |
| `hostname` | `dynamic` | — | Value used to initialize `ServerInfo.hostname`. |
| `mapname` | `dynamic` | — | Value used to initialize `ServerInfo.mapname`. |
| `clients` | `dynamic` | — | Value used to initialize `ServerInfo.clients`. |
| `maxClients` | `dynamic` | — | Value used to initialize `ServerInfo.maxClients`. |
| `gametype` | `dynamic` | — | Value used to initialize `ServerInfo.gametype`. |
| `ping` | `dynamic` | — | Value used to initialize `ServerInfo.ping`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L462)

- [mq3.client.ui_main_missionpack.ServerInfo](Type-mq3-client-ui-main-missionpack-serverinfo-947320430.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-serverpasses-function-serverpasses-state-server-src-mq3-client-ui-main-missionpack-ml-2046783654"></a>
### serverPasses

```ml
function serverPasses(state, server)
```

Calls `mq3.compat.textnumbers.atoi`, `mq3.client.ui_main_missionpack.cvarString` from UI main missionpack `serverPasses`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentNetSource`, `state.currentNetFilter`. |
| `server` | `dynamic` | — | Record read through `server.visible`, `server.ping`, `server.favorite`, `server.clients` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1311)

<a id="function-function-mq3-client-ui-main-missionpack-setcvar-function-setcvar-state-name-value-src-mq3-client-ui-main-missionpack-ml-1723900667"></a>
### setCvar

```ml
function setCvar(state, name, value)
```

Updates `state.cvars`, `state.cvars[index][1]` during UI main missionpack `setCvar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.cvars`, `state.cvars[index][1]`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI main missionpack resource. |
| `value` | `dynamic` | — | Value used by `if index<0 then state.cvars=state.cvars+[[name,str(value)]] else state.cvars[index][1]=str(value) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L498)

<a id="function-function-mq3-client-ui-main-missionpack-signedquotient-function-signedquotient-value-divisor-src-mq3-client-ui-main-missionpack-ml-673246621"></a>
### signedQuotient

```ml
function signedQuotient(value, divisor)
```

Calls `mq3.compat.numeric.quotient` from UI main missionpack `signedQuotient`. The final path returns `n.quotient(value,divisor)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0` before the calculation continues. |
| `divisor` | `dynamic` | — | Value used by `if value<0 then return 0-n.quotient(0-value,divisor) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1650)

- [mq3.client.ui_main_missionpack.State](Type-mq3-client-ui-main-missionpack-state-1212712554.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-stripextension-function-stripextension-name-extension-src-mq3-client-ui-main-missionpack-ml-1198069508"></a>
### stripExtension

```ml
function stripExtension(name, extension)
```

Calls `std.string.toLowerAscii`, `std.string.endsWith`, `std.string.substr` from UI main missionpack `stripExtension`. The final path returns `name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI main missionpack resource. |
| `extension` | `dynamic` | — | Value used by `suffix=strings.toLowerAscii(extension)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1431)

<a id="function-function-mq3-client-ui-main-missionpack-stristr-function-stristr-text-needle-src-mq3-client-ui-main-missionpack-ml-250178360"></a>
### stristr

```ml
function stristr(text, needle)
```

Calls `std.string.indexOf`, `std.string.toLowerAscii` from UI main missionpack `stristr`. The final path returns `strings.indexOf(strings.toLowerAscii(text),strings.toLowerAscii(needle),0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `stristr` in the UI main missionpack path. |
| `needle` | `dynamic` | — | Value used by `if needle=="" then return 0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1343)

<a id="function-function-mq3-client-ui-main-missionpack-team-parse-function-team-parse-state-tokens-start-src-mq3-client-ui-main-missionpack-ml-782147113"></a>
### Team_Parse

```ml
function Team_Parse(state, tokens, start)
```

Updates `state.teams` during UI main missionpack `Team_Parse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.teams`. |
| `tokens` | `dynamic` | — | Sequence read at `tokens[at]`, `tokens[at+1]`, `tokens[at+2+i]`. |
| `start` | `dynamic` | — | Value used by `at=parseOpen(tokens,start)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1547)

<a id="function-function-mq3-client-ui-main-missionpack-teamat-function-teamat-state-index-src-mq3-client-ui-main-missionpack-ml-492018963"></a>
### teamAt

```ml
function teamAt(state, index)
```

Calls `mq3.client.ui_main_missionpack.clamp` from UI main missionpack `teamAt`. The final path returns `state.teams[clamp(index,0,len(state.teams)-1)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.teams`. |
| `index` | `dynamic` | — | Value used by `return state.teams[clamp(index,0,len(state.teams)-1)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L756)

<a id="function-function-mq3-client-ui-main-missionpack-teaminfo-function-teaminfo-name-image-members-src-mq3-client-ui-main-missionpack-ml-444289507"></a>
### teamInfo

```ml
function teamInfo(name, image, members)
```

Creates a `mq3.client.ui_main_missionpack.TeamInfo` record. Assigns `name` from `name`, `imageName` from `image`, `teamMembers` from `members`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value used to initialize `TeamInfo.name`. |
| `image` | `dynamic` | — | Value used to initialize `TeamInfo.imageName`. |
| `members` | `dynamic` | — | Value used to initialize `TeamInfo.teamMembers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L448)

- [mq3.client.ui_main_missionpack.TeamInfo](Type-mq3-client-ui-main-missionpack-teaminfo-101083716.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-text-height-function-text-height-state-text-scale-limit-src-mq3-client-ui-main-missionpack-ml-1527810299"></a>
### Text_Height

```ml
function Text_Height(state, text, scale, limit)
```

Calls `mq3.compat.numeric.trunc32` from UI main missionpack `Text_Height`. The final path returns `n.trunc32(state.fontHeight*scale)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.fontHeight`. |
| `text` | `dynamic` | — | Text consumed or emitted by `Text_Height` in the UI main missionpack path. |
| `scale` | `dynamic` | — | Value used by `return n.trunc32(state.fontHeight*scale)`. |
| `limit` | `dynamic` | — | Accepted for compatibility with `Text_Height`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L568)

<a id="function-function-mq3-client-ui-main-missionpack-text-paint-function-text-paint-state-x-y-scale-color-text-adjust-limit-style-src-mq3-client-ui-main-missionpack-ml-242222045"></a>
### Text_Paint

```ml
function Text_Paint(state, x, y, scale, color, text, adjust, limit, style)
```

Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `Text_Paint`, returning its result for `state, "renderer", "text", str(style), text, [x,y,scale,color,adjust,limit]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.emit`. |
| `x` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,scale,color,adjust,limit]`. |
| `y` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,scale,color,adjust,limit]`. |
| `scale` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,scale,color,adjust,limit]`. |
| `color` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,scale,color,adjust,limit]`. |
| `text` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.emit`. |
| `adjust` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,scale,color,adjust,limit]`. |
| `limit` | `dynamic` | — | Upper limit applied while collecting or rendering the result. Forwarded to `mq3.client.ui_main_missionpack.emit`. |
| `style` | `dynamic` | — | Argument 4 of `mq3.client.ui_main_missionpack.emit`; passed as `str(style)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L592)

<a id="function-function-mq3-client-ui-main-missionpack-text-paint-limit-function-text-paint-limit-state-maxx-x-y-scale-color-text-adjust-limit-src-mq3-client-ui-main-missionpack-ml-783686730"></a>
### Text_Paint_Limit

```ml
function Text_Paint_Limit(state, maxX, x, y, scale, color, text, adjust, limit)
```

Updates `maxX[0]` during UI main missionpack `Text_Paint_Limit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `Text_Paint_Limit`. |
| `maxX` | `dynamic` | — | Mutable sequence; this routine writes `maxX[0]`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Text_Paint_Limit`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Text_Paint_Limit`. |
| `scale` | `dynamic` | — | Value used by `width=Text_Width(state,text,scale,limit)`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `text` | `dynamic` | — | Text consumed or emitted by `Text_Paint_Limit` in the UI main missionpack path. |
| `adjust` | `dynamic` | — | Value used by `Text_Paint(state,x,y,scale,color,text,adjust,limit,0)`. |
| `limit` | `dynamic` | — | Upper limit applied while collecting or rendering the result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L615)

<a id="function-function-mq3-client-ui-main-missionpack-text-paintcenter-function-text-paintcenter-state-x-y-scale-color-text-adjust-src-mq3-client-ui-main-missionpack-ml-316728373"></a>
### Text_PaintCenter

```ml
function Text_PaintCenter(state, x, y, scale, color, text, adjust)
```

Adapts `mq3.client.ui_main_missionpack.Text_Paint` to UI main missionpack `Text_PaintCenter`, returning its result for `state, x-Text_Width(state,text,scale,0)/2.0, y, scale, color, text, 0.0, 0, 6`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 2 of `mq3.client.ui_main_missionpack.Text_Paint`; passed as `state`, `x-Text_Width(state,text,scale,0)/2.0`. |
| `x` | `dynamic` | — | Argument 2 of `mq3.client.ui_main_missionpack.Text_Paint`; passed as `x-Text_Width(state,text,scale,0)/2.0`. |
| `y` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.Text_Paint`. |
| `scale` | `dynamic` | — | Argument 2, 4 of `mq3.client.ui_main_missionpack.Text_Paint`; passed as `x-Text_Width(state,text,scale,0)/2.0`, `scale`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.Text_Paint`. |
| `text` | `dynamic` | — | Argument 2, 6 of `mq3.client.ui_main_missionpack.Text_Paint`; passed as `x-Text_Width(state,text,scale,0)/2.0`, `text`. |
| `adjust` | `dynamic` | — | Accepted for compatibility with `Text_PaintCenter`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L624)

<a id="function-function-mq3-client-ui-main-missionpack-text-paintcenter-autowrapped-function-text-paintcenter-autowrapped-state-x-y-xmax-ystep-scale-color-text-adjust-src-mq3-client-ui-main-missionpack-ml-1141285138"></a>
### Text_PaintCenter_AutoWrapped

```ml
function Text_PaintCenter_AutoWrapped(state, x, y, xmax, ystep, scale, color, text, adjust)
```

Calls `std.string.split`, `mq3.client.ui_main_missionpack.Text_Width`, `mq3.client.ui_main_missionpack.Text_PaintCenter` from UI main missionpack `Text_PaintCenter_AutoWrapped`. The final path returns `rows`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `Text_PaintCenter_AutoWrapped`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Text_PaintCenter_AutoWrapped`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Text_PaintCenter_AutoWrapped`. |
| `xmax` | `dynamic` | — | Value used by `if line!="" and Text_Width(state,candidate,scale,0)>xmax then Text_PaintCenter(state,x,y+rows*ystep,scale,color,line,adjust)`. |
| `ystep` | `dynamic` | — | Value used by `if line!="" and Text_Width(state,candidate,scale,0)>xmax then Text_PaintCenter(state,x,y+rows*ystep,scale,color,line,adjust)`. |
| `scale` | `dynamic` | — | Value tested by `line!="" and Text_Width(state,candidate,scale,0)>xmax` before the calculation continues. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `text` | `dynamic` | — | Text consumed or emitted by `Text_PaintCenter_AutoWrapped` in the UI main missionpack path. |
| `adjust` | `dynamic` | — | Value used by `if line!="" and Text_Width(state,candidate,scale,0)>xmax then Text_PaintCenter(state,x,y+rows*ystep,scale,color,line,adjust)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L635)

<a id="function-function-mq3-client-ui-main-missionpack-text-paintchar-function-text-paintchar-state-x-y-width-height-scale-s-t-s2-t2-hshader-src-mq3-client-ui-main-missionpack-ml-393700724"></a>
### Text_PaintChar

```ml
function Text_PaintChar(state, x, y, width, height, scale, s, t, s2, t2, hShader)
```

Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `Text_PaintChar`, returning its result for `state, "renderer", "glyph", str(hShader), "", [x,y,width,height,scale,s,t,s2,t2]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.emit`. |
| `x` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`. |
| `y` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`. |
| `width` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`. |
| `height` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`. |
| `scale` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`. |
| `s` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`. |
| `t` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`. |
| `s2` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`. |
| `t2` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,width,height,scale,s,t,s2,t2]`. |
| `hShader` | `dynamic` | — | Argument 4 of `mq3.client.ui_main_missionpack.emit`; passed as `str(hShader)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L581)

<a id="function-function-mq3-client-ui-main-missionpack-text-paintwithcursor-function-text-paintwithcursor-state-x-y-scale-color-text-cursorpos-cursor-limit-style-src-mq3-client-ui-main-missionpack-ml-524350316"></a>
### Text_PaintWithCursor

```ml
function Text_PaintWithCursor(state, x, y, scale, color, text, cursorPos, cursor, limit, style)
```

Calls `mq3.client.ui_main_missionpack.Text_Paint`, `mq3.client.ui_main_missionpack.emit`, `mq3.client.ui_main_missionpack.Text_Width` and additional helpers from UI main missionpack `Text_PaintWithCursor`. The final path returns `action`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `Text_PaintWithCursor`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `Text_PaintWithCursor`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `Text_PaintWithCursor`. |
| `scale` | `dynamic` | — | Value used by `action=Text_Paint(state,x,y,scale,color,text,0.0,limit,style)`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `text` | `dynamic` | — | Text consumed or emitted by `Text_PaintWithCursor` in the UI main missionpack path. |
| `cursorPos` | `dynamic` | — | Value used by `if cursorPos>=0 then emit(state,"renderer","cursor",cursor,"",[x+Text_Width(state,strings.substr(text,0,cursorPos),scale,0),y,scale,color]) en...`. |
| `cursor` | `dynamic` | — | Value used by `if cursorPos>=0 then emit(state,"renderer","cursor",cursor,"",[x+Text_Width(state,strings.substr(text,0,cursorPos),scale,0),y,scale,color]) en...`. |
| `limit` | `dynamic` | — | Upper limit applied while collecting or rendering the result. |
| `style` | `dynamic` | — | Value used by `action=Text_Paint(state,x,y,scale,color,text,0.0,limit,style)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L604)

<a id="function-function-mq3-client-ui-main-missionpack-text-width-function-text-width-state-text-scale-limit-src-mq3-client-ui-main-missionpack-ml-1913106885"></a>
### Text_Width

```ml
function Text_Width(state, text, scale, limit)
```

Text_Width / Text_Height / paint paths preserve color escapes and limits.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.fontWidths`. |
| `text` | `dynamic` | — | Text consumed or emitted by `Text_Width` in the UI main missionpack path. |
| `scale` | `dynamic` | — | Value used by `width=width+state.fontWidths[code]*scale`. |
| `limit` | `dynamic` | — | Upper limit applied while collecting or rendering the result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L557)

<a id="function-function-mq3-client-ui-main-missionpack-tokenize-function-tokenize-text-src-mq3-client-ui-main-missionpack-ml-684690431"></a>
### tokenize

```ml
function tokenize(text)
```

Calls `decode`, `slice` from UI main missionpack `tokenize`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `tokenize` in the UI main missionpack path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1591)

<a id="function-function-mq3-client-ui-main-missionpack-twodigits-function-twodigits-value-src-mq3-client-ui-main-missionpack-ml-2035712083"></a>
### twoDigits

```ml
function twoDigits(value)
```

Evaluates UI main missionpack `twoDigits` and returns `"0"+str(value)`, `str(value)` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<10 and value>=0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1646)

<a id="function-function-mq3-client-ui-main-missionpack-ui-aifromname-function-ui-aifromname-state-name-src-mq3-client-ui-main-missionpack-ml-1085760294"></a>
### UI_AIFromName

```ml
function UI_AIFromName(state, name)
```

Calls `std.string.toLowerAscii` from UI main missionpack `UI_AIFromName`. The final path returns `name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.aliases`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI main missionpack resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L915)

<a id="function-function-mq3-client-ui-main-missionpack-ui-aiindex-function-ui-aiindex-state-name-src-mq3-client-ui-main-missionpack-ml-1029228494"></a>
### UI_AIIndex

```ml
function UI_AIIndex(state, name)
```

Calls `std.string.toLowerAscii` from UI main missionpack `UI_AIIndex`. The final path returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.aliases`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI main missionpack resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L919)

<a id="function-function-mq3-client-ui-main-missionpack-ui-aiindexfromname-function-ui-aiindexfromname-state-name-src-mq3-client-ui-main-missionpack-ml-1292969086"></a>
### UI_AIIndexFromName

```ml
function UI_AIIndexFromName(state, name)
```

Adapts `mq3.client.ui_main_missionpack.UI_AIIndex` to UI main missionpack `UI_AIIndexFromName`, returning its result for `state, name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.UI_AIIndex`. |
| `name` | `dynamic` | — | Argument 2 of `mq3.client.ui_main_missionpack.UI_AIIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L923)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-api-version-const-ui-api-version-6-src-mq3-client-ui-main-missionpack-ml-965652039"></a>
### UI_API_VERSION

```ml
const UI_API_VERSION = 6
```

UI virtual-machine interface version expected by the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L33)

<a id="function-function-mq3-client-ui-main-missionpack-ui-binaryserverinsertion-function-ui-binaryserverinsertion-state-num-src-mq3-client-ui-main-missionpack-ml-1217686379"></a>
### UI_BinaryServerInsertion

```ml
function UI_BinaryServerInsertion(state, num)
```

Calls `mq3.client.ui_main_missionpack.UI_ServersQsortCompare`, `mq3.client.ui_main_missionpack.UI_InsertServerIntoDisplayList` from UI main missionpack `UI_BinaryServerInsertion`. The final path returns `UI_InsertServerIntoDisplayList(state,num,low)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.displayServers`. |
| `num` | `dynamic` | — | Value used by `if UI_ServersQsortCompare(state,num,state.displayServers[mid])<0 then high=mid else low=mid+1 end if end while`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1307)

<a id="function-function-mq3-client-ui-main-missionpack-ui-botname-handlekey-function-ui-botname-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-230592012"></a>
### UI_BotName_HandleKey

```ml
function UI_BotName_HandleKey(state, flags, special, key)
```

Updates `state.currentBot` during UI main missionpack `UI_BotName_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentBot`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_BotName_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_BotName_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1230)

<a id="function-function-mq3-client-ui-main-missionpack-ui-botskill-handlekey-function-ui-botskill-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-460365910"></a>
### UI_BotSkill_HandleKey

```ml
function UI_BotSkill_HandleKey(state, flags, special, key)
```

Updates `state.currentBotSkill` during UI main missionpack `UI_BotSkill_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentBotSkill`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_BotSkill_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_BotSkill_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1236)

<a id="function-function-mq3-client-ui-main-missionpack-ui-buildfindplayerlist-function-ui-buildfindplayerlist-state-force-src-mq3-client-ui-main-missionpack-ml-591475622"></a>
### UI_BuildFindPlayerList

```ml
function UI_BuildFindPlayerList(state, force)
```

Updates `state.foundPlayerNames`, `state.foundPlayerAddresses`, `state.nextDisplayRefresh` during UI main missionpack `UI_BuildFindPlayerList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.foundPlayerNames`, `state.foundPlayerAddresses`, `state.nextDisplayRefresh`. |
| `force` | `dynamic` | — | Value used by `if not force and state.realtime<state.nextDisplayRefresh then return len(state.foundPlayerNames) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1347)

<a id="function-function-mq3-client-ui-main-missionpack-ui-buildplayerlist-function-ui-buildplayerlist-state-names-teams-ownteam-src-mq3-client-ui-main-missionpack-ml-1041246530"></a>
### UI_BuildPlayerList

```ml
function UI_BuildPlayerList(state, names, teams, ownTeam)
```

Updates `state.playerNames`, `state.teamNames`, `state.playerRefresh` during UI main missionpack `UI_BuildPlayerList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.playerNames`, `state.teamNames`, `state.playerRefresh`. |
| `names` | `dynamic` | — | Sequence read at `names[i]`. |
| `teams` | `dynamic` | — | Sequence read at `teams[i]`. |
| `ownTeam` | `dynamic` | — | Value used by `for i=0 to len(names)-1 if i<len(teams) and teams[i]==ownTeam then state.teamNames=state.teamNames+[names[i]] end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1017)

<a id="function-function-mq3-client-ui-main-missionpack-ui-buildq3model-list-function-ui-buildq3model-list-state-icons-src-mq3-client-ui-main-missionpack-ml-796526869"></a>
### UI_BuildQ3Model_List

```ml
function UI_BuildQ3Model_List(state, icons)
```

Updates `state.q3HeadNames`, `state.q3HeadIcons`, `state.assets` during UI main missionpack `UI_BuildQ3Model_List`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.q3HeadNames`, `state.q3HeadIcons`, `state.assets`. |
| `icons` | `dynamic` | — | Value used by `for each icon in icons lower=strings.toLowerAscii(icon)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1623)

<a id="function-function-mq3-client-ui-main-missionpack-ui-buildserverdisplaylist-function-ui-buildserverdisplaylist-state-force-src-mq3-client-ui-main-missionpack-ml-992602786"></a>
### UI_BuildServerDisplayList

```ml
function UI_BuildServerDisplayList(state, force)
```

Updates `state.displayServers`, `state.numPlayersOnServers` during UI main missionpack `UI_BuildServerDisplayList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.displayServers`, `state.numPlayersOnServers`. |
| `force` | `dynamic` | — | Value used by `if force then state.displayServers=[]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1321)

<a id="function-function-mq3-client-ui-main-missionpack-ui-buildserverstatus-function-ui-buildserverstatus-state-force-src-mq3-client-ui-main-missionpack-ml-1277289910"></a>
### UI_BuildServerStatus

```ml
function UI_BuildServerStatus(state, force)
```

Updates `state.serverStatusLines` during UI main missionpack `UI_BuildServerStatus`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.serverStatusLines`. |
| `force` | `dynamic` | — | Accepted for compatibility with `UI_BuildServerStatus`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1355)

<a id="function-function-mq3-client-ui-main-missionpack-ui-clanname-handlekey-function-ui-clanname-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1236618320"></a>
### UI_ClanName_HandleKey

```ml
function UI_ClanName_HandleKey(state, flags, special, key)
```

Updates `state.currentTeam` during UI main missionpack `UI_ClanName_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentTeam`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_ClanName_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_ClanName_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1166)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-console-command-const-ui-console-command-8-src-mq3-client-ui-main-missionpack-ml-203006113"></a>
### UI_CONSOLE_COMMAND

```ml
const UI_CONSOLE_COMMAND = 8
```

UI VM entry-point ordinal used to handle a UI console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L27)

<a id="function-function-mq3-client-ui-main-missionpack-ui-crosshair-handlekey-function-ui-crosshair-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1362124064"></a>
### UI_Crosshair_HandleKey

```ml
function UI_Crosshair_HandleKey(state, flags, special, key)
```

Updates `state.currentCrosshair` during UI main missionpack `UI_Crosshair_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentCrosshair`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_Crosshair_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_Crosshair_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1248)

<a id="function-function-mq3-client-ui-main-missionpack-ui-displaydownloadinfo-function-ui-displaydownloadinfo-state-downloadname-centerpoint-ystart-scale-src-mq3-client-ui-main-missionpack-ml-797077352"></a>
### UI_DisplayDownloadInfo

```ml
function UI_DisplayDownloadInfo(state, downloadName, centerPoint, yStart, scale)
```

Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_main_missionpack.cvarValue`, `mq3.compat.numeric.quotient` and additional helpers from UI main missionpack `UI_DisplayDownloadInfo`. The final path returns `[rate,remaining,text]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.realtime`. |
| `downloadName` | `dynamic` | — | Value used by `text=downloadName+" "+UI_ReadableSize(count)+" of "+UI_ReadableSize(size)`. |
| `centerPoint` | `dynamic` | — | Value used by `emit(state,"renderer","download",downloadName,text,[centerPoint,yStart,scale,rate,remaining])`. |
| `yStart` | `dynamic` | — | Value used by `emit(state,"renderer","download",downloadName,text,[centerPoint,yStart,scale,rate,remaining])`. |
| `scale` | `dynamic` | — | Value used by `emit(state,"renderer","download",downloadName,text,[centerPoint,yStart,scale,rate,remaining])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1660)

<a id="function-function-mq3-client-ui-main-missionpack-ui-doserverrefresh-function-ui-doserverrefresh-state-src-mq3-client-ui-main-missionpack-ml-1554904131"></a>
### UI_DoServerRefresh

```ml
function UI_DoServerRefresh(state)
```

Updates `state.refreshTime` during UI main missionpack `UI_DoServerRefresh`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.refreshTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1682)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-draw-connect-screen-const-ui-draw-connect-screen-9-src-mq3-client-ui-main-missionpack-ml-1439094172"></a>
### UI_DRAW_CONNECT_SCREEN

```ml
const UI_DRAW_CONNECT_SCREEN = 9
```

UI VM entry-point ordinal used to render the connection-progress screen.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L29)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawallmapsselection-function-ui-drawallmapsselection-state-rect-scale-color-textstyle-net-src-mq3-client-ui-main-missionpack-ml-580098497"></a>
### UI_DrawAllMapsSelection

```ml
function UI_DrawAllMapsSelection(state, rect, scale, color, textStyle, net)
```

Calls `mq3.client.ui_main_missionpack.currentMap`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawAllMapsSelection`. The final path returns `draw(state,"allmaps-selection",rect,map.mapName,[scale,color,textStyle,net])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_DrawAllMapsSelection`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"allmaps-selection",rect,map.mapName,[scale,color,textStyle,net])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"allmaps-selection",rect,map.mapName,[scale,color,textStyle,net])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `textStyle` | `dynamic` | — | Value used by `return draw(state,"allmaps-selection",rect,map.mapName,[scale,color,textStyle,net])`. |
| `net` | `dynamic` | — | Value used by `return draw(state,"allmaps-selection",rect,map.mapName,[scale,color,textStyle,net])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L977)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawbotname-function-ui-drawbotname-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-130468444"></a>
### UI_DrawBotName

```ml
function UI_DrawBotName(state, rect, scale, color, textStyle)
```

Calls `mq3.client.ui_main_missionpack.clamp`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawBotName`. The final path returns `draw(state,"bot-name",rect,alias.name,[scale,color,textStyle])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.aliases`, `state.currentBot`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"bot-name",rect,alias.name,[scale,color,textStyle])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"bot-name",rect,alias.name,[scale,color,textStyle])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `textStyle` | `dynamic` | — | Value used by `return draw(state,"bot-name",rect,alias.name,[scale,color,textStyle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L991)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawbotskill-function-ui-drawbotskill-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-489791926"></a>
### UI_DrawBotSkill

```ml
function UI_DrawBotSkill(state, rect, scale, color, textStyle)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawBotSkill`, returning its result for `state, "bot-skill", rect, str(state.currentBotSkill), [scale,color,textStyle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentBotSkill`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `textStyle` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L998)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawcenteredpic-function-ui-drawcenteredpic-state-image-w-h-src-mq3-client-ui-main-missionpack-ml-1520180121"></a>
### UI_DrawCenteredPic

```ml
function UI_DrawCenteredPic(state, image, w, h)
```

Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `UI_DrawCenteredPic`, returning its result for `state, "renderer", "pic", str(image), "", [320-w/2.0,240-h/2.0,w,h]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.emit`. |
| `image` | `dynamic` | — | Argument 4 of `mq3.client.ui_main_missionpack.emit`; passed as `str(image)`. |
| `w` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[320-w/2.0,240-h/2.0,w,h]`. |
| `h` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[320-w/2.0,240-h/2.0,w,h]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L671)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawcinematic-function-ui-drawcinematic-state-handle-x-y-w-h-src-mq3-client-ui-main-missionpack-ml-736738981"></a>
### UI_DrawCinematic

```ml
function UI_DrawCinematic(state, handle, x, y, w, h)
```

Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `UI_DrawCinematic`, returning its result for `state, "cinematic", "draw", str(handle), "", [x,y,w,h]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.emit`. |
| `handle` | `dynamic` | — | Argument 4 of `mq3.client.ui_main_missionpack.emit`; passed as `str(handle)`. |
| `x` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,w,h]`. |
| `y` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,w,h]`. |
| `w` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,w,h]`. |
| `h` | `dynamic` | — | Argument 6 of `mq3.client.ui_main_missionpack.emit`; passed as `[x,y,w,h]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L841)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawclancinematic-function-ui-drawclancinematic-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-750349126"></a>
### UI_DrawClanCinematic

```ml
function UI_DrawClanCinematic(state, rect, scale, color)
```

Calls `mq3.client.ui_main_missionpack.teamAt`, `mq3.client.ui_main_missionpack.UI_PlayCinematic`, `mq3.client.ui_main_missionpack.UI_DrawCinematic` from UI main missionpack `UI_DrawClanCinematic`. The final path returns `UI_DrawCinematic(state,team.cinematic,rect.x,rect.y,rect.w,rect.h)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentTeam`. |
| `rect` | `dynamic` | — | Record read through `rect.x`, `rect.y`, `rect.w`, `rect.h`. |
| `scale` | `dynamic` | — | Accepted for compatibility with `UI_DrawClanCinematic`; the current implementation does not read it. |
| `color` | `dynamic` | — | Accepted for compatibility with `UI_DrawClanCinematic`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L768)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawclanlogo-function-ui-drawclanlogo-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-1182693038"></a>
### UI_DrawClanLogo

```ml
function UI_DrawClanLogo(state, rect, scale, color)
```

Calls `mq3.client.ui_main_missionpack.teamAt`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawClanLogo`. The final path returns `draw(state,"clan-logo",rect,team.imageName,[scale,color])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentTeam`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"clan-logo",rect,team.imageName,[scale,color])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"clan-logo",rect,team.imageName,[scale,color])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L762)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawclanname-function-ui-drawclanname-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1438020428"></a>
### UI_DrawClanName

```ml
function UI_DrawClanName(state, rect, scale, color, textStyle)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawClanName`, returning its result for `state, "clan-name", rect, cvarString(state,"ui_teamName"), [scale,color,textStyle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_teamName")`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `textStyle` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L727)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawconnectscreen-function-ui-drawconnectscreen-state-overlay-src-mq3-client-ui-main-missionpack-ml-1319136191"></a>
### UI_DrawConnectScreen

```ml
function UI_DrawConnectScreen(state, overlay)
```

Updates `state.lastConnState`, `state.lastLoadingText` during UI main missionpack `UI_DrawConnectScreen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.lastConnState`, `state.lastLoadingText`. |
| `overlay` | `dynamic` | — | Value used by `action=emit(state,"renderer","connect-screen",connection,loading,[overlay])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1667)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawcrosshair-function-ui-drawcrosshair-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-1212526158"></a>
### UI_DrawCrosshair

```ml
function UI_DrawCrosshair(state, rect, scale, color)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawCrosshair`, returning its result for `state, "crosshair", rect, "gfx/2d/crosshair"+str(state.currentCrosshair), [scale,color]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentCrosshair`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1011)

<a id="function-function-mq3-client-ui-main-missionpack-ui-draweffects-function-ui-draweffects-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-446300614"></a>
### UI_DrawEffects

```ml
function UI_DrawEffects(state, rect, scale, color)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawEffects`, returning its result for `state, "effects", rect, cvarString(state,"color1"), [scale,color]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"color1")`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L804)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawgametype-function-ui-drawgametype-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1121330426"></a>
### UI_DrawGameType

```ml
function UI_DrawGameType(state, rect, scale, color, textStyle)
```

Calls `mq3.client.ui_main_missionpack.clamp`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawGameType`. The final path returns `draw(state,"game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentGameType`, `state.gameTypes`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `textStyle` | `dynamic` | — | Value used by `return draw(state,"game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L734)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawglinfo-function-ui-drawglinfo-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1055837712"></a>
### UI_DrawGLInfo

```ml
function UI_DrawGLInfo(state, rect, scale, color, textStyle)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawGLInfo`, returning its result for `state, "gl-info", rect, state.glInfo, [scale,color,textStyle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.glInfo`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `textStyle` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1051)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawhandicap-function-ui-drawhandicap-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-65958394"></a>
### UI_DrawHandicap

```ml
function UI_DrawHandicap(state, rect, scale, color, textStyle)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawHandicap`, returning its result for `state, "handicap", rect, cvarString(state,"handicap"), [scale,color,textStyle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"handicap")`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `textStyle` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L720)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawjoingametype-function-ui-drawjoingametype-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1708417974"></a>
### UI_DrawJoinGameType

```ml
function UI_DrawJoinGameType(state, rect, scale, color, textStyle)
```

Calls `mq3.client.ui_main_missionpack.clamp`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawJoinGameType`. The final path returns `draw(state,"join-game-type",rect,state.joinGameTypes[index][0],[scale,color,textStyle])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentJoinGameType`, `state.joinGameTypes`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"join-game-type",rect,state.joinGameTypes[index][0],[scale,color,textStyle])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"join-game-type",rect,state.joinGameTypes[index][0],[scale,color,textStyle])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `textStyle` | `dynamic` | — | Value used by `return draw(state,"join-game-type",rect,state.joinGameTypes[index][0],[scale,color,textStyle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L748)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawkeybindstatus-function-ui-drawkeybindstatus-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-768074376"></a>
### UI_DrawKeyBindStatus

```ml
function UI_DrawKeyBindStatus(state, rect, scale, color, textStyle)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawKeyBindStatus`, returning its result for `state, "keybind-status", rect, cvarString(state,"ui_bindStatus"), [scale,color,textStyle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_bindStatus")`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `textStyle` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1044)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawmapcinematic-function-ui-drawmapcinematic-state-rect-scale-color-net-src-mq3-client-ui-main-missionpack-ml-306898689"></a>
### UI_DrawMapCinematic

```ml
function UI_DrawMapCinematic(state, rect, scale, color, net)
```

Calls `mq3.client.ui_main_missionpack.currentMap`, `mq3.client.ui_main_missionpack.UI_PlayCinematic`, `mq3.client.ui_main_missionpack.UI_RunCinematicFrame` and additional helpers from UI main missionpack `UI_DrawMapCinematic`. The final path returns `UI_DrawCinematic(state,map.cinematic,rect.x,rect.y,rect.w,rect.h)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_DrawMapCinematic`. |
| `rect` | `dynamic` | — | Record read through `rect.x`, `rect.y`, `rect.w`, `rect.h`. |
| `scale` | `dynamic` | — | Accepted for compatibility with `UI_DrawMapCinematic`; the current implementation does not read it. |
| `color` | `dynamic` | — | Accepted for compatibility with `UI_DrawMapCinematic`; the current implementation does not read it. |
| `net` | `dynamic` | — | Accepted for compatibility with `UI_DrawMapCinematic`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L852)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawmappreview-function-ui-drawmappreview-state-rect-scale-color-net-src-mq3-client-ui-main-missionpack-ml-1369813803"></a>
### UI_DrawMapPreview

```ml
function UI_DrawMapPreview(state, rect, scale, color, net)
```

Updates `state.assets` during UI main missionpack `UI_DrawMapPreview`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.assets`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"map-preview",rect,map.imageName,[scale,color,net,map.levelShot])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"map-preview",rect,map.imageName,[scale,color,net,map.levelShot])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `net` | `dynamic` | — | Value used by `return draw(state,"map-preview",rect,map.imageName,[scale,color,net,map.levelShot])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L814)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawmaptimetobeat-function-ui-drawmaptimetobeat-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-693794092"></a>
### UI_DrawMapTimeToBeat

```ml
function UI_DrawMapTimeToBeat(state, rect, scale, color, textStyle)
```

Calls `mq3.client.ui_main_missionpack.currentMap`, `mq3.client.ui_main_missionpack.clamp`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawMapTimeToBeat`. The final path returns `draw(state,"map-time",rect,str(seconds/60)+":"+str(seconds%60),[scale,color,textStyle])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentGameType`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"map-time",rect,str(seconds/60)+":"+str(seconds%60),[scale,color,textStyle])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"map-time",rect,str(seconds/60)+":"+str(seconds%60),[scale,color,textStyle])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `textStyle` | `dynamic` | — | Value used by `return draw(state,"map-time",rect,str(seconds/60)+":"+str(seconds%60),[scale,color,textStyle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L821)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawnetfilter-function-ui-drawnetfilter-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1647362580"></a>
### UI_DrawNetFilter

```ml
function UI_DrawNetFilter(state, rect, scale, color, textStyle)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawNetFilter`, returning its result for `state, "net-filter", rect, str(state.currentNetFilter), [scale,color,textStyle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentNetFilter`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `textStyle` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L882)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawnetgametype-function-ui-drawnetgametype-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1376065564"></a>
### UI_DrawNetGameType

```ml
function UI_DrawNetGameType(state, rect, scale, color, textStyle)
```

Calls `mq3.client.ui_main_missionpack.clamp`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawNetGameType`. The final path returns `draw(state,"net-game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentNetGameType`, `state.gameTypes`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"net-game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"net-game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `textStyle` | `dynamic` | — | Value used by `return draw(state,"net-game-type",rect,state.gameTypes[index][0],[scale,color,textStyle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L741)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawnetmapcinematic-function-ui-drawnetmapcinematic-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-1183503326"></a>
### UI_DrawNetMapCinematic

```ml
function UI_DrawNetMapCinematic(state, rect, scale, color)
```

Adapts `mq3.client.ui_main_missionpack.UI_DrawMapCinematic` to UI main missionpack `UI_DrawNetMapCinematic`, returning its result for `state, rect, scale, color, true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.UI_DrawMapCinematic`. |
| `rect` | `dynamic` | — | Argument 2 of `mq3.client.ui_main_missionpack.UI_DrawMapCinematic`. |
| `scale` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.UI_DrawMapCinematic`. |
| `color` | `dynamic` | — | Argument 4 of `mq3.client.ui_main_missionpack.UI_DrawMapCinematic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L875)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawnetmappreview-function-ui-drawnetmappreview-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-1755102230"></a>
### UI_DrawNetMapPreview

```ml
function UI_DrawNetMapPreview(state, rect, scale, color)
```

Adapts `mq3.client.ui_main_missionpack.UI_DrawMapPreview` to UI main missionpack `UI_DrawNetMapPreview`, returning its result for `state, rect, scale, color, true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.UI_DrawMapPreview`. |
| `rect` | `dynamic` | — | Argument 2 of `mq3.client.ui_main_missionpack.UI_DrawMapPreview`. |
| `scale` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.UI_DrawMapPreview`. |
| `color` | `dynamic` | — | Argument 4 of `mq3.client.ui_main_missionpack.UI_DrawMapPreview`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L869)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawnetsource-function-ui-drawnetsource-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1289953212"></a>
### UI_DrawNetSource

```ml
function UI_DrawNetSource(state, rect, scale, color, textStyle)
```

Calls `mq3.client.ui_main_missionpack.draw`, `mq3.client.ui_main_missionpack.clamp` from UI main missionpack `UI_DrawNetSource`. The final path returns `draw(state,"net-source",rect,sources[clamp(state.currentNetSource,0,3)],[scale,color,textStyle])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentNetSource`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"net-source",rect,sources[clamp(state.currentNetSource,0,3)],[scale,color,textStyle])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"net-source",rect,sources[clamp(state.currentNetSource,0,3)],[scale,color,textStyle])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `textStyle` | `dynamic` | — | Value used by `return draw(state,"net-source",rect,sources[clamp(state.currentNetSource,0,3)],[scale,color,textStyle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L863)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawopponent-function-ui-drawopponent-state-rect-src-mq3-client-ui-main-missionpack-ml-1335563029"></a>
### UI_DrawOpponent

```ml
function UI_DrawOpponent(state, rect)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawOpponent`, returning its result for `state, "opponent", rect, UI_OpponentLeaderModel(state), []`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `UI_OpponentLeaderModel(state)`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L933)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawopponentlogo-function-ui-drawopponentlogo-state-rect-color-src-mq3-client-ui-main-missionpack-ml-1366920086"></a>
### UI_DrawOpponentLogo

```ml
function UI_DrawOpponentLogo(state, rect, color)
```

Calls `mq3.client.ui_main_missionpack.teamAt`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawOpponentLogo`. The final path returns `draw(state,"opponent-logo",rect,team.name,[color])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentOpponent`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"opponent-logo",rect,team.name,[color])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L959)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawopponentlogometal-function-ui-drawopponentlogometal-state-rect-color-src-mq3-client-ui-main-missionpack-ml-1497305576"></a>
### UI_DrawOpponentLogoMetal

```ml
function UI_DrawOpponentLogoMetal(state, rect, color)
```

Adapts `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo` to UI main missionpack `UI_DrawOpponentLogoMetal`, returning its result for `state, rect, color`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo`. |
| `rect` | `dynamic` | — | Argument 2 of `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo`. |
| `color` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L964)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawopponentlogoname-function-ui-drawopponentlogoname-state-rect-color-src-mq3-client-ui-main-missionpack-ml-1113852488"></a>
### UI_DrawOpponentLogoName

```ml
function UI_DrawOpponentLogoName(state, rect, color)
```

Adapts `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo` to UI main missionpack `UI_DrawOpponentLogoName`, returning its result for `state, rect, color`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo`. |
| `rect` | `dynamic` | — | Argument 2 of `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo`. |
| `color` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.UI_DrawOpponentLogo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L969)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawopponentname-function-ui-drawopponentname-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1976860846"></a>
### UI_DrawOpponentName

```ml
function UI_DrawOpponentName(state, rect, scale, color, textStyle)
```

Calls `mq3.client.ui_main_missionpack.teamAt`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawOpponentName`. The final path returns `draw(state,"opponent-name",rect,team.name,[scale,color,textStyle])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentOpponent`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"opponent-name",rect,team.name,[scale,color,textStyle])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"opponent-name",rect,team.name,[scale,color,textStyle])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `textStyle` | `dynamic` | — | Value used by `return draw(state,"opponent-name",rect,team.name,[scale,color,textStyle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L984)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawplayerlogo-function-ui-drawplayerlogo-state-rect-color-src-mq3-client-ui-main-missionpack-ml-220473690"></a>
### UI_DrawPlayerLogo

```ml
function UI_DrawPlayerLogo(state, rect, color)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawPlayerLogo`, returning its result for `state, "player-logo", rect, cvarString(state,"ui_teamName"), [color]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_teamName")`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[color]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L944)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawplayerlogometal-function-ui-drawplayerlogometal-state-rect-color-src-mq3-client-ui-main-missionpack-ml-615382784"></a>
### UI_DrawPlayerLogoMetal

```ml
function UI_DrawPlayerLogoMetal(state, rect, color)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawPlayerLogoMetal`, returning its result for `state, "player-logo-metal", rect, cvarString(state,"ui_teamName"), [color]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_teamName")`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[color]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L949)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawplayerlogoname-function-ui-drawplayerlogoname-state-rect-color-src-mq3-client-ui-main-missionpack-ml-1624044496"></a>
### UI_DrawPlayerLogoName

```ml
function UI_DrawPlayerLogoName(state, rect, color)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawPlayerLogoName`, returning its result for `state, "player-logo-name", rect, cvarString(state,"ui_teamName"), [color]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_teamName")`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[color]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L954)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawplayermodel-function-ui-drawplayermodel-state-rect-src-mq3-client-ui-main-missionpack-ml-699336145"></a>
### UI_DrawPlayerModel

```ml
function UI_DrawPlayerModel(state, rect)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawPlayerModel`, returning its result for `state, "player-model", rect, cvarString(state,"model"), []`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"model")`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L856)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawpreviewcinematic-function-ui-drawpreviewcinematic-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-975443878"></a>
### UI_DrawPreviewCinematic

```ml
function UI_DrawPreviewCinematic(state, rect, scale, color)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawPreviewCinematic`, returning its result for `state, "preview-cinematic", rect, cvarString(state,"ui_previewMovie"), [scale,color]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_previewMovie")`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L774)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawredblue-function-ui-drawredblue-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-313003788"></a>
### UI_DrawRedBlue

```ml
function UI_DrawRedBlue(state, rect, scale, color, textStyle)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawRedBlue`, returning its result for `state, "red-blue", rect, cvarString(state,"ui_redblue"), [scale,color,textStyle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_redblue")`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `textStyle` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1005)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawselectedplayer-function-ui-drawselectedplayer-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-84263362"></a>
### UI_DrawSelectedPlayer

```ml
function UI_DrawSelectedPlayer(state, rect, scale, color, textStyle)
```

Calls `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawSelectedPlayer`. The final path returns `draw(state,"selected-player",rect,name,[scale,color,textStyle])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.selectedPlayer`, `state.teamNames`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"selected-player",rect,name,[scale,color,textStyle])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"selected-player",rect,name,[scale,color,textStyle])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `textStyle` | `dynamic` | — | Value used by `return draw(state,"selected-player",rect,name,[scale,color,textStyle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1024)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawservermotd-function-ui-drawservermotd-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-2087472454"></a>
### UI_DrawServerMOTD

```ml
function UI_DrawServerMOTD(state, rect, scale, color)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawServerMOTD`, returning its result for `state, "server-motd", rect, state.serverMOTD, [scale,color]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.serverMOTD`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1037)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawserverrefreshdate-function-ui-drawserverrefreshdate-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-324731712"></a>
### UI_DrawServerRefreshDate

```ml
function UI_DrawServerRefreshDate(state, rect, scale, color, textStyle)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawServerRefreshDate`, returning its result for `state, "server-refresh-date", rect, state.serverRefreshDate, [scale,color,textStyle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.serverRefreshDate`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `textStyle` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1031)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawskill-function-ui-drawskill-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-769236"></a>
### UI_DrawSkill

```ml
function UI_DrawSkill(state, rect, scale, color, textStyle)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawSkill`, returning its result for `state, "skill", rect, str(state.currentBotSkill), [scale,color,textStyle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentBotSkill`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `textStyle` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L781)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawteammember-function-ui-drawteammember-state-rect-scale-color-blue-num-textstyle-src-mq3-client-ui-main-missionpack-ml-2031924674"></a>
### UI_DrawTeamMember

```ml
function UI_DrawTeamMember(state, rect, scale, color, blue, num, textStyle)
```

Calls `mq3.client.ui_main_missionpack.draw`, `mq3.client.ui_main_missionpack.cvarString` from UI main missionpack `UI_DrawTeamMember`. The final path returns `draw(state,"team-member",rect,cvarString(state,prefix+str(num)),[scale,color,textStyle])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_DrawTeamMember`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"team-member",rect,cvarString(state,prefix+str(num)),[scale,color,textStyle])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"team-member",rect,cvarString(state,prefix+str(num)),[scale,color,textStyle])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `blue` | `dynamic` | — | Blue color component. |
| `num` | `dynamic` | — | Value used by `return draw(state,"team-member",rect,cvarString(state,prefix+str(num)),[scale,color,textStyle])`. |
| `textStyle` | `dynamic` | — | Value used by `return draw(state,"team-member",rect,cvarString(state,prefix+str(num)),[scale,color,textStyle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L798)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawteamname-function-ui-drawteamname-state-rect-scale-color-blue-textstyle-src-mq3-client-ui-main-missionpack-ml-228445330"></a>
### UI_DrawTeamName

```ml
function UI_DrawTeamName(state, rect, scale, color, blue, textStyle)
```

Calls `mq3.client.ui_main_missionpack.cvarString`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawTeamName`. The final path returns `draw(state,"team-name",rect,name,[scale,color,blue,textStyle])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_DrawTeamName`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"team-name",rect,name,[scale,color,blue,textStyle])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"team-name",rect,name,[scale,color,blue,textStyle])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `blue` | `dynamic` | — | Blue color component. |
| `textStyle` | `dynamic` | — | Value used by `return draw(state,"team-name",rect,name,[scale,color,blue,textStyle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L789)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawtier-function-ui-drawtier-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-362552290"></a>
### UI_DrawTier

```ml
function UI_DrawTier(state, rect, scale, color, textStyle)
```

Adapts `mq3.client.ui_main_missionpack.draw` to UI main missionpack `UI_DrawTier`, returning its result for `state, "tier", rect, cvarString(state,"ui_currentTier"), [scale,color,textStyle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 4 of `mq3.client.ui_main_missionpack.draw`; passed as `state`, `cvarString(state,"ui_currentTier")`. |
| `rect` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.draw`. |
| `scale` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `color` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |
| `textStyle` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.draw`; passed as `[scale,color,textStyle]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L889)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawtiergametype-function-ui-drawtiergametype-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1694868466"></a>
### UI_DrawTierGameType

```ml
function UI_DrawTierGameType(state, rect, scale, color, textStyle)
```

Adapts `mq3.client.ui_main_missionpack.UI_DrawGameType` to UI main missionpack `UI_DrawTierGameType`, returning its result for `state, rect, scale, color, textStyle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.UI_DrawGameType`. |
| `rect` | `dynamic` | — | Argument 2 of `mq3.client.ui_main_missionpack.UI_DrawGameType`. |
| `scale` | `dynamic` | — | Argument 3 of `mq3.client.ui_main_missionpack.UI_DrawGameType`. |
| `color` | `dynamic` | — | Argument 4 of `mq3.client.ui_main_missionpack.UI_DrawGameType`. |
| `textStyle` | `dynamic` | — | Argument 5 of `mq3.client.ui_main_missionpack.UI_DrawGameType`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L908)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawtiermap-function-ui-drawtiermap-state-rect-index-src-mq3-client-ui-main-missionpack-ml-1638688537"></a>
### UI_DrawTierMap

```ml
function UI_DrawTierMap(state, rect, index)
```

Calls `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawTierMap`. The final path returns `draw(state,"tier-map",rect,state.maps[index].imageName,[index])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.maps`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"tier-map",rect,state.maps[index].imageName,[index])`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=len(state.maps)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L894)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawtiermapname-function-ui-drawtiermapname-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-2098185212"></a>
### UI_DrawTierMapName

```ml
function UI_DrawTierMapName(state, rect, scale, color, textStyle)
```

Calls `mq3.client.ui_main_missionpack.currentMap`, `mq3.client.ui_main_missionpack.draw` from UI main missionpack `UI_DrawTierMapName`. The final path returns `draw(state,"tier-map-name",rect,map.mapName,[scale,color,textStyle])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_DrawTierMapName`. |
| `rect` | `dynamic` | — | Value used by `return draw(state,"tier-map-name",rect,map.mapName,[scale,color,textStyle])`. |
| `scale` | `dynamic` | — | Value used by `return draw(state,"tier-map-name",rect,map.mapName,[scale,color,textStyle])`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `textStyle` | `dynamic` | — | Value used by `return draw(state,"tier-map-name",rect,map.mapName,[scale,color,textStyle])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L901)

<a id="function-function-mq3-client-ui-main-missionpack-ui-effects-handlekey-function-ui-effects-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-251088748"></a>
### UI_Effects_HandleKey

```ml
function UI_Effects_HandleKey(state, flags, special, key)
```

Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_main_missionpack.cvarValue`, `mq3.client.ui_main_missionpack.cycle` and additional helpers from UI main missionpack `UI_Effects_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_Effects_HandleKey`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_Effects_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_Effects_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1160)

<a id="function-function-mq3-client-ui-main-missionpack-ui-englishmapname-function-ui-englishmapname-state-map-src-mq3-client-ui-main-missionpack-ml-1667355197"></a>
### UI_EnglishMapName

```ml
function UI_EnglishMapName(state, map)
```

Calls `std.string.toLowerAscii` from UI main missionpack `UI_EnglishMapName`. The final path returns `map`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.maps`. |
| `map` | `dynamic` | — | map record passed to the UI main missionpack helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1627)

<a id="function-function-mq3-client-ui-main-missionpack-ui-feedercount-function-ui-feedercount-state-feederid-src-mq3-client-ui-main-missionpack-ml-1526625249"></a>
### UI_FeederCount

```ml
function UI_FeederCount(state, feederID)
```

Calls `mq3.client.ui_main_missionpack.UI_HeadCountByTeam`, `mq3.client.ui_main_missionpack.UI_MapCountByGameType` from UI main missionpack `UI_FeederCount`. The final path returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.q3HeadNames`, `state.movies`, `state.displayServers`, `state.serverStatusLines` and additional values. |
| `feederID` | `dynamic` | — | Value used by `if feederID==FEEDER_HEADS then return UI_HeadCountByTeam(state) else if feederID==FEEDER_Q3HEADS then return len(state.q3HeadNames) else if fe...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1386)

<a id="function-function-mq3-client-ui-main-missionpack-ui-feederitemimage-function-ui-feederitemimage-state-feederid-index-src-mq3-client-ui-main-missionpack-ml-99625761"></a>
### UI_FeederItemImage

```ml
function UI_FeederItemImage(state, feederID, index)
```

Updates `state.assets` during UI main missionpack `UI_FeederItemImage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.assets`. |
| `feederID` | `dynamic` | — | Value used by `if feederID==FEEDER_HEADS then actual=[0]`. |
| `index` | `dynamic` | — | Value tested by `else if feederID==FEEDER_Q3HEADS and index>=0 and index<len(state.q3HeadIcons)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1403)

<a id="function-function-mq3-client-ui-main-missionpack-ui-feederitemtext-function-ui-feederitemtext-state-feederid-index-column-src-mq3-client-ui-main-missionpack-ml-1791219215"></a>
### UI_FeederItemText

```ml
function UI_FeederItemText(state, feederID, index, column)
```

Calls `mq3.client.ui_main_missionpack.UI_SelectedHead`, `mq3.client.ui_main_missionpack.UI_SelectedMap` from UI main missionpack `UI_FeederItemText`. The final path returns `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.q3HeadNames`, `state.displayServers`, `state.servers`, `state.gameTypes` and additional values. |
| `feederID` | `dynamic` | — | Value used by `if feederID==FEEDER_HEADS then actual=[0]`. |
| `index` | `dynamic` | — | Value tested by `feederID==FEEDER_Q3HEADS and index>=0 and index<len(state.q3HeadNames)`, `feederID==FEEDER_SERVERS and index>=0 and index<len(state.displayServers)` and additional values before the calculation continues. |
| `column` | `dynamic` | — | Value used by `if column==0 then if server.ping<=0 then return server.address end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1394)

<a id="function-function-mq3-client-ui-main-missionpack-ui-feederselection-function-ui-feederselection-state-feederid-index-src-mq3-client-ui-main-missionpack-ml-837185269"></a>
### UI_FeederSelection

```ml
function UI_FeederSelection(state, feederID, index)
```

Updates `state.currentMap`, `state.selectedPlayer` during UI main missionpack `UI_FeederSelection`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentMap`, `state.selectedPlayer`. |
| `feederID` | `dynamic` | — | Value used by `if feederID==FEEDER_HEADS then actual=[0]`. |
| `index` | `dynamic` | — | Value assigned to `state.selectedPlayer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1410)

<a id="function-function-mq3-client-ui-main-missionpack-ui-gametype-handlekey-function-ui-gametype-handlekey-state-flags-special-key-resetmap-src-mq3-client-ui-main-missionpack-ml-30928079"></a>
### UI_GameType_HandleKey

```ml
function UI_GameType_HandleKey(state, flags, special, key, resetMap)
```

Updates `state.currentGameType`, `state.currentMap` during UI main missionpack `UI_GameType_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentGameType`, `state.currentMap`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_GameType_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_GameType_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |
| `resetMap` | `dynamic` | — | Value used by `if resetMap then state.currentMap=0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1173)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-getapiversion-const-ui-getapiversion-0-src-mq3-client-ui-main-missionpack-ml-1248076947"></a>
### UI_GETAPIVERSION

```ml
const UI_GETAPIVERSION = 0
```

UI VM entry-point ordinal used to query the UI VM interface version.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L11)

<a id="function-function-mq3-client-ui-main-missionpack-ui-getindexfromselection-function-ui-getindexfromselection-state-actual-src-mq3-client-ui-main-missionpack-ml-1697727713"></a>
### UI_GetIndexFromSelection

```ml
function UI_GetIndexFromSelection(state, actual)
```

Converts an actual map index to its position among active maps, returning zero when no active entry matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.maps`. |
| `actual` | `dynamic` | — | Value used by `for i=0 to len(state.maps)-1 if state.maps[i].active then if i==actual then return count end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1379)

<a id="function-function-mq3-client-ui-main-missionpack-ui-getserverstatusinfo-function-ui-getserverstatusinfo-state-address-statustext-src-mq3-client-ui-main-missionpack-ml-1975865412"></a>
### UI_GetServerStatusInfo

```ml
function UI_GetServerStatusInfo(state, address, statusText)
```

Calls `std.string.split`, `mq3.client.ui_main_missionpack.UI_SortServerStatusInfo` from UI main missionpack `UI_GetServerStatusInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_GetServerStatusInfo`. |
| `address` | `dynamic` | — | Value used by `if address=="" or statusText=="" then return false end if`. |
| `statusText` | `dynamic` | — | Value used by `if address=="" or statusText=="" then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1337)

<a id="function-function-mq3-client-ui-main-missionpack-ui-getteamcolor-function-ui-getteamcolor-state-src-mq3-client-ui-main-missionpack-ml-720076829"></a>
### UI_GetTeamColor

```ml
function UI_GetTeamColor(state)
```

Calls `mq3.compat.textnumbers.atoi`, `mq3.client.ui_main_missionpack.cvarString` from UI main missionpack `UI_GetTeamColor`. The final path returns `[0.0,0.0,1.0,1.0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_GetTeamColor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1614)

<a id="function-function-mq3-client-ui-main-missionpack-ui-getvalue-function-ui-getvalue-state-ownerdraw-src-mq3-client-ui-main-missionpack-ml-579721948"></a>
### UI_GetValue

```ml
function UI_GetValue(state, ownerDraw)
```

Returns the fixed `0.0` value for UI main missionpack `UI_GetValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Accepted for compatibility with `UI_GetValue`; the current implementation does not read it. |
| `ownerDraw` | `dynamic` | — | Accepted for compatibility with `UI_GetValue`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1267)

<a id="function-function-mq3-client-ui-main-missionpack-ui-handicap-handlekey-function-ui-handicap-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-39302718"></a>
### UI_Handicap_HandleKey

```ml
function UI_Handicap_HandleKey(state, flags, special, key)
```

Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_main_missionpack.cvarValue`, `mq3.client.ui_main_missionpack.direction` and additional helpers from UI main missionpack `UI_Handicap_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_Handicap_HandleKey`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_Handicap_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_Handicap_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1154)

<a id="function-function-mq3-client-ui-main-missionpack-ui-hasskinforbase-function-ui-hasskinforbase-state-base-team-src-mq3-client-ui-main-missionpack-ml-523336883"></a>
### UI_hasSkinForBase

```ml
function UI_hasSkinForBase(state, base, team)
```

Calls `std.string.toLowerAscii`, `std.string.startsWith`, `std.string.endsWith` from UI main missionpack `UI_hasSkinForBase`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.q3HeadNames`. |
| `base` | `dynamic` | — | Value used by `wanted=strings.toLowerAscii(base)`. |
| `team` | `dynamic` | — | Value used by `suffix="/"+strings.toLowerAscii(team)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1619)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-hasuniquecdkey-const-ui-hasuniquecdkey-10-src-mq3-client-ui-main-missionpack-ml-1555188344"></a>
### UI_HASUNIQUECDKEY

```ml
const UI_HASUNIQUECDKEY = 10
```

UI VM entry-point ordinal used to query whether the UI requires a unique product key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L31)

<a id="function-function-mq3-client-ui-main-missionpack-ui-headcountbyteam-function-ui-headcountbyteam-state-src-mq3-client-ui-main-missionpack-ml-1654998831"></a>
### UI_HeadCountByTeam

```ml
function UI_HeadCountByTeam(state)
```

Evaluates UI main missionpack `UI_HeadCountByTeam` and returns `count` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.characters`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1365)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-init-const-ui-init-1-src-mq3-client-ui-main-missionpack-ml-1290038048"></a>
### UI_INIT

```ml
const UI_INIT = 1
```

UI VM entry-point ordinal used to initialize the UI VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L13)

<a id="function-function-mq3-client-ui-main-missionpack-ui-insertserverintodisplaylist-function-ui-insertserverintodisplaylist-state-num-position-src-mq3-client-ui-main-missionpack-ml-250064298"></a>
### UI_InsertServerIntoDisplayList

```ml
function UI_InsertServerIntoDisplayList(state, num, position)
```

Updates `state.displayServers` during UI main missionpack `UI_InsertServerIntoDisplayList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.displayServers`. |
| `num` | `dynamic` | — | Value used by `if containsValue(state.displayServers,num) then return false end if`. |
| `position` | `dynamic` | — | Value used by `position=clamp(position,0,len(state.displayServers))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1299)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-is-fullscreen-const-ui-is-fullscreen-6-src-mq3-client-ui-main-missionpack-ml-362107693"></a>
### UI_IS_FULLSCREEN

```ml
const UI_IS_FULLSCREEN = 6
```

UI VM entry-point ordinal used to query whether the UI covers the game view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L23)

<a id="function-function-mq3-client-ui-main-missionpack-ui-joingametype-handlekey-function-ui-joingametype-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1204234038"></a>
### UI_JoinGameType_HandleKey

```ml
function UI_JoinGameType_HandleKey(state, flags, special, key)
```

Updates `state.currentJoinGameType` during UI main missionpack `UI_JoinGameType_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentJoinGameType`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_JoinGameType_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_JoinGameType_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1185)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-key-event-const-ui-key-event-3-src-mq3-client-ui-main-missionpack-ml-181268674"></a>
### UI_KEY_EVENT

```ml
const UI_KEY_EVENT = 3
```

UI VM entry-point ordinal used to deliver a key event to the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L17)

<a id="function-function-mq3-client-ui-main-missionpack-ui-load-function-ui-load-state-files-src-mq3-client-ui-main-missionpack-ml-814128644"></a>
### UI_Load

```ml
function UI_Load(state, files)
```

Updates `state.assets` during UI main missionpack `UI_Load`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.assets`. |
| `files` | `dynamic` | — | Value used by `return UI_LoadMenus(state,"ui/menus.txt",true,files)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L705)

<a id="function-function-mq3-client-ui-main-missionpack-ui-loaddemos-function-ui-loaddemos-state-files-protocol-src-mq3-client-ui-main-missionpack-ml-669271218"></a>
### UI_LoadDemos

```ml
function UI_LoadDemos(state, files, protocol)
```

Updates `state.demos` during UI main missionpack `UI_LoadDemos`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.demos`. |
| `files` | `dynamic` | — | Value used by `for each file in files if len(state.demos)>=128 then break end if`. |
| `protocol` | `dynamic` | — | Value used by `extension=".dm_"+str(protocol)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1440)

<a id="function-function-mq3-client-ui-main-missionpack-ui-loadmenus-function-ui-loadmenus-state-menufile-reset-files-src-mq3-client-ui-main-missionpack-ml-376322666"></a>
### UI_LoadMenus

```ml
function UI_LoadMenus(state, menuFile, reset, files)
```

Updates `state.menus` during UI main missionpack `UI_LoadMenus`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.menus`. |
| `menuFile` | `dynamic` | — | Value used by `text=GetMenuBuffer(state,menuFile,files)`. |
| `reset` | `dynamic` | — | Value used by `if reset then state.menus=[]`. |
| `files` | `dynamic` | — | Value used by `text=GetMenuBuffer(state,menuFile,files)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L698)

<a id="function-function-mq3-client-ui-main-missionpack-ui-loadmods-function-ui-loadmods-state-entries-src-mq3-client-ui-main-missionpack-ml-67917539"></a>
### UI_LoadMods

```ml
function UI_LoadMods(state, entries)
```

Updates `state.mods` during UI main missionpack `UI_LoadMods`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.mods`. |
| `entries` | `dynamic` | — | Value used by `for each pair in entries if len(state.mods)>=64 then break end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1423)

<a id="function-function-mq3-client-ui-main-missionpack-ui-loadmovies-function-ui-loadmovies-state-files-src-mq3-client-ui-main-missionpack-ml-1319427698"></a>
### UI_LoadMovies

```ml
function UI_LoadMovies(state, files)
```

Updates `state.movies` during UI main missionpack `UI_LoadMovies`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.movies`. |
| `files` | `dynamic` | — | Value used by `for each file in files if len(state.movies)>=64 then break end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1435)

<a id="function-function-mq3-client-ui-main-missionpack-ui-loadnoningame-function-ui-loadnoningame-state-files-src-mq3-client-ui-main-missionpack-ml-1229454018"></a>
### UI_LoadNonIngame

```ml
function UI_LoadNonIngame(state, files)
```

Adapts `mq3.client.ui_main_missionpack.UI_LoadMenus` to UI main missionpack `UI_LoadNonIngame`, returning its result for `state, "ui/menus.txt", true, files`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.UI_LoadMenus`. |
| `files` | `dynamic` | — | Argument 4 of `mq3.client.ui_main_missionpack.UI_LoadMenus`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1631)

<a id="function-function-mq3-client-ui-main-missionpack-ui-loadteams-function-ui-loadteams-state-entries-src-mq3-client-ui-main-missionpack-ml-506887295"></a>
### UI_LoadTeams

```ml
function UI_LoadTeams(state, entries)
```

Updates `state.teams` during UI main missionpack `UI_LoadTeams`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.teams`. |
| `entries` | `dynamic` | — | Value used by `for each row in entries members=[]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1427)

<a id="function-function-mq3-client-ui-main-missionpack-ui-mapcountbygametype-function-ui-mapcountbygametype-state-singleplayer-src-mq3-client-ui-main-missionpack-ml-1196278182"></a>
### UI_MapCountByGameType

```ml
function UI_MapCountByGameType(state, singlePlayer)
```

Updates `state.currentMap` during UI main missionpack `UI_MapCountByGameType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentMap`. |
| `singlePlayer` | `dynamic` | — | Accepted for compatibility with `UI_MapCountByGameType`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1360)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-mouse-event-const-ui-mouse-event-4-src-mq3-client-ui-main-missionpack-ml-1033301747"></a>
### UI_MOUSE_EVENT

```ml
const UI_MOUSE_EVENT = 4
```

UI VM entry-point ordinal used to deliver pointer motion to the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L19)

<a id="function-function-mq3-client-ui-main-missionpack-ui-netfilter-handlekey-function-ui-netfilter-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-403688516"></a>
### UI_NetFilter_HandleKey

```ml
function UI_NetFilter_HandleKey(state, flags, special, key)
```

Updates `state.currentNetFilter` during UI main missionpack `UI_NetFilter_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentNetFilter`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_NetFilter_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_NetFilter_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1218)

<a id="function-function-mq3-client-ui-main-missionpack-ui-netgametype-handlekey-function-ui-netgametype-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1267080852"></a>
### UI_NetGameType_HandleKey

```ml
function UI_NetGameType_HandleKey(state, flags, special, key)
```

Updates `state.currentNetGameType`, `state.currentMap` during UI main missionpack `UI_NetGameType_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentNetGameType`, `state.currentMap`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_NetGameType_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_NetGameType_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1179)

<a id="function-function-mq3-client-ui-main-missionpack-ui-netsource-handlekey-function-ui-netsource-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1712255380"></a>
### UI_NetSource_HandleKey

```ml
function UI_NetSource_HandleKey(state, flags, special, key)
```

Updates `state.currentNetSource` during UI main missionpack `UI_NetSource_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentNetSource`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_NetSource_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_NetSource_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1212)

<a id="function-function-mq3-client-ui-main-missionpack-ui-nextopponent-function-ui-nextopponent-state-src-mq3-client-ui-main-missionpack-ml-373842841"></a>
### UI_NextOpponent

```ml
function UI_NextOpponent(state)
```

Updates `state.currentOpponent` during UI main missionpack `UI_NextOpponent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentOpponent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L936)

<a id="function-function-mq3-client-ui-main-missionpack-ui-opponentleaderhead-function-ui-opponentleaderhead-state-src-mq3-client-ui-main-missionpack-ml-1150046369"></a>
### UI_OpponentLeaderHead

```ml
function UI_OpponentLeaderHead(state)
```

Adapts `mq3.client.ui_main_missionpack.UI_AIFromName` to UI main missionpack `UI_OpponentLeaderHead`, returning its result for `state, UI_OpponentLeaderName(state)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1, 2 of `mq3.client.ui_main_missionpack.UI_AIFromName`; passed as `state`, `UI_OpponentLeaderName(state)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L926)

<a id="function-function-mq3-client-ui-main-missionpack-ui-opponentleadermodel-function-ui-opponentleadermodel-state-src-mq3-client-ui-main-missionpack-ml-1440477079"></a>
### UI_OpponentLeaderModel

```ml
function UI_OpponentLeaderModel(state)
```

Computes `UI_OpponentLeaderHead(state)+"/default"` for UI main missionpack `UI_OpponentLeaderModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_OpponentLeaderModel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L929)

<a id="function-function-mq3-client-ui-main-missionpack-ui-opponentleadername-function-ui-opponentleadername-state-src-mq3-client-ui-main-missionpack-ml-1641166183"></a>
### UI_OpponentLeaderName

```ml
function UI_OpponentLeaderName(state)
```

Calls `mq3.client.ui_main_missionpack.teamAt` from UI main missionpack `UI_OpponentLeaderName`. The final path returns `team.teamMembers[0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentOpponent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L911)

<a id="function-function-mq3-client-ui-main-missionpack-ui-opponentname-handlekey-function-ui-opponentname-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-291735870"></a>
### UI_OpponentName_HandleKey

```ml
function UI_OpponentName_HandleKey(state, flags, special, key)
```

Calls `mq3.client.ui_main_missionpack.direction`, `mq3.client.ui_main_missionpack.UI_PriorOpponent`, `mq3.client.ui_main_missionpack.UI_NextOpponent` and additional helpers from UI main missionpack `UI_OpponentName_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.teams`, `state.currentOpponent`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_OpponentName_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_OpponentName_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1224)

<a id="function-function-mq3-client-ui-main-missionpack-ui-ownerdraw-function-ui-ownerdraw-state-x-y-w-h-text-x-text-y-ownerdraw-ownerdrawflags-align-special-scale-color-shader-textstyle-src-mq3-client-ui-main-missionpack-ml-617763371"></a>
### UI_OwnerDraw

```ml
function UI_OwnerDraw(state, x, y, w, h, text_x, text_y, ownerDraw, ownerDrawFlags, align, special, scale, color, shader, textStyle)
```

Calls `mq3.client.ui_main_missionpack.Rect`, `mq3.client.ui_main_missionpack.UI_OwnerDrawVisible`, `mq3.client.ui_main_missionpack.UI_DrawHandicap` and additional helpers from UI main missionpack `UI_OwnerDraw`. The final path returns `draw(state,"unknown-owner-draw",rect,"",[ownerDraw,ownerDrawFlags,align,special,shader])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_OwnerDraw`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_OwnerDraw`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_OwnerDraw`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `UI_OwnerDraw`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `UI_OwnerDraw`. |
| `text_x` | `dynamic` | — | Accepted for compatibility with `UI_OwnerDraw`; the current implementation does not read it. |
| `text_y` | `dynamic` | — | Accepted for compatibility with `UI_OwnerDraw`; the current implementation does not read it. |
| `ownerDraw` | `dynamic` | — | Value used by `if ownerDraw==200 then return UI_DrawHandicap(state,rect,scale,color,textStyle)`. |
| `ownerDrawFlags` | `dynamic` | — | Value used by `if not UI_OwnerDrawVisible(state,ownerDrawFlags) then return void end if`. |
| `align` | `dynamic` | — | Value used by `return draw(state,"unknown-owner-draw",rect,"",[ownerDraw,ownerDrawFlags,align,special,shader])`. |
| `special` | `dynamic` | — | Value used by `return draw(state,"unknown-owner-draw",rect,"",[ownerDraw,ownerDrawFlags,align,special,shader])`. |
| `scale` | `dynamic` | — | Value used by `if ownerDraw==200 then return UI_DrawHandicap(state,rect,scale,color,textStyle)`. |
| `color` | `dynamic` | — | Color value used by the UI main missionpack drawing or interpolation operation. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `textStyle` | `dynamic` | — | Value used by `if ownerDraw==200 then return UI_DrawHandicap(state,rect,scale,color,textStyle)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1085)

<a id="function-function-mq3-client-ui-main-missionpack-ui-ownerdraw-width-function-ui-ownerdraw-width-state-ownerdraw-src-mq3-client-ui-main-missionpack-ml-99913928"></a>
### UI_OwnerDraw_Width

```ml
function UI_OwnerDraw_Width(state, ownerDraw)
```

Adapts `mq3.client.ui_main_missionpack.UI_OwnerDrawWidth` to UI main missionpack `UI_OwnerDraw_Width`, returning its result for `state, ownerDraw, 0.4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.UI_OwnerDrawWidth`. |
| `ownerDraw` | `dynamic` | — | Argument 2 of `mq3.client.ui_main_missionpack.UI_OwnerDrawWidth`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1068)

<a id="function-function-mq3-client-ui-main-missionpack-ui-ownerdrawhandlekey-function-ui-ownerdrawhandlekey-state-ownerdraw-flags-special-key-src-mq3-client-ui-main-missionpack-ml-2053768487"></a>
### UI_OwnerDrawHandleKey

```ml
function UI_OwnerDrawHandleKey(state, ownerDraw, flags, special, key)
```

Calls `mq3.client.ui_main_missionpack.UI_Handicap_HandleKey`, `mq3.client.ui_main_missionpack.UI_Effects_HandleKey`, `mq3.client.ui_main_missionpack.UI_ClanName_HandleKey` and additional helpers from UI main missionpack `UI_OwnerDrawHandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_OwnerDrawHandleKey`. |
| `ownerDraw` | `dynamic` | — | Value used by `if ownerDraw==200 then return UI_Handicap_HandleKey(state,flags,special,key) else if ownerDraw==201 then return UI_Effects_HandleKey(state,fla...`. |
| `flags` | `dynamic` | — | Value used by `if ownerDraw==200 then return UI_Handicap_HandleKey(state,flags,special,key) else if ownerDraw==201 then return UI_Effects_HandleKey(state,fla...`. |
| `special` | `dynamic` | — | Value used by `if ownerDraw==200 then return UI_Handicap_HandleKey(state,flags,special,key) else if ownerDraw==201 then return UI_Effects_HandleKey(state,fla...`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1261)

<a id="function-function-mq3-client-ui-main-missionpack-ui-ownerdrawvisible-function-ui-ownerdrawvisible-state-flags-src-mq3-client-ui-main-missionpack-ml-1616833046"></a>
### UI_OwnerDrawVisible

```ml
function UI_OwnerDrawVisible(state, flags)
```

Evaluates UI main missionpack `UI_OwnerDrawVisible` and returns `false`, `true` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentNetSource`, `state.realtime`, `state.newHighScoreTime`, `state.newBestTime` and additional values. |
| `flags` | `dynamic` | — | Value used by `if (flags&UI_SHOW_FAVORITESERVERS)!=0 and state.currentNetSource!=AS_FAVORITES then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1137)

<a id="function-function-mq3-client-ui-main-missionpack-ui-ownerdrawwidth-function-ui-ownerdrawwidth-state-ownerdraw-scale-src-mq3-client-ui-main-missionpack-ml-573706780"></a>
### UI_OwnerDrawWidth

```ml
function UI_OwnerDrawWidth(state, ownerDraw, scale)
```

Calls `mq3.client.ui_main_missionpack.Text_Width`, `mq3.client.ui_main_missionpack.cvarString`, `mq3.client.ui_main_missionpack.clamp` and additional helpers from UI main missionpack `UI_OwnerDrawWidth`. The final path returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentGameType`, `state.gameTypes`, `state.currentOpponent`, `state.aliases` and additional values. |
| `ownerDraw` | `dynamic` | — | Value used by `if ownerDraw==200 then return Text_Width(state,cvarString(state,"handicap"),scale,0)`. |
| `scale` | `dynamic` | — | Value used by `if ownerDraw==200 then return Text_Width(state,cvarString(state,"handicap"),scale,0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1057)

<a id="function-function-mq3-client-ui-main-missionpack-ui-parsegameinfo-function-ui-parsegameinfo-state-gamefile-text-src-mq3-client-ui-main-missionpack-ml-599901186"></a>
### UI_ParseGameInfo

```ml
function UI_ParseGameInfo(state, gameFile, text)
```

Calls `mq3.client.ui_main_missionpack.tokenize`, `mq3.client.ui_main_missionpack.ParseResult`, `std.string.toLowerAscii` and additional helpers from UI main missionpack `UI_ParseGameInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_ParseGameInfo`. |
| `gameFile` | `dynamic` | — | Value used by `emit(state,"filesystem","parse-game",gameFile,"",[])`. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_ParseGameInfo` in the UI main missionpack path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1610)

<a id="function-function-mq3-client-ui-main-missionpack-ui-parsemenu-function-ui-parsemenu-state-menufile-text-src-mq3-client-ui-main-missionpack-ml-1433111085"></a>
### UI_ParseMenu

```ml
function UI_ParseMenu(state, menuFile, text)
```

Updates `state.menus` during UI main missionpack `UI_ParseMenu`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.menus`. |
| `menuFile` | `dynamic` | — | Value used by `state.menus=state.menus+[menuFile]`. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_ParseMenu` in the UI main missionpack path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L686)

<a id="function-function-mq3-client-ui-main-missionpack-ui-parseteaminfo-function-ui-parseteaminfo-state-teamfile-text-src-mq3-client-ui-main-missionpack-ml-1942206827"></a>
### UI_ParseTeamInfo

```ml
function UI_ParseTeamInfo(state, teamFile, text)
```

Calls `mq3.client.ui_main_missionpack.tokenize`, `mq3.client.ui_main_missionpack.ParseResult`, `std.string.toLowerAscii` and additional helpers from UI main missionpack `UI_ParseTeamInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_ParseTeamInfo`. |
| `teamFile` | `dynamic` | — | Value used by `emit(state,"filesystem","parse-team",teamFile,"",[])`. |
| `text` | `dynamic` | — | Text consumed or emitted by `UI_ParseTeamInfo` in the UI main missionpack path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1605)

<a id="function-function-mq3-client-ui-main-missionpack-ui-pause-function-ui-pause-state-value-src-mq3-client-ui-main-missionpack-ml-2095553212"></a>
### UI_Pause

```ml
function UI_Pause(state, value)
```

Updates `state.paused` during UI main missionpack `UI_Pause`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.paused`. |
| `value` | `dynamic` | — | Value assigned to `state.paused`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1635)

<a id="function-function-mq3-client-ui-main-missionpack-ui-playcinematic-function-ui-playcinematic-state-name-x-y-w-h-src-mq3-client-ui-main-missionpack-ml-1358787098"></a>
### UI_PlayCinematic

```ml
function UI_PlayCinematic(state, name, x, y, w, h)
```

Calls `mq3.client.ui_main_missionpack.emit` from UI main missionpack `UI_PlayCinematic`. The final path returns `len(state.actions)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.actions`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI main missionpack resource. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `UI_PlayCinematic`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `UI_PlayCinematic`. |
| `w` | `dynamic` | — | Width in the coordinate space used by `UI_PlayCinematic`. |
| `h` | `dynamic` | — | Height in the coordinate space used by `UI_PlayCinematic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L829)

<a id="function-function-mq3-client-ui-main-missionpack-ui-printtime-function-ui-printtime-time-src-mq3-client-ui-main-missionpack-ml-556615969"></a>
### UI_PrintTime

```ml
function UI_PrintTime(time)
```

Formats a millisecond duration as hours, minutes and seconds for the Missionpack UI.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | `dynamic` | — | Value used by `seconds=n.quotient(time,1000)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1653)

<a id="function-function-mq3-client-ui-main-missionpack-ui-prioropponent-function-ui-prioropponent-state-src-mq3-client-ui-main-missionpack-ml-1271342139"></a>
### UI_PriorOpponent

```ml
function UI_PriorOpponent(state)
```

Updates `state.currentOpponent` during UI main missionpack `UI_PriorOpponent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentOpponent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L939)

<a id="function-function-mq3-client-ui-main-missionpack-ui-readablesize-function-ui-readablesize-value-src-mq3-client-ui-main-missionpack-ml-1165737095"></a>
### UI_ReadableSize

```ml
function UI_ReadableSize(value)
```

Calls `mq3.compat.numeric.quotient`, `mq3.client.ui_main_missionpack.twoDigits`, `mq3.client.ui_main_missionpack.signedQuotient` and additional helpers from UI main missionpack `UI_ReadableSize`. The final path returns `str(value)+" bytes"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value>1073741824`, `value>1048576` and additional values before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1639)

<a id="function-function-mq3-client-ui-main-missionpack-ui-redblue-handlekey-function-ui-redblue-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1331562280"></a>
### UI_RedBlue_HandleKey

```ml
function UI_RedBlue_HandleKey(state, flags, special, key)
```

Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_main_missionpack.cvarValue`, `mq3.client.ui_main_missionpack.setCvar` from UI main missionpack `UI_RedBlue_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_RedBlue_HandleKey`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_RedBlue_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_RedBlue_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Accepted for compatibility with `UI_RedBlue_HandleKey`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1242)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-refresh-const-ui-refresh-5-src-mq3-client-ui-main-missionpack-ml-52865322"></a>
### UI_REFRESH

```ml
const UI_REFRESH = 5
```

UI VM entry-point ordinal used to advance and render the UI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L21)

<a id="function-function-mq3-client-ui-main-missionpack-ui-registercvars-function-ui-registercvars-state-src-mq3-client-ui-main-missionpack-ml-1192886111"></a>
### UI_RegisterCvars

```ml
function UI_RegisterCvars(state)
```

Updates `state.cvars` during UI main missionpack `UI_RegisterCvars`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1706)

<a id="function-function-mq3-client-ui-main-missionpack-ui-removeserverfromdisplaylist-function-ui-removeserverfromdisplaylist-state-num-src-mq3-client-ui-main-missionpack-ml-1532282475"></a>
### UI_RemoveServerFromDisplayList

```ml
function UI_RemoveServerFromDisplayList(state, num)
```

Updates `state.displayServers` during UI main missionpack `UI_RemoveServerFromDisplayList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.displayServers`. |
| `num` | `dynamic` | — | Value used by `for each value in state.displayServers if value==num then removed=true else result=result+[value] end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1303)

<a id="function-function-mq3-client-ui-main-missionpack-ui-report-function-ui-report-state-src-mq3-client-ui-main-missionpack-ml-1851559373"></a>
### UI_Report

```ml
function UI_Report(state)
```

Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `UI_Report`, returning its result for `state, "ui", "report", "UI_Report", "", [len(state.menus),len(state.assets)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.menus`, `state.assets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L550)

<a id="function-function-mq3-client-ui-main-missionpack-ui-runcinematicframe-function-ui-runcinematicframe-state-handle-src-mq3-client-ui-main-missionpack-ml-367210017"></a>
### UI_RunCinematicFrame

```ml
function UI_RunCinematicFrame(state, handle)
```

Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `UI_RunCinematicFrame`, returning its result for `state, "cinematic", "run", str(handle), "", []`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.emit`. |
| `handle` | `dynamic` | — | Argument 4 of `mq3.client.ui_main_missionpack.emit`; passed as `str(handle)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L845)

<a id="function-function-mq3-client-ui-main-missionpack-ui-runmenuscript-function-ui-runmenuscript-state-args-src-mq3-client-ui-main-missionpack-ml-1640586032"></a>
### UI_RunMenuScript

```ml
function UI_RunMenuScript(state, args)
```

Updates `state.nextDisplayRefresh`, `state.serverStatusLines`, `state.sortDir` during UI main missionpack `UI_RunMenuScript`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.nextDisplayRefresh`, `state.serverStatusLines`, `state.sortDir`. |
| `args` | `dynamic` | — | Sequence read at `args[0]`, `args[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1485)

<a id="function-function-mq3-client-ui-main-missionpack-ui-selectedhead-function-ui-selectedhead-state-index-actual-src-mq3-client-ui-main-missionpack-ml-100945249"></a>
### UI_SelectedHead

```ml
function UI_SelectedHead(state, index, actual)
```

Updates `actual[0]` during UI main missionpack `UI_SelectedHead`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.characters`. |
| `index` | `dynamic` | — | Value tested by `count==index` before the calculation continues. |
| `actual` | `dynamic` | — | Mutable sequence; this routine writes `actual[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1375)

<a id="function-function-mq3-client-ui-main-missionpack-ui-selectedmap-function-ui-selectedmap-state-index-actual-src-mq3-client-ui-main-missionpack-ml-998336833"></a>
### UI_SelectedMap

```ml
function UI_SelectedMap(state, index, actual)
```

Updates `actual[0]` during UI main missionpack `UI_SelectedMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.maps`. |
| `index` | `dynamic` | — | Value tested by `count==index` before the calculation continues. |
| `actual` | `dynamic` | — | Mutable sequence; this routine writes `actual[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1370)

<a id="function-function-mq3-client-ui-main-missionpack-ui-selectedplayer-handlekey-function-ui-selectedplayer-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1959046318"></a>
### UI_SelectedPlayer_HandleKey

```ml
function UI_SelectedPlayer_HandleKey(state, flags, special, key)
```

Updates `state.selectedPlayer` during UI main missionpack `UI_SelectedPlayer_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.selectedPlayer`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_SelectedPlayer_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_SelectedPlayer_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1254)

<a id="function-function-mq3-client-ui-main-missionpack-ui-serversqsortcompare-function-ui-serversqsortcompare-state-leftindex-rightindex-src-mq3-client-ui-main-missionpack-ml-1532123552"></a>
### UI_ServersQsortCompare

```ml
function UI_ServersQsortCompare(state, leftIndex, rightIndex)
```

Calls `mq3.client.ui_main_missionpack.compareText` from UI main missionpack `UI_ServersQsortCompare`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.servers`, `state.sortKey`, `state.sortDir`. |
| `leftIndex` | `dynamic` | — | Value used by `left=state.servers[leftIndex]`. |
| `rightIndex` | `dynamic` | — | Value used by `right=state.servers[rightIndex]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1277)

<a id="function-function-mq3-client-ui-main-missionpack-ui-serverssort-function-ui-serverssort-state-column-force-src-mq3-client-ui-main-missionpack-ml-1935582304"></a>
### UI_ServersSort

```ml
function UI_ServersSort(state, column, force)
```

Updates `state.sortKey`, `state.displayServers` during UI main missionpack `UI_ServersSort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.sortKey`, `state.displayServers`. |
| `column` | `dynamic` | — | Value assigned to `state.sortKey`. |
| `force` | `dynamic` | — | Value used by `if not force and state.sortKey==column then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1291)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-set-active-menu-const-ui-set-active-menu-7-src-mq3-client-ui-main-missionpack-ml-1551445588"></a>
### UI_SET_ACTIVE_MENU

```ml
const UI_SET_ACTIVE_MENU = 7
```

UI VM entry-point ordinal used to select the active UI menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L25)

<a id="function-function-mq3-client-ui-main-missionpack-ui-setcapfraglimits-function-ui-setcapfraglimits-state-uivars-src-mq3-client-ui-main-missionpack-ml-1930045233"></a>
### UI_SetCapFragLimits

```ml
function UI_SetCapFragLimits(state, uiVars)
```

Calls `mq3.client.ui_main_missionpack.cvarString`, `mq3.client.ui_main_missionpack.setCvar` from UI main missionpack `UI_SetCapFragLimits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentGameType`. |
| `uiVars` | `dynamic` | — | Value used by `if uiVars then setCvar(state,"ui_fragLimit",frag)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1460)

<a id="function-function-mq3-client-ui-main-missionpack-ui-setnextmap-function-ui-setnextmap-state-actual-index-src-mq3-client-ui-main-missionpack-ml-1327630597"></a>
### UI_SetNextMap

```ml
function UI_SetNextMap(state, actual, index)
```

Updates `state.currentMap` during UI main missionpack `UI_SetNextMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentMap`. |
| `actual` | `dynamic` | — | Value used by `for i=actual+1 to len(state.maps)-1 if state.maps[i].active then state.currentMap=i`. |
| `index` | `dynamic` | — | Value used by `emit(state,"menu","feeder-selection","skirmish","",[FEEDER_MAPS,index+1])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1445)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-anynonteamgame-const-ui-show-anynonteamgame-8-src-mq3-client-ui-main-missionpack-ml-634400895"></a>
### UI_SHOW_ANYNONTEAMGAME

```ml
const UI_SHOW_ANYNONTEAMGAME = 8
```

Owner-draw visibility flag requiring that the game mode has no teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L99)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-anyteamgame-const-ui-show-anyteamgame-16-src-mq3-client-ui-main-missionpack-ml-838463786"></a>
### UI_SHOW_ANYTEAMGAME

```ml
const UI_SHOW_ANYTEAMGAME = 16
```

Owner-draw visibility flag requiring that the game mode uses teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L101)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-demoavailable-const-ui-show-demoavailable-64-src-mq3-client-ui-main-missionpack-ml-1076956139"></a>
### UI_SHOW_DEMOAVAILABLE

```ml
const UI_SHOW_DEMOAVAILABLE = 64
```

Owner-draw visibility flag requiring that a recorded demo is available for the selected content.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L105)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-favoriteservers-const-ui-show-favoriteservers-4-src-mq3-client-ui-main-missionpack-ml-349082631"></a>
### UI_SHOW_FAVORITESERVERS

```ml
const UI_SHOW_FAVORITESERVERS = 4
```

Owner-draw visibility flag requiring that the server browser displays the favorites source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L97)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-ffa-const-ui-show-ffa-256-src-mq3-client-ui-main-missionpack-ml-490245858"></a>
### UI_SHOW_FFA

```ml
const UI_SHOW_FFA = 256
```

Owner-draw visibility flag requiring that the selected game mode is free-for-all.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L109)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-leader-const-ui-show-leader-1-src-mq3-client-ui-main-missionpack-ml-309339078"></a>
### UI_SHOW_LEADER

```ml
const UI_SHOW_LEADER = 1
```

Owner-draw visibility flag requiring that the local player is the team leader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L93)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-netanynonteamgame-const-ui-show-netanynonteamgame-1024-src-mq3-client-ui-main-missionpack-ml-1443443582"></a>
### UI_SHOW_NETANYNONTEAMGAME

```ml
const UI_SHOW_NETANYNONTEAMGAME = 1024
```

Owner-draw visibility flag requiring that the selected network game mode has no teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L113)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-netanyteamgame-const-ui-show-netanyteamgame-2048-src-mq3-client-ui-main-missionpack-ml-944047799"></a>
### UI_SHOW_NETANYTEAMGAME

```ml
const UI_SHOW_NETANYTEAMGAME = 2048
```

Owner-draw visibility flag requiring that the selected network game mode uses teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L115)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-newbesttime-const-ui-show-newbesttime-128-src-mq3-client-ui-main-missionpack-ml-322679862"></a>
### UI_SHOW_NEWBESTTIME

```ml
const UI_SHOW_NEWBESTTIME = 128
```

Owner-draw visibility flag requiring that the latest result established a new best completion time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L107)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-newhighscore-const-ui-show-newhighscore-32-src-mq3-client-ui-main-missionpack-ml-692671792"></a>
### UI_SHOW_NEWHIGHSCORE

```ml
const UI_SHOW_NEWHIGHSCORE = 32
```

Owner-draw visibility flag requiring that the latest result established a new high score.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L103)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-notfavoriteservers-const-ui-show-notfavoriteservers-4096-src-mq3-client-ui-main-missionpack-ml-813127260"></a>
### UI_SHOW_NOTFAVORITESERVERS

```ml
const UI_SHOW_NOTFAVORITESERVERS = 4096
```

Owner-draw visibility flag requiring that the server browser is not displaying favorites.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L117)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-notffa-const-ui-show-notffa-512-src-mq3-client-ui-main-missionpack-ml-1961713443"></a>
### UI_SHOW_NOTFFA

```ml
const UI_SHOW_NOTFFA = 512
```

Owner-draw visibility flag requiring that the selected game mode is not free-for-all.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L111)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-notleader-const-ui-show-notleader-2-src-mq3-client-ui-main-missionpack-ml-1708065405"></a>
### UI_SHOW_NOTLEADER

```ml
const UI_SHOW_NOTLEADER = 2
```

Owner-draw visibility flag requiring that the local player is not the team leader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L95)

<a id="function-function-mq3-client-ui-main-missionpack-ui-showpostgame-function-ui-showpostgame-state-newhigh-src-mq3-client-ui-main-missionpack-ml-701477161"></a>
### UI_ShowPostGame

```ml
function UI_ShowPostGame(state, newHigh)
```

Calls `mq3.client.ui_main_missionpack.setCvar`, `mq3.client.ui_main_missionpack.emit` from UI main missionpack `UI_ShowPostGame`. The final path returns `emit(state,"menu","activate","endofgame","",[newHigh])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_ShowPostGame`. |
| `newHigh` | `dynamic` | — | Value used by `return emit(state,"menu","activate","endofgame","",[newHigh])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L675)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-shutdown-const-ui-shutdown-2-src-mq3-client-ui-main-missionpack-ml-2072510669"></a>
### UI_SHUTDOWN

```ml
const UI_SHUTDOWN = 2
```

UI VM entry-point ordinal used to shut down the UI VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L15)

<a id="function-function-mq3-client-ui-main-missionpack-ui-skill-handlekey-function-ui-skill-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1839753612"></a>
### UI_Skill_HandleKey

```ml
function UI_Skill_HandleKey(state, flags, special, key)
```

Updates `state.currentBotSkill` during UI main missionpack `UI_Skill_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentBotSkill`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_Skill_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_Skill_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1191)

<a id="function-function-mq3-client-ui-main-missionpack-ui-sortserverstatusinfo-function-ui-sortserverstatusinfo-state-rows-src-mq3-client-ui-main-missionpack-ml-1657732088"></a>
### UI_SortServerStatusInfo

```ml
function UI_SortServerStatusInfo(state, rows)
```

Updates `state.serverStatusLines` during UI main missionpack `UI_SortServerStatusInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.serverStatusLines`. |
| `rows` | `dynamic` | — | Value used by `for each row in rows if len(row)>=2 and (row[0]=="Address" or row[0]=="Name" or row[0]=="Game name" or row[0]=="Game type") then keys=keys+[ro...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1329)

<a id="function-function-mq3-client-ui-main-missionpack-ui-startserverrefresh-function-ui-startserverrefresh-state-full-src-mq3-client-ui-main-missionpack-ml-515756898"></a>
### UI_StartServerRefresh

```ml
function UI_StartServerRefresh(state, full)
```

Updates `state.serverRefreshDate`, `state.refreshActive`, `state.nextDisplayRefresh`, `state.displayServers` and additional values during UI main missionpack `UI_StartServerRefresh`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.serverRefreshDate`, `state.refreshActive`, `state.nextDisplayRefresh`, `state.displayServers` and additional values. |
| `full` | `dynamic` | — | Value used by `if not full then UI_UpdatePendingPings(state)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1688)

<a id="function-function-mq3-client-ui-main-missionpack-ui-startsingleplayer-function-ui-startsingleplayer-state-src-mq3-client-ui-main-missionpack-ml-2054772727"></a>
### UI_StartSinglePlayer

```ml
function UI_StartSinglePlayer(state)
```

Adapts `mq3.client.ui_main_missionpack.UI_StartSkirmish` to UI main missionpack `UI_StartSinglePlayer`, returning its result for `state, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.UI_StartSkirmish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1448)

<a id="function-function-mq3-client-ui-main-missionpack-ui-startskirmish-function-ui-startskirmish-state-next-src-mq3-client-ui-main-missionpack-ml-1638885932"></a>
### UI_StartSkirmish

```ml
function UI_StartSkirmish(state, next)
```

Updates `state.currentMap` during UI main missionpack `UI_StartSkirmish`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentMap`. |
| `next` | `dynamic` | — | Value used by `if next then actual=state.currentMap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1452)

<a id="function-function-mq3-client-ui-main-missionpack-ui-stopcinematic-function-ui-stopcinematic-state-handle-src-mq3-client-ui-main-missionpack-ml-444414781"></a>
### UI_StopCinematic

```ml
function UI_StopCinematic(state, handle)
```

Adapts `mq3.client.ui_main_missionpack.emit` to UI main missionpack `UI_StopCinematic`, returning its result for `state, "cinematic", "stop", str(handle), "", []`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.ui_main_missionpack.emit`. |
| `handle` | `dynamic` | — | Argument 4 of `mq3.client.ui_main_missionpack.emit`; passed as `str(handle)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L833)

<a id="function-function-mq3-client-ui-main-missionpack-ui-stopserverrefresh-function-ui-stopserverrefresh-state-src-mq3-client-ui-main-missionpack-ml-1114250911"></a>
### UI_StopServerRefresh

```ml
function UI_StopServerRefresh(state)
```

Updates `state.refreshActive` during UI main missionpack `UI_StopServerRefresh`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.refreshActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1674)

<a id="function-function-mq3-client-ui-main-missionpack-ui-teamindexfromname-function-ui-teamindexfromname-state-name-src-mq3-client-ui-main-missionpack-ml-2033319594"></a>
### UI_TeamIndexFromName

```ml
function UI_TeamIndexFromName(state, name)
```

Calls `std.string.toLowerAscii` from UI main missionpack `UI_TeamIndexFromName`. The final path returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.teams`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI main missionpack resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L752)

<a id="function-function-mq3-client-ui-main-missionpack-ui-teammember-handlekey-function-ui-teammember-handlekey-state-flags-special-key-blue-num-src-mq3-client-ui-main-missionpack-ml-1592249050"></a>
### UI_TeamMember_HandleKey

```ml
function UI_TeamMember_HandleKey(state, flags, special, key, blue, num)
```

Calls `mq3.compat.numeric.trunc32`, `mq3.client.ui_main_missionpack.cvarValue`, `mq3.client.ui_main_missionpack.cycle` and additional helpers from UI main missionpack `UI_TeamMember_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared UI main missionpack state passed to the helper calls in `UI_TeamMember_HandleKey`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_TeamMember_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_TeamMember_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |
| `blue` | `dynamic` | — | Blue color component. |
| `num` | `dynamic` | — | Value used by `value=n.trunc32(cvarValue(state,prefix+str(num)))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1206)

<a id="function-function-mq3-client-ui-main-missionpack-ui-teamname-handlekey-function-ui-teamname-handlekey-state-flags-special-key-blue-src-mq3-client-ui-main-missionpack-ml-1424767766"></a>
### UI_TeamName_HandleKey

```ml
function UI_TeamName_HandleKey(state, flags, special, key, blue)
```

Updates `state.currentOpponent`, `state.currentTeam` during UI main missionpack `UI_TeamName_HandleKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.currentOpponent`, `state.currentTeam`. |
| `flags` | `dynamic` | — | Accepted for compatibility with `UI_TeamName_HandleKey`; the current implementation does not read it. |
| `special` | `dynamic` | — | Accepted for compatibility with `UI_TeamName_HandleKey`; the current implementation does not read it. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI main missionpack entry. |
| `blue` | `dynamic` | — | Blue color component. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1198)

<a id="function-function-mq3-client-ui-main-missionpack-ui-update-function-ui-update-state-name-src-mq3-client-ui-main-missionpack-ml-557858110"></a>
### UI_Update

```ml
function UI_Update(state, name)
```

Calls `std.string.toLowerAscii`, `mq3.client.ui_main_missionpack.setCvar`, `mq3.client.ui_main_missionpack.cvarString` and additional helpers from UI main missionpack `UI_Update`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.currentCrosshair`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI main missionpack resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1471)

<a id="function-function-mq3-client-ui-main-missionpack-ui-updatecvars-function-ui-updatecvars-state-src-mq3-client-ui-main-missionpack-ml-1531427059"></a>
### UI_UpdateCvars

```ml
function UI_UpdateCvars(state)
```

Calls `mq3.client.ui_main_missionpack.emit` from UI main missionpack `UI_UpdateCvars`. The final path returns `len(state.cvars)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1709)

<a id="function-function-mq3-client-ui-main-missionpack-ui-updatependingpings-function-ui-updatependingpings-state-src-mq3-client-ui-main-missionpack-ml-1492122227"></a>
### UI_UpdatePendingPings

```ml
function UI_UpdatePendingPings(state)
```

Updates `state.refreshActive`, `state.refreshTime` during UI main missionpack `UI_UpdatePendingPings`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable UI main missionpack record/storage; this routine assigns `state.refreshActive`, `state.refreshTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1382)

<a id="function-function-mq3-client-ui-main-missionpack-visiblecolor-function-visiblecolor-text-index-src-mq3-client-ui-main-missionpack-ml-265275091"></a>
### visibleColor

```ml
function visibleColor(text, index)
```

Evaluates UI main missionpack `visibleColor` and returns `index+1<len(data) and data[index]==94 and data[index+1]!=94` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `visibleColor` in the UI main missionpack path. |
| `index` | `dynamic` | — | Value used by `return index+1<len(data) and data[index]==94 and data[index+1]!=94`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L518)

<a id="function-function-mq3-client-ui-main-missionpack-vmmain-function-vmmain-state-command-args-src-mq3-client-ui-main-missionpack-ml-892942303"></a>
### vmMain

```ml
function vmMain(state, command, args)
```

Calls `mq3.client.ui_main_missionpack.DispatchResult`, `mq3.client.ui_main_missionpack._UI_Init`, `mq3.client.ui_main_missionpack._UI_Shutdown` and additional helpers from UI main missionpack `vmMain`. The final path returns `DispatchResult(-1,void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.actions`. |
| `command` | `dynamic` | — | Value used by `if command==UI_GETAPIVERSION then return DispatchResult(UI_API_VERSION,void)`. |
| `args` | `dynamic` | — | Sequence read at `args[0]`, `args[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_main_missionpack.ml#L1754)
