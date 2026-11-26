# `src/mq3/renderer/tr_surface_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_surface_runtime`](Package-mq3-renderer-tr-surface-runtime-1294434700.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/surface_beam.ml` as `beam` → [src/mq3/renderer/surface_beam.ml](File-src-mq3-renderer-surface-beam-ml-141570028.md)
- `mq3/renderer/surface_entities.ml` as `entities` → [src/mq3/renderer/surface_entities.ml](File-src-mq3-renderer-surface-entities-ml-629652876.md)
- `mq3/renderer/surface_grid.ml` as `grid` → [src/mq3/renderer/surface_grid.ml](File-src-mq3-renderer-surface-grid-ml-668182529.md)
- `mq3/renderer/surface_md3.ml` as `md3` → [src/mq3/renderer/surface_md3.ml](File-src-mq3-renderer-surface-md3-ml-438987327.md)
- `mq3/renderer/surface_mesh.ml` as `mesh` → [src/mq3/renderer/surface_mesh.ml](File-src-mq3-renderer-surface-mesh-ml-873120018.md)
- `mq3/renderer/surface_polychain.ml` as `polychain` → [src/mq3/renderer/surface_polychain.ml](File-src-mq3-renderer-surface-polychain-ml-2005384852.md)
- `mq3/renderer/surface_trails.ml` as `trails` → [src/mq3/renderer/surface_trails.ml](File-src-mq3-renderer-surface-trails-ml-312199158.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

- [mq3.renderer.tr_surface_runtime.AxisLine](Type-mq3-renderer-tr-surface-runtime-axisline-902596977.md) — struct
- [mq3.renderer.tr_surface_runtime.AxisSurface](Type-mq3-renderer-tr-surface-runtime-axissurface-1168100086.md) — struct
- [mq3.renderer.tr_surface_runtime.DisplayListCall](Type-mq3-renderer-tr-surface-runtime-displaylistcall-1976749596.md) — struct
<a id="function-function-mq3-renderer-tr-surface-runtime-dorailcore-function-dorailcore-start-finish-up-lengthvalue-spanwidth-color-src-mq3-renderer-tr-surface-runtime-ml-986310780"></a>
### DoRailCore

```ml
function DoRailCore(start, finish, up, lengthValue, spanWidth, color)
```

Calls `mq3.renderer.surface_trails.railCoreRaw` with `(start,finish,up,lengthValue,spanWidth,color)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.surface_trails.railCoreRaw`. |
| `finish` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.surface_trails.railCoreRaw`. |
| `up` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.surface_trails.railCoreRaw`. |
| `lengthValue` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.surface_trails.railCoreRaw`. |
| `spanWidth` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.surface_trails.railCoreRaw`. |
| `color` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.surface_trails.railCoreRaw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L157)

<a id="function-function-mq3-renderer-tr-surface-runtime-doraildiscs-function-doraildiscs-numsegments-start-direction-right-up-spanwidth-color-src-mq3-renderer-tr-surface-runtime-ml-856726287"></a>
### DoRailDiscs

```ml
function DoRailDiscs(numSegments, start, direction, right, up, spanWidth, color)
```

