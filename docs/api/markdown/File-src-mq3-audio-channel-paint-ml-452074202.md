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

Accumulate one PCM sample into adjacent left and right paint entries using signed 32-bit mixer arithmetic.

Direct state writes: `paint elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Mutable interleaved integer paint buffer. |
| `index` | `dynamic` | — | Index of the left paint entry; the right entry is index + 1. |
| `data` | `dynamic` | — | Signed source PCM sample. |
| `leftVolume` | `dynamic` | — | Left channel scale, shifted right by eight after multiplication. |
| `rightVolume` | `dynamic` | — | Right channel scale, shifted right by eight after multiplication. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/channel_paint.ml#L38)

<a id="function-function-mq3-audio-channel-paint-fail-function-fail-message-src-mq3-audio-channel-paint-ml-1432295113"></a>
### fail

```ml
function fail(message)
```

Create the audio.channel_paint error for `fail` with 7250 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("audio channel paint: " + message)` and `error(7250, ("audio channel paint: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/channel_paint.ml#L11)

<a id="function-function-mq3-audio-channel-paint-paint16-function-paint16-samples-count-sampleoffset-bufferoffset-leftvol-rightvol-sndvol-doppler-dopplerscale-olddopplerscale-paint-src-mq3-audio-channel-paint-ml-483640766"></a>
### paint16

```ml
function paint16(samples, count, sampleOffset, bufferOffset, leftVol, rightVol, sndVol, doppler, dopplerScale, oldDopplerScale, paint)
```

paint is interleaved [left,right,...]. samples represents the linked 1024 sample sndBuffer chunks as one cyclic array. The result is modified in place.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — | Cyclic signed PCM array containing complete 1024-sample chunks. |
| `count` | `dynamic` | — | Number of output stereo frames to paint. |
| `sampleOffset` | `dynamic` | — | Starting source sample offset before Doppler adjustment. |
| `bufferOffset` | `dynamic` | — | Starting stereo-frame offset in paint. |
| `leftVol` | `dynamic` | — | Left channel gain before sound-volume scaling. |
| `rightVol` | `dynamic` | — | Right channel gain before sound-volume scaling. |
| `sndVol` | `dynamic` | — | Overall sound gain multiplied into both channel gains. |
| `doppler` | `dynamic` | — | Whether to resample using Doppler scale changes. |
| `dopplerScale` | `dynamic` | — | Positive current source-step scale. |
| `oldDopplerScale` | `dynamic` | — | Nonnegative scale used to adjust the starting source offset. |
| `paint` | `dynamic` | — | Mutable interleaved left/right accumulator with room for (bufferOffset + count) * 2 entries. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/channel_paint.ml#L58)

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

Wrap a source sample index into the cyclic PCM array, including negative indices.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — | Nonempty cyclic sample array. |
| `index` | `dynamic` | — | Logical sample index before modulo wrapping. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/channel_paint.ml#L24)

<a id="function-function-mq3-audio-channel-paint-validsamples-function-validsamples-samples-src-mq3-audio-channel-paint-ml-323786333"></a>
### validSamples

```ml
function validSamples(samples)
```

Check that channel PCM contains a nonempty integral number of 1024-sample chunks.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — | PCM sample array representing the cyclic sndBuffer chunk chain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/channel_paint.ml#L17)
