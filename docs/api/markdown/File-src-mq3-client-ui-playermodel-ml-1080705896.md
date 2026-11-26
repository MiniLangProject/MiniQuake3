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

Lists the 10 UI playermodel art list strings in their declared order, beginning with `"menu/art/back_0"`, `"menu/art/back_1"`, `"menu/art/opponents_select"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L83)

<a id="function-function-mq3-client-ui-playermodel-bitmap-function-bitmap-name-id-x-y-flags-w-h-src-mq3-client-ui-playermodel-ml-606258743"></a>
### bitmap

```ml
function bitmap(name, id, x, y, flags, w, h)
```

Calls `mq3.client.ui_qmenu.item` from UI playermodel `bitmap`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI playermodel resource. |
| `id` | `dynamic` | — | Value used by `value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `bitmap`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `bitmap`. |
| `flags` | `dynamic` | — | Value used by `value=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`. |
| `w` | `dynamic` | — | Value assigned to `value.width`. |
| `h` | `dynamic` | — | Value assigned to `value.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L210)

<a id="function-function-mq3-client-ui-playermodel-clean-function-clean-text-src-mq3-client-ui-playermodel-ml-2015112541"></a>
### clean

```ml
function clean(text)
```

Calls `decode` from UI playermodel `clean`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `clean` in the UI playermodel path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L113)

<a id="function-function-mq3-client-ui-playermodel-create-function-create-source-src-mq3-client-ui-playermodel-ml-1040469489"></a>
### create

```ml
function create(source)
```

Creates a `mq3.client.ui_playermodel.State` record. Assigns `source` from `source`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used to initialize `State.source`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L86)

<a id="function-function-mq3-client-ui-playermodel-current-function-current-value-src-mq3-client-ui-playermodel-ml-2100150727"></a>
### current

```ml
function current(value)
```

Adapts `mq3.client.ui_qmenu.Menu_ItemAtCursor` to UI playermodel `current`, returning its result for `value.menu`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.menu`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L156)

<a id="function-function-mq3-client-ui-playermodel-emit-function-emit-value-boundary-kind-name-detail-number-retailactive-src-mq3-client-ui-playermodel-ml-1442539583"></a>
### emit

```ml
function emit(value, boundary, kind, name, detail, number, retailActive)
```

Appends a UI playermodel action record to the queued engine requests.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI playermodel resource. |
| `detail` | `dynamic` | — | Value used by `value.actions=value.actions+[players.Action(boundary,kind,name,detail,number,void,not retailActive)]`. |
| `number` | `dynamic` | — | Value used by `value.actions=value.actions+[players.Action(boundary,kind,name,detail,number,void,not retailActive)]`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L95)

<a id="function-function-mq3-client-ui-playermodel-ends-function-ends-text-suffix-src-mq3-client-ui-playermodel-ml-957445254"></a>
### ends

```ml
function ends(text, suffix)
```

Calls `mq3.client.ui_playermodel.lower`, `std.string.substr` from UI playermodel `ends`. The final path returns `lower(strings.substr(text,len(text)-len(suffix),len(suffix)))==lower(suffix)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text whose length/content is inspected by `ends`. |
| `suffix` | `dynamic` | — | Sequence whose length/content is inspected by `ends`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L106)

<a id="function-function-mq3-client-ui-playermodel-iconparts-function-iconparts-path-src-mq3-client-ui-playermodel-ml-1361138669"></a>
### iconParts

```ml
function iconParts(path)
```

Calls `mq3.client.ui_playermodel.starts`, `std.string.substr`, `std.string.indexOf` and additional helpers from UI playermodel `iconParts`. The final path returns `[model,skin,"models/players/"+model+"/icon_"+skin]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L126)

<a id="constant-constant-mq3-client-ui-playermodel-id-back-const-id-back-102-src-mq3-client-ui-playermodel-ml-1794712502"></a>
### ID_BACK

