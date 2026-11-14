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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_jpeg.ml#L14)

- [mq3.platform.playable_jpeg.Image](Type-mq3-platform-playable-jpeg-image-325562269.md) — struct
<a id="extern_function-extern-function-mq3-platform-playable-jpeg-jpegdecodenative-extern-function-jpegdecodenative-data-as-ptr-size-as-i32-rgba-as-ptr-capacity-as-i32-from-playable-window-dll-symbol-playable-window-decode-jpeg-returns-i32-src-mq3-platform-playable-jpeg-ml-8959649"></a>
### jpegDecodeNative

```ml
extern function jpegDecodeNative(data as ptr, size as i32, rgba as ptr, capacity as i32) from "playable_window.dll" symbol "playable_window_decode_jpeg" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `ptr` | — |  |
| `size` | `i32` | — |  |
| `rgba` | `ptr` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_jpeg.ml#L7)

<a id="extern_function-extern-function-mq3-platform-playable-jpeg-jpeginfonative-extern-function-jpeginfonative-data-as-ptr-size-as-i32-metadata-as-ptr-from-playable-window-dll-symbol-playable-window-jpeg-info-returns-i32-src-mq3-platform-playable-jpeg-ml-1615436334"></a>
### jpegInfoNative

```ml
extern function jpegInfoNative(data as ptr, size as i32, metadata as ptr) from "playable_window.dll" symbol "playable_window_jpeg_info" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `ptr` | — |  |
| `size` | `i32` | — |  |
| `metadata` | `ptr` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_jpeg.ml#L6)

<a id="constant-constant-mq3-platform-playable-jpeg-max-dimension-const-max-dimension-4096-src-mq3-platform-playable-jpeg-ml-1517182390"></a>
### MAX_DIMENSION

```ml
const MAX_DIMENSION = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_jpeg.ml#L9)

<a id="constant-constant-mq3-platform-playable-jpeg-max-pixels-const-max-pixels-16777216-src-mq3-platform-playable-jpeg-ml-1418335596"></a>
### MAX_PIXELS

```ml
const MAX_PIXELS = 16777216
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_jpeg.ml#L10)
