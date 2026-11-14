# `src/mq3/renderer/image_processing.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.image_processing`](Package-mq3-renderer-image-processing-1482753860.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-renderer-image-processing-checkedpixels-function-checkedpixels-pixels-width-height-src-mq3-renderer-image-processing-ml-1817888380"></a>
### checkedPixels

```ml
function checkedPixels(pixels, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_processing.ml#L13)

<a id="function-function-mq3-renderer-image-processing-copypixels-function-copypixels-pixels-count-src-mq3-renderer-image-processing-ml-163311812"></a>
### copyPixels

```ml
function copyPixels(pixels, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_processing.ml#L21)

<a id="function-function-mq3-renderer-image-processing-fail-function-fail-message-src-mq3-renderer-image-processing-ml-2100642975"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_processing.ml#L9)

<a id="function-function-mq3-renderer-image-processing-ispoweroftwo-function-ispoweroftwo-value-src-mq3-renderer-image-processing-ml-772254649"></a>
### isPowerOfTwo

```ml
function isPowerOfTwo(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_processing.ml#L98)

<a id="function-function-mq3-renderer-image-processing-lightscale-function-lightscale-pixels-width-height-onlygamma-devicesupportsgamma-gammatable-intensitytable-src-mq3-renderer-image-processing-ml-338221746"></a>
### lightScale

```ml
function lightScale(pixels, width, height, onlyGamma, deviceSupportsGamma, gammaTable, intensityTable)
```

R_LightScaleTexture with tables supplied by the renderer color-mapping owner.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `onlyGamma` | `dynamic` | — |  |
| `deviceSupportsGamma` | `dynamic` | — |  |
| `gammaTable` | `dynamic` | — |  |
| `intensityTable` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_processing.ml#L53)

<a id="constant-constant-mq3-renderer-image-processing-max-resample-width-const-max-resample-width-2048-src-mq3-renderer-image-processing-ml-1423819327"></a>
### MAX_RESAMPLE_WIDTH

```ml
const MAX_RESAMPLE_WIDTH = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_processing.ml#L7)

<a id="function-function-mq3-renderer-image-processing-mipmapfiltered-function-mipmapfiltered-pixels-width-height-src-mq3-renderer-image-processing-ml-317123300"></a>
### mipMapFiltered

```ml
function mipMapFiltered(pixels, width, height)
```

Proper linear R_MipMap2 filter with the original power-of-two wrapping masks.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_processing.ml#L103)

<a id="function-function-mq3-renderer-image-processing-mipmapsimple-function-mipmapsimple-pixels-width-height-src-mq3-renderer-image-processing-ml-1397981732"></a>
### mipMapSimple

```ml
function mipMapSimple(pixels, width, height)
```

Simple R_MipMap path. The one-dimensional case follows its adjacent-pixel rule.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_processing.ml#L74)

<a id="function-function-mq3-renderer-image-processing-resample-function-resample-pixels-inwidth-inheight-outwidth-outheight-src-mq3-renderer-image-processing-ml-879919253"></a>
### resample

```ml
function resample(pixels, inWidth, inHeight, outWidth, outHeight)
```

Exact fixed-point sample positions and four-tap average from ResampleTexture.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — |  |
| `inWidth` | `dynamic` | — |  |
| `inHeight` | `dynamic` | — |  |
| `outWidth` | `dynamic` | — |  |
| `outHeight` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/image_processing.ml#L28)
