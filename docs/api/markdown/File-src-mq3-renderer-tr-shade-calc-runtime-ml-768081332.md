# `src/mq3/renderer/tr_shade_calc_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_shade_calc_runtime`](Package-mq3-renderer-tr-shade-calc-runtime-143044424.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/renderer/noise.ml` as `rendererNoise` → [src/mq3/renderer/noise.ml](File-src-mq3-renderer-noise-ml-139152771.md)
- `mq3/renderer/playable_fog.ml` as `fogRuntime` → [src/mq3/renderer/playable_fog.ml](File-src-mq3-renderer-playable-fog-ml-140703890.md)
- `mq3/renderer/playable_light_grid.ml` as `lightGrid` → [src/mq3/renderer/playable_light_grid.ml](File-src-mq3-renderer-playable-light-grid-ml-1846122219.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/playable_world_batch.ml` as `worldBatch` → [src/mq3/renderer/playable_world_batch.ml](File-src-mq3-renderer-playable-world-batch-ml-1411140007.md)
- `mq3/renderer/shader_parser.ml` as `shaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-autosprite2deform-function-autosprite2deform-pass-triangleindex-forward-src-mq3-renderer-tr-shade-calc-runtime-ml-516022304"></a>
### Autosprite2Deform

```ml
function Autosprite2Deform(pass, triangleIndex, forward)
```

Calls `mq3.renderer.playable_world_batch.autosprite2Quad` with `(pass,triangleIndex,forward)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_world_batch.autosprite2Quad`. |
| `triangleIndex` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_world_batch.autosprite2Quad`. |
| `forward` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.autosprite2Quad`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L176)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-autospritedeform-function-autospritedeform-pass-triangleindex-leftdirection-updirection-src-mq3-renderer-tr-shade-calc-runtime-ml-328648547"></a>
### AutospriteDeform

```ml
function AutospriteDeform(pass, triangleIndex, leftDirection, upDirection)
```

Calls `mq3.renderer.playable_world_batch.autospriteQuad` with `(pass,triangleIndex,leftDirection,upDirection)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_world_batch.autospriteQuad`. |
| `triangleIndex` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_world_batch.autospriteQuad`. |
| `leftDirection` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.autospriteQuad`. |
| `upDirection` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_world_batch.autospriteQuad`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L171)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-copy2-function-copy2-values-src-mq3-renderer-tr-shade-calc-runtime-ml-228426402"></a>
### copy2

```ml
function copy2(values)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.copy2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence traversed as `value` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L55)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-copy3-function-copy3-values-src-mq3-renderer-tr-shade-calc-runtime-ml-1985136156"></a>
### copy3

```ml
function copy3(values)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.copy3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence traversed as `value` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L58)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-deformtext-function-deformtext-text-corners-normal-src-mq3-renderer-tr-shade-calc-runtime-ml-1614157106"></a>
### DeformText

```ml
function DeformText(text, corners, normal)
```

The original text deformation converts one four-corner surface into atlas quads. Return the complete indexed geometry so callers are not coupled to the global tess scratch buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 supplied to `bytes`. |
| `corners` | `dynamic` | — | Indexed input read at `index`. |
| `normal` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L184)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-evalwaveform-function-evalwaveform-wave-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-234394449"></a>
### EvalWaveForm

```ml
function EvalWaveForm(wave, nowMilliseconds)
```

Returns `materials.waveSample(wave,nowMilliseconds)` from `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`; earlier branches return `checked`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — | Record providing `wave.func`. |
| `nowMilliseconds` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_materials.waveSample`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L47)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-evalwaveformclamped-function-evalwaveformclamped-wave-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-169067571"></a>
### EvalWaveFormClamped

```ml
function EvalWaveFormClamped(wave, nowMilliseconds)
```

