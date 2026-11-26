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
| `fogs` | `dynamic` | — | Indexed input read at `fogIndex`. |
| `origin` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.md3_entity.valid3`. |
| `frame` | `dynamic` | — | Record providing `frame.localOrigin`, `frame.radius`. |
| `noWorldModel` | `dynamic` | — | Input tested by `noWorldModel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L134)

<a id="function-function-mq3-renderer-md3-entity-computelod-function-computelod-numlods-mins-maxs-origin-vieworigin-viewforward-projection-lodscale-lodbias-src-mq3-renderer-md3-entity-ml-1562511117"></a>
### computeLod

```ml
function computeLod(numLods, mins, maxs, origin, viewOrigin, viewForward, projection, lodScale, lodBias)
```

R_ComputeLOD. A single-level model still applies r_lodbias and clamps it, matching the original rather than bypassing the common tail.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numLods` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.fmul`. |
| `mins` | `dynamic` | — | Value forwarded as `mins` to `mq3.renderer.md3_entity.radiusFromBounds`. |
| `maxs` | `dynamic` | — | Value forwarded as `maxs` to `mq3.renderer.md3_entity.radiusFromBounds`. |
| `origin` | `dynamic` | — | Value forwarded as `location` to `mq3.renderer.md3_entity.projectRadius`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `viewOrigin` to `mq3.renderer.md3_entity.projectRadius`. |
| `viewForward` | `dynamic` | — | Value forwarded as `viewForward` to `mq3.renderer.md3_entity.projectRadius`. |
| `projection` | `dynamic` | — | Value forwarded as `projection` to `mq3.renderer.md3_entity.projectRadius`. |
| `lodScale` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `lodBias` | `dynamic` | — | Input used by `lod=lod+lodBias`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L106)

<a id="function-function-mq3-renderer-md3-entity-cremainder-function-cremainder-value-divisor-src-mq3-renderer-md3-entity-ml-2125227319"></a>
### cRemainder

```ml
function cRemainder(value, divisor)
```

Returns `value%divisor` from `mq3.renderer.md3_entity.cRemainder`; earlier branches return `0-((0-value)%divisor)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input tested by `value<0`. |
| `divisor` | `dynamic` | — | Input tested by `value<0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L39)

<a id="function-function-mq3-renderer-md3-entity-cullmodel-function-cullmodel-frames-frame-oldframe-origin-axis-nonnormalizedaxes-frustum-nocull-src-mq3-renderer-md3-entity-ml-903558504"></a>
### cullModel

```ml
function cullModel(frames, frame, oldFrame, origin, axis, nonNormalizedAxes, frustum, noCull)
```

Builds `bounds[0]`, `bounds[1]` in `mq3.renderer.md3_entity.cullModel`; returns `cullModelDecision(frame==oldFrame,nonNormalizedAxes,newSphere,oldSphere,boxCull)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frames` | `dynamic` | — | Indexed input read at `frame`, `oldFrame`. |
| `frame` | `dynamic` | — | Input tested by `frames==void or frame<0 or oldFrame<0 or frame>=len(frames) or oldFrame>=len(frames)`. |
| `oldFrame` | `dynamic` | — | Input tested by `frames==void or frame<0 or oldFrame<0 or frame>=len(frames) or oldFrame>=len(frames)`. |
| `origin` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.view_math.orientation`. |
| `axis` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.view_math.orientation`. |
| `nonNormalizedAxes` | `dynamic` | — | Value forwarded as `nonNormalizedAxes` to `mq3.renderer.md3_entity.cullModelDecision`. |
| `frustum` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`. |
| `noCull` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L178)

<a id="function-function-mq3-renderer-md3-entity-cullmodeldecision-function-cullmodeldecision-sameframe-nonnormalizedaxes-newsphere-oldsphere-boxcull-src-mq3-renderer-md3-entity-ml-2131912006"></a>
### cullModelDecision

```ml
function cullModelDecision(sameFrame, nonNormalizedAxes, newSphere, oldSphere, boxCull)
```

Control-flow core of R_CullModel.  The sphere tests can produce an early definitive answer only for normalized axes; clipped or disagreeing frame spheres fall through to the merged-frame box exactly like Baseq3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sameFrame` | `dynamic` | — | Input tested by `sameFrame`. |
| `nonNormalizedAxes` | `dynamic` | — | Input tested by `not nonNormalizedAxes`. |
| `newSphere` | `dynamic` | — | Input tested by `newSphere==viewMath.CULL_OUT or newSphere==viewMath.CULL_IN`. |
| `oldSphere` | `dynamic` | — | Input tested by `newSphere==oldSphere and (newSphere==viewMath.CULL_OUT or newSphere==viewMath.CULL_IN)`. |
| `boxCull` | `dynamic` | — | Input used in the result expression `boxCull`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L158)

