# `mq3.client.playable_enemy_projectiles.Projectile`

[Home](README.md) · [Source file](File-src-mq3-client-playable-enemy-projectiles-ml-602850091.md)

<a id="struct-struct-mq3-client-playable-enemy-projectiles-projectile-struct-projectile-src-mq3-client-playable-enemy-projectiles-ml-1813561783"></a>
## Projectile

```ml
struct Projectile
```

Stores playable enemy projectiles projectile record, including `id`, `attacker`, `origin`, `velocity`, `spawnedAt`, `expiresAt` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L23)

## Members

<a id="field-field-mq3-client-playable-enemy-projectiles-projectile-attacker-attacker-src-mq3-client-playable-enemy-projectiles-ml-472241488"></a>
### attacker

```ml
attacker
```

When constructing this record, `spawnOne` supplies `attacker` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L27)

<a id="field-field-mq3-client-playable-enemy-projectiles-projectile-damage-damage-src-mq3-client-playable-enemy-projectiles-ml-1676349252"></a>
### damage

```ml
damage
```

Damage amount applied or reported by the weapon, projectile, or hit result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L40)

<a id="field-field-mq3-client-playable-enemy-projectiles-projectile-expiresat-expiresat-src-mq3-client-playable-enemy-projectiles-ml-1914600902"></a>
### expiresAt

```ml
expiresAt
```

When constructing this record, `spawnOne` supplies `now+state.lifetime` for this member. Used by `updateWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L38)

<a id="field-field-mq3-client-playable-enemy-projectiles-projectile-id-id-src-mq3-client-playable-enemy-projectiles-ml-1638648472"></a>
### id

```ml
id
```

Stable effect identifier used to track or replace this projectile, particle, or mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L25)

<a id="field-field-mq3-client-playable-enemy-projectiles-projectile-origin-origin-src-mq3-client-playable-enemy-projectiles-ml-424176430"></a>
### origin

```ml
origin
```

Current world-space position advanced by each enemy-projectile simulation step and retained for expiration impacts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L30)

<a id="field-field-mq3-client-playable-enemy-projectiles-projectile-radius-radius-src-mq3-client-playable-enemy-projectiles-ml-2002206990"></a>
### radius

```ml
radius
```

Collision radius of this moving enemy projectile, used to expand player hit tests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L44)

<a id="field-field-mq3-client-playable-enemy-projectiles-projectile-side-side-src-mq3-client-playable-enemy-projectiles-ml-33788560"></a>
### side

```ml
side
```

When constructing this record, `spawnOne` supplies `side` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L42)

<a id="field-field-mq3-client-playable-enemy-projectiles-projectile-spawnedat-spawnedat-src-mq3-client-playable-enemy-projectiles-ml-398313718"></a>
### spawnedAt

```ml
spawnedAt
```

When constructing this record, `spawnOne` supplies `now` for this member. Used by `updateWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L35)

<a id="field-field-mq3-client-playable-enemy-projectiles-projectile-velocity-velocity-src-mq3-client-playable-enemy-projectiles-ml-25946148"></a>
### velocity

```ml
velocity
```

Linear rate of change of position used by movement or effect integration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L32)
