# `src/mq3/platform/playable_audio.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.playable_audio`](Package-mq3-platform-playable-audio-251818458.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-platform-playable-audio-init-function-init-src-mq3-platform-playable-audio-ml-792798348"></a>
### init

```ml
function init()
```

Returns `void` from `mq3.platform.playable_audio.init`; earlier branches return `error(7491,"preview audio initialization failed")`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L30)

<a id="extern_function-extern-function-mq3-platform-playable-audio-initnative-extern-function-initnative-from-playable-audio-dll-symbol-playable-audio-init-returns-i32-src-mq3-platform-playable-audio-ml-911026293"></a>
### initNative

```ml
extern function initNative() from "playable_audio.dll" symbol "playable_audio_init" returns i32
```

Enables the native pool of PCM playback voices.


**Returns:** 1 after enabling the voice pool.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L7)

<a id="function-function-mq3-platform-playable-audio-play-function-play-sound-src-mq3-platform-playable-audio-ml-1332525019"></a>
### play

```ml
function play(sound)
```

Starts one-shot playback of a validated PCM sound and converts native rejection to a MiniLang error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — | Record providing `sound.samples`, `sound.sampleRate`, `sound.channels`, `sound.bitsPerSample`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L36)

<a id="function-function-mq3-platform-playable-audio-playloop-function-playloop-sound-src-mq3-platform-playable-audio-ml-61207847"></a>
### playLoop

```ml
function playLoop(sound)
```

Starts continuous playback of a validated PCM sound and converts native rejection to a MiniLang error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — | Record providing `sound.samples`, `sound.sampleRate`, `sound.channels`, `sound.bitsPerSample`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L43)

<a id="extern_function-extern-function-mq3-platform-playable-audio-playloopnative-extern-function-playloopnative-samples-as-ptr-bytecount-as-i32-samplerate-as-i32-channels-as-i32-bitspersample-as-i32-from-playable-audio-dll-symbol-playable-audio-play-pcm-loop-returns-i32-src-mq3-platform-playable-audio-ml-81802106"></a>
### playLoopNative

```ml
extern function playLoopNative(samples as ptr, byteCount as i32, sampleRate as i32, channels as i32, bitsPerSample as i32) from "playable_audio.dll" symbol "playable_audio_play_pcm_loop" returns i32
```

Copies a PCM clip into a native voice and enables continuous loop playback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `ptr` | — | Read-only interleaved PCM bytes copied into a native playback voice. |
| `byteCount` | `i32` | — | Size of the associated native input buffer in bytes. |
| `sampleRate` | `i32` | — | PCM sample rate in frames per second. |
| `channels` | `i32` | — | Number of interleaved PCM channels. |
| `bitsPerSample` | `i32` | — | Number of bits in each PCM channel sample. |


**Returns:** 1 when loop playback starts; 0 for invalid input or an output/allocation failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L23)

<a id="extern_function-extern-function-mq3-platform-playable-audio-playnative-extern-function-playnative-samples-as-ptr-bytecount-as-i32-samplerate-as-i32-channels-as-i32-bitspersample-as-i32-from-playable-audio-dll-symbol-playable-audio-play-pcm-returns-i32-src-mq3-platform-playable-audio-ml-137993979"></a>
### playNative

```ml
extern function playNative(samples as ptr, byteCount as i32, sampleRate as i32, channels as i32, bitsPerSample as i32) from "playable_audio.dll" symbol "playable_audio_play_pcm" returns i32
```

Copies and plays a PCM clip once through a native WinMM voice.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `ptr` | — | Read-only interleaved PCM bytes copied into a native playback voice. |
| `byteCount` | `i32` | — | Size of the associated native input buffer in bytes. |
| `sampleRate` | `i32` | — | PCM sample rate in frames per second. |
| `channels` | `i32` | — | Number of interleaved PCM channels. |
| `bitsPerSample` | `i32` | — | Number of bits in each PCM channel sample. |


**Returns:** 1 when playback starts; 0 for invalid input or an output/allocation failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L15)

<a id="function-function-mq3-platform-playable-audio-shutdown-function-shutdown-src-mq3-platform-playable-audio-ml-872174812"></a>
### shutdown

```ml
function shutdown()
```

Returns `void` from `mq3.platform.playable_audio.shutdown`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L51)

<a id="extern_function-extern-function-mq3-platform-playable-audio-shutdownnative-extern-function-shutdownnative-from-playable-audio-dll-symbol-playable-audio-shutdown-returns-void-src-mq3-platform-playable-audio-ml-863945913"></a>
### shutdownNative

```ml
extern function shutdownNative() from "playable_audio.dll" symbol "playable_audio_shutdown" returns void
```

Closes all preview voices and disables the native PCM playback pool.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L27)

<a id="function-function-mq3-platform-playable-audio-stop-function-stop-src-mq3-platform-playable-audio-ml-530504160"></a>
### stop

```ml
function stop()
```

Returns `void` from `mq3.platform.playable_audio.stop`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L49)

<a id="extern_function-extern-function-mq3-platform-playable-audio-stopnative-extern-function-stopnative-from-playable-audio-dll-symbol-playable-audio-stop-returns-void-src-mq3-platform-playable-audio-ml-1055421371"></a>
### stopNative

```ml
extern function stopNative() from "playable_audio.dll" symbol "playable_audio_stop" returns void
```

Stops every native preview voice and frees its copied PCM samples.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L25)
