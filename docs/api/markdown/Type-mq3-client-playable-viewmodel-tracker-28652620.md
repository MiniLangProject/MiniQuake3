# `mq3.client.playable_viewmodel.Tracker`

[Home](README.md) · [Source file](File-src-mq3-client-playable-viewmodel-ml-1609227520.md)

<a id="struct-struct-mq3-client-playable-viewmodel-tracker-struct-tracker-src-mq3-client-playable-viewmodel-ml-615955535"></a>
## Tracker

```ml
struct Tracker
```

Stores playable viewmodel tracker record, including `bobPhase`, `lastTime`, `initialized`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L45)

## Members

<a id="field-field-mq3-client-playable-viewmodel-tracker-bobphase-bobphase-src-mq3-client-playable-viewmodel-ml-781084709"></a>
### bobPhase

```ml
bobPhase
```

When constructing this record, `tracker` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L47)

<a id="field-field-mq3-client-playable-viewmodel-tracker-initialized-initialized-src-mq3-client-playable-viewmodel-ml-1162761637"></a>
### initialized

```ml
initialized
```

True after the first animation update establishes the previous timestamp used for subsequent frame deltas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L52)

<a id="field-field-mq3-client-playable-viewmodel-tracker-lasttime-lasttime-src-mq3-client-playable-viewmodel-ml-1041310187"></a>
### lastTime

```ml
lastTime
```

When constructing this record, `tracker` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L49)
