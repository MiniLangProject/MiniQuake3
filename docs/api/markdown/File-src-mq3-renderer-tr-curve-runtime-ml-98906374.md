# `src/mq3/renderer/tr_curve_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_curve_runtime`](Package-mq3-renderer-tr-curve-runtime-1307470332.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/bsp_render_data.ml` as `render` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)

## Declarations

<a id="function-function-mq3-renderer-tr-curve-runtime-bounds-function-bounds-vertices-src-mq3-renderer-tr-curve-runtime-ml-26599191"></a>
### bounds

```ml
function bounds(vertices)
```

Builds `minimum[axis]`, `maximum[axis]` in `mq3.renderer.tr_curve_runtime.bounds`; returns `[minimum,maximum]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertices` | `dynamic` | — | Indexed input read at `0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L94)

<a id="function-function-mq3-renderer-tr-curve-runtime-fail-function-fail-message-src-mq3-renderer-tr-curve-runtime-ml-846712727"></a>
### fail

```ml
function fail(message)
```

Creates error `7730` with message `"tr_curve: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7730,"tr_curve: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L44)

- [mq3.renderer.tr_curve_runtime.Grid](Type-mq3-renderer-tr-curve-runtime-grid-1449724334.md) — struct
<a id="function-function-mq3-renderer-tr-curve-runtime-invertctrl-function-invertctrl-width-height-ctrl-src-mq3-renderer-tr-curve-runtime-ml-1235794706"></a>
### InvertCtrl

```ml
function InvertCtrl(width, height, ctrl)
```

Returns each control-grid row in reversed column order after validating its dimensions and storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Input tested by `width<=0 or height<=0 or len(ctrl)<width*height`. |
| `height` | `dynamic` | — | Input tested by `width<=0 or height<=0 or len(ctrl)<width*height`. |
| `ctrl` | `dynamic` | — | Indexed input read at `row*width+width-1-column`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L69)

<a id="function-function-mq3-renderer-tr-curve-runtime-inverterrortable-function-inverterrortable-errortable-width-height-src-mq3-renderer-tr-curve-runtime-ml-2144184465"></a>
### InvertErrorTable

```ml
function InvertErrorTable(errorTable, width, height)
```

Builds `second[index]`, `first[index]` in `mq3.renderer.tr_curve_runtime.InvertErrorTable`; returns `[first,second]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `errorTable` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`. |
| `width` | `dynamic` | — | Input tested by `errorTable==void or len(errorTable)!=2 or len(errorTable[0])<width or len(errorTable[1])<height`. |
| `height` | `dynamic` | — | Input tested by `errorTable==void or len(errorTable)!=2 or len(errorTable[0])<width or len(errorTable[1])<height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L77)

<a id="function-function-mq3-renderer-tr-curve-runtime-lerpdrawvert-function-lerpdrawvert-a-b-src-mq3-renderer-tr-curve-runtime-ml-1018963655"></a>
### LerpDrawVert

```ml
function LerpDrawVert(a, b)
```

Returns `render.halfVertex(a,b)` from `mq3.renderer.tr_curve_runtime.LerpDrawVert`; earlier branches return `fail("vertices required")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.bsp_render_data.halfVertex`. |
| `b` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.bsp_render_data.halfVertex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L48)

<a id="function-function-mq3-renderer-tr-curve-runtime-makemeshnormals-function-makemeshnormals-width-height-ctrl-src-mq3-renderer-tr-curve-runtime-ml-1751976276"></a>
### MakeMeshNormals

```ml
function MakeMeshNormals(width, height, ctrl)
```

Returns `render.makeGridNormals(ctrl,width,height)` from `mq3.renderer.tr_curve_runtime.MakeMeshNormals`; earlier branches return `fail("invalid control grid")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.bsp_render_data.makeGridNormals`. |
| `height` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.bsp_render_data.makeGridNormals`. |
| `ctrl` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.bsp_render_data.makeGridNormals`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L61)

<a id="constant-constant-mq3-renderer-tr-curve-runtime-max-grid-size-const-max-grid-size-65-src-mq3-renderer-tr-curve-runtime-ml-1677864174"></a>
### MAX_GRID_SIZE

```ml
const MAX_GRID_SIZE = 65
```

Largest tessellated patch-grid dimension accepted by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L11)

<a id="function-function-mq3-renderer-tr-curve-runtime-putpointsoncurve-function-putpointsoncurve-ctrl-width-height-src-mq3-renderer-tr-curve-runtime-ml-1828247916"></a>
### PutPointsOnCurve

```ml
function PutPointsOnCurve(ctrl, width, height)
```

Returns `render.putGridPointsOnCurve(ctrl,width,height)` from `mq3.renderer.tr_curve_runtime.PutPointsOnCurve`; earlier branches return `fail("invalid control grid")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ctrl` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.bsp_render_data.putGridPointsOnCurve`. |
| `width` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.bsp_render_data.putGridPointsOnCurve`. |
| `height` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.bsp_render_data.putGridPointsOnCurve`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L88)

<a id="function-function-mq3-renderer-tr-curve-runtime-r-createsurfacegridmesh-function-r-createsurfacegridmesh-width-height-ctrl-errortable-src-mq3-renderer-tr-curve-runtime-ml-532260706"></a>
### R_CreateSurfaceGridMesh

