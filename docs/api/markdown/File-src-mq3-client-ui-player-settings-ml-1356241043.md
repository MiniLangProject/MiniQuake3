# `src/mq3/client/ui_player_settings.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_player_settings`](Package-mq3-client-ui-player-settings-280865031.md)

Reachable from entry: **no**

## Imports

- `mq3/client/ui_mfield.ml` as `mfield` → [src/mq3/client/ui_mfield.ml](File-src-mq3-client-ui-mfield-ml-1722706615.md)
- `mq3/client/ui_players.ml` as `players` → [src/mq3/client/ui_players.ml](File-src-mq3-client-ui-players-ml-675454436.md)
- `mq3/client/ui_qmenu.ml` as `qmenu` → [src/mq3/client/ui_qmenu.ml](File-src-mq3-client-ui-qmenu-ml-201905758.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-client-ui-player-settings-artlist-function-artlist-src-mq3-client-ui-player-settings-ml-774910068"></a>
### artList

```ml
function artList()
```

Lists the 14 UI player settings art list strings in their declared order, beginning with `"menu/art/frame2_l"`, `"menu/art/frame1_r"`, `"menu/art/model_0"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L118)

<a id="function-function-mq3-client-ui-player-settings-bitmap-function-bitmap-name-id-x-y-flags-width-height-src-mq3-client-ui-player-settings-ml-826462485"></a>
### bitmap

```ml
function bitmap(name, id, x, y, flags, width, height)
```

Calls `mq3.client.ui_qmenu.item` from UI player settings `bitmap`. The final path returns `item`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI player settings resource. |
| `id` | `dynamic` | — | Value used by `item=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `bitmap`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `bitmap`. |
| `flags` | `dynamic` | — | Value used by `item=qmenu.item(qmenu.MTYPE_BITMAP,name,id,x,y,flags)`. |
| `width` | `dynamic` | — | Value assigned to `item.width`. |
| `height` | `dynamic` | — | Value assigned to `item.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L258)

<a id="function-function-mq3-client-ui-player-settings-cleanname-function-cleanname-text-src-mq3-client-ui-player-settings-ml-1401713421"></a>
### cleanName

```ml
function cleanName(text)
```

Calls `mq3.client.ui_player_settings.isColor`, `decode` from UI player settings `cleanName`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `cleanName` in the UI player settings path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L152)

<a id="function-function-mq3-client-ui-player-settings-color-function-color-index-src-mq3-client-ui-player-settings-ml-578201534"></a>
### color

```ml
function color(index)
```

Evaluates UI player settings `color` and returns `table[index]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Value tested by `index<0 or index>7` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L145)

<a id="function-function-mq3-client-ui-player-settings-create-function-create-source-src-mq3-client-ui-player-settings-ml-317987183"></a>
### create

```ml
function create(source)
```

Creates a `mq3.client.ui_player_settings.State` record. Assigns `source` from `source`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value used to initialize `State.source`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L140)

- [mq3.client.ui_player_settings.DrawCommand](Type-mq3-client-ui-player-settings-drawcommand-126187478.md) — struct
<a id="function-function-mq3-client-ui-player-settings-emit-function-emit-value-boundary-kind-name-text-number-x-y-width-height-retailactive-src-mq3-client-ui-player-settings-ml-234755341"></a>
### emit

```ml
function emit(value, boundary, kind, name, text, number, x, y, width, height, retailActive)
```

Appends a UI player settings action record to the queued engine requests.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI player settings record/storage; this routine assigns `value.actions`. |
| `boundary` | `dynamic` | — | Engine service boundary recorded on the queued action, such as renderer, audio or cvar. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI player settings resource. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the UI player settings path. |
| `number` | `dynamic` | — | Value used by `value.actions=value.actions+[HostAction(boundary,kind,name,text,number,x,y,width,height,not retailActive)]`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `emit`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `emit`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `emit`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `emit`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L137)

<a id="function-function-mq3-client-ui-player-settings-gamecodetoui-function-gamecodetoui-src-mq3-client-ui-player-settings-ml-1163053798"></a>
### gameCodeToUi

```ml
function gameCodeToUi()
```

Builds the UI player settings `gameCodeToUi` sequence from `[4,2,3,0,5,1,6]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L122)

<a id="function-function-mq3-client-ui-player-settings-handicapitems-function-handicapitems-src-mq3-client-ui-player-settings-ml-1043368722"></a>
### handicapItems

```ml
function handicapItems()
```

Lists the 20 UI player settings handicap items strings in their declared order, beginning with `"None"`, `"95"`, `"90"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L120)

- [mq3.client.ui_player_settings.HostAction](Type-mq3-client-ui-player-settings-hostaction-719199375.md) — struct
<a id="constant-constant-mq3-client-ui-player-settings-id-back-const-id-back-13-src-mq3-client-ui-player-settings-ml-905494743"></a>
### ID_BACK

```ml
const ID_BACK = 13
```

Event identifier of the Back control used to leave the player name, handicap, and color menu and return to its parent menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L19)

<a id="constant-constant-mq3-client-ui-player-settings-id-effects-const-id-effects-12-src-mq3-client-ui-player-settings-ml-393659260"></a>
### ID_EFFECTS

