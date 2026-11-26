# `mq3.audio.snd_local.Sfx`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-local-ml-298173627.md)

<a id="struct-struct-mq3-audio-snd-local-sfx-struct-sfx-src-mq3-audio-snd-local-ml-1124043541"></a>
## Sfx

```ml
struct Sfx
```

Sfx record for audio.snd_local, containing `soundData`, `defaultSound`, `inMemory`, `soundCompressed`, `soundCompressionMethod`, `soundLength`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L53)

## Members

<a id="field-field-mq3-audio-snd-local-sfx-defaultsound-defaultsound-src-mq3-audio-snd-local-ml-1293658110"></a>
### defaultSound

```ml
defaultSound
```

True when a fallback sound substitutes for an asset that could not be loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L57)

<a id="field-field-mq3-audio-snd-local-sfx-inmemory-inmemory-src-mq3-audio-snd-local-ml-69424930"></a>
### inMemory

```ml
inMemory
```

True when the sound sample data is currently resident in memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L59)

<a id="field-field-mq3-audio-snd-local-sfx-lasttimeused-lasttimeused-src-mq3-audio-snd-local-ml-1185699326"></a>
### lastTimeUsed

```ml
lastTimeUsed
```

Last-use timestamp used when selecting an old sound for eviction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L69)

<a id="field-field-mq3-audio-snd-local-sfx-next-next-src-mq3-audio-snd-local-ml-2121326076"></a>
### next

```ml
next
```

Next sound-effect descriptor in the registry hash chain.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L71)

<a id="field-field-mq3-audio-snd-local-sfx-soundcompressed-soundcompressed-src-mq3-audio-snd-local-ml-572678138"></a>
### soundCompressed

```ml
soundCompressed
```

True when sound data is stored using a compressed representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L61)

<a id="field-field-mq3-audio-snd-local-sfx-soundcompressionmethod-soundcompressionmethod-src-mq3-audio-snd-local-ml-924572346"></a>
### soundCompressionMethod

```ml
soundCompressionMethod
```

Compression-method identifier used to decode the sound buffers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L63)

<a id="field-field-mq3-audio-snd-local-sfx-sounddata-sounddata-src-mq3-audio-snd-local-ml-1665857190"></a>
### soundData

```ml
soundData
```

Head of the sample-buffer chain or loaded sample data for the sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L55)

<a id="field-field-mq3-audio-snd-local-sfx-soundlength-soundlength-src-mq3-audio-snd-local-ml-541624370"></a>
### soundLength

```ml
soundLength
```

Length of the sound in mono sample positions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L65)

<a id="field-field-mq3-audio-snd-local-sfx-soundname-soundname-src-mq3-audio-snd-local-ml-1962407138"></a>
### soundName

```ml
soundName
```

Quake asset path identifying the registered sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L67)
