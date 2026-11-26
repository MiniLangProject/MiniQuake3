# `src/mq3/renderer/tr_sky.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_sky`](Package-mq3-renderer-tr-sky-1785833521.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-renderer-tr-sky-absolute-function-absolute-value-src-mq3-renderer-tr-sky-ml-1062613873"></a>
### absolute

```ml
function absolute(value)
```

Returns `value` from `mq3.renderer.tr_sky.absolute`; earlier branches return `0.0-value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value<0.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L49)

<a id="function-function-mq3-renderer-tr-sky-absoluteindex-function-absoluteindex-value-src-mq3-renderer-tr-sky-ml-1459490731"></a>
### absoluteIndex

```ml
function absoluteIndex(value)
```

Returns `value` from `mq3.renderer.tr_sky.absoluteIndex`; earlier branches return `0-value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value<0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L52)

<a id="extern_function-extern-function-mq3-renderer-tr-sky-acos-extern-function-acos-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-renderer-tr-sky-ml-402378492"></a>
### acos

```ml
extern function acos(value as double) from "ucrtbase.dll" returns double
```

Computes the inverse cosine through the C runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Cosine value whose angle is requested; the ordinary real domain is -1 through 1. |


**Returns:** The angle in radians for the supplied cosine.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L12)

<a id="function-function-mq3-renderer-tr-sky-addskypolygon-function-addskypolygon-bounds-vecs-src-mq3-renderer-tr-sky-ml-1836738620"></a>
### addSkyPolygon

```ml
function addSkyPolygon(bounds, vecs)
```

Updates `bounds.minS[axis]`, `bounds.maxS[axis]`, `bounds.minT[axis]`, `bounds.maxT[axis]` in `mq3.renderer.tr_sky.addSkyPolygon`; returns `axis`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — | Mutable record or buffer; this call updates `bounds.minS[axis]`, `bounds.maxS[axis]`, `bounds.minT[axis]`, `bounds.maxT[axis]`. |
| `vecs` | `dynamic` | — | Sequence traversed as `value` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L64)

- [mq3.renderer.tr_sky.Bounds](Type-mq3-renderer-tr-sky-bounds-470777616.md) — struct
<a id="extern_function-extern-function-mq3-renderer-tr-sky-ceil-extern-function-ceil-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-renderer-tr-sky-ml-1503698102"></a>
### ceil

```ml
extern function ceil(value as double) from "ucrtbase.dll" returns double
```

Rounds a floating-point value toward positive infinity through the C runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Floating-point value to round upward. |


**Returns:** The least integral floating-point value no smaller than the input.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L20)

<a id="function-function-mq3-renderer-tr-sky-clearskybox-function-clearskybox-src-mq3-renderer-tr-sky-ml-1453012416"></a>
### clearSkyBox

```ml
function clearSkyBox()
```

Constructs `mq3.renderer.tr_sky.Bounds` with `minS` = `array(6,9999.0)`, `minT` = `array(6,9999.0)`, `maxS` = `array(6,-9999.0)`, `maxT` = `array(6,-9999.0)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L43)

<a id="function-function-mq3-renderer-tr-sky-clipskypolygon-function-clipskypolygon-bounds-vecs-stage-src-mq3-renderer-tr-sky-ml-1287058832"></a>
### clipSkyPolygon

```ml
function clipSkyPolygon(bounds, vecs, stage)
```

Computes `clipSkyPolygon` from `clipSkyPolygon(bounds,second,stage+1)` using `mq3.renderer.tr_sky.addSkyPolygon`, `mq3.renderer.tr_sky.dot`, `mq3.renderer.tr_sky.clipSkyPolygon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — | Value forwarded as `bounds` to `mq3.renderer.tr_sky.addSkyPolygon`. |
| `vecs` | `dynamic` | — | Value forwarded as `vecs` to `mq3.renderer.tr_sky.addSkyPolygon`. |
| `stage` | `dynamic` | — | Input tested by `stage==6`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L87)

- [mq3.renderer.tr_sky.CloudTable](Type-mq3-renderer-tr-sky-cloudtable-2136303114.md) — struct
<a id="function-function-mq3-renderer-tr-sky-copy3-function-copy3-value-src-mq3-renderer-tr-sky-ml-1785229313"></a>
### copy3

```ml
function copy3(value)
```

