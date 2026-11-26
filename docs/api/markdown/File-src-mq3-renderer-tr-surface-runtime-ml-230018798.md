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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `lengthValue` | `dynamic` | — |  |
| `spanWidth` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L50)

<a id="function-function-mq3-renderer-tr-surface-runtime-doraildiscs-function-doraildiscs-numsegments-start-direction-right-up-spanwidth-color-src-mq3-renderer-tr-surface-runtime-ml-856726287"></a>
### DoRailDiscs

```ml
function DoRailDiscs(numSegments, start, direction, right, up, spanWidth, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numSegments` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `spanWidth` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L51)

- [mq3.renderer.tr_surface_runtime.EntityInput](Type-mq3-renderer-tr-surface-runtime-entityinput-1793166827.md) — struct
<a id="function-function-mq3-renderer-tr-surface-runtime-fail-function-fail-text-src-mq3-renderer-tr-surface-runtime-ml-546563735"></a>
### fail

```ml
function fail(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L30)

<a id="function-function-mq3-renderer-tr-surface-runtime-lerpmeshvertexes-function-lerpmeshvertexes-surface-frame-oldframe-backlerp-src-mq3-renderer-tr-surface-runtime-ml-1173653232"></a>
### LerpMeshVertexes

```ml
function LerpMeshVertexes(surface, frame, oldFrame, backlerp)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L67)

<a id="function-function-mq3-renderer-tr-surface-runtime-loderrorforvolume-function-loderrorforvolume-local-radius-lodcurveerror-entityorigin-entityaxis-vieworigin-viewforward-src-mq3-renderer-tr-surface-runtime-ml-1812568435"></a>
### LodErrorForVolume

```ml
function LodErrorForVolume(local, radius, lodCurveError, entityOrigin, entityAxis, viewOrigin, viewForward)
```

Exact LodErrorForVolume transform and clamp.  axis rows are the entity's local basis and viewForward is viewParms.or.axis[0].

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `lodCurveError` | `dynamic` | — |  |
| `entityOrigin` | `dynamic` | — |  |
| `entityAxis` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `viewForward` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L77)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-addquadstamp-function-rb-addquadstamp-origin-left-up-color-viewforward-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-tr-surface-runtime-ml-104506631"></a>
### RB_AddQuadStamp

```ml
function RB_AddQuadStamp(origin, left, up, color, viewForward, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `viewForward` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L38)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-addquadstampext-function-rb-addquadstampext-origin-left-up-color-viewforward-s1-t1-s2-t2-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-tr-surface-runtime-ml-1475033327"></a>
### RB_AddQuadStampExt

```ml
function RB_AddQuadStampExt(origin, left, up, color, viewForward, s1, t1, s2, t2, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `viewForward` | `dynamic` | — |  |
| `s1` | `dynamic` | — |  |
| `t1` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L35)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-checkoverflow-function-rb-checkoverflow-buffer-vertexes-indexes-src-mq3-renderer-tr-surface-runtime-ml-858613316"></a>
### RB_CheckOverflow

```ml
function RB_CheckOverflow(buffer, vertexes, indexes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — |  |
| `vertexes` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L34)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfaceaxis-function-rb-surfaceaxis-src-mq3-renderer-tr-surface-runtime-ml-824448928"></a>
### RB_SurfaceAxis

```ml
function RB_SurfaceAxis()
```

Original null-model diagnostic geometry: three 16-unit colored axes.  It is exposed only for RT_MODEL fallback diagnostics and never substitutes a BSP, MD3 or generated entity surface in the productive renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L97)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacebad-function-rb-surfacebad-surface-src-mq3-renderer-tr-surface-runtime-ml-828023445"></a>
### RB_SurfaceBad

```ml
function RB_SurfaceBad(surface)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L111)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacebeam-function-rb-surfacebeam-entity-src-mq3-renderer-tr-surface-runtime-ml-1302221475"></a>
### RB_SurfaceBeam

