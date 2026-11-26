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

Default fixed-point master gain used by the channel-paint pipeline.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L11)

<a id="function-function-mq3-audio-snd-paint-pipeline-fail-function-fail-message-src-mq3-audio-snd-paint-pipeline-ml-1247256611"></a>
### fail

```ml
function fail(message)
```

Create the audio.snd_paint_pipeline error for `fail` with 7666 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("S_PaintChannels: " + message)` and `error(7666, ("S_PaintChannels: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L15)

<a id="function-function-mq3-audio-snd-paint-pipeline-monosamples-function-monosamples-sound-src-mq3-audio-snd-paint-pipeline-ml-1885301663"></a>
### monoSamples

```ml
function monoSamples(sound)
```

Compute mono samples in audio.snd_paint_pipeline; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — | Record exposing `channels`, `samples`, `blockAlign`, `bitsPerSample`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L26)

<a id="function-function-mq3-audio-snd-paint-pipeline-nextpoweroftwo-function-nextpoweroftwo-value-src-mq3-audio-snd-paint-pipeline-ml-1379531725"></a>
### nextPowerOfTwo

```ml
function nextPowerOfTwo(value)
```

Compute next power of two in audio.snd_paint_pipeline; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(result < value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L221)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintloop-function-paintloop-paint-sound-paintedtime-count-bufferoffset-leftvolume-rightvolume-sndvolume-src-mq3-audio-snd-paint-pipeline-ml-822086161"></a>
### paintLoop

```ml
function paintLoop(paint, sound, paintedTime, count, bufferOffset, leftVolume, rightVolume, sndVolume)
```

Paint loop in audio.snd_paint_pipeline; the normal completion returns `done`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Mutable interleaved left/right accumulator with room for (bufferOffset + count) * 2 entries. |
| `sound` | `dynamic` | — | Record exposing `samples`, `blockAlign`. |
| `paintedTime` | `dynamic` | — | Painted time used in `(paintedTime + done)` and `((paintedTime + done) % frames)`. |
| `count` | `dynamic` | — | Count used in `(done < count)` and `(count - done)`. |
| `bufferOffset` | `dynamic` | — | Buffer offset used in `(bufferOffset + done)`. |
| `leftVolume` | `dynamic` | — | Left channel gain before sound-volume scaling. |
| `rightVolume` | `dynamic` | — | Right channel gain before sound-volume scaling. |
| `sndVolume` | `dynamic` | — | Overall sound gain multiplied into both channel gains. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L86)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintmonoloopdoppler-function-paintmonoloopdoppler-paint-samples-frames-paintedtime-count-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-paint-pipeline-ml-1945456588"></a>
### paintMonoLoopDoppler

