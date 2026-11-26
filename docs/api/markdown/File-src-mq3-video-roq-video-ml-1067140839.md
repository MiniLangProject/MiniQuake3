# `src/mq3/video/roq_video.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.video.roq_video`](Package-mq3-video-roq-video-1658780117.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/roq.ml` as `roq` → [src/mq3/format/roq.ml](File-src-mq3-format-roq-ml-406347091.md)

## Declarations

<a id="function-function-mq3-video-roq-video-build4-function-build4-a-b-c-d-src-mq3-video-roq-video-ml-971345120"></a>
### build4

```ml
function build4(a, b, c, d)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `d` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L24)

<a id="function-function-mq3-video-roq-video-build8-function-build8-a-b-c-d-src-mq3-video-roq-video-ml-314565088"></a>
### build8

```ml
function build8(a, b, c, d)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `d` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L27)

<a id="function-function-mq3-video-roq-video-clamp8-function-clamp8-value-src-mq3-video-roq-video-ml-1466038615"></a>
### clamp8

```ml
function clamp8(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L15)

<a id="function-function-mq3-video-roq-video-copymotion-function-copymotion-destination-previous-width-height-x-y-size-vector-xoff-yoff-src-mq3-video-roq-video-ml-1509893048"></a>
### copyMotion

```ml
function copyMotion(destination, previous, width, height, x, y, size, vector, xoff, yoff)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `vector` | `dynamic` | — |  |
| `xoff` | `dynamic` | — |  |
| `yoff` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L72)

<a id="function-function-mq3-video-roq-video-create-function-create-src-mq3-video-roq-video-ml-1684163808"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L14)

<a id="function-function-mq3-video-roq-video-decodecodebook-function-decodecodebook-decoder-movie-chunk-src-mq3-video-roq-video-ml-311185347"></a>
### decodeCodebook

```ml
function decodeCodebook(decoder, movie, chunk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — |  |
| `movie` | `dynamic` | — |  |
| `chunk` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L36)

- [mq3.video.roq_video.Decoder](Type-mq3-video-roq-video-decoder-838768531.md) — struct
<a id="function-function-mq3-video-roq-video-decodesmall-function-decodesmall-decoder-input-destination-previous-x-y-xoff-yoff-src-mq3-video-roq-video-ml-1344856687"></a>
### decodeSmall

```ml
function decodeSmall(decoder, input, destination, previous, x, y, xoff, yoff)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — |  |
| `input` | `dynamic` | — |  |
| `destination` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `xoff` | `dynamic` | — |  |
| `yoff` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L79)

<a id="function-function-mq3-video-roq-video-decodevq-function-decodevq-decoder-movie-chunk-src-mq3-video-roq-video-ml-1095389591"></a>
### decodeVq

```ml
function decodeVq(decoder, movie, chunk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — |  |
| `movie` | `dynamic` | — |  |
| `chunk` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L88)

<a id="function-function-mq3-video-roq-video-fail-function-fail-message-src-mq3-video-roq-video-ml-1131883573"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L13)

- [mq3.video.roq_video.Frame](Type-mq3-video-roq-video-frame-123206610.md) — struct
<a id="constant-constant-mq3-video-roq-video-max-dimension-const-max-dimension-1024-src-mq3-video-roq-video-ml-658582580"></a>
### MAX_DIMENSION

```ml
const MAX_DIMENSION = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L8)

<a id="function-function-mq3-video-roq-video-nextbyte-function-nextbyte-value-src-mq3-video-roq-video-ml-2034662247"></a>
### nextByte

```ml
function nextByte(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L64)

<a id="function-function-mq3-video-roq-video-nextcode-function-nextcode-value-src-mq3-video-roq-video-ml-454321763"></a>
### nextCode

```ml
function nextCode(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L60)

<a id="function-function-mq3-video-roq-video-pixelcopy-function-pixelcopy-value-src-mq3-video-roq-video-ml-1784864737"></a>
### pixelCopy

```ml
function pixelCopy(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L22)

<a id="function-function-mq3-video-roq-video-process-function-process-decoder-movie-chunk-src-mq3-video-roq-video-ml-820925265"></a>
### process

```ml
function process(decoder, movie, chunk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — |  |
| `movie` | `dynamic` | — |  |
| `chunk` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L111)

<a id="function-function-mq3-video-roq-video-reader-function-reader-data-offset-size-src-mq3-video-roq-video-ml-1295369714"></a>
### reader

```ml
function reader(data, offset, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L59)

- [mq3.video.roq_video.Reader](Type-mq3-video-roq-video-reader-1755394874.md) — struct
<a id="function-function-mq3-video-roq-video-setinfo-function-setinfo-decoder-movie-chunk-src-mq3-video-roq-video-ml-1935696971"></a>
### setInfo

```ml
function setInfo(decoder, movie, chunk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — |  |
| `movie` | `dynamic` | — |  |
| `chunk` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L52)

<a id="function-function-mq3-video-roq-video-writeblock-function-writeblock-buffer-width-height-x-y-size-pixels-src-mq3-video-roq-video-ml-76671456"></a>
### writeBlock

```ml
function writeBlock(buffer, width, height, x, y, size, pixels)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `pixels` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L66)

<a id="function-function-mq3-video-roq-video-yuv-function-yuv-y-u-v-src-mq3-video-roq-video-ml-503766102"></a>
### yuv

```ml
function yuv(y, u, v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `dynamic` | — |  |
| `u` | `dynamic` | — |  |
| `v` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L16)
