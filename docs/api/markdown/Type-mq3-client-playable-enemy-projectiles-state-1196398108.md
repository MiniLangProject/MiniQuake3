# `mq3.client.playable_enemy_projectiles.State`

[Home](README.md) · [Source file](File-src-mq3-client-playable-enemy-projectiles-ml-602850091.md)

<a id="struct-struct-mq3-client-playable-enemy-projectiles-state-struct-state-src-mq3-client-playable-enemy-projectiles-ml-1676361947"></a>
## State

```ml
struct State
```

Stores playable enemy projectiles state, including `projectiles`, `trails`, `impacts`, `nextId`, `lastTime`, `lastSpawnTime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L79)

## Members

<a id="field-field-mq3-client-playable-enemy-projectiles-state-damagethisframe-damagethisframe-src-mq3-client-playable-enemy-projectiles-ml-510401586"></a>
### damageThisFrame

```ml
damageThisFrame
```

When constructing this record, `create` supplies `0` for this member. Used by `appendImpact` and `updateWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L120)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-impacts-impacts-src-mq3-client-playable-enemy-projectiles-ml-213950918"></a>
### impacts

```ml
impacts
```

When constructing this record, `create` supplies an empty list for this member. Used by `appendImpact` and `updateWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L88)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-lastspawntime-lastspawntime-src-mq3-client-playable-enemy-projectiles-ml-1138192426"></a>
### lastSpawnTime

```ml
lastSpawnTime
```

When constructing this record, `create` supplies `-1` for this member. Used by `spawnAttacksFromMuzzles` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L97)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-lasttime-lasttime-src-mq3-client-playable-enemy-projectiles-ml-1220234912"></a>
### lastTime

```ml
lastTime
```

When constructing this record, `create` supplies `now` for this member. Used by `spawnAttacksFromMuzzles` and `updateWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L94)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-lifetime-lifetime-src-mq3-client-playable-enemy-projectiles-ml-1081815140"></a>
### lifetime

```ml
lifetime
```

When constructing this record, `create` supplies `lifetime` for this member. Used by `spawnOne` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L103)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-nextid-nextid-src-mq3-client-playable-enemy-projectiles-ml-2069530266"></a>
### nextId

```ml
nextId
```

When constructing this record, `create` supplies `0` for this member. Used by `spawnOne` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L91)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-playermaxs-playermaxs-src-mq3-client-playable-enemy-projectiles-ml-534041794"></a>
### playerMaxs

```ml
playerMaxs
```

When constructing this record, `create` supplies `copyPoint(playerMaxs)` for this member. Used by `playerFraction` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L114)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-playermins-playermins-src-mq3-client-playable-enemy-projectiles-ml-1744416730"></a>
### playerMins

```ml
playerMins
```

When constructing this record, `create` supplies `copyPoint(playerMins)` for this member. Used by `playerFraction` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L111)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-playerradius-playerradius-src-mq3-client-playable-enemy-projectiles-ml-1060501516"></a>
### playerRadius

```ml
playerRadius
```

When constructing this record, `create` supplies `numeric.f32(playerRadius)` for this member. Used by `playerFraction` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L117)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-playershape-playershape-src-mq3-client-playable-enemy-projectiles-ml-286178138"></a>
### playerShape

```ml
playerShape
```

When constructing this record, `create` supplies `playerShape` for this member. Used by `playerFraction` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L108)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-projectiles-projectiles-src-mq3-client-playable-enemy-projectiles-ml-32787102"></a>
### projectiles

```ml
projectiles
```

When constructing this record, `create` supplies an empty list for this member. Used by `spawnOne` and `updateWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L82)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-radius-radius-src-mq3-client-playable-enemy-projectiles-ml-1870683898"></a>
### radius

```ml
radius
```

Default collision radius copied into newly spawned enemy projectiles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L105)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-speed-speed-src-mq3-client-playable-enemy-projectiles-ml-1541906382"></a>
### speed

```ml
speed
```

When constructing this record, `create` supplies `numeric.f32(speed)` for this member. Used by `spawnOne` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L100)

<a id="field-field-mq3-client-playable-enemy-projectiles-state-trails-trails-src-mq3-client-playable-enemy-projectiles-ml-275664228"></a>
### trails

```ml
trails
```

When constructing this record, `create` supplies an empty list for this member. Used by `updateWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L85)
