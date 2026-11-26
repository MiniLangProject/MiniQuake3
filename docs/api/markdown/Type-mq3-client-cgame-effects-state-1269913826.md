# `mq3.client.cgame_effects.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-effects-ml-498960699.md)

<a id="struct-struct-mq3-client-cgame-effects-state-struct-state-src-mq3-client-cgame-effects-ml-994794919"></a>
## State

```ml
struct State
```

Stores client game effects state, including `time`, `predictedClient`, `blood`, `gibs`, `scorePlum`, `noProjectileTrail` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L158)

## Members

<a id="field-field-mq3-client-cgame-effects-state-actions-actions-src-mq3-client-cgame-effects-ml-763371406"></a>
### actions

```ml
actions
```

Host requests queued while constructing smoke, bubble, debris, and explosion effects, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L199)

<a id="field-field-mq3-client-cgame-effects-state-blood-blood-src-mq3-client-cgame-effects-ml-1134273430"></a>
### blood

```ml
blood
```

When constructing this record, `create` supplies `true` for this member. Used by `bleed` and `gibPlayer` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L166)

<a id="field-field-mq3-client-cgame-effects-state-emitted-emitted-src-mq3-client-cgame-effects-ml-1755533362"></a>
### emitted

```ml
emitted
```

When constructing this record, `create` supplies `0` for this member. Used by `publish` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L202)

<a id="field-field-mq3-client-cgame-effects-state-gibs-gibs-src-mq3-client-cgame-effects-ml-1916665740"></a>
### gibs

```ml
gibs
```

When constructing this record, `create` supplies `true` for this member. Used by `gibPlayer` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L169)

<a id="field-field-mq3-client-cgame-effects-state-lastscoreposition-lastscoreposition-src-mq3-client-cgame-effects-ml-1091555454"></a>
### lastScorePosition

```ml
lastScorePosition
```

When constructing this record, `create` supplies `[0.0,0.0,0.0]` for this member. Used by `scorePlum` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L196)

<a id="field-field-mq3-client-cgame-effects-state-missionpack-missionpack-src-mq3-client-cgame-effects-ml-1489912546"></a>
### missionpack

```ml
missionpack
```

When constructing this record, `create` supplies `false` for this member. Used by `spawnEffect` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L178)

<a id="field-field-mq3-client-cgame-effects-state-noprojectiletrail-noprojectiletrail-src-mq3-client-cgame-effects-ml-1988396014"></a>
### noProjectileTrail

```ml
noProjectileTrail
```

When constructing this record, `create` supplies `false` for this member. Used by `bubbleTrail` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L175)

<a id="field-field-mq3-client-cgame-effects-state-predictedclient-predictedclient-src-mq3-client-cgame-effects-ml-1869045670"></a>
### predictedClient

```ml
predictedClient
```

When constructing this record, `create` supplies `0` for this member. Used by `scorePlum` and `bleed` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L163)

<a id="field-field-mq3-client-cgame-effects-state-ragepro-ragepro-src-mq3-client-cgame-effects-ml-972201978"></a>
### ragePro

```ml
ragePro
```

When constructing this record, `create` supplies `false` for this member. Used by `smokePuff` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L181)

<a id="field-field-mq3-client-cgame-effects-state-randomat-randomat-src-mq3-client-cgame-effects-ml-1574237082"></a>
### randomAt

```ml
randomAt
```

When constructing this record, `create` supplies `0` for this member. Used by `setRandomInts` and `randInt` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L190)

<a id="field-field-mq3-client-cgame-effects-state-randomints-randomints-src-mq3-client-cgame-effects-ml-1428992636"></a>
### randomInts

```ml
randomInts
```

When constructing this record, `create` supplies an empty list for this member. Used by `setRandomInts` and `randInt` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L187)

<a id="field-field-mq3-client-cgame-effects-state-randomseed-randomseed-src-mq3-client-cgame-effects-ml-779295970"></a>
### randomSeed

```ml
randomSeed
```

When constructing this record, `create` supplies `1` for this member. Used by `randInt` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L184)

<a id="field-field-mq3-client-cgame-effects-state-scoreplum-scoreplum-src-mq3-client-cgame-effects-ml-1810502146"></a>
### scorePlum

```ml
scorePlum
```

When constructing this record, `create` supplies `true` for this member. Used by `scorePlum` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L172)

<a id="field-field-mq3-client-cgame-effects-state-smokeseed-smokeseed-src-mq3-client-cgame-effects-ml-1854973754"></a>
### smokeSeed

```ml
smokeSeed
```

When constructing this record, `create` supplies `0x92` for this member. Used by `smokeRandom` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L193)

<a id="field-field-mq3-client-cgame-effects-state-suppressed-suppressed-src-mq3-client-cgame-effects-ml-385073170"></a>
### suppressed

```ml
suppressed
```

Number of requests withheld from native dispatch while constructing smoke, bubble, debris, and explosion effects because the retail QVM owns their effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L205)

<a id="field-field-mq3-client-cgame-effects-state-time-time-src-mq3-client-cgame-effects-ml-492388760"></a>
### time

```ml
time
```

Client-game timestamp in milliseconds used to initialize and schedule transient visual effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L160)
