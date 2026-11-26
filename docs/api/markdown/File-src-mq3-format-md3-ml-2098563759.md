# `src/mq3/format/md3.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.format.md3`](Package-mq3-format-md3-78769581.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/surface_md3.ml` as `md3Mesh` → [src/mq3/renderer/surface_md3.ml](File-src-mq3-renderer-surface-md3-ml-438987327.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-format-md3-f32-function-f32-data-offset-src-mq3-format-md3-ml-1128364401"></a>
### f32

```ml
function f32(data, offset)
```

Compute f 32 in format.md3; the normal completion returns `n.bitsFloat(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.readU32`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.compat.numeric.readU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L139)

<a id="function-function-mq3-format-md3-fail-function-fail-message-src-mq3-format-md3-ml-1607374501"></a>
### fail

```ml
function fail(message)
```

Create the format.md3 error for `fail` with 7500 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("MD3: " + message)` and `error(7500, ("MD3: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L114)

<a id="function-function-mq3-format-md3-fixedstring-function-fixedstring-data-offset-capacity-src-mq3-format-md3-ml-933970441"></a>
### fixedString

```ml
function fixedString(data, offset, capacity)
```

Compute fixed string in format.md3; the normal completion returns `decode(slice(data, offset, count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[(offset + count)]`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.format.md3.span`. |
| `capacity` | `dynamic` | — | Size passed as `size` to `mq3.format.md3.span`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L150)

- [mq3.format.md3.Frame](Type-mq3-format-md3-frame-922445738.md) — struct
<a id="constant-constant-mq3-format-md3-frame-size-const-frame-size-56-src-mq3-format-md3-ml-2050191506"></a>
### FRAME_SIZE

```ml
const FRAME_SIZE = 56
```

Serialized byte size of frame in this file format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L17)

<a id="constant-constant-mq3-format-md3-header-size-const-header-size-108-src-mq3-format-md3-ml-811895768"></a>
### HEADER_SIZE

```ml
const HEADER_SIZE = 108
```

Serialized byte size of header in this file format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L15)

<a id="function-function-mq3-format-md3-i32-function-i32-data-offset-src-mq3-format-md3-ml-2087039335"></a>
### i32

```ml
function i32(data, offset)
```

Compute i 32 in format.md3; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.readI32`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.compat.numeric.readI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L126)

<a id="function-function-mq3-format-md3-load-function-load-data-src-mq3-format-md3-ml-1715294826"></a>
### load

```ml
function load(data)
```

Parse a version-15 MD3 and materialize PackedVertex records for every surface frame. Returns the validated Model, including tag-only models with no surfaces, or a format error. Positions remain quantized in the surface frame records until renderer interpolation converts them to model-space coordinates.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Complete MD3 file bytes. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L172)

<a id="function-function-mq3-format-md3-loadmode-function-loadmode-data-packedonly-src-mq3-format-md3-ml-612140672"></a>
### loadMode

```ml
function loadMode(data, packedOnly)
```

Validate MD3 model and surface sections and build the requested surface-frame representation. Checks count limits, header-relative spans, surface-frame agreement, vertex indices, and the final surface-chain endpoint. Model sections use offsets from the file header; each surface section uses offsets from its own surface header.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Complete MD3 byte buffer; bytes beyond the declared ofsEnd are not part of the model. |
| `packedOnly` | `dynamic` | — | True stores surface frames in packedFrames; false creates PackedVertex arrays in frames. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L185)

<a id="function-function-mq3-format-md3-loadpacked-function-loadpacked-data-src-mq3-format-md3-ml-539771930"></a>
### loadPacked

```ml
function loadPacked(data)
```

Parse the same MD3 format while retaining surface frames as packed byte buffers. Performs the same header, span, count, and triangle-index validation as load, but leaves the per-frame vertex-record slots empty for lazy reference access and native rendering. Model bounds, tags, shader names, and UVs are still parsed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Complete MD3 file bytes. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L178)

<a id="constant-constant-mq3-format-md3-max-frames-const-max-frames-1024-src-mq3-format-md3-ml-37711406"></a>
### MAX_FRAMES

```ml
const MAX_FRAMES = 1024
```

