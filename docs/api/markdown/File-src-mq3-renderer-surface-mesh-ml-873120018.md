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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `verts` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |
| `normalOverride` | `dynamic` | — |  |
| `needsNormal` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |
| `baseVertex` | `dynamic` | — |  |
| `baseIndex` | `dynamic` | — |  |
| `flushed` | `dynamic` | — |  |
| `aggregateDlights` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L39)

<a id="function-function-mq3-renderer-surface-mesh-checkcapacity-function-checkcapacity-vertexcount-indexcount-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-surface-mesh-ml-2076813100"></a>
### checkCapacity

```ml
function checkCapacity(vertexCount, indexCount, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexCount` | `dynamic` | — |  |
| `indexCount` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L32)

<a id="function-function-mq3-renderer-surface-mesh-checkindexes-function-checkindexes-indexes-count-src-mq3-renderer-surface-mesh-ml-1093433563"></a>
### checkIndexes

```ml
function checkIndexes(indexes, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indexes` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L25)

<a id="function-function-mq3-renderer-surface-mesh-face-function-face-normal-points-indexes-dlightbits-src-mq3-renderer-surface-mesh-ml-531333392"></a>
### face

```ml
function face(normal, points, indexes, dlightBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L15)

- [mq3.renderer.surface_mesh.FaceSurface](Type-mq3-renderer-surface-mesh-facesurface-1567681718.md) — struct
<a id="function-function-mq3-renderer-surface-mesh-lightbits-function-lightbits-value-smpframe-src-mq3-renderer-surface-mesh-ml-1027168848"></a>
### lightBits

```ml
function lightBits(value, smpFrame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `smpFrame` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L20)

- [mq3.renderer.surface_mesh.Submission](Type-mq3-renderer-surface-mesh-submission-1480450414.md) — struct
<a id="function-function-mq3-renderer-surface-mesh-submitface-function-submitface-value-smpframe-needsnormal-currentvertexes-currentindexes-maxvertexes-maxindexes-currentdlightbits-src-mq3-renderer-surface-mesh-ml-550713881"></a>
### submitFace

```ml
function submitFace(value, smpFrame, needsNormal, currentVertexes, currentIndexes, maxVertexes, maxIndexes, currentDlightBits)
```

RB_SurfaceFace checks overflow first and then adds its dlight mask. Every point uses the plane normal because the packed face points carry no normals.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `smpFrame` | `dynamic` | — |  |
| `needsNormal` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |
| `currentDlightBits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L71)

<a id="function-function-mq3-renderer-surface-mesh-submittriangles-function-submittriangles-value-smpframe-needsnormal-currentvertexes-currentindexes-maxvertexes-maxindexes-currentdlightbits-src-mq3-renderer-surface-mesh-ml-1583444427"></a>
### submitTriangles

```ml
function submitTriangles(value, smpFrame, needsNormal, currentVertexes, currentIndexes, maxVertexes, maxIndexes, currentDlightBits)
```

RB_SurfaceTriangles ORs its dlight mask before RB_CHECKOVERFLOW. Therefore a flush clears the aggregate mask, although each copied vertex keeps the mask.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `smpFrame` | `dynamic` | — |  |
| `needsNormal` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |
| `currentDlightBits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L58)

<a id="function-function-mq3-renderer-surface-mesh-triangles-function-triangles-verts-indexes-dlightbits-src-mq3-renderer-surface-mesh-ml-344608170"></a>
### triangles

```ml
function triangles(verts, indexes, dlightBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `verts` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L14)

- [mq3.renderer.surface_mesh.TriangleSurface](Type-mq3-renderer-surface-mesh-trianglesurface-948185961.md) — struct
<a id="function-function-mq3-renderer-surface-mesh-valid2-function-valid2-v-src-mq3-renderer-surface-mesh-ml-1369998682"></a>
### valid2

```ml
function valid2(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L16)

<a id="function-function-mq3-renderer-surface-mesh-valid3-function-valid3-v-src-mq3-renderer-surface-mesh-ml-2106039158"></a>
### valid3

```ml
function valid3(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L17)

<a id="function-function-mq3-renderer-surface-mesh-valid4-function-valid4-v-src-mq3-renderer-surface-mesh-ml-338879926"></a>
### valid4

```ml
function valid4(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L18)

<a id="function-function-mq3-renderer-surface-mesh-validvertex-function-validvertex-v-src-mq3-renderer-surface-mesh-ml-1497254106"></a>
### validVertex

```ml
function validVertex(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L19)

<a id="function-function-mq3-renderer-surface-mesh-vertex-function-vertex-xyz-normal-st-lightmap-color-src-mq3-renderer-surface-mesh-ml-352625164"></a>
### vertex

```ml
function vertex(xyz, normal, st, lightmap, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `xyz` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `st` | `dynamic` | — |  |
| `lightmap` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L11)

- [mq3.renderer.surface_mesh.Vertex](Type-mq3-renderer-surface-mesh-vertex-1006104640.md) — struct
