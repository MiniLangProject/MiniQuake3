# `mq3.botlib.aas_bspq3.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-bspq3-ml-738898527.md)

<a id="struct-struct-mq3-botlib-aas-bspq3-state-struct-state-src-mq3-botlib-aas-bspq3-ml-1733801851"></a>
## State

```ml
struct State
```

`State` record for aas bspq3, containing `loaded`, `entDataSize`, `dentData`, `numEntities` and `entities`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L18)

## Members

<a id="field-field-mq3-botlib-aas-bspq3-state-dentdata-dentdata-src-mq3-botlib-aas-bspq3-ml-1015653200"></a>
### dentData

```ml
dentData
```

BSP entity text used to parse navigation-relevant map entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L24)

<a id="field-field-mq3-botlib-aas-bspq3-state-entdatasize-entdatasize-src-mq3-botlib-aas-bspq3-ml-983695414"></a>
### entDataSize

```ml
entDataSize
```

Byte length of the loaded BSP entity text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L22)

<a id="field-field-mq3-botlib-aas-bspq3-state-entities-entities-src-mq3-botlib-aas-bspq3-ml-468875124"></a>
### entities

```ml
entities
```

Game or BSP entity records tracked by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L28)

<a id="field-field-mq3-botlib-aas-bspq3-state-loaded-loaded-src-mq3-botlib-aas-bspq3-ml-841093580"></a>
### loaded

```ml
loaded
```

True after BSP entity text has been read and parsed into navigation entity records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L20)

<a id="field-field-mq3-botlib-aas-bspq3-state-numentities-numentities-src-mq3-botlib-aas-bspq3-ml-1514019414"></a>
### numEntities

```ml
numEntities
```

Number of entity records currently represented by this state or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_bspq3.ml#L26)
