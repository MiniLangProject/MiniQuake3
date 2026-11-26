# `src/mq3/renderer/portal_clip.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.portal_clip`](Package-mq3-renderer-portal-clip-1271782770.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/bsp_render_data.ml` as `renderData` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `mq3/renderer/qvm_scene_geometry.ml` as `sceneGeometry` → [src/mq3/renderer/qvm_scene_geometry.ml](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-portal-clip-clippedscenevertex-function-clippedscenevertex-a-b-da-db-src-mq3-renderer-portal-clip-ml-2016596036"></a>
### clippedSceneVertex

```ml
function clippedSceneVertex(a, b, da, db)
```

Builds `mq3.renderer.portal_clip.SceneVertex` using `mq3.shared.math.VectorNormalize`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record providing `a.normal`, `a.position`, `a.texCoord`, `a.lightmapCoord`, `a.color`, `a.entityColor`. |
| `b` | `dynamic` | — | Record providing `b.normal`, `b.position`, `b.texCoord`, `b.lightmapCoord`, `b.color`, `b.entityColor`. |
| `da` | `dynamic` | — | Input used by `t=da/(da-db)`. |
| `db` | `dynamic` | — | Input used by `t=da/(da-db)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L130)

<a id="function-function-mq3-renderer-portal-clip-clippedvertex-function-clippedvertex-a-b-da-db-src-mq3-renderer-portal-clip-ml-1304551482"></a>
### clippedVertex

```ml
function clippedVertex(a, b, da, db)
```

Interpolates a plane-crossing render vertex, renormalizing its normal and preserving shader/entity attributes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record providing `a.normal`, `a.position`, `a.baseUV`, `a.lightmapUV`, `a.color`, `a.entityColor`. |
| `b` | `dynamic` | — | Record providing `b.normal`, `b.position`, `b.baseUV`, `b.lightmapUV`, `b.color`, `b.entityColor`. |
| `da` | `dynamic` | — | Input used by `t=da/(da-db)`. |
| `db` | `dynamic` | — | Input used by `t=da/(da-db)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L39)

<a id="function-function-mq3-renderer-portal-clip-cliprenderdata-function-cliprenderdata-source-normal-dist-src-mq3-renderer-portal-clip-ml-554050480"></a>
### clipRenderData

```ml
function clipRenderData(source, normal, dist)
```

Clips render triangles against a plane and rebuilds render-data counts while preserving source metadata.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record providing `source.triangles`, `source.surfaceCount`, `source.skippedSurfaceCount`, `source.truncated`, `source.patchSurfaceCount`. |
| `normal` | `dynamic` | — | Value forwarded as `normal` to `mq3.renderer.portal_clip.clipTriangles`. |
| `dist` | `dynamic` | — | Value forwarded as `dist` to `mq3.renderer.portal_clip.clipTriangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L76)

<a id="function-function-mq3-renderer-portal-clip-clipscene-function-clipscene-source-normal-dist-src-mq3-renderer-portal-clip-ml-801123408"></a>
### clipScene

```ml
function clipScene(source, normal, dist)
```

Clips scene triangles against a plane, interpolates crossing attributes, and invalidates stale vertex identities.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record providing `source.triangles`, `source.modelEntities`, `source.spriteEntities`, `source.polySurfaces`, `source.skippedInline`, `source.skippedUnsupported`. |
| `normal` | `dynamic` | — | Value forwarded as `normal` to `mq3.renderer.portal_clip.distance`. |
| `dist` | `dynamic` | — | Value forwarded as `dist` to `mq3.renderer.portal_clip.distance`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L153)

<a id="function-function-mq3-renderer-portal-clip-clipscenevertices-function-clipscenevertices-vertices-normal-dist-src-mq3-renderer-portal-clip-ml-692626376"></a>
### clipSceneVertices

```ml
function clipSceneVertices(vertices, normal, dist)
```

Builds `output[count]` in `mq3.renderer.portal_clip.clipSceneVertices`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertices` | `dynamic` | — | Indexed input read at `len(vertices)-1`. |
| `normal` | `dynamic` | — | Value forwarded as `normal` to `mq3.renderer.portal_clip.distance`. |
| `dist` | `dynamic` | — | Value forwarded as `dist` to `mq3.renderer.portal_clip.distance`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L135)

