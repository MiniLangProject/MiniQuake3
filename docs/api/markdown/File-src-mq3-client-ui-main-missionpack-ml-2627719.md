# `src/mq3/client/ui_main_missionpack.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_main_missionpack`](Package-mq3-client-ui-main-missionpack-204777885.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawrect-function-ui-drawrect-state-x-y-width-height-size-color-src-mq3-client-ui-main-missionpack-ml-394696745"></a>
### _UI_DrawRect

```ml
function _UI_DrawRect(state, x, y, width, height, size, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L147)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawsides-function-ui-drawsides-state-x-y-w-h-size-src-mq3-client-ui-main-missionpack-ml-1096284680"></a>
### _UI_DrawSides

```ml
function _UI_DrawSides(state, x, y, w, h, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L145)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawtopbottom-function-ui-drawtopbottom-state-x-y-w-h-size-src-mq3-client-ui-main-missionpack-ml-2040813440"></a>
### _UI_DrawTopBottom

```ml
function _UI_DrawTopBottom(state, x, y, w, h, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L146)

<a id="function-function-mq3-client-ui-main-missionpack-ui-init-function-ui-init-state-ingameload-files-src-mq3-client-ui-main-missionpack-ml-882861563"></a>
### _UI_Init

```ml
function _UI_Init(state, inGameLoad, files)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `inGameLoad` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L559)

<a id="function-function-mq3-client-ui-main-missionpack-ui-isfullscreen-function-ui-isfullscreen-state-src-mq3-client-ui-main-missionpack-ml-1958527099"></a>
### _UI_IsFullscreen

```ml
function _UI_IsFullscreen(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L570)

<a id="function-function-mq3-client-ui-main-missionpack-ui-keyevent-function-ui-keyevent-state-key-down-src-mq3-client-ui-main-missionpack-ml-385682174"></a>
### _UI_KeyEvent

```ml
function _UI_KeyEvent(state, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L563)

<a id="function-function-mq3-client-ui-main-missionpack-ui-mouseevent-function-ui-mouseevent-state-dx-dy-src-mq3-client-ui-main-missionpack-ml-1461648234"></a>
### _UI_MouseEvent

```ml
function _UI_MouseEvent(state, dx, dy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L564)

<a id="function-function-mq3-client-ui-main-missionpack-ui-refresh-function-ui-refresh-state-realtime-src-mq3-client-ui-main-missionpack-ml-1224202626"></a>
### _UI_Refresh

```ml
function _UI_Refresh(state, realtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L565)

<a id="function-function-mq3-client-ui-main-missionpack-ui-setactivemenu-function-ui-setactivemenu-state-menu-src-mq3-client-ui-main-missionpack-ml-586292668"></a>
### _UI_SetActiveMenu

```ml
function _UI_SetActiveMenu(state, menu)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `menu` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L566)

<a id="function-function-mq3-client-ui-main-missionpack-ui-shutdown-function-ui-shutdown-state-src-mq3-client-ui-main-missionpack-ml-1410658383"></a>
### _UI_Shutdown

```ml
function _UI_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L562)

- [mq3.client.ui_main_missionpack.Action](Type-mq3-client-ui-main-missionpack-action-1405167819.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-alias-parse-function-alias-parse-state-tokens-start-src-mq3-client-ui-main-missionpack-ml-463988625"></a>
### Alias_Parse

```ml
function Alias_Parse(state, tokens, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L482)

- [mq3.client.ui_main_missionpack.AliasInfo](Type-mq3-client-ui-main-missionpack-aliasinfo-764484831.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-arenaservers-maxping-function-arenaservers-maxping-state-src-mq3-client-ui-main-missionpack-ml-72279883"></a>
### ArenaServers_MaxPing

```ml
function ArenaServers_MaxPing(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L537)

<a id="constant-constant-mq3-client-ui-main-missionpack-as-favorites-const-as-favorites-3-src-mq3-client-ui-main-missionpack-ml-2047987824"></a>
### AS_FAVORITES

```ml
const AS_FAVORITES = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L34)

<a id="constant-constant-mq3-client-ui-main-missionpack-as-global-const-as-global-2-src-mq3-client-ui-main-missionpack-ml-1457839325"></a>
### AS_GLOBAL

```ml
const AS_GLOBAL = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L33)

<a id="constant-constant-mq3-client-ui-main-missionpack-as-local-const-as-local-0-src-mq3-client-ui-main-missionpack-ml-8376953"></a>
### AS_LOCAL

```ml
const AS_LOCAL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L31)

<a id="constant-constant-mq3-client-ui-main-missionpack-as-mplayer-const-as-mplayer-1-src-mq3-client-ui-main-missionpack-ml-1586665464"></a>
### AS_MPLAYER

```ml
const AS_MPLAYER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L32)

<a id="function-function-mq3-client-ui-main-missionpack-asset-parse-function-asset-parse-state-tokens-start-src-mq3-client-ui-main-missionpack-ml-1618351233"></a>
### Asset_Parse

```ml
function Asset_Parse(state, tokens, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L112)

<a id="function-function-mq3-client-ui-main-missionpack-assetcache-function-assetcache-state-src-mq3-client-ui-main-missionpack-ml-598332831"></a>
### AssetCache

```ml
function AssetCache(state)
```

AssetCache / Asset_Parse

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L108)

<a id="function-function-mq3-client-ui-main-missionpack-character-parse-function-character-parse-state-tokens-start-src-mq3-client-ui-main-missionpack-ml-271192055"></a>
### Character_Parse

```ml
function Character_Parse(state, tokens, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L478)

<a id="function-function-mq3-client-ui-main-missionpack-characterinfo-function-characterinfo-name-base-image-src-mq3-client-ui-main-missionpack-ml-1150272191"></a>
### characterInfo

```ml
function characterInfo(name, base, image)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `image` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L84)

- [mq3.client.ui_main_missionpack.CharacterInfo](Type-mq3-client-ui-main-missionpack-characterinfo-59659872.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-clamp-function-clamp-value-minimum-maximum-src-mq3-client-ui-main-missionpack-ml-131076515"></a>
### clamp

```ml
function clamp(value, minimum, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `minimum` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L100)

<a id="function-function-mq3-client-ui-main-missionpack-comparetext-function-comparetext-left-right-src-mq3-client-ui-main-missionpack-ml-1003646047"></a>
### compareText

```ml
function compareText(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L312)

<a id="function-function-mq3-client-ui-main-missionpack-consolecommand-function-consolecommand-state-realtime-command-src-mq3-client-ui-main-missionpack-ml-1943036593"></a>
### consoleCommand

```ml
function consoleCommand(state, realtime, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L571)

<a id="function-function-mq3-client-ui-main-missionpack-containsvalue-function-containsvalue-values-wanted-src-mq3-client-ui-main-missionpack-ml-1362641725"></a>
### containsValue

```ml
function containsValue(values, wanted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `wanted` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L105)

<a id="function-function-mq3-client-ui-main-missionpack-create-function-create-retailactive-src-mq3-client-ui-main-missionpack-ml-90513325"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L86)

<a id="function-function-mq3-client-ui-main-missionpack-currentmap-function-currentmap-state-src-mq3-client-ui-main-missionpack-ml-1524989755"></a>
### currentMap

```ml
function currentMap(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L175)

<a id="function-function-mq3-client-ui-main-missionpack-cvarindex-function-cvarindex-state-name-src-mq3-client-ui-main-missionpack-ml-1590189250"></a>
### cvarIndex

```ml
function cvarIndex(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L96)

<a id="function-function-mq3-client-ui-main-missionpack-cvarstring-function-cvarstring-state-name-src-mq3-client-ui-main-missionpack-ml-889077590"></a>
### cvarString

```ml
function cvarString(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L97)

<a id="function-function-mq3-client-ui-main-missionpack-cvarvalue-function-cvarvalue-state-name-src-mq3-client-ui-main-missionpack-ml-2146989256"></a>
### cvarValue

```ml
function cvarValue(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L98)

<a id="function-function-mq3-client-ui-main-missionpack-cycle-function-cycle-value-count-key-src-mq3-client-ui-main-missionpack-ml-543074461"></a>
### cycle

```ml
function cycle(value, count, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L103)