Returns `[value[0],value[1],value[2]]` for `mq3.renderer.tr_sky.copy3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L55)

<a id="function-function-mq3-renderer-tr-sky-dot-function-dot-a-b-src-mq3-renderer-tr-sky-ml-830669627"></a>
### dot

```ml
function dot(a, b)
```

Computes `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `mq3.renderer.tr_sky.dot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L59)

<a id="function-function-mq3-renderer-tr-sky-drawskybox-function-drawskybox-shader-bounds-zfar-src-mq3-renderer-tr-sky-ml-2054625809"></a>
### drawSkyBox

```ml
function drawSkyBox(shader, bounds, zFar)
```

Builds only visible quantized skybox sides using the renderer's cube-face texture order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — | Record providing `shader.outerbox`. |
| `bounds` | `dynamic` | — | Value forwarded as `bounds` to `mq3.renderer.tr_sky.quantizedBounds`. |
| `zFar` | `dynamic` | — | Value forwarded as `zFar` to `mq3.renderer.tr_sky.drawSkySide`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L175)

<a id="function-function-mq3-renderer-tr-sky-drawskyside-function-drawskyside-image-axis-mins-maxs-zfar-src-mq3-renderer-tr-sky-ml-1784329749"></a>
### drawSkySide

```ml
function drawSkySide(image, axis, mins, maxs, zFar)
```

Builds `mq3.renderer.tr_sky.SkySide` for `mq3.renderer.tr_sky.drawSkySide`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — | Initial value for `mq3.renderer.tr_sky.SkySide.image`. |
| `axis` | `dynamic` | — | Initial value for `mq3.renderer.tr_sky.SkySide.axis`. |
| `mins` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `maxs` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `zFar` | `dynamic` | — | Value forwarded as `zFar` to `mq3.renderer.tr_sky.makeSkyVec`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L164)

<a id="function-function-mq3-renderer-tr-sky-fillcloudbox-function-fillcloudbox-shader-bounds-zfar-origin-table-stage-mesh-src-mq3-renderer-tr-sky-ml-1754791264"></a>
### fillCloudBox

```ml
function fillCloudBox(shader, bounds, zFar, origin, table, stage, mesh)
```

Computes `fillCloudBox` from `fillCloudySkySide(mesh,axis,range[0],range[1],zFar,origin,table,stage==0)` using `mq3.renderer.tr_sky.quantizedBounds`, `mq3.renderer.tr_sky.fillCloudySkySide`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `bounds` | `dynamic` | — | Value forwarded as `bounds` to `mq3.renderer.tr_sky.quantizedBounds`. |
| `zFar` | `dynamic` | — | Value forwarded as `zFar` to `mq3.renderer.tr_sky.fillCloudySkySide`. |
| `origin` | `dynamic` | — | Value forwarded as `origin` to `mq3.renderer.tr_sky.fillCloudySkySide`. |
| `table` | `dynamic` | — | Value forwarded as `table` to `mq3.renderer.tr_sky.fillCloudySkySide`. |
| `stage` | `dynamic` | — | Input used by `mesh=fillCloudySkySide(mesh,axis,range[0],range[1],zFar,origin,table,stage==0)`. |
| `mesh` | `dynamic` | — | Value forwarded as `mesh` to `mq3.renderer.tr_sky.fillCloudySkySide`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L212)

<a id="function-function-mq3-renderer-tr-sky-fillcloudyskyside-function-fillcloudyskyside-mesh-axis-mins-maxs-zfar-origin-table-addindexes-src-mq3-renderer-tr-sky-ml-1270721226"></a>
### fillCloudySkySide

```ml
function fillCloudySkySide(mesh, axis, mins, maxs, zFar, origin, table, addIndexes)
```

Updates `mesh.vertices`, `mesh.indexes` in `mq3.renderer.tr_sky.fillCloudySkySide`; returns `mesh`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mesh` | `dynamic` | — | Mutable record or buffer; this call updates `mesh.vertices`, `mesh.indexes`. |
| `axis` | `dynamic` | — | Value forwarded as `axis` to `mq3.renderer.tr_sky.makeSkyVec`. |
| `mins` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `maxs` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `zFar` | `dynamic` | — | Value forwarded as `zFar` to `mq3.renderer.tr_sky.makeSkyVec`. |
| `origin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `table` | `dynamic` | — | Record providing `table.coords`. |
| `addIndexes` | `dynamic` | — | Input tested by `addIndexes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L193)

<a id="extern_function-extern-function-mq3-renderer-tr-sky-floor-extern-function-floor-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-renderer-tr-sky-ml-1424871076"></a>
### floor

```ml
extern function floor(value as double) from "ucrtbase.dll" returns double
```

Rounds a floating-point value toward negative infinity through the C runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Floating-point value to round downward. |


**Returns:** The greatest integral floating-point value no larger than the input.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L16)