Returns `value` from `mq3.renderer.tr_shade_calc_runtime.EvalWaveFormClamped`; earlier branches return `value`, `0.0`, `1.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — | Value forwarded as `wave` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L51)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-fogmodulate-function-fogmodulate-colors-densities-mode-src-mq3-renderer-tr-shade-calc-runtime-ml-1725427909"></a>
### fogModulate

```ml
function fogModulate(colors, densities, mode)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.fogModulate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — | Indexed input read at `index`. |
| `densities` | `dynamic` | — | Indexed input read at `index`. |
| `mode` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_materials.modulateForFog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L256)

<a id="constant-constant-mq3-renderer-tr-shade-calc-runtime-functable-mask-const-functable-mask-1023-src-mq3-renderer-tr-shade-calc-runtime-ml-256703663"></a>
### FUNCTABLE_MASK

```ml
const FUNCTABLE_MASK = 1023
```

Mask that wraps waveform-table indices to the power-of-two table size.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L22)

<a id="constant-constant-mq3-renderer-tr-shade-calc-runtime-functable-size-const-functable-size-1024-src-mq3-renderer-tr-shade-calc-runtime-ml-425877164"></a>
### FUNCTABLE_SIZE

```ml
const FUNCTABLE_SIZE = 1024
```

Number of samples in the periodic shader waveform lookup table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L20)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-globalvectortolocal-function-globalvectortolocal-value-axes-src-mq3-renderer-tr-shade-calc-runtime-ml-1724841922"></a>
### GlobalVectorToLocal

```ml
function GlobalVectorToLocal(value, axes)
```

Returns `[qmath.DotProduct(value,axes[0]),qmath.DotProduct(value,axes[1]),qmath.DotProduct(value,axes[2])]` for `mq3.renderer.tr_shade_calc_runtime.GlobalVectorToLocal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.shared.math.DotProduct`. |
| `axes` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L165)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-myftol-function-myftol-value-src-mq3-renderer-tr-shade-calc-runtime-ml-1559369985"></a>
### myftol

```ml
function myftol(value)
```

Calls `mq3.compat.numeric.trunc32` with `(value)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.trunc32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L37)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcalphafromentity-function-rb-calcalphafromentity-colors-entitycolor-src-mq3-renderer-tr-shade-calc-runtime-ml-1144582288"></a>
### RB_CalcAlphaFromEntity

```ml
function RB_CalcAlphaFromEntity(colors, entityColor)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcAlphaFromEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — | Sequence traversed as `color` while producing this result. |
| `entityColor` | `dynamic` | — | Indexed input read at `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L232)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcalphafromoneminusentity-function-rb-calcalphafromoneminusentity-colors-entitycolor-src-mq3-renderer-tr-shade-calc-runtime-ml-597464924"></a>
### RB_CalcAlphaFromOneMinusEntity

```ml
function RB_CalcAlphaFromOneMinusEntity(colors, entityColor)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcAlphaFromOneMinusEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — | Sequence traversed as `color` while producing this result. |
| `entityColor` | `dynamic` | — | Indexed input read at `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L236)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcbulgevertexes-function-rb-calcbulgevertexes-deform-positions-normals-coords-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-650464959"></a>
### RB_CalcBulgeVertexes

```ml
function RB_CalcBulgeVertexes(deform, positions, normals, coords, nowMilliseconds)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcBulgeVertexes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deform` | `dynamic` | — | Input used by `for index=0 to len(positions)-1 result=result+[worldBatch.deformedPosition(positions[index],normals[index],coords[index],[deform],nowMilliseconds)]`. |
| `positions` | `dynamic` | — | Indexed input read at `index`. |
| `normals` | `dynamic` | — | Indexed input read at `index`. |
| `coords` | `dynamic` | — | Indexed input read at `index`. |
| `nowMilliseconds` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.playable_world_batch.deformedPosition`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L143)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calccolorfromentity-function-rb-calccolorfromentity-entitycolor-count-src-mq3-renderer-tr-shade-calc-runtime-ml-406826025"></a>
### RB_CalcColorFromEntity

```ml
function RB_CalcColorFromEntity(entityColor, count)
```

