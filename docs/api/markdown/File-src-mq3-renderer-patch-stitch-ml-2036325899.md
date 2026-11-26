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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L10)

<a id="function-function-mq3-renderer-patch-stitch-atposition-function-atposition-vertex-position-src-mq3-renderer-patch-stitch-ml-672914319"></a>
### atPosition

```ml
function atPosition(vertex, position)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertex` | `dynamic` | — |  |
| `position` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L64)

<a id="function-function-mq3-renderer-patch-stitch-copyloderrors-function-copyloderrors-source-target-src-mq3-renderer-patch-stitch-ml-1653670492"></a>
### copyLodErrors

```ml
function copyLodErrors(source, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L27)

<a id="function-function-mq3-renderer-patch-stitch-edgecount-function-edgecount-grid-side-src-mq3-renderer-patch-stitch-ml-739878509"></a>
### edgeCount

```ml
function edgeCount(grid, side)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `side` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L15)

<a id="function-function-mq3-renderer-patch-stitch-edgeerrors-function-edgeerrors-grid-side-src-mq3-renderer-patch-stitch-ml-1630853365"></a>
### edgeErrors

```ml
function edgeErrors(grid, side)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `side` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L16)

<a id="function-function-mq3-renderer-patch-stitch-edgepoint-function-edgepoint-grid-side-index-src-mq3-renderer-patch-stitch-ml-1705581003"></a>
### edgePoint

```ml
function edgePoint(grid, side, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `side` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L14)

<a id="function-function-mq3-renderer-patch-stitch-insertcolumn-function-insertcolumn-grid-column-row-vertex-errorvalue-src-mq3-renderer-patch-stitch-ml-2114124455"></a>
### insertColumn

```ml
function insertColumn(grid, column, row, vertex, errorValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `column` | `dynamic` | — |  |
| `row` | `dynamic` | — |  |
| `vertex` | `dynamic` | — |  |
| `errorValue` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L65)

<a id="function-function-mq3-renderer-patch-stitch-inserterror-function-inserterror-source-at-value-src-mq3-renderer-patch-stitch-ml-616548515"></a>
### insertError

```ml
function insertError(source, at, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `at` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L93)

<a id="function-function-mq3-renderer-patch-stitch-insertrow-function-insertrow-grid-row-column-vertex-errorvalue-src-mq3-renderer-patch-stitch-ml-1928246629"></a>
### insertRow

```ml
function insertRow(grid, row, column, vertex, errorValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `row` | `dynamic` | — |  |
| `column` | `dynamic` | — |  |
| `vertex` | `dynamic` | — |  |
| `errorValue` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L79)

<a id="constant-constant-mq3-renderer-patch-stitch-max-grid-size-const-max-grid-size-65-src-mq3-renderer-patch-stitch-ml-1555339004"></a>
### MAX_GRID_SIZE

```ml
const MAX_GRID_SIZE = 65
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L8)

<a id="function-function-mq3-renderer-patch-stitch-mergededge-function-mergededge-grid-side-src-mq3-renderer-patch-stitch-ml-1180086381"></a>
### mergedEdge

```ml
function mergedEdge(grid, side)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `side` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L17)

<a id="function-function-mq3-renderer-patch-stitch-nearpoint-function-nearpoint-a-b-tolerance-src-mq3-renderer-patch-stitch-ml-1099137978"></a>
### nearPoint

```ml
function nearPoint(a, b, tolerance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `tolerance` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L11)

<a id="function-function-mq3-renderer-patch-stitch-r-fixsharedvertexloderror-function-r-fixsharedvertexloderror-grids-src-mq3-renderer-patch-stitch-ml-2116539513"></a>
### R_FixSharedVertexLodError

```ml
function R_FixSharedVertexLodError(grids)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L62)

<a id="function-function-mq3-renderer-patch-stitch-r-fixsharedvertexloderror-r-function-r-fixsharedvertexloderror-r-grids-start-grid-src-mq3-renderer-patch-stitch-ml-1068103967"></a>
### R_FixSharedVertexLodError_r

```ml
function R_FixSharedVertexLodError_r(grids, start, grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L51)

<a id="function-function-mq3-renderer-patch-stitch-r-stitchallpatches-function-r-stitchallpatches-grids-src-mq3-renderer-patch-stitch-ml-1687136533"></a>
### R_StitchAllPatches

```ml
function R_StitchAllPatches(grids)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grids` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L116)

<a id="function-function-mq3-renderer-patch-stitch-r-stitchpatches-function-r-stitchpatches-grid1-grid2-src-mq3-renderer-patch-stitch-ml-1234463105"></a>
### R_StitchPatches

```ml
function R_StitchPatches(grid1, grid2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid1` | `dynamic` | — |  |
| `grid2` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L99)

<a id="function-function-mq3-renderer-patch-stitch-samelodgroup-function-samelodgroup-a-b-src-mq3-renderer-patch-stitch-ml-1120768229"></a>
### sameLodGroup

```ml
function sameLodGroup(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/patch_stitch.ml#L12)
