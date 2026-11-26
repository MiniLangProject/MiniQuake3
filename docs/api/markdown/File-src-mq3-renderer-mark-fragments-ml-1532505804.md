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

Updates `cache.faceVisits`, `cache.faceSerial`, `cache.faceMap`, `cache.faceDataPointer`, `cache.faceVisits[faceIndex]` in `mq3.renderer.mark_fragments.candidateFaces`; returns `result.toArray()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`, `map.counts`. |
| `world` | `dynamic` | — | Record providing `world.leaves`. |
| `mins` | `dynamic` | — | Argument 2 supplied to `mq3.collision.world.enumerateLeaves`. |
| `maxs` | `dynamic` | — | Argument 3 supplied to `mq3.collision.world.enumerateLeaves`. |
| `direction` | `dynamic` | — | Value forwarded as `direction` to `mq3.renderer.mark_fragments.eligibleFace`. |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.faceVisits`, `cache.faceSerial`, `cache.faceMap`, `cache.faceDataPointer`, `cache.faceVisits[faceIndex]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L319)

<a id="function-function-mq3-renderer-mark-fragments-clipplane-function-clipplane-points-plane-src-mq3-renderer-mark-fragments-ml-1669374251"></a>
### clipPlane

```ml
function clipPlane(points, plane)
```

R_ChopPolyBehindPlane keeps front/on points and uses a 0.5 unit epsilon.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Indexed input read at `index`, `next`. |
| `plane` | `dynamic` | — | Record providing `plane.normal`, `plane.distance`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L240)

<a id="function-function-mq3-renderer-mark-fragments-cliptriangle-function-cliptriangle-vertices-planes-src-mq3-renderer-mark-fragments-ml-408955316"></a>
### clipTriangle

```ml
function clipTriangle(vertices, planes)
```

Returns `output` from `mq3.renderer.mark_fragments.clipTriangle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertices` | `dynamic` | — | Input used by `output=vertices`. |
| `planes` | `dynamic` | — | Sequence traversed as `plane` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L266)

<a id="constant-constant-mq3-renderer-mark-fragments-contents-fog-const-contents-fog-64-src-mq3-renderer-mark-fragments-ml-735915775"></a>
### CONTENTS_FOG

```ml
const CONTENTS_FOG = 64
```

Contents bit identifying a fog volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L27)

<a id="function-function-mq3-renderer-mark-fragments-dot-function-dot-a-b-src-mq3-renderer-mark-fragments-ml-195844801"></a>
### dot

```ml
function dot(a, b)
```

Computes `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `mq3.renderer.mark_fragments.dot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L176)

<a id="function-function-mq3-renderer-mark-fragments-eligibleface-function-eligibleface-map-faceindex-direction-mins-maxs-src-mq3-renderer-mark-fragments-ml-676192736"></a>
### eligibleFace

```ml
function eligibleFace(map, faceIndex, direction, mins, maxs)
```

Filters decal targets by supported BSP face kind, shader impact/mark flags, and contents.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.offsets`, `map.data`. |
| `faceIndex` | `dynamic` | — | Value forwarded as `faceIndex` to `mq3.renderer.mark_fragments.faceValue`. |
| `direction` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `mins` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `maxs` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L295)

<a id="constant-constant-mq3-renderer-mark-fragments-face-stride-const-face-stride-104-src-mq3-renderer-mark-fragments-ml-1524828296"></a>
### FACE_STRIDE

```ml
const FACE_STRIDE = 104
```

Byte stride of one face record in the BSP surface lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L29)

- [mq3.renderer.mark_fragments.FaceBatch](Type-mq3-renderer-mark-fragments-facebatch-1150879571.md) — struct
<a id="function-function-mq3-renderer-mark-fragments-facefloat-function-facefloat-map-faceindex-relative-src-mq3-renderer-mark-fragments-ml-211819031"></a>
### faceFloat

```ml
function faceFloat(map, faceIndex, relative)
```

Calls `mq3.compat.numeric.bitsFloat` with `(n.readU32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`, `map.offsets`. |
| `faceIndex` | `dynamic` | — | Input used in the result expression `n.bitsFloat(n.readU32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative))`. |
| `relative` | `dynamic` | — | Input used in the result expression `n.bitsFloat(n.readU32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L192)

<a id="function-function-mq3-renderer-mark-fragments-facevalue-function-facevalue-map-faceindex-relative-src-mq3-renderer-mark-fragments-ml-1286569481"></a>
### faceValue

```ml
function faceValue(map, faceIndex, relative)
```

Calls `mq3.compat.numeric.readI32` with `(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`, `map.offsets`. |
| `faceIndex` | `dynamic` | — | Input used in the result expression `n.readI32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative)`. |
| `relative` | `dynamic` | — | Input used in the result expression `n.readI32(map.data,map.offsets[13]+faceIndex*FACE_STRIDE+relative)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L187)

<a id="function-function-mq3-renderer-mark-fragments-fail-function-fail-message-src-mq3-renderer-mark-fragments-ml-621826379"></a>
### fail

```ml
function fail(message)
```

Creates error `7693` with message `"mark fragments: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7693,"mark fragments: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L172)