Maximum number of animation frames accepted by the MD3 model loader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L32)

<a id="constant-constant-mq3-format-md3-max-shaders-const-max-shaders-256-src-mq3-format-md3-ml-1484682338"></a>
### MAX_SHADERS

```ml
const MAX_SHADERS = 256
```

Maximum number of shader references accepted for one MD3 surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L38)

<a id="constant-constant-mq3-format-md3-max-surfaces-const-max-surfaces-128-src-mq3-format-md3-ml-983238210"></a>
### MAX_SURFACES

```ml
const MAX_SURFACES = 128
```

Maximum number of mesh surfaces accepted in one MD3 model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L36)

<a id="constant-constant-mq3-format-md3-max-tags-const-max-tags-256-src-mq3-format-md3-ml-602821212"></a>
### MAX_TAGS

```ml
const MAX_TAGS = 256
```

Maximum number of attachment tags accepted per MD3 frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L34)

<a id="constant-constant-mq3-format-md3-max-triangles-const-max-triangles-8192-src-mq3-format-md3-ml-1940072281"></a>
### MAX_TRIANGLES

```ml
const MAX_TRIANGLES = 8192
```

Maximum number of triangles accepted for one MD3 surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L42)

<a id="constant-constant-mq3-format-md3-max-verts-const-max-verts-4096-src-mq3-format-md3-ml-1744185418"></a>
### MAX_VERTS

```ml
const MAX_VERTS = 4096
```

Maximum number of vertices accepted for one MD3 surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L40)

<a id="constant-constant-mq3-format-md3-md3-ident-const-md3-ident-860898377-src-mq3-format-md3-ml-1502428789"></a>
### MD3_IDENT

```ml
const MD3_IDENT = 860898377
```

Magic value identifying an MD3 animated model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L11)

<a id="constant-constant-mq3-format-md3-md3-version-const-md3-version-15-src-mq3-format-md3-ml-1548984363"></a>
### MD3_VERSION

```ml
const MD3_VERSION = 15
```

Serialized format or interface version expected by MD3.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L13)

- [mq3.format.md3.Model](Type-mq3-format-md3-model-1313758702.md) — struct
<a id="function-function-mq3-format-md3-normalizesurfacenames-function-normalizesurfacenames-model-src-mq3-format-md3-ml-269156491"></a>
### normalizeSurfaceNames

```ml
function normalizeSurfaceNames(model)
```

The renderer strips a trailing LOD suffix before resolving skin mappings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Record exposing `surfaces`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L158)

- [mq3.format.md3.RenderTriangle](Type-mq3-format-md3-rendertriangle-1832924873.md) — struct
<a id="function-function-mq3-format-md3-rendertriangles-function-rendertriangles-model-surfaceindex-frame-oldframe-backlerp-maxtriangles-src-mq3-format-md3-ml-1061731114"></a>
### renderTriangles

```ml
function renderTriangles(model, surfaceIndex, frame, oldFrame, backlerp, maxTriangles)
```

Return `mq3.format.md3.renderTrianglesCached(model, surfaceIndex, frame, oldFrame, backlerp, maxTriangles, void)` from `format.md3.renderTriangles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.format.md3.renderTrianglesCached`. |
| `surfaceIndex` | `dynamic` | — | Surface index passed as `surfaceIndex` to `mq3.format.md3.renderTrianglesCached`. |
| `frame` | `dynamic` | — | Frame passed as `frame` to `mq3.format.md3.renderTrianglesCached`. |
| `oldFrame` | `dynamic` | — | Old frame passed as `oldFrame` to `mq3.format.md3.renderTrianglesCached`. |
| `backlerp` | `dynamic` | — | Backlerp passed as `backlerp` to `mq3.format.md3.renderTrianglesCached`. |
| `maxTriangles` | `dynamic` | — | Max triangles passed as `maxTriangles` to `mq3.format.md3.renderTrianglesCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L316)

<a id="function-function-mq3-format-md3-rendertrianglescached-function-rendertrianglescached-model-surfaceindex-frame-oldframe-backlerp-maxtriangles-normaltable-src-mq3-format-md3-ml-1576240683"></a>
### renderTrianglesCached

```ml
function renderTrianglesCached(model, surfaceIndex, frame, oldFrame, backlerp, maxTriangles, normalTable)
```

Produces renderer-neutral animated triangles for the playable preview.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Record exposing `surfaces`. |
| `surfaceIndex` | `dynamic` | — | Initial `surfaceIndex` field stored in the returned or constructed `mq3.format.md3.RenderTriangle` record. |
| `frame` | `dynamic` | — | Frame passed as `frame` to `mq3.renderer.surface_md3.lerpVertexesCached`. |
| `oldFrame` | `dynamic` | — | Old frame passed as `oldFrame` to `mq3.renderer.surface_md3.lerpVertexesCached`. |
| `backlerp` | `dynamic` | — | Backlerp passed as `backlerp` to `mq3.renderer.surface_md3.lerpVertexesCached`. |
| `maxTriangles` | `dynamic` | — | Max triangles used in `(maxTriangles < 0)` and `(maxTriangles == 0)`. |
| `normalTable` | `dynamic` | — | Table passed as `table` to `mq3.renderer.surface_md3.lerpVertexesCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L290)

