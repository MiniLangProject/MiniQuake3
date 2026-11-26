# `mq3.client.playable_targets.Target`

[Home](README.md) · [Source file](File-src-mq3-client-playable-targets-ml-87537228.md)

<a id="struct-struct-mq3-client-playable-targets-target-struct-target-src-mq3-client-playable-targets-ml-99266581"></a>
## Target

```ml
struct Target
```

Stores playable targets target record, including `origin`, `health`, `maxHealth`, `alive`, `respawnAt`, `score` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L28)

## Members

<a id="field-field-mq3-client-playable-targets-target-alive-alive-src-mq3-client-playable-targets-ml-1572967310"></a>
### alive

```ml
alive
```

True while the simulated player or target remains alive and can participate in gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L37)

<a id="field-field-mq3-client-playable-targets-target-health-health-src-mq3-client-playable-targets-ml-1625656242"></a>
### health

```ml
health
```

Remaining target health used to apply shot damage and trigger target death.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L32)

<a id="field-field-mq3-client-playable-targets-target-maxhealth-maxhealth-src-mq3-client-playable-targets-ml-1815782358"></a>
### maxHealth

```ml
maxHealth
```

When constructing this record, `fromEntities` supplies `DEFAULT_HEALTH` for this member. Used by `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L35)

<a id="field-field-mq3-client-playable-targets-target-origin-origin-src-mq3-client-playable-targets-ml-91815994"></a>
### origin

```ml
origin
```

World-space center from which the target's hit-test bounds are constructed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L30)

<a id="field-field-mq3-client-playable-targets-target-respawnat-respawnat-src-mq3-client-playable-targets-ml-225032578"></a>
### respawnAt

```ml
respawnAt
```

Client simulation timestamp at which the entity becomes eligible to respawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L39)

<a id="field-field-mq3-client-playable-targets-target-score-score-src-mq3-client-playable-targets-ml-359483838"></a>
### score

```ml
score
```

Points awarded when this target is killed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L41)

<a id="field-field-mq3-client-playable-targets-target-spawnindex-spawnindex-src-mq3-client-playable-targets-ml-1374257052"></a>
### spawnIndex

```ml
spawnIndex
```

When constructing this record, `fromEntities` supplies `spawnIndex` for this member. Used by `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L47)

<a id="field-field-mq3-client-playable-targets-target-spawnorigin-spawnorigin-src-mq3-client-playable-targets-ml-1920242306"></a>
### spawnOrigin

```ml
spawnOrigin
```

When constructing this record, `fromEntities` supplies `[origin[0],origin[1],origin[2]]` for this member. Used by `update` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_targets.ml#L44)
