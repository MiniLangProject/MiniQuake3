# `src/mq3/renderer/draw_surfs.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.draw_surfs`](Package-mq3-renderer-draw-surfs-1108428545.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/sort.ml` as `sort` → `../../a7594a0c0299/MiniLangCompilerML/std/sort.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-draw-surfs-add-function-add-queue-surface-shaderindex-entitynum-fognum-dlightmap-src-mq3-renderer-draw-surfs-ml-898402830"></a>
### add

```ml
function add(queue, surface, shaderIndex, entityNum, fogNum, dlightMap)
```

Updates `queue.drawSurfs[index]`, `queue.numDrawSurfs`, `queue.nextOrdinal` in `mq3.renderer.draw_surfs.add`; returns `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Mutable record or buffer; this call updates `queue.drawSurfs[index]`, `queue.numDrawSurfs`, `queue.nextOrdinal`. |
| `surface` | `dynamic` | — | Value used for `mq3.renderer.draw_surfs.DrawSurf.surface`. |
| `shaderIndex` | `dynamic` | — | Value forwarded as `shaderIndex` to `mq3.renderer.draw_surfs.pack`. |
| `entityNum` | `dynamic` | — | Value forwarded as `entityNum` to `mq3.renderer.draw_surfs.pack`. |
| `fogNum` | `dynamic` | — | Value forwarded as `fogNum` to `mq3.renderer.draw_surfs.pack`. |
| `dlightMap` | `dynamic` | — | Value forwarded as `dlightMap` to `mq3.renderer.draw_surfs.pack`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L99)

<a id="function-function-mq3-renderer-draw-surfs-count-function-count-queue-src-mq3-renderer-draw-surfs-ml-30123153"></a>
### count

```ml
function count(queue)
```

Returns `queue.capacity` from `mq3.renderer.draw_surfs.count`; earlier branches return `queue.numDrawSurfs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Record providing `queue.numDrawSurfs`, `queue.capacity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L113)

<a id="function-function-mq3-renderer-draw-surfs-create-function-create-capacity-src-mq3-renderer-draw-surfs-ml-1405911314"></a>
### create

```ml
function create(capacity)
```

Builds `mq3.renderer.draw_surfs.Queue` for `mq3.renderer.draw_surfs.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Initial value for `mq3.renderer.draw_surfs.Queue.capacity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L64)

<a id="function-function-mq3-renderer-draw-surfs-createdefault-function-createdefault-src-mq3-renderer-draw-surfs-ml-1831083596"></a>
### createDefault

```ml
function createDefault()
```

Calls `mq3.renderer.draw_surfs.create` with `(MAX_DRAWSURFS)` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L70)

<a id="function-function-mq3-renderer-draw-surfs-decompose-function-decompose-sortkey-src-mq3-renderer-draw-surfs-ml-1841597797"></a>
### decompose

```ml
function decompose(sortKey)
```

Builds `mq3.renderer.draw_surfs.SortFields` for `mq3.renderer.draw_surfs.decompose`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sortKey` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.u32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L87)

- [mq3.renderer.draw_surfs.DrawSurf](Type-mq3-renderer-draw-surfs-drawsurf-1972676811.md) — struct
<a id="function-function-mq3-renderer-draw-surfs-drawsurfless-function-drawsurfless-left-right-src-mq3-renderer-draw-surfs-ml-81288669"></a>
### drawSurfLess

```ml
function drawSurfLess(left, right)
```

Returns `left.ordinal<right.ordinal` from `mq3.renderer.draw_surfs.drawSurfLess`; earlier branches return `true`, `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Record providing `left.sort`, `left.ordinal`. |
| `right` | `dynamic` | — | Record providing `right.sort`, `right.ordinal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L142)

<a id="function-function-mq3-renderer-draw-surfs-fail-function-fail-message-src-mq3-renderer-draw-surfs-ml-1940509643"></a>
### fail

```ml
function fail(message)
```

