# `src/mq3/renderer/bsp_render_data.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.bsp_render_data`](Package-mq3-renderer-bsp-render-data-863921536.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-bsp-render-data-all-function-all-map-maxtriangles-src-mq3-renderer-bsp-render-data-ml-1220857151"></a>
### all

```ml
function all(map, maxTriangles)
```

Builds `faces[index]` in `mq3.renderer.bsp_render_data.all`; returns `extract(map,faces,maxTriangles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`. |
| `maxTriangles` | `dynamic` | — | Value forwarded as `maxTriangles` to `mq3.renderer.bsp_render_data.extract`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L526)

<a id="function-function-mq3-renderer-bsp-render-data-appendpatchgrid-function-appendpatchgrid-triangles-control-width-columns-rows-textureindex-lightmapindex-fogindex-faceindex-maxtriangles-src-mq3-renderer-bsp-render-data-ml-1636775139"></a>
### appendPatchGrid

```ml
function appendPatchGrid(triangles, control, width, columns, rows, textureIndex, lightmapIndex, fogIndex, faceIndex, maxTriangles)
```

Computes `appendPatchGrid` from `[count,truncated]` using `triangles.add`, `mq3.renderer.bsp_render_data.RenderTriangle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangles` | `dynamic` | — | Record providing `triangles.size`, `triangles.add`. |
| `control` | `dynamic` | — | Indexed input read at `a`, `b`, `c`, `d`. |
| `width` | `dynamic` | — | Input used by `a=rows[row]*width+columns[column]`. |
| `columns` | `dynamic` | — | Indexed input read at `column`, `column+1`. |
| `rows` | `dynamic` | — | Indexed input read at `row`, `row+1`. |
| `textureIndex` | `dynamic` | — | Value used for `mq3.renderer.bsp_render_data.RenderTriangle.textureIndex`. |
| `lightmapIndex` | `dynamic` | — | Value used for `mq3.renderer.bsp_render_data.RenderTriangle.lightmapIndex`. |
| `fogIndex` | `dynamic` | — | Value used for `mq3.renderer.bsp_render_data.RenderTriangle.fogIndex`. |
| `faceIndex` | `dynamic` | — | Value used for `mq3.renderer.bsp_render_data.RenderTriangle.faceIndex`. |
| `maxTriangles` | `dynamic` | — | Input tested by `triangles.size<maxTriangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L409)

<a id="function-function-mq3-renderer-bsp-render-data-bezierarray-function-bezierarray-a-b-c-t-src-mq3-renderer-bsp-render-data-ml-1411237674"></a>
### bezierArray

```ml
function bezierArray(a, b, c, t)
```

Builds `result[index]` in `mq3.renderer.bsp_render_data.bezierArray`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Indexed input read at `index`. |
| `b` | `dynamic` | — | Indexed input read at `index`. |
| `c` | `dynamic` | — | Indexed input read at `index`. |
| `t` | `dynamic` | — | Value forwarded as `t` to `mq3.renderer.bsp_render_data.bezierScalar`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L141)

<a id="function-function-mq3-renderer-bsp-render-data-bezierscalar-function-bezierscalar-a-b-c-t-src-mq3-renderer-bsp-render-data-ml-1910230622"></a>
### bezierScalar

```ml
function bezierScalar(a, b, c, t)
```

Returns `lerp(first,last,t)` from `mq3.renderer.bsp_render_data.bezierScalar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value forwarded as `a` to `mq3.renderer.bsp_render_data.lerp`. |
| `b` | `dynamic` | — | Value forwarded as `b` to `mq3.renderer.bsp_render_data.lerp`. |
| `c` | `dynamic` | — | Value forwarded as `b` to `mq3.renderer.bsp_render_data.lerp`. |
| `t` | `dynamic` | — | Value forwarded as `t` to `mq3.renderer.bsp_render_data.lerp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L133)

<a id="function-function-mq3-renderer-bsp-render-data-beziervertex-function-beziervertex-a-b-c-t-src-mq3-renderer-bsp-render-data-ml-317096254"></a>
### bezierVertex

```ml
function bezierVertex(a, b, c, t)
```

Builds `mq3.renderer.bsp_render_data.RenderVertex` after updating `color[index]`, `entityColor[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record providing `a.color`, `a.entityColor`, `a.entityTexCoord`, `a.shaderTime`, `a.position`, `a.baseUV`. |
| `b` | `dynamic` | — | Record providing `b.color`, `b.entityColor`, `b.entityTexCoord`, `b.shaderTime`, `b.position`, `b.baseUV`. |
| `c` | `dynamic` | — | Record providing `c.color`, `c.entityColor`, `c.entityTexCoord`, `c.shaderTime`, `c.position`, `c.baseUV`. |
| `t` | `dynamic` | — | Value forwarded as `t` to `mq3.renderer.bsp_render_data.bezierArray`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L157)

