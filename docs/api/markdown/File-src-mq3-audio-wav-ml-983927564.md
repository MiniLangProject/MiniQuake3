# `src/mq3/audio/wav.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.wav`](Package-mq3-audio-wav-819286400.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-audio-wav-copy-function-copy-data-offset-count-src-mq3-audio-wav-ml-1442093192"></a>
### copy

```ml
function copy(data, offset, count)
```

Copy wav in audio.wav; the normal completion returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `data[(offset + index)]`. |
| `offset` | `dynamic` | — | Offset used in `(offset + index)` and `data[(offset + index)]`. |
| `count` | `dynamic` | — | Count used in `(count > 0)` and `(count - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/wav.ml#L53)

<a id="function-function-mq3-audio-wav-decode-function-decode-data-src-mq3-audio-wav-ml-1569492630"></a>
### decode

```ml
function decode(data)
```

Decode a RIFF/WAVE asset into an independently owned PCM Sound. Accepts integer PCM only: one or two channels, 8 or 16 bits per channel, and sample rates from 4,000 through 192,000 Hz. Validates RIFF/chunk bounds, odd-byte padding, block alignment, byte rate, and complete sample frames. Uses the first fmt and data chunks, rejects empty data or payloads above MAX_PCM_BYTES, and reports malformed or unsupported input as error 7490. Bytes following the declared RIFF payload are not part of the decoded sound.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Complete WAVE file bytes; the returned sample buffer does not alias this input. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/wav.ml#L67)

<a id="function-function-mq3-audio-wav-fail-function-fail-message-src-mq3-audio-wav-ml-2133538817"></a>
### fail

```ml
function fail(message)
```

Create the audio.wav error for `fail` with 7490 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("WAV: " + message)` and `error(7490, ("WAV: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/wav.ml#L30)

<a id="constant-constant-mq3-audio-wav-max-pcm-bytes-const-max-pcm-bytes-67108864-src-mq3-audio-wav-ml-1855906827"></a>
### MAX_PCM_BYTES

```ml
const MAX_PCM_BYTES = 67108864
```

Maximum PCM payload size accepted by the WAVE loader, in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/wav.ml#L6)

<a id="constant-constant-mq3-audio-wav-max-sample-rate-const-max-sample-rate-192000-src-mq3-audio-wav-ml-1176000663"></a>
### MAX_SAMPLE_RATE

```ml
const MAX_SAMPLE_RATE = 192000
```

Highest WAVE sample rate accepted by the loader, in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/wav.ml#L10)

<a id="constant-constant-mq3-audio-wav-min-sample-rate-const-min-sample-rate-4000-src-mq3-audio-wav-ml-1816024111"></a>
### MIN_SAMPLE_RATE

```ml
const MIN_SAMPLE_RATE = 4000
```

Lowest WAVE sample rate accepted by the loader, in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/wav.ml#L8)

- [mq3.audio.wav.Sound](Type-mq3-audio-wav-sound-1863900385.md) — struct
<a id="function-function-mq3-audio-wav-tag-function-tag-data-offset-a-b-c-d-src-mq3-audio-wav-ml-1312059589"></a>
### tag

```ml
function tag(data, offset, a, b, c, d)
```

Compute audio.wav.tag as `((((data[offset] == a) and (data[(offset + 1)] == b)) and (data[(offset + 2)] == c)) and (data[(offset + 3)] == d))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `data[offset]` and `data[(offset + 1)]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |
| `a` | `dynamic` | — | A used in `(data[offset] == a)` and `((data[offset] == a) and (data[(offset + 1)] == b))`. |
| `b` | `dynamic` | — | B used in `(data[(offset + 1)] == b)` and `((data[offset] == a) and (data[(offset + 1)] == b))`. |
| `c` | `dynamic` | — | C used in `(data[(offset + 2)] == c)` and `(((data[offset] == a) and (data[(offset + 1)] == b)) and (data[(offset + 2)] == c))`. |
| `d` | `dynamic` | — | D used in `(data[(offset + 3)] == d)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/wav.ml#L46)

<a id="function-function-mq3-audio-wav-u16-function-u16-data-offset-src-mq3-audio-wav-ml-1423243765"></a>
### u16

```ml
function u16(data, offset)
```

Compute audio.wav.u16 as `(data[offset] | (data[(offset + 1)] << 8))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `data[offset]` and `data[(offset + 1)]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/wav.ml#L34)

<a id="function-function-mq3-audio-wav-u32-function-u32-data-offset-src-mq3-audio-wav-ml-1086806745"></a>
### u32

```ml
function u32(data, offset)
```

Compute audio.wav.u32 as `(((data[offset] | (data[(offset + 1)] << 8)) | (data[(offset + 2)] << 16)) | (data[(offset + 3)] << 24))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `data[offset]` and `data[(offset + 1)]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/wav.ml#L38)
