# `mq3.botlib.aas_entities.BspData`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-entities-ml-525847367.md)

<a id="struct-struct-mq3-botlib-aas-entities-bspdata-struct-bspdata-src-mq3-botlib-aas-entities-ml-2132203931"></a>
## BspData

```ml
struct BspData
```

`BspData` record for aas entities, containing `origin`, `angles`, `absmins`, `absmaxs` and `solid` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L109)

## Members

<a id="field-field-mq3-botlib-aas-entities-bspdata-absmaxs-absmaxs-src-mq3-botlib-aas-entities-ml-559942490"></a>
### absmaxs

```ml
absmaxs
```

Maximum corner of the model's world-space collision bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L117)

<a id="field-field-mq3-botlib-aas-entities-bspdata-absmins-absmins-src-mq3-botlib-aas-entities-ml-173158746"></a>
### absmins

```ml
absmins
```

Minimum corner of the model's world-space collision bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L115)

<a id="field-field-mq3-botlib-aas-entities-bspdata-angles-angles-src-mq3-botlib-aas-entities-ml-139240594"></a>
### angles

```ml
angles
```

Pitch, yaw, and roll values carried by the entity or user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L113)

<a id="field-field-mq3-botlib-aas-entities-bspdata-modelnum-modelnum-src-mq3-botlib-aas-entities-ml-1935176220"></a>
### modelnum

```ml
modelnum
```

Brush-model number associated with the mover or collision entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L121)

<a id="field-field-mq3-botlib-aas-entities-bspdata-origin-origin-src-mq3-botlib-aas-entities-ml-1023841306"></a>
### origin

```ml
origin
```

Origin parsed from the map entity key/value data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L111)

<a id="field-field-mq3-botlib-aas-entities-bspdata-solid-solid-src-mq3-botlib-aas-entities-ml-607488834"></a>
### solid

```ml
solid
```

Encoded collision-hull or solidity value associated with the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L119)
