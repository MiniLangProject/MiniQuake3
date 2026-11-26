# `mq3.client.playable_enemy_projectiles.Impact`

[Home](README.md) · [Source file](File-src-mq3-client-playable-enemy-projectiles-ml-602850091.md)

<a id="struct-struct-mq3-client-playable-enemy-projectiles-impact-struct-impact-src-mq3-client-playable-enemy-projectiles-ml-1078565911"></a>
## Impact

```ml
struct Impact
```

Stores playable enemy projectiles impact record, including `projectileId`, `attacker`, `kind`, `point`, `normal`, `damage` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L60)

## Members

<a id="field-field-mq3-client-playable-enemy-projectiles-impact-at-at-src-mq3-client-playable-enemy-projectiles-ml-1494313595"></a>
### at

```ml
at
```

When constructing this record, `appendImpact` supplies `now` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L76)

<a id="field-field-mq3-client-playable-enemy-projectiles-impact-attacker-attacker-src-mq3-client-playable-enemy-projectiles-ml-1681046927"></a>
### attacker

```ml
attacker
```

When constructing this record, `appendImpact` supplies `projectile.attacker` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L64)

<a id="field-field-mq3-client-playable-enemy-projectiles-impact-damage-damage-src-mq3-client-playable-enemy-projectiles-ml-1892729059"></a>
### damage

```ml
damage
```

Damage amount applied or reported by the weapon, projectile, or hit result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L72)

<a id="field-field-mq3-client-playable-enemy-projectiles-impact-kind-kind-src-mq3-client-playable-enemy-projectiles-ml-1651676069"></a>
### kind

```ml
kind
```

Effect or media category selecting the matching geometry, texture, or presentation behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L66)

<a id="field-field-mq3-client-playable-enemy-projectiles-impact-normal-normal-src-mq3-client-playable-enemy-projectiles-ml-487313611"></a>
### normal

```ml
normal
```

Collision-plane normal at an enemy projectile impact, forwarded to impact presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L70)

<a id="field-field-mq3-client-playable-enemy-projectiles-impact-point-point-src-mq3-client-playable-enemy-projectiles-ml-604366105"></a>
### point

```ml
point
```

When constructing this record, `appendImpact` supplies `copyPoint(point)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L68)

<a id="field-field-mq3-client-playable-enemy-projectiles-impact-projectileid-projectileid-src-mq3-client-playable-enemy-projectiles-ml-944292709"></a>
### projectileId

```ml
projectileId
```

Stable projectile identifier used to associate movement, trails, and impact presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L62)

<a id="field-field-mq3-client-playable-enemy-projectiles-impact-side-side-src-mq3-client-playable-enemy-projectiles-ml-339624879"></a>
### side

```ml
side
```

When constructing this record, `appendImpact` supplies `projectile.side` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L74)
