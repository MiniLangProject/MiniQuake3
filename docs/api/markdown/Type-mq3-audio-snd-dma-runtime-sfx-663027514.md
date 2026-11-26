# `mq3.audio.snd_dma_runtime.Sfx`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-dma-runtime-ml-2032678845.md)

<a id="struct-struct-mq3-audio-snd-dma-runtime-sfx-struct-sfx-src-mq3-audio-snd-dma-runtime-ml-1983976313"></a>
## Sfx

```ml
struct Sfx
```

Sfx record for audio.snd_dma_runtime, containing `handle`, `soundName`, `soundLength`, `soundData`, `defaultSound`, `inMemory`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L18)

## Members

<a id="field-field-mq3-audio-snd-dma-runtime-sfx-defaultsound-defaultsound-src-mq3-audio-snd-dma-runtime-ml-960550842"></a>
### defaultSound

```ml
defaultSound
```

True when a fallback sound substitutes for an asset that could not be loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L28)

<a id="field-field-mq3-audio-snd-dma-runtime-sfx-handle-handle-src-mq3-audio-snd-dma-runtime-ml-451614214"></a>
### handle

```ml
handle
```

Registered sound handle used to resolve the sound asset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L20)

<a id="field-field-mq3-audio-snd-dma-runtime-sfx-inmemory-inmemory-src-mq3-audio-snd-dma-runtime-ml-533792238"></a>
### inMemory

```ml
inMemory
```

True when the sound sample data is currently resident in memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L30)

<a id="field-field-mq3-audio-snd-dma-runtime-sfx-lasttimeused-lasttimeused-src-mq3-audio-snd-dma-runtime-ml-165122458"></a>
### lastTimeUsed

```ml
lastTimeUsed
```

Last-use timestamp used when selecting an old sound for eviction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L34)

<a id="field-field-mq3-audio-snd-dma-runtime-sfx-soundcompressed-soundcompressed-src-mq3-audio-snd-dma-runtime-ml-1618853894"></a>
### soundCompressed

```ml
soundCompressed
```

True when sound data is stored using a compressed representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L32)

<a id="field-field-mq3-audio-snd-dma-runtime-sfx-sounddata-sounddata-src-mq3-audio-snd-dma-runtime-ml-1936352162"></a>
### soundData

```ml
soundData
```

Head of the sample-buffer chain or loaded sample data for the sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L26)

<a id="field-field-mq3-audio-snd-dma-runtime-sfx-soundlength-soundlength-src-mq3-audio-snd-dma-runtime-ml-82110446"></a>
### soundLength

```ml
soundLength
```

Length of the sound in mono sample positions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L24)

<a id="field-field-mq3-audio-snd-dma-runtime-sfx-soundname-soundname-src-mq3-audio-snd-dma-runtime-ml-1654435150"></a>
### soundName

```ml
soundName
```

Quake asset path identifying the registered sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_dma_runtime.ml#L22)
