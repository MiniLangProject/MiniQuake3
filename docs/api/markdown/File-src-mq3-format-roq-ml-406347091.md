# `src/mq3/format/roq.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.format.roq`](Package-mq3-format-roq-1698643957.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

- [mq3.format.roq.Audio](Type-mq3-format-roq-audio-1204963077.md) — struct
- [mq3.format.roq.Chunk](Type-mq3-format-roq-chunk-367249750.md) — struct
<a id="constant-constant-mq3-format-roq-codebook-const-codebook-4098-src-mq3-format-roq-ml-365078470"></a>
### CODEBOOK

```ml
const CODEBOOK = 4098
```

RoQ chunk identifier for a vector-quantization codebook update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L13)

<a id="function-function-mq3-format-roq-decodeaudio-function-decodeaudio-movie-chunk-src-mq3-format-roq-ml-380421369"></a>
### decodeAudio

```ml
function decodeAudio(movie, chunk)
```

Decode audio in format.roq; the normal completion returns `fail("unsupported audio chunk")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `movie` | `dynamic` | — | Movie passed as `movie` to `mq3.format.roq.decodeMono`. |
| `chunk` | `dynamic` | — | Record exposing `id`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L139)

<a id="function-function-mq3-format-roq-decodemono-function-decodemono-movie-chunk-src-mq3-format-roq-ml-1989606441"></a>
### decodeMono

```ml
function decodeMono(movie, chunk)
```

Decode mono in format.roq; the normal completion returns `Audio(output, chunk.size, 22050, 2, 16, 4)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `movie` | `dynamic` | — | Record exposing `data`. |
| `chunk` | `dynamic` | — | Record exposing `id`, `size`, `flags`, `dataOffset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L116)

<a id="function-function-mq3-format-roq-decodestereo-function-decodestereo-movie-chunk-src-mq3-format-roq-ml-1782604073"></a>
### decodeStereo

```ml
function decodeStereo(movie, chunk)
```

Decode stereo in format.roq; the normal completion returns `Audio(output, frame, 22050, 2, 16, 4)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `movie` | `dynamic` | — | Record exposing `data`. |
| `chunk` | `dynamic` | — | Record exposing `id`, `size`, `flags`, `dataOffset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L126)

<a id="function-function-mq3-format-roq-fail-function-fail-message-src-mq3-format-roq-ml-584879005"></a>
### fail

```ml
function fail(message)
```

Create the format.roq error for `fail` with 7690 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("RoQ: " + message)` and `error(7690, ("RoQ: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L71)

<a id="constant-constant-mq3-format-roq-magic-const-magic-4228-src-mq3-format-roq-ml-1088040373"></a>
### MAGIC

```ml
const MAGIC = 4228
```

RoQ file signature identifying the video stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L9)

<a id="constant-constant-mq3-format-roq-max-chunk-size-const-max-chunk-size-65536-src-mq3-format-roq-ml-1153367564"></a>
### MAX_CHUNK_SIZE

```ml
const MAX_CHUNK_SIZE = 65536
```

Maximum payload size accepted for one RoQ video or audio chunk, in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L27)

- [mq3.format.roq.Movie](Type-mq3-format-roq-movie-1562250259.md) — struct
<a id="constant-constant-mq3-format-roq-packet-const-packet-4144-src-mq3-format-roq-ml-1595011236"></a>
### PACKET

```ml
const PACKET = 4144
```

RoQ chunk identifier for an embedded packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L21)

<a id="function-function-mq3-format-roq-parse-function-parse-data-src-mq3-format-roq-ml-562656476"></a>
### parse

```ml
function parse(data)
```

Parse roq in format.roq; the normal completion returns `Movie(data, fps, chunks.toArray(), videoFrames, audioChunks)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.format.roq.u16`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L83)

<a id="constant-constant-mq3-format-roq-quad-hang-const-quad-hang-4115-src-mq3-format-roq-ml-1832401368"></a>
### QUAD_HANG

```ml
const QUAD_HANG = 4115
```

RoQ chunk identifier that holds the previous video frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L19)

<a id="constant-constant-mq3-format-roq-quad-info-const-quad-info-4097-src-mq3-format-roq-ml-799087421"></a>
### QUAD_INFO

```ml
const QUAD_INFO = 4097
```

RoQ chunk identifier declaring video-frame dimensions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L11)

<a id="constant-constant-mq3-format-roq-quad-jpeg-const-quad-jpeg-4114-src-mq3-format-roq-ml-1719159047"></a>
### QUAD_JPEG

```ml
const QUAD_JPEG = 4114
```

RoQ chunk identifier for a JPEG-compressed image.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L17)

<a id="constant-constant-mq3-format-roq-quad-vq-const-quad-vq-4113-src-mq3-format-roq-ml-1800191830"></a>
### QUAD_VQ

```ml
const QUAD_VQ = 4113
```

RoQ chunk identifier for a vector-quantized video frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L15)

<a id="function-function-mq3-format-roq-signed16-function-signed16-value-src-mq3-format-roq-ml-1738377939"></a>
### signed16

```ml
function signed16(value)
```

Compute signed 16 in format.roq; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value & 65535)` and `(value - 65536)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L101)

<a id="constant-constant-mq3-format-roq-sound-mono-const-sound-mono-4128-src-mq3-format-roq-ml-1450905832"></a>
### SOUND_MONO

```ml
const SOUND_MONO = 4128
```

RoQ chunk identifier for mono differential-PCM audio.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L23)

<a id="constant-constant-mq3-format-roq-sound-stereo-const-sound-stereo-4129-src-mq3-format-roq-ml-412989333"></a>
### SOUND_STEREO

```ml
const SOUND_STEREO = 4129
```

RoQ chunk identifier for stereo differential-PCM audio.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L25)

<a id="function-function-mq3-format-roq-squaredelta-function-squaredelta-value-src-mq3-format-roq-ml-133476865"></a>
### squareDelta

```ml
function squareDelta(value)
```

Compute square delta in format.roq; the normal completion returns `(0 - (value * value))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value < 128)` and `(value - 128)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L104)

<a id="function-function-mq3-format-roq-u16-function-u16-data-offset-src-mq3-format-roq-ml-2050424931"></a>
### u16

```ml
function u16(data, offset)
```

Compute u 16 in format.roq; the normal completion returns `(data[offset] | (data[(offset + 1)] << 8))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L75)

<a id="function-function-mq3-format-roq-u32-function-u32-data-offset-src-mq3-format-roq-ml-46783947"></a>
### u32

```ml
function u32(data, offset)
```

Compute u 32 in format.roq; the normal completion returns `(((data[offset] | (data[(offset + 1)] << 8)) | (data[(offset + 2)] << 16)) | (data[(offset + 3)] << 24))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L79)

<a id="function-function-mq3-format-roq-write16-function-write16-output-offset-value-src-mq3-format-roq-ml-221044141"></a>
### write16

```ml
function write16(output, offset, value)
```

Write 16 in format.roq; updates `output entries`.

Direct state writes: `output elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable sequence written at `offset`, `(offset + 1)`. |
| `offset` | `dynamic` | — | Offset used in `(offset + 1)`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.format.roq.signed16`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/roq.ml#L111)