```ml
function paintMonoLoopDoppler(paint, samples, frames, paintedTime, count, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

Paint mono loop doppler in audio.snd_paint_pipeline; the normal completion returns `done`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Mutable interleaved left/right accumulator with room for (bufferOffset + count) * 2 entries. |
| `samples` | `dynamic` | — | Cyclic signed PCM array containing complete 1024-sample chunks. |
| `frames` | `dynamic` | — | Frames used in `(frames < 1)` and `(frames - sampleOffset)`. |
| `paintedTime` | `dynamic` | — | Painted time used in `(paintedTime + done)` and `((paintedTime + done) % frames)`. |
| `count` | `dynamic` | — | Count used in `(done < count)` and `(count - done)`. |
| `bufferOffset` | `dynamic` | — | Buffer offset used in `(bufferOffset + done)`. |
| `leftVolume` | `dynamic` | — | Left channel gain before sound-volume scaling. |
| `rightVolume` | `dynamic` | — | Right channel gain before sound-volume scaling. |
| `sndVolume` | `dynamic` | — | Overall sound gain multiplied into both channel gains. |
| `doppler` | `dynamic` | — | Whether to resample using Doppler scale changes. |
| `dopplerScale` | `dynamic` | — | Positive current source-step scale. |
| `oldDopplerScale` | `dynamic` | — | Nonnegative scale used to adjust the starting source offset. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L190)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintmonooneshot-function-paintmonooneshot-paint-samples-frames-sampleoffset-count-bufferoffset-leftvolume-rightvolume-sndvolume-src-mq3-audio-snd-paint-pipeline-ml-1337657182"></a>
### paintMonoOneShot

```ml
function paintMonoOneShot(paint, samples, frames, sampleOffset, count, bufferOffset, leftVolume, rightVolume, sndVolume)
```

Paint mono one shot in audio.snd_paint_pipeline; the normal completion returns `actual`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Mutable interleaved left/right accumulator with room for (bufferOffset + count) * 2 entries. |
| `samples` | `dynamic` | — | Cyclic signed PCM array containing complete 1024-sample chunks. |
| `frames` | `dynamic` | — | Frames used in `(frames < 1)` and `(frames - sampleOffset)`. |
| `sampleOffset` | `dynamic` | — | Starting source sample offset before Doppler adjustment. |
| `count` | `dynamic` | — | Count used in `(count <= 0)` and `((sampleOffset >= frames) or (count <= 0))`. |
| `bufferOffset` | `dynamic` | — | Starting stereo-frame offset in paint. |
| `leftVolume` | `dynamic` | — | Left channel gain before sound-volume scaling. |
| `rightVolume` | `dynamic` | — | Right channel gain before sound-volume scaling. |
| `sndVolume` | `dynamic` | — | Overall sound gain multiplied into both channel gains. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L69)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintoneshot-function-paintoneshot-paint-sound-sampleoffset-count-bufferoffset-leftvolume-rightvolume-sndvolume-src-mq3-audio-snd-paint-pipeline-ml-541846340"></a>
### paintOneShot

```ml
function paintOneShot(paint, sound, sampleOffset, count, bufferOffset, leftVolume, rightVolume, sndVolume)
```

Paint one shot in audio.snd_paint_pipeline; the normal completion returns `actual`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Mutable interleaved left/right accumulator with room for (bufferOffset + count) * 2 entries. |
| `sound` | `dynamic` | — | Record exposing `samples`, `blockAlign`. |
| `sampleOffset` | `dynamic` | — | Starting source sample offset before Doppler adjustment. |
| `count` | `dynamic` | — | Count used in `(count <= 0)` and `((sampleOffset >= frames) or (count <= 0))`. |
| `bufferOffset` | `dynamic` | — | Starting stereo-frame offset in paint. |
| `leftVolume` | `dynamic` | — | Left channel gain before sound-volume scaling. |
| `rightVolume` | `dynamic` | — | Right channel gain before sound-volume scaling. |
| `sndVolume` | `dynamic` | — | Overall sound gain multiplied into both channel gains. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L50)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintraw-function-paintraw-paint-left-right-bufferoffset-count-volume-src-mq3-audio-snd-paint-pipeline-ml-1759908197"></a>
### paintRaw

```ml
function paintRaw(paint, left, right, bufferOffset, count, volume)
```

Paint raw in audio.snd_paint_pipeline; the normal completion returns `count`.

Direct state writes: `paint elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Mutable sequence written at `destination`, `(destination + 1)`. |
| `left` | `dynamic` | — | Left used in `len(left)` and `left[frame]`. |
| `right` | `dynamic` | — | Right used in `len(right)` and `right[frame]`. |
| `bufferOffset` | `dynamic` | — | Buffer offset used in `(bufferOffset + frame)` and `((bufferOffset + frame) * 2)`. |
| `count` | `dynamic` | — | Count used in `(count - 1)` and `(len(left) < count)`. |
| `volume` | `dynamic` | — | Volume used in `(256.0 * volume)` and `numeric.trunc32((256.0 * volume))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L210)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintsfxloop-function-paintsfxloop-paint-sound-compressed-paintedtime-count-bufferoffset-leftvolume-rightvolume-sndvolume-src-mq3-audio-snd-paint-pipeline-ml-1722702750"></a>
### paintSfxLoop

```ml
function paintSfxLoop(paint, sound, compressed, paintedTime, count, bufferOffset, leftVolume, rightVolume, sndVolume)
```

Paint sfx loop in audio.snd_paint_pipeline; the normal completion returns `done`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.snd_paint_pipeline.paintLoop`. |
| `sound` | `dynamic` | — | Sound passed as `sound` to `mq3.audio.snd_paint_pipeline.paintLoop`. |
| `compressed` | `dynamic` | — | Record exposing `length`. |
| `paintedTime` | `dynamic` | — | Painted time passed as `paintedTime` to `mq3.audio.snd_paint_pipeline.paintLoop`. |
| `count` | `dynamic` | — | Count passed as `count` to `mq3.audio.snd_paint_pipeline.paintLoop`. |
| `bufferOffset` | `dynamic` | — | Buffer offset passed as `bufferOffset` to `mq3.audio.snd_paint_pipeline.paintLoop`. |
| `leftVolume` | `dynamic` | — | Left volume passed as `leftVolume` to `mq3.audio.snd_paint_pipeline.paintLoop`. |
| `rightVolume` | `dynamic` | — | Right volume passed as `rightVolume` to `mq3.audio.snd_paint_pipeline.paintLoop`. |
| `sndVolume` | `dynamic` | — | Snd volume passed as `sndVolume` to `mq3.audio.snd_paint_pipeline.paintLoop`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L133)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintsfxloopdoppler-function-paintsfxloopdoppler-paint-sound-compressed-paintedtime-count-bufferoffset-leftvolume-rightvolume-sndvolume-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-paint-pipeline-ml-82153631"></a>
### paintSfxLoopDoppler