<a id="constant-constant-mq3-format-md3-shader-size-const-shader-size-68-src-mq3-format-md3-ml-1019907547"></a>
### SHADER_SIZE

```ml
const SHADER_SIZE = 68
```

Serialized byte size of shader in this file format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L25)

<a id="function-function-mq3-format-md3-span-function-span-offset-size-limit-src-mq3-format-md3-ml-1019221547"></a>
### span

```ml
function span(offset, size, limit)
```

Test span in format.md3; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `offset` | `dynamic` | — | Offset used in `(offset < 0)` and `(offset > limit)`. |
| `size` | `dynamic` | — | Size used in `(size < 0)` and `(size > (limit - offset))`. |
| `limit` | `dynamic` | — | Limit used in `(offset > limit)` and `(limit - offset)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L119)

<a id="constant-constant-mq3-format-md3-st-size-const-st-size-8-src-mq3-format-md3-ml-927917883"></a>
### ST_SIZE

```ml
const ST_SIZE = 8
```

Serialized byte size of st in this file format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L27)

- [mq3.format.md3.Surface](Type-mq3-format-md3-surface-1880876672.md) — struct
<a id="constant-constant-mq3-format-md3-surface-size-const-surface-size-108-src-mq3-format-md3-ml-1939950728"></a>
### SURFACE_SIZE

```ml
const SURFACE_SIZE = 108
```

Serialized byte size of surface in this file format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L21)

- [mq3.format.md3.Tag](Type-mq3-format-md3-tag-546286911.md) — struct
<a id="constant-constant-mq3-format-md3-tag-size-const-tag-size-112-src-mq3-format-md3-ml-1769528577"></a>
### TAG_SIZE

```ml
const TAG_SIZE = 112
```

Serialized byte size of tag in this file format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L19)

<a id="constant-constant-mq3-format-md3-triangle-size-const-triangle-size-12-src-mq3-format-md3-ml-1236949574"></a>
### TRIANGLE_SIZE

```ml
const TRIANGLE_SIZE = 12
```

Serialized byte size of triangle in this file format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L23)

<a id="function-function-mq3-format-md3-u16-function-u16-data-offset-src-mq3-format-md3-ml-1646444591"></a>
### u16

```ml
function u16(data, offset)
```

Compute u 16 in format.md3; the normal completion returns `(data[offset] | (data[(offset + 1)] << 8))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L132)

<a id="function-function-mq3-format-md3-vec3-function-vec3-data-offset-src-mq3-format-md3-ml-1002134419"></a>
### vec3

```ml
function vec3(data, offset)
```

Compute format.md3.vec3 as `[f32(data, offset), f32(data, (offset + 4)), f32(data, (offset + 8))]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.format.md3.f32`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.format.md3.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L145)

<a id="constant-constant-mq3-format-md3-vertex-size-const-vertex-size-8-src-mq3-format-md3-ml-84675519"></a>
### VERTEX_SIZE

```ml
const VERTEX_SIZE = 8
```

Serialized byte size of vertex in this file format.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/md3.ml#L29)