```ml
const ID_EFFECTS = 12
```

Menu control identifier routed to the effects action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L16)

<a id="constant-constant-mq3-client-ui-player-settings-id-handicap-const-id-handicap-11-src-mq3-client-ui-player-settings-ml-392081797"></a>
### ID_HANDICAP

```ml
const ID_HANDICAP = 11
```

Menu control identifier routed to the handicap action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L14)

<a id="constant-constant-mq3-client-ui-player-settings-id-model-const-id-model-14-src-mq3-client-ui-player-settings-ml-539032172"></a>
### ID_MODEL

```ml
const ID_MODEL = 14
```

Menu control identifier routed to the model action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L21)

<a id="constant-constant-mq3-client-ui-player-settings-id-name-const-id-name-10-src-mq3-client-ui-player-settings-ml-1553721784"></a>
### ID_NAME

```ml
const ID_NAME = 10
```

Menu control identifier routed to the name action by the menu event handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L12)

<a id="function-function-mq3-client-ui-player-settings-iscolor-function-iscolor-data-index-src-mq3-client-ui-player-settings-ml-476159566"></a>
### isColor

```ml
function isColor(data, index)
```

Computes `index+1<len(data) and data[index]==94 and data[index+1]!=94` for UI player settings `isColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence read at `data[index]`, `data[index+1]`. |
| `index` | `dynamic` | — | Value used by `return index+1<len(data) and data[index]==94 and data[index+1]!=94`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L149)

<a id="constant-constant-mq3-client-ui-player-settings-max-namelength-const-max-namelength-20-src-mq3-client-ui-player-settings-ml-1689016783"></a>
### MAX_NAMELENGTH

```ml
const MAX_NAMELENGTH = 20
```

Length limit used for a player or menu display name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L23)

<a id="function-function-mq3-client-ui-player-settings-playersettings-cache-function-playersettings-cache-value-retailactive-src-mq3-client-ui-player-settings-ml-407397140"></a>
### PlayerSettings_Cache

```ml
function PlayerSettings_Cache(value, retailActive)
```

PlayerSettings_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI player settings record/storage; this routine assigns `value.assets`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L281)

<a id="function-function-mq3-client-ui-player-settings-playersettings-draweffects-function-playersettings-draweffects-value-focus-retailactive-src-mq3-client-ui-player-settings-ml-414216980"></a>
### PlayerSettings_DrawEffects

```ml
function PlayerSettings_DrawEffects(value, focus, retailActive)
```

PlayerSettings_DrawEffects

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI player settings record/storage; this routine assigns `value.drawCommands`. |
| `focus` | `dynamic` | — | Value used by `if focus then style=style\|qmenu.UI_PULSE end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L199)

<a id="function-function-mq3-client-ui-player-settings-playersettings-drawhandicap-function-playersettings-drawhandicap-value-focus-retailactive-src-mq3-client-ui-player-settings-ml-2041816990"></a>
### PlayerSettings_DrawHandicap

```ml
function PlayerSettings_DrawHandicap(value, focus, retailActive)
```

PlayerSettings_DrawHandicap

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI player settings record/storage; this routine assigns `value.drawCommands`. |
| `focus` | `dynamic` | — | Value used by `if focus then style=style\|qmenu.UI_PULSE end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L191)

<a id="function-function-mq3-client-ui-player-settings-playersettings-drawname-function-playersettings-drawname-value-focus-retailactive-src-mq3-client-ui-player-settings-ml-61264592"></a>
### PlayerSettings_DrawName

```ml
function PlayerSettings_DrawName(value, focus, retailActive)
```

PlayerSettings_DrawName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI player settings record/storage; this routine assigns `value.drawCommands`. |
| `focus` | `dynamic` | — | Value used by `if focus then style=style\|qmenu.UI_PULSE end if`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L181)

<a id="function-function-mq3-client-ui-player-settings-playersettings-drawplayer-function-playersettings-drawplayer-value-model-retailactive-src-mq3-client-ui-player-settings-ml-996159589"></a>
### PlayerSettings_DrawPlayer

```ml
function PlayerSettings_DrawPlayer(value, model, retailActive)
```

PlayerSettings_DrawPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI player settings record/storage; this routine assigns `value.playerModel`. |
| `model` | `dynamic` | — | Value assigned to `value.playerModel`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L207)

<a id="function-function-mq3-client-ui-player-settings-playersettings-menuevent-function-playersettings-menuevent-value-id-event-retailactive-src-mq3-client-ui-player-settings-ml-1704063411"></a>
### PlayerSettings_MenuEvent

```ml
function PlayerSettings_MenuEvent(value, id, event, retailActive)
```

PlayerSettings_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI player settings record/storage; this routine assigns `value.cvarWrites`, `value.modelMenu`, `value.popped`. |
| `id` | `dynamic` | — | Value used by `if id==ID_HANDICAP then immediate=str(100-25*value.handicap)`. |
| `event` | `dynamic` | — | Event identifier compared with the supported activation/input events. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L244)

<a id="function-function-mq3-client-ui-player-settings-playersettings-menuinit-function-playersettings-menuinit-value-name-color1-model-handicap-retailactive-src-mq3-client-ui-player-settings-ml-1415609718"></a>
### PlayerSettings_MenuInit

```ml
function PlayerSettings_MenuInit(value, name, color1, model, handicap, retailActive)
```

PlayerSettings_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI player settings record/storage; this routine assigns `value.menu`, `value.actions`, `value.cvarWrites`, `value.assets` and additional values. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI player settings resource. |
| `color1` | `dynamic` | — | Value used by `PlayerSettings_SetMenuItems(value,name,color1,model,handicap)`. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this UI player settings operation. |
| `handicap` | `dynamic` | — | Value used by `PlayerSettings_SetMenuItems(value,name,color1,model,handicap)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L267)