<a id="constant-constant-mq3-renderer-tr-sky-half-sky-subdivisions-const-half-sky-subdivisions-4-src-mq3-renderer-tr-sky-ml-1237018045"></a>
### HALF_SKY_SUBDIVISIONS

```ml
const HALF_SKY_SUBDIVISIONS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L23)

<a id="function-function-mq3-renderer-tr-sky-makeskyvec-function-makeskyvec-s-t-axis-zfar-skymin-skymax-src-mq3-renderer-tr-sky-ml-429113513"></a>
### makeSkyVec

```ml
function makeSkyVec(s, t, axis, zFar, skyMin, skyMax)
```

Builds `mq3.renderer.tr_sky.SkyVertex` after updating `xyz[j]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — | Input used by `base=[s*size,t*size,size]`. |
| `t` | `dynamic` | — | Input used by `base=[s*size,t*size,size]`. |
| `axis` | `dynamic` | — | Input used by `for j=0 to 2 k=stToVec[axis][j]`. |
| `zFar` | `dynamic` | — | Input used by `size=zFar/1.75`. |
| `skyMin` | `dynamic` | — | Input tested by `u<skyMin`. |
| `skyMax` | `dynamic` | — | Input tested by `u<skyMin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L134)

<a id="constant-constant-mq3-renderer-tr-sky-max-clip-verts-const-max-clip-verts-64-src-mq3-renderer-tr-sky-ml-1816867371"></a>
### MAX_CLIP_VERTS

```ml
const MAX_CLIP_VERTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L25)

- [mq3.renderer.tr_sky.Mesh](Type-mq3-renderer-tr-sky-mesh-151315812.md) — struct
<a id="constant-constant-mq3-renderer-tr-sky-on-epsilon-const-on-epsilon-0-1-src-mq3-renderer-tr-sky-ml-1238834828"></a>
### ON_EPSILON

