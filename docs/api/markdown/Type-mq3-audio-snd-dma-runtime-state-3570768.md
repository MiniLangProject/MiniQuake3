# `mq3.audio.snd_dma_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-dma-runtime-ml-2032678845.md)

<a id="struct-struct-mq3-audio-snd-dma-runtime-state-struct-state-src-mq3-audio-snd-dma-runtime-ml-321903609"></a>
## State

```ml
struct State
```

State record for audio.snd_dma_runtime, containing `services`, `started`, `muted`, `registered`, `soundTime`, `paintedTime`, and 14 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L75)

## Members

<a id="field-field-mq3-audio-snd-dma-runtime-state-backgroundactive-backgroundactive-src-mq3-audio-snd-dma-runtime-ml-1307619388"></a>
### backgroundActive

```ml
backgroundActive
```

True while background music has been requested.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L111)

<a id="field-field-mq3-audio-snd-dma-runtime-state-backgroundintro-backgroundintro-src-mq3-audio-snd-dma-runtime-ml-149729316"></a>
### backgroundIntro

```ml
backgroundIntro
```

Asset path of the introductory background-music clip.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L107)

<a id="field-field-mq3-audio-snd-dma-runtime-state-backgroundloop-backgroundloop-src-mq3-audio-snd-dma-runtime-ml-986658236"></a>
### backgroundLoop

```ml
backgroundLoop
```

Asset path of the repeating background-music clip.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L109)

<a id="field-field-mq3-audio-snd-dma-runtime-state-channels-channels-src-mq3-audio-snd-dma-runtime-ml-817327080"></a>
### channels

```ml
channels
```

One-shot channel allocator and channel state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L89)

<a id="field-field-mq3-audio-snd-dma-runtime-state-inwater-inwater-src-mq3-audio-snd-dma-runtime-ml-316554836"></a>
### inWater

```ml
inWater
```

True when the listener is inside water.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L105)

<a id="field-field-mq3-audio-snd-dma-runtime-state-knownsfx-knownsfx-src-mq3-audio-snd-dma-runtime-ml-131709180"></a>
### knownSfx

```ml
knownSfx
```

Registered sound-effect descriptors keyed by handle or asset name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L93)

<a id="field-field-mq3-audio-snd-dma-runtime-state-listeneraxis-listeneraxis-src-mq3-audio-snd-dma-runtime-ml-1542318194"></a>
### listenerAxis

```ml
listenerAxis
```

Listener orientation axes used to calculate stereo gains.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L103)

<a id="field-field-mq3-audio-snd-dma-runtime-state-listenerentity-listenerentity-src-mq3-audio-snd-dma-runtime-ml-1295014498"></a>
### listenerEntity

```ml
listenerEntity
```

Entity number associated with the current sound listener.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L99)

<a id="field-field-mq3-audio-snd-dma-runtime-state-listenerorigin-listenerorigin-src-mq3-audio-snd-dma-runtime-ml-1779071292"></a>
### listenerOrigin

```ml
listenerOrigin
```

World-space XYZ position of the listener.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L101)

<a id="field-field-mq3-audio-snd-dma-runtime-state-loops-loops-src-mq3-audio-snd-dma-runtime-ml-582771052"></a>
### loops

```ml
loops
```

Looping sound sources submitted by game entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L95)

<a id="field-field-mq3-audio-snd-dma-runtime-state-muted-muted-src-mq3-audio-snd-dma-runtime-ml-72504848"></a>
### muted

```ml
muted
```

True when sound output is temporarily suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L81)

<a id="field-field-mq3-audio-snd-dma-runtime-state-nexthandle-nexthandle-src-mq3-audio-snd-dma-runtime-ml-728051422"></a>
### nextHandle

```ml
nextHandle
```

Handle assigned to the next newly registered sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L113)

<a id="field-field-mq3-audio-snd-dma-runtime-state-origins-origins-src-mq3-audio-snd-dma-runtime-ml-1137792772"></a>
### origins

```ml
origins
```

Entity-indexed source positions used for spatialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L97)

<a id="field-field-mq3-audio-snd-dma-runtime-state-outputrate-outputrate-src-mq3-audio-snd-dma-runtime-ml-1947180678"></a>
### outputRate

```ml
outputRate
```

Output sample rate in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L115)

<a id="field-field-mq3-audio-snd-dma-runtime-state-paintedtime-paintedtime-src-mq3-audio-snd-dma-runtime-ml-1400093616"></a>
### paintedTime

```ml
paintedTime
```

Absolute sample position through which mixing has already been performed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L87)

<a id="field-field-mq3-audio-snd-dma-runtime-state-rawstream-rawstream-src-mq3-audio-snd-dma-runtime-ml-2139746676"></a>
### rawStream

```ml
rawStream
```

Raw stereo stream ring mixed with ordinary sound effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L91)

<a id="field-field-mq3-audio-snd-dma-runtime-state-registered-registered-src-mq3-audio-snd-dma-runtime-ml-983913416"></a>
### registered

```ml
registered
```

True while sound-registration state has been initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L83)

<a id="field-field-mq3-audio-snd-dma-runtime-state-services-services-src-mq3-audio-snd-dma-runtime-ml-63512772"></a>
### services

```ml
services
```

Host callbacks for loading assets, managing audio devices, and reporting diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L77)

<a id="field-field-mq3-audio-snd-dma-runtime-state-soundtime-soundtime-src-mq3-audio-snd-dma-runtime-ml-921407340"></a>
### soundTime

```ml
soundTime
```

Absolute playback position reported by the audio device, in samples.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L85)

<a id="field-field-mq3-audio-snd-dma-runtime-state-started-started-src-mq3-audio-snd-dma-runtime-ml-960526352"></a>
### started

```ml
started
```

True after the audio device has been initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_dma_runtime.ml#L79)