- [mq3.renderer.mark_fragments.Fragment](Type-mq3-renderer-mark-fragments-fragment-826987100.md) — struct
<a id="function-function-mq3-renderer-mark-fragments-geometrycache-function-geometrycache-src-mq3-renderer-mark-fragments-ml-2071727500"></a>
### geometryCache

```ml
function geometryCache()
```

Constructs `mq3.renderer.mark_fragments.GeometryCache` with `map` = `void`, `data` = `void`, `dataPointer` = `0`, `slots` = `array(32,void)` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L92)

- [mq3.renderer.mark_fragments.GeometryCache](Type-mq3-renderer-mark-fragments-geometrycache-256064278.md) — struct
<a id="function-function-mq3-renderer-mark-fragments-marktriangles-function-marktriangles-map-faces-cache-src-mq3-renderer-mark-fragments-ml-1446378902"></a>
### markTriangles

```ml
function markTriangles(map, faces, cache)
```

A moving impact can hit the same ordered set of static faces with different clip planes. Keep only small batches. Projection bounds, clipping and output limits are still evaluated for each impact.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`, `map.counts`. |
| `faces` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.bsp_render_data.extractRetainedWithPatchError`. |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.slots`, `cache.faceTriangles`, `cache.faceTriangleCount`, `cache.faceCacheEnabled`, `cache.map`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L100)

<a id="constant-constant-mq3-renderer-mark-fragments-max-cached-face-triangles-const-max-cached-face-triangles-16384-src-mq3-renderer-mark-fragments-ml-747506333"></a>
### MAX_CACHED_FACE_TRIANGLES

```ml
const MAX_CACHED_FACE_TRIANGLES = 16384
```

Maximum number of triangles retained in the per-face mark cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L19)

<a id="constant-constant-mq3-renderer-mark-fragments-max-cached-mark-triangles-const-max-cached-mark-triangles-4096-src-mq3-renderer-mark-fragments-ml-1328678024"></a>
### MAX_CACHED_MARK_TRIANGLES

```ml
const MAX_CACHED_MARK_TRIANGLES = 4096
```

Maximum number of triangles retained in the mark-projection geometry cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L17)

<a id="constant-constant-mq3-renderer-mark-fragments-max-mark-surfaces-const-max-mark-surfaces-64-src-mq3-renderer-mark-fragments-ml-1489522323"></a>
### MAX_MARK_SURFACES

```ml
const MAX_MARK_SURFACES = 64
```

Maximum number of candidate surfaces retained for one projected mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L15)

<a id="constant-constant-mq3-renderer-mark-fragments-max-verts-on-poly-const-max-verts-on-poly-64-src-mq3-renderer-mark-fragments-ml-432563015"></a>
### MAX_VERTS_ON_POLY

```ml
const MAX_VERTS_ON_POLY = 64
```

Maximum number of points accepted by the projected-polygon clipper.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L13)

<a id="constant-constant-mq3-renderer-mark-fragments-min-face-cache-triangles-const-min-face-cache-triangles-768-src-mq3-renderer-mark-fragments-ml-242591396"></a>
### MIN_FACE_CACHE_TRIANGLES

```ml
const MIN_FACE_CACHE_TRIANGLES = 768
```

Minimum triangle workload for which the per-face mark cache is worthwhile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L21)

<a id="function-function-mq3-renderer-mark-fragments-normalize-function-normalize-value-src-mq3-renderer-mark-fragments-ml-1380230127"></a>
### normalize

```ml
function normalize(value)
```

Returns `[value[0]/length,value[1]/length,value[2]/length]` from `mq3.renderer.mark_fragments.normalize`; earlier branches return `[0.0,0.0,0.0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value forwarded as `a` to `mq3.renderer.mark_fragments.dot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L179)

- [mq3.renderer.mark_fragments.Plane](Type-mq3-renderer-mark-fragments-plane-1548008174.md) — struct
<a id="function-function-mq3-renderer-mark-fragments-project-function-project-map-world-sourcepoints-projection-maxpoints-maxfragments-src-mq3-renderer-mark-fragments-ml-1113630363"></a>
### project

```ml
function project(map, world, sourcePoints, projection, maxPoints, maxFragments)
```

Calls `mq3.renderer.mark_fragments.projectWithCache` with `(map,world,sourcePoints,projection,maxPoints,maxFragments,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.mark_fragments.projectWithCache`. |
| `world` | `dynamic` | — | Value forwarded as `world` to `mq3.renderer.mark_fragments.projectWithCache`. |
| `sourcePoints` | `dynamic` | — | Value forwarded as `sourcePoints` to `mq3.renderer.mark_fragments.projectWithCache`. |
| `projection` | `dynamic` | — | Value forwarded as `projection` to `mq3.renderer.mark_fragments.projectWithCache`. |
| `maxPoints` | `dynamic` | — | Value forwarded as `maxPoints` to `mq3.renderer.mark_fragments.projectWithCache`. |
| `maxFragments` | `dynamic` | — | Value forwarded as `maxFragments` to `mq3.renderer.mark_fragments.projectWithCache`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L357)

<a id="function-function-mq3-renderer-mark-fragments-projectionbounds-function-projectionbounds-points-projection-direction-src-mq3-renderer-mark-fragments-ml-2064698943"></a>
### projectionBounds

```ml
function projectionBounds(points, projection, direction)
```

Builds `mins[axis]`, `maxs[axis]` in `mq3.renderer.mark_fragments.projectionBounds`; returns `[mins,maxs]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Nested indexed data; outer entries read at `0`. |
| `projection` | `dynamic` | — | Indexed input read at `axis`. |
| `direction` | `dynamic` | — | Indexed input read at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L203)

<a id="function-function-mq3-renderer-mark-fragments-projectionplanes-function-projectionplanes-points-projection-src-mq3-renderer-mark-fragments-ml-271653410"></a>
### projectionPlanes

```ml
function projectionPlanes(points, projection)
```

Builds `planes[index]`, `planes[len(points)]`, `planes[len(points)+1]` in `mq3.renderer.mark_fragments.projectionPlanes`; returns `planes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Indexed input read at `index`, `(index+1)%len(points)`, `0`. |
| `projection` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.mark_fragments.normalize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L219)

<a id="function-function-mq3-renderer-mark-fragments-projectwithcache-function-projectwithcache-map-world-sourcepoints-projection-maxpoints-maxfragments-cache-src-mq3-renderer-mark-fragments-ml-1962546917"></a>
### projectWithCache

```ml
function projectWithCache(map, world, sourcePoints, projection, maxPoints, maxFragments, cache)
```

Builds `mq3.renderer.mark_fragments.Result` using `fragments.add`, `outputPoints.add`, `outputPoints.toArray`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.mark_fragments.candidateFaces`. |
| `world` | `dynamic` | — | Value forwarded as `world` to `mq3.renderer.mark_fragments.candidateFaces`. |
| `sourcePoints` | `dynamic` | — | Value forwarded as `points` to `mq3.renderer.mark_fragments.projectionBounds`. |
| `projection` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.mark_fragments.normalize`. |
| `maxPoints` | `dynamic` | — | Input tested by `maxPoints<0 or maxFragments<0 or maxPoints>131072 or maxFragments>131072`. |
| `maxFragments` | `dynamic` | — | Input tested by `maxPoints<0 or maxFragments<0 or maxPoints>131072 or maxFragments>131072`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.mark_fragments.candidateFaces`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L368)