<a id="function-function-mq3-renderer-md3-entity-fail-function-fail-message-src-mq3-renderer-md3-entity-ml-988801831"></a>
### fail

```ml
function fail(message)
```

Creates error `7695` with message `"MD3 entity: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7695,"MD3 entity: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L32)

- [mq3.renderer.md3_entity.Frames](Type-mq3-renderer-md3-entity-frames-278773139.md) — struct
<a id="function-function-mq3-renderer-md3-entity-lodprojection-function-lodprojection-fovy-znear-src-mq3-renderer-md3-entity-ml-323326406"></a>
### lodProjection

```ml
function lodProjection(fovY, zNear)
```

R_SetupProjection fields used by ProjectRadius.  This keeps the original float stores around tan() and matrix construction; all unused fields stay zero except projection[11], which supplies clip W = distance.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fovY` | `dynamic` | — | Input tested by `fovY<=0.0 or fovY>=180.0 or zNear<=0.0`. |
| `zNear` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L204)

<a id="function-function-mq3-renderer-md3-entity-normalizeframes-function-normalizeframes-numframes-frame-oldframe-renderfx-src-mq3-renderer-md3-entity-ml-705795903"></a>
### normalizeFrames

```ml
function normalizeFrames(numFrames, frame, oldFrame, renderfx)
```

R_AddMD3Surfaces first wraps continuous animation frames, then repairs both frame indexes to zero together if either remains outside the model.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numFrames` | `dynamic` | — | Value forwarded as `divisor` to `mq3.renderer.md3_entity.cRemainder`. |
| `frame` | `dynamic` | — | Initial value for `mq3.renderer.md3_entity.Frames.frame`. |
| `oldFrame` | `dynamic` | — | Initial value for `mq3.renderer.md3_entity.Frames.oldFrame`. |
| `renderfx` | `dynamic` | — | Input tested by `(renderfx&RF_WRAP_FRAMES)!=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L47)

<a id="function-function-mq3-renderer-md3-entity-projectradius-function-projectradius-radius-location-vieworigin-viewforward-projection-src-mq3-renderer-md3-entity-ml-2123797363"></a>
### projectRadius

```ml
function projectRadius(radius, location, viewOrigin, viewForward, projection)
```

ProjectRadius uses the renderer's current view orientation and projection matrix. All intermediate stores remain binary32 as in the x86 Baseq3 path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `radius` | `dynamic` | — | Input used by `r=radius`. |
| `location` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.md3_entity.valid3`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.md3_entity.valid3`. |
| `viewForward` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.md3_entity.valid3`. |
| `projection` | `dynamic` | — | Indexed input read at `5`, `9`, `13`, `7`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L80)

<a id="function-function-mq3-renderer-md3-entity-radiusfrombounds-function-radiusfrombounds-mins-maxs-src-mq3-renderer-md3-entity-ml-1295622536"></a>
### radiusFromBounds

```ml
function radiusFromBounds(mins, maxs)
```

RadiusFromBounds from q_shared.c. It selects the most distant corner from the origin before taking the Euclidean length.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mins` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.md3_entity.valid3`. |
| `maxs` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.md3_entity.valid3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L62)

<a id="constant-constant-mq3-renderer-md3-entity-rf-wrap-frames-const-rf-wrap-frames-512-src-mq3-renderer-md3-entity-ml-448931"></a>
### RF_WRAP_FRAMES

```ml
const RF_WRAP_FRAMES = 512
```

Entity-rendering flag allowing animation frames to wrap within the model's frame range.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L16)

<a id="extern_function-extern-function-mq3-renderer-md3-entity-tan-extern-function-tan-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-renderer-md3-entity-ml-419240756"></a>
### tan

```ml
extern function tan(value as double) from "ucrtbase.dll" returns double
```

Computes the tangent of a radian angle through the C runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Input angle in radians. |


**Returns:** The tangent of the input angle.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L13)

<a id="function-function-mq3-renderer-md3-entity-valid3-function-valid3-value-src-mq3-renderer-md3-entity-ml-1826189869"></a>
### valid3

```ml
function valid3(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.md3_entity.valid3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_entity.ml#L35)
