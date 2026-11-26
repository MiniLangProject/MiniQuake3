# `src/mq3/client/playable_sky.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_sky`](Package-mq3-client-playable-sky-1686653829.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/shader_parser.ml` as `shaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="extern_function-extern-function-mq3-client-playable-sky-acos-extern-function-acos-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-client-playable-sky-ml-1211113756"></a>
### acos

```ml
extern function acos(value as double) from "ucrtbase.dll" returns double
```

Computes an inverse cosine through the Windows C runtime for sky texture-coordinate construction. This binding is used by playable sky.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Cosine value in the mathematical domain minus one through one. |


**Returns:** The principal arc cosine in radians for a valid argument in the range minus one through one.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L51)

<a id="function-function-mq3-client-playable-sky-additiveimage-function-additiveimage-source-src-mq3-client-playable-sky-ml-2137856641"></a>
### additiveImage

```ml
function additiveImage(source)
```

Calls `mq3.renderer.playable_materials.Image` from playable sky `additiveImage`. The final path returns `materials.Image(source.width,source.height,pixels)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.pixels`, `source.width`, `source.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L96)

<a id="function-function-mq3-client-playable-sky-appendtriangle-function-appendtriangle-batch-layer-a-b-c-src-mq3-client-playable-sky-ml-173698599"></a>
### appendTriangle

```ml
function appendTriangle(batch, layer, a, b, c)
```

Calls `mq3.platform.playable_window.appendSingleTextureTriangle` from playable sky `appendTriangle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value used by `return window.appendSingleTextureTriangle(batch,layer.slot,a.point,uvA,1.0,b.point,uvB,1.0,c.point,uvC,1.0,255,255,255)`. |
| `layer` | `dynamic` | — | Record read through `layer.slot`. |
| `a` | `dynamic` | — | Record read through `a.uv`, `a.point`. |
| `b` | `dynamic` | — | Record read through `b.uv`, `b.point`. |
| `c` | `dynamic` | — | Record read through `c.uv`, `c.point`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L322)

<a id="function-function-mq3-client-playable-sky-basegrid-function-basegrid-camera-width-height-src-mq3-client-playable-sky-ml-1852744162"></a>
### baseGrid

```ml
function baseGrid(camera, width, height)
```

Adapts `mq3.client.playable_sky.baseGridPrepared` to playable sky `baseGrid`, returning its result for `viewer.cameraBasis(camera), 0, 0, width, height`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. Forwarded to `mq3.client.playable_sky.baseGridPrepared`. |
| `width` | `dynamic` | — | Argument 4 of `mq3.client.playable_sky.baseGridPrepared`. |
| `height` | `dynamic` | — | Argument 5 of `mq3.client.playable_sky.baseGridPrepared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L295)

<a id="function-function-mq3-client-playable-sky-basegridprepared-function-basegridprepared-basis-left-top-width-height-src-mq3-client-playable-sky-ml-1629450305"></a>
### baseGridPrepared

```ml
function baseGridPrepared(basis, left, top, width, height)
```

Adapts `mq3.client.playable_sky.cloudGridPrepared` to playable sky `baseGridPrepared`, returning its result for `basis, left, top, width, height, 512.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basis` | `dynamic` | — | Argument 1 of `mq3.client.playable_sky.cloudGridPrepared`. |
| `left` | `dynamic` | — | Argument 2 of `mq3.client.playable_sky.cloudGridPrepared`. |
| `top` | `dynamic` | — | Argument 3 of `mq3.client.playable_sky.cloudGridPrepared`. |
| `width` | `dynamic` | — | Argument 4 of `mq3.client.playable_sky.cloudGridPrepared`. |
| `height` | `dynamic` | — | Argument 5 of `mq3.client.playable_sky.cloudGridPrepared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L290)

<a id="function-function-mq3-client-playable-sky-baseuv-function-baseuv-camera-width-height-x-y-src-mq3-client-playable-sky-ml-299950465"></a>
### baseUv

```ml
function baseUv(camera, width, height, x, y)
```

Calls `mq3.client.playable_viewer.focalLength`, `mq3.client.playable_sky.baseUvPrepared`, `mq3.client.playable_viewer.cameraBasis` from playable sky `baseUv`. The final path returns `baseUvPrepared(viewer.cameraBasis(camera),focal,width,height,x,y)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `width` | `dynamic` | — | Width in the coordinate space used by `baseUv`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `baseUv`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `baseUv`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `baseUv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L243)