<a id="function-function-mq3-client-ui-main-missionpack-defaultcvars-function-defaultcvars-src-mq3-client-ui-main-missionpack-ml-551487662"></a>
### defaultCvars

```ml
function defaultCvars()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L547)

<a id="function-function-mq3-client-ui-main-missionpack-direction-function-direction-key-src-mq3-client-ui-main-missionpack-ml-585294091"></a>
### direction

```ml
function direction(key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L102)

- [mq3.client.ui_main_missionpack.DispatchResult](Type-mq3-client-ui-main-missionpack-dispatchresult-989009638.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-draw-function-draw-state-name-rect-text-values-src-mq3-client-ui-main-missionpack-ml-1612523775"></a>
### draw

```ml
function draw(state, name, rect, text, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L160)

<a id="function-function-mq3-client-ui-main-missionpack-emit-function-emit-state-boundary-kind-name-text-values-src-mq3-client-ui-main-missionpack-ml-499488985"></a>
### emit

```ml
function emit(state, boundary, kind, name, text, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L92)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-allmaps-const-feeder-allmaps-4-src-mq3-client-ui-main-missionpack-ml-98701557"></a>
### FEEDER_ALLMAPS

```ml
const FEEDER_ALLMAPS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L38)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-cinematics-const-feeder-cinematics-15-src-mq3-client-ui-main-missionpack-ml-998732703"></a>
### FEEDER_CINEMATICS

```ml
const FEEDER_CINEMATICS = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L46)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-demos-const-feeder-demos-10-src-mq3-client-ui-main-missionpack-ml-76554794"></a>
### FEEDER_DEMOS

```ml
const FEEDER_DEMOS = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L42)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-findplayer-const-feeder-findplayer-14-src-mq3-client-ui-main-missionpack-ml-351268964"></a>
### FEEDER_FINDPLAYER

```ml
const FEEDER_FINDPLAYER = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L45)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-heads-const-feeder-heads-0-src-mq3-client-ui-main-missionpack-ml-2141826203"></a>
### FEEDER_HEADS

```ml
const FEEDER_HEADS = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L35)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-maps-const-feeder-maps-1-src-mq3-client-ui-main-missionpack-ml-792557944"></a>
### FEEDER_MAPS

```ml
const FEEDER_MAPS = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L36)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-mods-const-feeder-mods-9-src-mq3-client-ui-main-missionpack-ml-2032100472"></a>
### FEEDER_MODS

```ml
const FEEDER_MODS = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L41)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-player-list-const-feeder-player-list-7-src-mq3-client-ui-main-missionpack-ml-398381712"></a>
### FEEDER_PLAYER_LIST

```ml
const FEEDER_PLAYER_LIST = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L39)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-q3heads-const-feeder-q3heads-12-src-mq3-client-ui-main-missionpack-ml-1932127166"></a>
### FEEDER_Q3HEADS

```ml
const FEEDER_Q3HEADS = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L43)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-servers-const-feeder-servers-2-src-mq3-client-ui-main-missionpack-ml-644963135"></a>
### FEEDER_SERVERS

```ml
const FEEDER_SERVERS = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L37)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-serverstatus-const-feeder-serverstatus-13-src-mq3-client-ui-main-missionpack-ml-506311553"></a>
### FEEDER_SERVERSTATUS

```ml
const FEEDER_SERVERSTATUS = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L44)

<a id="constant-constant-mq3-client-ui-main-missionpack-feeder-team-list-const-feeder-team-list-8-src-mq3-client-ui-main-missionpack-ml-1149718953"></a>
### FEEDER_TEAM_LIST

```ml
const FEEDER_TEAM_LIST = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L40)

<a id="function-function-mq3-client-ui-main-missionpack-font-report-function-font-report-state-src-mq3-client-ui-main-missionpack-ml-1636136543"></a>
### Font_Report

```ml
function Font_Report(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L123)

<a id="function-function-mq3-client-ui-main-missionpack-gametype-parse-function-gametype-parse-state-tokens-start-join-src-mq3-client-ui-main-missionpack-ml-979721045"></a>
### GameType_Parse

```ml
function GameType_Parse(state, tokens, start, join)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `join` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L486)

<a id="function-function-mq3-client-ui-main-missionpack-getmenubuffer-function-getmenubuffer-state-filename-files-src-mq3-client-ui-main-missionpack-ml-373974073"></a>
### GetMenuBuffer

```ml
function GetMenuBuffer(state, filename, files)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L151)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-1fctf-const-gt-1fctf-5-src-mq3-client-ui-main-missionpack-ml-1926092530"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L28)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-ctf-const-gt-ctf-4-src-mq3-client-ui-main-missionpack-ml-1348130815"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L27)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-ffa-const-gt-ffa-0-src-mq3-client-ui-main-missionpack-ml-1057005019"></a>
### GT_FFA

```ml
const GT_FFA = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L23)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-harvester-const-gt-harvester-7-src-mq3-client-ui-main-missionpack-ml-723233872"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L30)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-obelisk-const-gt-obelisk-6-src-mq3-client-ui-main-missionpack-ml-920826693"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L29)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-single-player-const-gt-single-player-2-src-mq3-client-ui-main-missionpack-ml-2001927291"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L25)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-team-const-gt-team-3-src-mq3-client-ui-main-missionpack-ml-100041170"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L26)

<a id="constant-constant-mq3-client-ui-main-missionpack-gt-tournament-const-gt-tournament-1-src-mq3-client-ui-main-missionpack-ml-34497968"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L24)

<a id="constant-constant-mq3-client-ui-main-missionpack-k-mouse1-const-k-mouse1-178-src-mq3-client-ui-main-missionpack-ml-568086145"></a>
### K_MOUSE1

```ml
const K_MOUSE1 = 178
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L47)

<a id="constant-constant-mq3-client-ui-main-missionpack-k-mouse2-const-k-mouse2-179-src-mq3-client-ui-main-missionpack-ml-1889243632"></a>
### K_MOUSE2

```ml
const K_MOUSE2 = 179
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L48)

<a id="function-function-mq3-client-ui-main-missionpack-leftkey-function-leftkey-key-src-mq3-client-ui-main-missionpack-ml-619115961"></a>
### leftKey

```ml
function leftKey(key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L101)

<a id="function-function-mq3-client-ui-main-missionpack-load-menu-function-load-menu-state-tokens-start-files-src-mq3-client-ui-main-missionpack-ml-494904032"></a>
### Load_Menu

```ml
function Load_Menu(state, tokens, start, files)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L153)

<a id="function-function-mq3-client-ui-main-missionpack-mapinfo-function-mapinfo-loadname-name-typebits-src-mq3-client-ui-main-missionpack-ml-608070002"></a>
### mapInfo

```ml
function mapInfo(loadName, name, typeBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loadName` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `typeBits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L82)

- [mq3.client.ui_main_missionpack.MapInfo](Type-mq3-client-ui-main-missionpack-mapinfo-1197732229.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-maplist-parse-function-maplist-parse-state-tokens-start-src-mq3-client-ui-main-missionpack-ml-234503017"></a>
### MapList_Parse

```ml
function MapList_Parse(state, tokens, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L490)

- [mq3.client.ui_main_missionpack.ModInfo](Type-mq3-client-ui-main-missionpack-modinfo-1333120515.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-parseopen-function-parseopen-tokens-start-src-mq3-client-ui-main-missionpack-ml-339835356"></a>
### parseOpen

```ml
function parseOpen(tokens, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tokens` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L471)

- [mq3.client.ui_main_missionpack.ParseResult](Type-mq3-client-ui-main-missionpack-parseresult-1086330969.md) — struct
- [mq3.client.ui_main_missionpack.Rect](Type-mq3-client-ui-main-missionpack-rect-1968236747.md) — struct
<a id="constant-constant-mq3-client-ui-main-missionpack-say-all-const-say-all-0-src-mq3-client-ui-main-missionpack-ml-968481251"></a>
### SAY_ALL