Creates error `7340` with message `"draw surfaces: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7340,"draw surfaces: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L54)

<a id="constant-constant-mq3-renderer-draw-surfs-max-drawsurfs-const-max-drawsurfs-65536-src-mq3-renderer-draw-surfs-ml-290909658"></a>
### MAX_DRAWSURFS

```ml
const MAX_DRAWSURFS = 65536
```

Capacity of the draw-surface ring used when queuing scene geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L12)

<a id="constant-constant-mq3-renderer-draw-surfs-max-shaders-const-max-shaders-16384-src-mq3-renderer-draw-surfs-ml-903977173"></a>
### MAX_SHADERS

```ml
const MAX_SHADERS = 16384
```

Maximum number of shader records registered by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L10)

<a id="function-function-mq3-renderer-draw-surfs-pack-function-pack-shaderindex-entitynum-fognum-dlightmap-src-mq3-renderer-draw-surfs-ml-15751242"></a>
### pack

```ml
function pack(shaderIndex, entityNum, fogNum, dlightMap)
```

Validates shader/entity/fog/lightmap ranges and packs them into a draw-surface sort key.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shaderIndex` | `dynamic` | — | Input tested by `shaderIndex<0 or shaderIndex>=MAX_SHADERS`. |
| `entityNum` | `dynamic` | — | Input tested by `entityNum<0 or entityNum>1023`. |
| `fogNum` | `dynamic` | — | Input tested by `fogNum<0 or fogNum>31`. |
| `dlightMap` | `dynamic` | — | Input tested by `dlightMap<0 or dlightMap>3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L77)

<a id="constant-constant-mq3-renderer-draw-surfs-qsort-entitynum-shift-const-qsort-entitynum-shift-7-src-mq3-renderer-draw-surfs-ml-1171204846"></a>
### QSORT_ENTITYNUM_SHIFT

```ml
const QSORT_ENTITYNUM_SHIFT = 7
```

Bit position of the entity number in a packed draw-surface sort key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L16)

<a id="constant-constant-mq3-renderer-draw-surfs-qsort-fognum-shift-const-qsort-fognum-shift-2-src-mq3-renderer-draw-surfs-ml-104813111"></a>
### QSORT_FOGNUM_SHIFT

```ml
const QSORT_FOGNUM_SHIFT = 2
```

Bit position of the fog number in a packed draw-surface sort key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L18)

<a id="constant-constant-mq3-renderer-draw-surfs-qsort-shadernum-shift-const-qsort-shadernum-shift-17-src-mq3-renderer-draw-surfs-ml-1634426427"></a>
### QSORT_SHADERNUM_SHIFT

```ml
const QSORT_SHADERNUM_SHIFT = 17
```

Bit position of the shader index in a packed draw-surface sort key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L14)

- [mq3.renderer.draw_surfs.Queue](Type-mq3-renderer-draw-surfs-queue-429885024.md) — struct
- [mq3.renderer.draw_surfs.SortFields](Type-mq3-renderer-draw-surfs-sortfields-1426777600.md) — struct
<a id="function-function-mq3-renderer-draw-surfs-sortqueue-function-sortqueue-queue-src-mq3-renderer-draw-surfs-ml-1203549117"></a>
### sortQueue

```ml
function sortQueue(queue)
```

Updates `queue.drawSurfs[index]` in `mq3.renderer.draw_surfs.sortQueue`; returns `list`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Mutable record or buffer; this call updates `queue.drawSurfs[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L149)

<a id="function-function-mq3-renderer-draw-surfs-sortstable-function-sortstable-drawsurfs-src-mq3-renderer-draw-surfs-ml-820256599"></a>
### sortStable

```ml
function sortStable(drawSurfs)
```

Deterministic stable insertion ordering by the same unsigned packed key. Baseq3 only specifies key ordering; retaining tie order makes repeated submissions reproducible without changing renderer batching semantics.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `drawSurfs` | `dynamic` | — | Argument 3 supplied to `copyArray`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L131)

<a id="function-function-mq3-renderer-draw-surfs-validcapacity-function-validcapacity-capacity-src-mq3-renderer-draw-surfs-ml-214236730"></a>
### validCapacity

```ml
function validCapacity(capacity)
```

Computes `capacity>0 and capacity<=MAX_DRAWSURFS and (capacity&(capacity-1))==0` for `mq3.renderer.draw_surfs.validCapacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Input used in the result expression `capacity>0 and capacity<=MAX_DRAWSURFS and (capacity&(capacity-1))==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L58)

<a id="function-function-mq3-renderer-draw-surfs-values-function-values-queue-src-mq3-renderer-draw-surfs-ml-1311098351"></a>
### values

```ml
function values(queue)
```

Builds `result[index]` in `mq3.renderer.draw_surfs.values`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Record providing `queue.drawSurfs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L120)
