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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |
| `triangleIndex` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L82)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-autospritedeform-function-autospritedeform-pass-triangleindex-leftdirection-updirection-src-mq3-renderer-tr-shade-calc-runtime-ml-328648547"></a>
### AutospriteDeform

```ml
function AutospriteDeform(pass, triangleIndex, leftDirection, upDirection)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |
| `triangleIndex` | `dynamic` | — |  |
| `leftDirection` | `dynamic` | — |  |
| `upDirection` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L81)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-copy2-function-copy2-values-src-mq3-renderer-tr-shade-calc-runtime-ml-228426402"></a>
### copy2

```ml
function copy2(values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L31)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-copy3-function-copy3-values-src-mq3-renderer-tr-shade-calc-runtime-ml-1985136156"></a>
### copy3

```ml
function copy3(values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L32)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-deformtext-function-deformtext-text-corners-normal-src-mq3-renderer-tr-shade-calc-runtime-ml-1614157106"></a>
### DeformText

```ml
function DeformText(text, corners, normal)
```

The original text deformation converts one four-corner surface into atlas quads. Return the complete indexed geometry so callers are not coupled to the global tess scratch buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `corners` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L87)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-evalwaveform-function-evalwaveform-wave-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-234394449"></a>
### EvalWaveForm

```ml
function EvalWaveForm(wave, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L28)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-evalwaveformclamped-function-evalwaveformclamped-wave-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-169067571"></a>
### EvalWaveFormClamped

```ml
function EvalWaveFormClamped(wave, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L29)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-fogmodulate-function-fogmodulate-colors-densities-mode-src-mq3-renderer-tr-shade-calc-runtime-ml-1725427909"></a>
### fogModulate

```ml
function fogModulate(colors, densities, mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — |  |
| `densities` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L123)

<a id="constant-constant-mq3-renderer-tr-shade-calc-runtime-functable-mask-const-functable-mask-1023-src-mq3-renderer-tr-shade-calc-runtime-ml-256703663"></a>
### FUNCTABLE_MASK

```ml
const FUNCTABLE_MASK = 1023
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L20)

<a id="constant-constant-mq3-renderer-tr-shade-calc-runtime-functable-size-const-functable-size-1024-src-mq3-renderer-tr-shade-calc-runtime-ml-425877164"></a>
### FUNCTABLE_SIZE

```ml
const FUNCTABLE_SIZE = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L19)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-globalvectortolocal-function-globalvectortolocal-value-axes-src-mq3-renderer-tr-shade-calc-runtime-ml-1724841922"></a>
### GlobalVectorToLocal

```ml
function GlobalVectorToLocal(value, axes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `axes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L80)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-myftol-function-myftol-value-src-mq3-renderer-tr-shade-calc-runtime-ml-1559369985"></a>
### myftol

```ml
function myftol(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L23)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcalphafromentity-function-rb-calcalphafromentity-colors-entitycolor-src-mq3-renderer-tr-shade-calc-runtime-ml-1144582288"></a>
### RB_CalcAlphaFromEntity

```ml
function RB_CalcAlphaFromEntity(colors, entityColor)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — |  |
| `entityColor` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L116)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcalphafromoneminusentity-function-rb-calcalphafromoneminusentity-colors-entitycolor-src-mq3-renderer-tr-shade-calc-runtime-ml-597464924"></a>
### RB_CalcAlphaFromOneMinusEntity

