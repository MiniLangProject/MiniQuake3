# `src/mq3/renderer/draw_surfs.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.draw_surfs`](Package-mq3-renderer-draw-surfs-1108428545.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/sort.ml` as `sort` → `../MiniLangCompilerML/std/sort.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-draw-surfs-add-function-add-queue-surface-shaderindex-entitynum-fognum-dlightmap-src-mq3-renderer-draw-surfs-ml-898402830"></a>
### add

```ml
function add(queue, surface, shaderIndex, entityNum, fogNum, dlightMap)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |
| `shaderIndex` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `fogNum` | `dynamic` | — |  |
| `dlightMap` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L45)

<a id="function-function-mq3-renderer-draw-surfs-count-function-count-queue-src-mq3-renderer-draw-surfs-ml-30123153"></a>
### count

```ml
function count(queue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L57)

<a id="function-function-mq3-renderer-draw-surfs-create-function-create-capacity-src-mq3-renderer-draw-surfs-ml-1405911314"></a>
### create

```ml
function create(capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L25)

<a id="function-function-mq3-renderer-draw-surfs-createdefault-function-createdefault-src-mq3-renderer-draw-surfs-ml-1831083596"></a>
### createDefault

```ml
function createDefault()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L30)

<a id="function-function-mq3-renderer-draw-surfs-decompose-function-decompose-sortkey-src-mq3-renderer-draw-surfs-ml-1841597797"></a>
### decompose

```ml
function decompose(sortKey)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sortKey` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L40)

- [mq3.renderer.draw_surfs.DrawSurf](Type-mq3-renderer-draw-surfs-drawsurf-1972676811.md) — struct
<a id="function-function-mq3-renderer-draw-surfs-drawsurfless-function-drawsurfless-left-right-src-mq3-renderer-draw-surfs-ml-81288669"></a>
### drawSurfLess

```ml
function drawSurfLess(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L80)

<a id="function-function-mq3-renderer-draw-surfs-fail-function-fail-message-src-mq3-renderer-draw-surfs-ml-1940509643"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L19)

<a id="constant-constant-mq3-renderer-draw-surfs-max-drawsurfs-const-max-drawsurfs-65536-src-mq3-renderer-draw-surfs-ml-290909658"></a>
### MAX_DRAWSURFS

```ml
const MAX_DRAWSURFS = 65536
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L10)

<a id="constant-constant-mq3-renderer-draw-surfs-max-shaders-const-max-shaders-16384-src-mq3-renderer-draw-surfs-ml-903977173"></a>
### MAX_SHADERS

```ml
const MAX_SHADERS = 16384
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L9)

<a id="function-function-mq3-renderer-draw-surfs-pack-function-pack-shaderindex-entitynum-fognum-dlightmap-src-mq3-renderer-draw-surfs-ml-15751242"></a>
### pack

```ml
function pack(shaderIndex, entityNum, fogNum, dlightMap)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shaderIndex` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `fogNum` | `dynamic` | — |  |
| `dlightMap` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L32)

<a id="constant-constant-mq3-renderer-draw-surfs-qsort-entitynum-shift-const-qsort-entitynum-shift-7-src-mq3-renderer-draw-surfs-ml-1171204846"></a>
### QSORT_ENTITYNUM_SHIFT

```ml
const QSORT_ENTITYNUM_SHIFT = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L12)

<a id="constant-constant-mq3-renderer-draw-surfs-qsort-fognum-shift-const-qsort-fognum-shift-2-src-mq3-renderer-draw-surfs-ml-104813111"></a>
### QSORT_FOGNUM_SHIFT

```ml
const QSORT_FOGNUM_SHIFT = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L13)

<a id="constant-constant-mq3-renderer-draw-surfs-qsort-shadernum-shift-const-qsort-shadernum-shift-17-src-mq3-renderer-draw-surfs-ml-1634426427"></a>
### QSORT_SHADERNUM_SHIFT

```ml
const QSORT_SHADERNUM_SHIFT = 17
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L11)

- [mq3.renderer.draw_surfs.Queue](Type-mq3-renderer-draw-surfs-queue-429885024.md) — struct
- [mq3.renderer.draw_surfs.SortFields](Type-mq3-renderer-draw-surfs-sortfields-1426777600.md) — struct
<a id="function-function-mq3-renderer-draw-surfs-sortqueue-function-sortqueue-queue-src-mq3-renderer-draw-surfs-ml-1203549117"></a>
### sortQueue

```ml
function sortQueue(queue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L85)

<a id="function-function-mq3-renderer-draw-surfs-sortstable-function-sortstable-drawsurfs-src-mq3-renderer-draw-surfs-ml-820256599"></a>
### sortStable

```ml
function sortStable(drawSurfs)
```

Deterministic stable insertion ordering by the same unsigned packed key. Baseq3 only specifies key ordering; retaining tie order makes repeated submissions reproducible without changing renderer batching semantics.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `drawSurfs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L72)

<a id="function-function-mq3-renderer-draw-surfs-validcapacity-function-validcapacity-capacity-src-mq3-renderer-draw-surfs-ml-214236730"></a>
### validCapacity

```ml
function validCapacity(capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L21)

<a id="function-function-mq3-renderer-draw-surfs-values-function-values-queue-src-mq3-renderer-draw-surfs-ml-1311098351"></a>
### values

```ml
function values(queue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/draw_surfs.ml#L62)