<a id="function-function-mq3-client-playable-sky-baseuvprepared-function-baseuvprepared-basis-focal-width-height-x-y-src-mq3-client-playable-sky-ml-1075941345"></a>
### baseUvPrepared

```ml
function baseUvPrepared(basis, focal, width, height, x, y)
```

Adapts `mq3.client.playable_sky.cloudUvPrepared` to playable sky `baseUvPrepared`, returning its result for `basis, focal, width, height, x, y, 512.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basis` | `dynamic` | — | Argument 1 of `mq3.client.playable_sky.cloudUvPrepared`. |
| `focal` | `dynamic` | — | Argument 2 of `mq3.client.playable_sky.cloudUvPrepared`. |
| `width` | `dynamic` | — | Argument 3 of `mq3.client.playable_sky.cloudUvPrepared`. |
| `height` | `dynamic` | — | Argument 4 of `mq3.client.playable_sky.cloudUvPrepared`. |
| `x` | `dynamic` | — | Argument 5 of `mq3.client.playable_sky.cloudUvPrepared`. |
| `y` | `dynamic` | — | Argument 6 of `mq3.client.playable_sky.cloudUvPrepared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L235)

<a id="function-function-mq3-client-playable-sky-buildbatch-function-buildbatch-catalog-camera-width-height-nowmilliseconds-src-mq3-client-playable-sky-ml-1611899343"></a>
### buildBatch

```ml
function buildBatch(catalog, camera, width, height, nowMilliseconds)
```

Adapts `mq3.client.playable_sky.buildBatchPrepared` to playable sky `buildBatch`, returning its result for `catalog, viewer.cameraBasis(camera), 0, 0, width, height, nowMilliseconds`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Forwarded to `mq3.client.playable_sky.buildBatchPrepared`. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. Forwarded to `mq3.client.playable_sky.buildBatchPrepared`. |
| `width` | `dynamic` | — | Argument 5 of `mq3.client.playable_sky.buildBatchPrepared`. |
| `height` | `dynamic` | — | Argument 6 of `mq3.client.playable_sky.buildBatchPrepared`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. Forwarded to `mq3.client.playable_sky.buildBatchPrepared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L361)

<a id="function-function-mq3-client-playable-sky-buildbatchprepared-function-buildbatchprepared-catalog-basis-left-top-width-height-nowmilliseconds-src-mq3-client-playable-sky-ml-383625834"></a>
### buildBatchPrepared

```ml
function buildBatchPrepared(catalog, basis, left, top, width, height, nowMilliseconds)
```

Calls `mq3.client.playable_sky.cloudGridPrepared`, `mq3.platform.playable_window.createTriangleBatch`, `mq3.client.playable_sky.mappedVertex` and additional helpers from playable sky `buildBatchPrepared`. The final path returns `batch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.cloudHeight`, `catalog.layers`. |
| `basis` | `dynamic` | — | Value used by `grid=cloudGridPrepared(basis,left,top,width,height,catalog.cloudHeight)`. |
| `left` | `dynamic` | — | Value used by `grid=cloudGridPrepared(basis,left,top,width,height,catalog.cloudHeight)`. |
| `top` | `dynamic` | — | Value used by `grid=cloudGridPrepared(basis,left,top,width,height,catalog.cloudHeight)`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `buildBatchPrepared`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `buildBatchPrepared`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L335)

- [mq3.client.playable_sky.CachedView](Type-mq3-client-playable-sky-cachedview-1579855338.md) — struct
- [mq3.client.playable_sky.Catalog](Type-mq3-client-playable-sky-catalog-2147099612.md) — struct
<a id="function-function-mq3-client-playable-sky-cloudgridprepared-function-cloudgridprepared-basis-left-top-width-height-cloudheight-src-mq3-client-playable-sky-ml-335020307"></a>
### cloudGridPrepared

```ml
function cloudGridPrepared(basis, left, top, width, height, cloudHeight)
```

