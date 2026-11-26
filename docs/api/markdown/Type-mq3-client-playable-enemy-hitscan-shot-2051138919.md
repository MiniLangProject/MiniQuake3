# `mq3.client.playable_enemy_hitscan.Shot`

[Home](README.md) · [Source file](File-src-mq3-client-playable-enemy-hitscan-ml-260885231.md)

<a id="struct-struct-mq3-client-playable-enemy-hitscan-shot-struct-shot-src-mq3-client-playable-enemy-hitscan-ml-162312159"></a>
## Shot

```ml
struct Shot
```

Stores playable enemy hitscan shot record, including `attacker`, `start`, `endPoint`, `normal`, `worldHit`, `playerHit` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L12)

## Members

<a id="field-field-mq3-client-playable-enemy-hitscan-shot-at-at-src-mq3-client-playable-enemy-hitscan-ml-1127844285"></a>
### at

```ml
at
```

When constructing this record, `fireWithTrace` supplies `now` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L30)

<a id="field-field-mq3-client-playable-enemy-hitscan-shot-attacker-attacker-src-mq3-client-playable-enemy-hitscan-ml-1219544049"></a>
### attacker

```ml
attacker
```

When constructing this record, `fireWithTrace` supplies `event.attacker` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L14)

<a id="field-field-mq3-client-playable-enemy-hitscan-shot-damage-damage-src-mq3-client-playable-enemy-hitscan-ml-2135648149"></a>
### damage

```ml
damage
```

Damage amount applied or reported by the weapon, projectile, or hit result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L26)

<a id="field-field-mq3-client-playable-enemy-hitscan-shot-endpoint-endpoint-src-mq3-client-playable-enemy-hitscan-ml-78974137"></a>
### endPoint

```ml
endPoint
```

World-space endpoint of the trace, beam, or projectile presentation segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L18)

<a id="field-field-mq3-client-playable-enemy-hitscan-shot-normal-normal-src-mq3-client-playable-enemy-hitscan-ml-505261765"></a>
### normal

```ml
normal
```

Surface normal returned when an enemy's hitscan trace strikes the world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L20)

<a id="field-field-mq3-client-playable-enemy-hitscan-shot-playerhit-playerhit-src-mq3-client-playable-enemy-hitscan-ml-1892913723"></a>
### playerHit

```ml
playerHit
```

When constructing this record, `fireWithTrace` supplies `not worldHit` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L24)

<a id="field-field-mq3-client-playable-enemy-hitscan-shot-side-side-src-mq3-client-playable-enemy-hitscan-ml-580139753"></a>
### side

```ml
side
```

When constructing this record, `fireWithTrace` supplies `event.side` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L28)

<a id="field-field-mq3-client-playable-enemy-hitscan-shot-start-start-src-mq3-client-playable-enemy-hitscan-ml-444650867"></a>
### start

```ml
start
```

When constructing this record, `fireWithTrace` supplies `point(muzzle)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L16)

<a id="field-field-mq3-client-playable-enemy-hitscan-shot-worldhit-worldhit-src-mq3-client-playable-enemy-hitscan-ml-670570281"></a>
### worldHit

```ml
worldHit
```

When constructing this record, `fireWithTrace` supplies `worldHit` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L22)