```ml
const ON_EPSILON = 0.1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L24)

<a id="function-function-mq3-renderer-tr-sky-perpendicular-function-perpendicular-direction-src-mq3-renderer-tr-sky-ml-414884837"></a>
### perpendicular

```ml
function perpendicular(direction)
```

Computes `perpendicular` from `[value[0]/length,value[1]/length,value[2]/length]` using `mq3.renderer.tr_sky.absolute`, `mq3.renderer.tr_sky.dot`, `mq3.compat.numeric.fsqrt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — | Value forwarded as `b` to `mq3.renderer.tr_sky.dot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L255)

<a id="function-function-mq3-renderer-tr-sky-quantizedbounds-function-quantizedbounds-bounds-axis-mint-src-mq3-renderer-tr-sky-ml-612849022"></a>
### quantizedBounds

```ml
function quantizedBounds(bounds, axis, minT)
```

Computes `quantizedBounds` from `[[minS,minY],[maxS,maxY]]` using `mq3.compat.numeric.trunc32`, `mq3.renderer.tr_sky.floor`, `mq3.renderer.tr_sky.ceil`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — | Record providing `bounds.minS`, `bounds.minT`, `bounds.maxS`, `bounds.maxT`. |
| `axis` | `dynamic` | — | Input used by `minS=n.trunc32(floor(bounds.minS[axis]*HALF_SKY_SUBDIVISIONS))`. |
| `minT` | `dynamic` | — | Indexed input read at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L148)

<a id="function-function-mq3-renderer-tr-sky-rbclipskypolygons-function-rbclipskypolygons-points-indexes-vieworigin-src-mq3-renderer-tr-sky-ml-1696729654"></a>
### rbClipSkyPolygons

```ml
function rbClipSkyPolygons(points, indexes, viewOrigin)
```

Computes `rbClipSkyPolygons` from `clearSkyBox()` using `mq3.renderer.tr_sky.clearSkyBox`, `mq3.renderer.tr_sky.clipSkyPolygon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Indexed input read at `indexes[i+j`. |
| `indexes` | `dynamic` | — | Indexed input read at `i+j`. |
| `viewOrigin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L115)

<a id="function-function-mq3-renderer-tr-sky-rbdrawsun-function-rbdrawsun-skyrendered-drawsun-zfar-direction-src-mq3-renderer-tr-sky-ml-1406378740"></a>
### rbDrawSun

```ml
function rbDrawSun(skyRendered, drawSun, zFar, direction)
```

Builds `mq3.renderer.tr_sky.Mesh` for `mq3.renderer.tr_sky.rbDrawSun`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `skyRendered` | `dynamic` | — | Input tested by `not skyRendered or not drawSun`. |
| `drawSun` | `dynamic` | — | Input tested by `not skyRendered or not drawSun`. |
| `zFar` | `dynamic` | — | Input used by `dist=zFar/1.75`. |
| `direction` | `dynamic` | — | Value forwarded as `direction` to `mq3.renderer.tr_sky.perpendicular`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L265)

<a id="function-function-mq3-renderer-tr-sky-rbstageiteratorsky-function-rbstageiteratorsky-points-indexes-vieworigin-shader-zfar-fastsky-showsky-table-drawsun-sundirection-src-mq3-renderer-tr-sky-ml-517538792"></a>
### rbStageIteratorSky

```ml
function rbStageIteratorSky(points, indexes, viewOrigin, shader, zFar, fastSky, showSky, table, drawSun, sunDirection)
```

Builds `mq3.renderer.tr_sky.StageResult` for `mq3.renderer.tr_sky.rbStageIteratorSky`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Value forwarded as `points` to `mq3.renderer.tr_sky.rbClipSkyPolygons`. |
| `indexes` | `dynamic` | — | Value forwarded as `indexes` to `mq3.renderer.tr_sky.rbClipSkyPolygons`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `viewOrigin` to `mq3.renderer.tr_sky.rbClipSkyPolygons`. |
| `shader` | `dynamic` | — | Value forwarded as `shader` to `mq3.renderer.tr_sky.drawSkyBox`. |
| `zFar` | `dynamic` | — | Value forwarded as `zFar` to `mq3.renderer.tr_sky.drawSkyBox`. |
| `fastSky` | `dynamic` | — | Input tested by `fastSky`. |
| `showSky` | `dynamic` | — | Input tested by `showSky`. |
| `table` | `dynamic` | — | Value forwarded as `table` to `mq3.renderer.tr_sky.rBuildCloudData`. |
| `drawSun` | `dynamic` | — | Value forwarded as `drawSun` to `mq3.renderer.tr_sky.rbDrawSun`. |
| `sunDirection` | `dynamic` | — | Value forwarded as `direction` to `mq3.renderer.tr_sky.rbDrawSun`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L283)

<a id="function-function-mq3-renderer-tr-sky-rbuildclouddata-function-rbuildclouddata-shader-bounds-zfar-origin-table-src-mq3-renderer-tr-sky-ml-26407033"></a>
### rBuildCloudData

```ml
function rBuildCloudData(shader, bounds, zFar, origin, table)
```

Returns `mesh` from `mq3.renderer.tr_sky.rBuildCloudData`; earlier branches return `mesh`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — | Record providing `shader.cloudHeight`, `shader.stages`. |
| `bounds` | `dynamic` | — | Value forwarded as `bounds` to `mq3.renderer.tr_sky.fillCloudBox`. |
| `zFar` | `dynamic` | — | Value forwarded as `zFar` to `mq3.renderer.tr_sky.fillCloudBox`. |
| `origin` | `dynamic` | — | Value forwarded as `origin` to `mq3.renderer.tr_sky.fillCloudBox`. |
| `table` | `dynamic` | — | Value forwarded as `table` to `mq3.renderer.tr_sky.fillCloudBox`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L227)

<a id="function-function-mq3-renderer-tr-sky-rinitskytexcoords-function-rinitskytexcoords-heightcloud-src-mq3-renderer-tr-sky-ml-554269500"></a>
### rInitSkyTexCoords

```ml
function rInitSkyTexCoords(heightCloud)
```

Builds `mq3.renderer.tr_sky.CloudTable` after updating `coords[axis]`, `factors[axis]`, `coords[axis][t]`, `factors[axis][t]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `heightCloud` | `dynamic` | — | Cloud-shell height above the 4096-unit world sphere used to compute intersection coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L235)

<a id="constant-constant-mq3-renderer-tr-sky-sky-subdivisions-const-sky-subdivisions-8-src-mq3-renderer-tr-sky-ml-1485093627"></a>
### SKY_SUBDIVISIONS

```ml
const SKY_SUBDIVISIONS = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L22)

- [mq3.renderer.tr_sky.SkyShader](Type-mq3-renderer-tr-sky-skyshader-1590844103.md) — struct
- [mq3.renderer.tr_sky.SkySide](Type-mq3-renderer-tr-sky-skyside-570681949.md) — struct
- [mq3.renderer.tr_sky.SkyVertex](Type-mq3-renderer-tr-sky-skyvertex-1955074988.md) — struct
- [mq3.renderer.tr_sky.StageResult](Type-mq3-renderer-tr-sky-stageresult-1308726020.md) — struct