<a id="function-function-mq3-renderer-portal-clip-clipselection-function-clipselection-cache-chosen-normal-dist-src-mq3-renderer-portal-clip-ml-1857404443"></a>
### clipSelection

```ml
function clipSelection(cache, chosen, normal, dist)
```

Updates `cache.byFace`, `cache.normal`, `cache.dist`, `cache.byFace[face]` in `mq3.renderer.portal_clip.clipSelection`; returns `renderData.RenderData(triangles,chosen.selectedSurfaceCount,total,0,false,patches)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.byFace`, `cache.normal`, `cache.dist`, `cache.byFace[face]`. |
| `chosen` | `dynamic` | — | Record providing `chosen.faceIndexes`, `chosen.selectedSurfaceCount`. |
| `normal` | `dynamic` | — | Value forwarded as `normal` to `mq3.renderer.portal_clip.clipTriangles`. |
| `dist` | `dynamic` | — | Value assigned to `cache.dist`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L93)

<a id="function-function-mq3-renderer-portal-clip-cliptriangles-function-cliptriangles-input-normal-dist-src-mq3-renderer-portal-clip-ml-1216810685"></a>
### clipTriangles

```ml
function clipTriangles(input, normal, dist)
```

Computes `clipTriangles` from `triangles.toArray()` using `std.ds.list.List.withCapacity`, `mq3.renderer.portal_clip.clipVertices`, `triangles.add`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Sequence traversed as `triangle` while producing this result. |
| `normal` | `dynamic` | — | Value forwarded as `normal` to `mq3.renderer.portal_clip.clipVertices`. |
| `dist` | `dynamic` | — | Value forwarded as `dist` to `mq3.renderer.portal_clip.clipVertices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L62)

<a id="function-function-mq3-renderer-portal-clip-clipvertices-function-clipvertices-vertices-normal-dist-src-mq3-renderer-portal-clip-ml-2081665430"></a>
### clipVertices

```ml
function clipVertices(vertices, normal, dist)
```

Builds `output[count]` in `mq3.renderer.portal_clip.clipVertices`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertices` | `dynamic` | — | Indexed input read at `len(vertices)-1`. |
| `normal` | `dynamic` | — | Value forwarded as `normal` to `mq3.renderer.portal_clip.distance`. |
| `dist` | `dynamic` | — | Value forwarded as `dist` to `mq3.renderer.portal_clip.distance`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L47)

<a id="function-function-mq3-renderer-portal-clip-createfacecache-function-createfacecache-world-src-mq3-renderer-portal-clip-ml-2002062328"></a>
### createFaceCache

```ml
function createFaceCache(world)
```

Constructs `mq3.renderer.portal_clip.FaceCache` with `normal` = `void`, `dist` = `0.0`, `byFace` = `void` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Initial value for `mq3.renderer.portal_clip.FaceCache.world`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L87)

<a id="function-function-mq3-renderer-portal-clip-distance-function-distance-point-normal-dist-src-mq3-renderer-portal-clip-ml-1873566945"></a>
### distance

```ml
function distance(point, normal, dist)
```

Computes `qmath.DotProduct(point,normal)-dist` for `mq3.renderer.portal_clip.distance`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Argument 1 supplied to `mq3.shared.math.DotProduct`. |
| `normal` | `dynamic` | — | Argument 2 supplied to `mq3.shared.math.DotProduct`. |
| `dist` | `dynamic` | — | Input used in the result expression `qmath.DotProduct(point,normal)-dist`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L18)

- [mq3.renderer.portal_clip.FaceCache](Type-mq3-renderer-portal-clip-facecache-1243117029.md) — struct
<a id="function-function-mq3-renderer-portal-clip-fail-function-fail-message-src-mq3-renderer-portal-clip-ml-1364799831"></a>
### fail

```ml
function fail(message)
```

