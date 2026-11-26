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

Compute video.roq_video.build4 as `[a[0], a[1], b[0], b[1], a[2], a[3], b[2], b[3], c[0], c[1], d[0], d[1], c[2], c[3], d[2], d[3]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[0]` and `a[1]`. |
| `b` | `dynamic` | — | B used in `b[0]` and `b[1]`. |
| `c` | `dynamic` | — | C used in `c[0]` and `c[1]`. |
| `d` | `dynamic` | — | D used in `d[0]` and `d[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L81)

<a id="function-function-mq3-video-roq-video-build8-function-build8-a-b-c-d-src-mq3-video-roq-video-ml-314565088"></a>
### build8

```ml
function build8(a, b, c, d)
```

Build 8 in video.roq_video; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A operand used by `build8`; its reads are shown in the implementation. |
| `b` | `dynamic` | — | B operand used by `build8`; its reads are shown in the implementation. |
| `c` | `dynamic` | — | C operand used by `build8`; its reads are shown in the implementation. |
| `d` | `dynamic` | — | D operand used by `build8`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L89)

<a id="function-function-mq3-video-roq-video-clamp8-function-clamp8-value-src-mq3-video-roq-video-ml-1466038615"></a>
### clamp8

```ml
function clamp8(value)
```

Clamp 8 in video.roq_video; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value < 0)` and `(value > 255)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L61)

<a id="function-function-mq3-video-roq-video-copymotion-function-copymotion-destination-previous-width-height-x-y-size-vector-xoff-yoff-src-mq3-video-roq-video-ml-1509893048"></a>
### copyMotion

```ml
function copyMotion(destination, previous, width, height, x, y, size, vector, xoff, yoff)
```

Copy motion in video.roq_video; updates `destination entries`.

Direct state writes: `destination elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Mutable sequence written at `(target + channel)`. |
| `previous` | `dynamic` | — | Previous used in `previous[(source + channel)]` and `fail("motion vector outside previous frame")`. |
| `width` | `dynamic` | — | Width used in `((y + row) * width)` and `((sourceY + row) * width)`. |
| `height` | `dynamic` | — | Height used in `((sourceY + size) > height)` and `((((sourceX < 0) or (sourceY < 0)) or ((sourceX + size) > width)) or ((sourceY + size) > height))`. |
| `x` | `dynamic` | — | X used in `(x + dx)` and `(((y + row) * width) + x)`. |
| `y` | `dynamic` | — | Y used in `(y + dy)` and `(y + row)`. |
| `size` | `dynamic` | — | Size used in `(size - 1)` and `(sourceX + size)`. |
| `vector` | `dynamic` | — | Vector used in `(vector >> 4)` and `(vector & 15)`. |
| `xoff` | `dynamic` | — | Xoff used in `((8 - ((vector >> 4) & 15)) - xoff)`. |
| `yoff` | `dynamic` | — | Yoff used in `((8 - (vector & 15)) - yoff)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L179)

<a id="function-function-mq3-video-roq-video-create-function-create-src-mq3-video-roq-video-ml-1684163808"></a>
### create

```ml
function create()
```

Create `mq3.video.roq_video.Decoder` with width=0; height=0; q2=array(256, void); q4=array(256, void); q8=array(256, void); buffers=[void, void]; frameCount=0; latest=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L58)

<a id="function-function-mq3-video-roq-video-decodecodebook-function-decodecodebook-decoder-movie-chunk-src-mq3-video-roq-video-ml-311185347"></a>
### decodeCodebook

```ml
function decodeCodebook(decoder, movie, chunk)
```

Decode codebook in video.roq_video; the normal completion returns `(two + four)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — | Record exposing `q2`, `q4`, `q8`. |
| `movie` | `dynamic` | — | Record exposing `data`. |
| `chunk` | `dynamic` | — | Record exposing `flags`, `size`, `dataOffset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L102)

- [mq3.video.roq_video.Decoder](Type-mq3-video-roq-video-decoder-838768531.md) — struct
<a id="function-function-mq3-video-roq-video-decodesmall-function-decodesmall-decoder-input-destination-previous-x-y-xoff-yoff-src-mq3-video-roq-video-ml-1344856687"></a>
### decodeSmall

```ml
function decodeSmall(decoder, input, destination, previous, x, y, xoff, yoff)
```

Decode small in video.roq_video.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — | Record exposing `width`, `height`, `q4`, `q2`. |
| `input` | `dynamic` | — | Value passed as `value` to `mq3.video.roq_video.nextCode`. |
| `destination` | `dynamic` | — | Destination passed as `destination` to `mq3.video.roq_video.copyMotion`. |
| `previous` | `dynamic` | — | Previous passed as `previous` to `mq3.video.roq_video.copyMotion`. |
| `x` | `dynamic` | — | X passed as `x` to `mq3.video.roq_video.copyMotion`. |
| `y` | `dynamic` | — | Y passed as `y` to `mq3.video.roq_video.copyMotion`. |
| `xoff` | `dynamic` | — | Xoff passed as `xoff` to `mq3.video.roq_video.copyMotion`. |
| `yoff` | `dynamic` | — | Yoff passed as `yoff` to `mq3.video.roq_video.copyMotion`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L195)

<a id="function-function-mq3-video-roq-video-decodevq-function-decodevq-decoder-movie-chunk-src-mq3-video-roq-video-ml-1095389591"></a>
### decodeVq

```ml
function decodeVq(decoder, movie, chunk)
```

Decode vq in video.roq_video; the normal completion returns `decoder.latest`.

Direct state writes: `decoder.frameCount`, `decoder.latest`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — | Record exposing `width`, `buffers`, `frameCount`, `height`, `q8`, `latest`. Updated in place: `frameCount`, `latest`. |
| `movie` | `dynamic` | — | Record exposing `data`. |
| `chunk` | `dynamic` | — | Record exposing `dataOffset`, `size`, `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L210)

