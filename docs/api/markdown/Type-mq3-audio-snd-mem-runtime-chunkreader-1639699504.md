# `mq3.audio.snd_mem_runtime.ChunkReader`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-mem-runtime-ml-1049815056.md)

<a id="struct-struct-mq3-audio-snd-mem-runtime-chunkreader-struct-chunkreader-src-mq3-audio-snd-mem-runtime-ml-743250369"></a>
## ChunkReader

```ml
struct ChunkReader
```

ChunkReader record for audio.snd_mem_runtime, containing `data`, `dataPos`, `iffEnd`, `lastChunk`, `iffData`, `chunkLen`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L54)

## Members

<a id="field-field-mq3-audio-snd-mem-runtime-chunkreader-chunklen-chunklen-src-mq3-audio-snd-mem-runtime-ml-1384181157"></a>
### chunkLen

```ml
chunkLen
```

Length of the current RIFF chunk payload in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L66)

<a id="field-field-mq3-audio-snd-mem-runtime-chunkreader-data-data-src-mq3-audio-snd-mem-runtime-ml-1513699421"></a>
### data

```ml
data
```

Complete WAVE file bytes being parsed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L56)

<a id="field-field-mq3-audio-snd-mem-runtime-chunkreader-datapos-datapos-src-mq3-audio-snd-mem-runtime-ml-833267545"></a>
### dataPos

```ml
dataPos
```

Current byte position while scanning RIFF chunks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L58)

<a id="field-field-mq3-audio-snd-mem-runtime-chunkreader-iffdata-iffdata-src-mq3-audio-snd-mem-runtime-ml-1199932489"></a>
### iffData

```ml
iffData
```

Byte position of the currently selected chunk payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L64)

<a id="field-field-mq3-audio-snd-mem-runtime-chunkreader-iffend-iffend-src-mq3-audio-snd-mem-runtime-ml-225632353"></a>
### iffEnd

```ml
iffEnd
```

Exclusive byte boundary of the enclosing RIFF payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L60)

<a id="field-field-mq3-audio-snd-mem-runtime-chunkreader-lastchunk-lastchunk-src-mq3-audio-snd-mem-runtime-ml-518820917"></a>
### lastChunk

```ml
lastChunk
```

Byte position of the most recently selected RIFF chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L62)
