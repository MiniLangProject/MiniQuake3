# `src/mq3/renderer/mark_fragments.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.mark_fragments`](Package-mq3-renderer-mark-fragments-1834921162.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/bsp_render_data.ml` as `renderData` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/ds/set.ml` as `sets` → `../MiniLangCompilerML/std/ds/set.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-mark-fragments-candidatefaces-function-candidatefaces-map-world-mins-maxs-direction-cache-src-mq3-renderer-mark-fragments-ml-2087073193"></a>
### candidateFaces

```ml
function candidateFaces(map, world, mins, maxs, direction, cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `world` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L204)

<a id="function-function-mq3-renderer-mark-fragments-clipplane-function-clipplane-points-plane-src-mq3-renderer-mark-fragments-ml-1669374251"></a>
### clipPlane

```ml
function clipPlane(points, plane)
```

R_ChopPolyBehindPlane keeps front/on points and uses a 0.5 unit epsilon.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |
| `plane` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L146)

<a id="function-function-mq3-renderer-mark-fragments-cliptriangle-function-cliptriangle-vertices-planes-src-mq3-renderer-mark-fragments-ml-408955316"></a>
### clipTriangle

```ml
function clipTriangle(vertices, planes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertices` | `dynamic` | — |  |
| `planes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L169)

<a id="constant-constant-mq3-renderer-mark-fragments-contents-fog-const-contents-fog-64-src-mq3-renderer-mark-fragments-ml-735915775"></a>
### CONTENTS_FOG

```ml
const CONTENTS_FOG = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L19)

<a id="function-function-mq3-renderer-mark-fragments-dot-function-dot-a-b-src-mq3-renderer-mark-fragments-ml-195844801"></a>
### dot

```ml
function dot(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L105)

<a id="function-function-mq3-renderer-mark-fragments-eligibleface-function-eligibleface-map-faceindex-direction-mins-maxs-src-mq3-renderer-mark-fragments-ml-676192736"></a>
### eligibleFace

```ml
function eligibleFace(map, faceIndex, direction, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `faceIndex` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L187)

<a id="constant-constant-mq3-renderer-mark-fragments-face-stride-const-face-stride-104-src-mq3-renderer-mark-fragments-ml-1524828296"></a>
### FACE_STRIDE

```ml
const FACE_STRIDE = 104
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L20)

- [mq3.renderer.mark_fragments.FaceBatch](Type-mq3-renderer-mark-fragments-facebatch-1150879571.md) — struct
<a id="function-function-mq3-renderer-mark-fragments-facefloat-function-facefloat-map-faceindex-relative-src-mq3-renderer-mark-fragments-ml-211819031"></a>
### faceFloat

```ml
function faceFloat(map, faceIndex, relative)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `faceIndex` | `dynamic` | — |  |
| `relative` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L111)

<a id="function-function-mq3-renderer-mark-fragments-facevalue-function-facevalue-map-faceindex-relative-src-mq3-renderer-mark-fragments-ml-1286569481"></a>
### faceValue

```ml
function faceValue(map, faceIndex, relative)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `faceIndex` | `dynamic` | — |  |
| `relative` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L110)

<a id="function-function-mq3-renderer-mark-fragments-fail-function-fail-message-src-mq3-renderer-mark-fragments-ml-621826379"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L104)

- [mq3.renderer.mark_fragments.Fragment](Type-mq3-renderer-mark-fragments-fragment-826987100.md) — struct
<a id="function-function-mq3-renderer-mark-fragments-geometrycache-function-geometrycache-src-mq3-renderer-mark-fragments-ml-2071727500"></a>
### geometryCache

```ml
function geometryCache()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L29)

- [mq3.renderer.mark_fragments.GeometryCache](Type-mq3-renderer-mark-fragments-geometrycache-256064278.md) — struct
<a id="function-function-mq3-renderer-mark-fragments-marktriangles-function-marktriangles-map-faces-cache-src-mq3-renderer-mark-fragments-ml-1446378902"></a>
### markTriangles

```ml
function markTriangles(map, faces, cache)
```

A moving impact can hit the same ordered set of static faces with different clip planes. Keep only small batches. Projection bounds, clipping and output limits are still evaluated for each impact.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `faces` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L34)

<a id="constant-constant-mq3-renderer-mark-fragments-max-cached-face-triangles-const-max-cached-face-triangles-16384-src-mq3-renderer-mark-fragments-ml-747506333"></a>
### MAX_CACHED_FACE_TRIANGLES

```ml
const MAX_CACHED_FACE_TRIANGLES = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L15)

<a id="constant-constant-mq3-renderer-mark-fragments-max-cached-mark-triangles-const-max-cached-mark-triangles-4096-src-mq3-renderer-mark-fragments-ml-1328678024"></a>
### MAX_CACHED_MARK_TRIANGLES

