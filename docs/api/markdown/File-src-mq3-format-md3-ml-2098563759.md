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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L46)

<a id="function-function-mq3-format-md3-fail-function-fail-message-src-mq3-format-md3-ml-1607374501"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L34)

<a id="function-function-mq3-format-md3-fixedstring-function-fixedstring-data-offset-capacity-src-mq3-format-md3-ml-933970441"></a>
### fixedString

```ml
function fixedString(data, offset, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L50)

- [mq3.format.md3.Frame](Type-mq3-format-md3-frame-922445738.md) — struct
<a id="constant-constant-mq3-format-md3-frame-size-const-frame-size-56-src-mq3-format-md3-ml-2050191506"></a>
### FRAME_SIZE

```ml
const FRAME_SIZE = 56
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L13)

<a id="constant-constant-mq3-format-md3-header-size-const-header-size-108-src-mq3-format-md3-ml-811895768"></a>
### HEADER_SIZE

```ml
const HEADER_SIZE = 108
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L12)

<a id="function-function-mq3-format-md3-i32-function-i32-data-offset-src-mq3-format-md3-ml-2087039335"></a>
### i32

```ml
function i32(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L39)

<a id="function-function-mq3-format-md3-load-function-load-data-src-mq3-format-md3-ml-1715294826"></a>
### load

```ml
function load(data)
```

Both representations pass through the identical complete parser/validation. Public load keeps its eagerly decoded reference frames unchanged.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L68)

<a id="function-function-mq3-format-md3-loadmode-function-loadmode-data-packedonly-src-mq3-format-md3-ml-612140672"></a>
### loadMode

```ml
function loadMode(data, packedOnly)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `packedOnly` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L70)

<a id="function-function-mq3-format-md3-loadpacked-function-loadpacked-data-src-mq3-format-md3-ml-539771930"></a>
### loadPacked

```ml
function loadPacked(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L69)

<a id="constant-constant-mq3-format-md3-max-frames-const-max-frames-1024-src-mq3-format-md3-ml-37711406"></a>
### MAX_FRAMES

```ml
const MAX_FRAMES = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L21)

<a id="constant-constant-mq3-format-md3-max-shaders-const-max-shaders-256-src-mq3-format-md3-ml-1484682338"></a>
### MAX_SHADERS

```ml
const MAX_SHADERS = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L24)

<a id="constant-constant-mq3-format-md3-max-surfaces-const-max-surfaces-128-src-mq3-format-md3-ml-983238210"></a>
### MAX_SURFACES

```ml
const MAX_SURFACES = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L23)

<a id="constant-constant-mq3-format-md3-max-tags-const-max-tags-256-src-mq3-format-md3-ml-602821212"></a>
### MAX_TAGS

```ml
const MAX_TAGS = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L22)

<a id="constant-constant-mq3-format-md3-max-triangles-const-max-triangles-8192-src-mq3-format-md3-ml-1940072281"></a>
### MAX_TRIANGLES

```ml
const MAX_TRIANGLES = 8192
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L26)

<a id="constant-constant-mq3-format-md3-max-verts-const-max-verts-4096-src-mq3-format-md3-ml-1744185418"></a>
### MAX_VERTS

```ml
const MAX_VERTS = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L25)

<a id="constant-constant-mq3-format-md3-md3-ident-const-md3-ident-860898377-src-mq3-format-md3-ml-1502428789"></a>
### MD3_IDENT

```ml
const MD3_IDENT = 860898377
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L10)

<a id="constant-constant-mq3-format-md3-md3-version-const-md3-version-15-src-mq3-format-md3-ml-1548984363"></a>
### MD3_VERSION

```ml
const MD3_VERSION = 15
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L11)

- [mq3.format.md3.Model](Type-mq3-format-md3-model-1313758702.md) — struct
<a id="function-function-mq3-format-md3-normalizesurfacenames-function-normalizesurfacenames-model-src-mq3-format-md3-ml-269156491"></a>
### normalizeSurfaceNames

```ml
function normalizeSurfaceNames(model)
```

The renderer strips a trailing LOD suffix before resolving skin mappings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L57)

- [mq3.format.md3.RenderTriangle](Type-mq3-format-md3-rendertriangle-1832924873.md) — struct
<a id="function-function-mq3-format-md3-rendertriangles-function-rendertriangles-model-surfaceindex-frame-oldframe-backlerp-maxtriangles-src-mq3-format-md3-ml-1061731114"></a>
### renderTriangles

```ml
function renderTriangles(model, surfaceIndex, frame, oldFrame, backlerp, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L187)

<a id="function-function-mq3-format-md3-rendertrianglescached-function-rendertrianglescached-model-surfaceindex-frame-oldframe-backlerp-maxtriangles-normaltable-src-mq3-format-md3-ml-1576240683"></a>
### renderTrianglesCached

```ml
function renderTrianglesCached(model, surfaceIndex, frame, oldFrame, backlerp, maxTriangles, normalTable)
```

Produces renderer-neutral animated triangles for the playable preview.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |
| `normalTable` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L168)

<a id="constant-constant-mq3-format-md3-shader-size-const-shader-size-68-src-mq3-format-md3-ml-1019907547"></a>
### SHADER_SIZE

```ml
const SHADER_SIZE = 68
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L17)

<a id="function-function-mq3-format-md3-span-function-span-offset-size-limit-src-mq3-format-md3-ml-1019221547"></a>
### span

```ml
function span(offset, size, limit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `offset` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L35)

<a id="constant-constant-mq3-format-md3-st-size-const-st-size-8-src-mq3-format-md3-ml-927917883"></a>
### ST_SIZE

```ml
const ST_SIZE = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L18)

- [mq3.format.md3.Surface](Type-mq3-format-md3-surface-1880876672.md) — struct
<a id="constant-constant-mq3-format-md3-surface-size-const-surface-size-108-src-mq3-format-md3-ml-1939950728"></a>
### SURFACE_SIZE

```ml
const SURFACE_SIZE = 108
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L15)

- [mq3.format.md3.Tag](Type-mq3-format-md3-tag-546286911.md) — struct
<a id="constant-constant-mq3-format-md3-tag-size-const-tag-size-112-src-mq3-format-md3-ml-1769528577"></a>
### TAG_SIZE

```ml
const TAG_SIZE = 112
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L14)

<a id="constant-constant-mq3-format-md3-triangle-size-const-triangle-size-12-src-mq3-format-md3-ml-1236949574"></a>
### TRIANGLE_SIZE

```ml
const TRIANGLE_SIZE = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L16)

<a id="function-function-mq3-format-md3-u16-function-u16-data-offset-src-mq3-format-md3-ml-1646444591"></a>
### u16

```ml
function u16(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L42)

<a id="function-function-mq3-format-md3-vec3-function-vec3-data-offset-src-mq3-format-md3-ml-1002134419"></a>
### vec3

```ml
function vec3(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L49)

<a id="constant-constant-mq3-format-md3-vertex-size-const-vertex-size-8-src-mq3-format-md3-ml-84675519"></a>
### VERTEX_SIZE

```ml
const VERTEX_SIZE = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/md3.ml#L19)
