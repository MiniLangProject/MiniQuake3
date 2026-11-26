# `src/mq3/audio/native_paint.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.native_paint`](Package-mq3-audio-native-paint-957288550.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-audio-native-paint-fail-function-fail-message-src-mq3-audio-native-paint-ml-236699281"></a>
### fail

```ml
function fail(message)
```

Create the audio.native_paint error for `fail` with 7717 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("native audio paint: " + message)` and `error(7717, ("native audio paint: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/native_paint.ml#L62)

<a id="function-function-mq3-audio-native-paint-finish-function-finish-paint-frames-src-mq3-audio-native-paint-ml-981532958"></a>
### finish

```ml
function finish(paint, frames)
```

Convert accumulated int32 stereo frames to clipped signed-16-bit PCM and report the peak magnitude.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Mutable-byte representation of the interleaved int32 stereo accumulator. |
| `frames` | `dynamic` | — | Number of stereo frames; requires at least frames * 8 paint bytes. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/native_paint.ml#L99)

<a id="extern_function-extern-function-mq3-audio-native-paint-finishnative-extern-function-finishnative-paint-as-ptr-paintbytes-as-i32-output-as-ptr-outputbytes-as-i32-frames-as-i32-from-playable-ambient-dll-symbol-playable-ambient-finish-mix-returns-i32-src-mq3-audio-native-paint-ml-1922812805"></a>
### finishNative

```ml
extern function finishNative(paint as ptr, paintBytes as i32, output as ptr, outputBytes as i32, frames as i32) from "playable_ambient.dll" symbol "playable_ambient_finish_mix" returns i32
```

Clamp the stereo int32 paint buffer to interleaved signed 16-bit PCM.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `ptr` | — | Read-only interleaved int32 stereo accumulator. |
| `paintBytes` | `i32` | — | Accumulator capacity in bytes. |
| `output` | `ptr` | — | Writable interleaved signed-16-bit stereo destination. |
| `outputBytes` | `i32` | — | Output capacity in bytes. |
| `frames` | `i32` | — | Stereo-frame count; requires eight input bytes and four output bytes per frame. |


**Returns:** The peak magnitude after the eight-bit mixer shift but before clipping, or -1 if either buffer is too short.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/native_paint.ml#L50)

<a id="function-function-mq3-audio-native-paint-mixpcm-function-mixpcm-paint-sound-sourceframes-sampleoffset-count-bufferoffset-leftvolume-rightvolume-soundvolume-looping-doppler-dopplerscale-olddopplerscale-src-mq3-audio-native-paint-ml-1253465518"></a>
### mixPcm

```ml
function mixPcm(paint, sound, sourceFrames, sampleOffset, count, bufferOffset, leftVolume, rightVolume, soundVolume, looping, doppler, dopplerScale, oldDopplerScale)
```

Mix effect PCM into the stereo accumulator, averaging stereo input to mono before applying left/right spatial gains.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Writable byte buffer containing interleaved signed-int32 left/right accumulators. |
| `sound` | `dynamic` | — | Decoded PCM sound record with samples, channels, bitsPerSample, and blockAlign. |
| `sourceFrames` | `dynamic` | — | Number of valid source PCM frames. |
| `sampleOffset` | `dynamic` | — | Starting source-frame offset. |
| `count` | `dynamic` | — | Requested output stereo-frame count. |
| `bufferOffset` | `dynamic` | — | First destination stereo frame in paint. |
| `leftVolume` | `dynamic` | — | Left spatial gain. |
| `rightVolume` | `dynamic` | — | Right spatial gain. |
| `soundVolume` | `dynamic` | — | Global sound gain multiplied into both spatial gains. |
| `looping` | `dynamic` | — | Whether to wrap source reads at the end of the PCM frames. |
| `doppler` | `dynamic` | — | Whether to apply Doppler resampling. |
| `dopplerScale` | `dynamic` | — | Current Doppler source-step ratio. |
| `oldDopplerScale` | `dynamic` | — | Previous Doppler ratio applied to the starting source position. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/native_paint.ml#L77)

<a id="extern_function-extern-function-mq3-audio-native-paint-mixpcmnative-extern-function-mixpcmnative-paint-as-ptr-paintbytes-as-i32-samples-as-ptr-samplebytes-as-i32-channels-as-i32-bitspersample-as-i32-blockalign-as-i32-sourceframes-as-i32-sampleoffset-as-i32-count-as-i32-bufferoffset-as-i32-leftvolume-as-i32-rightvolume-as-i32-soundvolume-as-i32-looping-as-i32-doppler-as-i32-dopplerscale-as-double-olddopplerscale-as-double-from-playable-ambient-dll-symbol-playable-ambient-mix-pcm-returns-i32-src-mq3-audio-native-paint-ml-854260035"></a>
### mixPcmNative

```ml
extern function mixPcmNative(paint as ptr, paintBytes as i32, samples as ptr, sampleBytes as i32, channels as i32, bitsPerSample as i32, blockAlign as i32, sourceFrames as i32, sampleOffset as i32, count as i32, bufferOffset as i32, leftVolume as i32, rightVolume as i32, soundVolume as i32, looping as i32, doppler as i32, dopplerScale as double, oldDopplerScale as double) from "playable_ambient.dll" symbol "playable_ambient_mix_pcm" returns i32
```

Mix PCM frames into an interleaved signed-int32 stereo paint buffer through playable_ambient_mix_pcm.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `ptr` | — | Writable native paint-buffer address. |
| `paintBytes` | `i32` | — | Paint-buffer capacity in bytes; each stereo frame occupies eight bytes. |
| `samples` | `ptr` | — | Read-only PCM byte-buffer address. |
| `sampleBytes` | `i32` | — | PCM buffer length in bytes. |
| `channels` | `i32` | — | PCM channel count, one or two. |
| `bitsPerSample` | `i32` | — | PCM sample width, 8 or 16 bits. |
| `blockAlign` | `i32` | — | Bytes in one source PCM frame. |
| `sourceFrames` | `i32` | — | Number of source frames available. |
| `sampleOffset` | `i32` | — | Starting source-frame offset. |
| `count` | `i32` | — | Requested output-frame count. |
| `bufferOffset` | `i32` | — | First destination stereo frame. |
| `leftVolume` | `i32` | — | Left-channel gain. |
| `rightVolume` | `i32` | — | Right-channel gain. |
| `soundVolume` | `i32` | — | Global sound gain. |
| `looping` | `i32` | — | Nonzero to wrap at the end of the source frames. |
| `doppler` | `i32` | — | Nonzero to apply Doppler resampling. |
| `dopplerScale` | `double` | — | Current Doppler source-step ratio. |
| `oldDopplerScale` | `double` | — | Previous Doppler ratio applied to the starting position. |


**Returns:** The number of mixed frames, or a negative value when the request is invalid.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/native_paint.ml#L26)

<a id="function-function-mq3-audio-native-paint-mixstream-function-mixstream-paint-sound-sourceframes-outputrate-cursor-count-bufferoffset-src-mq3-audio-native-paint-ml-733696571"></a>
### mixStream

```ml
function mixStream(paint, sound, sourceFrames, outputRate, cursor, count, bufferOffset)
```

Resample streaming PCM into the stereo accumulator while preserving left/right source channels; return the advanced source-frame cursor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Writable byte buffer containing interleaved signed-int32 stereo accumulators. |
| `sound` | `dynamic` | — | Decoded PCM stream with samples, channel/format metadata, and source sample rate. |
| `sourceFrames` | `dynamic` | — | Number of available source PCM frames. |
| `outputRate` | `dynamic` | — | Destination stereo sample rate in Hz. |
| `cursor` | `dynamic` | — | Fractional source-frame position before mixing. |
| `count` | `dynamic` | — | Requested destination stereo-frame count. |
| `bufferOffset` | `dynamic` | — | First destination stereo frame in paint. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/native_paint.ml#L91)

<a id="extern_function-extern-function-mq3-audio-native-paint-mixstreamnative-extern-function-mixstreamnative-paint-as-ptr-paintbytes-as-i32-samples-as-ptr-samplebytes-as-i32-channels-as-i32-bitspersample-as-i32-blockalign-as-i32-sourceframes-as-i32-samplerate-as-i32-outputrate-as-i32-cursor-as-double-count-as-i32-bufferoffset-as-i32-from-playable-ambient-dll-symbol-playable-ambient-mix-stream-returns-double-src-mq3-audio-native-paint-ml-226780032"></a>
### mixStreamNative

```ml
extern function mixStreamNative(paint as ptr, paintBytes as i32, samples as ptr, sampleBytes as i32, channels as i32, bitsPerSample as i32, blockAlign as i32, sourceFrames as i32, sampleRate as i32, outputRate as i32, cursor as double, count as i32, bufferOffset as i32) from "playable_ambient.dll" symbol "playable_ambient_mix_stream" returns double
```

Resample streaming PCM into the stereo paint buffer and return the advanced source cursor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `ptr` | — | Writable interleaved signed-int32 stereo accumulator. |
| `paintBytes` | `i32` | — | Paint-buffer byte capacity. |
| `samples` | `ptr` | — | Read-only source PCM bytes. |
| `sampleBytes` | `i32` | — | Source-buffer byte length. |
| `channels` | `i32` | — | Source channel count, one or two. |
| `bitsPerSample` | `i32` | — | Source sample width, 8 or 16 bits. |
| `blockAlign` | `i32` | — | Bytes per source frame. |
| `sourceFrames` | `i32` | — | Available source-frame count. |
| `sampleRate` | `i32` | — | Source sampling rate in Hz. |
| `outputRate` | `i32` | — | Destination sampling rate in Hz. |
| `cursor` | `double` | — | Fractional source-frame cursor. |
| `count` | `i32` | — | Requested destination stereo-frame count. |
| `bufferOffset` | `i32` | — | First destination stereo frame. |


**Returns:** The advanced fractional source-frame cursor, or a negative value for an invalid request.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/native_paint.ml#L42)

- [mq3.audio.native_paint.Result](Type-mq3-audio-native-paint-result-342928289.md) — struct