<a id="function-function-mq3-renderer-bsp-render-data-colorshiftlighting-function-colorshiftlighting-red-green-blue-shift-src-mq3-renderer-bsp-render-data-ml-289252768"></a>
### colorShiftLighting

```ml
function colorShiftLighting(red, green, blue, shift)
```

R_ColorShiftLightingBytes. The dependency-free software renderer has no hardware gamma ramp, so tr.overbrightBits is zero while Baseq3's default r_mapOverBrightBits remains two.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `red` | `dynamic` | — | Input used by `r=red<<shift`. |
| `green` | `dynamic` | — | Input used by `g=green<<shift`. |
| `blue` | `dynamic` | — | Input used by `b=blue<<shift`. |
| `shift` | `dynamic` | — | Input tested by `shift<0 or shift>8`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L548)

<a id="function-function-mq3-renderer-bsp-render-data-compactgrid-function-compactgrid-control-width-height-widtherrors-heighterrors-src-mq3-renderer-bsp-render-data-ml-1676068329"></a>
### compactGrid

```ml
function compactGrid(control, width, height, widthErrors, heightErrors)
```

Builds `compacted[row*newWidth+column]`, `newWidthErrors[column]`, `newHeightErrors[row]` in `mq3.renderer.bsp_render_data.compactGrid`; returns `[compacted,newWidth,newHeight,newWidthErrors,newHeightErrors]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | Indexed input read at `rows[row`. |
| `width` | `dynamic` | — | Value forwarded as `size` to `mq3.renderer.bsp_render_data.retainedGridAxis`. |
| `height` | `dynamic` | — | Value forwarded as `size` to `mq3.renderer.bsp_render_data.retainedGridAxis`. |
| `widthErrors` | `dynamic` | — | Value forwarded as `errors` to `mq3.renderer.bsp_render_data.retainedGridAxis`. |
| `heightErrors` | `dynamic` | — | Value forwarded as `errors` to `mq3.renderer.bsp_render_data.retainedGridAxis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L280)

<a id="function-function-mq3-renderer-bsp-render-data-crossnormal-function-crossnormal-a-b-src-mq3-renderer-bsp-render-data-ml-2048625313"></a>
### crossNormal

```ml
function crossNormal(a, b)
```

Computes `crossNormal` from `[value[0]/length,value[1]/length,value[2]/length]` using `mq3.compat.numeric.fsqrt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L310)

<a id="function-function-mq3-renderer-bsp-render-data-curvelineerror-function-curvelineerror-a-b-c-src-mq3-renderer-bsp-render-data-ml-607112714"></a>
### curveLineError

```ml
function curveLineError(a, b, c)
```

Builds `offset[axis]`, `direction[axis]` in `mq3.renderer.bsp_render_data.curveLineError`; returns `n.fsqrt(errorSquared)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record providing `a.position`. |
| `b` | `dynamic` | — | Record providing `b.position`. |
| `c` | `dynamic` | — | Record providing `c.position`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L187)