<a id="function-function-mq3-client-ui-player-settings-playersettings-menukey-function-playersettings-menukey-value-key-cursorx-cursory-retailactive-src-mq3-client-ui-player-settings-ml-1059907116"></a>
### PlayerSettings_MenuKey

```ml
function PlayerSettings_MenuKey(value, key, cursorx, cursory, retailActive)
```

PlayerSettings_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.menu`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding UI player settings entry. |
| `cursorx` | `dynamic` | — | Value used by `return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)`. |
| `cursory` | `dynamic` | — | Value used by `return qmenu.Menu_DefaultKey(value.menu,key,cursorx,cursory)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L225)

<a id="function-function-mq3-client-ui-player-settings-playersettings-savechanges-function-playersettings-savechanges-value-retailactive-src-mq3-client-ui-player-settings-ml-436882608"></a>
### PlayerSettings_SaveChanges

```ml
function PlayerSettings_SaveChanges(value, retailActive)
```

PlayerSettings_SaveChanges

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI player settings record/storage; this routine assigns `value.cvarWrites`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L215)

<a id="function-function-mq3-client-ui-player-settings-playersettings-setmenuitems-function-playersettings-setmenuitems-value-name-color1-model-handicap-src-mq3-client-ui-player-settings-ml-1340257475"></a>
### PlayerSettings_SetMenuItems

```ml
function PlayerSettings_SetMenuItems(value, name, color1, model, handicap)
```

PlayerSettings_SetMenuItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI player settings record/storage; this routine assigns `value.name.buffer`, `value.name.cursor`, `value.effects`, `value.playerinfo` and additional values. |
| `name` | `dynamic` | — | Mutable UI player settings record/storage; this routine assigns `name.buffer`, `name.cursor`. |
| `color1` | `dynamic` | — | Value used by `c=numeric.trunc32(color1)-1`. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this UI player settings operation. |
| `handicap` | `dynamic` | — | Value used by `h=handicap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L235)

- [mq3.client.ui_player_settings.State](Type-mq3-client-ui-player-settings-state-674577228.md) — struct
<a id="function-function-mq3-client-ui-player-settings-ui-playersettingsmenu-function-ui-playersettingsmenu-value-name-color1-model-handicap-retailactive-src-mq3-client-ui-player-settings-ml-1648696094"></a>
### UI_PlayerSettingsMenu

```ml
function UI_PlayerSettingsMenu(value, name, color1, model, handicap, retailActive)
```

UI_PlayerSettingsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable UI player settings record/storage; this routine assigns `value.pushed`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI player settings resource. |
| `color1` | `dynamic` | — | Value used by `PlayerSettings_MenuInit(value,name,color1,model,handicap,retailActive)`. |
| `model` | `dynamic` | — | Model handle, asset or preview record used by this UI player settings operation. |
| `handicap` | `dynamic` | — | Value used by `PlayerSettings_MenuInit(value,name,color1,model,handicap,retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L290)

<a id="function-function-mq3-client-ui-player-settings-uitogamecode-function-uitogamecode-src-mq3-client-ui-player-settings-ml-2043921718"></a>
### uiToGameCode

```ml
function uiToGameCode()
```

Builds the UI player settings `uiToGameCode` sequence from `[4,6,2,3,1,5,7]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L124)

<a id="function-function-mq3-client-ui-player-settings-visiblenamecommands-function-visiblenamecommands-text-focus-basex-y-style-src-mq3-client-ui-player-settings-ml-1056592356"></a>
### visibleNameCommands

```ml
function visibleNameCommands(text, focus, basex, y, style)
```

Calls `mq3.client.ui_player_settings.color`, `mq3.client.ui_player_settings.isColor`, `mq3.client.ui_player_settings.DrawCommand` and additional helpers from UI player settings `visibleNameCommands`. The final path returns `rows`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text consumed or emitted by `visibleNameCommands` in the UI player settings path. |
| `focus` | `dynamic` | — | Value used by `if not focus and isColor(data,at) then n=data[at+1]-48`. |
| `basex` | `dynamic` | — | Value used by `x=basex`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `visibleNameCommands`. |
| `style` | `dynamic` | — | Value used by `else rows=rows+[DrawCommand("char",decode(bytes([data[at]])),x,y,8,16,style,current,"")]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_player_settings.ml#L169)