Calls `mq3.renderer.surface_trails.railDiscs` with `(numSegments,start,direction,right,up,spanWidth,color)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numSegments` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.surface_trails.railDiscs`. |
| `start` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.surface_trails.railDiscs`. |
| `direction` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.surface_trails.railDiscs`. |
| `right` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.surface_trails.railDiscs`. |
| `up` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.surface_trails.railDiscs`. |
| `spanWidth` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.surface_trails.railDiscs`. |
| `color` | `dynamic` | — | Argument 7 supplied to `mq3.renderer.surface_trails.railDiscs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L166)

- [mq3.renderer.tr_surface_runtime.EntityInput](Type-mq3-renderer-tr-surface-runtime-entityinput-1793166827.md) — struct
<a id="function-function-mq3-renderer-tr-surface-runtime-fail-function-fail-text-src-mq3-renderer-tr-surface-runtime-ml-546563735"></a>
### fail

```ml
function fail(text)
```

Creates error `7780` with message `"tr_surface: "+text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Input used in the result expression `error(7780,"tr_surface: "+text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L77)

<a id="function-function-mq3-renderer-tr-surface-runtime-lerpmeshvertexes-function-lerpmeshvertexes-surface-frame-oldframe-backlerp-src-mq3-renderer-tr-surface-runtime-ml-1173653232"></a>
### LerpMeshVertexes

```ml
function LerpMeshVertexes(surface, frame, oldFrame, backlerp)
```

Calls `mq3.renderer.surface_md3.lerpVertexes` with `(surface,frame,oldFrame,backlerp)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.surface_md3.lerpVertexes`. |
| `frame` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.surface_md3.lerpVertexes`. |
| `oldFrame` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.surface_md3.lerpVertexes`. |
| `backlerp` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.surface_md3.lerpVertexes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L200)

<a id="function-function-mq3-renderer-tr-surface-runtime-loderrorforvolume-function-loderrorforvolume-local-radius-lodcurveerror-entityorigin-entityaxis-vieworigin-viewforward-src-mq3-renderer-tr-surface-runtime-ml-1812568435"></a>
### LodErrorForVolume

```ml
function LodErrorForVolume(local, radius, lodCurveError, entityOrigin, entityAxis, viewOrigin, viewForward)
```

Exact LodErrorForVolume transform and clamp.  axis rows are the entity's local basis and viewForward is viewParms.or.axis[0].

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.tr_surface_runtime.valid3`. |
| `radius` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.fsub`. |
| `lodCurveError` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fdiv`. |
| `entityOrigin` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.tr_surface_runtime.valid3`. |
| `entityAxis` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.tr_surface_runtime.validAxis`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.tr_surface_runtime.valid3`. |
| `viewForward` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.tr_surface_runtime.valid3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L236)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-addquadstamp-function-rb-addquadstamp-origin-left-up-color-viewforward-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-tr-surface-runtime-ml-104506631"></a>
### RB_AddQuadStamp

```ml
function RB_AddQuadStamp(origin, left, up, color, viewForward, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

Calls `mq3.renderer.surface_entities.addQuadStamp` with `(origin,left,up,color,viewForward,currentVertexes,currentIndexes,maxVertexes,maxIndexes)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.surface_entities.addQuadStamp`. |
| `left` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.surface_entities.addQuadStamp`. |
| `up` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.surface_entities.addQuadStamp`. |
| `color` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.surface_entities.addQuadStamp`. |
| `viewForward` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.surface_entities.addQuadStamp`. |
| `currentVertexes` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.surface_entities.addQuadStamp`. |
| `currentIndexes` | `dynamic` | — | Argument 7 supplied to `mq3.renderer.surface_entities.addQuadStamp`. |
| `maxVertexes` | `dynamic` | — | Argument 8 supplied to `mq3.renderer.surface_entities.addQuadStamp`. |
| `maxIndexes` | `dynamic` | — | Argument 9 supplied to `mq3.renderer.surface_entities.addQuadStamp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L117)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-addquadstampext-function-rb-addquadstampext-origin-left-up-color-viewforward-s1-t1-s2-t2-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-tr-surface-runtime-ml-1475033327"></a>
### RB_AddQuadStampExt

