# `src/mq3/client/ui_playermodel.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_playermodel`](Package-mq3-client-ui-playermodel-2034182974.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_players.ml` as `players` → [src/mq3/client/ui_players.ml](File-src-mq3-client-ui-players-ml-675454436.md)
- `mq3/client/ui_qmenu.ml` as `qmenu` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-ui-playermodel-artlist-function-artlist-src-mq3-client-ui-playermodel-ml-1769864530"></a>
### artList

```ml
function artList()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L21)

<a id="function-function-mq3-client-ui-playermodel-bitmap-function-bitmap-name-id-x-y-flags-w-h-src-mq3-client-ui-playermodel-ml-606258743"></a>
### bitmap

```ml
function bitmap(name, id, x, y, flags, w, h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L82)

<a id="function-function-mq3-client-ui-playermodel-clean-function-clean-text-src-mq3-client-ui-playermodel-ml-2015112541"></a>
### clean

```ml
function clean(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L28)

<a id="function-function-mq3-client-ui-playermodel-create-function-create-source-src-mq3-client-ui-playermodel-ml-1040469489"></a>
### create

```ml
function create(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L22)

<a id="function-function-mq3-client-ui-playermodel-current-function-current-value-src-mq3-client-ui-playermodel-ml-2100150727"></a>
### current

```ml
function current(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L56)

<a id="function-function-mq3-client-ui-playermodel-emit-function-emit-value-boundary-kind-name-detail-number-retailactive-src-mq3-client-ui-playermodel-ml-1442539583"></a>
### emit

```ml
function emit(value, boundary, kind, name, detail, number, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `detail` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L23)

<a id="function-function-mq3-client-ui-playermodel-ends-function-ends-text-suffix-src-mq3-client-ui-playermodel-ml-957445254"></a>
### ends

```ml
function ends(text, suffix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `suffix` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L26)

<a id="function-function-mq3-client-ui-playermodel-iconparts-function-iconparts-path-src-mq3-client-ui-playermodel-ml-1361138669"></a>
### iconParts

```ml
function iconParts(path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L39)

<a id="constant-constant-mq3-client-ui-playermodel-id-back-const-id-back-102-src-mq3-client-ui-playermodel-ml-1794712502"></a>
### ID_BACK

```ml
const ID_BACK = 102
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L18)

<a id="constant-constant-mq3-client-ui-playermodel-id-nextpage-const-id-nextpage-101-src-mq3-client-ui-playermodel-ml-1267214409"></a>
### ID_NEXTPAGE

```ml
const ID_NEXTPAGE = 101
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L17)

<a id="constant-constant-mq3-client-ui-playermodel-id-prevpage-const-id-prevpage-100-src-mq3-client-ui-playermodel-ml-343637632"></a>
### ID_PREVPAGE

```ml
const ID_PREVPAGE = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L16)

<a id="constant-constant-mq3-client-ui-playermodel-low-memory-const-low-memory-5242880-src-mq3-client-ui-playermodel-ml-1170759310"></a>
### LOW_MEMORY

```ml
const LOW_MEMORY = 5242880
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L11)

<a id="function-function-mq3-client-ui-playermodel-lower-function-lower-text-src-mq3-client-ui-playermodel-ml-542426369"></a>
### lower

```ml
function lower(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L24)

<a id="constant-constant-mq3-client-ui-playermodel-max-modelsperpage-const-max-modelsperpage-16-src-mq3-client-ui-playermodel-ml-1067335200"></a>
### MAX_MODELSPERPAGE

```ml
const MAX_MODELSPERPAGE = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L14)

<a id="constant-constant-mq3-client-ui-playermodel-max-playermodels-const-max-playermodels-256-src-mq3-client-ui-playermodel-ml-39560624"></a>
### MAX_PLAYERMODELS

```ml
const MAX_PLAYERMODELS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L15)

<a id="constant-constant-mq3-client-ui-playermodel-playergrid-cols-const-playergrid-cols-4-src-mq3-client-ui-playermodel-ml-1157085249"></a>
### PLAYERGRID_COLS

```ml
const PLAYERGRID_COLS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L12)

<a id="constant-constant-mq3-client-ui-playermodel-playergrid-rows-const-playergrid-rows-4-src-mq3-client-ui-playermodel-ml-1568520065"></a>
### PLAYERGRID_ROWS

