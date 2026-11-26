# `mq3.client.cgame_predict.Entity`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-predict-ml-1773632218.md)

<a id="struct-struct-mq3-client-cgame-predict-entity-struct-entity-src-mq3-client-cgame-predict-ml-948941355"></a>
## Entity

```ml
struct Entity
```

Stores client game predict entity record, including `state`, `lerpOrigin`, `lerpAngles`, `miscTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L30)

## Members

<a id="field-field-mq3-client-cgame-predict-entity-lerpangles-lerpangles-src-mq3-client-cgame-predict-ml-1443514204"></a>
### lerpAngles

```ml
lerpAngles
```

Entity orientation after snapshot interpolation and smoothing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L36)

<a id="field-field-mq3-client-cgame-predict-entity-lerporigin-lerporigin-src-mq3-client-cgame-predict-ml-1863303196"></a>
### lerpOrigin

```ml
lerpOrigin
```

Entity position after snapshot interpolation and smoothing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L34)

<a id="field-field-mq3-client-cgame-predict-entity-misctime-misctime-src-mq3-client-cgame-predict-ml-1699486056"></a>
### miscTime

```ml
miscTime
```

When constructing this record, `entity` supplies `-1` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L38)

<a id="field-field-mq3-client-cgame-predict-entity-state-state-src-mq3-client-cgame-predict-ml-649501146"></a>
### state

```ml
state
```

When constructing this record, `entity` supplies `source` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_predict.ml#L32)
