# `mq3.audio.snd_dma_runtime.Loop`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-dma-runtime-ml-2032678845.md)

<a id="struct-struct-mq3-audio-snd-dma-runtime-loop-struct-loop-src-mq3-audio-snd-dma-runtime-ml-775203657"></a>
## Loop

```ml
struct Loop
```

Loop record for audio.snd_dma_runtime, containing `entity`, `origin`, `velocity`, `handle`, `realLoop`, `active`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L37)

## Members

<a id="field-field-mq3-audio-snd-dma-runtime-loop-active-active-src-mq3-audio-snd-dma-runtime-ml-2128540031"></a>
### active

```ml
active
```

True while this sound, channel, or music stream participates in playback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L49)

<a id="field-field-mq3-audio-snd-dma-runtime-loop-entity-entity-src-mq3-audio-snd-dma-runtime-ml-1911926669"></a>
### entity

```ml
entity
```

Game-entity number to which the sound source or channel belongs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L39)

<a id="field-field-mq3-audio-snd-dma-runtime-loop-handle-handle-src-mq3-audio-snd-dma-runtime-ml-74581115"></a>
### handle

```ml
handle
```

Registered sound handle used to resolve the sound asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L45)

<a id="field-field-mq3-audio-snd-dma-runtime-loop-origin-origin-src-mq3-audio-snd-dma-runtime-ml-280959791"></a>
### origin

```ml
origin
```

World-space XYZ position of the sound source.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L41)

<a id="field-field-mq3-audio-snd-dma-runtime-loop-realloop-realloop-src-mq3-audio-snd-dma-runtime-ml-536880379"></a>
### realLoop

```ml
realLoop
```

True for a persistent real looping sound rather than a frame-submitted loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L47)

<a id="field-field-mq3-audio-snd-dma-runtime-loop-velocity-velocity-src-mq3-audio-snd-dma-runtime-ml-333113949"></a>
### velocity

```ml
velocity
```

World-space velocity of the sound source used for Doppler adjustment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L43)
