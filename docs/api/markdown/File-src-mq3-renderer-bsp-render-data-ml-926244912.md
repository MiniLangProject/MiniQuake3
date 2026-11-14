# `src/mq3/renderer/bsp_render_data.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.bsp_render_data`](Package-mq3-renderer-bsp-render-data-863921536.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-renderer-bsp-render-data-all-function-all-map-maxtriangles-src-mq3-renderer-bsp-render-data-ml-1220857151"></a>
### all

```ml
function all(map, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L257)

<a id="function-function-mq3-renderer-bsp-render-data-appendpatch-function-appendpatch-triangles-control-width-height-textureindex-lightmapindex-fogindex-faceindex-maxtriangles-errorlimit-src-mq3-renderer-bsp-render-data-ml-422784055"></a>
### appendPatch

```ml
function appendPatch(triangles, control, width, height, textureIndex, lightmapIndex, fogIndex, faceIndex, maxTriangles, errorLimit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangles` | `dynamic` | — |  |
| `control` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `textureIndex` | `dynamic` | — |  |
| `lightmapIndex` | `dynamic` | — |  |
| `fogIndex` | `dynamic` | — |  |
| `faceIndex` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |
| `errorLimit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L193)

<a id="function-function-mq3-renderer-bsp-render-data-bezierarray-function-bezierarray-a-b-c-t-src-mq3-renderer-bsp-render-data-ml-1411237674"></a>
### bezierArray

```ml
function bezierArray(a, b, c, t)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L52)

<a id="function-function-mq3-renderer-bsp-render-data-bezierscalar-function-bezierscalar-a-b-c-t-src-mq3-renderer-bsp-render-data-ml-1910230622"></a>
### bezierScalar

```ml
function bezierScalar(a, b, c, t)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L49)

<a id="function-function-mq3-renderer-bsp-render-data-beziervertex-function-beziervertex-a-b-c-t-src-mq3-renderer-bsp-render-data-ml-317096254"></a>
### bezierVertex

```ml
function bezierVertex(a, b, c, t)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L59)

<a id="function-function-mq3-renderer-bsp-render-data-colorshiftlighting-function-colorshiftlighting-red-green-blue-shift-src-mq3-renderer-bsp-render-data-ml-289252768"></a>
### colorShiftLighting

```ml
function colorShiftLighting(red, green, blue, shift)
```

R_ColorShiftLightingBytes. The dependency-free software renderer has no hardware gamma ramp, so tr.overbrightBits is zero while Baseq3's default r_mapOverBrightBits remains two.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |
| `shift` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L272)

<a id="function-function-mq3-renderer-bsp-render-data-contains-function-contains-values-wanted-src-mq3-renderer-bsp-render-data-ml-2063968281"></a>
### contains

```ml
function contains(values, wanted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `wanted` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L43)

<a id="function-function-mq3-renderer-bsp-render-data-crossnormal-function-crossnormal-a-b-src-mq3-renderer-bsp-render-data-ml-2048625313"></a>
### crossNormal

```ml
function crossNormal(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L135)

<a id="function-function-mq3-renderer-bsp-render-data-curvelineerror-function-curvelineerror-a-b-c-src-mq3-renderer-bsp-render-data-ml-607112714"></a>
### curveLineError

```ml
function curveLineError(a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L74)

<a id="constant-constant-mq3-renderer-bsp-render-data-default-patch-error-const-default-patch-error-4-src-mq3-renderer-bsp-render-data-ml-2113110351"></a>
### DEFAULT_PATCH_ERROR

```ml
const DEFAULT_PATCH_ERROR = 4.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L10)

<a id="function-function-mq3-renderer-bsp-render-data-extract-function-extract-map-faceindexes-maxtriangles-src-mq3-renderer-bsp-render-data-ml-588815430"></a>
### extract

```ml
function extract(map, faceIndexes, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `faceIndexes` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L255)

<a id="function-function-mq3-renderer-bsp-render-data-extractwithpatcherror-function-extractwithpatcherror-map-faceindexes-maxtriangles-patcherror-src-mq3-renderer-bsp-render-data-ml-91689942"></a>
### extractWithPatchError

```ml
function extractWithPatchError(map, faceIndexes, maxTriangles, patchError)
```

Face and meshvert order is retained. Repeated face indexes are ignored after their first occurrence, giving visible-leaf callers a stable render stream. Validation continues beyond maxTriangles so malformed BSP input cannot hide behind an output limit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `faceIndexes` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |
| `patchError` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L208)

<a id="function-function-mq3-renderer-bsp-render-data-f32-function-f32-map-offset-src-mq3-renderer-bsp-render-data-ml-1377212699"></a>
### f32

