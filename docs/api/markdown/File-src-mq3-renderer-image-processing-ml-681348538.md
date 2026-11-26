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

Validates positive RGBA image dimensions, overflow limits, and the available pixel-buffer length.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — | Input tested by `pixels==void`. |
| `width` | `dynamic` | — | Input tested by `width<1 or height<1`. |
| `height` | `dynamic` | — | Input tested by `width<1 or height<1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_processing.ml#L19)

<a id="function-function-mq3-renderer-image-processing-copypixels-function-copypixels-pixels-count-src-mq3-renderer-image-processing-ml-163311812"></a>
### copyPixels

```ml
function copyPixels(pixels, count)
```

Builds `output[i]` in `mq3.renderer.image_processing.copyPixels`; returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — | Indexed input read at `i`. |
| `count` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_processing.ml#L30)

<a id="function-function-mq3-renderer-image-processing-fail-function-fail-message-src-mq3-renderer-image-processing-ml-2100642975"></a>
### fail

```ml
function fail(message)
```

Creates error `7160` with message `"image processing: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7160,"image processing: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_processing.ml#L11)

<a id="function-function-mq3-renderer-image-processing-ispoweroftwo-function-ispoweroftwo-value-src-mq3-renderer-image-processing-ml-772254649"></a>
### isPowerOfTwo

```ml
function isPowerOfTwo(value)
```

Computes `value>0 and (value&(value-1))==0` for `mq3.renderer.image_processing.isPowerOfTwo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value>0 and (value&(value-1))==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_processing.ml#L124)

<a id="function-function-mq3-renderer-image-processing-lightscale-function-lightscale-pixels-width-height-onlygamma-devicesupportsgamma-gammatable-intensitytable-src-mq3-renderer-image-processing-ml-338221746"></a>
### lightScale

```ml
function lightScale(pixels, width, height, onlyGamma, deviceSupportsGamma, gammaTable, intensityTable)
```

R_LightScaleTexture with tables supplied by the renderer color-mapping owner.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — | Value forwarded as `pixels` to `mq3.renderer.image_processing.checkedPixels`. |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.renderer.image_processing.checkedPixels`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.renderer.image_processing.checkedPixels`. |
| `onlyGamma` | `dynamic` | — | Input tested by `onlyGamma`. |
| `deviceSupportsGamma` | `dynamic` | — | Input tested by `not deviceSupportsGamma`. |
| `gammaTable` | `dynamic` | — | Indexed input read at `value`. |
| `intensityTable` | `dynamic` | — | Indexed input read at `value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_processing.ml#L74)

<a id="constant-constant-mq3-renderer-image-processing-max-resample-width-const-max-resample-width-2048-src-mq3-renderer-image-processing-ml-1423819327"></a>
### MAX_RESAMPLE_WIDTH

```ml
const MAX_RESAMPLE_WIDTH = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_processing.ml#L7)

<a id="function-function-mq3-renderer-image-processing-mipmapfiltered-function-mipmapfiltered-pixels-width-height-src-mq3-renderer-image-processing-ml-317123300"></a>
### mipMapFiltered

```ml
function mipMapFiltered(pixels, width, height)
```

Proper linear R_MipMap2 filter with the original power-of-two wrapping masks.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — | Value forwarded as `pixels` to `mq3.renderer.image_processing.checkedPixels`. |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.renderer.image_processing.checkedPixels`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.renderer.image_processing.checkedPixels`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_processing.ml#L132)

<a id="function-function-mq3-renderer-image-processing-mipmapsimple-function-mipmapsimple-pixels-width-height-src-mq3-renderer-image-processing-ml-1397981732"></a>
### mipMapSimple

```ml
function mipMapSimple(pixels, width, height)
```

Simple R_MipMap path. The one-dimensional case follows its adjacent-pixel rule.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — | Value forwarded as `pixels` to `mq3.renderer.image_processing.checkedPixels`. |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.renderer.image_processing.checkedPixels`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.renderer.image_processing.checkedPixels`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_processing.ml#L98)

<a id="function-function-mq3-renderer-image-processing-resample-function-resample-pixels-inwidth-inheight-outwidth-outheight-src-mq3-renderer-image-processing-ml-879919253"></a>
### resample

```ml
function resample(pixels, inWidth, inHeight, outWidth, outHeight)
```

Exact fixed-point sample positions and four-tap average from ResampleTexture.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixels` | `dynamic` | — | Value forwarded as `pixels` to `mq3.renderer.image_processing.checkedPixels`. |
| `inWidth` | `dynamic` | — | Value forwarded as `width` to `mq3.renderer.image_processing.checkedPixels`. |
| `inHeight` | `dynamic` | — | Value forwarded as `height` to `mq3.renderer.image_processing.checkedPixels`. |
| `outWidth` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.quotient`. |
| `outHeight` | `dynamic` | — | Input tested by `outWidth<1 or outHeight<1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/image_processing.ml#L42)
