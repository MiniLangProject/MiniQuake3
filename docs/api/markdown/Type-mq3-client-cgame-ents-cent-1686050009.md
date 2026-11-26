# `mq3.client.cgame_ents.Cent`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-ents-ml-1890303843.md)

<a id="struct-struct-mq3-client-cgame-ents-cent-struct-cent-src-mq3-client-cgame-ents-ml-1108552839"></a>
## Cent

```ml
struct Cent
```

Stores client game ents cent record, including `currentState`, `nextState`, `interpolate`, `lerpOrigin`, `lerpAngles`, `miscTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L122)

## Members

<a id="field-field-mq3-client-cgame-ents-cent-currentstate-currentstate-src-mq3-client-cgame-ents-ml-215731477"></a>
### currentState

```ml
currentState
```

Entity state received in the current server snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L124)

<a id="field-field-mq3-client-cgame-ents-cent-interpolate-interpolate-src-mq3-client-cgame-ents-ml-399750213"></a>
### interpolate

```ml
interpolate
```

True when a valid following snapshot permits interpolation of this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L128)

<a id="field-field-mq3-client-cgame-ents-cent-lerpangles-lerpangles-src-mq3-client-cgame-ents-ml-1511203391"></a>
### lerpAngles

```ml
lerpAngles
```

Entity orientation after snapshot interpolation and smoothing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L132)

<a id="field-field-mq3-client-cgame-ents-cent-lerporigin-lerporigin-src-mq3-client-cgame-ents-ml-1581753751"></a>
### lerpOrigin

```ml
lerpOrigin
```

Entity position after snapshot interpolation and smoothing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L130)

<a id="field-field-mq3-client-cgame-ents-cent-misctime-misctime-src-mq3-client-cgame-ents-ml-1740970651"></a>
### miscTime

```ml
miscTime
```

When constructing this record, `cent` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L134)

<a id="field-field-mq3-client-cgame-ents-cent-nextstate-nextstate-src-mq3-client-cgame-ents-ml-2091732085"></a>
### nextState

```ml
nextState
```

Entity state from the following snapshot, used when interpolation is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L126)