```ml
function RB_SurfaceBeam(entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L49)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacedisplaylist-function-rb-surfacedisplaylist-surface-src-mq3-renderer-tr-surface-runtime-ml-1637238675"></a>
### RB_SurfaceDisplayList

```ml
function RB_SurfaceDisplayList(surface)
```

Display lists are a real legacy backend command, retained as a typed command so a GL backend can issue qglCallList after RB_BeginSurface state setup.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L118)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfaceentity-function-rb-surfaceentity-entity-view-currentvertexes-currentindexes-maxvertexes-maxindexes-railsegmentlength-railwidth-railcorewidth-src-mq3-renderer-tr-surface-runtime-ml-1649729136"></a>
### RB_SurfaceEntity

```ml
function RB_SurfaceEntity(entity, view, currentVertexes, currentIndexes, maxVertexes, maxIndexes, railSegmentLength, railWidth, railCoreWidth)
```

Complete procedural entity dispatch from RB_SurfaceEntity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `view` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |
| `railSegmentLength` | `dynamic` | — |  |
| `railWidth` | `dynamic` | — |  |
| `railCoreWidth` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L102)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfaceface-function-rb-surfaceface-surface-smpframe-needsnormal-currentvertexes-currentindexes-maxvertexes-maxindexes-currentdlightbits-src-mq3-renderer-tr-surface-runtime-ml-542460159"></a>
### RB_SurfaceFace

```ml
function RB_SurfaceFace(surface, smpFrame, needsNormal, currentVertexes, currentIndexes, maxVertexes, maxIndexes, currentDlightBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `smpFrame` | `dynamic` | — |  |
| `needsNormal` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |
| `currentDlightBits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L71)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfaceflare-function-rb-surfaceflare-surface-src-mq3-renderer-tr-surface-runtime-ml-1736206895"></a>
### RB_SurfaceFlare

```ml
function RB_SurfaceFlare(surface)
```

The active Baseq3 build intentionally makes flares a no-op in tr_surface.c; flare visibility/drawing is handled by the dedicated flare renderer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L115)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacegrid-function-rb-surfacegrid-surface-lodorigin-lodradius-lodcurveerror-entityorigin-entityaxis-vieworigin-viewforward-maxvertexes-maxindexes-needsnormal-dlightbits-src-mq3-renderer-tr-surface-runtime-ml-1413555919"></a>
### RB_SurfaceGrid

```ml
function RB_SurfaceGrid(surface, lodOrigin, lodRadius, lodCurveError, entityOrigin, entityAxis, viewOrigin, viewForward, maxVertexes, maxIndexes, needsNormal, dlightBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `lodOrigin` | `dynamic` | — |  |
| `lodRadius` | `dynamic` | — |  |
| `lodCurveError` | `dynamic` | — |  |
| `entityOrigin` | `dynamic` | — |  |
| `entityAxis` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `viewForward` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |
| `needsNormal` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L89)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacelightningbolt-function-rb-surfacelightningbolt-entity-view-src-mq3-renderer-tr-surface-runtime-ml-238250176"></a>
### RB_SurfaceLightningBolt

```ml
function RB_SurfaceLightningBolt(entity, view)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `view` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L54)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacemesh-function-rb-surfacemesh-surface-frame-oldframe-backlerp-currentvertexes-currentindexes-maxvertexes-maxindexes-dlightbits-src-mq3-renderer-tr-surface-runtime-ml-1193131730"></a>
### RB_SurfaceMesh

```ml
function RB_SurfaceMesh(surface, frame, oldFrame, backlerp, currentVertexes, currentIndexes, maxVertexes, maxIndexes, dlightBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `backlerp` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L68)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacepolychain-function-rb-surfacepolychain-buffer-vertices-src-mq3-renderer-tr-surface-runtime-ml-897663031"></a>
### RB_SurfacePolychain

```ml
function RB_SurfacePolychain(buffer, vertices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — |  |
| `vertices` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L45)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacerailcore-function-rb-surfacerailcore-entity-view-spanwidth-src-mq3-renderer-tr-surface-runtime-ml-728085654"></a>
### RB_SurfaceRailCore

```ml
function RB_SurfaceRailCore(entity, view, spanWidth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `view` | `dynamic` | — |  |
| `spanWidth` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L53)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacerailrings-function-rb-surfacerailrings-entity-segmentlength-spanwidth-src-mq3-renderer-tr-surface-runtime-ml-1565011470"></a>
### RB_SurfaceRailRings

```ml
function RB_SurfaceRailRings(entity, segmentLength, spanWidth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `segmentLength` | `dynamic` | — |  |
| `spanWidth` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L52)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfaceskip-function-rb-surfaceskip-surface-src-mq3-renderer-tr-surface-runtime-ml-1179258531"></a>
### RB_SurfaceSkip

```ml
function RB_SurfaceSkip(surface)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L119)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacesprite-function-rb-surfacesprite-entity-view-currentvertexes-currentindexes-maxvertexes-maxindexes-src-mq3-renderer-tr-surface-runtime-ml-1778376832"></a>
### RB_SurfaceSprite

