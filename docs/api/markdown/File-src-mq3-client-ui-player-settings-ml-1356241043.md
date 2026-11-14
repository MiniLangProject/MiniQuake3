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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L22)

<a id="function-function-mq3-client-ui-player-settings-bitmap-function-bitmap-name-id-x-y-flags-width-height-src-mq3-client-ui-player-settings-ml-826462485"></a>
### bitmap

```ml
function bitmap(name, id, x, y, flags, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L96)

<a id="function-function-mq3-client-ui-player-settings-cleanname-function-cleanname-text-src-mq3-client-ui-player-settings-ml-1401713421"></a>
### cleanName

```ml
function cleanName(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L32)

<a id="function-function-mq3-client-ui-player-settings-color-function-color-index-src-mq3-client-ui-player-settings-ml-578201534"></a>
### color

```ml
function color(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L30)

<a id="function-function-mq3-client-ui-player-settings-create-function-create-source-src-mq3-client-ui-player-settings-ml-317987183"></a>
### create

```ml
function create(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L27)

- [mq3.client.ui_player_settings.DrawCommand](Type-mq3-client-ui-player-settings-drawcommand-126187478.md) — struct
<a id="function-function-mq3-client-ui-player-settings-emit-function-emit-value-boundary-kind-name-text-number-x-y-width-height-retailactive-src-mq3-client-ui-player-settings-ml-234755341"></a>
### emit

```ml
function emit(value, boundary, kind, name, text, number, x, y, width, height, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L26)

<a id="function-function-mq3-client-ui-player-settings-gamecodetoui-function-gamecodetoui-src-mq3-client-ui-player-settings-ml-1163053798"></a>
### gameCodeToUi

```ml
function gameCodeToUi()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L24)

<a id="function-function-mq3-client-ui-player-settings-handicapitems-function-handicapitems-src-mq3-client-ui-player-settings-ml-1043368722"></a>
### handicapItems

```ml
function handicapItems()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L23)

- [mq3.client.ui_player_settings.HostAction](Type-mq3-client-ui-player-settings-hostaction-719199375.md) — struct
<a id="constant-constant-mq3-client-ui-player-settings-id-back-const-id-back-13-src-mq3-client-ui-player-settings-ml-905494743"></a>
### ID_BACK

```ml
const ID_BACK = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L14)

<a id="constant-constant-mq3-client-ui-player-settings-id-effects-const-id-effects-12-src-mq3-client-ui-player-settings-ml-393659260"></a>
### ID_EFFECTS

```ml
const ID_EFFECTS = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L13)

<a id="constant-constant-mq3-client-ui-player-settings-id-handicap-const-id-handicap-11-src-mq3-client-ui-player-settings-ml-392081797"></a>
### ID_HANDICAP

```ml
const ID_HANDICAP = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L12)

<a id="constant-constant-mq3-client-ui-player-settings-id-model-const-id-model-14-src-mq3-client-ui-player-settings-ml-539032172"></a>
### ID_MODEL

```ml
const ID_MODEL = 14
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L15)

<a id="constant-constant-mq3-client-ui-player-settings-id-name-const-id-name-10-src-mq3-client-ui-player-settings-ml-1553721784"></a>
### ID_NAME

```ml
const ID_NAME = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L11)

<a id="function-function-mq3-client-ui-player-settings-iscolor-function-iscolor-data-index-src-mq3-client-ui-player-settings-ml-476159566"></a>
### isColor

```ml
function isColor(data, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L31)

<a id="constant-constant-mq3-client-ui-player-settings-max-namelength-const-max-namelength-20-src-mq3-client-ui-player-settings-ml-1689016783"></a>
### MAX_NAMELENGTH

```ml
const MAX_NAMELENGTH = 20
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L16)

<a id="function-function-mq3-client-ui-player-settings-playersettings-cache-function-playersettings-cache-value-retailactive-src-mq3-client-ui-player-settings-ml-407397140"></a>
### PlayerSettings_Cache

```ml
function PlayerSettings_Cache(value, retailActive)
```

PlayerSettings_Cache

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L111)

<a id="function-function-mq3-client-ui-player-settings-playersettings-draweffects-function-playersettings-draweffects-value-focus-retailactive-src-mq3-client-ui-player-settings-ml-414216980"></a>
### PlayerSettings_DrawEffects

```ml
function PlayerSettings_DrawEffects(value, focus, retailActive)
```

PlayerSettings_DrawEffects

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `focus` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L64)