<a id="function-function-mq3-video-roq-video-fail-function-fail-message-src-mq3-video-roq-video-ml-1131883573"></a>
### fail

```ml
function fail(message)
```

Create the video.roq_video error for `fail` with 7691 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("RoQ video: " + message)` and `error(7691, ("RoQ video: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L56)

- [mq3.video.roq_video.Frame](Type-mq3-video-roq-video-frame-123206610.md) — struct
<a id="constant-constant-mq3-video-roq-video-max-dimension-const-max-dimension-1024-src-mq3-video-roq-video-ml-658582580"></a>
### MAX_DIMENSION

```ml
const MAX_DIMENSION = 1024
```

Upper bound on dimension represented by mq3.video.roq_video.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L9)

<a id="function-function-mq3-video-roq-video-nextbyte-function-nextbyte-value-src-mq3-video-roq-video-ml-2034662247"></a>
### nextByte

```ml
function nextByte(value)
```

Update `value.offset` in video.roq_video; the normal completion returns `result`.

Direct state writes: `value.offset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `offset`, `limit`, `data`. Updated in place: `offset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L148)

<a id="function-function-mq3-video-roq-video-nextcode-function-nextcode-value-src-mq3-video-roq-video-ml-454321763"></a>
### nextCode

```ml
function nextCode(value)
```

Update `value.control`, `value.offset`, `value.remaining` in video.roq_video; the normal completion returns `code`.

Direct state writes: `value.control`, `value.offset`, `value.remaining`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `remaining`, `offset`, `limit`, `data`, `control`. Updated in place: `control`, `offset`, `remaining`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L140)

<a id="function-function-mq3-video-roq-video-pixelcopy-function-pixelcopy-value-src-mq3-video-roq-video-ml-1784864737"></a>
### pixelCopy

```ml
function pixelCopy(value)
```

Compute video.roq_video.pixelCopy as `[value[0], value[1], value[2], value[3]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `value[0]` and `value[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L74)

