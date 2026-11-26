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

Builds `mq3.renderer.tga.Image` for `mq3.renderer.tga.decode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value forwarded as `data` to `mq3.renderer.tga.u16`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L65)

<a id="extern_function-extern-function-mq3-renderer-tga-decodepixels-extern-function-decodepixels-input-as-bytes-inputbytes-as-i32-offset-as-i32-width-as-i32-height-as-i32-pixelbytes-as-i32-rle-as-i32-output-as-bytes-outputbytes-as-i32-from-playable-window-dll-symbol-playable-decode-tga-pixels-returns-i32-src-mq3-renderer-tga-ml-612882663"></a>
### decodePixels

```ml
extern function decodePixels(input as bytes, inputBytes as i32, offset as i32, width as i32, height as i32, pixelBytes as i32, rle as i32, output as bytes, outputBytes as i32) from "playable_window.dll" symbol "playable_decode_tga_pixels" returns i32
```

Decodes bounded TGA pixel packets into RGBA output, including RLE and orientation handling.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `bytes` | — | Read-only encoded TGA image bytes. |
| `inputBytes` | `i32` | — | Encoded input-buffer length in bytes. |
| `offset` | `i32` | — | Byte offset where TGA pixel data begins. |
| `width` | `i32` | — | Width of the image, surface, or viewport in pixels. |
| `height` | `i32` | — | Height of the image, surface, or viewport in pixels. |
| `pixelBytes` | `i32` | — | Bytes per encoded source pixel. |
| `rle` | `i32` | — | Nonzero selects TGA run-length packet decoding. |
| `output` | `bytes` | — | Writable RGBA8 pixel buffer. |
| `outputBytes` | `i32` | — | Capacity of the native output buffer in bytes. |


**Returns:** 1 on success; negative codes identify invalid bounds, unsupported pixels, output overflow, or truncated packets.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L16)

<a id="function-function-mq3-renderer-tga-fail-function-fail-message-src-mq3-renderer-tga-ml-1950089021"></a>
### fail

```ml
function fail(message)
```

Creates error `7120` with message `"TGA: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7120,"TGA: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L43)

- [mq3.renderer.tga.Image](Type-mq3-renderer-tga-image-263142872.md) — struct
<a id="constant-constant-mq3-renderer-tga-max-dimension-const-max-dimension-16384-src-mq3-renderer-tga-ml-1075417403"></a>
### MAX_DIMENSION

```ml
const MAX_DIMENSION = 16384
```

Largest image width or height accepted by the decoder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L25)

<a id="constant-constant-mq3-renderer-tga-max-pixels-const-max-pixels-67108864-src-mq3-renderer-tga-ml-1060871855"></a>
### MAX_PIXELS

```ml
const MAX_PIXELS = 67108864
```

Maximum decoded pixel count accepted by the image loader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L27)

<a id="function-function-mq3-renderer-tga-pixelbytes-function-pixelbytes-pixelsize-src-mq3-renderer-tga-ml-975280331"></a>
### pixelBytes

```ml
function pixelBytes(pixelSize)
```

Returns `0` from `mq3.renderer.tga.pixelBytes`; earlier branches return `1`, `3`, `4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pixelSize` | `dynamic` | — | Input tested by `pixelSize==8`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L56)

<a id="constant-constant-mq3-renderer-tga-type-grayscale-const-type-grayscale-3-src-mq3-renderer-tga-ml-1643245032"></a>
### TYPE_GRAYSCALE

```ml
const TYPE_GRAYSCALE = 3
```

TGA image type for uncompressed grayscale pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L21)

<a id="constant-constant-mq3-renderer-tga-type-rle-truecolor-const-type-rle-truecolor-10-src-mq3-renderer-tga-ml-2044573066"></a>
### TYPE_RLE_TRUECOLOR

```ml
const TYPE_RLE_TRUECOLOR = 10
```

TGA image type for run-length-encoded true-color pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L23)

<a id="constant-constant-mq3-renderer-tga-type-truecolor-const-type-truecolor-2-src-mq3-renderer-tga-ml-1770216735"></a>
### TYPE_TRUECOLOR

```ml
const TYPE_TRUECOLOR = 2
```

TGA image type for uncompressed true-color pixels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L19)

<a id="function-function-mq3-renderer-tga-u16-function-u16-data-offset-src-mq3-renderer-tga-ml-87652243"></a>
### u16

```ml
function u16(data, offset)
```

Computes `data[offset]|(data[offset+1]<<8)` for `mq3.renderer.tga.u16`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Indexed input read at `offset`, `offset+1`. |
| `offset` | `dynamic` | — | Input used in the result expression `data[offset]\|(data[offset+1]<<8)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tga.ml#L50)