Creates error `7703` with message `"portal clip: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7703,"portal clip: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L13)

<a id="function-function-mq3-renderer-portal-clip-lerp2-function-lerp2-a-b-t-src-mq3-renderer-portal-clip-ml-463212875"></a>
### lerp2

```ml
function lerp2(a, b, t)
```

Returns `[a[0]+(b[0]-a[0])*t,a[1]+(b[1]-a[1])*t]` for `mq3.renderer.portal_clip.lerp2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `b` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `t` | `dynamic` | — | Input used in the result expression `[a[0]+(b[0]-a[0])*t,a[1]+(b[1]-a[1])*t]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L28)

<a id="function-function-mq3-renderer-portal-clip-lerp3-function-lerp3-a-b-t-src-mq3-renderer-portal-clip-ml-517344061"></a>
### lerp3

```ml
function lerp3(a, b, t)
```

Returns `[a[0]+(b[0]-a[0])*t,a[1]+(b[1]-a[1])*t,a[2]+(b[2]-a[2])*t]` for `mq3.renderer.portal_clip.lerp3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `b` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `t` | `dynamic` | — | Input used in the result expression `[a[0]+(b[0]-a[0])*t,a[1]+(b[1]-a[1])*t,a[2]+(b[2]-a[2])*t]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L23)

<a id="function-function-mq3-renderer-portal-clip-lerpcolor-function-lerpcolor-a-b-t-src-mq3-renderer-portal-clip-ml-1089999689"></a>
### lerpColor

```ml
function lerpColor(a, b, t)
```

Builds the 4-element result for `mq3.renderer.portal_clip.lerpColor` from `numeric.trunc32(a[0]+(b[0]-a[0])*t)`, `numeric.trunc32(a[1]+(b[1]-a[1])*t)`, `numeric.trunc32(a[2]+(b[2]-a[2])*t)`, `numeric.trunc32(a[3]+(b[3]-a[3])*t)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `b` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `t` | `dynamic` | — | Input used in the result expression `[numeric.trunc32(a[0]+(b[0]-a[0])*t),numeric.trunc32(a[1]+(b[1]-a[1])*t),numeric.trunc32(a[2]+(b[2]-a[2])*t),numeric.trunc32(a[3]+(b[3]-a[3])*t)]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L33)

<a id="function-function-mq3-renderer-portal-clip-scenetriangle-function-scenetriangle-source-a-b-c-src-mq3-renderer-portal-clip-ml-48418331"></a>
### sceneTriangle

```ml
function sceneTriangle(source, a, b, c)
```

Forwards `sceneTriangle` to `mq3.renderer.qvm_scene_geometry.Triangle` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record providing `source.entityColor`, `source.entityTexCoord`, `source.shaderTime`, `source.modelHandle`, `source.customSkin`, `source.shaderHandle`. |
| `a` | `dynamic` | — | Record providing `a.position`, `a.texCoord`, `a.normal`, `a.color`, `a.lightmapCoord`. |
| `b` | `dynamic` | — | Record providing `b.position`, `b.texCoord`, `b.normal`, `b.color`, `b.lightmapCoord`. |
| `c` | `dynamic` | — | Record providing `c.position`, `c.texCoord`, `c.normal`, `c.color`, `c.lightmapCoord`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L146)

<a id="function-function-mq3-renderer-portal-clip-scenevertex-function-scenevertex-triangle-corner-src-mq3-renderer-portal-clip-ml-1081874421"></a>
### sceneVertex

```ml
function sceneVertex(triangle, corner)
```

Constructs `mq3.renderer.portal_clip.SceneVertex` with `position` = `triangle.positions[corner]`, `texCoord` = `triangle.texCoords[corner]`, `lightmapCoord` = `triangle.lightmapCoords[corner]`, `normal` = `triangle.normals[corner]` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — | Record providing `triangle.positions`, `triangle.texCoords`, `triangle.lightmapCoords`, `triangle.normals`, `triangle.colors`, `triangle.entityColor`. |
| `corner` | `dynamic` | — | Vertex index used consistently across the triangle position/UV/normal/color arrays. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/portal_clip.ml#L124)

- [mq3.renderer.portal_clip.SceneVertex](Type-mq3-renderer-portal-clip-scenevertex-2075721610.md) — struct
