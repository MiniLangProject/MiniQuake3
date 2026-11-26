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

Decodes an MD3 packed latitude/longitude normal using the renderer's sine lookup table.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packed` | `dynamic` | — | Input used by `bits=packed&0xffff`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L171)

<a id="function-function-mq3-renderer-surface-md3-decodenormalcached-function-decodenormalcached-packed-table-src-mq3-renderer-surface-md3-ml-2057380308"></a>
### decodeNormalCached

```ml
function decodeNormalCached(packed, table)
```

Decodes a packed MD3 normal using a supplied sine table, falling back when its size is invalid.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packed` | `dynamic` | — | Value forwarded as `packed` to `mq3.renderer.surface_md3.decodeNormal`. |
| `table` | `dynamic` | — | Indexed input read at `(lat+256)&FUNCTABLE_MASK`, `lng&FUNCTABLE_MASK`, `lat&FUNCTABLE_MASK`, `(lng+256)&FUNCTABLE_MASK`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L183)

<a id="function-function-mq3-renderer-surface-md3-framevertices-function-framevertices-value-frame-src-mq3-renderer-surface-md3-ml-1466810556"></a>
### frameVertices

```ml
function frameVertices(value, frame)
```

Reference access to a packed-only asset is intentionally transient. Never populate every visited .frames slot over a long match: native rendering uses packedFrames directly, while legacy load/surface frames remain unchanged.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.numFrames`, `value.frames`, `value.packedFrames`, `value.numVerts`. |
| `frame` | `dynamic` | — | Input tested by `frame<0 or frame>=value.numFrames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L106)

<a id="constant-constant-mq3-renderer-surface-md3-functable-mask-const-functable-mask-1023-src-mq3-renderer-surface-md3-ml-315014495"></a>
### FUNCTABLE_MASK

```ml
const FUNCTABLE_MASK = 1023
```

Mask that wraps waveform-table indices to the power-of-two table size.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L16)

<a id="constant-constant-mq3-renderer-surface-md3-functable-size-const-functable-size-1024-src-mq3-renderer-surface-md3-ml-1044168764"></a>
### FUNCTABLE_SIZE

```ml
const FUNCTABLE_SIZE = 1024
```

Number of samples in the periodic shader waveform lookup table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L14)

<a id="function-function-mq3-renderer-surface-md3-lerpvertexes-function-lerpvertexes-value-frame-oldframe-backlerp-src-mq3-renderer-surface-md3-ml-595874868"></a>
### lerpVertexes

```ml
function lerpVertexes(value, frame, oldFrame, backlerp)
```

Returns `lerpVertexesTrusted(value,frame,oldFrame,backlerp)` from `mq3.renderer.surface_md3.lerpVertexes`; earlier branches return `valid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_md3.validate`. |
| `frame` | `dynamic` | — | Value forwarded as `frame` to `mq3.renderer.surface_md3.lerpVertexesTrusted`. |
| `oldFrame` | `dynamic` | — | Value forwarded as `oldFrame` to `mq3.renderer.surface_md3.lerpVertexesTrusted`. |
| `backlerp` | `dynamic` | — | Value forwarded as `backlerp` to `mq3.renderer.surface_md3.lerpVertexesTrusted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L244)

<a id="function-function-mq3-renderer-surface-md3-lerpvertexescached-function-lerpvertexescached-value-frame-oldframe-backlerp-table-src-mq3-renderer-surface-md3-ml-2029592882"></a>
### lerpVertexesCached

```ml
function lerpVertexesCached(value, frame, oldFrame, backlerp, table)
```