```ml
function RB_AddQuadStampExt(origin, left, up, color, viewForward, s1, t1, s2, t2, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

Calls `mq3.renderer.surface_entities.addQuadStampExt` with `(origin,left,up,color,viewForward,s1,t1,s2,t2,currentVertexes,currentIndexes,maxVertexes,maxIndexes)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `left` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `up` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `color` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `viewForward` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `s1` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `t1` | `dynamic` | — | Argument 7 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `s2` | `dynamic` | — | Argument 8 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `t2` | `dynamic` | — | Argument 9 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `currentVertexes` | `dynamic` | — | Argument 10 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `currentIndexes` | `dynamic` | — | Argument 11 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `maxVertexes` | `dynamic` | — | Argument 12 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |
| `maxIndexes` | `dynamic` | — | Argument 13 supplied to `mq3.renderer.surface_entities.addQuadStampExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L104)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-checkoverflow-function-rb-checkoverflow-buffer-vertexes-indexes-src-mq3-renderer-tr-surface-runtime-ml-858613316"></a>
### RB_CheckOverflow

```ml
function RB_CheckOverflow(buffer, vertexes, indexes)
```

Calls `mq3.renderer.surface_polychain.checkOverflow` with `(buffer,vertexes,indexes)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.surface_polychain.checkOverflow`. |
| `vertexes` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.surface_polychain.checkOverflow`. |
| `indexes` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.surface_polychain.checkOverflow`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L89)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfaceaxis-function-rb-surfaceaxis-src-mq3-renderer-tr-surface-runtime-ml-824448928"></a>
### RB_SurfaceAxis

```ml
function RB_SurfaceAxis()
```

Original null-model diagnostic geometry: three 16-unit colored axes.  It is exposed only for RT_MODEL fallback diagnostics and never substitutes a BSP, MD3 or generated entity surface in the productive renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L269)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacebad-function-rb-surfacebad-surface-src-mq3-renderer-tr-surface-runtime-ml-828023445"></a>
### RB_SurfaceBad

```ml
function RB_SurfaceBad(surface)
```

Calls `mq3.renderer.tr_surface_runtime.fail` with `("bad surface tessellated")` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L294)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacebeam-function-rb-surfacebeam-entity-src-mq3-renderer-tr-surface-runtime-ml-1302221475"></a>
### RB_SurfaceBeam

```ml
function RB_SurfaceBeam(entity)
```

Returns `beam.build(entity.origin,entity.oldOrigin)` from `mq3.renderer.tr_surface_runtime.RB_SurfaceBeam`; earlier branches return `fail("missing beam entity")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Record providing `entity.origin`, `entity.oldOrigin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L149)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacedisplaylist-function-rb-surfacedisplaylist-surface-src-mq3-renderer-tr-surface-runtime-ml-1637238675"></a>
### RB_SurfaceDisplayList

```ml
function RB_SurfaceDisplayList(surface)
```

Display lists are a real legacy backend command, retained as a typed command so a GL backend can issue qglCallList after RB_BeginSurface state setup.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Record providing `surface.listNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L303)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfaceentity-function-rb-surfaceentity-entity-view-currentvertexes-currentindexes-maxvertexes-maxindexes-railsegmentlength-railwidth-railcorewidth-src-mq3-renderer-tr-surface-runtime-ml-1649729136"></a>
### RB_SurfaceEntity

```ml
function RB_SurfaceEntity(entity, view, currentVertexes, currentIndexes, maxVertexes, maxIndexes, railSegmentLength, railWidth, railCoreWidth)
```

Complete procedural entity dispatch from RB_SurfaceEntity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Record providing `entity.reType`. |
| `view` | `dynamic` | — | Value forwarded as `view` to `mq3.renderer.tr_surface_runtime.RB_SurfaceSprite`. |
| `currentVertexes` | `dynamic` | — | Value forwarded as `currentVertexes` to `mq3.renderer.tr_surface_runtime.RB_SurfaceSprite`. |
| `currentIndexes` | `dynamic` | — | Value forwarded as `currentIndexes` to `mq3.renderer.tr_surface_runtime.RB_SurfaceSprite`. |
| `maxVertexes` | `dynamic` | — | Value forwarded as `maxVertexes` to `mq3.renderer.tr_surface_runtime.RB_SurfaceSprite`. |
| `maxIndexes` | `dynamic` | — | Value forwarded as `maxIndexes` to `mq3.renderer.tr_surface_runtime.RB_SurfaceSprite`. |
| `railSegmentLength` | `dynamic` | — | Value forwarded as `segmentLength` to `mq3.renderer.tr_surface_runtime.RB_SurfaceRailRings`. |
| `railWidth` | `dynamic` | — | Value forwarded as `spanWidth` to `mq3.renderer.tr_surface_runtime.RB_SurfaceRailRings`. |
| `railCoreWidth` | `dynamic` | — | Value forwarded as `spanWidth` to `mq3.renderer.tr_surface_runtime.RB_SurfaceRailCore`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L283)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfaceface-function-rb-surfaceface-surface-smpframe-needsnormal-currentvertexes-currentindexes-maxvertexes-maxindexes-currentdlightbits-src-mq3-renderer-tr-surface-runtime-ml-542460159"></a>
### RB_SurfaceFace

