# `mq3.audio.snd_mem_runtime.Buffer`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-mem-runtime-ml-1049815056.md)

<a id="struct-struct-mq3-audio-snd-mem-runtime-buffer-struct-buffer-src-mq3-audio-snd-mem-runtime-ml-1500574679"></a>
## Buffer

```ml
struct Buffer
```

Buffer record for audio.snd_mem_runtime, containing `samples`, `next`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L17)

## Members

<a id="field-field-mq3-audio-snd-mem-runtime-buffer-next-next-src-mq3-audio-snd-mem-runtime-ml-1657334483"></a>
### next

```ml
next
```

Next buffer in the free list or loaded sound chain.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L21)

<a id="field-field-mq3-audio-snd-mem-runtime-buffer-samples-samples-src-mq3-audio-snd-mem-runtime-ml-1846917209"></a>
### samples

```ml
samples
```

Little-endian signed 16-bit mono PCM bytes stored in this sound-memory chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_runtime.ml#L19)