```ml
const SAY_ALL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L22)

<a id="function-function-mq3-client-ui-main-missionpack-serverinfo-function-serverinfo-address-hostname-mapname-clients-maxclients-gametype-ping-src-mq3-client-ui-main-missionpack-ml-582818694"></a>
### serverInfo

```ml
function serverInfo(address, hostname, mapname, clients, maxClients, gametype, ping)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |
| `hostname` | `dynamic` | — |  |
| `mapname` | `dynamic` | — |  |
| `clients` | `dynamic` | — |  |
| `maxClients` | `dynamic` | — |  |
| `gametype` | `dynamic` | — |  |
| `ping` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L85)

- [mq3.client.ui_main_missionpack.ServerInfo](Type-mq3-client-ui-main-missionpack-serverinfo-947320430.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-serverpasses-function-serverpasses-state-server-src-mq3-client-ui-main-missionpack-ml-2046783654"></a>
### serverPasses

```ml
function serverPasses(state, server)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `server` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L330)

<a id="function-function-mq3-client-ui-main-missionpack-setcvar-function-setcvar-state-name-value-src-mq3-client-ui-main-missionpack-ml-1723900667"></a>
### setCvar

```ml
function setCvar(state, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L99)

<a id="function-function-mq3-client-ui-main-missionpack-signedquotient-function-signedquotient-value-divisor-src-mq3-client-ui-main-missionpack-ml-673246621"></a>
### signedQuotient

```ml
function signedQuotient(value, divisor)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `divisor` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L523)

- [mq3.client.ui_main_missionpack.State](Type-mq3-client-ui-main-missionpack-state-1212712554.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-stripextension-function-stripextension-name-extension-src-mq3-client-ui-main-missionpack-ml-1198069508"></a>
### stripExtension

```ml
function stripExtension(name, extension)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `extension` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L388)

<a id="function-function-mq3-client-ui-main-missionpack-stristr-function-stristr-text-needle-src-mq3-client-ui-main-missionpack-ml-250178360"></a>
### stristr

```ml
function stristr(text, needle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `needle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L349)

<a id="function-function-mq3-client-ui-main-missionpack-team-parse-function-team-parse-state-tokens-start-src-mq3-client-ui-main-missionpack-ml-782147113"></a>
### Team_Parse

```ml
function Team_Parse(state, tokens, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `tokens` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L472)

<a id="function-function-mq3-client-ui-main-missionpack-teamat-function-teamat-state-index-src-mq3-client-ui-main-missionpack-ml-492018963"></a>
### teamAt

```ml
function teamAt(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L167)

<a id="function-function-mq3-client-ui-main-missionpack-teaminfo-function-teaminfo-name-image-members-src-mq3-client-ui-main-missionpack-ml-444289507"></a>
### teamInfo

```ml
function teamInfo(name, image, members)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `image` | `dynamic` | — |  |
| `members` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L83)

- [mq3.client.ui_main_missionpack.TeamInfo](Type-mq3-client-ui-main-missionpack-teaminfo-101083716.md) — struct
<a id="function-function-mq3-client-ui-main-missionpack-text-height-function-text-height-state-text-scale-limit-src-mq3-client-ui-main-missionpack-ml-1527810299"></a>
### Text_Height

```ml
function Text_Height(state, text, scale, limit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L133)

<a id="function-function-mq3-client-ui-main-missionpack-text-paint-function-text-paint-state-x-y-scale-color-text-adjust-limit-style-src-mq3-client-ui-main-missionpack-ml-242222045"></a>
### Text_Paint

```ml
function Text_Paint(state, x, y, scale, color, text, adjust, limit, style)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `adjust` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L135)

<a id="function-function-mq3-client-ui-main-missionpack-text-paint-limit-function-text-paint-limit-state-maxx-x-y-scale-color-text-adjust-limit-src-mq3-client-ui-main-missionpack-ml-783686730"></a>
### Text_Paint_Limit

```ml
function Text_Paint_Limit(state, maxX, x, y, scale, color, text, adjust, limit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `maxX` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `adjust` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L137)

<a id="function-function-mq3-client-ui-main-missionpack-text-paintcenter-function-text-paintcenter-state-x-y-scale-color-text-adjust-src-mq3-client-ui-main-missionpack-ml-316728373"></a>
### Text_PaintCenter

```ml
function Text_PaintCenter(state, x, y, scale, color, text, adjust)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `adjust` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L138)

<a id="function-function-mq3-client-ui-main-missionpack-text-paintcenter-autowrapped-function-text-paintcenter-autowrapped-state-x-y-xmax-ystep-scale-color-text-adjust-src-mq3-client-ui-main-missionpack-ml-1141285138"></a>
### Text_PaintCenter_AutoWrapped

```ml
function Text_PaintCenter_AutoWrapped(state, x, y, xmax, ystep, scale, color, text, adjust)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `xmax` | `dynamic` | — |  |
| `ystep` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `adjust` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L139)

<a id="function-function-mq3-client-ui-main-missionpack-text-paintchar-function-text-paintchar-state-x-y-width-height-scale-s-t-s2-t2-hshader-src-mq3-client-ui-main-missionpack-ml-393700724"></a>
### Text_PaintChar

```ml
function Text_PaintChar(state, x, y, width, height, scale, s, t, s2, t2, hShader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `s` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `hShader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L134)

<a id="function-function-mq3-client-ui-main-missionpack-text-paintwithcursor-function-text-paintwithcursor-state-x-y-scale-color-text-cursorpos-cursor-limit-style-src-mq3-client-ui-main-missionpack-ml-524350316"></a>
### Text_PaintWithCursor

```ml
function Text_PaintWithCursor(state, x, y, scale, color, text, cursorPos, cursor, limit, style)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `cursorPos` | `dynamic` | — |  |
| `cursor` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L136)

<a id="function-function-mq3-client-ui-main-missionpack-text-width-function-text-width-state-text-scale-limit-src-mq3-client-ui-main-missionpack-ml-1913106885"></a>
### Text_Width

```ml
function Text_Width(state, text, scale, limit)
```

Text_Width / Text_Height / paint paths preserve color escapes and limits.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L127)

<a id="function-function-mq3-client-ui-main-missionpack-tokenize-function-tokenize-text-src-mq3-client-ui-main-missionpack-ml-684690431"></a>
### tokenize

```ml
function tokenize(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L497)

<a id="function-function-mq3-client-ui-main-missionpack-twodigits-function-twodigits-value-src-mq3-client-ui-main-missionpack-ml-2035712083"></a>
### twoDigits

```ml
function twoDigits(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L522)

<a id="function-function-mq3-client-ui-main-missionpack-ui-aifromname-function-ui-aifromname-state-name-src-mq3-client-ui-main-missionpack-ml-1085760294"></a>
### UI_AIFromName

```ml
function UI_AIFromName(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L193)

<a id="function-function-mq3-client-ui-main-missionpack-ui-aiindex-function-ui-aiindex-state-name-src-mq3-client-ui-main-missionpack-ml-1029228494"></a>
### UI_AIIndex

```ml
function UI_AIIndex(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L194)

<a id="function-function-mq3-client-ui-main-missionpack-ui-aiindexfromname-function-ui-aiindexfromname-state-name-src-mq3-client-ui-main-missionpack-ml-1292969086"></a>
### UI_AIIndexFromName

```ml
function UI_AIIndexFromName(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L195)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-api-version-const-ui-api-version-6-src-mq3-client-ui-main-missionpack-ml-965652039"></a>
### UI_API_VERSION

```ml
const UI_API_VERSION = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L21)

<a id="function-function-mq3-client-ui-main-missionpack-ui-binaryserverinsertion-function-ui-binaryserverinsertion-state-num-src-mq3-client-ui-main-missionpack-ml-1217686379"></a>
### UI_BinaryServerInsertion

```ml
function UI_BinaryServerInsertion(state, num)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L329)

<a id="function-function-mq3-client-ui-main-missionpack-ui-botname-handlekey-function-ui-botname-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-230592012"></a>
### UI_BotName_HandleKey

```ml
function UI_BotName_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L302)

<a id="function-function-mq3-client-ui-main-missionpack-ui-botskill-handlekey-function-ui-botskill-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-460365910"></a>
### UI_BotSkill_HandleKey

```ml
function UI_BotSkill_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L303)

