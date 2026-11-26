# `mq3.botlib.aas_optimizer.World`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-optimizer-ml-949906489.md)

<a id="struct-struct-mq3-botlib-aas-optimizer-world-struct-world-src-mq3-botlib-aas-optimizer-ml-1788991205"></a>
## World

```ml
struct World
```

`World` record for aas optimizer, containing `mapName`, `loaded`, `time`, `vertexes` and `edges` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L83)

## Members

<a id="field-field-mq3-botlib-aas-optimizer-world-actions-actions-src-mq3-botlib-aas-optimizer-ml-962788715"></a>
### actions

```ml
actions
```

Recorded host-side effects associated with navigation geometry compaction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L105)

<a id="field-field-mq3-botlib-aas-optimizer-world-areas-areas-src-mq3-botlib-aas-optimizer-ml-914645231"></a>
### areas

```ml
areas
```

Area records or area assignments used by navigation and visibility queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L101)

<a id="field-field-mq3-botlib-aas-optimizer-world-edgeindex-edgeindex-src-mq3-botlib-aas-optimizer-ml-483922007"></a>
### edgeIndex

```ml
edgeIndex
```

Signed edge references used by faces of the navigation mesh.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L95)

<a id="field-field-mq3-botlib-aas-optimizer-world-edges-edges-src-mq3-botlib-aas-optimizer-ml-1499930695"></a>
### edges

```ml
edges
```

Vertex-index pairs defining edges of the map or navigation geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L93)

<a id="field-field-mq3-botlib-aas-optimizer-world-faceindex-faceindex-src-mq3-botlib-aas-optimizer-ml-307132343"></a>
### faceIndex

```ml
faceIndex
```

Signed face references used to construct AAS area boundaries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L99)

<a id="field-field-mq3-botlib-aas-optimizer-world-faces-faces-src-mq3-botlib-aas-optimizer-ml-569848815"></a>
### faces

```ml
faces
```

Face records bounding AAS areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L97)

<a id="field-field-mq3-botlib-aas-optimizer-world-loaded-loaded-src-mq3-botlib-aas-optimizer-ml-1499023309"></a>
### loaded

```ml
loaded
```

True when the source navigation world contains geometry eligible for compaction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L87)

<a id="field-field-mq3-botlib-aas-optimizer-world-mapname-mapname-src-mq3-botlib-aas-optimizer-ml-836056087"></a>
### mapName

```ml
mapName
```

Name of the current game map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L85)

<a id="field-field-mq3-botlib-aas-optimizer-world-reachability-reachability-src-mq3-botlib-aas-optimizer-ml-1003738921"></a>
### reachability

```ml
reachability
```

Reachability records whose geometry references must be preserved.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L103)

<a id="field-field-mq3-botlib-aas-optimizer-world-retailactive-retailactive-src-mq3-botlib-aas-optimizer-ml-1347517541"></a>
### retailActive

```ml
retailActive
```

Indicates whether the host-backed retail-compatible runtime path is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L107)

<a id="field-field-mq3-botlib-aas-optimizer-world-time-time-src-mq3-botlib-aas-optimizer-ml-655470297"></a>
### time

```ml
time
```

Navigation time associated with the world being optimized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L89)

<a id="field-field-mq3-botlib-aas-optimizer-world-vertexes-vertexes-src-mq3-botlib-aas-optimizer-ml-212062415"></a>
### vertexes

```ml
vertexes
```

XYZ vertices defining the navigation or map geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L91)