<a id="constant-constant-mq3-renderer-bsp-render-data-default-patch-error-const-default-patch-error-4-src-mq3-renderer-bsp-render-data-ml-260928637"></a>
### DEFAULT_PATCH_ERROR

```ml
const DEFAULT_PATCH_ERROR = 4
```

Default geometric error threshold used when tessellating BSP patches.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L15)

<a id="function-function-mq3-renderer-bsp-render-data-extract-function-extract-map-faceindexes-maxtriangles-src-mq3-renderer-bsp-render-data-ml-588815430"></a>
### extract

```ml
function extract(map, faceIndexes, maxTriangles)
```

Calls `mq3.renderer.bsp_render_data.extractWithPatchError` with `(map,faceIndexes,maxTriangles,DEFAULT_PATCH_ERROR)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.bsp_render_data.extractWithPatchError`. |
| `faceIndexes` | `dynamic` | — | Value forwarded as `faceIndexes` to `mq3.renderer.bsp_render_data.extractWithPatchError`. |
| `maxTriangles` | `dynamic` | — | Value forwarded as `maxTriangles` to `mq3.renderer.bsp_render_data.extractWithPatchError`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L521)

<a id="function-function-mq3-renderer-bsp-render-data-extractmode-function-extractmode-map-faceindexes-maxtriangles-patcherror-sharefacevertices-src-mq3-renderer-bsp-render-data-ml-1352722803"></a>
### extractMode

```ml
function extractMode(map, faceIndexes, maxTriangles, patchError, shareFaceVertices)
```

Builds `mq3.renderer.bsp_render_data.RenderData` after updating `seen[faceIndex]`, `decodedVertices[relative]`, `verts[corner]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`. |
| `faceIndexes` | `dynamic` | — | Sequence traversed as `faceIndex` while producing this result. |
| `maxTriangles` | `dynamic` | — | Value forwarded as `maxTriangles` to `mq3.renderer.bsp_render_data.appendPatchGrid`. |
| `patchError` | `dynamic` | — | Value forwarded as `errorLimit` to `mq3.renderer.bsp_render_data.patchGrid`. |
| `shareFaceVertices` | `dynamic` | — | Input tested by `shareFaceVertices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L456)

<a id="function-function-mq3-renderer-bsp-render-data-extractretainedwithpatcherror-function-extractretainedwithpatcherror-map-faceindexes-maxtriangles-patcherror-src-mq3-renderer-bsp-render-data-ml-21571746"></a>
### extractRetainedWithPatchError

```ml
function extractRetainedWithPatchError(map, faceIndexes, maxTriangles, patchError)
```

Internal retained-world path. Consumers must treat shared face vertices as immutable; the public extractor deliberately keeps its independent corners.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.bsp_render_data.extractMode`. |
| `faceIndexes` | `dynamic` | — | Value forwarded as `faceIndexes` to `mq3.renderer.bsp_render_data.extractMode`. |
| `maxTriangles` | `dynamic` | — | Value forwarded as `maxTriangles` to `mq3.renderer.bsp_render_data.extractMode`. |
| `patchError` | `dynamic` | — | Value forwarded as `patchError` to `mq3.renderer.bsp_render_data.extractMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L441)

<a id="function-function-mq3-renderer-bsp-render-data-extractwithpatcherror-function-extractwithpatcherror-map-faceindexes-maxtriangles-patcherror-src-mq3-renderer-bsp-render-data-ml-91689942"></a>
### extractWithPatchError

```ml
function extractWithPatchError(map, faceIndexes, maxTriangles, patchError)
```

Face and meshvert order is retained. Repeated face indexes are ignored after their first occurrence, giving visible-leaf callers a stable render stream. Validation continues beyond maxTriangles so malformed BSP input cannot hide behind an output limit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.bsp_render_data.extractMode`. |
| `faceIndexes` | `dynamic` | — | Value forwarded as `faceIndexes` to `mq3.renderer.bsp_render_data.extractMode`. |
| `maxTriangles` | `dynamic` | — | Value forwarded as `maxTriangles` to `mq3.renderer.bsp_render_data.extractMode`. |
| `patchError` | `dynamic` | — | Value forwarded as `patchError` to `mq3.renderer.bsp_render_data.extractMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L434)

<a id="function-function-mq3-renderer-bsp-render-data-f32-function-f32-map-offset-src-mq3-renderer-bsp-render-data-ml-1377212699"></a>
### f32

```ml
function f32(map, offset)
```

Returns `n.bitsFloat(value)` from `mq3.renderer.bsp_render_data.f32`; earlier branches return `fail("truncated float")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L111)