Calls `mq3.renderer.tr_shade_calc_runtime.repeatColor` with `(entityColor,count)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityColor` | `dynamic` | — | Value forwarded as `color` to `mq3.renderer.tr_shade_calc_runtime.repeatColor`. |
| `count` | `dynamic` | — | Value forwarded as `count` to `mq3.renderer.tr_shade_calc_runtime.repeatColor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L224)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calccolorfromoneminusentity-function-rb-calccolorfromoneminusentity-entitycolor-count-src-mq3-renderer-tr-shade-calc-runtime-ml-274731841"></a>
### RB_CalcColorFromOneMinusEntity

```ml
function RB_CalcColorFromOneMinusEntity(entityColor, count)
```

Calls `mq3.renderer.tr_shade_calc_runtime.repeatColor` with `([255-entityColor[0],255-entityColor[1],255-entityColor[2],255-entityColor[3]],count)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityColor` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `count` | `dynamic` | — | Value forwarded as `count` to `mq3.renderer.tr_shade_calc_runtime.repeatColor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L228)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcdeformnormals-function-rb-calcdeformnormals-deform-positions-normals-nowmilliseconds-noise-src-mq3-renderer-tr-shade-calc-runtime-ml-1197929053"></a>
### RB_CalcDeformNormals

```ml
function RB_CalcDeformNormals(deform, positions, normals, nowMilliseconds, noise)
```

Applies the specified time-dependent normal deformation, creating deterministic noise state when necessary.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deform` | `dynamic` | — | Input used by `for index=0 to len(positions)-1 result=result+[worldBatch.deformedNormal(positions[index],normals[index],[deform],nowMilliseconds,noise)]`. |
| `positions` | `dynamic` | — | Indexed input read at `index`. |
| `normals` | `dynamic` | — | Indexed input read at `index`. |
| `nowMilliseconds` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_world_batch.deformedNormal`. |
| `noise` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.playable_world_batch.deformedNormal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L159)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcdeformvertexes-function-rb-calcdeformvertexes-deform-positions-normals-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-1000231067"></a>
### RB_CalcDeformVertexes

```ml
function RB_CalcDeformVertexes(deform, positions, normals, nowMilliseconds)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcDeformVertexes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deform` | `dynamic` | — | Input used by `for index=0 to len(positions)-1 result=result+[worldBatch.deformedPosition(positions[index],normals[index],[0.0,0.0],[deform],nowMilliseconds)]`. |
| `positions` | `dynamic` | — | Indexed input read at `index`. |
| `normals` | `dynamic` | — | Indexed input read at `index`. |
| `nowMilliseconds` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.playable_world_batch.deformedPosition`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L134)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcdiffusecolor-function-rb-calcdiffusecolor-sample-normals-src-mq3-renderer-tr-shade-calc-runtime-ml-137960102"></a>
### RB_CalcDiffuseColor

```ml
function RB_CalcDiffuseColor(sample, normals)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcDiffuseColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sample` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_light_grid.vertexColor`. |
| `normals` | `dynamic` | — | Sequence traversed as `normal` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L278)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcenvironmenttexcoords-function-rb-calcenvironmenttexcoords-positions-normals-vieworigin-src-mq3-renderer-tr-shade-calc-runtime-ml-1524306483"></a>
### RB_CalcEnvironmentTexCoords

```ml
function RB_CalcEnvironmentTexCoords(positions, normals, viewOrigin)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcEnvironmentTexCoords`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positions` | `dynamic` | — | Indexed input read at `index`. |
| `normals` | `dynamic` | — | Indexed input read at `index`. |
| `viewOrigin` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_materials.environmentUV`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L117)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcfogtexcoords-function-rb-calcfogtexcoords-fog-positions-vieworigin-forward-src-mq3-renderer-tr-shade-calc-runtime-ml-2062181232"></a>
### RB_CalcFogTexCoords