- [mq3.renderer.mark_fragments.Result](Type-mq3-renderer-mark-fragments-result-420395893.md) — struct
<a id="constant-constant-mq3-renderer-mark-fragments-shader-stride-const-shader-stride-72-src-mq3-renderer-mark-fragments-ml-2143648010"></a>
### SHADER_STRIDE

```ml
const SHADER_STRIDE = 72
```

Byte stride of one shader record in the BSP shader lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L31)

<a id="function-function-mq3-renderer-mark-fragments-shadervalue-function-shadervalue-map-shaderindex-relative-src-mq3-renderer-mark-fragments-ml-1729356617"></a>
### shaderValue

```ml
function shaderValue(map, shaderIndex, relative)
```

Calls `mq3.compat.numeric.readI32` with `(map.data,map.offsets[1]+shaderIndex*SHADER_STRIDE+relative)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`, `map.offsets`. |
| `shaderIndex` | `dynamic` | — | Input used in the result expression `n.readI32(map.data,map.offsets[1]+shaderIndex*SHADER_STRIDE+relative)`. |
| `relative` | `dynamic` | — | Input used in the result expression `n.readI32(map.data,map.offsets[1]+shaderIndex*SHADER_STRIDE+relative)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L197)

<a id="constant-constant-mq3-renderer-mark-fragments-surf-noimpact-const-surf-noimpact-16-src-mq3-renderer-mark-fragments-ml-155536980"></a>
### SURF_NOIMPACT

```ml
const SURF_NOIMPACT = 16
```

Surface flag suppressing impact effects on the material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L23)

<a id="constant-constant-mq3-renderer-mark-fragments-surf-nomarks-const-surf-nomarks-32-src-mq3-renderer-mark-fragments-ml-1121708804"></a>
### SURF_NOMARKS

```ml
const SURF_NOMARKS = 32
```

Surface flag suppressing persistent impact marks on the material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L25)

<a id="function-function-mq3-renderer-mark-fragments-triangleboundsoverlap-function-triangleboundsoverlap-first-second-third-mins-maxs-src-mq3-renderer-mark-fragments-ml-1051958865"></a>
### triangleBoundsOverlap

```ml
function triangleBoundsOverlap(first, second, third, mins, maxs)
```

The clipper rejects most triangles of a repeated combat face list before any polygon work, so the prism test reads the three positions directly instead of materializing the vertex array the clipper needs afterwards.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Indexed input read at `axis`. |
| `second` | `dynamic` | — | Indexed input read at `axis`. |
| `third` | `dynamic` | — | Indexed input read at `axis`. |
| `mins` | `dynamic` | — | Indexed input read at `axis`. |
| `maxs` | `dynamic` | — | Indexed input read at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/mark_fragments.ml#L280)