<a id="constant-constant-mq3-renderer-bsp-render-data-face-stride-const-face-stride-104-src-mq3-renderer-bsp-render-data-ml-1441625570"></a>
### FACE_STRIDE

```ml
const FACE_STRIDE = 104
```

Byte stride of one face record in the BSP surface lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L23)

<a id="function-function-mq3-renderer-bsp-render-data-fail-function-fail-text-src-mq3-renderer-bsp-render-data-ml-1948408871"></a>
### fail

```ml
function fail(text)
```

Creates error `7410` with message `"BSP render data: "+text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Input used in the result expression `error(7410,"BSP render data: "+text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L85)

<a id="function-function-mq3-renderer-bsp-render-data-gridindexes-function-gridindexes-size-src-mq3-renderer-bsp-render-data-ml-1708313453"></a>
### gridIndexes

```ml
function gridIndexes(size)
```

Builds `indexes[index]` in `mq3.renderer.bsp_render_data.gridIndexes`; returns `indexes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — | Argument 1 supplied to `array`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L422)

<a id="function-function-mq3-renderer-bsp-render-data-halfarray-function-halfarray-a-b-src-mq3-renderer-bsp-render-data-ml-1954376071"></a>
### halfArray

```ml
function halfArray(a, b)
```

Builds `result[index]` in `mq3.renderer.bsp_render_data.halfArray`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Indexed input read at `index`. |
| `b` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L167)

<a id="function-function-mq3-renderer-bsp-render-data-halfvertex-function-halfvertex-a-b-src-mq3-renderer-bsp-render-data-ml-24667251"></a>
### halfVertex

```ml
function halfVertex(a, b)
```

Builds `mq3.renderer.bsp_render_data.RenderVertex` after updating `color[index]`, `entityColor[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record providing `a.color`, `a.entityColor`, `a.position`, `a.baseUV`, `a.lightmapUV`, `a.normal`. |
| `b` | `dynamic` | — | Record providing `b.color`, `b.entityColor`, `b.position`, `b.baseUV`, `b.lightmapUV`, `b.normal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L175)

<a id="function-function-mq3-renderer-bsp-render-data-i32-function-i32-map-offset-src-mq3-renderer-bsp-render-data-ml-25538777"></a>
### i32

```ml
function i32(map, offset)
```

Returns `value` from `mq3.renderer.bsp_render_data.i32`; earlier branches return `fail("truncated integer")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L105)

<a id="function-function-mq3-renderer-bsp-render-data-lerp-function-lerp-a-b-t-src-mq3-renderer-bsp-render-data-ml-1082931877"></a>
### lerp

```ml
function lerp(a, b, t)
```

