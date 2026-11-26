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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L30)

<a id="function-function-mq3-renderer-tr-sky-absoluteindex-function-absoluteindex-value-src-mq3-renderer-tr-sky-ml-1459490731"></a>
### absoluteIndex

```ml
function absoluteIndex(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L31)

<a id="extern_function-extern-function-mq3-renderer-tr-sky-acos-extern-function-acos-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-renderer-tr-sky-ml-402378492"></a>
### acos

```ml
extern function acos(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L9)

<a id="function-function-mq3-renderer-tr-sky-addskypolygon-function-addskypolygon-bounds-vecs-src-mq3-renderer-tr-sky-ml-1836738620"></a>
### addSkyPolygon

```ml
function addSkyPolygon(bounds, vecs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — |  |
| `vecs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L35)

- [mq3.renderer.tr_sky.Bounds](Type-mq3-renderer-tr-sky-bounds-470777616.md) — struct
<a id="extern_function-extern-function-mq3-renderer-tr-sky-ceil-extern-function-ceil-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-renderer-tr-sky-ml-1503698102"></a>
### ceil

```ml
extern function ceil(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L11)

<a id="function-function-mq3-renderer-tr-sky-clearskybox-function-clearskybox-src-mq3-renderer-tr-sky-ml-1453012416"></a>
### clearSkyBox

```ml
function clearSkyBox()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L26)

<a id="function-function-mq3-renderer-tr-sky-clipskypolygon-function-clipskypolygon-bounds-vecs-stage-src-mq3-renderer-tr-sky-ml-1287058832"></a>
### clipSkyPolygon

```ml
function clipSkyPolygon(bounds, vecs, stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — |  |
| `vecs` | `dynamic` | — |  |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L54)

- [mq3.renderer.tr_sky.CloudTable](Type-mq3-renderer-tr-sky-cloudtable-2136303114.md) — struct
<a id="function-function-mq3-renderer-tr-sky-copy3-function-copy3-value-src-mq3-renderer-tr-sky-ml-1785229313"></a>
### copy3

```ml
function copy3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L32)

<a id="function-function-mq3-renderer-tr-sky-dot-function-dot-a-b-src-mq3-renderer-tr-sky-ml-830669627"></a>
### dot

```ml
function dot(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L33)

<a id="function-function-mq3-renderer-tr-sky-drawskybox-function-drawskybox-shader-bounds-zfar-src-mq3-renderer-tr-sky-ml-2054625809"></a>
### drawSkyBox

```ml
function drawSkyBox(shader, bounds, zFar)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |
| `bounds` | `dynamic` | — |  |
| `zFar` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L117)

<a id="function-function-mq3-renderer-tr-sky-drawskyside-function-drawskyside-image-axis-mins-maxs-zfar-src-mq3-renderer-tr-sky-ml-1784329749"></a>
### drawSkySide

```ml
function drawSkySide(image, axis, mins, maxs, zFar)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `zFar` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L110)

<a id="function-function-mq3-renderer-tr-sky-fillcloudbox-function-fillcloudbox-shader-bounds-zfar-origin-table-stage-mesh-src-mq3-renderer-tr-sky-ml-1754791264"></a>
### fillCloudBox

```ml
function fillCloudBox(shader, bounds, zFar, origin, table, stage, mesh)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |
| `bounds` | `dynamic` | — |  |
| `zFar` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `table` | `dynamic` | — |  |
| `stage` | `dynamic` | — |  |
| `mesh` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L137)

<a id="function-function-mq3-renderer-tr-sky-fillcloudyskyside-function-fillcloudyskyside-mesh-axis-mins-maxs-zfar-origin-table-addindexes-src-mq3-renderer-tr-sky-ml-1270721226"></a>
### fillCloudySkySide

```ml
function fillCloudySkySide(mesh, axis, mins, maxs, zFar, origin, table, addIndexes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mesh` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `zFar` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `table` | `dynamic` | — |  |
| `addIndexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L126)

<a id="extern_function-extern-function-mq3-renderer-tr-sky-floor-extern-function-floor-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-renderer-tr-sky-ml-1424871076"></a>
### floor

```ml
extern function floor(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L10)

<a id="constant-constant-mq3-renderer-tr-sky-half-sky-subdivisions-const-half-sky-subdivisions-4-src-mq3-renderer-tr-sky-ml-1237018045"></a>
### HALF_SKY_SUBDIVISIONS

