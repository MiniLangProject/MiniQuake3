# `mq3.audio.snd_mem_runtime.Sfx`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-mem-runtime-ml-1049815056.md)

<a id="struct-struct-mq3-audio-snd-mem-runtime-sfx-struct-sfx-src-mq3-audio-snd-mem-runtime-ml-308752643"></a>
## Sfx

```ml
struct Sfx
```

Sfx record for audio.snd_mem_runtime, containing `soundName`, `soundCompressed`, `soundCompressionMethod`, `soundData`, `soundLength`, `lastTimeUsed`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L24)

## Members

<a id="field-field-mq3-audio-snd-mem-runtime-sfx-lasttimeused-lasttimeused-src-mq3-audio-snd-mem-runtime-ml-998536034"></a>
### lastTimeUsed

```ml
lastTimeUsed
```

Last-use timestamp used when selecting an old sound for eviction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L36)

<a id="field-field-mq3-audio-snd-mem-runtime-sfx-soundcompressed-soundcompressed-src-mq3-audio-snd-mem-runtime-ml-488343554"></a>
### soundCompressed

```ml
soundCompressed
```

True when sound data is stored using a compressed representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L28)

<a id="field-field-mq3-audio-snd-mem-runtime-sfx-soundcompressionmethod-soundcompressionmethod-src-mq3-audio-snd-mem-runtime-ml-330525586"></a>
### soundCompressionMethod

```ml
soundCompressionMethod
```

Compression-method identifier used to decode the sound buffers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L30)

<a id="field-field-mq3-audio-snd-mem-runtime-sfx-sounddata-sounddata-src-mq3-audio-snd-mem-runtime-ml-1181234750"></a>
### soundData

```ml
soundData
```

Head of the sample-buffer chain or loaded sample data for the sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L32)

<a id="field-field-mq3-audio-snd-mem-runtime-sfx-soundlength-soundlength-src-mq3-audio-snd-mem-runtime-ml-1369799066"></a>
### soundLength

```ml
soundLength
```

Length of the sound in mono sample positions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L34)

<a id="field-field-mq3-audio-snd-mem-runtime-sfx-soundname-soundname-src-mq3-audio-snd-mem-runtime-ml-638003738"></a>
### soundName

```ml
soundName
```

Quake asset path identifying the registered sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L26)
