# `mq3.client.playable_shotgun.Pellet`

[Home](README.md) · [Source file](File-src-mq3-client-playable-shotgun-ml-2136037152.md)

<a id="struct-struct-mq3-client-playable-shotgun-pellet-struct-pellet-src-mq3-client-playable-shotgun-ml-794065405"></a>
## Pellet

```ml
struct Pellet
```

Stores playable shotgun pellet record, including `start`, `endPoint`, `intended`, `hit`, `normal`, `distance` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L26)

## Members

<a id="field-field-mq3-client-playable-shotgun-pellet-damage-damage-src-mq3-client-playable-shotgun-ml-1442914705"></a>
### damage

```ml
damage
```

Damage amount applied or reported by the weapon, projectile, or hit result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L45)

<a id="field-field-mq3-client-playable-shotgun-pellet-distance-distance-src-mq3-client-playable-shotgun-ml-56330777"></a>
### distance

```ml
distance
```

When constructing this record, `tracePellets` supplies `qmath.VectorLength(delta)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L39)

<a id="field-field-mq3-client-playable-shotgun-pellet-endpoint-endpoint-src-mq3-client-playable-shotgun-ml-896273573"></a>
### endPoint

```ml
endPoint
```

World-space endpoint of the trace, beam, or projectile presentation segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L30)

<a id="field-field-mq3-client-playable-shotgun-pellet-fraction-fraction-src-mq3-client-playable-shotgun-ml-1819112799"></a>
### fraction

```ml
fraction
```

When constructing this record, `tracePellets` supplies `fraction` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L41)

<a id="field-field-mq3-client-playable-shotgun-pellet-hit-hit-src-mq3-client-playable-shotgun-ml-1420714431"></a>
### hit

```ml
hit
```

When constructing this record, `tracePellets` supplies `worldHit` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L34)

<a id="field-field-mq3-client-playable-shotgun-pellet-intended-intended-src-mq3-client-playable-shotgun-ml-448570841"></a>
### intended

```ml
intended
```

When constructing this record, `tracePellets` supplies `copyPoint(intended)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L32)

<a id="field-field-mq3-client-playable-shotgun-pellet-killed-killed-src-mq3-client-playable-shotgun-ml-1232215065"></a>
### killed

```ml
killed
```

When constructing this record, `tracePellets` supplies `false` for this member. Used by `fireWithTrace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L48)

<a id="field-field-mq3-client-playable-shotgun-pellet-normal-normal-src-mq3-client-playable-shotgun-ml-1707240449"></a>
### normal

```ml
normal
```

World-surface normal at this pellet's trace impact, used to orient its hit effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L36)

<a id="field-field-mq3-client-playable-shotgun-pellet-start-start-src-mq3-client-playable-shotgun-ml-2129233263"></a>
### start

```ml
start
```

When constructing this record, `tracePellets` supplies `copyPoint(origin)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L28)

<a id="field-field-mq3-client-playable-shotgun-pellet-targetindex-targetindex-src-mq3-client-playable-shotgun-ml-1208954563"></a>
### targetIndex

```ml
targetIndex
```

Index identifying the selected target in the owning target collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L43)
