# `src/mq3/renderer/tga.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tga`](Package-mq3-renderer-tga-1586292799.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-renderer-tga-decode-function-decode-data-src-mq3-renderer-tga-ml-603447122"></a>
### decode

```ml
function decode(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L30)

<a id="extern_function-extern-function-mq3-renderer-tga-decodepixels-extern-function-decodepixels-input-as-bytes-inputbytes-as-i32-offset-as-i32-width-as-i32-height-as-i32-pixelbytes-as-i32-rle-as-i32-output-as-bytes-outputbytes-as-i32-from-playable-window-dll-symbol-playable-decode-tga-pixels-returns-i32-src-mq3-renderer-tga-ml-612882663"></a>
### decodePixels

```ml
extern function decodePixels(input as bytes, inputBytes as i32, offset as i32, width as i32, height as i32, pixelBytes as i32, rle as i32, output as bytes, outputBytes as i32) from "playable_window.dll" symbol "playable_decode_tga_pixels" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `bytes` | — |  |
| `inputBytes` | `i32` | — |  |
| `offset` | `i32` | — |  |
| `width` | `i32` | — |  |
| `height` | `i32` | — |  |
| `pixelBytes` | `i32` | — |  |
| `rle` | `i32` | — |  |
| `output` | `bytes` | — |  |
| `outputBytes` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L5)

<a id="function-function-mq3-renderer-tga-fail-function-fail-message-src-mq3-renderer-tga-ml-1950089021"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L15)

- [mq3.renderer.tga.Image](Type-mq3-renderer-tga-image-263142872.md) — struct
<a id="constant-constant-mq3-renderer-tga-max-dimension-const-max-dimension-16384-src-mq3-renderer-tga-ml-1075417403"></a>
### MAX_DIMENSION

```ml
const MAX_DIMENSION = 16384
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L10)

<a id="constant-constant-mq3-renderer-tga-max-pixels-const-max-pixels-67108864-src-mq3-renderer-tga-ml-1060871855"></a>
### MAX_PIXELS

```ml
const MAX_PIXELS = 67108864
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L11)

<a id="function-function-mq3-renderer-tga-pixelbytes-function-pixelbytes-pixelsize-src-mq3-renderer-tga-ml-975280331"></a>
### pixelBytes

```ml
function pixelBytes(pixelSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixelSize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L23)

<a id="constant-constant-mq3-renderer-tga-type-grayscale-const-type-grayscale-3-src-mq3-renderer-tga-ml-1643245032"></a>
### TYPE_GRAYSCALE

```ml
const TYPE_GRAYSCALE = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L8)

<a id="constant-constant-mq3-renderer-tga-type-rle-truecolor-const-type-rle-truecolor-10-src-mq3-renderer-tga-ml-2044573066"></a>
### TYPE_RLE_TRUECOLOR

```ml
const TYPE_RLE_TRUECOLOR = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L9)

<a id="constant-constant-mq3-renderer-tga-type-truecolor-const-type-truecolor-2-src-mq3-renderer-tga-ml-1770216735"></a>
### TYPE_TRUECOLOR

```ml
const TYPE_TRUECOLOR = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L7)

<a id="function-function-mq3-renderer-tga-u16-function-u16-data-offset-src-mq3-renderer-tga-ml-87652243"></a>
### u16

```ml
function u16(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L19)
