# `src/mq3/audio/snd_paint_pipeline.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_paint_pipeline`](Package-mq3-audio-snd-paint-pipeline-2023621633.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/channel_paint.ml` as `channelPaint` → [src/mq3/audio/channel_paint.ml](File-src-mq3-audio-channel-paint-ml-452074202.md)
- `mq3/audio/mixer_transfer.ml` as `paintTransfer` → [src/mq3/audio/mixer_transfer.ml](File-src-mq3-audio-mixer-transfer-ml-1564271583.md)
- `mq3/audio/snd_compressed_paint.ml` as `compressedPaint` → [src/mq3/audio/snd_compressed_paint.ml](File-src-mq3-audio-snd-compressed-paint-ml-1998500130.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="constant-constant-mq3-audio-snd-paint-pipeline-default-snd-volume-const-default-snd-volume-204-src-mq3-audio-snd-paint-pipeline-ml-560078553"></a>
### DEFAULT_SND_VOLUME

```ml
const DEFAULT_SND_VOLUME = 204
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L10)

<a id="function-function-mq3-audio-snd-paint-pipeline-fail-function-fail-message-src-mq3-audio-snd-paint-pipeline-ml-1247256611"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L12)

<a id="function-function-mq3-audio-snd-paint-pipeline-monosamples-function-monosamples-sound-src-mq3-audio-snd-paint-pipeline-ml-1885301663"></a>
### monoSamples

```ml
function monoSamples(sound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L18)

<a id="function-function-mq3-audio-snd-paint-pipeline-nextpoweroftwo-function-nextpoweroftwo-value-src-mq3-audio-snd-paint-pipeline-ml-1379531725"></a>
### nextPowerOfTwo

```ml
function nextPowerOfTwo(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L125)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintloop-function-paintloop-paint-sound-paintedtime-count-bufferoffset-leftvolume-rightvolume-sndvolume-src-mq3-audio-snd-paint-pipeline-ml-822086161"></a>
### paintLoop

```ml
function paintLoop(paint, sound, paintedTime, count, bufferOffset, leftVolume, rightVolume, sndVolume)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `paintedTime` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L50)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintmonoloopdoppler-function-paintmonoloopdoppler-paint-samples-frames-paintedtime-count-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-paint-pipeline-ml-1945456588"></a>
### paintMonoLoopDoppler

```ml
function paintMonoLoopDoppler(paint, samples, frames, paintedTime, count, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `samples` | `dynamic` | — |  |
| `frames` | `dynamic` | — |  |
| `paintedTime` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |
| `doppler` | `dynamic` | — |  |
| `dopplerScale` | `dynamic` | — |  |
| `oldDopplerScale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L105)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintmonooneshot-function-paintmonooneshot-paint-samples-frames-sampleoffset-count-bufferoffset-leftvolume-rightvolume-sndvolume-src-mq3-audio-snd-paint-pipeline-ml-1337657182"></a>
### paintMonoOneShot

```ml
function paintMonoOneShot(paint, samples, frames, sampleOffset, count, bufferOffset, leftVolume, rightVolume, sndVolume)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `samples` | `dynamic` | — |  |
| `frames` | `dynamic` | — |  |
| `sampleOffset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L42)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintoneshot-function-paintoneshot-paint-sound-sampleoffset-count-bufferoffset-leftvolume-rightvolume-sndvolume-src-mq3-audio-snd-paint-pipeline-ml-541846340"></a>
### paintOneShot

```ml
function paintOneShot(paint, sound, sampleOffset, count, bufferOffset, leftVolume, rightVolume, sndVolume)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `sampleOffset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L33)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintraw-function-paintraw-paint-left-right-bufferoffset-count-volume-src-mq3-audio-snd-paint-pipeline-ml-1759908197"></a>
### paintRaw

```ml
function paintRaw(paint, left, right, bufferOffset, count, volume)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `volume` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L116)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintsfxloop-function-paintsfxloop-paint-sound-compressed-paintedtime-count-bufferoffset-leftvolume-rightvolume-sndvolume-src-mq3-audio-snd-paint-pipeline-ml-1722702750"></a>
### paintSfxLoop

```ml
function paintSfxLoop(paint, sound, compressed, paintedTime, count, bufferOffset, leftVolume, rightVolume, sndVolume)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `compressed` | `dynamic` | — |  |
| `paintedTime` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L74)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintsfxloopdoppler-function-paintsfxloopdoppler-paint-sound-compressed-paintedtime-count-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-paint-pipeline-ml-82153631"></a>
### paintSfxLoopDoppler

```ml
function paintSfxLoopDoppler(paint, sound, compressed, paintedTime, count, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `compressed` | `dynamic` | — |  |
| `paintedTime` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |
| `doppler` | `dynamic` | — |  |
| `dopplerScale` | `dynamic` | — |  |
| `oldDopplerScale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L86)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintsfxoneshot-function-paintsfxoneshot-paint-sound-compressed-sampleoffset-count-bufferoffset-leftvolume-rightvolume-sndvolume-src-mq3-audio-snd-paint-pipeline-ml-173582515"></a>
### paintSfxOneShot

```ml
function paintSfxOneShot(paint, sound, compressed, sampleOffset, count, bufferOffset, leftVolume, rightVolume, sndVolume)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `compressed` | `dynamic` | — |  |
| `sampleOffset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L67)

<a id="function-function-mq3-audio-snd-paint-pipeline-signed16-function-signed16-data-offset-src-mq3-audio-snd-paint-pipeline-ml-1870672989"></a>
### signed16

```ml
function signed16(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L14)

<a id="function-function-mq3-audio-snd-paint-pipeline-soundframes-function-soundframes-sound-compressed-src-mq3-audio-snd-paint-pipeline-ml-1293288218"></a>
### soundFrames

```ml
function soundFrames(sound, compressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — |  |
| `compressed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L62)

<a id="function-function-mq3-audio-snd-paint-pipeline-transfer16-function-transfer16-paint-frames-src-mq3-audio-snd-paint-pipeline-ml-1903807576"></a>
### transfer16

```ml
function transfer16(paint, frames)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `frames` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L129)
