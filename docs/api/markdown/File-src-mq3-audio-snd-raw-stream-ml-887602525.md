# `src/mq3/audio/snd_raw_stream.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_raw_stream`](Package-mq3-audio-snd-raw-stream-2113563637.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-audio-snd-raw-stream-create-function-create-outputrate-src-mq3-audio-snd-raw-stream-ml-2020044673"></a>
### create

```ml
function create(outputRate)
```

Create snd raw stream in audio.snd_raw_stream; the normal completion returns `State(outputRate, 0, 0, array(MAX_RAW_SAMPLES, 0), array(MAX_RAW_SAMPLES, 0))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `outputRate` | `dynamic` | — | Initial `outputRate` field stored in the returned or constructed `mq3.audio.snd_raw_stream.State` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L19)

<a id="function-function-mq3-audio-snd-raw-stream-enqueue-function-enqueue-state-samples-rate-width-channels-data-volume-src-mq3-audio-snd-raw-stream-ml-312154458"></a>
### enqueue

```ml
function enqueue(state, samples, rate, width, channels, data, volume)
```

This follows the four conversion branches in Baseq3 S_RawSamples. Values in the ring retain the original 24.8 paintbuffer scale.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `rawEnd`, `soundTime`, `outputRate`. Updated in place: `rawEnd`. |
| `samples` | `dynamic` | — | Samples used in `(samples < 0)` and `(samples - 1)`. |
| `rate` | `dynamic` | — | Rate used in `(rate <= 0)` and `(rate / state.outputRate)`. |
| `width` | `dynamic` | — | Width used in `(width != 1)` and `(width != 2)`. |
| `channels` | `dynamic` | — | Channels used in `(channels != 1)` and `(channels != 2)`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.audio.snd_raw_stream.signed16`. |
| `volume` | `dynamic` | — | Volume used in `(256.0 * volume)` and `numeric.trunc32((256.0 * volume))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L64)

<a id="function-function-mq3-audio-snd-raw-stream-fail-function-fail-message-src-mq3-audio-snd-raw-stream-ml-639360575"></a>
### fail

```ml
function fail(message)
```

Create the audio.snd_raw_stream error for `fail` with 7712 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("S_RawSamples: " + message)` and `error(7712, ("S_RawSamples: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L15)

<a id="constant-constant-mq3-audio-snd-raw-stream-max-raw-samples-const-max-raw-samples-16384-src-mq3-audio-snd-raw-stream-ml-1698501557"></a>
### MAX_RAW_SAMPLES

```ml
const MAX_RAW_SAMPLES = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L7)

<a id="function-function-mq3-audio-snd-raw-stream-paint-function-paint-state-paint-paintedtime-count-src-mq3-audio-snd-raw-stream-ml-713937664"></a>
### paint

```ml
function paint(state, paint, paintedTime, count)
```

Paint snd raw stream in audio.snd_raw_stream; the normal completion returns `(stop - paintedTime)`.

Direct state writes: `paint elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `rawEnd`, `left`, `right`. |
| `paint` | `dynamic` | — | Mutable sequence written at `destination`, `(destination + 1)`. |
| `paintedTime` | `dynamic` | — | Painted time used in `(paintedTime < 0)` and `(time - paintedTime)`. |
| `count` | `dynamic` | — | Count used in `(count < 0)` and `(count * 2)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L98)

<a id="constant-constant-mq3-audio-snd-raw-stream-raw-mask-const-raw-mask-max-raw-samples-1-src-mq3-audio-snd-raw-stream-ml-220092758"></a>
### RAW_MASK

```ml
const RAW_MASK = MAX_RAW_SAMPLES - 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L8)

<a id="function-function-mq3-audio-snd-raw-stream-setsoundtime-function-setsoundtime-state-value-src-mq3-audio-snd-raw-stream-ml-539061822"></a>
### setSoundTime

```ml
function setSoundTime(state, value)
```

Set sound time in audio.snd_raw_stream; the normal completion returns `value`.

Direct state writes: `state.soundTime`, `state.rawEnd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `rawEnd`. Updated in place: `soundTime`, `rawEnd`. |
| `value` | `dynamic` | — | Value used in `(value < 0)` and `(state.rawEnd < value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L39)

<a id="function-function-mq3-audio-snd-raw-stream-signed16-function-signed16-data-offset-src-mq3-audio-snd-raw-stream-ml-1429358529"></a>
### signed16

```ml
function signed16(data, offset)
```

Decode a signed 16-bit little-endian PCM sample for audio.snd_raw_stream.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `data[offset]` and `data[(offset + 1)]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L27)

<a id="function-function-mq3-audio-snd-raw-stream-signed8-function-signed8-value-src-mq3-audio-snd-raw-stream-ml-1293818497"></a>
### signed8

```ml
function signed8(value)
```

Decode a signed 8-bit PCM sample for audio.snd_raw_stream.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value - 256)` and `(value >= 128)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L32)

- [mq3.audio.snd_raw_stream.State](Type-mq3-audio-snd-raw-stream-state-159305234.md) — struct
<a id="function-function-mq3-audio-snd-raw-stream-store-function-store-state-left-right-src-mq3-audio-snd-raw-stream-ml-948912280"></a>
### store

```ml
function store(state, left, right)
```

Store snd raw stream in audio.snd_raw_stream; updates `state.rawEnd`.

Direct state writes: `state.rawEnd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `rawEnd`, `left`, `right`. Updated in place: `rawEnd`. |
| `left` | `dynamic` | — | Left operand used by `store`; its reads are shown in the implementation. |
| `right` | `dynamic` | — | Right operand used by `store`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L50)
