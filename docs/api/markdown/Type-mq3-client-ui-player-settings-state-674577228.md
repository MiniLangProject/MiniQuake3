# `mq3.client.ui_player_settings.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-player-settings-ml-1356241043.md)

<a id="struct-struct-mq3-client-ui-player-settings-state-struct-state-src-mq3-client-ui-player-settings-ml-560008227"></a>
## State

```ml
struct State
```

Stores UI player settings state, including `source`, `menu`, `name`, `handicap`, `effects`, `currentFx` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L75)

## Members

<a id="field-field-mq3-client-ui-player-settings-state-actions-actions-src-mq3-client-ui-player-settings-ml-997843478"></a>
### actions

```ml
actions
```

Host requests queued while saving player identity and color settings or drawing the player preview, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L99)

<a id="field-field-mq3-client-ui-player-settings-state-assets-assets-src-mq3-client-ui-player-settings-ml-806559056"></a>
### assets

```ml
assets
```

Media resources retained for registering and drawing the artwork used by the player name, handicap, and color menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L96)

<a id="field-field-mq3-client-ui-player-settings-state-currentfx-currentfx-src-mq3-client-ui-player-settings-ml-197777482"></a>
### currentFx

```ml
currentFx
```

Additional effect-selection slot initialized to zero; current color drawing and saving use the effects field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L89)

<a id="field-field-mq3-client-ui-player-settings-state-cvarwrites-cvarwrites-src-mq3-client-ui-player-settings-ml-1688812346"></a>
### cvarWrites

```ml
cvarWrites
```

Cvar name/value changes queued by the player name, handicap, and color menu for the host to apply.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L101)

<a id="field-field-mq3-client-ui-player-settings-state-drawcommands-drawcommands-src-mq3-client-ui-player-settings-ml-149742774"></a>
### drawCommands

```ml
drawCommands
```

Drawing records accumulated for the player-settings labels, editable name, effects selector, and preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L110)

<a id="field-field-mq3-client-ui-player-settings-state-effects-effects-src-mq3-client-ui-player-settings-ml-871333450"></a>
### effects

```ml
effects
```

UI palette index for the selected effects color; converted to the game's color code when saving color1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L86)

<a id="field-field-mq3-client-ui-player-settings-state-frametime-frametime-src-mq3-client-ui-player-settings-ml-76340298"></a>
### frametime

```ml
frametime
```

Elapsed client time in milliseconds since the preceding frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L114)

<a id="field-field-mq3-client-ui-player-settings-state-handicap-handicap-src-mq3-client-ui-player-settings-ml-438005350"></a>
### handicap

```ml
handicap
```

Player handicap setting used by the user-info and team-display paths.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L83)

<a id="field-field-mq3-client-ui-player-settings-state-menu-menu-src-mq3-client-ui-player-settings-ml-2020922204"></a>
### menu

```ml
menu
```

When constructing this record, `create` supplies `qmenu.menu(true,true)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L79)

<a id="field-field-mq3-client-ui-player-settings-state-modelmenu-modelmenu-src-mq3-client-ui-player-settings-ml-1465363002"></a>
### modelMenu

```ml
modelMenu
```

True after saving current player settings and requesting the player-model selection menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L107)

<a id="field-field-mq3-client-ui-player-settings-state-name-name-src-mq3-client-ui-player-settings-ml-1935937060"></a>
### name

```ml
name
```

Player display name currently edited by the player-settings menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L81)

<a id="field-field-mq3-client-ui-player-settings-state-playerinfo-playerinfo-src-mq3-client-ui-player-settings-ml-193070600"></a>
### playerinfo

```ml
playerinfo
```

When constructing this record, `create` supplies `players.create()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L93)

<a id="field-field-mq3-client-ui-player-settings-state-playermodel-playermodel-src-mq3-client-ui-player-settings-ml-1907425482"></a>
### playerModel

```ml
playerModel
```

Model resource selected for the player presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L91)

<a id="field-field-mq3-client-ui-player-settings-state-popped-popped-src-mq3-client-ui-player-settings-ml-352870194"></a>
### popped

```ml
popped
```

Records a request to remove the player name, handicap, and color menu from the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L103)

<a id="field-field-mq3-client-ui-player-settings-state-pushed-pushed-src-mq3-client-ui-player-settings-ml-1003490320"></a>
### pushed

```ml
pushed
```

Records that the player name, handicap, and color menu has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L105)

<a id="field-field-mq3-client-ui-player-settings-state-realtime-realtime-src-mq3-client-ui-player-settings-ml-59009296"></a>
### realtime

```ml
realtime
```

UI timestamp in milliseconds used to animate the player-settings menu and its preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L112)

<a id="field-field-mq3-client-ui-player-settings-state-source-source-src-mq3-client-ui-player-settings-ml-129861028"></a>
### source

```ml
source
```

When constructing this record, `create` supplies `source` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_player_settings.ml#L77)
