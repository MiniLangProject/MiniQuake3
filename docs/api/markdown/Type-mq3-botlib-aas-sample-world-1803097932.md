# `mq3.botlib.aas_sample.World`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-sample-ml-257202176.md)

<a id="struct-struct-mq3-botlib-aas-sample-world-struct-world-src-mq3-botlib-aas-sample-ml-1150925843"></a>
## World

```ml
struct World
```

`World` record for aas sample, containing `runtime`, `map`, `heap`, `links` and `freeIds` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L54)

## Members

<a id="field-field-mq3-botlib-aas-sample-world-actions-actions-src-mq3-botlib-aas-sample-ml-755522689"></a>
### actions

```ml
actions
```

Recorded sampling and entity-link operations exposed to the navigation host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L76)

<a id="field-field-mq3-botlib-aas-sample-world-arealinked-arealinked-src-mq3-botlib-aas-sample-ml-1675733893"></a>
### areaLinked

```ml
areaLinked
```

Heads of entity-link chains for each AAS area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L68)

<a id="field-field-mq3-botlib-aas-sample-world-freeids-freeids-src-mq3-botlib-aas-sample-ml-431410097"></a>
### freeIds

```ml
freeIds
```

Link identifiers available for reuse.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L64)

<a id="field-field-mq3-botlib-aas-sample-world-heap-heap-src-mq3-botlib-aas-sample-ml-558353189"></a>
### heap

```ml
heap
```

Managed storage allocated for entity-to-area links.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L60)

<a id="field-field-mq3-botlib-aas-sample-world-linkedentities-linkedentities-src-mq3-botlib-aas-sample-ml-1175665701"></a>
### linkedEntities

```ml
linkedEntities
```

Entities currently represented in the AAS area-link tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L70)

<a id="field-field-mq3-botlib-aas-sample-world-links-links-src-mq3-botlib-aas-sample-ml-1492923469"></a>
### links

```ml
links
```

Entity-to-area link records indexed by their link identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L62)

<a id="field-field-mq3-botlib-aas-sample-world-map-map-src-mq3-botlib-aas-sample-ml-33430685"></a>
### map

```ml
map
```

Parsed AAS map supplying areas and partition nodes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L58)

<a id="field-field-mq3-botlib-aas-sample-world-numfree-numfree-src-mq3-botlib-aas-sample-ml-833070133"></a>
### numFree

```ml
numFree
```

Number of free represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L66)

<a id="field-field-mq3-botlib-aas-sample-world-retailactive-retailactive-src-mq3-botlib-aas-sample-ml-1877514995"></a>
### retailActive

```ml
retailActive
```

Indicates whether the host-backed retail-compatible runtime path is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L74)

<a id="field-field-mq3-botlib-aas-sample-world-runtime-runtime-src-mq3-botlib-aas-sample-ml-1571680197"></a>
### runtime

```ml
runtime
```

Loaded AAS geometry runtime used for area queries and static navigation traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L56)

<a id="field-field-mq3-botlib-aas-sample-world-services-services-src-mq3-botlib-aas-sample-ml-496551237"></a>
### services

```ml
services
```

Dynamic collision and contents callbacks supplementing static AAS sampling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L72)
