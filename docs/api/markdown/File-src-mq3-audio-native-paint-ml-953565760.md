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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/native_paint.ml#L12)

<a id="function-function-mq3-audio-native-paint-finish-function-finish-paint-frames-src-mq3-audio-native-paint-ml-981532958"></a>
### finish

```ml
function finish(paint, frames)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `frames` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/native_paint.ml#L24)

<a id="extern_function-extern-function-mq3-audio-native-paint-finishnative-extern-function-finishnative-paint-as-ptr-paintbytes-as-i32-output-as-ptr-outputbytes-as-i32-frames-as-i32-from-playable-ambient-dll-symbol-playable-ambient-finish-mix-returns-i32-src-mq3-audio-native-paint-ml-1922812805"></a>
### finishNative

```ml
extern function finishNative(paint as ptr, paintBytes as i32, output as ptr, outputBytes as i32, frames as i32) from "playable_ambient.dll" symbol "playable_ambient_finish_mix" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `ptr` | — |  |
| `paintBytes` | `i32` | — |  |
| `output` | `ptr` | — |  |
| `outputBytes` | `i32` | — |  |
| `frames` | `i32` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/native_paint.ml#L8)

<a id="function-function-mq3-audio-native-paint-mixpcm-function-mixpcm-paint-sound-sourceframes-sampleoffset-count-bufferoffset-leftvolume-rightvolume-soundvolume-looping-doppler-dopplerscale-olddopplerscale-src-mq3-audio-native-paint-ml-1253465518"></a>
### mixPcm

```ml
function mixPcm(paint, sound, sourceFrames, sampleOffset, count, bufferOffset, leftVolume, rightVolume, soundVolume, looping, doppler, dopplerScale, oldDopplerScale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `sourceFrames` | `dynamic` | — |  |
| `sampleOffset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |
| `soundVolume` | `dynamic` | — |  |
| `looping` | `dynamic` | — |  |
| `doppler` | `dynamic` | — |  |
| `dopplerScale` | `dynamic` | — |  |
| `oldDopplerScale` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/native_paint.ml#L13)

<a id="extern_function-extern-function-mq3-audio-native-paint-mixpcmnative-extern-function-mixpcmnative-paint-as-ptr-paintbytes-as-i32-samples-as-ptr-samplebytes-as-i32-channels-as-i32-bitspersample-as-i32-blockalign-as-i32-sourceframes-as-i32-sampleoffset-as-i32-count-as-i32-bufferoffset-as-i32-leftvolume-as-i32-rightvolume-as-i32-soundvolume-as-i32-looping-as-i32-doppler-as-i32-dopplerscale-as-double-olddopplerscale-as-double-from-playable-ambient-dll-symbol-playable-ambient-mix-pcm-returns-i32-src-mq3-audio-native-paint-ml-854260035"></a>
### mixPcmNative

```ml
extern function mixPcmNative(paint as ptr, paintBytes as i32, samples as ptr, sampleBytes as i32, channels as i32, bitsPerSample as i32, blockAlign as i32, sourceFrames as i32, sampleOffset as i32, count as i32, bufferOffset as i32, leftVolume as i32, rightVolume as i32, soundVolume as i32, looping as i32, doppler as i32, dopplerScale as double, oldDopplerScale as double) from "playable_ambient.dll" symbol "playable_ambient_mix_pcm" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `ptr` | — |  |
| `paintBytes` | `i32` | — |  |
| `samples` | `ptr` | — |  |
| `sampleBytes` | `i32` | — |  |
| `channels` | `i32` | — |  |
| `bitsPerSample` | `i32` | — |  |
| `blockAlign` | `i32` | — |  |
| `sourceFrames` | `i32` | — |  |
| `sampleOffset` | `i32` | — |  |
| `count` | `i32` | — |  |
| `bufferOffset` | `i32` | — |  |
| `leftVolume` | `i32` | — |  |
| `rightVolume` | `i32` | — |  |
| `soundVolume` | `i32` | — |  |
| `looping` | `i32` | — |  |
| `doppler` | `i32` | — |  |
| `dopplerScale` | `double` | — |  |
| `oldDopplerScale` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/native_paint.ml#L6)

<a id="function-function-mq3-audio-native-paint-mixstream-function-mixstream-paint-sound-sourceframes-outputrate-cursor-count-bufferoffset-src-mq3-audio-native-paint-ml-733696571"></a>
### mixStream

```ml
function mixStream(paint, sound, sourceFrames, outputRate, cursor, count, bufferOffset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `sourceFrames` | `dynamic` | — |  |
| `outputRate` | `dynamic` | — |  |
| `cursor` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/native_paint.ml#L19)

<a id="extern_function-extern-function-mq3-audio-native-paint-mixstreamnative-extern-function-mixstreamnative-paint-as-ptr-paintbytes-as-i32-samples-as-ptr-samplebytes-as-i32-channels-as-i32-bitspersample-as-i32-blockalign-as-i32-sourceframes-as-i32-samplerate-as-i32-outputrate-as-i32-cursor-as-double-count-as-i32-bufferoffset-as-i32-from-playable-ambient-dll-symbol-playable-ambient-mix-stream-returns-double-src-mq3-audio-native-paint-ml-226780032"></a>
### mixStreamNative

```ml
extern function mixStreamNative(paint as ptr, paintBytes as i32, samples as ptr, sampleBytes as i32, channels as i32, bitsPerSample as i32, blockAlign as i32, sourceFrames as i32, sampleRate as i32, outputRate as i32, cursor as double, count as i32, bufferOffset as i32) from "playable_ambient.dll" symbol "playable_ambient_mix_stream" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `ptr` | — |  |
| `paintBytes` | `i32` | — |  |
| `samples` | `ptr` | — |  |
| `sampleBytes` | `i32` | — |  |
| `channels` | `i32` | — |  |
| `bitsPerSample` | `i32` | — |  |
| `blockAlign` | `i32` | — |  |
| `sourceFrames` | `i32` | — |  |
| `sampleRate` | `i32` | — |  |
| `outputRate` | `i32` | — |  |
| `cursor` | `double` | — |  |
| `count` | `i32` | — |  |
| `bufferOffset` | `i32` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/native_paint.ml#L7)

- [mq3.audio.native_paint.Result](Type-mq3-audio-native-paint-result-342928289.md) — struct
