# `src/mq3/renderer/patch_stitch.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.patch_stitch`](Package-mq3-renderer-patch-stitch-913574107.md)

Reachable from entry: **yes**

## Imports

- `mq3/renderer/bsp_render_data.ml` as `render` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)

## Declarations

<a id="function-function-mq3-renderer-patch-stitch-abs-function-abs-value-src-mq3-renderer-patch-stitch-ml-1723897493"></a>
### abs

```ml
function abs(value)
```

Returns `value` from `mq3.renderer.patch_stitch.abs`; earlier branches return `0.0-value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value<0.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L13)

<a id="function-function-mq3-renderer-patch-stitch-atposition-function-atposition-vertex-position-src-mq3-renderer-patch-stitch-ml-672914319"></a>
### atPosition

```ml
function atPosition(vertex, position)
```

Forwards `atPosition` to `mq3.renderer.bsp_render_data.RenderVertex` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertex` | `dynamic` | — | Record providing `vertex.baseUV`, `vertex.lightmapUV`, `vertex.normal`, `vertex.color`, `vertex.entityColor`, `vertex.entityTexCoord`. |
| `position` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.bsp_render_data.RenderVertex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L99)

<a id="function-function-mq3-renderer-patch-stitch-copyloderrors-function-copyloderrors-source-target-src-mq3-renderer-patch-stitch-ml-1653670492"></a>
### copyLodErrors

```ml
function copyLodErrors(source, target)
```

Builds `validTarget[side]`, `targetErrors[second]` in `mq3.renderer.patch_stitch.copyLodErrors`; returns `touched`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.patch_stitch.edgeCount`. |
| `target` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.patch_stitch.mergedEdge`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L53)

<a id="function-function-mq3-renderer-patch-stitch-edgecount-function-edgecount-grid-side-src-mq3-renderer-patch-stitch-ml-739878509"></a>
### edgeCount

```ml
function edgeCount(grid, side)
```

Returns `grid.height` from `mq3.renderer.patch_stitch.edgeCount`; earlier branches return `grid.width`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record providing `grid.width`, `grid.height`. |
| `side` | `dynamic` | — | Input tested by `side<2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L32)

<a id="function-function-mq3-renderer-patch-stitch-edgeerrors-function-edgeerrors-grid-side-src-mq3-renderer-patch-stitch-ml-1630853365"></a>
### edgeErrors

```ml
function edgeErrors(grid, side)
```

Returns `grid.heightLodError` from `mq3.renderer.patch_stitch.edgeErrors`; earlier branches return `grid.widthLodError`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record providing `grid.widthLodError`, `grid.heightLodError`. |
| `side` | `dynamic` | — | Input tested by `side<2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L36)

<a id="function-function-mq3-renderer-patch-stitch-edgepoint-function-edgepoint-grid-side-index-src-mq3-renderer-patch-stitch-ml-1705581003"></a>
### edgePoint

```ml
function edgePoint(grid, side, index)
```

Computes `edgePoint` from `grid.control[index*grid.width+grid.width-1]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record providing `grid.control`, `grid.height`, `grid.width`. |
| `side` | `dynamic` | — | Input tested by `side==0`. |
| `index` | `dynamic` | — | Input tested by `side==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L28)

<a id="function-function-mq3-renderer-patch-stitch-insertcolumn-function-insertcolumn-grid-column-row-vertex-errorvalue-src-mq3-renderer-patch-stitch-ml-2114124455"></a>
### insertColumn

```ml
function insertColumn(grid, column, row, vertex, errorValue)
```

Updates `grid.widthLodError`, `grid.control`, `grid.width` in `mq3.renderer.patch_stitch.insertColumn`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Mutable record or buffer; this call updates `grid.widthLodError`, `grid.control`, `grid.width`. |
| `column` | `dynamic` | — | Argument 5 supplied to `copyArray`. |
| `row` | `dynamic` | — | Input tested by `currentRow==row`. |
| `vertex` | `dynamic` | — | Record providing `vertex.position`. |
| `errorValue` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.patch_stitch.insertError`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L106)

<a id="function-function-mq3-renderer-patch-stitch-inserterror-function-inserterror-source-at-value-src-mq3-renderer-patch-stitch-ml-616548515"></a>
### insertError

```ml
function insertError(source, at, value)
```

Builds `result[at]` in `mq3.renderer.patch_stitch.insertError`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Argument 3 supplied to `copyArray`. |
| `at` | `dynamic` | — | Argument 5 supplied to `copyArray`. |
| `value` | `dynamic` | — | Value assigned to `result[at]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L144)

<a id="function-function-mq3-renderer-patch-stitch-insertrow-function-insertrow-grid-row-column-vertex-errorvalue-src-mq3-renderer-patch-stitch-ml-1928246629"></a>
### insertRow

```ml
function insertRow(grid, row, column, vertex, errorValue)
```