Computes `a+(b-a)*t` for `mq3.renderer.bsp_render_data.lerp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Input used in the result expression `a+(b-a)*t`. |
| `b` | `dynamic` | — | Input used in the result expression `a+(b-a)*t`. |
| `t` | `dynamic` | — | Input used in the result expression `a+(b-a)*t`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L127)

<a id="constant-constant-mq3-renderer-bsp-render-data-lightmap-height-const-lightmap-height-128-src-mq3-renderer-bsp-render-data-ml-2045693900"></a>
### LIGHTMAP_HEIGHT

```ml
const LIGHTMAP_HEIGHT = 128
```

Height in pixels of one BSP lightmap image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L27)

<a id="constant-constant-mq3-renderer-bsp-render-data-lightmap-rgb-size-const-lightmap-rgb-size-49152-src-mq3-renderer-bsp-render-data-ml-1659834812"></a>
### LIGHTMAP_RGB_SIZE

```ml
const LIGHTMAP_RGB_SIZE = 49152
```

Number of RGB bytes stored for one BSP lightmap image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L29)

<a id="constant-constant-mq3-renderer-bsp-render-data-lightmap-width-const-lightmap-width-128-src-mq3-renderer-bsp-render-data-ml-773267512"></a>
### LIGHTMAP_WIDTH

```ml
const LIGHTMAP_WIDTH = 128
```

Width in pixels of one BSP lightmap image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L25)

<a id="function-function-mq3-renderer-bsp-render-data-lightmaprgb-function-lightmaprgb-map-index-src-mq3-renderer-bsp-render-data-ml-964587562"></a>
### lightmapRgb

```ml
function lightmapRgb(map, index)
```

Returns `slice(map.data,offset,LIGHTMAP_RGB_SIZE)` from `mq3.renderer.bsp_render_data.lightmapRgb`; earlier branches return `fail("invalid BSP object")`, `offset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.bsp_render_data.recordRange`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L535)

<a id="function-function-mq3-renderer-bsp-render-data-lightmaprgba-function-lightmaprgba-map-index-src-mq3-renderer-bsp-render-data-ml-790816292"></a>
### lightmapRgba

```ml
function lightmapRgba(map, index)
```

Calls `mq3.renderer.bsp_render_data.lightmapRgbaShift` with `(map,index,2,0)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.bsp_render_data.lightmapRgbaShift`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.bsp_render_data.lightmapRgbaShift`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L571)

<a id="function-function-mq3-renderer-bsp-render-data-lightmaprgbashift-function-lightmaprgbashift-map-index-mapoverbrightbits-rendereroverbrightbits-src-mq3-renderer-bsp-render-data-ml-956378315"></a>
### lightmapRgbaShift

```ml
function lightmapRgbaShift(map, index, mapOverbrightBits, rendererOverbrightBits)
```

Builds `rgba[pixel*4]`, `rgba[pixel*4+1]`, `rgba[pixel*4+2]` in `mq3.renderer.bsp_render_data.lightmapRgbaShift`; returns `rgba`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.bsp_render_data.lightmapRgb`. |
| `index` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.bsp_render_data.lightmapRgb`. |
| `mapOverbrightBits` | `dynamic` | — | Input used by `shift=mapOverbrightBits-rendererOverbrightBits`. |
| `rendererOverbrightBits` | `dynamic` | — | Input used by `shift=mapOverbrightBits-rendererOverbrightBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L559)

<a id="function-function-mq3-renderer-bsp-render-data-makegridnormals-function-makegridnormals-control-width-height-src-mq3-renderer-bsp-render-data-ml-75461350"></a>
### makeGridNormals

```ml
function makeGridNormals(control, width, height)
```

MakeMeshNormals, including Baseq3's seam wrapping and up-to-three-point search through degenerate neighbours.  Positions stay immutable while every normal is derived so replacing vertices cannot affect later samples.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | Mutable record or buffer; this call updates `control[index]`. |
| `width` | `dynamic` | — | Input used by `delta=normalDirection(control[row*width].position,control[row*width+width-1].position)`. |
| `height` | `dynamic` | — | Input used by `for row=0 to height-1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L327)

<a id="constant-constant-mq3-renderer-bsp-render-data-max-grid-size-const-max-grid-size-65-src-mq3-renderer-bsp-render-data-ml-1617700204"></a>
### MAX_GRID_SIZE