Calls `mq3.client.playable_viewer.focalLength`, `mq3.client.playable_sky.cloudUvPrepared`, `mq3.client.playable_sky.Vertex` and additional helpers from playable sky `cloudGridPrepared`. The final path returns `vertices`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basis` | `dynamic` | — | Value used by `uv=cloudUvPrepared(basis,focal,width,height,x,y,cloudHeight)`. |
| `left` | `dynamic` | — | Value used by `vertices[index]=Vertex(viewer.ScreenPoint(left+x,top+y,SKY_DEPTH),uv)`. |
| `top` | `dynamic` | — | Value used by `vertices[index]=Vertex(viewer.ScreenPoint(left+x,top+y,SKY_DEPTH),uv)`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `cloudGridPrepared`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `cloudGridPrepared`. |
| `cloudHeight` | `dynamic` | — | Value used by `uv=cloudUvPrepared(basis,focal,width,height,x,y,cloudHeight)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L271)

<a id="function-function-mq3-client-playable-sky-clouduvprepared-function-clouduvprepared-basis-focal-width-height-x-y-cloudheight-src-mq3-client-playable-sky-ml-19416289"></a>
### cloudUvPrepared

```ml
function cloudUvPrepared(basis, focal, width, height, x, y, cloudHeight)
```

Quake III's R_InitSkyTexCoords intersects each ray with a cloud sphere centered 4096 units below the viewer, then uses acos of its X/Y normal. Unlike yaw/pitch, this is continuous at the zenith.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basis` | `dynamic` | — | Value used by `ray=directionPrepared(basis,focal,width,height,x,y)`. |
| `focal` | `dynamic` | — | Value used by `ray=directionPrepared(basis,focal,width,height,x,y)`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `cloudUvPrepared`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `cloudUvPrepared`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `cloudUvPrepared`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `cloudUvPrepared`. |
| `cloudHeight` | `dynamic` | — | Value used by `distance=0.0-radius*ray[2]+trans.sqrt(radius*radius*ray[2]*ray[2]+2.0*radius*cloudHeight+cloudHeight*cloudHeight)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L221)

<a id="function-function-mq3-client-playable-sky-copybasis-function-copybasis-value-src-mq3-client-playable-sky-ml-1451784339"></a>
### copyBasis

```ml
function copyBasis(value)
```

Builds the playable sky `copyBasis` sequence from `[[value[0][0],value[0][1],value[0][2]],[value[1][0],value[1][1],value[1][2]],[value[2][0],value[2][1],value[2][2]]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L372)

<a id="function-function-mq3-client-playable-sky-direction-function-direction-camera-width-height-x-y-src-mq3-client-playable-sky-ml-1458572975"></a>
### direction

```ml
function direction(camera, width, height, x, y)
```

Calls `mq3.client.playable_viewer.focalLength`, `mq3.client.playable_sky.directionPrepared`, `mq3.client.playable_viewer.cameraBasis` from playable sky `direction`. The final path returns `directionPrepared(viewer.cameraBasis(camera),focal,width,height,x,y)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `width` | `dynamic` | — | Width in the coordinate space used by `direction`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `direction`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `direction`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `direction`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L206)

<a id="function-function-mq3-client-playable-sky-directionprepared-function-directionprepared-basis-focal-width-height-x-y-src-mq3-client-playable-sky-ml-2087014917"></a>
### directionPrepared

```ml
function directionPrepared(basis, focal, width, height, x, y)
```

Calls `mq3.shared.math.VectorNormalize` from playable sky `directionPrepared`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basis` | `dynamic` | — | Sequence read at `basis[0]`, `basis[1]`, `basis[2]`. |
| `focal` | `dynamic` | — | Value used by `value=[basis[0][0]*focal+basis[1][0]*side+basis[2][0]*vertical,basis[0][1]*focal+basis[1][1]*side+basis[2][1]*vertical,basis[0][2]*focal+basis...`. |
| `width` | `dynamic` | — | Width in the coordinate space used by `directionPrepared`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `directionPrepared`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `directionPrepared`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `directionPrepared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L194)

<a id="function-function-mq3-client-playable-sky-draw-function-draw-catalog-camera-width-height-nowmilliseconds-src-mq3-client-playable-sky-ml-1875670287"></a>
### draw

```ml
function draw(catalog, camera, width, height, nowMilliseconds)
```

Calls `mq3.client.playable_sky.retainedBatchPrepared`, `mq3.client.playable_viewer.cameraBasis`, `mq3.client.playable_sky.submitLayers` from playable sky `draw`. The final path returns `submitLayers(catalog,batch)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `width` | `dynamic` | — | Width in the coordinate space used by `draw`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `draw`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L447)

