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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertices` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L39)

<a id="function-function-mq3-renderer-tr-curve-runtime-fail-function-fail-message-src-mq3-renderer-tr-curve-runtime-ml-846712727"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L14)

- [mq3.renderer.tr_curve_runtime.Grid](Type-mq3-renderer-tr-curve-runtime-grid-1449724334.md) — struct
<a id="function-function-mq3-renderer-tr-curve-runtime-invertctrl-function-invertctrl-width-height-ctrl-src-mq3-renderer-tr-curve-runtime-ml-1235794706"></a>
### InvertCtrl

```ml
function InvertCtrl(width, height, ctrl)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `ctrl` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L24)

<a id="function-function-mq3-renderer-tr-curve-runtime-inverterrortable-function-inverterrortable-errortable-width-height-src-mq3-renderer-tr-curve-runtime-ml-2144184465"></a>
### InvertErrorTable

```ml
function InvertErrorTable(errorTable, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `errorTable` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L28)

<a id="function-function-mq3-renderer-tr-curve-runtime-lerpdrawvert-function-lerpdrawvert-a-b-src-mq3-renderer-tr-curve-runtime-ml-1018963655"></a>
### LerpDrawVert

```ml
function LerpDrawVert(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L15)

<a id="function-function-mq3-renderer-tr-curve-runtime-makemeshnormals-function-makemeshnormals-width-height-ctrl-src-mq3-renderer-tr-curve-runtime-ml-1751976276"></a>
### MakeMeshNormals

```ml
function MakeMeshNormals(width, height, ctrl)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `ctrl` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L20)

<a id="constant-constant-mq3-renderer-tr-curve-runtime-max-grid-size-const-max-grid-size-65-src-mq3-renderer-tr-curve-runtime-ml-1677864174"></a>
### MAX_GRID_SIZE

```ml
const MAX_GRID_SIZE = 65
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L10)

<a id="function-function-mq3-renderer-tr-curve-runtime-putpointsoncurve-function-putpointsoncurve-ctrl-width-height-src-mq3-renderer-tr-curve-runtime-ml-1828247916"></a>
### PutPointsOnCurve

```ml
function PutPointsOnCurve(ctrl, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ctrl` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L35)

<a id="function-function-mq3-renderer-tr-curve-runtime-r-createsurfacegridmesh-function-r-createsurfacegridmesh-width-height-ctrl-errortable-src-mq3-renderer-tr-curve-runtime-ml-532260706"></a>
### R_CreateSurfaceGridMesh

```ml
function R_CreateSurfaceGridMesh(width, height, ctrl, errorTable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `ctrl` | `dynamic` | — |  |
| `errorTable` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L44)

<a id="function-function-mq3-renderer-tr-curve-runtime-r-freesurfacegridmesh-function-r-freesurfacegridmesh-grid-src-mq3-renderer-tr-curve-runtime-ml-1331507586"></a>
### R_FreeSurfaceGridMesh

```ml
function R_FreeSurfaceGridMesh(grid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L52)

<a id="function-function-mq3-renderer-tr-curve-runtime-r-gridinsertcolumn-function-r-gridinsertcolumn-grid-column-row-point-loderror-src-mq3-renderer-tr-curve-runtime-ml-1099590595"></a>
### R_GridInsertColumn

```ml
function R_GridInsertColumn(grid, column, row, point, loderror)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `column` | `dynamic` | — |  |
| `row` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `loderror` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L76)

<a id="function-function-mq3-renderer-tr-curve-runtime-r-gridinsertrow-function-r-gridinsertrow-grid-row-column-point-loderror-src-mq3-renderer-tr-curve-runtime-ml-990341639"></a>
### R_GridInsertRow

```ml
function R_GridInsertRow(grid, row, column, point, loderror)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `grid` | `dynamic` | — |  |
| `row` | `dynamic` | — |  |
| `column` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `loderror` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L91)

<a id="function-function-mq3-renderer-tr-curve-runtime-r-subdividepatchtogrid-function-r-subdividepatchtogrid-width-height-points-subdivisions-src-mq3-renderer-tr-curve-runtime-ml-1160009970"></a>
### R_SubdividePatchToGrid

```ml
function R_SubdividePatchToGrid(width, height, points, subdivisions)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |
| `subdivisions` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L58)

<a id="function-function-mq3-renderer-tr-curve-runtime-removeerror-function-removeerror-value-index-count-src-mq3-renderer-tr-curve-runtime-ml-1732857770"></a>
### removeError

```ml
function removeError(value, index, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L55)

<a id="constant-constant-mq3-renderer-tr-curve-runtime-sf-grid-const-sf-grid-3-src-mq3-renderer-tr-curve-runtime-ml-1873616294"></a>
### SF_GRID

```ml
const SF_GRID = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L11)

<a id="function-function-mq3-renderer-tr-curve-runtime-transpose-function-transpose-width-height-ctrl-src-mq3-renderer-tr-curve-runtime-ml-684120780"></a>
### Transpose

```ml
function Transpose(width, height, ctrl)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `ctrl` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_curve_runtime.ml#L16)