```ml
const MAX_GRID_SIZE = 65
```

Largest tessellated patch-grid dimension accepted by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L17)

<a id="constant-constant-mq3-renderer-bsp-render-data-max-patch-size-const-max-patch-size-32-src-mq3-renderer-bsp-render-data-ml-502433352"></a>
### MAX_PATCH_SIZE

```ml
const MAX_PATCH_SIZE = 32
```

Largest control-point patch dimension accepted from BSP data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L19)

<a id="constant-constant-mq3-renderer-bsp-render-data-mst-patch-const-mst-patch-2-src-mq3-renderer-bsp-render-data-ml-1785455815"></a>
### MST_PATCH

```ml
const MST_PATCH = 2
```

BSP surface type for a curved control-point patch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L11)

<a id="constant-constant-mq3-renderer-bsp-render-data-mst-planar-const-mst-planar-1-src-mq3-renderer-bsp-render-data-ml-1252468554"></a>
### MST_PLANAR

```ml
const MST_PLANAR = 1
```

BSP surface type for a planar polygon face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L9)

<a id="constant-constant-mq3-renderer-bsp-render-data-mst-triangle-soup-const-mst-triangle-soup-3-src-mq3-renderer-bsp-render-data-ml-44719656"></a>
### MST_TRIANGLE_SOUP

```ml
const MST_TRIANGLE_SOUP = 3
```

BSP surface type for an indexed triangle mesh.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L13)

<a id="function-function-mq3-renderer-bsp-render-data-normaldirection-function-normaldirection-target-base-src-mq3-renderer-bsp-render-data-ml-1286729962"></a>
### normalDirection

```ml
function normalDirection(target, base)
```

Builds `value[axis]` in `mq3.renderer.bsp_render_data.normalDirection`; returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — | Indexed input read at `axis`. |
| `base` | `dynamic` | — | Indexed input read at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L301)

<a id="function-function-mq3-renderer-bsp-render-data-normalized-function-normalized-value-src-mq3-renderer-bsp-render-data-ml-501463929"></a>
### normalized

```ml
function normalized(value)
```

Returns `[value[0]/length,value[1]/length,value[2]/length]` from `mq3.renderer.bsp_render_data.normalized`; earlier branches return `[0.0,0.0,1.0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L148)

<a id="function-function-mq3-renderer-bsp-render-data-patchgrid-function-patchgrid-map-faceoffset-errorlimit-src-mq3-renderer-bsp-render-data-ml-2001681573"></a>
### patchGrid

```ml
function patchGrid(map, faceOffset, errorLimit)
```

Builds `control[index]` in `mq3.renderer.bsp_render_data.patchGrid`; returns `subdividePatchWithErrors(control,width,height,errorLimit)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`. |
| `faceOffset` | `dynamic` | — | Input used by `firstVert=i32(map,faceOffset+12)`. |
| `errorLimit` | `dynamic` | — | Value forwarded as `errorLimit` to `mq3.renderer.bsp_render_data.subdividePatchWithErrors`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L390)

<a id="function-function-mq3-renderer-bsp-render-data-patchnodraw-function-patchnodraw-map-textureindex-src-mq3-renderer-bsp-render-data-ml-1884458505"></a>
### patchNoDraw

```ml
function patchNoDraw(map, textureIndex)
```

Computes `patchNoDraw` from `(surfaceFlags&0x80)!=0` using `mq3.renderer.bsp_render_data.recordRange`, `mq3.renderer.bsp_render_data.i32`, `return`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.bsp_render_data.recordRange`. |
| `textureIndex` | `dynamic` | — | Value forwarded as `index` to `mq3.renderer.bsp_render_data.recordRange`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L445)

