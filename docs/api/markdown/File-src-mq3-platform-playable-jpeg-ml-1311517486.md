# `src/mq3/platform/playable_jpeg.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.playable_jpeg`](Package-mq3-platform-playable-jpeg-1555080142.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-platform-playable-jpeg-decode-function-decode-data-src-mq3-platform-playable-jpeg-ml-2730442"></a>
### decode

```ml
function decode(data)
```

Builds `mq3.platform.playable_jpeg.Image` for `mq3.platform.playable_jpeg.decode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Input tested by `data==void or typeof(data)!="bytes" or len(data)<4`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_jpeg.ml#L28)

- [mq3.platform.playable_jpeg.Image](Type-mq3-platform-playable-jpeg-image-325562269.md) — struct
<a id="extern_function-extern-function-mq3-platform-playable-jpeg-jpegdecodenative-extern-function-jpegdecodenative-data-as-ptr-size-as-i32-rgba-as-ptr-capacity-as-i32-from-playable-window-dll-symbol-playable-window-decode-jpeg-returns-i32-src-mq3-platform-playable-jpeg-ml-8959649"></a>
### jpegDecodeNative

```ml
extern function jpegDecodeNative(data as ptr, size as i32, rgba as ptr, capacity as i32) from "playable_window.dll" symbol "playable_window_decode_jpeg" returns i32
```

Decodes JPEG input into caller-owned RGBA pixel storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `ptr` | — | Read-only encoded JPEG bytes. |
| `size` | `i32` | — | Encoded JPEG length in bytes. |
| `rgba` | `ptr` | — | Writable destination for decoded RGBA pixels. |
| `capacity` | `i32` | — | Capacity of the RGBA destination in bytes. |


**Returns:** 1 on successful decoding; 0 on invalid input, insufficient storage, or decoder failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_jpeg.ml#L18)

<a id="extern_function-extern-function-mq3-platform-playable-jpeg-jpeginfonative-extern-function-jpeginfonative-data-as-ptr-size-as-i32-metadata-as-ptr-from-playable-window-dll-symbol-playable-window-jpeg-info-returns-i32-src-mq3-platform-playable-jpeg-ml-1615436334"></a>
### jpegInfoNative

```ml
extern function jpegInfoNative(data as ptr, size as i32, metadata as ptr) from "playable_window.dll" symbol "playable_window_jpeg_info" returns i32
```

Reads JPEG dimensions through the native WIC decoder.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `ptr` | — | Read-only encoded JPEG bytes. |
| `size` | `i32` | — | Encoded JPEG length in bytes. |
| `metadata` | `ptr` | — | Writable eight-byte buffer receiving little-endian 32-bit width and height. |


**Returns:** 1 when width and height are written; 0 when the image or output is invalid.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_jpeg.ml#L11)

<a id="constant-constant-mq3-platform-playable-jpeg-max-dimension-const-max-dimension-4096-src-mq3-platform-playable-jpeg-ml-1517182390"></a>
### MAX_DIMENSION

```ml
const MAX_DIMENSION = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_jpeg.ml#L20)

<a id="constant-constant-mq3-platform-playable-jpeg-max-pixels-const-max-pixels-16777216-src-mq3-platform-playable-jpeg-ml-1418335596"></a>
### MAX_PIXELS

```ml
const MAX_PIXELS = 16777216
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_jpeg.ml#L21)