```ml
function RB_SurfaceFace(surface, smpFrame, needsNormal, currentVertexes, currentIndexes, maxVertexes, maxIndexes, currentDlightBits)
```

Calls `mq3.renderer.surface_mesh.submitFace` with `(surface,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.surface_mesh.submitFace`. |
| `smpFrame` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.surface_mesh.submitFace`. |
| `needsNormal` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.surface_mesh.submitFace`. |
| `currentVertexes` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.surface_mesh.submitFace`. |
| `currentIndexes` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.surface_mesh.submitFace`. |
| `maxVertexes` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.surface_mesh.submitFace`. |
| `maxIndexes` | `dynamic` | — | Argument 7 supplied to `mq3.renderer.surface_mesh.submitFace`. |
| `currentDlightBits` | `dynamic` | — | Argument 8 supplied to `mq3.renderer.surface_mesh.submitFace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L223)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfaceflare-function-rb-surfaceflare-surface-src-mq3-renderer-tr-surface-runtime-ml-1736206895"></a>
### RB_SurfaceFlare

```ml
function RB_SurfaceFlare(surface)
```

The active Baseq3 build intentionally makes flares a no-op in tr_surface.c; flare visibility/drawing is handled by the dedicated flare renderer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L299)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacegrid-function-rb-surfacegrid-surface-lodorigin-lodradius-lodcurveerror-entityorigin-entityaxis-vieworigin-viewforward-maxvertexes-maxindexes-needsnormal-dlightbits-src-mq3-renderer-tr-surface-runtime-ml-1413555919"></a>
### RB_SurfaceGrid

```ml
function RB_SurfaceGrid(surface, lodOrigin, lodRadius, lodCurveError, entityOrigin, entityAxis, viewOrigin, viewForward, maxVertexes, maxIndexes, needsNormal, dlightBits)
```

Computes `RB_SurfaceGrid` from `grid.submit(surface,value,maxVertexes,maxIndexes,needsNormal,dlightBits)` using `mq3.renderer.tr_surface_runtime.LodErrorForVolume`, `mq3.renderer.surface_grid.submit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.surface_grid.submit`. |
| `lodOrigin` | `dynamic` | — | Value forwarded as `local` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`. |
| `lodRadius` | `dynamic` | — | Value forwarded as `radius` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`. |
| `lodCurveError` | `dynamic` | — | Value forwarded as `lodCurveError` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`. |
| `entityOrigin` | `dynamic` | — | Value forwarded as `entityOrigin` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`. |
| `entityAxis` | `dynamic` | — | Value forwarded as `entityAxis` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `viewOrigin` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`. |
| `viewForward` | `dynamic` | — | Value forwarded as `viewForward` to `mq3.renderer.tr_surface_runtime.LodErrorForVolume`. |
| `maxVertexes` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.surface_grid.submit`. |
| `maxIndexes` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.surface_grid.submit`. |
| `needsNormal` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.surface_grid.submit`. |
| `dlightBits` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.surface_grid.submit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L261)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacelightningbolt-function-rb-surfacelightningbolt-entity-view-src-mq3-renderer-tr-surface-runtime-ml-238250176"></a>
### RB_SurfaceLightningBolt

```ml
function RB_SurfaceLightningBolt(entity, view)
```

Returns `trails.lightning(entity.origin,entity.oldOrigin,view.origin,entity.shaderRGBA)` from `mq3.renderer.tr_surface_runtime.RB_SurfaceLightningBolt`; earlier branches return `fail("missing lightning context")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Record providing `entity.origin`, `entity.oldOrigin`, `entity.shaderRGBA`. |
| `view` | `dynamic` | — | Record providing `view.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L180)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacemesh-function-rb-surfacemesh-surface-frame-oldframe-backlerp-currentvertexes-currentindexes-maxvertexes-maxindexes-dlightbits-src-mq3-renderer-tr-surface-runtime-ml-1193131730"></a>
### RB_SurfaceMesh

```ml
function RB_SurfaceMesh(surface, frame, oldFrame, backlerp, currentVertexes, currentIndexes, maxVertexes, maxIndexes, dlightBits)
```