```ml
function RB_CalcFogTexCoords(fog, positions, viewOrigin, forward)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcFogTexCoords`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fog` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_fog.coordinates`. |
| `positions` | `dynamic` | — | Sequence traversed as `position` while producing this result. |
| `viewOrigin` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_fog.coordinates`. |
| `forward` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_fog.coordinates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L125)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcmodulatealphasbyfog-function-rb-calcmodulatealphasbyfog-colors-densities-src-mq3-renderer-tr-shade-calc-runtime-ml-151153734"></a>
### RB_CalcModulateAlphasByFog

```ml
function RB_CalcModulateAlphasByFog(colors, densities)
```

Calls `mq3.renderer.tr_shade_calc_runtime.fogModulate` with `(colors,densities,"alpha")` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — | Value forwarded as `colors` to `mq3.renderer.tr_shade_calc_runtime.fogModulate`. |
| `densities` | `dynamic` | — | Value forwarded as `densities` to `mq3.renderer.tr_shade_calc_runtime.fogModulate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L264)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcmodulatecolorsbyfog-function-rb-calcmodulatecolorsbyfog-colors-densities-src-mq3-renderer-tr-shade-calc-runtime-ml-1085587654"></a>
### RB_CalcModulateColorsByFog

```ml
function RB_CalcModulateColorsByFog(colors, densities)
```

Calls `mq3.renderer.tr_shade_calc_runtime.fogModulate` with `(colors,densities,"rgb")` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — | Value forwarded as `colors` to `mq3.renderer.tr_shade_calc_runtime.fogModulate`. |
| `densities` | `dynamic` | — | Value forwarded as `densities` to `mq3.renderer.tr_shade_calc_runtime.fogModulate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L260)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcmodulatergbasbyfog-function-rb-calcmodulatergbasbyfog-colors-densities-src-mq3-renderer-tr-shade-calc-runtime-ml-1589613156"></a>
### RB_CalcModulateRGBAsByFog

```ml
function RB_CalcModulateRGBAsByFog(colors, densities)
```

Calls `mq3.renderer.tr_shade_calc_runtime.fogModulate` with `(colors,densities,"rgba")` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — | Value forwarded as `colors` to `mq3.renderer.tr_shade_calc_runtime.fogModulate`. |
| `densities` | `dynamic` | — | Value forwarded as `densities` to `mq3.renderer.tr_shade_calc_runtime.fogModulate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L268)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcmovevertexes-function-rb-calcmovevertexes-deform-positions-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-162520697"></a>
### RB_CalcMoveVertexes

```ml
function RB_CalcMoveVertexes(deform, positions, nowMilliseconds)
```

Moves every vertex along a deformation vector scaled by the current waveform value.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deform` | `dynamic` | — | Record providing `deform.wave`, `deform.vector`. |
| `positions` | `dynamic` | — | Sequence traversed as `point` while producing this result. |
| `nowMilliseconds` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_materials.waveSample`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L150)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcrotatetexcoords-function-rb-calcrotatetexcoords-degreespersecond-coords-shadertimeseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-1988642559"></a>
### RB_CalcRotateTexCoords

```ml
function RB_CalcRotateTexCoords(degreesPerSecond, coords, shaderTimeSeconds)
```