<a id="function-function-mq3-video-roq-video-process-function-process-decoder-movie-chunk-src-mq3-video-roq-video-ml-820925265"></a>
### process

```ml
function process(decoder, movie, chunk)
```

Process roq video in video.roq_video.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — | Decoder passed as `decoder` to `mq3.video.roq_video.setInfo`. |
| `movie` | `dynamic` | — | Movie passed as `movie` to `mq3.video.roq_video.setInfo`. |
| `chunk` | `dynamic` | — | Record exposing `id`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L237)

<a id="function-function-mq3-video-roq-video-reader-function-reader-data-offset-size-src-mq3-video-roq-video-ml-1295369714"></a>
### reader

```ml
function reader(data, offset, size)
```

Create `mq3.video.roq_video.Reader` with data=data; offset=offset; limit=(offset + size); control=0; remaining=0.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Initial `data` field stored in the returned or constructed `mq3.video.roq_video.Reader` record. |
| `offset` | `dynamic` | — | Initial `offset` field stored in the returned or constructed `mq3.video.roq_video.Reader` record. |
| `size` | `dynamic` | — | Size used in `(offset + size)` and `Reader(data, offset, (offset + size), 0, 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L135)

- [mq3.video.roq_video.Reader](Type-mq3-video-roq-video-reader-1755394874.md) — struct
<a id="function-function-mq3-video-roq-video-setinfo-function-setinfo-decoder-movie-chunk-src-mq3-video-roq-video-ml-1935696971"></a>
### setInfo

```ml
function setInfo(decoder, movie, chunk)
```

Set info in video.roq_video; the normal completion returns `[width, height]`.

Direct state writes: `decoder.width`, `decoder.height`, `decoder.buffers`, `decoder.frameCount`, `decoder.latest`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `decoder` | `dynamic` | — | Updated in place: `width`, `height`, `buffers`, `frameCount`, `latest`. |
| `movie` | `dynamic` | — | Record exposing `data`. |
| `chunk` | `dynamic` | — | Record exposing `size`, `dataOffset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L124)

<a id="function-function-mq3-video-roq-video-writeblock-function-writeblock-buffer-width-height-x-y-size-pixels-src-mq3-video-roq-video-ml-76671456"></a>
### writeBlock

```ml
function writeBlock(buffer, width, height, x, y, size, pixels)
```

Write block in video.roq_video; updates `buffer entries`.

Direct state writes: `buffer elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — | Mutable sequence written at `at`, `(at + 1)`, `(at + 2)`. |
| `width` | `dynamic` | — | Width used in `((y + row) * width)` and `((x + size) > width)`. |
| `height` | `dynamic` | — | Height used in `((y + size) > height)` and `((((x < 0) or (y < 0)) or ((x + size) > width)) or ((y + size) > height))`. |
| `x` | `dynamic` | — | X used in `(x < 0)` and `(x + size)`. |
| `y` | `dynamic` | — | Y used in `(y < 0)` and `(y + row)`. |
| `size` | `dynamic` | — | Size used in `(x + size)` and `(y + size)`. |
| `pixels` | `dynamic` | — | Pixels used in `len(pixels)` and `(pixels == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L160)

<a id="function-function-mq3-video-roq-video-yuv-function-yuv-y-u-v-src-mq3-video-roq-video-ml-503766102"></a>
### yuv

```ml
function yuv(y, u, v)
```

Compute yuv in video.roq_video; the normal completion returns `[clamp8(((yy + vr) >> 6)), clamp8((((yy + ug) + vg) >> 6)), clamp8(((yy + ub) >> 6)), 255]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `dynamic` | — | Y used in `(y << 6)` and `(y >> 2)`. |
| `u` | `dynamic` | — | U used in `(2 * u)` and `((2 * u) - 255)`. |
| `v` | `dynamic` | — | V used in `(2 * v)` and `((2 * v) - 255)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/video/roq_video.ml#L66)