Calls `mq3.renderer.surface_md3.submit` with `(surface,frame,oldFrame,backlerp,currentVertexes,currentIndexes,maxVertexes,maxIndexes,dlightBits)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.surface_md3.submit`. |
| `frame` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.surface_md3.submit`. |
| `oldFrame` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.surface_md3.submit`. |
| `backlerp` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.surface_md3.submit`. |
| `currentVertexes` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.surface_md3.submit`. |
| `currentIndexes` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.surface_md3.submit`. |
| `maxVertexes` | `dynamic` | — | Argument 7 supplied to `mq3.renderer.surface_md3.submit`. |
| `maxIndexes` | `dynamic` | — | Argument 8 supplied to `mq3.renderer.surface_md3.submit`. |
| `dlightBits` | `dynamic` | — | Argument 9 supplied to `mq3.renderer.surface_md3.submit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L211)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacepolychain-function-rb-surfacepolychain-buffer-vertices-src-mq3-renderer-tr-surface-runtime-ml-897663031"></a>
### RB_SurfacePolychain

```ml
function RB_SurfacePolychain(buffer, vertices)
```

Calls `mq3.renderer.surface_polychain.append` with `(buffer,vertices)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.surface_polychain.append`. |
| `vertices` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.surface_polychain.append`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L134)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacerailcore-function-rb-surfacerailcore-entity-view-spanwidth-src-mq3-renderer-tr-surface-runtime-ml-728085654"></a>
### RB_SurfaceRailCore

```ml
function RB_SurfaceRailCore(entity, view, spanWidth)
```

Returns `trails.railCore(entity.oldOrigin,entity.origin,view.origin,spanWidth,entity.shaderRGBA)` from `mq3.renderer.tr_surface_runtime.RB_SurfaceRailCore`; earlier branches return `fail("missing rail-core context")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Record providing `entity.oldOrigin`, `entity.origin`, `entity.shaderRGBA`. |
| `view` | `dynamic` | — | Record providing `view.origin`. |
| `spanWidth` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.surface_trails.railCore`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L176)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacerailrings-function-rb-surfacerailrings-entity-segmentlength-spanwidth-src-mq3-renderer-tr-surface-runtime-ml-1565011470"></a>
### RB_SurfaceRailRings

```ml
function RB_SurfaceRailRings(entity, segmentLength, spanWidth)
```

Returns `trails.railRings(entity.oldOrigin,entity.origin,segmentLength,spanWidth,entity.shaderRGBA)` from `mq3.renderer.tr_surface_runtime.RB_SurfaceRailRings`; earlier branches return `fail("missing rail-ring entity")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Record providing `entity.oldOrigin`, `entity.origin`, `entity.shaderRGBA`. |
| `segmentLength` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.surface_trails.railRings`. |
| `spanWidth` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.surface_trails.railRings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L171)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfaceskip-function-rb-surfaceskip-surface-src-mq3-renderer-tr-surface-runtime-ml-1179258531"></a>
### RB_SurfaceSkip

```ml
function RB_SurfaceSkip(surface)
```

Returns `void` for the `mq3.renderer.tr_surface_runtime.RB_SurfaceSkip` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L306)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacesprite-function-rb-surfacesprite-entity-view-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-tr-surface-runtime-ml-1778376832"></a>
### RB_SurfaceSprite

```ml
function RB_SurfaceSprite(entity, view, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

Builds a camera-facing sprite using the view axes, mirror state, entity color, and tessellation capacities.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Record providing `entity.origin`, `entity.radius`, `entity.rotation`, `entity.shaderRGBA`. |
| `view` | `dynamic` | — | Record providing `view.axis`, `view.isMirror`. |
| `currentVertexes` | `dynamic` | — | Argument 9 supplied to `mq3.renderer.surface_entities.surfaceSprite`. |
| `currentIndexes` | `dynamic` | — | Argument 10 supplied to `mq3.renderer.surface_entities.surfaceSprite`. |
| `maxVertexes` | `dynamic` | — | Argument 11 supplied to `mq3.renderer.surface_entities.surfaceSprite`. |
| `maxIndexes` | `dynamic` | — | Argument 12 supplied to `mq3.renderer.surface_entities.surfaceSprite`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L127)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacetriangles-function-rb-surfacetriangles-surface-smpframe-needsnormal-currentvertexes-currentindexes-maxvertexes-maxindexes-currentdlightbits-src-mq3-renderer-tr-surface-runtime-ml-1461777441"></a>
### RB_SurfaceTriangles