```ml
const ID_BACK = 102
```

Event identifier of the Back control used to leave the player-model and skin selection menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L27)

<a id="constant-constant-mq3-client-ui-playermodel-id-nextpage-const-id-nextpage-101-src-mq3-client-ui-playermodel-ml-1267214409"></a>
### ID_NEXTPAGE

```ml
const ID_NEXTPAGE = 101
```

Menu control identifier routed to the nextpage action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L24)

<a id="constant-constant-mq3-client-ui-playermodel-id-prevpage-const-id-prevpage-100-src-mq3-client-ui-playermodel-ml-343637632"></a>
### ID_PREVPAGE

```ml
const ID_PREVPAGE = 100
```

Menu control identifier routed to the prevpage action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L22)

<a id="constant-constant-mq3-client-ui-playermodel-low-memory-const-low-memory-5242880-src-mq3-client-ui-playermodel-ml-1170759310"></a>
### LOW_MEMORY

```ml
const LOW_MEMORY = 5242880
```

Memory threshold below which client media loading should be deferred or reduced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L12)

<a id="function-function-mq3-client-ui-playermodel-lower-function-lower-text-src-mq3-client-ui-playermodel-ml-542426369"></a>
### lower

```ml
function lower(text)
```

Adapts `std.string.toLowerAscii` to UI playermodel `lower`, returning its result for `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 of `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L98)

<a id="constant-constant-mq3-client-ui-playermodel-max-modelsperpage-const-max-modelsperpage-16-src-mq3-client-ui-playermodel-ml-1067335200"></a>
### MAX_MODELSPERPAGE

```ml
const MAX_MODELSPERPAGE = 16
```

Capacity limit for the modelsperpage collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L18)

<a id="constant-constant-mq3-client-ui-playermodel-max-playermodels-const-max-playermodels-256-src-mq3-client-ui-playermodel-ml-39560624"></a>
### MAX_PLAYERMODELS

```ml
const MAX_PLAYERMODELS = 256
```

Capacity limit for the playermodels collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L20)

<a id="constant-constant-mq3-client-ui-playermodel-playergrid-cols-const-playergrid-cols-4-src-mq3-client-ui-playermodel-ml-1157085249"></a>
### PLAYERGRID_COLS

```ml
const PLAYERGRID_COLS = 4
```

Number of model-preview columns shown on one player-selection page.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L14)

<a id="constant-constant-mq3-client-ui-playermodel-playergrid-rows-const-playergrid-rows-4-src-mq3-client-ui-playermodel-ml-1568520065"></a>
### PLAYERGRID_ROWS

```ml
const PLAYERGRID_ROWS = 4
```

Number of model-preview rows shown on one player-selection page.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L16)

<a id="function-function-mq3-client-ui-playermodel-playermodel-buildlist-function-playermodel-buildlist-value-files-buildscript-retailactive-src-mq3-client-ui-playermodel-ml-1176503616"></a>
### PlayerModel_BuildList

```ml
function PlayerModel_BuildList(value, files, buildscript, retailActive)
```