<a id="function-function-mq3-client-ui-player-settings-playersettings-drawhandicap-function-playersettings-drawhandicap-value-focus-retailactive-src-mq3-client-ui-player-settings-ml-2041816990"></a>
### PlayerSettings_DrawHandicap

```ml
function PlayerSettings_DrawHandicap(value, focus, retailActive)
```

PlayerSettings_DrawHandicap

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `focus` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L59)

<a id="function-function-mq3-client-ui-player-settings-playersettings-drawname-function-playersettings-drawname-value-focus-retailactive-src-mq3-client-ui-player-settings-ml-61264592"></a>
### PlayerSettings_DrawName

```ml
function PlayerSettings_DrawName(value, focus, retailActive)
```

PlayerSettings_DrawName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `focus` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L52)

<a id="function-function-mq3-client-ui-player-settings-playersettings-drawplayer-function-playersettings-drawplayer-value-model-retailactive-src-mq3-client-ui-player-settings-ml-996159589"></a>
### PlayerSettings_DrawPlayer

```ml
function PlayerSettings_DrawPlayer(value, model, retailActive)
```

PlayerSettings_DrawPlayer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L69)

<a id="function-function-mq3-client-ui-player-settings-playersettings-menuevent-function-playersettings-menuevent-value-id-event-retailactive-src-mq3-client-ui-player-settings-ml-1704063411"></a>
### PlayerSettings_MenuEvent

```ml
function PlayerSettings_MenuEvent(value, id, event, retailActive)
```

PlayerSettings_MenuEvent

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L90)

<a id="function-function-mq3-client-ui-player-settings-playersettings-menuinit-function-playersettings-menuinit-value-name-color1-model-handicap-retailactive-src-mq3-client-ui-player-settings-ml-1415609718"></a>
### PlayerSettings_MenuInit

```ml
function PlayerSettings_MenuInit(value, name, color1, model, handicap, retailActive)
```

PlayerSettings_MenuInit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `color1` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `handicap` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L99)

<a id="function-function-mq3-client-ui-player-settings-playersettings-menukey-function-playersettings-menukey-value-key-cursorx-cursory-retailactive-src-mq3-client-ui-player-settings-ml-1059907116"></a>
### PlayerSettings_MenuKey

```ml
function PlayerSettings_MenuKey(value, key, cursorx, cursory, retailActive)
```

PlayerSettings_MenuKey

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `cursorx` | `dynamic` | — |  |
| `cursory` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L80)

<a id="function-function-mq3-client-ui-player-settings-playersettings-savechanges-function-playersettings-savechanges-value-retailactive-src-mq3-client-ui-player-settings-ml-436882608"></a>
### PlayerSettings_SaveChanges

```ml
function PlayerSettings_SaveChanges(value, retailActive)
```

PlayerSettings_SaveChanges

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L75)

<a id="function-function-mq3-client-ui-player-settings-playersettings-setmenuitems-function-playersettings-setmenuitems-value-name-color1-model-handicap-src-mq3-client-ui-player-settings-ml-1340257475"></a>
### PlayerSettings_SetMenuItems

```ml
function PlayerSettings_SetMenuItems(value, name, color1, model, handicap)
```

PlayerSettings_SetMenuItems

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `color1` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `handicap` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L85)

- [mq3.client.ui_player_settings.State](Type-mq3-client-ui-player-settings-state-674577228.md) — struct
<a id="function-function-mq3-client-ui-player-settings-ui-playersettingsmenu-function-ui-playersettingsmenu-value-name-color1-model-handicap-retailactive-src-mq3-client-ui-player-settings-ml-1648696094"></a>
### UI_PlayerSettingsMenu

```ml
function UI_PlayerSettingsMenu(value, name, color1, model, handicap, retailActive)
```

UI_PlayerSettingsMenu

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `color1` | `dynamic` | — |  |
| `model` | `dynamic` | — |  |
| `handicap` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L114)

<a id="function-function-mq3-client-ui-player-settings-uitogamecode-function-uitogamecode-src-mq3-client-ui-player-settings-ml-2043921718"></a>
### uiToGameCode

```ml
function uiToGameCode()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L25)

<a id="function-function-mq3-client-ui-player-settings-visiblenamecommands-function-visiblenamecommands-text-focus-basex-y-style-src-mq3-client-ui-player-settings-ml-1056592356"></a>
### visibleNameCommands

```ml
function visibleNameCommands(text, focus, basex, y, style)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `focus` | `dynamic` | — |  |
| `basex` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `style` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L43)
