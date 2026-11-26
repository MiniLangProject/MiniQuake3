# `src/mq3/renderer/surface_mesh.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.surface_mesh`](Package-mq3-renderer-surface-mesh-214184120.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-renderer-surface-mesh-build-function-build-verts-indexes-normaloverride-needsnormal-dlightbits-basevertex-baseindex-flushed-aggregatedlights-src-mq3-renderer-surface-mesh-ml-776118330"></a>
### build

```ml
function build(verts, indexes, normalOverride, needsNormal, dlightBits, baseVertex, baseIndex, flushed, aggregateDlights)
```

Builds `mq3.renderer.surface_mesh.Submission` for `mq3.renderer.surface_mesh.build`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `verts` | `dynamic` | — | Sequence traversed as `v` while producing this result. |
| `indexes` | `dynamic` | — | Sequence traversed as `index` while producing this result. |
| `normalOverride` | `dynamic` | — | Input tested by `normalOverride!=void`. |
| `needsNormal` | `dynamic` | — | Input tested by `needsNormal`. |
| `dlightBits` | `dynamic` | — | Input used by `vertexLights=vertexLights+[dlightBits]`. |
| `baseVertex` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.Submission.baseVertex`. |
| `baseIndex` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.Submission.baseIndex`. |
| `flushed` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.Submission.flushed`. |
| `aggregateDlights` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.Submission.dlightBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L89)

<a id="function-function-mq3-renderer-surface-mesh-checkcapacity-function-checkcapacity-vertexcount-indexcount-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-surface-mesh-ml-2076813100"></a>
### checkCapacity

```ml
function checkCapacity(vertexCount, indexCount, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

Computes `checkCapacity` from `currentVertexes+vertexCount>=maxVertexes or currentIndexes+indexCount>=maxIndexes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexCount` | `dynamic` | — | Input tested by `vertexCount>=maxVertexes or indexCount>=maxIndexes`. |
| `indexCount` | `dynamic` | — | Input tested by `vertexCount>=maxVertexes or indexCount>=maxIndexes`. |
| `currentVertexes` | `dynamic` | — | Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`. |
| `currentIndexes` | `dynamic` | — | Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`. |
| `maxVertexes` | `dynamic` | — | Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`. |
| `maxIndexes` | `dynamic` | — | Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L72)

<a id="function-function-mq3-renderer-surface-mesh-checkindexes-function-checkindexes-indexes-count-src-mq3-renderer-surface-mesh-ml-1093433563"></a>
### checkIndexes

```ml
function checkIndexes(indexes, count)
```

Requires a nonempty triangle-index sequence whose every vertex index lies below the supplied vertex count.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indexes` | `dynamic` | — | Sequence traversed as `index` while producing this result. |
| `count` | `dynamic` | — | Input tested by `index<0 or index>=count`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L58)

<a id="function-function-mq3-renderer-surface-mesh-face-function-face-normal-points-indexes-dlightbits-src-mq3-renderer-surface-mesh-ml-531333392"></a>
### face

```ml
function face(normal, points, indexes, dlightBits)
```

Constructs `mq3.renderer.surface_mesh.FaceSurface` from `normal`, `points`, `indexes`, `dlightBits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.FaceSurface.normal`. |
| `points` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.FaceSurface.points`. |
| `indexes` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.FaceSurface.indexes`. |
| `dlightBits` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.FaceSurface.dlightBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L34)

- [mq3.renderer.surface_mesh.FaceSurface](Type-mq3-renderer-surface-mesh-facesurface-1567681718.md) — struct
<a id="function-function-mq3-renderer-surface-mesh-lightbits-function-lightbits-value-smpframe-src-mq3-renderer-surface-mesh-ml-1027168848"></a>
### lightBits

```ml
function lightBits(value, smpFrame)
```

Returns `value[smpFrame]` from `mq3.renderer.surface_mesh.lightBits`; earlier branches return `error(7380,"surface needs two SMP dlight masks")`, `error(7381,"SMP frame outside zero or one")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Indexed input read at `smpFrame`. |
| `smpFrame` | `dynamic` | — | Input tested by `smpFrame<0 or smpFrame>1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L50)

- [mq3.renderer.surface_mesh.Submission](Type-mq3-renderer-surface-mesh-submission-1480450414.md) — struct
<a id="function-function-mq3-renderer-surface-mesh-submitface-function-submitface-value-smpframe-needsnormal-currentvertexes-currentindexes-maxvertexes-maxindexes-currentdlightbits-src-mq3-renderer-surface-mesh-ml-550713881"></a>
### submitFace

```ml
function submitFace(value, smpFrame, needsNormal, currentVertexes, currentIndexes, maxVertexes, maxIndexes, currentDlightBits)
```

RB_SurfaceFace checks overflow first and then adds its dlight mask. Every point uses the plane normal because the packed face points carry no normals.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.normal`, `value.points`, `value.indexes`, `value.dlightBits`. |
| `smpFrame` | `dynamic` | — | Value forwarded as `smpFrame` to `mq3.renderer.surface_mesh.lightBits`. |
| `needsNormal` | `dynamic` | — | Value forwarded as `needsNormal` to `mq3.renderer.surface_mesh.build`. |
| `currentVertexes` | `dynamic` | — | Value forwarded as `currentVertexes` to `mq3.renderer.surface_mesh.checkCapacity`. |
| `currentIndexes` | `dynamic` | — | Value forwarded as `currentIndexes` to `mq3.renderer.surface_mesh.checkCapacity`. |
| `maxVertexes` | `dynamic` | — | Value forwarded as `maxVertexes` to `mq3.renderer.surface_mesh.checkCapacity`. |
| `maxIndexes` | `dynamic` | — | Value forwarded as `maxIndexes` to `mq3.renderer.surface_mesh.checkCapacity`. |
| `currentDlightBits` | `dynamic` | — | Input used by `aggregate=currentDlightBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L137)