<a id="function-function-mq3-client-playable-sky-drawlayer-function-drawlayer-layer-camera-width-height-nowmilliseconds-layerindex-src-mq3-client-playable-sky-ml-220321872"></a>
### drawLayer

```ml
function drawLayer(layer, camera, width, height, nowMilliseconds, layerIndex)
```

Calls `mq3.client.playable_sky.vertex`, `mq3.client.playable_sky.drawTriangle` from playable sky `drawLayer`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `layer` | `dynamic` | — | Value used by `a=vertex(camera,width,height,x0,y0,layer,nowMilliseconds,depth)`. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `width` | `dynamic` | — | Width in the coordinate space used by `drawLayer`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `drawLayer`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `layerIndex` | `dynamic` | — | Value used by `depth=SKY_DEPTH-layerIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L424)

<a id="extern_function-extern-function-mq3-client-playable-sky-drawskylayernative-extern-function-drawskylayernative-records-as-ptr-capacity-as-i32-firsttriangle-as-i32-trianglecount-as-i32-additive-as-i32-from-playable-window-dll-symbol-playable-window-draw-sky-layer-returns-i32-src-mq3-client-playable-sky-ml-1132978482"></a>
### drawSkyLayerNative

```ml
extern function drawSkyLayerNative(records as ptr, capacity as i32, firstTriangle as i32, triangleCount as i32, additive as i32) from "playable_window.dll" symbol "playable_window_draw_sky_layer" returns i32
```

Draws a retained sky triangle range with optional ONE/ONE additive blending, then restores the previous raster-state settings. This binding is used by playable sky.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — | Read-only byte-buffer pointer containing 128-byte native triangle records. |
| `capacity` | `i32` | — | Total available record-buffer size in bytes. |
| `firstTriangle` | `i32` | — | Zero-based index of the first triangle to draw. |
| `triangleCount` | `i32` | — | Number of triangles to draw, from one through 65,536, within the supplied buffer. |
| `additive` | `i32` | — | Zero for ordinary blending or one for the sky shader ONE/ONE additive blend mode. |


**Returns:** The underlying triangle-batch draw result; zero when the range or blend selector is invalid.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L47)

<a id="function-function-mq3-client-playable-sky-drawtriangle-function-drawtriangle-layer-a-b-c-src-mq3-client-playable-sky-ml-456704905"></a>
### drawTriangle

```ml
function drawTriangle(layer, a, b, c)
```

Calls `mq3.platform.playable_window.drawTriangle` from playable sky `drawTriangle`. The final path returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `layer` | `dynamic` | — | Record read through `layer.slot`. |
| `a` | `dynamic` | — | Record read through `a.point`, `a.uv`. |
| `b` | `dynamic` | — | Record read through `b.point`, `b.uv`. |
| `c` | `dynamic` | — | Record read through `c.point`, `c.uv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L312)

<a id="function-function-mq3-client-playable-sky-drawviewport-function-drawviewport-catalog-basis-area-nowmilliseconds-src-mq3-client-playable-sky-ml-927603488"></a>
### drawViewport

```ml
function drawViewport(catalog, basis, area, nowMilliseconds)
```

Calls `mq3.client.playable_sky.retainedBatchRefdef`, `mq3.client.playable_sky.submitLayers` from playable sky `drawViewport`. The final path returns `submitLayers(catalog,batch)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `basis` | `dynamic` | — | Sequence whose length/content is inspected by `drawViewport`. |
| `area` | `dynamic` | — | Record read through `area.width`, `area.height`, `area.x`, `area.y`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L481)

<a id="function-function-mq3-client-playable-sky-fail-function-fail-message-src-mq3-client-playable-sky-ml-264272003"></a>
### fail

```ml
function fail(message)
```

Creates the playable sky error `7610` with diagnostic text `"playable sky: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"playable sky: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L74)

<a id="constant-constant-mq3-client-playable-sky-grid-columns-const-grid-columns-12-src-mq3-client-playable-sky-ml-236733188"></a>
### GRID_COLUMNS