```ml
function RB_SurfaceSprite(entity, view, currentVertexes, currentIndexes, maxVertexes, maxIndexes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `view` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L41)

<a id="function-function-mq3-renderer-tr-surface-runtime-rb-surfacetriangles-function-rb-surfacetriangles-surface-smpframe-needsnormal-currentvertexes-currentindexes-maxvertexes-maxindexes-currentdlightbits-src-mq3-renderer-tr-surface-runtime-ml-1461777441"></a>
### RB_SurfaceTriangles

```ml
function RB_SurfaceTriangles(surface, smpFrame, needsNormal, currentVertexes, currentIndexes, maxVertexes, maxIndexes, currentDlightBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `smpFrame` | `dynamic` | — |  |
| `needsNormal` | `dynamic` | — |  |
| `currentVertexes` | `dynamic` | — |  |
| `currentIndexes` | `dynamic` | — |  |
| `maxVertexes` | `dynamic` | — |  |
| `maxIndexes` | `dynamic` | — |  |
| `currentDlightBits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L46)

<a id="constant-constant-mq3-renderer-tr-surface-runtime-rt-beam-const-rt-beam-3-src-mq3-renderer-tr-surface-runtime-ml-873822690"></a>
### RT_BEAM

```ml
const RT_BEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L19)

<a id="constant-constant-mq3-renderer-tr-surface-runtime-rt-lightning-const-rt-lightning-6-src-mq3-renderer-tr-surface-runtime-ml-239808959"></a>
### RT_LIGHTNING

```ml
const RT_LIGHTNING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L22)

<a id="constant-constant-mq3-renderer-tr-surface-runtime-rt-rail-core-const-rt-rail-core-4-src-mq3-renderer-tr-surface-runtime-ml-699168801"></a>
### RT_RAIL_CORE

```ml
const RT_RAIL_CORE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L20)

<a id="constant-constant-mq3-renderer-tr-surface-runtime-rt-rail-rings-const-rt-rail-rings-5-src-mq3-renderer-tr-surface-runtime-ml-827379116"></a>
### RT_RAIL_RINGS

```ml
const RT_RAIL_RINGS = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L21)

<a id="constant-constant-mq3-renderer-tr-surface-runtime-rt-sprite-const-rt-sprite-2-src-mq3-renderer-tr-surface-runtime-ml-894443159"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L18)

<a id="function-function-mq3-renderer-tr-surface-runtime-valid3-function-valid3-value-src-mq3-renderer-tr-surface-runtime-ml-71101521"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L31)

<a id="function-function-mq3-renderer-tr-surface-runtime-validaxis-function-validaxis-value-src-mq3-renderer-tr-surface-runtime-ml-680912835"></a>
### validAxis

```ml
function validAxis(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L32)

<a id="function-function-mq3-renderer-tr-surface-runtime-vectorarraynormalize-function-vectorarraynormalize-normals-count-src-mq3-renderer-tr-surface-runtime-ml-140401887"></a>
### VectorArrayNormalize

```ml
function VectorArrayNormalize(normals, count)
```

The C routine mutates vec4_t rows.  Returning normalized vec3 rows gives callers the same values while keeping the MiniLang API allocation safe.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normals` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_surface_runtime.ml#L58)

- [mq3.renderer.tr_surface_runtime.ViewInput](Type-mq3-renderer-tr-surface-runtime-viewinput-821329301.md) — struct
