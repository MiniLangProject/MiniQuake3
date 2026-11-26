# `mq3.client.playable_targets.Hit`

[Home](README.md) · [Source file](File-src-mq3-client-playable-targets-ml-87537228.md)

<a id="struct-struct-mq3-client-playable-targets-hit-struct-hit-src-mq3-client-playable-targets-ml-1588288325"></a>
## Hit

```ml
struct Hit
```

Stores playable targets hit record, including `targetIndex`, `damage`, `killed`, `point`, `distance`, `awardedScore`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L72)

## Members

<a id="field-field-mq3-client-playable-targets-hit-awardedscore-awardedscore-src-mq3-client-playable-targets-ml-1519127714"></a>
### awardedScore

```ml
awardedScore
```

When constructing this record, `applyShot` supplies `awarded` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L85)

<a id="field-field-mq3-client-playable-targets-hit-damage-damage-src-mq3-client-playable-targets-ml-658832"></a>
### damage

```ml
damage
```

Damage amount applied or reported by the weapon, projectile, or hit result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L76)

<a id="field-field-mq3-client-playable-targets-hit-distance-distance-src-mq3-client-playable-targets-ml-1041548688"></a>
### distance

```ml
distance
```

When constructing this record, `applyShot` supplies `qmath.VectorLength(delta)*bestFraction` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L83)

<a id="field-field-mq3-client-playable-targets-hit-killed-killed-src-mq3-client-playable-targets-ml-702127392"></a>
### killed

```ml
killed
```

When constructing this record, `applyShot` supplies `killed` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L78)

<a id="field-field-mq3-client-playable-targets-hit-point-point-src-mq3-client-playable-targets-ml-369639318"></a>
### point

```ml
point
```

When constructing this record, `applyShot` supplies `point` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L80)

<a id="field-field-mq3-client-playable-targets-hit-targetindex-targetindex-src-mq3-client-playable-targets-ml-549329034"></a>
### targetIndex

```ml
targetIndex
```

Index identifying the selected target in the owning target collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_targets.ml#L74)