```ml
const GRID_COLUMNS = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L55)

<a id="constant-constant-mq3-client-playable-sky-grid-rows-const-grid-rows-8-src-mq3-client-playable-sky-ml-661725661"></a>
### GRID_ROWS

```ml
const GRID_ROWS = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L56)

<a id="function-function-mq3-client-playable-sky-hassurfaceparm-function-hassurfaceparm-shader-wanted-src-mq3-client-playable-sky-ml-2015224748"></a>
### hasSurfaceParm

```ml
function hasSurfaceParm(shader, wanted)
```

Calls `std.string.toLowerAscii` from playable sky `hasSurfaceParm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — | Record read through `shader.surfaceParms`. |
| `wanted` | `dynamic` | — | Value used by `for each value in shader.surfaceParms if strings.toLowerAscii(value)==wanted then return true end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L81)

<a id="function-function-mq3-client-playable-sky-isskyshader-function-isskyshader-name-src-mq3-client-playable-sky-ml-339427785"></a>
### isSkyShader

```ml
function isSkyShader(name)
```

Computes `name!=void and strings.toLowerAscii(name)==SHADER_NAME` for playable sky `isSkyShader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable sky resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L77)

<a id="function-function-mq3-client-playable-sky-isskyshaderindexed-function-isskyshaderindexed-index-name-src-mq3-client-playable-sky-ml-604029587"></a>
### isSkyShaderIndexed

```ml
function isSkyShaderIndexed(index, name)
```

Calls `mq3.renderer.shader_parser.parseIndexed`, `mq3.client.playable_sky.hasSurfaceParm` from playable sky `isSkyShaderIndexed`. The final path returns `hasSurfaceParm(parsed,"sky")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Value used by `parsed=try(shaderParser.parseIndexed(index,name))`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable sky resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L89)

- [mq3.client.playable_sky.Layer](Type-mq3-client-playable-sky-layer-276908874.md) — struct
<a id="function-function-mq3-client-playable-sky-layerfromstage-function-layerfromstage-archive-stage-slot-src-mq3-client-playable-sky-ml-1532831010"></a>
### layerFromStage

```ml
function layerFromStage(archive, stage, slot)
```

Calls `std.string.toLowerAscii`, `mq3.renderer.playable_materials.loadImage`, `mq3.client.playable_sky.Layer` from playable sky `layerFromStage`. The final path returns `Layer(loaded[0],image,slot,scaleU,scaleV,scrollU,scrollV,additive)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `stage` | `dynamic` | — | Record read through `stage.isLightmap`, `stage.images`, `stage.texMods`, `stage.blendSrc` and additional values. |
| `slot` | `dynamic` | — | Value used by `return Layer(loaded[0],image,slot,scaleU,scaleV,scrollU,scrollV,additive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L110)

<a id="function-function-mq3-client-playable-sky-load-function-load-archive-firsttextureslot-maxtextureslots-src-mq3-client-playable-sky-ml-1207551233"></a>
### load

```ml
function load(archive, firstTextureSlot, maxTextureSlots)
```

Calls `mq3.renderer.playable_materials.buildScriptIndex`, `mq3.client.playable_sky.loadIndexed` from playable sky `load`. The final path returns `loadIndexed(archive,scripts[0],SHADER_NAME,firstTextureSlot,maxTextureSlots)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `firstTextureSlot` | `dynamic` | — | First texture slot reserved for this asset collection. |
| `maxTextureSlots` | `dynamic` | — | Maximum number of texture slots available to the renderer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L165)

<a id="function-function-mq3-client-playable-sky-loadindexed-function-loadindexed-archive-index-shadername-firsttextureslot-maxtextureslots-src-mq3-client-playable-sky-ml-1968758591"></a>
### loadIndexed

```ml
function loadIndexed(archive, index, shaderName, firstTextureSlot, maxTextureSlots)
```

Calls `mq3.renderer.shader_parser.parseIndexed`, `mq3.client.playable_sky.hasSurfaceParm`, `mq3.client.playable_sky.layerFromStage` and additional helpers from playable sky `loadIndexed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `index` | `dynamic` | — | Value tested by `archive==void or index==void` before the calculation continues. |
| `shaderName` | `dynamic` | — | Value used by `parsed=shaderParser.parseIndexed(index,shaderName)`. |
| `firstTextureSlot` | `dynamic` | — | First texture slot reserved for this asset collection. |
| `maxTextureSlots` | `dynamic` | — | Maximum number of texture slots available to the renderer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L133)