<a id="function-function-mq3-client-ui-main-missionpack-ui-buildfindplayerlist-function-ui-buildfindplayerlist-state-force-src-mq3-client-ui-main-missionpack-ml-591475622"></a>
### UI_BuildFindPlayerList

```ml
function UI_BuildFindPlayerList(state, force)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `force` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L350)

<a id="function-function-mq3-client-ui-main-missionpack-ui-buildplayerlist-function-ui-buildplayerlist-state-names-teams-ownteam-src-mq3-client-ui-main-missionpack-ml-1041246530"></a>
### UI_BuildPlayerList

```ml
function UI_BuildPlayerList(state, names, teams, ownTeam)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `names` | `dynamic` | — |  |
| `teams` | `dynamic` | — |  |
| `ownTeam` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L213)

<a id="function-function-mq3-client-ui-main-missionpack-ui-buildq3model-list-function-ui-buildq3model-list-state-icons-src-mq3-client-ui-main-missionpack-ml-796526869"></a>
### UI_BuildQ3Model_List

```ml
function UI_BuildQ3Model_List(state, icons)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `icons` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L512)

<a id="function-function-mq3-client-ui-main-missionpack-ui-buildserverdisplaylist-function-ui-buildserverdisplaylist-state-force-src-mq3-client-ui-main-missionpack-ml-992602786"></a>
### UI_BuildServerDisplayList

```ml
function UI_BuildServerDisplayList(state, force)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `force` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L337)

<a id="function-function-mq3-client-ui-main-missionpack-ui-buildserverstatus-function-ui-buildserverstatus-state-force-src-mq3-client-ui-main-missionpack-ml-1277289910"></a>
### UI_BuildServerStatus

```ml
function UI_BuildServerStatus(state, force)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `force` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L355)

<a id="function-function-mq3-client-ui-main-missionpack-ui-clanname-handlekey-function-ui-clanname-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1236618320"></a>
### UI_ClanName_HandleKey

```ml
function UI_ClanName_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L292)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-console-command-const-ui-console-command-8-src-mq3-client-ui-main-missionpack-ml-203006113"></a>
### UI_CONSOLE_COMMAND

```ml
const UI_CONSOLE_COMMAND = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L18)

<a id="function-function-mq3-client-ui-main-missionpack-ui-crosshair-handlekey-function-ui-crosshair-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1362124064"></a>
### UI_Crosshair_HandleKey

```ml
function UI_Crosshair_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L305)

<a id="function-function-mq3-client-ui-main-missionpack-ui-displaydownloadinfo-function-ui-displaydownloadinfo-state-downloadname-centerpoint-ystart-scale-src-mq3-client-ui-main-missionpack-ml-797077352"></a>
### UI_DisplayDownloadInfo

```ml
function UI_DisplayDownloadInfo(state, downloadName, centerPoint, yStart, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `downloadName` | `dynamic` | — |  |
| `centerPoint` | `dynamic` | — |  |
| `yStart` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L525)

<a id="function-function-mq3-client-ui-main-missionpack-ui-doserverrefresh-function-ui-doserverrefresh-state-src-mq3-client-ui-main-missionpack-ml-1554904131"></a>
### UI_DoServerRefresh

```ml
function UI_DoServerRefresh(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L538)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-draw-connect-screen-const-ui-draw-connect-screen-9-src-mq3-client-ui-main-missionpack-ml-1439094172"></a>
### UI_DRAW_CONNECT_SCREEN

```ml
const UI_DRAW_CONNECT_SCREEN = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L19)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawallmapsselection-function-ui-drawallmapsselection-state-rect-scale-color-textstyle-net-src-mq3-client-ui-main-missionpack-ml-580098497"></a>
### UI_DrawAllMapsSelection

```ml
function UI_DrawAllMapsSelection(state, rect, scale, color, textStyle, net)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |
| `net` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L207)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawbotname-function-ui-drawbotname-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-130468444"></a>
### UI_DrawBotName

```ml
function UI_DrawBotName(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L209)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawbotskill-function-ui-drawbotskill-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-489791926"></a>
### UI_DrawBotSkill

```ml
function UI_DrawBotSkill(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L210)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawcenteredpic-function-ui-drawcenteredpic-state-image-w-h-src-mq3-client-ui-main-missionpack-ml-1520180121"></a>
### UI_DrawCenteredPic

```ml
function UI_DrawCenteredPic(state, image, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `image` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L148)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawcinematic-function-ui-drawcinematic-state-handle-x-y-w-h-src-mq3-client-ui-main-missionpack-ml-736738981"></a>
### UI_DrawCinematic

```ml
function UI_DrawCinematic(state, handle, x, y, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L180)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawclancinematic-function-ui-drawclancinematic-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-750349126"></a>
### UI_DrawClanCinematic

```ml
function UI_DrawClanCinematic(state, rect, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L169)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawclanlogo-function-ui-drawclanlogo-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-1182693038"></a>
### UI_DrawClanLogo

```ml
function UI_DrawClanLogo(state, rect, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L168)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawclanname-function-ui-drawclanname-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1438020428"></a>
### UI_DrawClanName

```ml
function UI_DrawClanName(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L162)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawconnectscreen-function-ui-drawconnectscreen-state-overlay-src-mq3-client-ui-main-missionpack-ml-1319136191"></a>
### UI_DrawConnectScreen

```ml
function UI_DrawConnectScreen(state, overlay)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `overlay` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L529)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawcrosshair-function-ui-drawcrosshair-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-1212526158"></a>
### UI_DrawCrosshair

```ml
function UI_DrawCrosshair(state, rect, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L212)

<a id="function-function-mq3-client-ui-main-missionpack-ui-draweffects-function-ui-draweffects-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-446300614"></a>
### UI_DrawEffects

```ml
function UI_DrawEffects(state, rect, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L174)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawgametype-function-ui-drawgametype-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1121330426"></a>
### UI_DrawGameType

```ml
function UI_DrawGameType(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L163)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawglinfo-function-ui-drawglinfo-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1055837712"></a>
### UI_DrawGLInfo

```ml
function UI_DrawGLInfo(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L218)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawhandicap-function-ui-drawhandicap-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-65958394"></a>
### UI_DrawHandicap

```ml
function UI_DrawHandicap(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L161)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawjoingametype-function-ui-drawjoingametype-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1708417974"></a>
### UI_DrawJoinGameType

```ml
function UI_DrawJoinGameType(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L165)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawkeybindstatus-function-ui-drawkeybindstatus-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-768074376"></a>
### UI_DrawKeyBindStatus

```ml
function UI_DrawKeyBindStatus(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L217)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawmapcinematic-function-ui-drawmapcinematic-state-rect-scale-color-net-src-mq3-client-ui-main-missionpack-ml-306898689"></a>
### UI_DrawMapCinematic

```ml
function UI_DrawMapCinematic(state, rect, scale, color, net)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `net` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L182)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawmappreview-function-ui-drawmappreview-state-rect-scale-color-net-src-mq3-client-ui-main-missionpack-ml-1369813803"></a>
### UI_DrawMapPreview

```ml
function UI_DrawMapPreview(state, rect, scale, color, net)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `net` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L176)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawmaptimetobeat-function-ui-drawmaptimetobeat-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-693794092"></a>
### UI_DrawMapTimeToBeat

```ml
function UI_DrawMapTimeToBeat(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L177)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawnetfilter-function-ui-drawnetfilter-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1647362580"></a>
### UI_DrawNetFilter

```ml
function UI_DrawNetFilter(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L187)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawnetgametype-function-ui-drawnetgametype-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1376065564"></a>
### UI_DrawNetGameType

```ml
function UI_DrawNetGameType(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L164)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawnetmapcinematic-function-ui-drawnetmapcinematic-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-1183503326"></a>
### UI_DrawNetMapCinematic

```ml
function UI_DrawNetMapCinematic(state, rect, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L186)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawnetmappreview-function-ui-drawnetmappreview-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-1755102230"></a>
### UI_DrawNetMapPreview

```ml
function UI_DrawNetMapPreview(state, rect, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L185)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawnetsource-function-ui-drawnetsource-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1289953212"></a>
### UI_DrawNetSource