<a id="function-function-mq3-renderer-bsp-render-data-putgridpointsoncurve-function-putgridpointsoncurve-control-width-height-src-mq3-renderer-bsp-render-data-ml-1979862478"></a>
### putGridPointsOnCurve

```ml
function putGridPointsOnCurve(control, width, height)
```

Updates `control[row*width+column]` in `mq3.renderer.bsp_render_data.putGridPointsOnCurve`; returns `control`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | Mutable record or buffer; this call updates `control[row*width+column]`. |
| `width` | `dynamic` | — | Input used by `for column=0 to width-1`. |
| `height` | `dynamic` | — | Input used by `while row<height-1 previous=halfVertex(control[row*width+column],control[(row+1)*width+column])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L248)

<a id="function-function-mq3-renderer-bsp-render-data-recordrange-function-recordrange-map-lump-index-stride-src-mq3-renderer-bsp-render-data-ml-1296811741"></a>
### recordRange

```ml
function recordRange(map, lump, index, stride)
```

Computes `recordRange` from `map.offsets[lump]+index*stride`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`, `map.data`. |
| `lump` | `dynamic` | — | Input tested by `index<0 or index>=map.counts[lump]`. |
| `index` | `dynamic` | — | Input tested by `index<0 or index>=map.counts[lump]`. |
| `stride` | `dynamic` | — | Input used by `offset=map.offsets[lump]+index*stride`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L96)

- [mq3.renderer.bsp_render_data.RenderData](Type-mq3-renderer-bsp-render-data-renderdata-337074974.md) — struct
- [mq3.renderer.bsp_render_data.RenderTriangle](Type-mq3-renderer-bsp-render-data-rendertriangle-2037589918.md) — struct
- [mq3.renderer.bsp_render_data.RenderVertex](Type-mq3-renderer-bsp-render-data-rendervertex-1174673660.md) — struct
<a id="function-function-mq3-renderer-bsp-render-data-retainedgridaxis-function-retainedgridaxis-size-errors-src-mq3-renderer-bsp-render-data-ml-829918456"></a>
### retainedGridAxis

```ml
function retainedGridAxis(size, errors)
```

Computes `retainedGridAxis` from `retained.toArray()` using `std.ds.list.List.withCapacity`, `retained.add`, `retained.toArray`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `dynamic` | — | Argument 1 supplied to `std.ds.list.List.withCapacity`. |
| `errors` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L260)

<a id="function-function-mq3-renderer-bsp-render-data-subdividehorizontal-function-subdividehorizontal-control-width-height-errorlimit-src-mq3-renderer-bsp-render-data-ml-25964919"></a>
### subdivideHorizontal

```ml
function subdivideHorizontal(control, width, height, errorLimit)
```

Baseq3 R_SubdividePatchToGrid checks perpendicular distance to the chord, inserts the two de Casteljau half points and rechecks the same span.  This preserves its non-uniform grid and 65-point axis ceiling instead of applying one worst-case subdivision count to every quadratic block.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | Indexed input read at `row*width+column`, `row*width+column+1`, `row*width+column+2`, `start+index`. |
| `width` | `dynamic` | — | Input used by `while column+2<width`. |
| `height` | `dynamic` | — | Input used by `for row=0 to height-1`. |
| `errorLimit` | `dynamic` | — | Input used by `else if maximum<=errorLimit or width+2>MAX_GRID_SIZE then errors[column+1]=1.0/maximum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L217)

<a id="function-function-mq3-renderer-bsp-render-data-subdividepatch-function-subdividepatch-control-width-height-errorlimit-src-mq3-renderer-bsp-render-data-ml-87135389"></a>
### subdividePatch

```ml
function subdividePatch(control, width, height, errorLimit)
```

Returns `[grid[0],grid[1],grid[2]]` from `mq3.renderer.bsp_render_data.subdividePatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | Value forwarded as `control` to `mq3.renderer.bsp_render_data.subdividePatchWithErrors`. |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.renderer.bsp_render_data.subdividePatchWithErrors`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.renderer.bsp_render_data.subdividePatchWithErrors`. |
| `errorLimit` | `dynamic` | — | Value forwarded as `errorLimit` to `mq3.renderer.bsp_render_data.subdividePatchWithErrors`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L383)

