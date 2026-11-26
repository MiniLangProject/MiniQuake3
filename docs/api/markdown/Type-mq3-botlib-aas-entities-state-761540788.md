# `mq3.botlib.aas_entities.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-entities-ml-525847367.md)

<a id="struct-struct-mq3-botlib-aas-entities-state-struct-state-src-mq3-botlib-aas-entities-ml-2056725435"></a>
## State

```ml
struct State
```

`State` record for aas entities, containing `entities`, `maxEntities`, `time`, `frames` and `areaLinks` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L124)

## Members

<a id="field-field-mq3-botlib-aas-entities-state-arealinks-arealinks-src-mq3-botlib-aas-entities-ml-1089132898"></a>
### areaLinks

```ml
areaLinks
```

AAS area-link information associated with the tracked entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L134)

<a id="field-field-mq3-botlib-aas-entities-state-entities-entities-src-mq3-botlib-aas-entities-ml-1790516572"></a>
### entities

```ml
entities
```

Game or BSP entity records tracked by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L126)

<a id="field-field-mq3-botlib-aas-entities-state-frames-frames-src-mq3-botlib-aas-entities-ml-1422401218"></a>
### frames

```ml
frames
```

Number of AAS entity-update frames processed by this state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L132)

<a id="field-field-mq3-botlib-aas-entities-state-maxentities-maxentities-src-mq3-botlib-aas-entities-ml-2066726130"></a>
### maxEntities

```ml
maxEntities
```

Maximum number of entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L128)

<a id="field-field-mq3-botlib-aas-entities-state-runtime-runtime-src-mq3-botlib-aas-entities-ml-172393018"></a>
### runtime

```ml
runtime
```

AAS map runtime used to relink updated game entities to navigation areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L136)

<a id="field-field-mq3-botlib-aas-entities-state-time-time-src-mq3-botlib-aas-entities-ml-10424068"></a>
### time

```ml
time
```

Current navigation time used to timestamp entity updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L130)