```ml
function f32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L35)

<a id="constant-constant-mq3-renderer-bsp-render-data-face-stride-const-face-stride-104-src-mq3-renderer-bsp-render-data-ml-1441625570"></a>
### FACE_STRIDE

```ml
const FACE_STRIDE = 104
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L13)

<a id="function-function-mq3-renderer-bsp-render-data-fail-function-fail-text-src-mq3-renderer-bsp-render-data-ml-1948408871"></a>
### fail

```ml
function fail(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L22)

<a id="function-function-mq3-renderer-bsp-render-data-halfarray-function-halfarray-a-b-src-mq3-renderer-bsp-render-data-ml-1954376071"></a>
### halfArray

```ml
function halfArray(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L66)

<a id="function-function-mq3-renderer-bsp-render-data-halfvertex-function-halfvertex-a-b-src-mq3-renderer-bsp-render-data-ml-24667251"></a>
### halfVertex

```ml
function halfVertex(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L69)

<a id="function-function-mq3-renderer-bsp-render-data-i32-function-i32-map-offset-src-mq3-renderer-bsp-render-data-ml-25538777"></a>
### i32

```ml
function i32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L32)

<a id="function-function-mq3-renderer-bsp-render-data-lerp-function-lerp-a-b-t-src-mq3-renderer-bsp-render-data-ml-1082931877"></a>
### lerp

```ml
function lerp(a, b, t)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L48)

<a id="constant-constant-mq3-renderer-bsp-render-data-lightmap-height-const-lightmap-height-128-src-mq3-renderer-bsp-render-data-ml-2045693900"></a>
### LIGHTMAP_HEIGHT

```ml
const LIGHTMAP_HEIGHT = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L15)

<a id="constant-constant-mq3-renderer-bsp-render-data-lightmap-rgb-size-const-lightmap-rgb-size-49152-src-mq3-renderer-bsp-render-data-ml-1659834812"></a>
### LIGHTMAP_RGB_SIZE

```ml
const LIGHTMAP_RGB_SIZE = 49152
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L16)

<a id="constant-constant-mq3-renderer-bsp-render-data-lightmap-width-const-lightmap-width-128-src-mq3-renderer-bsp-render-data-ml-773267512"></a>
### LIGHTMAP_WIDTH

```ml
const LIGHTMAP_WIDTH = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L14)

<a id="function-function-mq3-renderer-bsp-render-data-lightmaprgb-function-lightmaprgb-map-index-src-mq3-renderer-bsp-render-data-ml-964587562"></a>
### lightmapRgb

```ml
function lightmapRgb(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L263)

<a id="function-function-mq3-renderer-bsp-render-data-lightmaprgba-function-lightmaprgba-map-index-src-mq3-renderer-bsp-render-data-ml-790816292"></a>
### lightmapRgba

```ml
function lightmapRgba(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L287)

<a id="function-function-mq3-renderer-bsp-render-data-lightmaprgbashift-function-lightmaprgbashift-map-index-mapoverbrightbits-rendereroverbrightbits-src-mq3-renderer-bsp-render-data-ml-956378315"></a>
### lightmapRgbaShift

```ml
function lightmapRgbaShift(map, index, mapOverbrightBits, rendererOverbrightBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `mapOverbrightBits` | `dynamic` | — |  |
| `rendererOverbrightBits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L278)

<a id="function-function-mq3-renderer-bsp-render-data-makegridnormals-function-makegridnormals-control-width-height-src-mq3-renderer-bsp-render-data-ml-75461350"></a>
### makeGridNormals

```ml
function makeGridNormals(control, width, height)
```

MakeMeshNormals, including Baseq3's seam wrapping and up-to-three-point search through degenerate neighbours.  Positions stay immutable while every normal is derived so replacing vertices cannot affect later samples.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L146)

<a id="constant-constant-mq3-renderer-bsp-render-data-max-grid-size-const-max-grid-size-65-src-mq3-renderer-bsp-render-data-ml-1617700204"></a>
### MAX_GRID_SIZE

```ml
const MAX_GRID_SIZE = 65
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L11)

<a id="constant-constant-mq3-renderer-bsp-render-data-mst-patch-const-mst-patch-2-src-mq3-renderer-bsp-render-data-ml-1785455815"></a>
### MST_PATCH

```ml
const MST_PATCH = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L8)

<a id="constant-constant-mq3-renderer-bsp-render-data-mst-planar-const-mst-planar-1-src-mq3-renderer-bsp-render-data-ml-1252468554"></a>
### MST_PLANAR

