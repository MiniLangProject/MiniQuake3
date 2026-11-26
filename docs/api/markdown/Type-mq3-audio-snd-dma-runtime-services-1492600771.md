# `mq3.audio.snd_dma_runtime.Services`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-dma-runtime-ml-2032678845.md)

<a id="struct-struct-mq3-audio-snd-dma-runtime-services-struct-services-src-mq3-audio-snd-dma-runtime-ml-378237781"></a>
## Services

```ml
struct Services
```

Services record for audio.snd_dma_runtime, containing `initDmaFn`, `shutdownDmaFn`, `loadFn`, `startFn`, `localFn`, `paintFn`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L52)

## Members

<a id="field-field-mq3-audio-snd-dma-runtime-services-context-context-src-mq3-audio-snd-dma-runtime-ml-2089244825"></a>
### context

```ml
context
```

Opaque host data passed to the configured audio service callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L72)

<a id="field-field-mq3-audio-snd-dma-runtime-services-diagnosticfn-diagnosticfn-src-mq3-audio-snd-dma-runtime-ml-1415288711"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback that reports an audio loading, allocation, or playback diagnostic to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L70)

<a id="field-field-mq3-audio-snd-dma-runtime-services-initdmafn-initdmafn-src-mq3-audio-snd-dma-runtime-ml-1467265733"></a>
### initDmaFn

```ml
initDmaFn
```

Host callback that initializes the host audio device and reports whether startup succeeded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L54)

<a id="field-field-mq3-audio-snd-dma-runtime-services-loadfn-loadfn-src-mq3-audio-snd-dma-runtime-ml-691258753"></a>
### loadFn

```ml
loadFn
```

Host callback that loads the PCM or compressed data for a registered sound asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L58)

<a id="field-field-mq3-audio-snd-dma-runtime-services-localfn-localfn-src-mq3-audio-snd-dma-runtime-ml-118263333"></a>
### localFn

```ml
localFn
```

Host callback that starts a local sound that bypasses world-space attenuation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L62)

<a id="field-field-mq3-audio-snd-dma-runtime-services-musicfn-musicfn-src-mq3-audio-snd-dma-runtime-ml-224927545"></a>
### musicFn

```ml
musicFn
```

Host callback that starts introductory and looping background-music assets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L66)

<a id="field-field-mq3-audio-snd-dma-runtime-services-paintfn-paintfn-src-mq3-audio-snd-dma-runtime-ml-988328605"></a>
### paintFn

```ml
paintFn
```

Host callback that mixes or submits the next range of sound samples on the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L64)

<a id="field-field-mq3-audio-snd-dma-runtime-services-shutdowndmafn-shutdowndmafn-src-mq3-audio-snd-dma-runtime-ml-540133329"></a>
### shutdownDmaFn

```ml
shutdownDmaFn
```

Host callback that shuts down the host audio device and releases device resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L56)

<a id="field-field-mq3-audio-snd-dma-runtime-services-startfn-startfn-src-mq3-audio-snd-dma-runtime-ml-918692417"></a>
### startFn

```ml
startFn
```

Host callback that starts an entity-attached or positioned one-shot sound on the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L60)

<a id="field-field-mq3-audio-snd-dma-runtime-services-stopmusicfn-stopmusicfn-src-mq3-audio-snd-dma-runtime-ml-862368881"></a>
### stopMusicFn

```ml
stopMusicFn
```

Host callback that stops the active background-music stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L68)
