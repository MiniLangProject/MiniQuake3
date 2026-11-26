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

Create the audio.snd_mix_runtime error for `compressionError` with 7669 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `(name + ": incompatible compressed sound")` and `error(7669, (name + ": incompatible compressed sound"))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mix_runtime.ml#L15)

<a id="function-function-mq3-audio-snd-mix-runtime-paintcompressed-function-paintcompressed-name-method-paint-sound-count-sampleoffset-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-mix-runtime-ml-1325523239"></a>
### paintCompressed

```ml
function paintCompressed(name, method, paint, sound, count, sampleOffset, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

Paint compressed in audio.snd_mix_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.audio.snd_mix_runtime.compressionError`. |
| `method` | `dynamic` | — | Method used in `(sound.compression != method)` and `((sound == void) or (sound.compression != method))`. |
| `paint` | `dynamic` | — | Paint buffer passed as `paintBuffer` to `mq3.audio.snd_compressed_paint.paint`. |
| `sound` | `dynamic` | — | Record exposing `compression`. |
| `count` | `dynamic` | — | Count passed as `count` to `mq3.audio.snd_compressed_paint.paint`. |
| `sampleOffset` | `dynamic` | — | Sample offset passed as `sampleOffset` to `mq3.audio.snd_compressed_paint.paint`. |
| `bufferOffset` | `dynamic` | — | Buffer offset passed as `bufferOffset` to `mq3.audio.snd_compressed_paint.paint`. |
| `leftVolume` | `dynamic` | — | Left vol passed as `leftVol` to `mq3.audio.snd_compressed_paint.paint`. |
| `rightVolume` | `dynamic` | — | Right vol passed as `rightVol` to `mq3.audio.snd_compressed_paint.paint`. |
| `sndVolume` | `dynamic` | — | Snd vol passed as `sndVol` to `mq3.audio.snd_compressed_paint.paint`. |
| `doppler` | `dynamic` | — | Doppler passed as `doppler` to `mq3.audio.snd_compressed_paint.paint`. |
| `dopplerScale` | `dynamic` | — | Doppler scale passed as `dopplerScale` to `mq3.audio.snd_compressed_paint.paint`. |
| `oldDopplerScale` | `dynamic` | — | Old doppler scale passed as `oldDopplerScale` to `mq3.audio.snd_compressed_paint.paint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mix_runtime.ml#L76)

<a id="function-function-mq3-audio-snd-mix-runtime-s-paintchannelfrom16-function-s-paintchannelfrom16-paint-samples-count-sampleoffset-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-mix-runtime-ml-1247140839"></a>
### S_PaintChannelFrom16

```ml
function S_PaintChannelFrom16(paint, samples, count, sampleOffset, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

Return `mq3.audio.channel_paint.paint16(samples, count, sampleOffset, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale, paint)` from `audio.snd_mix_runtime.S_PaintChannelFrom16`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Mutable interleaved left/right accumulator with room for (bufferOffset + count) * 2 entries. |
| `samples` | `dynamic` | — | Cyclic signed PCM array containing complete 1024-sample chunks. |
| `count` | `dynamic` | — | Number of output stereo frames to paint. |
| `sampleOffset` | `dynamic` | — | Starting source sample offset before Doppler adjustment. |
| `bufferOffset` | `dynamic` | — | Starting stereo-frame offset in paint. |
| `leftVolume` | `dynamic` | — | Left channel gain before sound-volume scaling. |
| `rightVolume` | `dynamic` | — | Right channel gain before sound-volume scaling. |
| `sndVolume` | `dynamic` | — | Overall sound gain multiplied into both channel gains. |
| `doppler` | `dynamic` | — | Whether to resample using Doppler scale changes. |
| `dopplerScale` | `dynamic` | — | Positive current source-step scale. |
| `oldDopplerScale` | `dynamic` | — | Nonnegative scale used to adjust the starting source offset. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mix_runtime.ml#L58)

<a id="function-function-mq3-audio-snd-mix-runtime-s-paintchannelfromadpcm-function-s-paintchannelfromadpcm-paint-sound-count-sampleoffset-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-mix-runtime-ml-228616871"></a>
### S_PaintChannelFromADPCM

```ml
function S_PaintChannelFromADPCM(paint, sound, count, sampleOffset, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

Delegate `S_PaintChannelFromADPCM` to `mq3.audio.snd_mix_runtime.paintCompressed` and return its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `sound` | `dynamic` | — | Sound passed as `sound` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `count` | `dynamic` | — | Count passed as `count` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `sampleOffset` | `dynamic` | — | Sample offset passed as `sampleOffset` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `bufferOffset` | `dynamic` | — | Buffer offset passed as `bufferOffset` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `leftVolume` | `dynamic` | — | Left volume passed as `leftVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `rightVolume` | `dynamic` | — | Right volume passed as `rightVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `sndVolume` | `dynamic` | — | Snd volume passed as `sndVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `doppler` | `dynamic` | — | Doppler passed as `doppler` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `dopplerScale` | `dynamic` | — | Doppler scale passed as `dopplerScale` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `oldDopplerScale` | `dynamic` | — | Old doppler scale passed as `oldDopplerScale` to `mq3.audio.snd_mix_runtime.paintCompressed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mix_runtime.ml#L109)

<a id="function-function-mq3-audio-snd-mix-runtime-s-paintchannelfrommulaw-function-s-paintchannelfrommulaw-paint-sound-count-sampleoffset-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-mix-runtime-ml-1785727881"></a>
### S_PaintChannelFromMuLaw

```ml
function S_PaintChannelFromMuLaw(paint, sound, count, sampleOffset, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

Delegate `S_PaintChannelFromMuLaw` to `mq3.audio.snd_mix_runtime.paintCompressed` and return its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `sound` | `dynamic` | — | Sound passed as `sound` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `count` | `dynamic` | — | Count passed as `count` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `sampleOffset` | `dynamic` | — | Sample offset passed as `sampleOffset` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `bufferOffset` | `dynamic` | — | Buffer offset passed as `bufferOffset` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `leftVolume` | `dynamic` | — | Left volume passed as `leftVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `rightVolume` | `dynamic` | — | Right volume passed as `rightVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `sndVolume` | `dynamic` | — | Snd volume passed as `sndVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `doppler` | `dynamic` | — | Doppler passed as `doppler` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `dopplerScale` | `dynamic` | — | Doppler scale passed as `dopplerScale` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `oldDopplerScale` | `dynamic` | — | Old doppler scale passed as `oldDopplerScale` to `mq3.audio.snd_mix_runtime.paintCompressed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mix_runtime.ml#L125)

<a id="function-function-mq3-audio-snd-mix-runtime-s-paintchannelfromwavelet-function-s-paintchannelfromwavelet-paint-sound-count-sampleoffset-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-mix-runtime-ml-1556501309"></a>
### S_PaintChannelFromWavelet

```ml
function S_PaintChannelFromWavelet(paint, sound, count, sampleOffset, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

Delegate `S_PaintChannelFromWavelet` to `mq3.audio.snd_mix_runtime.paintCompressed` and return its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `sound` | `dynamic` | — | Sound passed as `sound` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `count` | `dynamic` | — | Count passed as `count` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `sampleOffset` | `dynamic` | — | Sample offset passed as `sampleOffset` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `bufferOffset` | `dynamic` | — | Buffer offset passed as `bufferOffset` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `leftVolume` | `dynamic` | — | Left volume passed as `leftVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `rightVolume` | `dynamic` | — | Right volume passed as `rightVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `sndVolume` | `dynamic` | — | Snd volume passed as `sndVolume` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `doppler` | `dynamic` | — | Doppler passed as `doppler` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `dopplerScale` | `dynamic` | — | Doppler scale passed as `dopplerScale` to `mq3.audio.snd_mix_runtime.paintCompressed`. |
| `oldDopplerScale` | `dynamic` | — | Old doppler scale passed as `oldDopplerScale` to `mq3.audio.snd_mix_runtime.paintCompressed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mix_runtime.ml#L93)

<a id="function-function-mq3-audio-snd-mix-runtime-s-paintchannels-function-s-paintchannels-paint-sound-compressed-paintedtime-endtime-startsample-leftvolume-rightvolume-sndvolume-looping-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-mix-runtime-ml-1695738449"></a>
### S_PaintChannels

```ml
function S_PaintChannels(paint, sound, compressed, paintedTime, endTime, startSample, leftVolume, rightVolume, sndVolume, looping, doppler, dopplerScale, oldDopplerScale)
```

One managed call represents the original global-channel loop for one channel. Hosts call it for every active one-shot and loop channel before the common transfer, matching S_PaintChannels' ordering and 24.8 accumulation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`. |
| `sound` | `dynamic` | — | Sound passed as `sound` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`. |
| `compressed` | `dynamic` | — | Compressed passed as `compressed` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`. |
| `paintedTime` | `dynamic` | — | Painted time passed as `paintedTime` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`. |
| `endTime` | `dynamic` | — | End time used in `(endTime - paintedTime)`. |
| `startSample` | `dynamic` | — | Start sample used in `(paintedTime - startSample)`. |
| `leftVolume` | `dynamic` | — | Left volume passed as `leftVolume` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`. |
| `rightVolume` | `dynamic` | — | Right volume passed as `rightVolume` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`. |
| `sndVolume` | `dynamic` | — | Snd volume passed as `sndVolume` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`. |
| `looping` | `dynamic` | — | Looping operand used by `S_PaintChannels`; its reads are shown in the implementation. |
| `doppler` | `dynamic` | — | Doppler passed as `doppler` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`. |
| `dopplerScale` | `dynamic` | — | Doppler scale passed as `dopplerScale` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`. |
| `oldDopplerScale` | `dynamic` | — | Old doppler scale passed as `oldDopplerScale` to `mq3.audio.snd_paint_pipeline.paintSfxLoopDoppler`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mix_runtime.ml#L145)

<a id="function-function-mq3-audio-snd-mix-runtime-s-transferpaintbuffer-function-s-transferpaintbuffer-paint-paintedtime-endtime-samplebits-channels-dmasamples-output-src-mq3-audio-snd-mix-runtime-ml-1657525890"></a>
### S_TransferPaintBuffer

```ml
function S_TransferPaintBuffer(paint, paintedTime, endTime, sampleBits, channels, dmaSamples, output)
```

Return `mq3.audio.mixer_transfer.transfer(paint, paintedTime, endTime, sampleBits, channels, dmaSamples, output)` from `audio.snd_mix_runtime.S_TransferPaintBuffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.mixer_transfer.transfer`. |
| `paintedTime` | `dynamic` | — | Painted time passed as `paintedTime` to `mq3.audio.mixer_transfer.transfer`. |
| `endTime` | `dynamic` | — | End time passed as `endTime` to `mq3.audio.mixer_transfer.transfer`. |
| `sampleBits` | `dynamic` | — | Sample bits passed as `sampleBits` to `mq3.audio.mixer_transfer.transfer`. |
| `channels` | `dynamic` | — | Channels passed as `channels` to `mq3.audio.mixer_transfer.transfer`. |
| `dmaSamples` | `dynamic` | — | Dma samples passed as `dmaSamples` to `mq3.audio.mixer_transfer.transfer`. |
| `output` | `dynamic` | — | Output passed as `output` to `mq3.audio.mixer_transfer.transfer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mix_runtime.ml#L42)

<a id="function-function-mq3-audio-snd-mix-runtime-s-transferstereo16-function-s-transferstereo16-paint-paintedtime-endtime-dmasamples-output-src-mq3-audio-snd-mix-runtime-ml-1705795590"></a>
### S_TransferStereo16

```ml
function S_TransferStereo16(paint, paintedTime, endTime, dmaSamples, output)
```

Return `mq3.audio.mixer_transfer.transfer(paint, paintedTime, endTime, 16, 2, dmaSamples, output)` from `audio.snd_mix_runtime.S_TransferStereo16`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.mixer_transfer.transfer`. |
| `paintedTime` | `dynamic` | — | Painted time passed as `paintedTime` to `mq3.audio.mixer_transfer.transfer`. |
| `endTime` | `dynamic` | — | End time passed as `endTime` to `mq3.audio.mixer_transfer.transfer`. |
| `dmaSamples` | `dynamic` | — | Dma samples passed as `dmaSamples` to `mq3.audio.mixer_transfer.transfer`. |
| `output` | `dynamic` | — | Output passed as `output` to `mq3.audio.mixer_transfer.transfer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mix_runtime.ml#L30)

<a id="function-function-mq3-audio-snd-mix-runtime-s-writelinearblaststereo16-function-s-writelinearblaststereo16-paint-frames-src-mq3-audio-snd-mix-runtime-ml-615443824"></a>
### S_WriteLinearBlastStereo16

```ml
function S_WriteLinearBlastStereo16(paint, frames)
```

Return `mq3.audio.snd_paint_pipeline.transfer16(paint, frames)` from `audio.snd_mix_runtime.S_WriteLinearBlastStereo16`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.snd_paint_pipeline.transfer16`. |
| `frames` | `dynamic` | — | Frames passed as `frames` to `mq3.audio.snd_paint_pipeline.transfer16`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mix_runtime.ml#L20)