<a id="function-function-mq3-renderer-bsp-render-data-subdividepatchwitherrors-function-subdividepatchwitherrors-control-width-height-errorlimit-src-mq3-renderer-bsp-render-data-ml-1103887289"></a>
### subdividePatchWithErrors

```ml
function subdividePatchWithErrors(control, width, height, errorLimit)
```

Computes `subdividePatchWithErrors` from `[control,grid[1],grid[2],grid[3],grid[4]]` using `mq3.renderer.bsp_render_data.subdivideHorizontal`, `mq3.renderer.bsp_render_data.transposeGrid`, `mq3.renderer.bsp_render_data.putGridPointsOnCurve`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | Value forwarded as `control` to `mq3.renderer.bsp_render_data.subdivideHorizontal`. |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.renderer.bsp_render_data.subdivideHorizontal`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.renderer.bsp_render_data.subdivideHorizontal`. |
| `errorLimit` | `dynamic` | — | Value forwarded as `errorLimit` to `mq3.renderer.bsp_render_data.subdivideHorizontal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L370)

<a id="function-function-mq3-renderer-bsp-render-data-transposegrid-function-transposegrid-control-width-height-src-mq3-renderer-bsp-render-data-ml-1110757900"></a>
### transposeGrid

```ml
function transposeGrid(control, width, height)
```

Builds `result[row*height+column]` in `mq3.renderer.bsp_render_data.transposeGrid`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `dynamic` | — | Indexed input read at `column*width+row`. |
| `width` | `dynamic` | — | Input used by `result=array(width*height,void)`. |
| `height` | `dynamic` | — | Input used by `result=array(width*height,void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L204)

<a id="function-function-mq3-renderer-bsp-render-data-validmap-function-validmap-map-src-mq3-renderer-bsp-render-data-ml-1374775720"></a>
### validMap

```ml
function validMap(map)
```

Computes `map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>=17 and map.counts!=void and len(map.counts)>=17` for `mq3.renderer.bsp_render_data.validMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`, `map.offsets`, `map.counts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L88)

<a id="function-function-mq3-renderer-bsp-render-data-vertex-function-vertex-map-index-src-mq3-renderer-bsp-render-data-ml-956943024"></a>
### vertex

```ml
function vertex(map, index)
```

Builds `mq3.renderer.bsp_render_data.RenderVertex` for `mq3.renderer.bsp_render_data.vertex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `index` | `dynamic` | — | Initial value for `mq3.renderer.bsp_render_data.RenderVertex.sourceIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L117)

<a id="constant-constant-mq3-renderer-bsp-render-data-vertex-stride-const-vertex-stride-44-src-mq3-renderer-bsp-render-data-ml-691701117"></a>
### VERTEX_STRIDE

```ml
const VERTEX_STRIDE = 44
```

Byte stride of one vertex record in the BSP vertex lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L21)

<a id="function-function-mq3-renderer-bsp-render-data-vertexwithnormal-function-vertexwithnormal-value-normal-src-mq3-renderer-bsp-render-data-ml-830247524"></a>
### vertexWithNormal

```ml
function vertexWithNormal(value, normal)
```

Constructs `mq3.renderer.bsp_render_data.RenderVertex` with `position` = `value.position`, `baseUV` = `value.baseUV`, `lightmapUV` = `value.lightmapUV`, `color` = `value.color` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.position`, `value.baseUV`, `value.lightmapUV`, `value.color`, `value.entityColor`, `value.entityTexCoord`. |
| `normal` | `dynamic` | — | Initial value for `mq3.renderer.bsp_render_data.RenderVertex.normal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L318)