```ml
const MAX_CACHED_MARK_TRIANGLES = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L14)

<a id="constant-constant-mq3-renderer-mark-fragments-max-mark-surfaces-const-max-mark-surfaces-64-src-mq3-renderer-mark-fragments-ml-1489522323"></a>
### MAX_MARK_SURFACES

```ml
const MAX_MARK_SURFACES = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L13)

<a id="constant-constant-mq3-renderer-mark-fragments-max-verts-on-poly-const-max-verts-on-poly-64-src-mq3-renderer-mark-fragments-ml-432563015"></a>
### MAX_VERTS_ON_POLY

```ml
const MAX_VERTS_ON_POLY = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L12)

<a id="constant-constant-mq3-renderer-mark-fragments-min-face-cache-triangles-const-min-face-cache-triangles-768-src-mq3-renderer-mark-fragments-ml-242591396"></a>
### MIN_FACE_CACHE_TRIANGLES

```ml
const MIN_FACE_CACHE_TRIANGLES = 768
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L16)

<a id="function-function-mq3-renderer-mark-fragments-normalize-function-normalize-value-src-mq3-renderer-mark-fragments-ml-1380230127"></a>
### normalize

```ml
function normalize(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L106)

- [mq3.renderer.mark_fragments.Plane](Type-mq3-renderer-mark-fragments-plane-1548008174.md) — struct
<a id="function-function-mq3-renderer-mark-fragments-project-function-project-map-world-sourcepoints-projection-maxpoints-maxfragments-src-mq3-renderer-mark-fragments-ml-1113630363"></a>
### project

```ml
function project(map, world, sourcePoints, projection, maxPoints, maxFragments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `world` | `dynamic` | — |  |
| `sourcePoints` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `maxPoints` | `dynamic` | — |  |
| `maxFragments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L235)

<a id="function-function-mq3-renderer-mark-fragments-projectionbounds-function-projectionbounds-points-projection-direction-src-mq3-renderer-mark-fragments-ml-2064698943"></a>
### projectionBounds

```ml
function projectionBounds(points, projection, direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L114)

<a id="function-function-mq3-renderer-mark-fragments-projectionplanes-function-projectionplanes-points-projection-src-mq3-renderer-mark-fragments-ml-271653410"></a>
### projectionPlanes

```ml
function projectionPlanes(points, projection)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L127)

<a id="function-function-mq3-renderer-mark-fragments-projectwithcache-function-projectwithcache-map-world-sourcepoints-projection-maxpoints-maxfragments-cache-src-mq3-renderer-mark-fragments-ml-1962546917"></a>
### projectWithCache

```ml
function projectWithCache(map, world, sourcePoints, projection, maxPoints, maxFragments, cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `world` | `dynamic` | — |  |
| `sourcePoints` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `maxPoints` | `dynamic` | — |  |
| `maxFragments` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L238)

- [mq3.renderer.mark_fragments.Result](Type-mq3-renderer-mark-fragments-result-420395893.md) — struct
<a id="constant-constant-mq3-renderer-mark-fragments-shader-stride-const-shader-stride-72-src-mq3-renderer-mark-fragments-ml-2143648010"></a>
### SHADER_STRIDE

```ml
const SHADER_STRIDE = 72
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L21)

<a id="function-function-mq3-renderer-mark-fragments-shadervalue-function-shadervalue-map-shaderindex-relative-src-mq3-renderer-mark-fragments-ml-1729356617"></a>
### shaderValue

```ml
function shaderValue(map, shaderIndex, relative)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `shaderIndex` | `dynamic` | — |  |
| `relative` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L112)

<a id="constant-constant-mq3-renderer-mark-fragments-surf-noimpact-const-surf-noimpact-16-src-mq3-renderer-mark-fragments-ml-155536980"></a>
### SURF_NOIMPACT

```ml
const SURF_NOIMPACT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L17)

<a id="constant-constant-mq3-renderer-mark-fragments-surf-nomarks-const-surf-nomarks-32-src-mq3-renderer-mark-fragments-ml-1121708804"></a>
### SURF_NOMARKS

```ml
const SURF_NOMARKS = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L18)

<a id="function-function-mq3-renderer-mark-fragments-triangleboundsoverlap-function-triangleboundsoverlap-first-second-third-mins-maxs-src-mq3-renderer-mark-fragments-ml-1051958865"></a>
### triangleBoundsOverlap

```ml
function triangleBoundsOverlap(first, second, third, mins, maxs)
```

The clipper rejects most triangles of a repeated combat face list before any polygon work, so the prism test reads the three positions directly instead of materializing the vertex array the clipper needs afterwards.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |
| `third` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L178)