```ml
const HALF_SKY_SUBDIVISIONS = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L14)

<a id="function-function-mq3-renderer-tr-sky-makeskyvec-function-makeskyvec-s-t-axis-zfar-skymin-skymax-src-mq3-renderer-tr-sky-ml-429113513"></a>
### makeSkyVec

```ml
function makeSkyVec(s, t, axis, zFar, skyMin, skyMax)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `s` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `zFar` | `dynamic` | — |  |
| `skyMin` | `dynamic` | — |  |
| `skyMax` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L90)

<a id="constant-constant-mq3-renderer-tr-sky-max-clip-verts-const-max-clip-verts-64-src-mq3-renderer-tr-sky-ml-1816867371"></a>
### MAX_CLIP_VERTS

```ml
const MAX_CLIP_VERTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L16)

- [mq3.renderer.tr_sky.Mesh](Type-mq3-renderer-tr-sky-mesh-151315812.md) — struct
<a id="constant-constant-mq3-renderer-tr-sky-on-epsilon-const-on-epsilon-0-1-src-mq3-renderer-tr-sky-ml-1238834828"></a>
### ON_EPSILON

```ml
const ON_EPSILON = 0.1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L15)

<a id="function-function-mq3-renderer-tr-sky-perpendicular-function-perpendicular-direction-src-mq3-renderer-tr-sky-ml-414884837"></a>
### perpendicular

```ml
function perpendicular(direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L170)

<a id="function-function-mq3-renderer-tr-sky-quantizedbounds-function-quantizedbounds-bounds-axis-mint-src-mq3-renderer-tr-sky-ml-612849022"></a>
### quantizedBounds

```ml
function quantizedBounds(bounds, axis, minT)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `minT` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L100)

<a id="function-function-mq3-renderer-tr-sky-rbclipskypolygons-function-rbclipskypolygons-points-indexes-vieworigin-src-mq3-renderer-tr-sky-ml-1696729654"></a>
### rbClipSkyPolygons

```ml
function rbClipSkyPolygons(points, indexes, viewOrigin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L78)

<a id="function-function-mq3-renderer-tr-sky-rbdrawsun-function-rbdrawsun-skyrendered-drawsun-zfar-direction-src-mq3-renderer-tr-sky-ml-1406378740"></a>
### rbDrawSun

```ml
function rbDrawSun(skyRendered, drawSun, zFar, direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `skyRendered` | `dynamic` | — |  |
| `drawSun` | `dynamic` | — |  |
| `zFar` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L175)

<a id="function-function-mq3-renderer-tr-sky-rbstageiteratorsky-function-rbstageiteratorsky-points-indexes-vieworigin-shader-zfar-fastsky-showsky-table-drawsun-sundirection-src-mq3-renderer-tr-sky-ml-517538792"></a>
### rbStageIteratorSky

```ml
function rbStageIteratorSky(points, indexes, viewOrigin, shader, zFar, fastSky, showSky, table, drawSun, sunDirection)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `zFar` | `dynamic` | — |  |
| `fastSky` | `dynamic` | — |  |
| `showSky` | `dynamic` | — |  |
| `table` | `dynamic` | — |  |
| `drawSun` | `dynamic` | — |  |
| `sunDirection` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L182)

<a id="function-function-mq3-renderer-tr-sky-rbuildclouddata-function-rbuildclouddata-shader-bounds-zfar-origin-table-src-mq3-renderer-tr-sky-ml-26407033"></a>
### rBuildCloudData

```ml
function rBuildCloudData(shader, bounds, zFar, origin, table)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |
| `bounds` | `dynamic` | — |  |
| `zFar` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `table` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L146)

<a id="function-function-mq3-renderer-tr-sky-rinitskytexcoords-function-rinitskytexcoords-heightcloud-src-mq3-renderer-tr-sky-ml-554269500"></a>
### rInitSkyTexCoords

```ml
function rInitSkyTexCoords(heightCloud)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `heightCloud` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L152)

<a id="constant-constant-mq3-renderer-tr-sky-sky-subdivisions-const-sky-subdivisions-8-src-mq3-renderer-tr-sky-ml-1485093627"></a>
### SKY_SUBDIVISIONS

```ml
const SKY_SUBDIVISIONS = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_sky.ml#L13)

- [mq3.renderer.tr_sky.SkyShader](Type-mq3-renderer-tr-sky-skyshader-1590844103.md) — struct
- [mq3.renderer.tr_sky.SkySide](Type-mq3-renderer-tr-sky-skyside-570681949.md) — struct
- [mq3.renderer.tr_sky.SkyVertex](Type-mq3-renderer-tr-sky-skyvertex-1955074988.md) — struct
- [mq3.renderer.tr_sky.StageResult](Type-mq3-renderer-tr-sky-stageresult-1308726020.md) — struct