<a id="function-function-mq3-client-playable-sky-loadmap-function-loadmap-archive-map-index-firsttextureslot-maxtextureslots-src-mq3-client-playable-sky-ml-1890559575"></a>
### loadMap

```ml
function loadMap(archive, map, index, firstTextureSlot, maxTextureSlots)
```

Calls `mq3.renderer.playable_materials.shaderName`, `mq3.client.playable_sky.isSkyShaderIndexed`, `mq3.client.playable_sky.loadIndexed` from playable sky `loadMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `map` | `dynamic` | — | Record read through `map.counts`. |
| `index` | `dynamic` | — | Value tested by `if isSkyShaderIndexed(index,name)` before the calculation continues. |
| `firstTextureSlot` | `dynamic` | — | First texture slot reserved for this asset collection. |
| `maxTextureSlots` | `dynamic` | — | Maximum number of texture slots available to the renderer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L153)

<a id="function-function-mq3-client-playable-sky-mappedvertex-function-mappedvertex-source-layer-seconds-depth-src-mq3-client-playable-sky-ml-1489163800"></a>
### mappedVertex

```ml
function mappedVertex(source, layer, seconds, depth)
```

Calls `mq3.client.playable_sky.Vertex`, `mq3.client.playable_viewer.ScreenPoint` from playable sky `mappedVertex`. The final path returns `Vertex(viewer.ScreenPoint(source.point.x,source.point.y,depth),uv)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.uv`, `source.point.x`, `source.point.y`. |
| `layer` | `dynamic` | — | Record read through `layer.scaleU`, `layer.scrollU`, `layer.scaleV`, `layer.scrollV`. |
| `seconds` | `dynamic` | — | Value used by `uv=[source.uv[0]*layer.scaleU+seconds*layer.scrollU,source.uv[1]*layer.scaleV+seconds*layer.scrollV]`. |
| `depth` | `dynamic` | — | Value used by `return Vertex(viewer.ScreenPoint(source.point.x,source.point.y,depth),uv)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L302)

<a id="constant-constant-mq3-client-playable-sky-max-cached-views-const-max-cached-views-8-src-mq3-client-playable-sky-ml-1183835771"></a>
### MAX_CACHED_VIEWS

```ml
const MAX_CACHED_VIEWS = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L58)

<a id="function-function-mq3-client-playable-sky-release-function-release-catalog-src-mq3-client-playable-sky-ml-1896610609"></a>
### release

```ml
function release(catalog)
```

Updates `catalog.cache` during playable sky `release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Mutable playable sky record/storage; this routine assigns `catalog.cache`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L182)

<a id="constant-constant-mq3-client-playable-sky-required-textures-const-required-textures-2-src-mq3-client-playable-sky-ml-1243639279"></a>
### REQUIRED_TEXTURES

```ml
const REQUIRED_TEXTURES = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L54)

<a id="function-function-mq3-client-playable-sky-retainedbatchprepared-function-retainedbatchprepared-catalog-basis-left-top-width-height-nowmilliseconds-src-mq3-client-playable-sky-ml-275249644"></a>
### retainedBatchPrepared

```ml
function retainedBatchPrepared(catalog, basis, left, top, width, height, nowMilliseconds)
```

Preserve MiniLang's camera/ray math exactly, retaining its double UVs until the final native binary32 batch stores. Time changes only the two uniforms per layer; an unchanged camera therefore performs no grid allocation/math. A bounded ring handles alternating main/portal/refdef views without growth.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Mutable playable sky record/storage; this routine assigns `catalog.cache`. |
| `basis` | `dynamic` | — | Sequence whose length/content is inspected by `retainedBatchPrepared`. |
| `left` | `dynamic` | — | Value assigned to `entry.left`. |
| `top` | `dynamic` | — | Value assigned to `entry.top`. |
| `width` | `dynamic` | — | Value assigned to `entry.width`. |
| `height` | `dynamic` | — | Value assigned to `entry.height`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L385)

<a id="function-function-mq3-client-playable-sky-retainedbatchrefdef-function-retainedbatchrefdef-catalog-axes-left-top-width-height-nowmilliseconds-src-mq3-client-playable-sky-ml-510302867"></a>
### retainedBatchRefdef

```ml
function retainedBatchRefdef(catalog, axes, left, top, width, height, nowMilliseconds)
```

Only refdef callers carry a LEFT vector. Standalone camera/prepared APIs already carry RIGHT and must retain their existing ray/batch semantics.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Forwarded to `mq3.client.playable_sky.retainedBatchPrepared`. |
| `axes` | `dynamic` | — | Argument 2 of `mq3.client.playable_sky.retainedBatchPrepared`; passed as `viewer.refdefBasis(axes)`. |
| `left` | `dynamic` | — | Argument 3 of `mq3.client.playable_sky.retainedBatchPrepared`. |
| `top` | `dynamic` | — | Argument 4 of `mq3.client.playable_sky.retainedBatchPrepared`. |
| `width` | `dynamic` | — | Argument 5 of `mq3.client.playable_sky.retainedBatchPrepared`. |
| `height` | `dynamic` | — | Argument 6 of `mq3.client.playable_sky.retainedBatchPrepared`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. Forwarded to `mq3.client.playable_sky.retainedBatchPrepared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L473)