```ml
function UI_DrawNetSource(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L184)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawopponent-function-ui-drawopponent-state-rect-src-mq3-client-ui-main-missionpack-ml-1335563029"></a>
### UI_DrawOpponent

```ml
function UI_DrawOpponent(state, rect)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L198)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawopponentlogo-function-ui-drawopponentlogo-state-rect-color-src-mq3-client-ui-main-missionpack-ml-1366920086"></a>
### UI_DrawOpponentLogo

```ml
function UI_DrawOpponentLogo(state, rect, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L204)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawopponentlogometal-function-ui-drawopponentlogometal-state-rect-color-src-mq3-client-ui-main-missionpack-ml-1497305576"></a>
### UI_DrawOpponentLogoMetal

```ml
function UI_DrawOpponentLogoMetal(state, rect, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L205)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawopponentlogoname-function-ui-drawopponentlogoname-state-rect-color-src-mq3-client-ui-main-missionpack-ml-1113852488"></a>
### UI_DrawOpponentLogoName

```ml
function UI_DrawOpponentLogoName(state, rect, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L206)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawopponentname-function-ui-drawopponentname-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1976860846"></a>
### UI_DrawOpponentName

```ml
function UI_DrawOpponentName(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L208)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawplayerlogo-function-ui-drawplayerlogo-state-rect-color-src-mq3-client-ui-main-missionpack-ml-220473690"></a>
### UI_DrawPlayerLogo

```ml
function UI_DrawPlayerLogo(state, rect, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L201)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawplayerlogometal-function-ui-drawplayerlogometal-state-rect-color-src-mq3-client-ui-main-missionpack-ml-615382784"></a>
### UI_DrawPlayerLogoMetal

```ml
function UI_DrawPlayerLogoMetal(state, rect, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L202)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawplayerlogoname-function-ui-drawplayerlogoname-state-rect-color-src-mq3-client-ui-main-missionpack-ml-1624044496"></a>
### UI_DrawPlayerLogoName

```ml
function UI_DrawPlayerLogoName(state, rect, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L203)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawplayermodel-function-ui-drawplayermodel-state-rect-src-mq3-client-ui-main-missionpack-ml-699336145"></a>
### UI_DrawPlayerModel

```ml
function UI_DrawPlayerModel(state, rect)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L183)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawpreviewcinematic-function-ui-drawpreviewcinematic-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-975443878"></a>
### UI_DrawPreviewCinematic

```ml
function UI_DrawPreviewCinematic(state, rect, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L170)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawredblue-function-ui-drawredblue-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-313003788"></a>
### UI_DrawRedBlue

```ml
function UI_DrawRedBlue(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L211)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawselectedplayer-function-ui-drawselectedplayer-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-84263362"></a>
### UI_DrawSelectedPlayer

```ml
function UI_DrawSelectedPlayer(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L214)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawservermotd-function-ui-drawservermotd-state-rect-scale-color-src-mq3-client-ui-main-missionpack-ml-2087472454"></a>
### UI_DrawServerMOTD

```ml
function UI_DrawServerMOTD(state, rect, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L216)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawserverrefreshdate-function-ui-drawserverrefreshdate-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-324731712"></a>
### UI_DrawServerRefreshDate

```ml
function UI_DrawServerRefreshDate(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L215)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawskill-function-ui-drawskill-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-769236"></a>
### UI_DrawSkill

```ml
function UI_DrawSkill(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L171)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawteammember-function-ui-drawteammember-state-rect-scale-color-blue-num-textstyle-src-mq3-client-ui-main-missionpack-ml-2031924674"></a>
### UI_DrawTeamMember

```ml
function UI_DrawTeamMember(state, rect, scale, color, blue, num, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L173)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawteamname-function-ui-drawteamname-state-rect-scale-color-blue-textstyle-src-mq3-client-ui-main-missionpack-ml-228445330"></a>
### UI_DrawTeamName

```ml
function UI_DrawTeamName(state, rect, scale, color, blue, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L172)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawtier-function-ui-drawtier-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-362552290"></a>
### UI_DrawTier

```ml
function UI_DrawTier(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L188)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawtiergametype-function-ui-drawtiergametype-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-1694868466"></a>
### UI_DrawTierGameType

```ml
function UI_DrawTierGameType(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L191)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawtiermap-function-ui-drawtiermap-state-rect-index-src-mq3-client-ui-main-missionpack-ml-1638688537"></a>
### UI_DrawTierMap

```ml
function UI_DrawTierMap(state, rect, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L189)

<a id="function-function-mq3-client-ui-main-missionpack-ui-drawtiermapname-function-ui-drawtiermapname-state-rect-scale-color-textstyle-src-mq3-client-ui-main-missionpack-ml-2098185212"></a>
### UI_DrawTierMapName

```ml
function UI_DrawTierMapName(state, rect, scale, color, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rect` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L190)

<a id="function-function-mq3-client-ui-main-missionpack-ui-effects-handlekey-function-ui-effects-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-251088748"></a>
### UI_Effects_HandleKey

```ml
function UI_Effects_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L291)

<a id="function-function-mq3-client-ui-main-missionpack-ui-englishmapname-function-ui-englishmapname-state-map-src-mq3-client-ui-main-missionpack-ml-1667355197"></a>
### UI_EnglishMapName

```ml
function UI_EnglishMapName(state, map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L513)

<a id="function-function-mq3-client-ui-main-missionpack-ui-feedercount-function-ui-feedercount-state-feederid-src-mq3-client-ui-main-missionpack-ml-1526625249"></a>
### UI_FeederCount

```ml
function UI_FeederCount(state, feederID)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `feederID` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L365)

<a id="function-function-mq3-client-ui-main-missionpack-ui-feederitemimage-function-ui-feederitemimage-state-feederid-index-src-mq3-client-ui-main-missionpack-ml-99625761"></a>
### UI_FeederItemImage

```ml
function UI_FeederItemImage(state, feederID, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `feederID` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L373)

<a id="function-function-mq3-client-ui-main-missionpack-ui-feederitemtext-function-ui-feederitemtext-state-feederid-index-column-src-mq3-client-ui-main-missionpack-ml-1791219215"></a>
### UI_FeederItemText

```ml
function UI_FeederItemText(state, feederID, index, column)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `feederID` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `column` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L368)

<a id="function-function-mq3-client-ui-main-missionpack-ui-feederselection-function-ui-feederselection-state-feederid-index-src-mq3-client-ui-main-missionpack-ml-837185269"></a>
### UI_FeederSelection

```ml
function UI_FeederSelection(state, feederID, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `feederID` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L376)

<a id="function-function-mq3-client-ui-main-missionpack-ui-gametype-handlekey-function-ui-gametype-handlekey-state-flags-special-key-resetmap-src-mq3-client-ui-main-missionpack-ml-30928079"></a>
### UI_GameType_HandleKey

```ml
function UI_GameType_HandleKey(state, flags, special, key, resetMap)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `resetMap` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L293)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-getapiversion-const-ui-getapiversion-0-src-mq3-client-ui-main-missionpack-ml-1248076947"></a>
### UI_GETAPIVERSION

```ml
const UI_GETAPIVERSION = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L10)

<a id="function-function-mq3-client-ui-main-missionpack-ui-getindexfromselection-function-ui-getindexfromselection-state-actual-src-mq3-client-ui-main-missionpack-ml-1697727713"></a>
### UI_GetIndexFromSelection

```ml
function UI_GetIndexFromSelection(state, actual)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `actual` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L363)

<a id="function-function-mq3-client-ui-main-missionpack-ui-getserverstatusinfo-function-ui-getserverstatusinfo-state-address-statustext-src-mq3-client-ui-main-missionpack-ml-1975865412"></a>
### UI_GetServerStatusInfo

```ml
function UI_GetServerStatusInfo(state, address, statusText)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `statusText` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L346)

<a id="function-function-mq3-client-ui-main-missionpack-ui-getteamcolor-function-ui-getteamcolor-state-src-mq3-client-ui-main-missionpack-ml-720076829"></a>
### UI_GetTeamColor

```ml
function UI_GetTeamColor(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L510)