```ml
const MST_PLANAR = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L7)

<a id="constant-constant-mq3-renderer-bsp-render-data-mst-triangle-soup-const-mst-triangle-soup-3-src-mq3-renderer-bsp-render-data-ml-44719656"></a>
### MST_TRIANGLE_SOUP

```ml
const MST_TRIANGLE_SOUP = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L9)

<a id="function-function-mq3-renderer-bsp-render-data-normaldirection-function-normaldirection-target-base-src-mq3-renderer-bsp-render-data-ml-1286729962"></a>
### normalDirection

```ml
function normalDirection(target, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L129)

<a id="function-function-mq3-renderer-bsp-render-data-normalized-function-normalized-value-src-mq3-renderer-bsp-render-data-ml-501463929"></a>
### normalized

```ml
function normalized(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L55)

<a id="function-function-mq3-renderer-bsp-render-data-putgridpointsoncurve-function-putgridpointsoncurve-control-width-height-src-mq3-renderer-bsp-render-data-ml-1979862478"></a>
### putGridPointsOnCurve

```ml
function putGridPointsOnCurve(control, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L114)

<a id="function-function-mq3-renderer-bsp-render-data-recordrange-function-recordrange-map-lump-index-stride-src-mq3-renderer-bsp-render-data-ml-1296811741"></a>
### recordRange

```ml
function recordRange(map, lump, index, stride)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `lump` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `stride` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L26)

<a id="function-function-mq3-renderer-bsp-render-data-removegridcolumn-function-removegridcolumn-control-width-height-column-src-mq3-renderer-bsp-render-data-ml-2035259512"></a>
### removeGridColumn

```ml
function removeGridColumn(control, width, height, column)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `column` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L123)

<a id="function-function-mq3-renderer-bsp-render-data-removegridrow-function-removegridrow-control-width-height-row-src-mq3-renderer-bsp-render-data-ml-1685844430"></a>
### removeGridRow

```ml
function removeGridRow(control, width, height, row)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `row` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L126)

- [mq3.renderer.bsp_render_data.RenderData](Type-mq3-renderer-bsp-render-data-renderdata-337074974.md) — struct
- [mq3.renderer.bsp_render_data.RenderTriangle](Type-mq3-renderer-bsp-render-data-rendertriangle-2037589918.md) — struct
- [mq3.renderer.bsp_render_data.RenderVertex](Type-mq3-renderer-bsp-render-data-rendervertex-1174673660.md) — struct
<a id="function-function-mq3-renderer-bsp-render-data-subdividehorizontal-function-subdividehorizontal-control-width-height-errorlimit-src-mq3-renderer-bsp-render-data-ml-25964919"></a>
### subdivideHorizontal

```ml
function subdivideHorizontal(control, width, height, errorLimit)
```

Baseq3 R_SubdividePatchToGrid checks perpendicular distance to the chord, inserts the two de Casteljau half points and rechecks the same span.  This preserves its non-uniform grid and 65-point axis ceiling instead of applying one worst-case subdivision count to every quadratic block.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `errorLimit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L91)

<a id="function-function-mq3-renderer-bsp-render-data-subdividepatch-function-subdividepatch-control-width-height-errorlimit-src-mq3-renderer-bsp-render-data-ml-87135389"></a>
### subdividePatch

```ml
function subdividePatch(control, width, height, errorLimit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `errorLimit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L184)

<a id="function-function-mq3-renderer-bsp-render-data-transposegrid-function-transposegrid-control-width-height-src-mq3-renderer-bsp-render-data-ml-1110757900"></a>
### transposeGrid

```ml
function transposeGrid(control, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L82)

<a id="function-function-mq3-renderer-bsp-render-data-validmap-function-validmap-map-src-mq3-renderer-bsp-render-data-ml-1374775720"></a>
### validMap

```ml
function validMap(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L23)

<a id="function-function-mq3-renderer-bsp-render-data-vertex-function-vertex-map-index-src-mq3-renderer-bsp-render-data-ml-956943024"></a>
### vertex

```ml
function vertex(map, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L38)

<a id="constant-constant-mq3-renderer-bsp-render-data-vertex-stride-const-vertex-stride-44-src-mq3-renderer-bsp-render-data-ml-691701117"></a>
### VERTEX_STRIDE

```ml
const VERTEX_STRIDE = 44
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L12)

<a id="function-function-mq3-renderer-bsp-render-data-vertexwithnormal-function-vertexwithnormal-value-normal-src-mq3-renderer-bsp-render-data-ml-830247524"></a>
### vertexWithNormal

```ml
function vertexWithNormal(value, normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L140)