<a id="function-function-mq3-client-playable-sky-samebasis-function-samebasis-left-right-src-mq3-client-playable-sky-ml-707949049"></a>
### sameBasis

```ml
function sameBasis(left, right)
```

Evaluates playable sky `sameBasis` and returns `false`, `true` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Sequence read at `left[axis]`. |
| `right` | `dynamic` | — | Sequence read at `right[axis]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L366)

<a id="constant-constant-mq3-client-playable-sky-shader-name-const-shader-name-textures-skies-tim-hell-src-mq3-client-playable-sky-ml-628692390"></a>
### SHADER_NAME

```ml
const SHADER_NAME = "textures/skies/tim_hell"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L53)

<a id="constant-constant-mq3-client-playable-sky-sky-depth-const-sky-depth-1000000-src-mq3-client-playable-sky-ml-654785292"></a>
### SKY_DEPTH

```ml
const SKY_DEPTH = 1000000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L57)

<a id="constant-constant-mq3-client-playable-sky-source-vertex-bytes-const-source-vertex-bytes-32-src-mq3-client-playable-sky-ml-2067220048"></a>
### SOURCE_VERTEX_BYTES

```ml
const SOURCE_VERTEX_BYTES = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L59)

<a id="extern_function-extern-function-mq3-client-playable-sky-storeskyvertexnative-extern-function-storeskyvertexnative-source-as-ptr-capacity-as-i32-index-as-i32-x-as-double-y-as-double-u-as-double-v-as-double-from-playable-window-dll-symbol-playable-window-store-sky-vertex-returns-i32-src-mq3-client-playable-sky-ml-647891068"></a>
### storeSkyVertexNative

```ml
extern function storeSkyVertexNative(source as ptr, capacity as i32, index as i32, x as double, y as double, u as double, v as double) from "playable_window.dll" symbol "playable_window_store_sky_vertex" returns i32
```

Stores one finite sky source vertex as four native doubles in a 32-byte record after checking its destination range. This binding is used by playable sky.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `ptr` | — | Writable byte-buffer pointer receiving 32-byte double-precision source vertices. |
| `capacity` | `i32` | — | Available destination buffer size in bytes. |
| `index` | `i32` | — | Zero-based source-vertex index; (index + 1) times 32 must fit in capacity. |
| `x` | `double` | — | Finite projected X coordinate stored as a double. |
| `y` | `double` | — | Finite projected Y coordinate stored as a double. |
| `u` | `double` | — | Finite base U texture coordinate stored as a double. |
| `v` | `double` | — | Finite base V texture coordinate stored as a double. |


**Returns:** One when the vertex is stored; zero for null storage, negative/out-of-range indices or nonfinite coordinates.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L22)

<a id="function-function-mq3-client-playable-sky-submitlayers-function-submitlayers-catalog-batch-src-mq3-client-playable-sky-ml-985914795"></a>
### submitLayers

```ml
function submitLayers(catalog, batch)
```

Calls `mq3.client.playable_sky.drawSkyLayerNative`, `nativeBytesPtr` from playable sky `submitLayers`. The final path returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.layers`. |
| `batch` | `dynamic` | — | Record read through `batch.data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L455)