PlayerModel_BuildList

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.modelpage`, `value.modelnames`, `value.nummodels`, `value.numpages`. |
| `files` | `dynamic` | — | Value used by `for each path in files`. |
| `buildscript` | `dynamic` | — | Value used by `if buildscript and starts(path,"models/players/") and ends(path,".tga") then leaf=path`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L189)

<a id="function-function-mq3-client-ui-playermodel-playermodel-cache-function-playermodel-cache-value-files-buildscript-retailactive-src-mq3-client-ui-playermodel-ml-547573308"></a>
### PlayerModel_Cache

```ml
function PlayerModel_Cache(value, files, buildscript, retailActive)
```

PlayerModel_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.modelnames`, `value.actions`. |
| `files` | `dynamic` | — | Value used by `PlayerModel_BuildList(value,files,buildscript,retailActive)`. |
| `buildscript` | `dynamic` | — | Value used by `PlayerModel_BuildList(value,files,buildscript,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L230)

<a id="function-function-mq3-client-ui-playermodel-playermodel-drawplayer-function-playermodel-drawplayer-value-realtime-frametime-retailactive-src-mq3-client-ui-playermodel-ml-666708217"></a>
### PlayerModel_DrawPlayer

```ml
function PlayerModel_DrawPlayer(value, realtime, frametime, retailActive)
```

PlayerModel_DrawPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.drawRows`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |
| `frametime` | `dynamic` | — | Value used by `players.UI_DrawPlayer(value.source,400.0,-40.0,320.0,560.0,value.playerinfo,n.trunc32(realtime/2),frametime,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L183)

<a id="function-function-mq3-client-ui-playermodel-playermodel-menuevent-function-playermodel-menuevent-value-id-event-retailactive-src-mq3-client-ui-playermodel-ml-1837097769"></a>
### PlayerModel_MenuEvent

```ml
function PlayerModel_MenuEvent(value, id, event, retailActive)
```

PlayerModel_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.modelpage`, `value.popped`. |
| `id` | `dynamic` | — | Value used by `if id==ID_PREVPAGE then if value.modelpage>0 then value.modelpage=value.modelpage-1`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L153)

<a id="function-function-mq3-client-ui-playermodel-playermodel-menuinit-function-playermodel-menuinit-value-files-playername-model-buildscript-retailactive-src-mq3-client-ui-playermodel-ml-880164951"></a>
### PlayerModel_MenuInit

```ml
function PlayerModel_MenuInit(value, files, playerName, model, buildscript, retailActive)
```

PlayerModel_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.menu`, `value.pics`, `value.picbuttons`, `value.left` and additional values. |
| `files` | `dynamic` | — | Value used by `PlayerModel_Cache(value,files,buildscript,retailActive)`. |
| `playerName` | `dynamic` | — | Player name shown in the UI or supplied to the client configuration. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this UI playermodel operation. |
| `buildscript` | `dynamic` | — | Value used by `PlayerModel_Cache(value,files,buildscript,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L218)

<a id="function-function-mq3-client-ui-playermodel-playermodel-menukey-function-playermodel-menukey-value-key-cursorx-cursory-retailactive-src-mq3-client-ui-playermodel-ml-216643776"></a>
### PlayerModel_MenuKey

```ml
function PlayerModel_MenuKey(value, key, cursorx, cursory, retailActive)
```

PlayerModel_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.modelpage`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI playermodel entry. |
| `cursorx` | `dynamic` | — | Value used by `return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)`. |
| `cursory` | `dynamic` | — | Value used by `return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L163)

<a id="function-function-mq3-client-ui-playermodel-playermodel-picevent-function-playermodel-picevent-value-id-event-memoryremaining-src-mq3-client-ui-playermodel-ml-1855853749"></a>
### PlayerModel_PicEvent

```ml
function PlayerModel_PicEvent(value, id, event, memoryRemaining)
```

PlayerModel_PicEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.pics[i].flags`, `value.picbuttons[i].flags`, `value.pics[id].flags`, `value.picbuttons[id].flags` and additional values. |
| `id` | `dynamic` | — | Value used by `if event!=qmenu.QM_ACTIVATED or id<0 or id>=16 then return false end if`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |
| `memoryRemaining` | `dynamic` | — | Value used by `if memoryRemaining>LOW_MEMORY then PlayerModel_UpdateModel(value) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L175)

<a id="function-function-mq3-client-ui-playermodel-playermodel-savechanges-function-playermodel-savechanges-value-retailactive-src-mq3-client-ui-playermodel-ml-2078331382"></a>
### PlayerModel_SaveChanges

```ml
function PlayerModel_SaveChanges(value, retailActive)
```

