# `mq3.client.cgame_predict.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-predict-ml-1773632218.md)

<a id="struct-struct-mq3-client-cgame-predict-state-struct-state-src-mq3-client-cgame-predict-ml-596800055"></a>
## State

```ml
struct State
```

Stores client game predict state, including `predicted`, `valid`, `solidEntities`, `triggerEntities`, `physicsTime`, `hyperspace` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L65)

## Members

<a id="field-field-mq3-client-cgame-predict-state-hyperspace-hyperspace-src-mq3-client-cgame-predict-ml-1278718764"></a>
### hyperspace

```ml
hyperspace
```

True when prediction has entered a teleport trigger requiring the hyperspace view effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L80)

<a id="field-field-mq3-client-cgame-predict-state-lastmode-lastmode-src-mq3-client-cgame-predict-ml-1158129742"></a>
### lastMode

```ml
lastMode
```

When constructing this record, `create` supplies `"none"` for this member. Used by `predict` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L102)

<a id="field-field-mq3-client-cgame-predict-state-moved-moved-src-mq3-client-cgame-predict-ml-985328076"></a>
### moved

```ml
moved
```

When constructing this record, `create` supplies `false` for this member. Used by `predict` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L87)

<a id="field-field-mq3-client-cgame-predict-state-packetbackupexceeded-packetbackupexceeded-src-mq3-client-cgame-predict-ml-1241326290"></a>
### packetBackupExceeded

```ml
packetBackupExceeded
```

When constructing this record, `create` supplies `false` for this member. Used by `predict` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L105)

<a id="field-field-mq3-client-cgame-predict-state-physicstime-physicstime-src-mq3-client-cgame-predict-ml-238289264"></a>
### physicsTime

```ml
physicsTime
```

Snapshot time selected as the basis for player-state prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L78)

<a id="field-field-mq3-client-cgame-predict-state-pointcount-pointcount-src-mq3-client-cgame-predict-ml-836308150"></a>
### pointCount

```ml
pointCount
```

When constructing this record, `create` supplies `0` for this member. Used by `pointContents` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L93)

<a id="field-field-mq3-client-cgame-predict-state-predicted-predicted-src-mq3-client-cgame-predict-ml-949765724"></a>
### predicted

```ml
predicted
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `touchItem` and `touchTriggerPrediction` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L68)

<a id="field-field-mq3-client-cgame-predict-state-predictederror-predictederror-src-mq3-client-cgame-predict-ml-1439069200"></a>
### predictedError

```ml
predictedError
```

Positional discrepancy between predicted and authoritative player state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L82)

<a id="field-field-mq3-client-cgame-predict-state-predictederrortime-predictederrortime-src-mq3-client-cgame-predict-ml-1921507194"></a>
### predictedErrorTime

```ml
predictedErrorTime
```

Timestamp from which the stored player-prediction error is smoothed away.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L84)

<a id="field-field-mq3-client-cgame-predict-state-predictions-predictions-src-mq3-client-cgame-predict-ml-1074410812"></a>
### predictions

```ml
predictions
```

When constructing this record, `create` supplies `0` for this member. Used by `predict` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L96)

<a id="field-field-mq3-client-cgame-predict-state-solidentities-solidentities-src-mq3-client-cgame-predict-ml-1845172684"></a>
### solidEntities

```ml
solidEntities
```

When constructing this record, `create` supplies an empty list for this member. Used by `buildSolidList` and `trace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L73)

<a id="field-field-mq3-client-cgame-predict-state-tracecount-tracecount-src-mq3-client-cgame-predict-ml-787973148"></a>
### traceCount

```ml
traceCount
```

When constructing this record, `create` supplies `0` for this member. Used by `trace` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L90)

<a id="field-field-mq3-client-cgame-predict-state-transitions-transitions-src-mq3-client-cgame-predict-ml-613465236"></a>
### transitions

```ml
transitions
```

When constructing this record, `create` supplies `0` for this member. Used by `predict` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L99)

<a id="field-field-mq3-client-cgame-predict-state-triggerentities-triggerentities-src-mq3-client-cgame-predict-ml-855897352"></a>
### triggerEntities

```ml
triggerEntities
```

When constructing this record, `create` supplies an empty list for this member. Used by `buildSolidList` and `touchTriggerPrediction` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L76)

<a id="field-field-mq3-client-cgame-predict-state-valid-valid-src-mq3-client-cgame-predict-ml-1744925916"></a>
### valid

```ml
valid
```

True when the stored data passed the validation required by its consumer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L70)

<a id="field-field-mq3-client-cgame-predict-state-warnings-warnings-src-mq3-client-cgame-predict-ml-421589606"></a>
### warnings

```ml
warnings
```

Nonfatal diagnostic messages collected while processing the input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_predict.ml#L107)