```ml
function paintSfxLoopDoppler(paint, sound, compressed, paintedTime, count, bufferOffset, leftVolume, rightVolume, sndVolume, doppler, dopplerScale, oldDopplerScale)
```

Paint sfx loop doppler in audio.snd_paint_pipeline; the normal completion returns `done`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`. |
| `sound` | `dynamic` | — | Sound passed as `sound` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`. |
| `compressed` | `dynamic` | — | Compressed passed as `compressed` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`. |
| `paintedTime` | `dynamic` | — | Painted time passed as `paintedTime` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`. |
| `count` | `dynamic` | — | Count passed as `count` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`. |
| `bufferOffset` | `dynamic` | — | Buffer offset passed as `bufferOffset` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`. |
| `leftVolume` | `dynamic` | — | Left volume passed as `leftVolume` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`. |
| `rightVolume` | `dynamic` | — | Right volume passed as `rightVolume` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`. |
| `sndVolume` | `dynamic` | — | Snd volume passed as `sndVolume` to `mq3.audio.snd_paint_pipeline.paintSfxLoop`. |
| `doppler` | `dynamic` | — | Doppler operand used by `paintSfxLoopDoppler`; its reads are shown in the implementation. |
| `dopplerScale` | `dynamic` | — | Doppler scale passed as `dopplerScale` to `mq3.audio.snd_compressed_paint.paint`. |
| `oldDopplerScale` | `dynamic` | — | Old doppler scale passed as `oldDopplerScale` to `mq3.audio.snd_compressed_paint.paint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L158)

<a id="function-function-mq3-audio-snd-paint-pipeline-paintsfxoneshot-function-paintsfxoneshot-paint-sound-compressed-sampleoffset-count-bufferoffset-leftvolume-rightvolume-sndvolume-src-mq3-audio-snd-paint-pipeline-ml-173582515"></a>
### paintSfxOneShot

```ml
function paintSfxOneShot(paint, sound, compressed, sampleOffset, count, bufferOffset, leftVolume, rightVolume, sndVolume)
```

Paint sfx one shot in audio.snd_paint_pipeline.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.snd_paint_pipeline.paintOneShot`. |
| `sound` | `dynamic` | — | Sound passed as `sound` to `mq3.audio.snd_paint_pipeline.paintOneShot`. |
| `compressed` | `dynamic` | — | Record exposing `length`. |
| `sampleOffset` | `dynamic` | — | Sample offset passed as `sampleOffset` to `mq3.audio.snd_paint_pipeline.paintOneShot`. |
| `count` | `dynamic` | — | Count passed as `count` to `mq3.audio.snd_paint_pipeline.paintOneShot`. |
| `bufferOffset` | `dynamic` | — | Buffer offset passed as `bufferOffset` to `mq3.audio.snd_paint_pipeline.paintOneShot`. |
| `leftVolume` | `dynamic` | — | Left volume passed as `leftVolume` to `mq3.audio.snd_paint_pipeline.paintOneShot`. |
| `rightVolume` | `dynamic` | — | Right volume passed as `rightVolume` to `mq3.audio.snd_paint_pipeline.paintOneShot`. |
| `sndVolume` | `dynamic` | — | Snd volume passed as `sndVolume` to `mq3.audio.snd_paint_pipeline.paintOneShot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L116)

<a id="function-function-mq3-audio-snd-paint-pipeline-signed16-function-signed16-data-offset-src-mq3-audio-snd-paint-pipeline-ml-1870672989"></a>
### signed16

```ml
function signed16(data, offset)
```

Decode a signed 16-bit little-endian PCM sample for audio.snd_paint_pipeline.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `data[offset]` and `data[(offset + 1)]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L20)

<a id="function-function-mq3-audio-snd-paint-pipeline-soundframes-function-soundframes-sound-compressed-src-mq3-audio-snd-paint-pipeline-ml-1293288218"></a>
### soundFrames

```ml
function soundFrames(sound, compressed)
```

Compute sound frames in audio.snd_paint_pipeline; the normal completion returns `(len(sound.samples) / sound.blockAlign)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — | Record exposing `samples`, `blockAlign`. |
| `compressed` | `dynamic` | — | Record exposing `length`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L101)

<a id="function-function-mq3-audio-snd-paint-pipeline-transfer16-function-transfer16-paint-frames-src-mq3-audio-snd-paint-pipeline-ml-1903807576"></a>
### transfer16

```ml
function transfer16(paint, frames)
```

Transfer 16 in audio.snd_paint_pipeline; the normal completion returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.mixer_transfer.transfer`. |
| `frames` | `dynamic` | — | End time passed as `endTime` to `mq3.audio.mixer_transfer.transfer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_paint_pipeline.ml#L228)