```ml
function RB_CalcAlphaFromOneMinusEntity(colors, entityColor)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — |  |
| `entityColor` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L117)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcbulgevertexes-function-rb-calcbulgevertexes-deform-positions-normals-coords-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-650464959"></a>
### RB_CalcBulgeVertexes

```ml
function RB_CalcBulgeVertexes(deform, positions, normals, coords, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deform` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |
| `coords` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L71)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calccolorfromentity-function-rb-calccolorfromentity-entitycolor-count-src-mq3-renderer-tr-shade-calc-runtime-ml-406826025"></a>
### RB_CalcColorFromEntity

```ml
function RB_CalcColorFromEntity(entityColor, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityColor` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L114)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calccolorfromoneminusentity-function-rb-calccolorfromoneminusentity-entitycolor-count-src-mq3-renderer-tr-shade-calc-runtime-ml-274731841"></a>
### RB_CalcColorFromOneMinusEntity

```ml
function RB_CalcColorFromOneMinusEntity(entityColor, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityColor` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L115)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcdeformnormals-function-rb-calcdeformnormals-deform-positions-normals-nowmilliseconds-noise-src-mq3-renderer-tr-shade-calc-runtime-ml-1197929053"></a>
### RB_CalcDeformNormals

```ml
function RB_CalcDeformNormals(deform, positions, normals, nowMilliseconds, noise)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deform` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `noise` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L77)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcdeformvertexes-function-rb-calcdeformvertexes-deform-positions-normals-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-1000231067"></a>
### RB_CalcDeformVertexes

```ml
function RB_CalcDeformVertexes(deform, positions, normals, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deform` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L68)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcdiffusecolor-function-rb-calcdiffusecolor-sample-normals-src-mq3-renderer-tr-shade-calc-runtime-ml-137960102"></a>
### RB_CalcDiffuseColor

```ml
function RB_CalcDiffuseColor(sample, normals)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sample` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L128)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcenvironmenttexcoords-function-rb-calcenvironmenttexcoords-positions-normals-vieworigin-src-mq3-renderer-tr-shade-calc-runtime-ml-1524306483"></a>
### RB_CalcEnvironmentTexCoords

```ml
function RB_CalcEnvironmentTexCoords(positions, normals, viewOrigin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positions` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L61)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcfogtexcoords-function-rb-calcfogtexcoords-fog-positions-vieworigin-forward-src-mq3-renderer-tr-shade-calc-runtime-ml-2062181232"></a>
### RB_CalcFogTexCoords

```ml
function RB_CalcFogTexCoords(fog, positions, viewOrigin, forward)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fog` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L64)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcmodulatealphasbyfog-function-rb-calcmodulatealphasbyfog-colors-densities-src-mq3-renderer-tr-shade-calc-runtime-ml-151153734"></a>
### RB_CalcModulateAlphasByFog

```ml
function RB_CalcModulateAlphasByFog(colors, densities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — |  |
| `densities` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L125)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcmodulatecolorsbyfog-function-rb-calcmodulatecolorsbyfog-colors-densities-src-mq3-renderer-tr-shade-calc-runtime-ml-1085587654"></a>
### RB_CalcModulateColorsByFog

```ml
function RB_CalcModulateColorsByFog(colors, densities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — |  |
| `densities` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L124)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcmodulatergbasbyfog-function-rb-calcmodulatergbasbyfog-colors-densities-src-mq3-renderer-tr-shade-calc-runtime-ml-1589613156"></a>
### RB_CalcModulateRGBAsByFog

```ml
function RB_CalcModulateRGBAsByFog(colors, densities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — |  |
| `densities` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L126)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcmovevertexes-function-rb-calcmovevertexes-deform-positions-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-162520697"></a>
### RB_CalcMoveVertexes

```ml
function RB_CalcMoveVertexes(deform, positions, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deform` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L74)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcrotatetexcoords-function-rb-calcrotatetexcoords-degreespersecond-coords-shadertimeseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-1988642559"></a>
### RB_CalcRotateTexCoords

```ml
function RB_CalcRotateTexCoords(degreesPerSecond, coords, shaderTimeSeconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `degreesPerSecond` | `dynamic` | — |  |
| `coords` | `dynamic` | — |  |
| `shaderTimeSeconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L52)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcscaletexcoords-function-rb-calcscaletexcoords-scale-coords-src-mq3-renderer-tr-shade-calc-runtime-ml-654365088"></a>
### RB_CalcScaleTexCoords

```ml
function RB_CalcScaleTexCoords(scale, coords)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scale` | `dynamic` | — |  |
| `coords` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L47)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcscrolltexcoords-function-rb-calcscrolltexcoords-speed-coords-shadertimeseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-565947428"></a>
### RB_CalcScrollTexCoords

```ml
function RB_CalcScrollTexCoords(speed, coords, shaderTimeSeconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `speed` | `dynamic` | — |  |
| `coords` | `dynamic` | — |  |
| `shaderTimeSeconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L48)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcspecularalpha-function-rb-calcspecularalpha-colors-positions-normals-vieworigin-src-mq3-renderer-tr-shade-calc-runtime-ml-323177251"></a>
### RB_CalcSpecularAlpha

```ml
function RB_CalcSpecularAlpha(colors, positions, normals, viewOrigin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `colors` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L127)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcstretchtexcoords-function-rb-calcstretchtexcoords-wave-coords-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-776576175"></a>
### RB_CalcStretchTexCoords

```ml
function RB_CalcStretchTexCoords(wave, coords, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — |  |
| `coords` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L43)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calctransformtexcoords-function-rb-calctransformtexcoords-matrix-translate-coords-src-mq3-renderer-tr-shade-calc-runtime-ml-17426145"></a>
### RB_CalcTransformTexCoords

```ml
function RB_CalcTransformTexCoords(matrix, translate, coords)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — |  |
| `translate` | `dynamic` | — |  |
| `coords` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L38)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcturbulenttexcoords-function-rb-calcturbulenttexcoords-wave-coords-positions-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-1207658845"></a>
### RB_CalcTurbulentTexCoords

```ml
function RB_CalcTurbulentTexCoords(wave, coords, positions, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — |  |
| `coords` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L56)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcwavealpha-function-rb-calcwavealpha-wave-colors-nowmilliseconds-src-mq3-renderer-tr-shade-calc-runtime-ml-381393261"></a>
### RB_CalcWaveAlpha

```ml
function RB_CalcWaveAlpha(wave, colors, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — |  |
| `colors` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L122)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-calcwavecolor-function-rb-calcwavecolor-wave-count-nowmilliseconds-identitylight-noise-src-mq3-renderer-tr-shade-calc-runtime-ml-305748448"></a>
### RB_CalcWaveColor

```ml
function RB_CalcWaveColor(wave, count, nowMilliseconds, identityLight, noise)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `wave` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `identityLight` | `dynamic` | — |  |
| `noise` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L118)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-rb-deformtessgeometry-function-rb-deformtessgeometry-deforms-positions-normals-coords-nowmilliseconds-noise-src-mq3-renderer-tr-shade-calc-runtime-ml-1411085296"></a>
### RB_DeformTessGeometry

```ml
function RB_DeformTessGeometry(deforms, positions, normals, coords, nowMilliseconds, noise)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deforms` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |
| `coords` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `noise` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L101)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-repeatcolor-function-repeatcolor-color-count-src-mq3-renderer-tr-shade-calc-runtime-ml-996173408"></a>
### repeatColor

```ml
function repeatColor(color, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L113)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-sinindex-function-sinindex-index-src-mq3-renderer-tr-shade-calc-runtime-ml-225198718"></a>
### sinIndex

```ml
function sinIndex(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L33)

<a id="function-function-mq3-renderer-tr-shade-calc-runtime-tableforfunc-function-tableforfunc-func-src-mq3-renderer-tr-shade-calc-runtime-ml-1592178404"></a>
### TableForFunc

```ml
function TableForFunc(func)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `func` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_calc_runtime.ml#L24)

- [mq3.renderer.tr_shade_calc_runtime.TextGeometry](Type-mq3-renderer-tr-shade-calc-runtime-textgeometry-970259013.md) — struct
