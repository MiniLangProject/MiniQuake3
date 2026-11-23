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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L10)

<a id="function-function-mq3-format-roq-decodeaudio-function-decodeaudio-movie-chunk-src-mq3-format-roq-ml-380421369"></a>
### decodeAudio

```ml
function decodeAudio(movie, chunk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `movie` | `dynamic` | — |  |
| `chunk` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L64)

<a id="function-function-mq3-format-roq-decodemono-function-decodemono-movie-chunk-src-mq3-format-roq-ml-1989606441"></a>
### decodeMono

```ml
function decodeMono(movie, chunk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `movie` | `dynamic` | — |  |
| `chunk` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L47)

<a id="function-function-mq3-format-roq-decodestereo-function-decodestereo-movie-chunk-src-mq3-format-roq-ml-1782604073"></a>
### decodeStereo

```ml
function decodeStereo(movie, chunk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `movie` | `dynamic` | — |  |
| `chunk` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L54)

<a id="function-function-mq3-format-roq-fail-function-fail-message-src-mq3-format-roq-ml-584879005"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L23)

<a id="constant-constant-mq3-format-roq-magic-const-magic-4228-src-mq3-format-roq-ml-1088040373"></a>
### MAGIC

```ml
const MAGIC = 4228
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L8)

<a id="constant-constant-mq3-format-roq-max-chunk-size-const-max-chunk-size-65536-src-mq3-format-roq-ml-1153367564"></a>
### MAX_CHUNK_SIZE

```ml
const MAX_CHUNK_SIZE = 65536
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L17)

- [mq3.format.roq.Movie](Type-mq3-format-roq-movie-1562250259.md) — struct
<a id="constant-constant-mq3-format-roq-packet-const-packet-4144-src-mq3-format-roq-ml-1595011236"></a>
### PACKET

```ml
const PACKET = 4144
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L14)

<a id="function-function-mq3-format-roq-parse-function-parse-data-src-mq3-format-roq-ml-562656476"></a>
### parse

```ml
function parse(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L27)

<a id="constant-constant-mq3-format-roq-quad-hang-const-quad-hang-4115-src-mq3-format-roq-ml-1832401368"></a>
### QUAD_HANG

```ml
const QUAD_HANG = 4115
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L13)

<a id="constant-constant-mq3-format-roq-quad-info-const-quad-info-4097-src-mq3-format-roq-ml-799087421"></a>
### QUAD_INFO

```ml
const QUAD_INFO = 4097
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L9)

<a id="constant-constant-mq3-format-roq-quad-jpeg-const-quad-jpeg-4114-src-mq3-format-roq-ml-1719159047"></a>
### QUAD_JPEG

```ml
const QUAD_JPEG = 4114
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L12)

<a id="constant-constant-mq3-format-roq-quad-vq-const-quad-vq-4113-src-mq3-format-roq-ml-1800191830"></a>
### QUAD_VQ

```ml
const QUAD_VQ = 4113
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L11)

<a id="function-function-mq3-format-roq-signed16-function-signed16-value-src-mq3-format-roq-ml-1738377939"></a>
### signed16

```ml
function signed16(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L43)

<a id="constant-constant-mq3-format-roq-sound-mono-const-sound-mono-4128-src-mq3-format-roq-ml-1450905832"></a>
### SOUND_MONO

```ml
const SOUND_MONO = 4128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L15)

<a id="constant-constant-mq3-format-roq-sound-stereo-const-sound-stereo-4129-src-mq3-format-roq-ml-412989333"></a>
### SOUND_STEREO

```ml
const SOUND_STEREO = 4129
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L16)

<a id="function-function-mq3-format-roq-squaredelta-function-squaredelta-value-src-mq3-format-roq-ml-133476865"></a>
### squareDelta

```ml
function squareDelta(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L44)

<a id="function-function-mq3-format-roq-u16-function-u16-data-offset-src-mq3-format-roq-ml-2050424931"></a>
### u16

```ml
function u16(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L24)

<a id="function-function-mq3-format-roq-u32-function-u32-data-offset-src-mq3-format-roq-ml-46783947"></a>
### u32

```ml
function u32(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L25)

<a id="function-function-mq3-format-roq-write16-function-write16-output-offset-value-src-mq3-format-roq-ml-221044141"></a>
### write16

```ml
function write16(output, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/roq.ml#L45)
