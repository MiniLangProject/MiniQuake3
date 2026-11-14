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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L11)

<a id="extern_function-extern-function-mq3-platform-playable-audio-initnative-extern-function-initnative-from-playable-audio-dll-symbol-playable-audio-init-returns-i32-src-mq3-platform-playable-audio-ml-911026293"></a>
### initNative

```ml
extern function initNative() from "playable_audio.dll" symbol "playable_audio_init" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L5)

<a id="function-function-mq3-platform-playable-audio-play-function-play-sound-src-mq3-platform-playable-audio-ml-1332525019"></a>
### play

```ml
function play(sound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L15)

<a id="function-function-mq3-platform-playable-audio-playloop-function-playloop-sound-src-mq3-platform-playable-audio-ml-61207847"></a>
### playLoop

```ml
function playLoop(sound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L20)

<a id="extern_function-extern-function-mq3-platform-playable-audio-playloopnative-extern-function-playloopnative-samples-as-ptr-bytecount-as-i32-samplerate-as-i32-channels-as-i32-bitspersample-as-i32-from-playable-audio-dll-symbol-playable-audio-play-pcm-loop-returns-i32-src-mq3-platform-playable-audio-ml-81802106"></a>
### playLoopNative

```ml
extern function playLoopNative(samples as ptr, byteCount as i32, sampleRate as i32, channels as i32, bitsPerSample as i32) from "playable_audio.dll" symbol "playable_audio_play_pcm_loop" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `ptr` | — |  |
| `byteCount` | `i32` | — |  |
| `sampleRate` | `i32` | — |  |
| `channels` | `i32` | — |  |
| `bitsPerSample` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L7)

<a id="extern_function-extern-function-mq3-platform-playable-audio-playnative-extern-function-playnative-samples-as-ptr-bytecount-as-i32-samplerate-as-i32-channels-as-i32-bitspersample-as-i32-from-playable-audio-dll-symbol-playable-audio-play-pcm-returns-i32-src-mq3-platform-playable-audio-ml-137993979"></a>
### playNative

```ml
extern function playNative(samples as ptr, byteCount as i32, sampleRate as i32, channels as i32, bitsPerSample as i32) from "playable_audio.dll" symbol "playable_audio_play_pcm" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `ptr` | — |  |
| `byteCount` | `i32` | — |  |
| `sampleRate` | `i32` | — |  |
| `channels` | `i32` | — |  |
| `bitsPerSample` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L6)

<a id="function-function-mq3-platform-playable-audio-shutdown-function-shutdown-src-mq3-platform-playable-audio-ml-872174812"></a>
### shutdown

```ml
function shutdown()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L26)

<a id="extern_function-extern-function-mq3-platform-playable-audio-shutdownnative-extern-function-shutdownnative-from-playable-audio-dll-symbol-playable-audio-shutdown-returns-void-src-mq3-platform-playable-audio-ml-863945913"></a>
### shutdownNative

```ml
extern function shutdownNative() from "playable_audio.dll" symbol "playable_audio_shutdown" returns void
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L9)

<a id="function-function-mq3-platform-playable-audio-stop-function-stop-src-mq3-platform-playable-audio-ml-530504160"></a>
### stop

```ml
function stop()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L25)

<a id="extern_function-extern-function-mq3-platform-playable-audio-stopnative-extern-function-stopnative-from-playable-audio-dll-symbol-playable-audio-stop-returns-void-src-mq3-platform-playable-audio-ml-1055421371"></a>
### stopNative

```ml
extern function stopNative() from "playable_audio.dll" symbol "playable_audio_stop" returns void
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_audio.ml#L8)