Updates `grid.heightLodError`, `grid.control`, `grid.height` in `mq3.renderer.patch_stitch.insertRow`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Mutable record or buffer; this call updates `grid.heightLodError`, `grid.control`, `grid.height`. |
| `row` | `dynamic` | — | Value forwarded as `at` to `mq3.renderer.patch_stitch.insertError`. |
| `column` | `dynamic` | — | Input tested by `col==column`. |
| `vertex` | `dynamic` | — | Record providing `vertex.position`. |
| `errorValue` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.patch_stitch.insertError`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L126)

<a id="constant-constant-mq3-renderer-patch-stitch-max-grid-size-const-max-grid-size-65-src-mq3-renderer-patch-stitch-ml-1555339004"></a>
### MAX_GRID_SIZE

```ml
const MAX_GRID_SIZE = 65
```

Largest tessellated patch-grid dimension accepted by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L9)

<a id="function-function-mq3-renderer-patch-stitch-mergededge-function-mergededge-grid-side-src-mq3-renderer-patch-stitch-ml-1180086381"></a>
### mergedEdge

```ml
function mergedEdge(grid, side)
```

Detects nearly coincident interior control points on an edge using a 0.1-unit tolerance.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Value forwarded as `grid` to `mq3.renderer.patch_stitch.edgeCount`. |
| `side` | `dynamic` | — | Value forwarded as `side` to `mq3.renderer.patch_stitch.edgeCount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L40)

<a id="function-function-mq3-renderer-patch-stitch-nearpoint-function-nearpoint-a-b-tolerance-src-mq3-renderer-patch-stitch-ml-1099137978"></a>
### nearPoint

```ml
function nearPoint(a, b, tolerance)
```

Computes `abs(a[0]-b[0])<=tolerance and abs(a[1]-b[1])<=tolerance and abs(a[2]-b[2])<=tolerance` for `mq3.renderer.patch_stitch.nearPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `tolerance` | `dynamic` | — | Input used in the result expression `abs(a[0]-b[0])<=tolerance and abs(a[1]-b[1])<=tolerance and abs(a[2]-b[2])<=tolerance`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L18)

<a id="function-function-mq3-renderer-patch-stitch-r-fixsharedvertexloderror-function-r-fixsharedvertexloderror-grids-src-mq3-renderer-patch-stitch-ml-2116539513"></a>
### R_FixSharedVertexLodError

```ml
function R_FixSharedVertexLodError(grids)
```

Updates `grids[index].lodFixed` in `mq3.renderer.patch_stitch.R_FixSharedVertexLodError`; returns `grids`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — | Mutable record or buffer; this call updates `grids[index].lodFixed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L94)

<a id="function-function-mq3-renderer-patch-stitch-r-fixsharedvertexloderror-r-function-r-fixsharedvertexloderror-r-grids-start-grid-src-mq3-renderer-patch-stitch-ml-1068103967"></a>
### R_FixSharedVertexLodError_r

```ml
function R_FixSharedVertexLodError_r(grids, start, grid)
```

Builds `other.lodFixed` in `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — | Value forwarded as `grids` to `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r`. |
| `start` | `dynamic` | — | Value forwarded as `start` to `mq3.renderer.patch_stitch.R_FixSharedVertexLodError_r`. |
| `grid` | `dynamic` | — | Value forwarded as `a` to `mq3.renderer.patch_stitch.sameLodGroup`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L81)

<a id="function-function-mq3-renderer-patch-stitch-r-stitchallpatches-function-r-stitchallpatches-grids-src-mq3-renderer-patch-stitch-ml-1687136533"></a>
### R_StitchAllPatches

```ml
function R_StitchAllPatches(grids)
```

Repeats pairwise patch stitching until no changes remain or the grid-size guard is reached.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — | Indexed input read at `i`, `j`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L172)

<a id="function-function-mq3-renderer-patch-stitch-r-stitchpatches-function-r-stitchpatches-grid1-grid2-src-mq3-renderer-patch-stitch-ml-1234463105"></a>
### R_StitchPatches

```ml
function R_StitchPatches(grid1, grid2)
```

Updates `grid2.lodStitched` in `mq3.renderer.patch_stitch.R_StitchPatches`; returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid1` | `dynamic` | — | Value forwarded as `a` to `mq3.renderer.patch_stitch.sameLodGroup`. |
| `grid2` | `dynamic` | — | Mutable record or buffer; this call updates `grid2.lodStitched`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L153)

<a id="function-function-mq3-renderer-patch-stitch-samelodgroup-function-samelodgroup-a-b-src-mq3-renderer-patch-stitch-ml-1120768229"></a>
### sameLodGroup

```ml
function sameLodGroup(a, b)
```

Computes `a.lodRadius==b.lodRadius and a.lodOrigin==b.lodOrigin` for `mq3.renderer.patch_stitch.sameLodGroup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record providing `a.lodRadius`, `a.lodOrigin`. |
| `b` | `dynamic` | — | Record providing `b.lodRadius`, `b.lodOrigin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L22)
