# `mq3.client.ui_sp_level.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-sp-level-ml-908068758.md)

<a id="struct-struct-mq3-client-ui-sp-level-state-struct-state-src-mq3-client-ui-sp-level-ml-316368383"></a>
## State

```ml
struct State
```

Stores UI sp level state, including `data`, `selectedArenaSet`, `selectedArena`, `currentSet`, `currentGame`, `trainingTier` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L112)

## Members

<a id="field-field-mq3-client-ui-sp-level-state-actions-actions-src-mq3-client-ui-sp-level-ml-930108528"></a>
### actions

```ml
actions
```

Host requests queued while selecting an unlocked arena and presenting its bots and best result, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L173)

<a id="field-field-mq3-client-ui-sp-level-state-awardlevels-awardlevels-src-mq3-client-ui-sp-level-ml-813809492"></a>
### awardLevels

```ml
awardLevels
```

When constructing this record, `create` supplies `[0,0,0,0,0,0]` for this member. Used by `menuDraw` and `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L160)

<a id="field-field-mq3-client-ui-sp-level-state-awardsounds-awardsounds-src-mq3-client-ui-sp-level-ml-903588920"></a>
### awardSounds

```ml
awardSounds
```

Sound resources selected for the award event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L162)

<a id="field-field-mq3-client-ui-sp-level-state-bots-bots-src-mq3-client-ui-sp-level-ml-1372663060"></a>
### bots

```ml
bots
```

When constructing this record, `create` supplies an empty list for this member. Used by `setBots` and `menuDraw` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L152)

<a id="field-field-mq3-client-ui-sp-level-state-cacheassets-cacheassets-src-mq3-client-ui-sp-level-ml-1578200676"></a>
### cacheAssets

```ml
cacheAssets
```

When constructing this record, `create` supplies an empty list for this member. Used by `cache` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L170)

<a id="field-field-mq3-client-ui-sp-level-state-cached-cached-src-mq3-client-ui-sp-level-ml-674634488"></a>
### cached

```ml
cached
```

True once the module's required media has been cached or registered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L167)

<a id="field-field-mq3-client-ui-sp-level-state-currentgame-currentgame-src-mq3-client-ui-sp-level-ml-1140185604"></a>
### currentGame

```ml
currentGame
```

When constructing this record, `create` supplies `0` for this member. Used by `init` and `spLevelMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L127)

<a id="field-field-mq3-client-ui-sp-level-state-currentset-currentset-src-mq3-client-ui-sp-level-ml-1819331654"></a>
### currentSet

```ml
currentSet
```

When constructing this record, `create` supplies `0` for this member. Used by `setBots` and `setMenuArena` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L124)

<a id="field-field-mq3-client-ui-sp-level-state-cursor-cursor-src-mq3-client-ui-sp-level-ml-105521028"></a>
### cursor

```ml
cursor
```

When constructing this record, `create` supplies `ID_NEXT` for this member. Used by `spLevelMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L185)

<a id="field-field-mq3-client-ui-sp-level-state-cvars-cvars-src-mq3-client-ui-sp-level-ml-1489229048"></a>
### cvars

```ml
cvars
```

Configuration-variable values exposed to the native UI implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L175)

<a id="field-field-mq3-client-ui-sp-level-state-data-data-src-mq3-client-ui-sp-level-ml-1708710340"></a>
### data

```ml
data
```

When constructing this record, `create` supplies `data` for this member. Used by `cvar` and `setCvar` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L115)

<a id="field-field-mq3-client-ui-sp-level-state-finaltier-finaltier-src-mq3-client-ui-sp-level-ml-1179090440"></a>
### finalTier

```ml
finalTier
```

When constructing this record, `create` supplies `0` for this member. Used by `setMenuItems` and `levelEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L133)

<a id="field-field-mq3-client-ui-sp-level-state-keycatcher-keycatcher-src-mq3-client-ui-sp-level-ml-875348622"></a>
### keyCatcher

```ml
keyCatcher
```

Input-capture bitmask selecting which client subsystem currently receives key events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L192)

<a id="field-field-mq3-client-ui-sp-level-state-maps-maps-src-mq3-client-ui-sp-level-ml-2065366462"></a>
### maps

```ml
maps
```

When constructing this record, `create` supplies `[emptyMap(46),emptyMap(186),emptyMap(326),emptyMap(466)]` for this member. Used by `setMenuArena` and `clearExtraMaps` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L149)

