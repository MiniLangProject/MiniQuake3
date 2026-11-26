# `mq3.client.cgame_players.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-players-ml-1793263463.md)

<a id="struct-struct-mq3-client-cgame-players-state-struct-state-src-mq3-client-cgame-players-ml-2125250015"></a>
## State

```ml
struct State
```

Stores client game players state, including `time`, `frameTime`, `gametype`, `localClientNum`, `renderingThirdPerson`, `shadows` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L295)

## Members

<a id="field-field-mq3-client-cgame-players-state-actions-actions-src-mq3-client-cgame-players-ml-1517323934"></a>
### actions

```ml
actions
```

Host requests queued while loading player media and submitting animated body parts and powerup effects, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L334)

<a id="field-field-mq3-client-cgame-players-state-animspeed-animspeed-src-mq3-client-cgame-players-ml-1174480226"></a>
### animSpeed

```ml
animSpeed
```

When constructing this record, `create` supplies `1` for this member. Used by `runLerpFrame` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L318)

<a id="field-field-mq3-client-cgame-players-state-clients-clients-src-mq3-client-cgame-players-ml-1793414022"></a>
### clients

```ml
clients
```

Client model, skin, identity, and animation information indexed by player slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L328)

<a id="field-field-mq3-client-cgame-players-state-drawfriend-drawfriend-src-mq3-client-cgame-players-ml-1311279850"></a>
### drawFriend

```ml
drawFriend
```

When constructing this record, `create` supplies `true` for this member. Used by `playerSprites` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L312)

<a id="field-field-mq3-client-cgame-players-state-enablebreath-enablebreath-src-mq3-client-cgame-players-ml-211855932"></a>
### enableBreath

```ml
enableBreath
```

When constructing this record, `create` supplies `false` for this member. Used by `breathPuffs` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L323)

<a id="field-field-mq3-client-cgame-players-state-enabledust-enabledust-src-mq3-client-cgame-players-ml-1388679728"></a>
### enableDust

```ml
enableDust
```

When constructing this record, `create` supplies `false` for this member. Used by `dustTrail` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L326)

<a id="field-field-mq3-client-cgame-players-state-files-files-src-mq3-client-cgame-players-ml-24097406"></a>
### files

```ml
files
```

When constructing this record, `create` supplies an empty list for this member. Used by `fileExists` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L331)

<a id="field-field-mq3-client-cgame-players-state-frametime-frametime-src-mq3-client-cgame-players-ml-1816518282"></a>
### frameTime

```ml
frameTime
```

Elapsed frame-time slot retained with the player-presentation state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L299)

<a id="field-field-mq3-client-cgame-players-state-gametype-gametype-src-mq3-client-cgame-players-ml-1351917954"></a>
### gametype

```ml
gametype
```

Game-rule identifier controlling team model skins and teammate marker sprites.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L301)

<a id="field-field-mq3-client-cgame-players-state-localclientnum-localclientnum-src-mq3-client-cgame-players-ml-1461133770"></a>
### localClientNum

```ml
localClientNum
```

When constructing this record, `create` supplies `0` for this member. Used by `breathPuffs` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L304)

<a id="field-field-mq3-client-cgame-players-state-noplayeranims-noplayeranims-src-mq3-client-cgame-players-ml-1527844990"></a>
### noPlayerAnims

```ml
noPlayerAnims
```

When constructing this record, `create` supplies `false` for this member. Used by `playerAnimation` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L315)

<a id="field-field-mq3-client-cgame-players-state-renderingthirdperson-renderingthirdperson-src-mq3-client-cgame-players-ml-531074566"></a>
### renderingThirdPerson

```ml
renderingThirdPerson
```

True while the camera uses a third-person, chase, or death view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L306)

<a id="field-field-mq3-client-cgame-players-state-shadows-shadows-src-mq3-client-cgame-players-ml-1424013270"></a>
### shadows

```ml
shadows
```

When constructing this record, `create` supplies `1` for this member. Used by `playerShadow` and `playerSplash` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L309)

<a id="field-field-mq3-client-cgame-players-state-swingspeed-swingspeed-src-mq3-client-cgame-players-ml-62427784"></a>
### swingSpeed

```ml
swingSpeed
```

When constructing this record, `create` supplies `0.3` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L320)

<a id="field-field-mq3-client-cgame-players-state-time-time-src-mq3-client-cgame-players-ml-1105499184"></a>
### time

```ml
time
```

Current client-game time in milliseconds used for player animation and player-attached effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L297)
