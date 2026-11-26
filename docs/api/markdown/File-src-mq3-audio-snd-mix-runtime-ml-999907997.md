# `src/mq3/audio/snd_mix_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_mix_runtime`](Package-mq3-audio-snd-mix-runtime-559605547.md)

Reachable from entry: **no**

## Imports

- `mq3/audio/channel_paint.ml` as `channelPaint` → [src/mq3/audio/channel_paint.ml](File-src-mq3-audio-channel-paint-ml-452074202.md)
- `mq3/audio/mixer_transfer.ml` as `transfer` → [src/mq3/audio/mixer_transfer.ml](File-src-mq3-audio-mixer-transfer-ml-1564271583.md)
- `mq3/audio/snd_compressed_paint.ml` as `compressedPaint` → [src/mq3/audio/snd_compressed_paint.ml](File-src-mq3-audio-snd-compressed-paint-ml-1998500130.md)
- `mq3/audio/snd_paint_pipeline.ml` as `pipeline` → [src/mq3/audio/snd_paint_pipeline.ml](File-src-mq3-audio-snd-paint-pipeline-ml-2065386845.md)

## Declarations

<a id="function-function-mq3-audio-snd-mix-runtime-compressionerror-function-compressionerror-name-src-mq3-audio-snd-mix-runtime-ml-1844349171"></a>
### compressionError

```ml
function compressionError(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mix_runtime.ml#L13)

<a id="function-function-mq3-audio-snd-mix-runtime-paintcompressed-function-paintcompressed-name-method-paint-sound-count-sampleoffset-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-mix-runtime-ml-1325523239"></a>
### paintCompressed

```ml
function paintCompressed(name, method, paint, sound, count, sampleOffset, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `method` | `dynamic` | — |  |
| `paint` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `sampleOffset` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |
| `doppler` | `dynamic` | — |  |
| `dopplerScale` | `dynamic` | — |  |
| `oldDopplerScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mix_runtime.ml#L31)

<a id="function-function-mq3-audio-snd-mix-runtime-s-paintchannelfrom16-function-s-paintchannelfrom16-paint-samples-count-sampleoffset-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-mix-runtime-ml-1247140839"></a>
### S_PaintChannelFrom16

```ml
function S_PaintChannelFrom16(paint, samples, count, sampleOffset, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `samples` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `sampleOffset` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |
| `doppler` | `dynamic` | — |  |
| `dopplerScale` | `dynamic` | — |  |
| `oldDopplerScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mix_runtime.ml#L27)

<a id="function-function-mq3-audio-snd-mix-runtime-s-paintchannelfromadpcm-function-s-paintchannelfromadpcm-paint-sound-count-sampleoffset-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-mix-runtime-ml-228616871"></a>
### S_PaintChannelFromADPCM

```ml
function S_PaintChannelFromADPCM(paint, sound, count, sampleOffset, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `sampleOffset` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |
| `doppler` | `dynamic` | — |  |
| `dopplerScale` | `dynamic` | — |  |
| `oldDopplerScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mix_runtime.ml#L40)

<a id="function-function-mq3-audio-snd-mix-runtime-s-paintchannelfrommulaw-function-s-paintchannelfrommulaw-paint-sound-count-sampleoffset-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-mix-runtime-ml-1785727881"></a>
### S_PaintChannelFromMuLaw

```ml
function S_PaintChannelFromMuLaw(paint, sound, count, sampleOffset, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `sampleOffset` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |
| `doppler` | `dynamic` | — |  |
| `dopplerScale` | `dynamic` | — |  |
| `oldDopplerScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mix_runtime.ml#L44)

<a id="function-function-mq3-audio-snd-mix-runtime-s-paintchannelfromwavelet-function-s-paintchannelfromwavelet-paint-sound-count-sampleoffset-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-mix-runtime-ml-1556501309"></a>
### S_PaintChannelFromWavelet

```ml
function S_PaintChannelFromWavelet(paint, sound, count, sampleOffset, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `sampleOffset` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |
| `doppler` | `dynamic` | — |  |
| `dopplerScale` | `dynamic` | — |  |
| `oldDopplerScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mix_runtime.ml#L36)

<a id="function-function-mq3-audio-snd-mix-runtime-s-paintchannels-function-s-paintchannels-paint-sound-compressed-paintedtime-endtime-startsample-leftvolume-rightvolume-sndvolume-looping-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-mix-runtime-ml-1695738449"></a>
### S_PaintChannels

```ml
function S_PaintChannels(paint, sound, compressed, paintedTime, endTime, startSample, leftVolume, rightVolume, sndVolume, looping, doppler, dopplerScale, oldDopplerScale)
```

One managed call represents the original global-channel loop for one channel. Hosts call it for every active one-shot and loop channel before the common transfer, matching S_PaintChannels' ordering and 24.8 accumulation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `compressed` | `dynamic` | — |  |
| `paintedTime` | `dynamic` | — |  |
| `endTime` | `dynamic` | — |  |
| `startSample` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `sndVolume` | `dynamic` | — |  |
| `looping` | `dynamic` | — |  |
| `doppler` | `dynamic` | — |  |
| `dopplerScale` | `dynamic` | — |  |
| `oldDopplerScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mix_runtime.ml#L51)

<a id="function-function-mq3-audio-snd-mix-runtime-s-transferpaintbuffer-function-s-transferpaintbuffer-paint-paintedtime-endtime-samplebits-channels-dmasamples-output-src-mq3-audio-snd-mix-runtime-ml-1657525890"></a>
### S_TransferPaintBuffer

```ml
function S_TransferPaintBuffer(paint, paintedTime, endTime, sampleBits, channels, dmaSamples, output)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `paintedTime` | `dynamic` | — |  |
| `endTime` | `dynamic` | — |  |
| `sampleBits` | `dynamic` | — |  |
| `channels` | `dynamic` | — |  |
| `dmaSamples` | `dynamic` | — |  |
| `output` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mix_runtime.ml#L23)

<a id="function-function-mq3-audio-snd-mix-runtime-s-transferstereo16-function-s-transferstereo16-paint-paintedtime-endtime-dmasamples-output-src-mq3-audio-snd-mix-runtime-ml-1705795590"></a>
### S_TransferStereo16

```ml
function S_TransferStereo16(paint, paintedTime, endTime, dmaSamples, output)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `paintedTime` | `dynamic` | — |  |
| `endTime` | `dynamic` | — |  |
| `dmaSamples` | `dynamic` | — |  |
| `output` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mix_runtime.ml#L19)

<a id="function-function-mq3-audio-snd-mix-runtime-s-writelinearblaststereo16-function-s-writelinearblaststereo16-paint-frames-src-mq3-audio-snd-mix-runtime-ml-615443824"></a>
### S_WriteLinearBlastStereo16

```ml
function S_WriteLinearBlastStereo16(paint, frames)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `frames` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mix_runtime.ml#L15)
