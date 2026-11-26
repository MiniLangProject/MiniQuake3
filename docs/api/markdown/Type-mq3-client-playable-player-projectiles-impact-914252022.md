# `mq3.client.playable_player_projectiles.Impact`

[Home](README.md) · [Source file](File-src-mq3-client-playable-player-projectiles-ml-210819166.md)

<a id="struct-struct-mq3-client-playable-player-projectiles-impact-struct-impact-src-mq3-client-playable-player-projectiles-ml-1138237299"></a>
## Impact

```ml
struct Impact
```

Stores playable player projectiles impact record, including `id`, `projectileId`, `classname`, `style`, `kind`, `point` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L106)

## Members

<a id="field-field-mq3-client-playable-player-projectiles-impact-at-at-src-mq3-client-playable-player-projectiles-ml-718699069"></a>
### at

```ml
at
```

When constructing this record, `addImpact` supplies `now` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L126)

<a id="field-field-mq3-client-playable-player-projectiles-impact-classname-classname-src-mq3-client-playable-player-projectiles-ml-1923565331"></a>
### classname

```ml
classname
```

Weapon classname copied from the projectile profile into its impact result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L112)

<a id="field-field-mq3-client-playable-player-projectiles-impact-damages-damages-src-mq3-client-playable-player-projectiles-ml-255388895"></a>
### damages

```ml
damages
```

When constructing this record, `addImpact` supplies `damages` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L124)

<a id="field-field-mq3-client-playable-player-projectiles-impact-id-id-src-mq3-client-playable-player-projectiles-ml-1596912365"></a>
### id

```ml
id
```

Stable effect identifier used to track or replace this projectile, particle, or mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L108)

<a id="field-field-mq3-client-playable-player-projectiles-impact-kind-kind-src-mq3-client-playable-player-projectiles-ml-323222671"></a>
### kind

```ml
kind
```

Effect or media category selecting the matching geometry, texture, or presentation behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L116)

<a id="field-field-mq3-client-playable-player-projectiles-impact-normal-normal-src-mq3-client-playable-player-projectiles-ml-1485355729"></a>
### normal

```ml
normal
```

Collision-plane normal at a player projectile's impact, used by its impact and explosion effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L120)

<a id="field-field-mq3-client-playable-player-projectiles-impact-point-point-src-mq3-client-playable-player-projectiles-ml-2050929135"></a>
### point

```ml
point
```

When constructing this record, `addImpact` supplies `copyPoint(point)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L118)

<a id="field-field-mq3-client-playable-player-projectiles-impact-projectileid-projectileid-src-mq3-client-playable-player-projectiles-ml-546304143"></a>
### projectileId

```ml
projectileId
```

Stable projectile identifier used to associate movement, trails, and impact presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L110)

<a id="field-field-mq3-client-playable-player-projectiles-impact-style-style-src-mq3-client-playable-player-projectiles-ml-387819395"></a>
### style

```ml
style
```

Projectile style retained at impact to select the corresponding explosion and hit presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L114)

<a id="field-field-mq3-client-playable-player-projectiles-impact-targetindex-targetindex-src-mq3-client-playable-player-projectiles-ml-1198864499"></a>
### targetIndex

```ml
targetIndex
```

Index identifying the selected target in the owning target collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L122)