<a id="function-function-mq3-client-ui-main-missionpack-ui-getvalue-function-ui-getvalue-state-ownerdraw-src-mq3-client-ui-main-missionpack-ml-579721948"></a>
### UI_GetValue

```ml
function UI_GetValue(state, ownerDraw)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ownerDraw` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L310)

<a id="function-function-mq3-client-ui-main-missionpack-ui-handicap-handlekey-function-ui-handicap-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-39302718"></a>
### UI_Handicap_HandleKey

```ml
function UI_Handicap_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L290)

<a id="function-function-mq3-client-ui-main-missionpack-ui-hasskinforbase-function-ui-hasskinforbase-state-base-team-src-mq3-client-ui-main-missionpack-ml-523336883"></a>
### UI_hasSkinForBase

```ml
function UI_hasSkinForBase(state, base, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L511)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-hasuniquecdkey-const-ui-hasuniquecdkey-10-src-mq3-client-ui-main-missionpack-ml-1555188344"></a>
### UI_HASUNIQUECDKEY

```ml
const UI_HASUNIQUECDKEY = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L20)

<a id="function-function-mq3-client-ui-main-missionpack-ui-headcountbyteam-function-ui-headcountbyteam-state-src-mq3-client-ui-main-missionpack-ml-1654998831"></a>
### UI_HeadCountByTeam

```ml
function UI_HeadCountByTeam(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L360)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-init-const-ui-init-1-src-mq3-client-ui-main-missionpack-ml-1290038048"></a>
### UI_INIT

```ml
const UI_INIT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L11)

<a id="function-function-mq3-client-ui-main-missionpack-ui-insertserverintodisplaylist-function-ui-insertserverintodisplaylist-state-num-position-src-mq3-client-ui-main-missionpack-ml-250064298"></a>
### UI_InsertServerIntoDisplayList

```ml
function UI_InsertServerIntoDisplayList(state, num, position)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L327)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-is-fullscreen-const-ui-is-fullscreen-6-src-mq3-client-ui-main-missionpack-ml-362107693"></a>
### UI_IS_FULLSCREEN

```ml
const UI_IS_FULLSCREEN = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L16)

<a id="function-function-mq3-client-ui-main-missionpack-ui-joingametype-handlekey-function-ui-joingametype-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1204234038"></a>
### UI_JoinGameType_HandleKey

```ml
function UI_JoinGameType_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L295)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-key-event-const-ui-key-event-3-src-mq3-client-ui-main-missionpack-ml-181268674"></a>
### UI_KEY_EVENT

```ml
const UI_KEY_EVENT = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L13)

<a id="function-function-mq3-client-ui-main-missionpack-ui-load-function-ui-load-state-files-src-mq3-client-ui-main-missionpack-ml-814128644"></a>
### UI_Load

```ml
function UI_Load(state, files)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L158)

<a id="function-function-mq3-client-ui-main-missionpack-ui-loaddemos-function-ui-loaddemos-state-files-protocol-src-mq3-client-ui-main-missionpack-ml-669271218"></a>
### UI_LoadDemos

```ml
function UI_LoadDemos(state, files, protocol)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |
| `protocol` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L390)

<a id="function-function-mq3-client-ui-main-missionpack-ui-loadmenus-function-ui-loadmenus-state-menufile-reset-files-src-mq3-client-ui-main-missionpack-ml-376322666"></a>
### UI_LoadMenus

```ml
function UI_LoadMenus(state, menuFile, reset, files)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `menuFile` | `dynamic` | — |  |
| `reset` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L154)

<a id="function-function-mq3-client-ui-main-missionpack-ui-loadmods-function-ui-loadmods-state-entries-src-mq3-client-ui-main-missionpack-ml-67917539"></a>
### UI_LoadMods

```ml
function UI_LoadMods(state, entries)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entries` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L386)

<a id="function-function-mq3-client-ui-main-missionpack-ui-loadmovies-function-ui-loadmovies-state-files-src-mq3-client-ui-main-missionpack-ml-1319427698"></a>
### UI_LoadMovies

```ml
function UI_LoadMovies(state, files)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L389)

<a id="function-function-mq3-client-ui-main-missionpack-ui-loadnoningame-function-ui-loadnoningame-state-files-src-mq3-client-ui-main-missionpack-ml-1229454018"></a>
### UI_LoadNonIngame

```ml
function UI_LoadNonIngame(state, files)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L514)

<a id="function-function-mq3-client-ui-main-missionpack-ui-loadteams-function-ui-loadteams-state-entries-src-mq3-client-ui-main-missionpack-ml-506887295"></a>
### UI_LoadTeams

```ml
function UI_LoadTeams(state, entries)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entries` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L387)

<a id="function-function-mq3-client-ui-main-missionpack-ui-mapcountbygametype-function-ui-mapcountbygametype-state-singleplayer-src-mq3-client-ui-main-missionpack-ml-1196278182"></a>
### UI_MapCountByGameType

```ml
function UI_MapCountByGameType(state, singlePlayer)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `singlePlayer` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L357)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-mouse-event-const-ui-mouse-event-4-src-mq3-client-ui-main-missionpack-ml-1033301747"></a>
### UI_MOUSE_EVENT

```ml
const UI_MOUSE_EVENT = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L14)

<a id="function-function-mq3-client-ui-main-missionpack-ui-netfilter-handlekey-function-ui-netfilter-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-403688516"></a>
### UI_NetFilter_HandleKey

```ml
function UI_NetFilter_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L300)

<a id="function-function-mq3-client-ui-main-missionpack-ui-netgametype-handlekey-function-ui-netgametype-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1267080852"></a>
### UI_NetGameType_HandleKey

```ml
function UI_NetGameType_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L294)

<a id="function-function-mq3-client-ui-main-missionpack-ui-netsource-handlekey-function-ui-netsource-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1712255380"></a>
### UI_NetSource_HandleKey

```ml
function UI_NetSource_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L299)

<a id="function-function-mq3-client-ui-main-missionpack-ui-nextopponent-function-ui-nextopponent-state-src-mq3-client-ui-main-missionpack-ml-373842841"></a>
### UI_NextOpponent

```ml
function UI_NextOpponent(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L199)

<a id="function-function-mq3-client-ui-main-missionpack-ui-opponentleaderhead-function-ui-opponentleaderhead-state-src-mq3-client-ui-main-missionpack-ml-1150046369"></a>
### UI_OpponentLeaderHead

```ml
function UI_OpponentLeaderHead(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L196)

<a id="function-function-mq3-client-ui-main-missionpack-ui-opponentleadermodel-function-ui-opponentleadermodel-state-src-mq3-client-ui-main-missionpack-ml-1440477079"></a>
### UI_OpponentLeaderModel

```ml
function UI_OpponentLeaderModel(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L197)

<a id="function-function-mq3-client-ui-main-missionpack-ui-opponentleadername-function-ui-opponentleadername-state-src-mq3-client-ui-main-missionpack-ml-1641166183"></a>
### UI_OpponentLeaderName

```ml
function UI_OpponentLeaderName(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L192)

<a id="function-function-mq3-client-ui-main-missionpack-ui-opponentname-handlekey-function-ui-opponentname-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-291735870"></a>
### UI_OpponentName_HandleKey

```ml
function UI_OpponentName_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L301)

<a id="function-function-mq3-client-ui-main-missionpack-ui-ownerdraw-function-ui-ownerdraw-state-x-y-w-h-text-x-text-y-ownerdraw-ownerdrawflags-align-special-scale-color-shader-textstyle-src-mq3-client-ui-main-missionpack-ml-617763371"></a>
### UI_OwnerDraw

```ml
function UI_OwnerDraw(state, x, y, w, h, text_x, text_y, ownerDraw, ownerDrawFlags, align, special, scale, color, shader, textStyle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `text_x` | `dynamic` | — |  |
| `text_y` | `dynamic` | — |  |
| `ownerDraw` | `dynamic` | — |  |
| `ownerDrawFlags` | `dynamic` | — |  |
| `align` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `textStyle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L229)

