# `mq3.client.cgame_players.Entity`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-players-ml-1793263463.md)

<a id="struct-struct-mq3-client-cgame-players-entity-struct-entity-src-mq3-client-cgame-players-ml-1177292575"></a>
## Entity

```ml
struct Entity
```

Stores client game players entity record, including `number`, `clientNum`, `eFlags`, `powerups`, `legsAnim`, `torsoAnim` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L236)

## Members

<a id="field-field-mq3-client-cgame-players-entity-angles-angles-src-mq3-client-cgame-players-ml-1263384698"></a>
### angles

```ml
angles
```

Euler orientation used to place or animate the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L254)

<a id="field-field-mq3-client-cgame-players-entity-clientnum-clientnum-src-mq3-client-cgame-players-ml-847266990"></a>
### clientNum

```ml
clientNum
```

Index into the player client-information table used to select models, skins, and animations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L240)

<a id="field-field-mq3-client-cgame-players-entity-dusttrailtime-dusttrailtime-src-mq3-client-cgame-players-ml-1511474038"></a>
### dustTrailTime

```ml
dustTrailTime
```

Last time a running player's ground-contact dust effect was emitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L264)

<a id="field-field-mq3-client-cgame-players-entity-eflags-eflags-src-mq3-client-cgame-players-ml-1460959810"></a>
### eFlags

```ml
eFlags
```

When constructing this record, `entity` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L242)

<a id="field-field-mq3-client-cgame-players-entity-flag-flag-src-mq3-client-cgame-players-ml-1521991298"></a>
### flag

```ml
flag
```

When constructing this record, `entity` supplies `lerpFrame()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L270)

<a id="field-field-mq3-client-cgame-players-entity-generic1-generic1-src-mq3-client-cgame-players-ml-1388496558"></a>
### generic1

```ml
generic1
```

When constructing this record, `entity` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L250)

<a id="field-field-mq3-client-cgame-players-entity-legs-legs-src-mq3-client-cgame-players-ml-1065893140"></a>
### legs

```ml
legs
```

Animation and interpolation state for the player's legs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L266)

<a id="field-field-mq3-client-cgame-players-entity-legsanim-legsanim-src-mq3-client-cgame-players-ml-1292139026"></a>
### legsAnim

```ml
legsAnim
```

When constructing this record, `entity` supplies `LEGS_IDLE` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L246)

<a id="field-field-mq3-client-cgame-players-entity-number-number-src-mq3-client-cgame-players-ml-16471420"></a>
### number

```ml
number
```

When constructing this record, `entity` supplies `number` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L238)

<a id="field-field-mq3-client-cgame-players-entity-origin-origin-src-mq3-client-cgame-players-ml-1931802002"></a>
### origin

```ml
origin
```

Interpolated world-space player position used for body models and attached effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L252)

<a id="field-field-mq3-client-cgame-players-entity-paindirection-paindirection-src-mq3-client-cgame-players-ml-1358368934"></a>
### painDirection

```ml
painDirection
```

Alternating direction selector used for the player's pain animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L260)

<a id="field-field-mq3-client-cgame-players-entity-paintime-paintime-src-mq3-client-cgame-players-ml-1417177056"></a>
### painTime

```ml
painTime
```

Client timestamp of the last pain reaction, used to animate the flinch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L258)

<a id="field-field-mq3-client-cgame-players-entity-powerups-powerups-src-mq3-client-cgame-players-ml-1685156848"></a>
### powerups

```ml
powerups
```

Entity powerup bitmask used for haste animation, flag attachments, and player visual effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L244)

<a id="field-field-mq3-client-cgame-players-entity-torso-torso-src-mq3-client-cgame-players-ml-107411550"></a>
### torso

```ml
torso
```

Animation and interpolation state for the player's torso.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L268)

<a id="field-field-mq3-client-cgame-players-entity-torsoanim-torsoanim-src-mq3-client-cgame-players-ml-1677406594"></a>
### torsoAnim

```ml
torsoAnim
```

When constructing this record, `entity` supplies `11` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L248)

<a id="field-field-mq3-client-cgame-players-entity-trailtime-trailtime-src-mq3-client-cgame-players-ml-606452498"></a>
### trailTime

```ml
trailTime
```

Last trail-emission time, allowing missile trails to catch up across dropped packets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L262)

<a id="field-field-mq3-client-cgame-players-entity-velocity-velocity-src-mq3-client-cgame-players-ml-1712037356"></a>
### velocity

```ml
velocity
```

Linear rate of change of position used by movement or effect integration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_players.ml#L256)
