# `mq3.client.cgame_players.Action`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-players-ml-1793263463.md)

<a id="struct-struct-mq3-client-cgame-players-action-struct-action-src-mq3-client-cgame-players-ml-507511363"></a>
## Action

```ml
struct Action
```

Stores client game players queued engine action, including `boundary`, `kind`, `entity`, `name`, `value`, `origin` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L104)

## Members

<a id="field-field-mq3-client-cgame-players-action-boundary-boundary-src-mq3-client-cgame-players-ml-1214641055"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while loading player media and submitting animated body parts and powerup effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L107)

<a id="field-field-mq3-client-cgame-players-action-color-color-src-mq3-client-cgame-players-ml-1570337791"></a>
### color

```ml
color
```

Color components associated with the player render, light, or auxiliary-effect request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L121)

<a id="field-field-mq3-client-cgame-players-action-dispatched-dispatched-src-mq3-client-cgame-players-ml-965108217"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while loading player media and submitting animated body parts and powerup effects; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L124)

<a id="field-field-mq3-client-cgame-players-action-entity-entity-src-mq3-client-cgame-players-ml-246934737"></a>
### entity

```ml
entity
```

When constructing this record, `effect` supplies `entityNum` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L112)

<a id="field-field-mq3-client-cgame-players-action-kind-kind-src-mq3-client-cgame-players-ml-1768812375"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while loading player media and submitting animated body parts and powerup effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L110)

<a id="field-field-mq3-client-cgame-players-action-name-name-src-mq3-client-cgame-players-ml-87429453"></a>
### name

```ml
name
```

Model, skin, sound, shader, or player-effect resource named by the presentation action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L114)

<a id="field-field-mq3-client-cgame-players-action-origin-origin-src-mq3-client-cgame-players-ml-2008639127"></a>
### origin

```ml
origin
```

World-space position supplied with a player-model, powerup, trail, or sound operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L119)

<a id="field-field-mq3-client-cgame-players-action-value-value-src-mq3-client-cgame-players-ml-188774039"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while loading player media and submitting animated body parts and powerup effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L117)