LerpMeshVertexes selects the new frame directly when backlerp is zero. With interpolation it blends decoded normals and applies Quake's Q_rsqrt pass.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.numFrames`, `value.numVerts`. |
| `frame` | `dynamic` | — | Value forwarded as `frame` to `mq3.renderer.surface_md3.frameVertices`. |
| `oldFrame` | `dynamic` | — | Value forwarded as `frame` to `mq3.renderer.surface_md3.frameVertices`. |
| `backlerp` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `table` | `dynamic` | — | Value forwarded as `table` to `mq3.renderer.surface_md3.decodeNormalCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L203)

<a id="function-function-mq3-renderer-surface-md3-lerpvertexespacked-function-lerpvertexespacked-value-frame-oldframe-backlerp-table-src-mq3-renderer-surface-md3-ml-324083878"></a>
### lerpVertexesPacked

```ml
function lerpVertexesPacked(value, frame, oldFrame, backlerp, table)
```

Computes `lerpVertexesPacked` from `nativeMd3.lerp(fresh,old,table,value.numVerts,backlerp)` using `mq3.renderer.surface_md3.packedFrame`, `mq3.renderer.native_md3.lerp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.numFrames`, `value.numVerts`. |
| `frame` | `dynamic` | — | Value forwarded as `frame` to `mq3.renderer.surface_md3.packedFrame`. |
| `oldFrame` | `dynamic` | — | Value forwarded as `frame` to `mq3.renderer.surface_md3.packedFrame`. |
| `backlerp` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.native_md3.lerp`. |
| `table` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.native_md3.lerp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L123)

<a id="function-function-mq3-renderer-surface-md3-lerpvertexestrusted-function-lerpvertexestrusted-value-frame-oldframe-backlerp-src-mq3-renderer-surface-md3-ml-863493012"></a>
### lerpVertexesTrusted

```ml
function lerpVertexesTrusted(value, frame, oldFrame, backlerp)
```

Calls `mq3.renderer.surface_md3.lerpVertexesCached` with `(value,frame,oldFrame,backlerp,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.surface_md3.lerpVertexesCached`. |
| `frame` | `dynamic` | — | Value forwarded as `frame` to `mq3.renderer.surface_md3.lerpVertexesCached`. |
| `oldFrame` | `dynamic` | — | Value forwarded as `oldFrame` to `mq3.renderer.surface_md3.lerpVertexesCached`. |
| `backlerp` | `dynamic` | — | Value forwarded as `backlerp` to `mq3.renderer.surface_md3.lerpVertexesCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L238)

<a id="constant-constant-mq3-renderer-surface-md3-md3-xyz-scale-const-md3-xyz-scale-0-015625-src-mq3-renderer-surface-md3-ml-313969306"></a>
### MD3_XYZ_SCALE

```ml
const MD3_XYZ_SCALE = 0.015625
```

Scale converting packed MD3 vertex coordinates into model-space coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L12)

- [mq3.renderer.surface_md3.MeshSurface](Type-mq3-renderer-surface-md3-meshsurface-651095463.md) — struct
<a id="function-function-mq3-renderer-surface-md3-normalizefast-function-normalizefast-value-src-mq3-renderer-surface-md3-ml-161278521"></a>
### normalizeFast

```ml
function normalizeFast(value)
```

Returns `[numeric.fmul(value[0],inverse),numeric.fmul(value[1],inverse),numeric.fmul(value[2],inverse)]` from `mq3.renderer.surface_md3.normalizeFast`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.shared.math.DotProduct`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L191)

<a id="function-function-mq3-renderer-surface-md3-normaltable-function-normaltable-src-mq3-renderer-surface-md3-ml-142075720"></a>
### normalTable

```ml
function normalTable()
```

Builds `result[index]` in `mq3.renderer.surface_md3.normalTable`; returns `result`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L177)

<a id="function-function-mq3-renderer-surface-md3-packedframe-function-packedframe-value-frame-src-mq3-renderer-surface-md3-ml-893748650"></a>
### packedFrame

```ml
function packedFrame(value, frame)
```

