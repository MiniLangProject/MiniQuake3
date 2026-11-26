# `mq3.audio.snd_mem_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-audio-snd-mem-runtime-ml-1049815056.md)

<a id="struct-struct-mq3-audio-snd-mem-runtime-state-struct-state-src-mq3-audio-snd-mem-runtime-ml-108888591"></a>
## State

```ml
struct State
```

State record for audio.snd_mem_runtime, containing `buffers`, `freelist`, `inUse`, `totalInUse`, `scratch`, `scratchPointer`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L86)

## Members

<a id="field-field-mq3-audio-snd-mem-runtime-state-buffers-buffers-src-mq3-audio-snd-mem-runtime-ml-1035322496"></a>
### buffers

```ml
buffers
```

All managed sound-buffer allocations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L88)

<a id="field-field-mq3-audio-snd-mem-runtime-state-dmaspeed-dmaspeed-src-mq3-audio-snd-mem-runtime-ml-1900521226"></a>
### dmaSpeed

```ml
dmaSpeed
```

Target DMA sample rate in hertz used when loading sounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L102)

<a id="field-field-mq3-audio-snd-mem-runtime-state-freelist-freelist-src-mq3-audio-snd-mem-runtime-ml-857641084"></a>
### freelist

```ml
freelist
```

List of sound buffers available for allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L90)

<a id="field-field-mq3-audio-snd-mem-runtime-state-inuse-inuse-src-mq3-audio-snd-mem-runtime-ml-1644245132"></a>
### inUse

```ml
inUse
```

Remaining free sound-buffer storage budget in bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L92)

<a id="field-field-mq3-audio-snd-mem-runtime-state-scratch-scratch-src-mq3-audio-snd-mem-runtime-ml-1821352652"></a>
### scratch

```ml
scratch
```

Temporary sample storage used while loading or decoding a sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L96)

<a id="field-field-mq3-audio-snd-mem-runtime-state-scratchindex-scratchindex-src-mq3-audio-snd-mem-runtime-ml-1897126852"></a>
### scratchIndex

```ml
scratchIndex
```

Cached source-block index associated with the scratch decoder state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L100)

<a id="field-field-mq3-audio-snd-mem-runtime-state-scratchpointer-scratchpointer-src-mq3-audio-snd-mem-runtime-ml-513490350"></a>
### scratchPointer

```ml
scratchPointer
```

Cached source-buffer reference associated with the scratch decoder state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L98)

<a id="field-field-mq3-audio-snd-mem-runtime-state-services-services-src-mq3-audio-snd-mem-runtime-ml-1081922092"></a>
### services

```ml
services
```

Host callbacks for loading assets, managing audio devices, and reporting diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L104)

<a id="field-field-mq3-audio-snd-mem-runtime-state-totalinuse-totalinuse-src-mq3-audio-snd-mem-runtime-ml-1656993732"></a>
### totalInUse

```ml
totalInUse
```

Cumulative bytes handed out by the sound-buffer allocator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L94)
