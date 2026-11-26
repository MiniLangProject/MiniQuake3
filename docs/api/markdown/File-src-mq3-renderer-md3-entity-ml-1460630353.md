# `src/mq3/renderer/md3_entity.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.md3_entity`](Package-mq3-renderer-md3-entity-1478390197.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/view_math.ml` as `viewMath` → [src/mq3/renderer/view_math.ml](File-src-mq3-renderer-view-math-ml-126526929.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-renderer-md3-entity-computefognum-function-computefognum-fogs-origin-frame-noworldmodel-src-mq3-renderer-md3-entity-ml-1679017056"></a>
### computeFogNum

```ml
function computeFogNum(fogs, origin, frame, noWorldModel)
```

R_ComputeFogNum from tr_mesh.c.  Fog zero is the renderer's no-fog slot; real BSP fogs start at one.  The original deliberately uses only the selected frame's sphere and entity origin (not the entity axes), and treats a sphere that merely touches a fog bound as outside that fog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fogs` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `noWorldModel` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L89)

<a id="function-function-mq3-renderer-md3-entity-computelod-function-computelod-numlods-mins-maxs-origin-vieworigin-viewforward-projection-lodscale-lodbias-src-mq3-renderer-md3-entity-ml-1562511117"></a>
### computeLod

```ml
function computeLod(numLods, mins, maxs, origin, viewOrigin, viewForward, projection, lodScale, lodBias)
```

R_ComputeLOD. A single-level model still applies r_lodbias and clamps it, matching the original rather than bypassing the common tail.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numLods` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `viewForward` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `lodScale` | `dynamic` | — |  |
| `lodBias` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L65)

<a id="function-function-mq3-renderer-md3-entity-cremainder-function-cremainder-value-divisor-src-mq3-renderer-md3-entity-ml-2125227319"></a>
### cRemainder

```ml
function cRemainder(value, divisor)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `divisor` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L18)

<a id="function-function-mq3-renderer-md3-entity-cullmodel-function-cullmodel-frames-frame-oldframe-origin-axis-nonnormalizedaxes-frustum-nocull-src-mq3-renderer-md3-entity-ml-903558504"></a>
### cullModel

```ml
function cullModel(frames, frame, oldFrame, origin, axis, nonNormalizedAxes, frustum, noCull)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frames` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `nonNormalizedAxes` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `noCull` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L119)

<a id="function-function-mq3-renderer-md3-entity-cullmodeldecision-function-cullmodeldecision-sameframe-nonnormalizedaxes-newsphere-oldsphere-boxcull-src-mq3-renderer-md3-entity-ml-2131912006"></a>
### cullModelDecision

```ml
function cullModelDecision(sameFrame, nonNormalizedAxes, newSphere, oldSphere, boxCull)
```

Control-flow core of R_CullModel.  The sphere tests can produce an early definitive answer only for normalized axes; clipped or disagreeing frame spheres fall through to the merged-frame box exactly like Baseq3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sameFrame` | `dynamic` | — |  |
| `nonNormalizedAxes` | `dynamic` | — |  |
| `newSphere` | `dynamic` | — |  |
| `oldSphere` | `dynamic` | — |  |
| `boxCull` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L108)

<a id="function-function-mq3-renderer-md3-entity-fail-function-fail-message-src-mq3-renderer-md3-entity-ml-988801831"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L16)

- [mq3.renderer.md3_entity.Frames](Type-mq3-renderer-md3-entity-frames-278773139.md) — struct
<a id="function-function-mq3-renderer-md3-entity-lodprojection-function-lodprojection-fovy-znear-src-mq3-renderer-md3-entity-ml-323326406"></a>
### lodProjection

```ml
function lodProjection(fovY, zNear)
```

R_SetupProjection fields used by ProjectRadius.  This keeps the original float stores around tan() and matrix construction; all unused fields stay zero except projection[11], which supplies clip W = distance.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fovY` | `dynamic` | — |  |
| `zNear` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L143)

<a id="function-function-mq3-renderer-md3-entity-normalizeframes-function-normalizeframes-numframes-frame-oldframe-renderfx-src-mq3-renderer-md3-entity-ml-705795903"></a>
### normalizeFrames

```ml
function normalizeFrames(numFrames, frame, oldFrame, renderfx)
```

R_AddMD3Surfaces first wraps continuous animation frames, then repairs both frame indexes to zero together if either remains outside the model.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numFrames` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `renderfx` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L22)

<a id="function-function-mq3-renderer-md3-entity-projectradius-function-projectradius-radius-location-vieworigin-viewforward-projection-src-mq3-renderer-md3-entity-ml-2123797363"></a>
### projectRadius

```ml
function projectRadius(radius, location, viewOrigin, viewForward, projection)
```

ProjectRadius uses the renderer's current view orientation and projection matrix. All intermediate stores remain binary32 as in the x86 Baseq3 path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `radius` | `dynamic` | — |  |
| `location` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `viewForward` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L48)

<a id="function-function-mq3-renderer-md3-entity-radiusfrombounds-function-radiusfrombounds-mins-maxs-src-mq3-renderer-md3-entity-ml-1295622536"></a>
### radiusFromBounds

```ml
function radiusFromBounds(mins, maxs)
```

RadiusFromBounds from q_shared.c. It selects the most distant corner from the origin before taking the Euclidean length.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L35)

<a id="constant-constant-mq3-renderer-md3-entity-rf-wrap-frames-const-rf-wrap-frames-512-src-mq3-renderer-md3-entity-ml-448931"></a>
### RF_WRAP_FRAMES

```ml
const RF_WRAP_FRAMES = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L12)

<a id="extern_function-extern-function-mq3-renderer-md3-entity-tan-extern-function-tan-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-renderer-md3-entity-ml-419240756"></a>
### tan

```ml
extern function tan(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L10)

<a id="function-function-mq3-renderer-md3-entity-valid3-function-valid3-value-src-mq3-renderer-md3-entity-ml-1826189869"></a>
### valid3

```ml
function valid3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L17)