<a id="function-function-mq3-client-ui-main-missionpack-ui-ownerdraw-width-function-ui-ownerdraw-width-state-ownerdraw-src-mq3-client-ui-main-missionpack-ml-99913928"></a>
### UI_OwnerDraw_Width

```ml
function UI_OwnerDraw_Width(state, ownerDraw)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ownerDraw` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L228)

<a id="function-function-mq3-client-ui-main-missionpack-ui-ownerdrawhandlekey-function-ui-ownerdrawhandlekey-state-ownerdraw-flags-special-key-src-mq3-client-ui-main-missionpack-ml-2053768487"></a>
### UI_OwnerDrawHandleKey

```ml
function UI_OwnerDrawHandleKey(state, ownerDraw, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ownerDraw` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L307)

<a id="function-function-mq3-client-ui-main-missionpack-ui-ownerdrawvisible-function-ui-ownerdrawvisible-state-flags-src-mq3-client-ui-main-missionpack-ml-1616833046"></a>
### UI_OwnerDrawVisible

```ml
function UI_OwnerDrawVisible(state, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L278)

<a id="function-function-mq3-client-ui-main-missionpack-ui-ownerdrawwidth-function-ui-ownerdrawwidth-state-ownerdraw-scale-src-mq3-client-ui-main-missionpack-ml-573706780"></a>
### UI_OwnerDrawWidth

```ml
function UI_OwnerDrawWidth(state, ownerDraw, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ownerDraw` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L220)

<a id="function-function-mq3-client-ui-main-missionpack-ui-parsegameinfo-function-ui-parsegameinfo-state-gamefile-text-src-mq3-client-ui-main-missionpack-ml-599901186"></a>
### UI_ParseGameInfo

```ml
function UI_ParseGameInfo(state, gameFile, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `gameFile` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L508)

<a id="function-function-mq3-client-ui-main-missionpack-ui-parsemenu-function-ui-parsemenu-state-menufile-text-src-mq3-client-ui-main-missionpack-ml-1433111085"></a>
### UI_ParseMenu

```ml
function UI_ParseMenu(state, menuFile, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `menuFile` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L152)

<a id="function-function-mq3-client-ui-main-missionpack-ui-parseteaminfo-function-ui-parseteaminfo-state-teamfile-text-src-mq3-client-ui-main-missionpack-ml-1942206827"></a>
### UI_ParseTeamInfo

```ml
function UI_ParseTeamInfo(state, teamFile, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `teamFile` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L507)

<a id="function-function-mq3-client-ui-main-missionpack-ui-pause-function-ui-pause-state-value-src-mq3-client-ui-main-missionpack-ml-2095553212"></a>
### UI_Pause

```ml
function UI_Pause(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L515)

<a id="function-function-mq3-client-ui-main-missionpack-ui-playcinematic-function-ui-playcinematic-state-name-x-y-w-h-src-mq3-client-ui-main-missionpack-ml-1358787098"></a>
### UI_PlayCinematic

```ml
function UI_PlayCinematic(state, name, x, y, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L178)

<a id="function-function-mq3-client-ui-main-missionpack-ui-printtime-function-ui-printtime-time-src-mq3-client-ui-main-missionpack-ml-556615969"></a>
### UI_PrintTime

```ml
function UI_PrintTime(time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L524)

<a id="function-function-mq3-client-ui-main-missionpack-ui-prioropponent-function-ui-prioropponent-state-src-mq3-client-ui-main-missionpack-ml-1271342139"></a>
### UI_PriorOpponent

```ml
function UI_PriorOpponent(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L200)

<a id="function-function-mq3-client-ui-main-missionpack-ui-readablesize-function-ui-readablesize-value-src-mq3-client-ui-main-missionpack-ml-1165737095"></a>
### UI_ReadableSize

```ml
function UI_ReadableSize(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L517)

<a id="function-function-mq3-client-ui-main-missionpack-ui-redblue-handlekey-function-ui-redblue-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1331562280"></a>
### UI_RedBlue_HandleKey

```ml
function UI_RedBlue_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L304)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-refresh-const-ui-refresh-5-src-mq3-client-ui-main-missionpack-ml-52865322"></a>
### UI_REFRESH

```ml
const UI_REFRESH = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L15)

<a id="function-function-mq3-client-ui-main-missionpack-ui-registercvars-function-ui-registercvars-state-src-mq3-client-ui-main-missionpack-ml-1192886111"></a>
### UI_RegisterCvars

```ml
function UI_RegisterCvars(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L556)

<a id="function-function-mq3-client-ui-main-missionpack-ui-removeserverfromdisplaylist-function-ui-removeserverfromdisplaylist-state-num-src-mq3-client-ui-main-missionpack-ml-1532282475"></a>
### UI_RemoveServerFromDisplayList

```ml
function UI_RemoveServerFromDisplayList(state, num)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L328)

<a id="function-function-mq3-client-ui-main-missionpack-ui-report-function-ui-report-state-src-mq3-client-ui-main-missionpack-ml-1851559373"></a>
### UI_Report

```ml
function UI_Report(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L124)

<a id="function-function-mq3-client-ui-main-missionpack-ui-runcinematicframe-function-ui-runcinematicframe-state-handle-src-mq3-client-ui-main-missionpack-ml-367210017"></a>
### UI_RunCinematicFrame

```ml
function UI_RunCinematicFrame(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L181)

<a id="function-function-mq3-client-ui-main-missionpack-ui-runmenuscript-function-ui-runmenuscript-state-args-src-mq3-client-ui-main-missionpack-ml-1640586032"></a>
### UI_RunMenuScript

```ml
function UI_RunMenuScript(state, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L417)

<a id="function-function-mq3-client-ui-main-missionpack-ui-selectedhead-function-ui-selectedhead-state-index-actual-src-mq3-client-ui-main-missionpack-ml-100945249"></a>
### UI_SelectedHead

```ml
function UI_SelectedHead(state, index, actual)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `actual` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L362)

<a id="function-function-mq3-client-ui-main-missionpack-ui-selectedmap-function-ui-selectedmap-state-index-actual-src-mq3-client-ui-main-missionpack-ml-998336833"></a>
### UI_SelectedMap

```ml
function UI_SelectedMap(state, index, actual)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `actual` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L361)

<a id="function-function-mq3-client-ui-main-missionpack-ui-selectedplayer-handlekey-function-ui-selectedplayer-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1959046318"></a>
### UI_SelectedPlayer_HandleKey

```ml
function UI_SelectedPlayer_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L306)

<a id="function-function-mq3-client-ui-main-missionpack-ui-serversqsortcompare-function-ui-serversqsortcompare-state-leftindex-rightindex-src-mq3-client-ui-main-missionpack-ml-1532123552"></a>
### UI_ServersQsortCompare

```ml
function UI_ServersQsortCompare(state, leftIndex, rightIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `leftIndex` | `dynamic` | — |  |
| `rightIndex` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L313)

<a id="function-function-mq3-client-ui-main-missionpack-ui-serverssort-function-ui-serverssort-state-column-force-src-mq3-client-ui-main-missionpack-ml-1935582304"></a>
### UI_ServersSort

```ml
function UI_ServersSort(state, column, force)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `column` | `dynamic` | — |  |
| `force` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L323)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-set-active-menu-const-ui-set-active-menu-7-src-mq3-client-ui-main-missionpack-ml-1551445588"></a>
### UI_SET_ACTIVE_MENU

```ml
const UI_SET_ACTIVE_MENU = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L17)

<a id="function-function-mq3-client-ui-main-missionpack-ui-setcapfraglimits-function-ui-setcapfraglimits-state-uivars-src-mq3-client-ui-main-missionpack-ml-1930045233"></a>
### UI_SetCapFragLimits

```ml
function UI_SetCapFragLimits(state, uiVars)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `uiVars` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L398)

<a id="function-function-mq3-client-ui-main-missionpack-ui-setnextmap-function-ui-setnextmap-state-actual-index-src-mq3-client-ui-main-missionpack-ml-1327630597"></a>
### UI_SetNextMap

```ml
function UI_SetNextMap(state, actual, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `actual` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L391)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-anynonteamgame-const-ui-show-anynonteamgame-8-src-mq3-client-ui-main-missionpack-ml-634400895"></a>
### UI_SHOW_ANYNONTEAMGAME