<a id="function-function-mq3-renderer-surface-mesh-submittriangles-function-submittriangles-value-smpframe-needsnormal-currentvertexes-currentindexes-maxvertexes-maxindexes-currentdlightbits-src-mq3-renderer-surface-mesh-ml-1583444427"></a>
### submitTriangles

```ml
function submitTriangles(value, smpFrame, needsNormal, currentVertexes, currentIndexes, maxVertexes, maxIndexes, currentDlightBits)
```

RB_SurfaceTriangles ORs its dlight mask before RB_CHECKOVERFLOW. Therefore a flush clears the aggregate mask, although each copied vertex keeps the mask.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.verts`, `value.indexes`, `value.dlightBits`. |
| `smpFrame` | `dynamic` | — | Value forwarded as `smpFrame` to `mq3.renderer.surface_mesh.lightBits`. |
| `needsNormal` | `dynamic` | — | Value forwarded as `needsNormal` to `mq3.renderer.surface_mesh.build`. |
| `currentVertexes` | `dynamic` | — | Value forwarded as `currentVertexes` to `mq3.renderer.surface_mesh.checkCapacity`. |
| `currentIndexes` | `dynamic` | — | Value forwarded as `currentIndexes` to `mq3.renderer.surface_mesh.checkCapacity`. |
| `maxVertexes` | `dynamic` | — | Value forwarded as `maxVertexes` to `mq3.renderer.surface_mesh.checkCapacity`. |
| `maxIndexes` | `dynamic` | — | Value forwarded as `maxIndexes` to `mq3.renderer.surface_mesh.checkCapacity`. |
| `currentDlightBits` | `dynamic` | — | Input used by `aggregate=currentDlightBits\|bits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L116)

<a id="function-function-mq3-renderer-surface-mesh-triangles-function-triangles-verts-indexes-dlightbits-src-mq3-renderer-surface-mesh-ml-344608170"></a>
### triangles

```ml
function triangles(verts, indexes, dlightBits)
```

Constructs `mq3.renderer.surface_mesh.TriangleSurface` from `verts`, `indexes`, `dlightBits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `verts` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.TriangleSurface.verts`. |
| `indexes` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.TriangleSurface.indexes`. |
| `dlightBits` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.TriangleSurface.dlightBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L28)

- [mq3.renderer.surface_mesh.TriangleSurface](Type-mq3-renderer-surface-mesh-trianglesurface-948185961.md) — struct
<a id="function-function-mq3-renderer-surface-mesh-valid2-function-valid2-v-src-mq3-renderer-surface-mesh-ml-1369998682"></a>
### valid2

```ml
function valid2(v)
```

Computes `v!=void and len(v)==2` for `mq3.renderer.surface_mesh.valid2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Input used in the result expression `v!=void and len(v)==2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L37)

<a id="function-function-mq3-renderer-surface-mesh-valid3-function-valid3-v-src-mq3-renderer-surface-mesh-ml-2106039158"></a>
### valid3

```ml
function valid3(v)
```

Computes `v!=void and len(v)==3` for `mq3.renderer.surface_mesh.valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Input used in the result expression `v!=void and len(v)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L40)

<a id="function-function-mq3-renderer-surface-mesh-valid4-function-valid4-v-src-mq3-renderer-surface-mesh-ml-338879926"></a>
### valid4

```ml
function valid4(v)
```

Computes `v!=void and len(v)==4` for `mq3.renderer.surface_mesh.valid4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Input used in the result expression `v!=void and len(v)==4`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L43)

<a id="function-function-mq3-renderer-surface-mesh-validvertex-function-validvertex-v-src-mq3-renderer-surface-mesh-ml-1497254106"></a>
### validVertex

```ml
function validVertex(v)
```

Computes `v!=void and valid3(v.xyz) and valid3(v.normal) and valid2(v.st) and valid2(v.lightmap) and valid4(v.color)` for `mq3.renderer.surface_mesh.validVertex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Record providing `v.xyz`, `v.normal`, `v.st`, `v.lightmap`, `v.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L46)

<a id="function-function-mq3-renderer-surface-mesh-vertex-function-vertex-xyz-normal-st-lightmap-color-src-mq3-renderer-surface-mesh-ml-352625164"></a>
### vertex

```ml
function vertex(xyz, normal, st, lightmap, color)
```

Constructs `mq3.renderer.surface_mesh.Vertex` with `color` = `[color[0]&255,color[1]&255,color[2]&255,color[3]&255]` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `xyz` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.Vertex.xyz`. |
| `normal` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.Vertex.normal`. |
| `st` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.Vertex.st`. |
| `lightmap` | `dynamic` | — | Initial value for `mq3.renderer.surface_mesh.Vertex.lightmap`. |
| `color` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L21)

- [mq3.renderer.surface_mesh.Vertex](Type-mq3-renderer-surface-mesh-vertex-1006104640.md) — struct
