# `src/mq3/renderer/surface_grid.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.surface_grid`](Package-mq3-renderer-surface-grid-1618685277.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-renderer-surface-grid-appendvertex-function-appendvertex-batch-current-needsnormal-dlightbits-src-mq3-renderer-surface-grid-ml-332607665"></a>
### appendVertex

```ml
function appendVertex(batch, current, needsNormal, dlightBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |
| `needsNormal` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L57)

- [mq3.renderer.surface_grid.Batch](Type-mq3-renderer-surface-grid-batch-773045743.md) — struct
<a id="function-function-mq3-renderer-surface-grid-emptybatch-function-emptybatch-dlightbits-src-mq3-renderer-surface-grid-ml-841574518"></a>
### emptyBatch

```ml
function emptyBatch(dlightBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dlightBits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L53)

<a id="function-function-mq3-renderer-surface-grid-grid-function-grid-width-height-widthloderror-heightloderror-verts-src-mq3-renderer-surface-grid-ml-1424622866"></a>
### grid

```ml
function grid(width, height, widthLodError, heightLodError, verts)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `widthLodError` | `dynamic` | — |  |
| `heightLodError` | `dynamic` | — |  |
| `verts` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L17)

- [mq3.renderer.surface_grid.Grid](Type-mq3-renderer-surface-grid-grid-157659157.md) — struct
- [mq3.renderer.surface_grid.GridVertex](Type-mq3-renderer-surface-grid-gridvertex-961288407.md) — struct
<a id="function-function-mq3-renderer-surface-grid-selectaxis-function-selectaxis-size-loderrors-loderror-src-mq3-renderer-surface-grid-ml-1945675708"></a>
### selectAxis

```ml
function selectAxis(size, lodErrors, lodError)
```

RB_SurfaceGrid always retains both outer edges and keeps an interior row or column when its subdivision error is within the current volume LOD error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — |  |
| `lodErrors` | `dynamic` | — |  |
| `lodError` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L41)

- [mq3.renderer.surface_grid.Submission](Type-mq3-renderer-surface-grid-submission-1698658093.md) — struct
<a id="function-function-mq3-renderer-surface-grid-submit-function-submit-value-loderror-maxvertexes-maxindexes-needsnormal-dlightbits-src-mq3-renderer-surface-grid-ml-247846930"></a>
### submit

```ml
function submit(value, lodError, maxVertexes, maxIndexes, needsNormal, dlightBits)
```

Mirrors RB_SurfaceGrid's conservative row capacity calculation. Consecutive batches repeat their boundary row so every batch remains independently drawable.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `lodError` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |
| `needsNormal` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L72)

<a id="function-function-mq3-renderer-surface-grid-valid2-function-valid2-value-src-mq3-renderer-surface-grid-ml-1775349113"></a>
### valid2

```ml
function valid2(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L21)

<a id="function-function-mq3-renderer-surface-grid-valid3-function-valid3-value-src-mq3-renderer-surface-grid-ml-247598405"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L22)

<a id="function-function-mq3-renderer-surface-grid-valid4-function-valid4-value-src-mq3-renderer-surface-grid-ml-1248855677"></a>
### valid4

```ml
function valid4(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L23)

<a id="function-function-mq3-renderer-surface-grid-validategrid-function-validategrid-value-src-mq3-renderer-surface-grid-ml-531134893"></a>
### validateGrid

```ml
function validateGrid(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L28)

<a id="function-function-mq3-renderer-surface-grid-validvertex-function-validvertex-value-src-mq3-renderer-surface-grid-ml-844892869"></a>
### validVertex

```ml
function validVertex(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L24)

<a id="function-function-mq3-renderer-surface-grid-vertex-function-vertex-xyz-normal-st-lightmap-color-src-mq3-renderer-surface-grid-ml-240179550"></a>
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L13)
