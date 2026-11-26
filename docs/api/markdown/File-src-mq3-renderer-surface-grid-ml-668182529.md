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

Updates `batch.xyz`, `batch.normals`, `batch.texCoords`, `batch.colors`, `batch.vertexDlightBits` in `mq3.renderer.surface_grid.appendVertex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Mutable record or buffer; this call updates `batch.xyz`, `batch.normals`, `batch.texCoords`, `batch.colors`, `batch.vertexDlightBits`. |
| `current` | `dynamic` | — | Record providing `current.xyz`, `current.normal`, `current.st`, `current.lightmap`, `current.color`. |
| `needsNormal` | `dynamic` | — | Input tested by `needsNormal`. |
| `dlightBits` | `dynamic` | — | Input used by `batch.vertexDlightBits=batch.vertexDlightBits+[dlightBits]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L149)

- [mq3.renderer.surface_grid.Batch](Type-mq3-renderer-surface-grid-batch-773045743.md) — struct
<a id="function-function-mq3-renderer-surface-grid-emptybatch-function-emptybatch-dlightbits-src-mq3-renderer-surface-grid-ml-841574518"></a>
### emptyBatch

```ml
function emptyBatch(dlightBits)
```

Constructs `mq3.renderer.surface_grid.Batch` with `xyz` = `[]`, `normals` = `[]`, `texCoords` = `[]`, `colors` = `[]` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dlightBits` | `dynamic` | — | Initial value for `mq3.renderer.surface_grid.Batch.dlightBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L140)

<a id="function-function-mq3-renderer-surface-grid-grid-function-grid-width-height-widthloderror-heightloderror-verts-src-mq3-renderer-surface-grid-ml-1424622866"></a>
### grid

```ml
function grid(width, height, widthLodError, heightLodError, verts)
```

Constructs `mq3.renderer.surface_grid.Grid` from `width`, `height`, `widthLodError`, `heightLodError`, `verts`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Initial value for `mq3.renderer.surface_grid.Grid.width`. |
| `height` | `dynamic` | — | Initial value for `mq3.renderer.surface_grid.Grid.height`. |
| `widthLodError` | `dynamic` | — | Initial value for `mq3.renderer.surface_grid.Grid.widthLodError`. |
| `heightLodError` | `dynamic` | — | Initial value for `mq3.renderer.surface_grid.Grid.heightLodError`. |
| `verts` | `dynamic` | — | Initial value for `mq3.renderer.surface_grid.Grid.verts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L89)

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
| `size` | `dynamic` | — | Input tested by `size>2`. |
| `lodErrors` | `dynamic` | — | Indexed input read at `i`. |
| `lodError` | `dynamic` | — | Input tested by `lodErrors[i]<=lodError`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L126)

- [mq3.renderer.surface_grid.Submission](Type-mq3-renderer-surface-grid-submission-1698658093.md) — struct
<a id="function-function-mq3-renderer-surface-grid-submit-function-submit-value-loderror-maxvertexes-maxindexes-needsnormal-dlightbits-src-mq3-renderer-surface-grid-ml-247846930"></a>
### submit

```ml
function submit(value, lodError, maxVertexes, maxIndexes, needsNormal, dlightBits)
```

Mirrors RB_SurfaceGrid's conservative row capacity calculation. Consecutive batches repeat their boundary row so every batch remains independently drawable.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.width`, `value.widthLodError`, `value.height`, `value.heightLodError`, `value.verts`. |
| `lodError` | `dynamic` | — | Value forwarded as `lodError` to `mq3.renderer.surface_grid.selectAxis`. |
| `maxVertexes` | `dynamic` | — | Input tested by `maxVertexes<1 or maxIndexes<1`. |
| `maxIndexes` | `dynamic` | — | Input tested by `maxVertexes<1 or maxIndexes<1`. |
| `needsNormal` | `dynamic` | — | Value forwarded as `needsNormal` to `mq3.renderer.surface_grid.appendVertex`. |
| `dlightBits` | `dynamic` | — | Initial value for `mq3.renderer.surface_grid.Submission.dlightBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L170)

<a id="function-function-mq3-renderer-surface-grid-valid2-function-valid2-value-src-mq3-renderer-surface-grid-ml-1775349113"></a>
### valid2

```ml
function valid2(value)
```

Computes `value!=void and len(value)==2` for `mq3.renderer.surface_grid.valid2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L95)

<a id="function-function-mq3-renderer-surface-grid-valid3-function-valid3-value-src-mq3-renderer-surface-grid-ml-247598405"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.surface_grid.valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L98)

<a id="function-function-mq3-renderer-surface-grid-valid4-function-valid4-value-src-mq3-renderer-surface-grid-ml-1248855677"></a>
### valid4

```ml
function valid4(value)
```

Computes `value!=void and len(value)==4` for `mq3.renderer.surface_grid.valid4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==4`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L101)

<a id="function-function-mq3-renderer-surface-grid-validategrid-function-validategrid-value-src-mq3-renderer-surface-grid-ml-531134893"></a>
### validateGrid

```ml
function validateGrid(value)
```

Checks grid dimensions, LOD-error table lengths, total vertex count, and every grid vertex.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.width`, `value.height`, `value.widthLodError`, `value.heightLodError`, `value.verts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L110)

<a id="function-function-mq3-renderer-surface-grid-validvertex-function-validvertex-value-src-mq3-renderer-surface-grid-ml-844892869"></a>
### validVertex

```ml
function validVertex(value)
```

Computes `value!=void and valid3(value.xyz) and valid3(value.normal) and valid2(value.st) and valid2(value.lightmap) and valid4(value.color)` for `mq3.renderer.surface_grid.validVertex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.xyz`, `value.normal`, `value.st`, `value.lightmap`, `value.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L104)

<a id="function-function-mq3-renderer-surface-grid-vertex-function-vertex-xyz-normal-st-lightmap-color-src-mq3-renderer-surface-grid-ml-240179550"></a>
### vertex

```ml
function vertex(xyz, normal, st, lightmap, color)
```

Constructs `mq3.renderer.surface_grid.GridVertex` with `color` = `[color[0]&255,color[1]&255,color[2]&255,color[3]&255]` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `xyz` | `dynamic` | — | Initial value for `mq3.renderer.surface_grid.GridVertex.xyz`. |
| `normal` | `dynamic` | — | Initial value for `mq3.renderer.surface_grid.GridVertex.normal`. |
| `st` | `dynamic` | — | Initial value for `mq3.renderer.surface_grid.GridVertex.st`. |
| `lightmap` | `dynamic` | — | Initial value for `mq3.renderer.surface_grid.GridVertex.lightmap`. |
| `color` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L79)