<a id="extern_function-extern-function-mq3-client-playable-sky-updateskylayernative-extern-function-updateskylayernative-records-as-ptr-capacity-as-i32-firsttriangle-as-i32-source-as-ptr-sourcebytes-as-i32-columns-as-i32-rows-as-i32-slot-as-i32-scaleu-as-double-scalev-as-double-scrollu-as-double-scrollv-as-double-nowmilliseconds-as-double-depth-as-double-from-playable-window-dll-symbol-playable-window-update-sky-layer-returns-i32-src-mq3-client-playable-sky-ml-1282041420"></a>
### updateSkyLayerNative

```ml
extern function updateSkyLayerNative(records as ptr, capacity as i32, firstTriangle as i32, source as ptr, sourceBytes as i32, columns as i32, rows as i32, slot as i32, scaleU as double, scaleV as double, scrollU as double, scrollV as double, nowMilliseconds as double, depth as double) from "playable_window.dll" symbol "playable_window_update_sky_layer" returns i32
```

Expands a retained sky grid into 128-byte triangle records with scaled UVs and time-based scrolling. This binding is used by playable sky.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — | Writable native triangle-buffer pointer; each output record occupies 128 bytes. |
| `capacity` | `i32` | — | Destination triangle-buffer size in bytes, including records before firstTriangle. |
| `firstTriangle` | `i32` | — | Zero-based triangle-record offset at which this layer is written. |
| `source` | `ptr` | — | Read-only grid of 32-byte source vertices ordered by row, with columns + 1 vertices in each row. |
| `sourceBytes` | `i32` | — | Source-buffer size in bytes; it must hold (columns + 1) times (rows + 1) source vertices. |
| `columns` | `i32` | — | Number of grid cells per row, from one through 256. |
| `rows` | `i32` | — | Number of grid-cell rows, from one through 256. |
| `slot` | `i32` | — | Base texture slot written to every generated triangle. |
| `scaleU` | `double` | — | Finite multiplier applied to each source U coordinate. |
| `scaleV` | `double` | — | Finite multiplier applied to each source V coordinate. |
| `scrollU` | `double` | — | Finite U scrolling rate in texture-coordinate units per second. |
| `scrollV` | `double` | — | Finite V scrolling rate in texture-coordinate units per second. |
| `nowMilliseconds` | `double` | — | Finite, nonnegative time in milliseconds; converted to seconds for the scrolling offset. |
| `depth` | `double` | — | Finite positive projected depth written into each triangle vertex. |


**Returns:** Twice columns times rows on success; zero for invalid dimensions, nonfinite parameters or insufficient buffers.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L39)

<a id="function-function-mq3-client-playable-sky-upload-function-upload-catalog-src-mq3-client-playable-sky-ml-1025607951"></a>
### upload

```ml
function upload(catalog)
```

Calls `mq3.platform.playable_window.uploadTexture`, `mq3.client.playable_sky.release` from playable sky `upload`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.layers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L172)

<a id="function-function-mq3-client-playable-sky-vertex-function-vertex-camera-width-height-x-y-layer-nowmilliseconds-depth-src-mq3-client-playable-sky-ml-894823759"></a>
### vertex

```ml
function vertex(camera, width, height, x, y, layer, nowMilliseconds, depth)
```

Calls `mq3.client.playable_sky.baseUv`, `mq3.client.playable_sky.Vertex`, `mq3.client.playable_viewer.ScreenPoint` from playable sky `vertex`. The final path returns `Vertex(viewer.ScreenPoint(x,y,depth),mapped)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `width` | `dynamic` | — | Width in the coordinate space used by `vertex`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `vertex`. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `vertex`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `vertex`. |
| `layer` | `dynamic` | — | Record read through `layer.scaleU`, `layer.scrollU`, `layer.scaleV`, `layer.scrollV`. |
| `nowMilliseconds` | `dynamic` | — | Current monotonic/frame clock in milliseconds. |
| `depth` | `dynamic` | — | Value used by `return Vertex(viewer.ScreenPoint(x,y,depth),mapped)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L257)

- [mq3.client.playable_sky.Vertex](Type-mq3-client-playable-sky-vertex-2077306707.md) — struct
- [mq3.client.playable_sky.ViewCache](Type-mq3-client-playable-sky-viewcache-1549416326.md) — struct