Rotates texture coordinates around the texture center using the time-scaled angle and sine table.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `degreesPerSecond` | `dynamic` | — | Input used by `index=n.trunc32((0.0-degreesPerSecond*shaderTimeSeconds)*(FUNCTABLE_SIZE/360.0))`. |
| `coords` | `dynamic` | — | Value forwarded as `coords` to `mq3.renderer.tr_shade_calc_runtime.RB_CalcTransformTexCoords`. |
| `shaderTimeSeconds` | `dynamic` | — | Input used by `index=n.trunc32((0.0-degreesPerSecond*shaderTimeSeconds)*(FUNCTABLE_SIZE/360.0))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L99)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcscaletexcoords-function-rb-calcscaletexcoords-scale-coords-src-mq3-renderer-tr-shade-calc-runtime-ml-654365088"></a>
### RB_CalcScaleTexCoords

```ml
function RB_CalcScaleTexCoords(scale, coords)
```

Calls `mq3.renderer.tr_shade_calc_runtime.RB_CalcTransformTexCoords` with `([[scale[0],0.0],[0.0,scale[1]]],[0.0,0.0],coords)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scale` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `coords` | `dynamic` | — | Value forwarded as `coords` to `mq3.renderer.tr_shade_calc_runtime.RB_CalcTransformTexCoords`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L86)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcscrolltexcoords-function-rb-calcscrolltexcoords-speed-coords-shadertimeseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-565947428"></a>
### RB_CalcScrollTexCoords

```ml
function RB_CalcScrollTexCoords(speed, coords, shaderTimeSeconds)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcScrollTexCoords`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `speed` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `coords` | `dynamic` | — | Sequence traversed as `uv` while producing this result. |
| `shaderTimeSeconds` | `dynamic` | — | Input used by `s=speed[0]*shaderTimeSeconds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L91)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcspecularalpha-function-rb-calcspecularalpha-colors-positions-normals-vieworigin-src-mq3-renderer-tr-shade-calc-runtime-ml-323177251"></a>
### RB_CalcSpecularAlpha

```ml
function RB_CalcSpecularAlpha(colors, positions, normals, viewOrigin)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcSpecularAlpha`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — | Indexed input read at `index`. |
| `positions` | `dynamic` | — | Indexed input read at `index`. |
| `normals` | `dynamic` | — | Indexed input read at `index`. |
| `viewOrigin` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.specularAlpha`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L274)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcstretchtexcoords-function-rb-calcstretchtexcoords-wave-coords-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-776576175"></a>
### RB_CalcStretchTexCoords

```ml
function RB_CalcStretchTexCoords(wave, coords, nowMilliseconds)
```

Returns `RB_CalcTransformTexCoords([[p,0.0],[0.0,p]],[offset,offset],coords)` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcStretchTexCoords`; earlier branches return `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — | Value forwarded as `wave` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`. |
| `coords` | `dynamic` | — | Value forwarded as `coords` to `mq3.renderer.tr_shade_calc_runtime.RB_CalcTransformTexCoords`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L79)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calctransformtexcoords-function-rb-calctransformtexcoords-matrix-translate-coords-src-mq3-renderer-tr-shade-calc-runtime-ml-17426145"></a>
### RB_CalcTransformTexCoords

```ml
function RB_CalcTransformTexCoords(matrix, translate, coords)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcTransformTexCoords`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`. |
| `translate` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `coords` | `dynamic` | — | Sequence traversed as `uv` while producing this result. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L70)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcturbulenttexcoords-function-rb-calcturbulenttexcoords-wave-coords-positions-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-1207658845"></a>
### RB_CalcTurbulentTexCoords

```ml
function RB_CalcTurbulentTexCoords(wave, coords, positions, nowMilliseconds)
```

Adds position- and time-dependent sine turbulence to each texture-coordinate pair.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — | Record providing `wave.phase`, `wave.frequency`, `wave.amplitude`. |
| `coords` | `dynamic` | — | Indexed input read at `index`. |
| `positions` | `dynamic` | — | Indexed input read at `index`. |
| `nowMilliseconds` | `dynamic` | — | Input used by `now=wave.phase+nowMilliseconds*0.001*wave.frequency`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L108)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcwavealpha-function-rb-calcwavealpha-wave-colors-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-381393261"></a>
### RB_CalcWaveAlpha

```ml
function RB_CalcWaveAlpha(wave, colors, nowMilliseconds)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.RB_CalcWaveAlpha`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — | Value forwarded as `wave` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveFormClamped`. |
| `colors` | `dynamic` | — | Sequence traversed as `color` while producing this result. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveFormClamped`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L251)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcwavecolor-function-rb-calcwavecolor-wave-count-nowmilliseconds-identitylight-noise-src-mq3-renderer-tr-shade-calc-runtime-ml-305748448"></a>
### RB_CalcWaveColor

```ml
function RB_CalcWaveColor(wave, count, nowMilliseconds, identityLight, noise)
```

Computes `RB_CalcWaveColor` from `repeatColor([value,value,value,255],count)` using `mq3.renderer.noise.create`, `mq3.renderer.noise.get4f`, `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — | Record providing `wave.func`, `wave.base`, `wave.phase`, `wave.frequency`, `wave.amplitude`. |
| `count` | `dynamic` | — | Value forwarded as `count` to `mq3.renderer.tr_shade_calc_runtime.repeatColor`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.tr_shade_calc_runtime.EvalWaveForm`. |
| `identityLight` | `dynamic` | — | Brightness multiplier applied to non-noise waveform color before byte conversion. |
| `noise` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.noise.get4f`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L243)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-deformtessgeometry-function-rb-deformtessgeometry-deforms-positions-normals-coords-nowmilliseconds-noise-src-mq3-renderer-tr-shade-calc-runtime-ml-1411085296"></a>
### RB_DeformTessGeometry