```ml
function R_CreateSurfaceGridMesh(width, height, ctrl, errorTable)
```

Builds `mq3.renderer.tr_curve_runtime.Grid` for `mq3.renderer.tr_curve_runtime.R_CreateSurfaceGridMesh`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Initial value for `mq3.renderer.tr_curve_runtime.Grid.width`. |
| `height` | `dynamic` | — | Initial value for `mq3.renderer.tr_curve_runtime.Grid.height`. |
| `ctrl` | `dynamic` | — | Indexed input read at `index`. |
| `errorTable` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L104)

<a id="function-function-mq3-renderer-tr-curve-runtime-r-freesurfacegridmesh-function-r-freesurfacegridmesh-grid-src-mq3-renderer-tr-curve-runtime-ml-1331507586"></a>
### R_FreeSurfaceGridMesh

```ml
function R_FreeSurfaceGridMesh(grid)
```

Updates `grid.widthLodError`, `grid.heightLodError`, `grid.verts`, `grid.freed` in `mq3.renderer.tr_curve_runtime.R_FreeSurfaceGridMesh`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Mutable record or buffer; this call updates `grid.widthLodError`, `grid.heightLodError`, `grid.verts`, `grid.freed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L114)

<a id="function-function-mq3-renderer-tr-curve-runtime-r-gridinsertcolumn-function-r-gridinsertcolumn-grid-column-row-point-loderror-src-mq3-renderer-tr-curve-runtime-ml-1099590595"></a>
### R_GridInsertColumn

```ml
function R_GridInsertColumn(grid, column, row, point, loderror)
```

Builds `result.lodOrigin`, `result.lodRadius` in `mq3.renderer.tr_curve_runtime.R_GridInsertColumn`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record providing `grid.freed`, `grid.width`, `grid.height`, `grid.verts`, `grid.widthLodError`, `grid.heightLodError`. |
| `column` | `dynamic` | — | Input tested by `column<=0 or column>=grid.width or row<0 or row>=height or point==void or len(point)!=3`. |
| `row` | `dynamic` | — | Input tested by `column<=0 or column>=grid.width or row<0 or row>=height or point==void or len(point)!=3`. |
| `point` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `loderror` | `dynamic` | — | Input used by `widthErrors=widthErrors+[loderror]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L141)

<a id="function-function-mq3-renderer-tr-curve-runtime-r-gridinsertrow-function-r-gridinsertrow-grid-row-column-point-loderror-src-mq3-renderer-tr-curve-runtime-ml-990341639"></a>
### R_GridInsertRow

```ml
function R_GridInsertRow(grid, row, column, point, loderror)
```

Builds `result.lodOrigin`, `result.lodRadius` in `mq3.renderer.tr_curve_runtime.R_GridInsertRow`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — | Record providing `grid.freed`, `grid.width`, `grid.height`, `grid.verts`, `grid.heightLodError`, `grid.widthLodError`. |
| `row` | `dynamic` | — | Input tested by `row<=0 or row>=grid.height or column<0 or column>=width or point==void or len(point)!=3`. |
| `column` | `dynamic` | — | Input tested by `row<=0 or row>=grid.height or column<0 or column>=width or point==void or len(point)!=3`. |
| `point` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `loderror` | `dynamic` | — | Input used by `heightErrors=heightErrors+[loderror]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L162)

<a id="function-function-mq3-renderer-tr-curve-runtime-r-subdividepatchtogrid-function-r-subdividepatchtogrid-width-height-points-subdivisions-src-mq3-renderer-tr-curve-runtime-ml-1160009970"></a>
### R_SubdividePatchToGrid

```ml
function R_SubdividePatchToGrid(width, height, points, subdivisions)
```

Computes `R_SubdividePatchToGrid` from `R_CreateSurfaceGridMesh(width,height,ctrl,errorTable)` using `mq3.renderer.bsp_render_data.subdivideHorizontal`, `mq3.renderer.bsp_render_data.transposeGrid`, `mq3.renderer.bsp_render_data.putGridPointsOnCurve`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.bsp_render_data.subdivideHorizontal`. |
| `height` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.bsp_render_data.subdivideHorizontal`. |
| `points` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.bsp_render_data.subdivideHorizontal`. |
| `subdivisions` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.bsp_render_data.subdivideHorizontal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L122)

<a id="constant-constant-mq3-renderer-tr-curve-runtime-sf-grid-const-sf-grid-3-src-mq3-renderer-tr-curve-runtime-ml-1873616294"></a>
### SF_GRID

```ml
const SF_GRID = 3
```

Surface-dispatch tag identifying a tessellated curved-patch grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L13)

<a id="function-function-mq3-renderer-tr-curve-runtime-transpose-function-transpose-width-height-ctrl-src-mq3-renderer-tr-curve-runtime-ml-684120780"></a>
### Transpose

```ml
function Transpose(width, height, ctrl)
```

Returns `render.transposeGrid(ctrl,width,height)` from `mq3.renderer.tr_curve_runtime.Transpose`; earlier branches return `fail("invalid control grid")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.bsp_render_data.transposeGrid`. |
| `height` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.bsp_render_data.transposeGrid`. |
| `ctrl` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.bsp_render_data.transposeGrid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L53)