```ml
const UI_SHOW_ANYNONTEAMGAME = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L52)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-anyteamgame-const-ui-show-anyteamgame-16-src-mq3-client-ui-main-missionpack-ml-838463786"></a>
### UI_SHOW_ANYTEAMGAME

```ml
const UI_SHOW_ANYTEAMGAME = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L53)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-demoavailable-const-ui-show-demoavailable-64-src-mq3-client-ui-main-missionpack-ml-1076956139"></a>
### UI_SHOW_DEMOAVAILABLE

```ml
const UI_SHOW_DEMOAVAILABLE = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L55)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-favoriteservers-const-ui-show-favoriteservers-4-src-mq3-client-ui-main-missionpack-ml-349082631"></a>
### UI_SHOW_FAVORITESERVERS

```ml
const UI_SHOW_FAVORITESERVERS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L51)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-ffa-const-ui-show-ffa-256-src-mq3-client-ui-main-missionpack-ml-490245858"></a>
### UI_SHOW_FFA

```ml
const UI_SHOW_FFA = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L57)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-leader-const-ui-show-leader-1-src-mq3-client-ui-main-missionpack-ml-309339078"></a>
### UI_SHOW_LEADER

```ml
const UI_SHOW_LEADER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L49)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-netanynonteamgame-const-ui-show-netanynonteamgame-1024-src-mq3-client-ui-main-missionpack-ml-1443443582"></a>
### UI_SHOW_NETANYNONTEAMGAME

```ml
const UI_SHOW_NETANYNONTEAMGAME = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L59)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-netanyteamgame-const-ui-show-netanyteamgame-2048-src-mq3-client-ui-main-missionpack-ml-944047799"></a>
### UI_SHOW_NETANYTEAMGAME

```ml
const UI_SHOW_NETANYTEAMGAME = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L60)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-newbesttime-const-ui-show-newbesttime-128-src-mq3-client-ui-main-missionpack-ml-322679862"></a>
### UI_SHOW_NEWBESTTIME

```ml
const UI_SHOW_NEWBESTTIME = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L56)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-newhighscore-const-ui-show-newhighscore-32-src-mq3-client-ui-main-missionpack-ml-692671792"></a>
### UI_SHOW_NEWHIGHSCORE

```ml
const UI_SHOW_NEWHIGHSCORE = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L54)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-notfavoriteservers-const-ui-show-notfavoriteservers-4096-src-mq3-client-ui-main-missionpack-ml-813127260"></a>
### UI_SHOW_NOTFAVORITESERVERS

```ml
const UI_SHOW_NOTFAVORITESERVERS = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L61)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-notffa-const-ui-show-notffa-512-src-mq3-client-ui-main-missionpack-ml-1961713443"></a>
### UI_SHOW_NOTFFA

```ml
const UI_SHOW_NOTFFA = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L58)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-show-notleader-const-ui-show-notleader-2-src-mq3-client-ui-main-missionpack-ml-1708065405"></a>
### UI_SHOW_NOTLEADER

```ml
const UI_SHOW_NOTLEADER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L50)

<a id="function-function-mq3-client-ui-main-missionpack-ui-showpostgame-function-ui-showpostgame-state-newhigh-src-mq3-client-ui-main-missionpack-ml-701477161"></a>
### UI_ShowPostGame

```ml
function UI_ShowPostGame(state, newHigh)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `newHigh` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L149)

<a id="constant-constant-mq3-client-ui-main-missionpack-ui-shutdown-const-ui-shutdown-2-src-mq3-client-ui-main-missionpack-ml-2072510669"></a>
### UI_SHUTDOWN

```ml
const UI_SHUTDOWN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L12)

<a id="function-function-mq3-client-ui-main-missionpack-ui-skill-handlekey-function-ui-skill-handlekey-state-flags-special-key-src-mq3-client-ui-main-missionpack-ml-1839753612"></a>
### UI_Skill_HandleKey

```ml
function UI_Skill_HandleKey(state, flags, special, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L296)

<a id="function-function-mq3-client-ui-main-missionpack-ui-sortserverstatusinfo-function-ui-sortserverstatusinfo-state-rows-src-mq3-client-ui-main-missionpack-ml-1657732088"></a>
### UI_SortServerStatusInfo

```ml
function UI_SortServerStatusInfo(state, rows)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `rows` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L342)

<a id="function-function-mq3-client-ui-main-missionpack-ui-startserverrefresh-function-ui-startserverrefresh-state-full-src-mq3-client-ui-main-missionpack-ml-515756898"></a>
### UI_StartServerRefresh

```ml
function UI_StartServerRefresh(state, full)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `full` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L541)

<a id="function-function-mq3-client-ui-main-missionpack-ui-startsingleplayer-function-ui-startsingleplayer-state-src-mq3-client-ui-main-missionpack-ml-2054772727"></a>
### UI_StartSinglePlayer

```ml
function UI_StartSinglePlayer(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L392)

<a id="function-function-mq3-client-ui-main-missionpack-ui-startskirmish-function-ui-startskirmish-state-next-src-mq3-client-ui-main-missionpack-ml-1638885932"></a>
### UI_StartSkirmish

```ml
function UI_StartSkirmish(state, next)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `next` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L393)

<a id="function-function-mq3-client-ui-main-missionpack-ui-stopcinematic-function-ui-stopcinematic-state-handle-src-mq3-client-ui-main-missionpack-ml-444414781"></a>
### UI_StopCinematic

```ml
function UI_StopCinematic(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L179)

<a id="function-function-mq3-client-ui-main-missionpack-ui-stopserverrefresh-function-ui-stopserverrefresh-state-src-mq3-client-ui-main-missionpack-ml-1114250911"></a>
### UI_StopServerRefresh

```ml
function UI_StopServerRefresh(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L534)

<a id="function-function-mq3-client-ui-main-missionpack-ui-teamindexfromname-function-ui-teamindexfromname-state-name-src-mq3-client-ui-main-missionpack-ml-2033319594"></a>
### UI_TeamIndexFromName

```ml
function UI_TeamIndexFromName(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L166)

<a id="function-function-mq3-client-ui-main-missionpack-ui-teammember-handlekey-function-ui-teammember-handlekey-state-flags-special-key-blue-num-src-mq3-client-ui-main-missionpack-ml-1592249050"></a>
### UI_TeamMember_HandleKey

```ml
function UI_TeamMember_HandleKey(state, flags, special, key, blue, num)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L298)

<a id="function-function-mq3-client-ui-main-missionpack-ui-teamname-handlekey-function-ui-teamname-handlekey-state-flags-special-key-blue-src-mq3-client-ui-main-missionpack-ml-1424767766"></a>
### UI_TeamName_HandleKey

```ml
function UI_TeamName_HandleKey(state, flags, special, key, blue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `special` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L297)

<a id="function-function-mq3-client-ui-main-missionpack-ui-update-function-ui-update-state-name-src-mq3-client-ui-main-missionpack-ml-557858110"></a>
### UI_Update

```ml
function UI_Update(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L406)

<a id="function-function-mq3-client-ui-main-missionpack-ui-updatecvars-function-ui-updatecvars-state-src-mq3-client-ui-main-missionpack-ml-1531427059"></a>
### UI_UpdateCvars

```ml
function UI_UpdateCvars(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L557)

<a id="function-function-mq3-client-ui-main-missionpack-ui-updatependingpings-function-ui-updatependingpings-state-src-mq3-client-ui-main-missionpack-ml-1492122227"></a>
### UI_UpdatePendingPings

```ml
function UI_UpdatePendingPings(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L364)

<a id="function-function-mq3-client-ui-main-missionpack-visiblecolor-function-visiblecolor-text-index-src-mq3-client-ui-main-missionpack-ml-265275091"></a>
### visibleColor

```ml
function visibleColor(text, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L104)

<a id="function-function-mq3-client-ui-main-missionpack-vmmain-function-vmmain-state-command-args-src-mq3-client-ui-main-missionpack-ml-892942303"></a>
### vmMain

```ml
function vmMain(state, command, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_main_missionpack.ml#L572)
