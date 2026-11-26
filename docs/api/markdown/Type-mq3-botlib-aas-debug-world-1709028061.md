# `mq3.botlib.aas_debug.World`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-debug-ml-718446593.md)

<a id="struct-struct-mq3-botlib-aas-debug-world-struct-world-src-mq3-botlib-aas-debug-ml-296364737"></a>
## World

```ml
struct World
```

`World` record for aas debug, containing `vertexes`, `edges`, `edgeIndex`, `faces` and `faceIndex` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L149)

## Members

<a id="field-field-mq3-botlib-aas-debug-world-actions-actions-src-mq3-botlib-aas-debug-ml-1604449699"></a>
### actions

```ml
actions
```

Host-action collection associated with the navigation world being visualized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L173)

<a id="field-field-mq3-botlib-aas-debug-world-areas-areas-src-mq3-botlib-aas-debug-ml-861210743"></a>
### areas

```ml
areas
```

Area records or area assignments used by navigation and visibility queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L163)

<a id="field-field-mq3-botlib-aas-debug-world-areasettings-areasettings-src-mq3-botlib-aas-debug-ml-2097309687"></a>
### areaSettings

```ml
areaSettings
```

Navigation settings associated with each AAS area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L165)

<a id="field-field-mq3-botlib-aas-debug-world-edgeindex-edgeindex-src-mq3-botlib-aas-debug-ml-102572575"></a>
### edgeIndex

```ml
edgeIndex
```

Signed edge references used by faces of the navigation mesh.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L155)

<a id="field-field-mq3-botlib-aas-debug-world-edges-edges-src-mq3-botlib-aas-debug-ml-992014479"></a>
### edges

```ml
edges
```

Vertex-index pairs defining edges of the map or navigation geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L153)

<a id="field-field-mq3-botlib-aas-debug-world-faceindex-faceindex-src-mq3-botlib-aas-debug-ml-1052979103"></a>
### faceIndex

```ml
faceIndex
```

Signed face references used to construct AAS area boundaries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L159)

<a id="field-field-mq3-botlib-aas-debug-world-faces-faces-src-mq3-botlib-aas-debug-ml-932756535"></a>
### faces

```ml
faces
```

Face records bounding AAS areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L157)

<a id="field-field-mq3-botlib-aas-debug-world-loaded-loaded-src-mq3-botlib-aas-debug-ml-834856985"></a>
### loaded

```ml
loaded
```

True when the navigation map is available for debug drawing and inspection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L171)

<a id="field-field-mq3-botlib-aas-debug-world-planes-planes-src-mq3-botlib-aas-debug-ml-1699956573"></a>
### planes

```ml
planes
```

Plane records used to classify or clip the represented geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L161)

<a id="field-field-mq3-botlib-aas-debug-world-pointarea-pointarea-src-mq3-botlib-aas-debug-ml-789745571"></a>
### pointArea

```ml
pointArea
```

Area lookup interface used to locate debug positions in the navigation map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L169)

<a id="field-field-mq3-botlib-aas-debug-world-reachabilities-reachabilities-src-mq3-botlib-aas-debug-ml-820588605"></a>
### reachabilities

```ml
reachabilities
```

Reachabilities used for routing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L167)

<a id="field-field-mq3-botlib-aas-debug-world-retailactive-retailactive-src-mq3-botlib-aas-debug-ml-231577569"></a>
### retailActive

```ml
retailActive
```

Indicates whether the host-backed retail-compatible runtime path is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L175)

<a id="field-field-mq3-botlib-aas-debug-world-vertexes-vertexes-src-mq3-botlib-aas-debug-ml-1106098663"></a>
### vertexes

```ml
vertexes
```

XYZ vertices defining the navigation or map geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_debug.ml#L151)