```ml
function RB_SurfaceTriangles(surface, smpFrame, needsNormal, currentVertexes, currentIndexes, maxVertexes, maxIndexes, currentDlightBits)
```

Calls `mq3.renderer.surface_mesh.submitTriangles` with `(surface,smpFrame,needsNormal,currentVertexes,currentIndexes,maxVertexes,maxIndexes,currentDlightBits)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.surface_mesh.submitTriangles`. |
| `smpFrame` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.surface_mesh.submitTriangles`. |
| `needsNormal` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.surface_mesh.submitTriangles`. |
| `currentVertexes` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.surface_mesh.submitTriangles`. |
| `currentIndexes` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.surface_mesh.submitTriangles`. |
| `maxVertexes` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.surface_mesh.submitTriangles`. |
| `maxIndexes` | `dynamic` | — | Argument 7 supplied to `mq3.renderer.surface_mesh.submitTriangles`. |
| `currentDlightBits` | `dynamic` | — | Argument 8 supplied to `mq3.renderer.surface_mesh.submitTriangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L144)

<a id="constant-constant-mq3-renderer-tr-surface-runtime-rt-beam-const-rt-beam-3-src-mq3-renderer-tr-surface-runtime-ml-873822690"></a>
### RT_BEAM

```ml
const RT_BEAM = 3
```

Renderer entity type for a beam between two endpoints.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L21)

<a id="constant-constant-mq3-renderer-tr-surface-runtime-rt-lightning-const-rt-lightning-6-src-mq3-renderer-tr-surface-runtime-ml-239808959"></a>
### RT_LIGHTNING

```ml
const RT_LIGHTNING = 6
```

Renderer entity type for the lightning-gun beam.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L27)

<a id="constant-constant-mq3-renderer-tr-surface-runtime-rt-rail-core-const-rt-rail-core-4-src-mq3-renderer-tr-surface-runtime-ml-699168801"></a>
### RT_RAIL_CORE

```ml
const RT_RAIL_CORE = 4
```

Renderer entity type for the core of a railgun trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L23)

<a id="constant-constant-mq3-renderer-tr-surface-runtime-rt-rail-rings-const-rt-rail-rings-5-src-mq3-renderer-tr-surface-runtime-ml-827379116"></a>
### RT_RAIL_RINGS

```ml
const RT_RAIL_RINGS = 5
```

Renderer entity type for rings around a railgun trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L25)

<a id="constant-constant-mq3-renderer-tr-surface-runtime-rt-sprite-const-rt-sprite-2-src-mq3-renderer-tr-surface-runtime-ml-894443159"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```

Renderer entity type for a camera-facing sprite.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L19)

<a id="function-function-mq3-renderer-tr-surface-runtime-valid3-function-valid3-value-src-mq3-renderer-tr-surface-runtime-ml-71101521"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.tr_surface_runtime.valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L80)

<a id="function-function-mq3-renderer-tr-surface-runtime-validaxis-function-validaxis-value-src-mq3-renderer-tr-surface-runtime-ml-680912835"></a>
### validAxis

```ml
function validAxis(value)
```

Computes `value!=void and len(value)==3 and valid3(value[0]) and valid3(value[1]) and valid3(value[2])` for `mq3.renderer.tr_surface_runtime.validAxis`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L83)

<a id="function-function-mq3-renderer-tr-surface-runtime-vectorarraynormalize-function-vectorarraynormalize-normals-count-src-mq3-renderer-tr-surface-runtime-ml-140401887"></a>
### VectorArrayNormalize

```ml
function VectorArrayNormalize(normals, count)
```

The C routine mutates vec4_t rows.  Returning normalized vec3 rows gives callers the same values while keeping the MiniLang API allocation safe.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normals` | `dynamic` | — | Indexed input read at `index`. |
| `count` | `dynamic` | — | Input tested by `normals==void or count<0 or count>len(normals)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_surface_runtime.ml#L186)

- [mq3.renderer.tr_surface_runtime.ViewInput](Type-mq3-renderer-tr-surface-runtime-viewinput-821329301.md) — struct