Updates `value.packedFrames[frame]` in `mq3.renderer.surface_md3.packedFrame`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable record or buffer; this call updates `value.packedFrames[frame]`. |
| `frame` | `dynamic` | — | Input tested by `value.packedFrames[frame]!=void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L91)

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
| `value` | `dynamic` | — | Record providing `value.numTriangles`, `value.numVerts`, `value.triangles`, `value.texCoords`. |
| `frame` | `dynamic` | — | Value forwarded as `frame` to `mq3.renderer.surface_md3.lerpVertexes`. |
| `oldFrame` | `dynamic` | — | Value forwarded as `oldFrame` to `mq3.renderer.surface_md3.lerpVertexes`. |
| `backlerp` | `dynamic` | — | Input used by `effectiveBacklerp=backlerp`. |
| `currentVertexes` | `dynamic` | — | Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`. |
| `currentIndexes` | `dynamic` | — | Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`. |
| `maxVertexes` | `dynamic` | — | Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`. |
| `maxIndexes` | `dynamic` | — | Input tested by `currentVertexes<0 or currentIndexes<0 or maxVertexes<1 or maxIndexes<1`. |
| `dlightBits` | `dynamic` | — | Input used by `outputDlightBits=dlightBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L260)

<a id="function-function-mq3-renderer-surface-md3-surface-function-surface-numframes-numverts-numtriangles-triangles-texcoords-frames-src-mq3-renderer-surface-md3-ml-206483445"></a>
### surface

```ml
function surface(numFrames, numVerts, numTriangles, triangles, texCoords, frames)
```

Constructs `mq3.renderer.surface_md3.MeshSurface` with `packedFrames` = `array(numFrames,void)` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numFrames` | `dynamic` | — | Initial value for `mq3.renderer.surface_md3.MeshSurface.numFrames`. |
| `numVerts` | `dynamic` | — | Initial value for `mq3.renderer.surface_md3.MeshSurface.numVerts`. |
| `numTriangles` | `dynamic` | — | Initial value for `mq3.renderer.surface_md3.MeshSurface.numTriangles`. |
| `triangles` | `dynamic` | — | Initial value for `mq3.renderer.surface_md3.MeshSurface.triangles`. |
| `texCoords` | `dynamic` | — | Initial value for `mq3.renderer.surface_md3.MeshSurface.texCoords`. |
| `frames` | `dynamic` | — | Initial value for `mq3.renderer.surface_md3.MeshSurface.frames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L84)

<a id="function-function-mq3-renderer-surface-md3-tablevalue-function-tablevalue-index-src-mq3-renderer-surface-md3-ml-1341735552"></a>
### tableValue

```ml
function tableValue(index)
```

R_Init builds this 1024-entry table with a 1023 divisor. Preserve the float operation before the double-precision angle and the final binary32 store.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Input used by `step=numeric.fdiv(numeric.fmul(index&FUNCTABLE_MASK,360.0),1023.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L164)

<a id="function-function-mq3-renderer-surface-md3-valid3-function-valid3-value-src-mq3-renderer-surface-md3-ml-2029105415"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.surface_md3.valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L131)

<a id="function-function-mq3-renderer-surface-md3-validate-function-validate-value-src-mq3-renderer-surface-md3-ml-1460876095"></a>
### validate

```ml
function validate(value)
```

Validates MD3 frame/vertex/triangle counts, index ranges, coordinates, and per-frame vertex storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.numFrames`, `value.numVerts`, `value.numTriangles`, `value.triangles`, `value.texCoords`, `value.frames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L134)

<a id="function-function-mq3-renderer-surface-md3-vertex-function-vertex-x-y-z-packednormal-src-mq3-renderer-surface-md3-ml-1499996548"></a>
### vertex

```ml
function vertex(x, y, z, packedNormal)
```

Constructs `mq3.renderer.surface_md3.PackedVertex` with `xyz` = `[numeric.i16(x),numeric.i16(y),numeric.i16(z)]`, `packedNormal` = `packedNormal&0xffff`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.i16`. |
| `y` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.i16`. |
| `z` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.i16`. |
| `packedNormal` | `dynamic` | — | Input used in the result expression `PackedVertex([numeric.i16(x),numeric.i16(y),numeric.i16(z)],packedNormal&0xffff)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L73)