PlayerModel_SaveChanges

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.cvarWrites`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L147)

<a id="function-function-mq3-client-ui-playermodel-playermodel-setmenuitems-function-playermodel-setmenuitems-value-playername-model-src-mq3-client-ui-playermodel-ml-848512848"></a>
### PlayerModel_SetMenuItems

```ml
function PlayerModel_SetMenuItems(value, playerName, model)
```

PlayerModel_SetMenuItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.playername`, `value.modelskin`, `value.selectedmodel`, `value.modelpage`. |
| `playerName` | `dynamic` | — | Player name shown in the UI or supplied to the client configuration. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this UI playermodel operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L199)

<a id="function-function-mq3-client-ui-playermodel-playermodel-updategrid-function-playermodel-updategrid-value-src-mq3-client-ui-playermodel-ml-68009257"></a>
### PlayerModel_UpdateGrid

```ml
function PlayerModel_UpdateGrid(value)
```

PlayerModel_UpdateGrid

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.pics[i].name`, `value.picbuttons[i].flags`, `value.pics[i].flags`, `value.pics[i].shader` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L136)

<a id="function-function-mq3-client-ui-playermodel-playermodel-updatemodel-function-playermodel-updatemodel-value-src-mq3-client-ui-playermodel-ml-465509883"></a>
### PlayerModel_UpdateModel

```ml
function PlayerModel_UpdateModel(value)
```

PlayerModel_UpdateModel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.playerinfo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L143)

<a id="function-function-mq3-client-ui-playermodel-setlabels-function-setlabels-value-path-src-mq3-client-ui-playermodel-ml-1493643124"></a>
### setLabels

```ml
function setLabels(value, path)
```

Updates `value.modelskin`, `value.modelname`, `value.skinname` during UI playermodel `setLabels`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.modelskin`, `value.modelname`, `value.skinname`. |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L130)

<a id="function-function-mq3-client-ui-playermodel-starts-function-starts-text-prefix-src-mq3-client-ui-playermodel-ml-1110555387"></a>
### starts

```ml
function starts(text, prefix)
```

Calls `mq3.client.ui_playermodel.lower`, `std.string.substr` from UI playermodel `starts`. The final path returns `lower(strings.substr(text,0,len(prefix)))==lower(prefix)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text whose length/content is inspected by `starts`. |
| `prefix` | `dynamic` | — | Sequence whose length/content is inspected by `starts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L102)

- [mq3.client.ui_playermodel.State](Type-mq3-client-ui-playermodel-state-996669413.md) — struct
<a id="function-function-mq3-client-ui-playermodel-truncate-function-truncate-text-max-src-mq3-client-ui-playermodel-ml-1215525847"></a>
### truncate

```ml
function truncate(text, max)
```

Calls `decode`, `slice` from UI playermodel `truncate`. The final path returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `truncate` in the UI playermodel path. |
| `max` | `dynamic` | — | Value used by `if len(bytes(text))>=max then return decode(slice(bytes(text),0,max-1)) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L110)

<a id="function-function-mq3-client-ui-playermodel-ui-playermodelmenu-function-ui-playermodelmenu-value-files-playername-model-buildscript-retailactive-src-mq3-client-ui-playermodel-ml-764329235"></a>
### UI_PlayerModelMenu

```ml
function UI_PlayerModelMenu(value, files, playerName, model, buildscript, retailActive)
```

UI_PlayerModelMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI playermodel record/storage; this routine assigns `value.pushed`, `value.menu.cursor`. |
| `files` | `dynamic` | — | Value used by `PlayerModel_MenuInit(value,files,playerName,model,buildscript,retailActive)`. |
| `playerName` | `dynamic` | — | Player name shown in the UI or supplied to the client configuration. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this UI playermodel operation. |
| `buildscript` | `dynamic` | — | Value used by `PlayerModel_MenuInit(value,files,playerName,model,buildscript,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_playermodel.ml#L238)
