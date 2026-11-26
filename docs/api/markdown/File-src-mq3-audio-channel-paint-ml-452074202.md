# `src/mq3/audio/channel_paint.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.channel_paint`](Package-mq3-audio-channel-paint-2103742342.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-audio-channel-paint-addscaled-function-addscaled-paint-index-data-leftvolume-rightvolume-src-mq3-audio-channel-paint-ml-1241852509"></a>
### addScaled

```ml
function addScaled(paint, index, data, leftVolume, rightVolume)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/channel_paint.ml#L23)

<a id="function-function-mq3-audio-channel-paint-fail-function-fail-message-src-mq3-audio-channel-paint-ml-1432295113"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/channel_paint.ml#L9)

<a id="function-function-mq3-audio-channel-paint-paint16-function-paint16-samples-count-sampleoffset-bufferoffset-leftvol-rightvol-sndvol-doppler-dopplerscale-olddopplerscale-paint-src-mq3-audio-channel-paint-ml-483640766"></a>
### paint16

```ml
function paint16(samples, count, sampleOffset, bufferOffset, leftVol, rightVol, sndVol, doppler, dopplerScale, oldDopplerScale, paint)
```

paint is interleaved [left,right,...]. samples represents the linked 1024 sample sndBuffer chunks as one cyclic array. The result is modified in place.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `sampleOffset` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVol` | `dynamic` | — |  |
| `rightVol` | `dynamic` | — |  |
| `sndVol` | `dynamic` | — |  |
| `doppler` | `dynamic` | — |  |
| `dopplerScale` | `dynamic` | — |  |
| `oldDopplerScale` | `dynamic` | — |  |
| `paint` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/channel_paint.ml#L32)

<a id="constant-constant-mq3-audio-channel-paint-snd-chunk-size-const-snd-chunk-size-1024-src-mq3-audio-channel-paint-ml-1345138142"></a>
### SND_CHUNK_SIZE

```ml
const SND_CHUNK_SIZE = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/channel_paint.ml#L7)

<a id="function-function-mq3-audio-channel-paint-sourceindex-function-sourceindex-samples-index-src-mq3-audio-channel-paint-ml-706419273"></a>
### sourceIndex

```ml
function sourceIndex(samples, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/channel_paint.ml#L17)

<a id="function-function-mq3-audio-channel-paint-validsamples-function-validsamples-samples-src-mq3-audio-channel-paint-ml-323786333"></a>
### validSamples

```ml
function validSamples(samples)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/channel_paint.ml#L13)