<a id="field-field-mq3-client-ui-sp-level-state-maxtier-maxtier-src-mq3-client-ui-sp-level-ml-1403174660"></a>
### maxTier

```ml
maxTier
```

When constructing this record, `create` supplies `0` for this member. Used by `rightArrowEvent` and `spLevelMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L139)

<a id="field-field-mq3-client-ui-sp-level-state-menuevents-menuevents-src-mq3-client-ui-sp-level-ml-1140081680"></a>
### menuEvents

```ml
menuEvents
```

Menu-stack and selection events queued for the host adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L177)

<a id="field-field-mq3-client-ui-sp-level-state-mintier-mintier-src-mq3-client-ui-sp-level-ml-1849220780"></a>
### minTier

```ml
minTier
```

When constructing this record, `create` supplies `0` for this member. Used by `leftArrowEvent` and `spLevelMenu` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L136)

<a id="field-field-mq3-client-ui-sp-level-state-nummaps-nummaps-src-mq3-client-ui-sp-level-ml-995948352"></a>
### numMaps

```ml
numMaps
```

When constructing this record, `create` supplies `0` for this member. Used by `setMenuItems` and `menuDraw` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L145)

<a id="field-field-mq3-client-ui-sp-level-state-playermodel-playermodel-src-mq3-client-ui-sp-level-ml-836245732"></a>
### playerModel

```ml
playerModel
```

Model resource selected for the player presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L154)

<a id="field-field-mq3-client-ui-sp-level-state-playername-playername-src-mq3-client-ui-sp-level-ml-1862564992"></a>
### playerName

```ml
playerName
```

When constructing this record, `create` supplies an empty string for this member. Used by `menuDraw` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L188)

<a id="field-field-mq3-client-ui-sp-level-state-playerpic-playerpic-src-mq3-client-ui-sp-level-ml-286229068"></a>
### playerPic

```ml
playerPic
```

When constructing this record, `create` supplies an empty string for this member. Used by `menuDraw` and `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L157)

<a id="field-field-mq3-client-ui-sp-level-state-pushed-pushed-src-mq3-client-ui-sp-level-ml-308381918"></a>
### pushed

```ml
pushed
```

Records that the single-player arena selection menu has been opened on the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L190)

<a id="field-field-mq3-client-ui-sp-level-state-realtime-realtime-src-mq3-client-ui-sp-level-ml-201925902"></a>
### realtime

```ml
realtime
```

UI timestamp in milliseconds used to pulse and animate the single-player arena selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L182)

<a id="field-field-mq3-client-ui-sp-level-state-reinit-reinit-src-mq3-client-ui-sp-level-ml-1377468090"></a>
### reinit

```ml
reinit
```

When constructing this record, `create` supplies `false` for this member. Used by `menuDraw` and `init` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L165)

<a id="field-field-mq3-client-ui-sp-level-state-retailactive-retailactive-src-mq3-client-ui-sp-level-ml-530138178"></a>
### retailActive

```ml
retailActive
```

True when the retail QVM owns the single-player arena selection menu, so the native observer records requests without emitting duplicate host effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L180)

<a id="field-field-mq3-client-ui-sp-level-state-selectedarena-selectedarena-src-mq3-client-ui-sp-level-ml-956621500"></a>
### selectedArena

```ml
selectedArena
```

When constructing this record, `create` supplies `0` for this member. Used by `setMenuItems` and `levelEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L121)

<a id="field-field-mq3-client-ui-sp-level-state-selectedarenainfo-selectedarenainfo-src-mq3-client-ui-sp-level-ml-105642376"></a>
### selectedArenaInfo

```ml
selectedArenaInfo
```

When constructing this record, `create` supplies an empty string for this member. Used by `setBots` and `setMenuItems` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L142)

<a id="field-field-mq3-client-ui-sp-level-state-selectedarenaset-selectedarenaset-src-mq3-client-ui-sp-level-ml-703420308"></a>
### selectedArenaSet

```ml
selectedArenaSet
```

When constructing this record, `create` supplies `0` for this member. Used by `setBots` and `setMenuArena` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L118)

<a id="field-field-mq3-client-ui-sp-level-state-trainingtier-trainingtier-src-mq3-client-ui-sp-level-ml-1579595652"></a>
### trainingTier

```ml
trainingTier
```

When constructing this record, `create` supplies `-1` for this member. Used by `setMenuItems` and `levelEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_sp_level.ml#L130)