```ml
function RB_DeformTessGeometry(deforms, positions, normals, coords, nowMilliseconds, noise)
```

Computes `RB_DeformTessGeometry` from `[outputPositions,outputNormals]` using `mq3.renderer.tr_shade_calc_runtime.copy3`, `mq3.renderer.tr_shade_calc_runtime.RB_CalcDeformVertexes`, `mq3.renderer.tr_shade_calc_runtime.RB_CalcDeformNormals`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deforms` | `dynamic` | — | Sequence traversed as `deform` while producing this result. |
| `positions` | `dynamic` | — | Value forwarded as `values` to `mq3.renderer.tr_shade_calc_runtime.copy3`. |
| `normals` | `dynamic` | — | Value forwarded as `values` to `mq3.renderer.tr_shade_calc_runtime.copy3`. |
| `coords` | `dynamic` | — | Value forwarded as `coords` to `mq3.renderer.tr_shade_calc_runtime.RB_CalcBulgeVertexes`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.tr_shade_calc_runtime.RB_CalcDeformVertexes`. |
| `noise` | `dynamic` | — | Value forwarded as `noise` to `mq3.renderer.tr_shade_calc_runtime.RB_CalcDeformNormals`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L205)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-repeatcolor-function-repeatcolor-color-count-src-mq3-renderer-tr-shade-calc-runtime-ml-996173408"></a>
### repeatColor

```ml
function repeatColor(color, count)
```

Returns `result` from `mq3.renderer.tr_shade_calc_runtime.repeatColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |
| `count` | `dynamic` | — | Input used by `for index=0 to count-1 result=result+[[color[0],color[1],color[2],color[3]]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L220)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-sinindex-function-sinindex-index-src-mq3-renderer-tr-shade-calc-runtime-ml-225198718"></a>
### sinIndex

```ml
function sinIndex(index)
```

Returns `materials.waveSignal(wave,0)` from `mq3.renderer.tr_shade_calc_runtime.sinIndex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Input used by `wave=shaderParser.Wave(1,0.0,1.0,n.fdiv(n.f32(index&FUNCTABLE_MASK),1024.0),0.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L61)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-tableforfunc-function-tableforfunc-func-src-mq3-renderer-tr-shade-calc-runtime-ml-1592178404"></a>
### TableForFunc

```ml
function TableForFunc(func)
```

Returns `func` from `mq3.renderer.tr_shade_calc_runtime.TableForFunc`; earlier branches return `error(7750,"TableForFunc: invalid waveform")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `func` | `dynamic` | — | Input tested by `func<1 or func>5`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L40)

- [mq3.renderer.tr_shade_calc_runtime.TextGeometry](Type-mq3-renderer-tr-shade-calc-runtime-textgeometry-970259013.md) — struct
