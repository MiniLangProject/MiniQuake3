# `mq3.renderer.mark_fragments.GeometryCache`

[Home](README.md) · [Source file](File-src-mq3-renderer-mark-fragments-ml-1532505804.md)

<a id="struct-struct-mq3-renderer-mark-fragments-geometrycache-struct-geometrycache-src-mq3-renderer-mark-fragments-ml-792622143"></a>
## GeometryCache

```ml
struct GeometryCache
```

Data record for `mq3.renderer.mark_fragments.GeometryCache`; groups `map`, `data`, `dataPointer`, `slots`, `faceVisits`, `faceSerial`, and 5 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L59)

## Members

<a id="field-field-mq3-renderer-mark-fragments-geometrycache-data-data-src-mq3-renderer-mark-fragments-ml-2003593103"></a>
### data

```ml
data
```

Packed triangle geometry used by accelerated projected-mark queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L63)

<a id="field-field-mq3-renderer-mark-fragments-geometrycache-datapointer-datapointer-src-mq3-renderer-mark-fragments-ml-1636846967"></a>
### dataPointer

```ml
dataPointer
```

Native address of the geometry buffer used by accelerated mark queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L65)

<a id="field-field-mq3-renderer-mark-fragments-geometrycache-facecacheenabled-facecacheenabled-src-mq3-renderer-mark-fragments-ml-709165187"></a>
### faceCacheEnabled

```ml
faceCacheEnabled
```

Whether the per-face triangle cache is used by mark queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L81)

<a id="field-field-mq3-renderer-mark-fragments-geometrycache-facedatapointer-facedatapointer-src-mq3-renderer-mark-fragments-ml-977050747"></a>
### faceDataPointer

```ml
faceDataPointer
```

Native address of the cached per-face triangle data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L75)

<a id="field-field-mq3-renderer-mark-fragments-geometrycache-facemap-facemap-src-mq3-renderer-mark-fragments-ml-769013163"></a>
### faceMap

```ml
faceMap
```

Map from BSP faces to cached mark-projection geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L73)

<a id="field-field-mq3-renderer-mark-fragments-geometrycache-faceserial-faceserial-src-mq3-renderer-mark-fragments-ml-45197153"></a>
### faceSerial

```ml
faceSerial
```

Current generation of the face-visitation stamps.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L71)

<a id="field-field-mq3-renderer-mark-fragments-geometrycache-facetrianglecount-facetrianglecount-src-mq3-renderer-mark-fragments-ml-656988323"></a>
### faceTriangleCount

```ml
faceTriangleCount
```

Number of triangles retained in the per-face mark cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L79)

<a id="field-field-mq3-renderer-mark-fragments-geometrycache-facetriangles-facetriangles-src-mq3-renderer-mark-fragments-ml-57434467"></a>
### faceTriangles

```ml
faceTriangles
```

Cached triangles used for projecting marks onto BSP faces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L77)

<a id="field-field-mq3-renderer-mark-fragments-geometrycache-facevisits-facevisits-src-mq3-renderer-mark-fragments-ml-1114465913"></a>
### faceVisits

```ml
faceVisits
```

Per-face visitation stamps used to avoid repeated mark queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L69)

<a id="field-field-mq3-renderer-mark-fragments-geometrycache-map-map-src-mq3-renderer-mark-fragments-ml-700414851"></a>
### map

```ml
map
```

Parsed BSP map used by geometry, visibility, or lighting operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L61)

<a id="field-field-mq3-renderer-mark-fragments-geometrycache-slots-slots-src-mq3-renderer-mark-fragments-ml-1124831519"></a>
### slots

```ml
slots
```

Resource slots or backing arrays retained by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L67)
