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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `outputRate` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L14)

<a id="function-function-mq3-audio-snd-raw-stream-enqueue-function-enqueue-state-samples-rate-width-channels-data-volume-src-mq3-audio-snd-raw-stream-ml-312154458"></a>
### enqueue

```ml
function enqueue(state, samples, rate, width, channels, data, volume)
```

This follows the four conversion branches in Baseq3 S_RawSamples. Values in the ring retain the original 24.8 paintbuffer scale.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `samples` | `dynamic` | — |  |
| `rate` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `channels` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `volume` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L36)

<a id="function-function-mq3-audio-snd-raw-stream-fail-function-fail-message-src-mq3-audio-snd-raw-stream-ml-639360575"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L12)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `paint` | `dynamic` | — |  |
| `paintedTime` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L63)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L24)

<a id="function-function-mq3-audio-snd-raw-stream-signed16-function-signed16-data-offset-src-mq3-audio-snd-raw-stream-ml-1429358529"></a>
### signed16

```ml
function signed16(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L19)

<a id="function-function-mq3-audio-snd-raw-stream-signed8-function-signed8-value-src-mq3-audio-snd-raw-stream-ml-1293818497"></a>
### signed8

```ml
function signed8(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L22)

- [mq3.audio.snd_raw_stream.State](Type-mq3-audio-snd-raw-stream-state-159305234.md) — struct
<a id="function-function-mq3-audio-snd-raw-stream-store-function-store-state-left-right-src-mq3-audio-snd-raw-stream-ml-948912280"></a>
### store

```ml
function store(state, left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_raw_stream.ml#L29)