```ml
const PLAYERGRID_ROWS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L13)

<a id="function-function-mq3-client-ui-playermodel-playermodel-buildlist-function-playermodel-buildlist-value-files-buildscript-retailactive-src-mq3-client-ui-playermodel-ml-1176503616"></a>
### PlayerModel_BuildList

```ml
function PlayerModel_BuildList(value, files, buildscript, retailActive)
```

PlayerModel_BuildList

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |
| `buildscript` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L72)

<a id="function-function-mq3-client-ui-playermodel-playermodel-cache-function-playermodel-cache-value-files-buildscript-retailactive-src-mq3-client-ui-playermodel-ml-547573308"></a>
### PlayerModel_Cache

```ml
function PlayerModel_Cache(value, files, buildscript, retailActive)
```

PlayerModel_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |
| `buildscript` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L92)

<a id="function-function-mq3-client-ui-playermodel-playermodel-drawplayer-function-playermodel-drawplayer-value-realtime-frametime-retailactive-src-mq3-client-ui-playermodel-ml-666708217"></a>
### PlayerModel_DrawPlayer

```ml
function PlayerModel_DrawPlayer(value, realtime, frametime, retailActive)
```

PlayerModel_DrawPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L70)

<a id="function-function-mq3-client-ui-playermodel-playermodel-menuevent-function-playermodel-menuevent-value-id-event-retailactive-src-mq3-client-ui-playermodel-ml-1837097769"></a>
### PlayerModel_MenuEvent

```ml
function PlayerModel_MenuEvent(value, id, event, retailActive)
```

PlayerModel_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L55)

<a id="function-function-mq3-client-ui-playermodel-playermodel-menuinit-function-playermodel-menuinit-value-files-playername-model-buildscript-retailactive-src-mq3-client-ui-playermodel-ml-880164951"></a>
### PlayerModel_MenuInit

```ml
function PlayerModel_MenuInit(value, files, playerName, model, buildscript, retailActive)
```

PlayerModel_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |
| `playerName` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `buildscript` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L84)

<a id="function-function-mq3-client-ui-playermodel-playermodel-menukey-function-playermodel-menukey-value-key-cursorx-cursory-retailactive-src-mq3-client-ui-playermodel-ml-216643776"></a>
### PlayerModel_MenuKey

```ml
function PlayerModel_MenuKey(value, key, cursorx, cursory, retailActive)
```

PlayerModel_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `cursorx` | `dynamic` | — |  |
| `cursory` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L58)

<a id="function-function-mq3-client-ui-playermodel-playermodel-picevent-function-playermodel-picevent-value-id-event-memoryremaining-src-mq3-client-ui-playermodel-ml-1855853749"></a>
### PlayerModel_PicEvent

```ml
function PlayerModel_PicEvent(value, id, event, memoryRemaining)
```

PlayerModel_PicEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `memoryRemaining` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L66)

<a id="function-function-mq3-client-ui-playermodel-playermodel-savechanges-function-playermodel-savechanges-value-retailactive-src-mq3-client-ui-playermodel-ml-2078331382"></a>
### PlayerModel_SaveChanges

```ml
function PlayerModel_SaveChanges(value, retailActive)
```

PlayerModel_SaveChanges

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L53)

<a id="function-function-mq3-client-ui-playermodel-playermodel-setmenuitems-function-playermodel-setmenuitems-value-playername-model-src-mq3-client-ui-playermodel-ml-848512848"></a>
### PlayerModel_SetMenuItems

```ml
function PlayerModel_SetMenuItems(value, playerName, model)
```

PlayerModel_SetMenuItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `playerName` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L79)

<a id="function-function-mq3-client-ui-playermodel-playermodel-updategrid-function-playermodel-updategrid-value-src-mq3-client-ui-playermodel-ml-68009257"></a>
### PlayerModel_UpdateGrid

```ml
function PlayerModel_UpdateGrid(value)
```

PlayerModel_UpdateGrid

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L45)

<a id="function-function-mq3-client-ui-playermodel-playermodel-updatemodel-function-playermodel-updatemodel-value-src-mq3-client-ui-playermodel-ml-465509883"></a>
### PlayerModel_UpdateModel

```ml
function PlayerModel_UpdateModel(value)
```

PlayerModel_UpdateModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L51)

<a id="function-function-mq3-client-ui-playermodel-setlabels-function-setlabels-value-path-src-mq3-client-ui-playermodel-ml-1493643124"></a>
### setLabels

```ml
function setLabels(value, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L40)

<a id="function-function-mq3-client-ui-playermodel-starts-function-starts-text-prefix-src-mq3-client-ui-playermodel-ml-1110555387"></a>
### starts

```ml
function starts(text, prefix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `prefix` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L25)

- [mq3.client.ui_playermodel.State](Type-mq3-client-ui-playermodel-state-996669413.md) — struct
<a id="function-function-mq3-client-ui-playermodel-truncate-function-truncate-text-max-src-mq3-client-ui-playermodel-ml-1215525847"></a>
### truncate

```ml
function truncate(text, max)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `max` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L27)

<a id="function-function-mq3-client-ui-playermodel-ui-playermodelmenu-function-ui-playermodelmenu-value-files-playername-model-buildscript-retailactive-src-mq3-client-ui-playermodel-ml-764329235"></a>
### UI_PlayerModelMenu

```ml
function UI_PlayerModelMenu(value, files, playerName, model, buildscript, retailActive)
```

UI_PlayerModelMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `files` | `dynamic` | — |  |
| `playerName` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `buildscript` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L94)
