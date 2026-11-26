# `mq3.client.playable_targets.State`

[Home](README.md) · [Source file](File-src-mq3-client-playable-targets-ml-87537228.md)

<a id="struct-struct-mq3-client-playable-targets-state-struct-state-src-mq3-client-playable-targets-ml-1251898465"></a>
## State

```ml
struct State
```

Stores playable targets state, including `targets`, `score`, `lastTime`, `respawnMilliseconds`, `radius`, `minZ` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L50)

## Members

<a id="field-field-mq3-client-playable-targets-state-lasttime-lasttime-src-mq3-client-playable-targets-ml-1135966236"></a>
### lastTime

```ml
lastTime
```

When constructing this record, `fromEntities` supplies `0` for this member. Used by `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L58)

<a id="field-field-mq3-client-playable-targets-state-maxz-maxz-src-mq3-client-playable-targets-ml-303509938"></a>
### maxZ

```ml
maxZ
```

When constructing this record, `fromEntities` supplies `DEFAULT_MAX_Z` for this member. Used by `applyShot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L69)

<a id="field-field-mq3-client-playable-targets-state-minz-minz-src-mq3-client-playable-targets-ml-1923461582"></a>
### minZ

```ml
minZ
```

When constructing this record, `fromEntities` supplies `DEFAULT_MIN_Z` for this member. Used by `applyShot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L66)

<a id="field-field-mq3-client-playable-targets-state-radius-radius-src-mq3-client-playable-targets-ml-76143702"></a>
### radius

```ml
radius
```

Horizontal collision radius used when testing shots against playable targets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L63)

<a id="field-field-mq3-client-playable-targets-state-respawnmilliseconds-respawnmilliseconds-src-mq3-client-playable-targets-ml-613068458"></a>
### respawnMilliseconds

```ml
respawnMilliseconds
```

When constructing this record, `fromEntities` supplies `DEFAULT_RESPAWN_MILLISECONDS` for this member. Used by `applyShot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L61)

<a id="field-field-mq3-client-playable-targets-state-score-score-src-mq3-client-playable-targets-ml-501129050"></a>
### score

```ml
score
```

Accumulated points earned from targets killed in the playable target simulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L55)

<a id="field-field-mq3-client-playable-targets-state-targets-targets-src-mq3-client-playable-targets-ml-2006428266"></a>
### targets

```ml
targets
```

When constructing this record, `fromEntities` supplies `targets` for this member. Used by `activeCount` and `applyShot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L53)
