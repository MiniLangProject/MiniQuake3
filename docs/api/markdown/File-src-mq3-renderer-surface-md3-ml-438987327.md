# `src/mq3/renderer/surface_md3.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.surface_md3`](Package-mq3-renderer-surface-md3-1608025385.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/renderer/native_md3.ml` as `nativeMd3` → [src/mq3/renderer/native_md3.ml](File-src-mq3-renderer-native-md3-ml-1567005747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-renderer-surface-md3-decodenormal-function-decodenormal-packed-src-mq3-renderer-surface-md3-ml-71382994"></a>
### decodeNormal

```ml
function decodeNormal(packed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L92)

<a id="function-function-mq3-renderer-surface-md3-decodenormalcached-function-decodenormalcached-packed-table-src-mq3-renderer-surface-md3-ml-2057380308"></a>
### decodeNormalCached

```ml
function decodeNormalCached(packed, table)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packed` | `dynamic` | — |  |
| `table` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L100)

<a id="function-function-mq3-renderer-surface-md3-framevertices-function-framevertices-value-frame-src-mq3-renderer-surface-md3-ml-1466810556"></a>
### frameVertices

```ml
function frameVertices(value, frame)
```

Reference access to a packed-only asset is intentionally transient. Never populate every visited .frames slot over a long match: native rendering uses packedFrames directly, while legacy load/surface frames remain unchanged.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L40)

<a id="constant-constant-mq3-renderer-surface-md3-functable-mask-const-functable-mask-1023-src-mq3-renderer-surface-md3-ml-315014495"></a>
### FUNCTABLE_MASK

```ml
const FUNCTABLE_MASK = 1023
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L13)

<a id="constant-constant-mq3-renderer-surface-md3-functable-size-const-functable-size-1024-src-mq3-renderer-surface-md3-ml-1044168764"></a>
### FUNCTABLE_SIZE

```ml
const FUNCTABLE_SIZE = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L12)

<a id="function-function-mq3-renderer-surface-md3-lerpvertexes-function-lerpvertexes-value-frame-oldframe-backlerp-src-mq3-renderer-surface-md3-ml-595874868"></a>
### lerpVertexes

```ml
function lerpVertexes(value, frame, oldFrame, backlerp)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L144)

<a id="function-function-mq3-renderer-surface-md3-lerpvertexescached-function-lerpvertexescached-value-frame-oldframe-backlerp-table-src-mq3-renderer-surface-md3-ml-2029592882"></a>
### lerpVertexesCached

```ml
function lerpVertexesCached(value, frame, oldFrame, backlerp, table)
```

LerpMeshVertexes selects the new frame directly when backlerp is zero. With interpolation it blends decoded normals and applies Quake's Q_rsqrt pass.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |
| `table` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L113)

<a id="function-function-mq3-renderer-surface-md3-lerpvertexespacked-function-lerpvertexespacked-value-frame-oldframe-backlerp-table-src-mq3-renderer-surface-md3-ml-324083878"></a>
### lerpVertexesPacked

```ml
function lerpVertexesPacked(value, frame, oldFrame, backlerp, table)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |
| `table` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L51)

<a id="function-function-mq3-renderer-surface-md3-lerpvertexestrusted-function-lerpvertexestrusted-value-frame-oldframe-backlerp-src-mq3-renderer-surface-md3-ml-863493012"></a>
### lerpVertexesTrusted

```ml
function lerpVertexesTrusted(value, frame, oldFrame, backlerp)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L143)

<a id="constant-constant-mq3-renderer-surface-md3-md3-xyz-scale-const-md3-xyz-scale-1-5625e-002-src-mq3-renderer-surface-md3-ml-1876291352"></a>
### MD3_XYZ_SCALE

```ml
const MD3_XYZ_SCALE = 1.5625e-002
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L11)

- [mq3.renderer.surface_md3.MeshSurface](Type-mq3-renderer-surface-md3-meshsurface-651095463.md) — struct
<a id="function-function-mq3-renderer-surface-md3-normalizefast-function-normalizefast-value-src-mq3-renderer-surface-md3-ml-161278521"></a>
### normalizeFast

```ml
function normalizeFast(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L106)

<a id="function-function-mq3-renderer-surface-md3-normaltable-function-normaltable-src-mq3-renderer-surface-md3-ml-142075720"></a>
### normalTable

```ml
function normalTable()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L97)

<a id="function-function-mq3-renderer-surface-md3-packedframe-function-packedframe-value-frame-src-mq3-renderer-surface-md3-ml-893748650"></a>
### packedFrame

```ml
function packedFrame(value, frame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L27)

- [mq3.renderer.surface_md3.PackedVertex](Type-mq3-renderer-surface-md3-packedvertex-1501421155.md) — struct
- [mq3.renderer.surface_md3.Submission](Type-mq3-renderer-surface-md3-submission-1186498249.md) — struct
<a id="function-function-mq3-renderer-surface-md3-submit-function-submit-value-frame-oldframe-backlerp-currentvertexes-currentindexes-maxvertexes-maxindexes-dlightbits-src-mq3-renderer-surface-md3-ml-1811491250"></a>
### submit

```ml
function submit(value, frame, oldFrame, backlerp, currentVertexes, currentIndexes, maxVertexes, maxIndexes, dlightBits)
```

RB_CHECKOVERFLOW ends the current tessellation before this surface when the combined counts exceed capacity. MD3 submission itself does not alter lights.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L151)

<a id="function-function-mq3-renderer-surface-md3-surface-function-surface-numframes-numverts-numtriangles-triangles-texcoords-frames-src-mq3-renderer-surface-md3-ml-206483445"></a>
### surface

```ml
function surface(numFrames, numVerts, numTriangles, triangles, texCoords, frames)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numFrames` | `dynamic` | — |  |
| `numVerts` | `dynamic` | — |  |
| `numTriangles` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `texCoords` | `dynamic` | — |  |
| `frames` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L23)

<a id="function-function-mq3-renderer-surface-md3-tablevalue-function-tablevalue-index-src-mq3-renderer-surface-md3-ml-1341735552"></a>
### tableValue

```ml
function tableValue(index)
```

R_Init builds this 1024-entry table with a 1023 divisor. Preserve the float operation before the double-precision angle and the final binary32 store.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L87)

<a id="function-function-mq3-renderer-surface-md3-valid3-function-valid3-value-src-mq3-renderer-surface-md3-ml-2029105415"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L57)

<a id="function-function-mq3-renderer-surface-md3-validate-function-validate-value-src-mq3-renderer-surface-md3-ml-1460876095"></a>
### validate

```ml
function validate(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L58)

<a id="function-function-mq3-renderer-surface-md3-vertex-function-vertex-x-y-z-packednormal-src-mq3-renderer-surface-md3-ml-1499996548"></a>
### vertex

```ml
function vertex(x, y, z, packedNormal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `z` | `dynamic` | — |  |
| `packedNormal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_md3.ml#L19)
