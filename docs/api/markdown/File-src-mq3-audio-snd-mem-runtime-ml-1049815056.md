# `src/mq3/audio/snd_mem_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_mem_runtime`](Package-mq3-audio-snd-mem-runtime-2069624288.md)

Reachable from entry: **no**

## Imports

- `mq3/audio/snd_mem_resample.ml` as `resample` → [src/mq3/audio/snd_mem_resample.ml](File-src-mq3-audio-snd-mem-resample-ml-898891771.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

- [mq3.audio.snd_mem_runtime.Buffer](Type-mq3-audio-snd-mem-runtime-buffer-1656977268.md) — struct
<a id="constant-constant-mq3-audio-snd-mem-runtime-buffer-bytes-const-buffer-bytes-2052-src-mq3-audio-snd-mem-runtime-ml-2042766486"></a>
### BUFFER_BYTES

```ml
const BUFFER_BYTES = 2052
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L10)

<a id="function-function-mq3-audio-snd-mem-runtime-bytesequal-function-bytesequal-data-offset-text-src-mq3-audio-snd-mem-runtime-ml-995615882"></a>
### bytesEqual

```ml
function bytesEqual(data, offset, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L68)

<a id="function-function-mq3-audio-snd-mem-runtime-chunkname-function-chunkname-data-offset-src-mq3-audio-snd-mem-runtime-ml-1401230809"></a>
### chunkName

```ml
function chunkName(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L55)

- [mq3.audio.snd_mem_runtime.ChunkReader](Type-mq3-audio-snd-mem-runtime-chunkreader-1639699504.md) — struct
<a id="function-function-mq3-audio-snd-mem-runtime-create-function-create-dmaspeed-host-src-mq3-audio-snd-mem-runtime-ml-1408311421"></a>
### create

```ml
function create(dmaSpeed, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dmaSpeed` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L26)

<a id="constant-constant-mq3-audio-snd-mem-runtime-default-sound-megs-const-default-sound-megs-8-src-mq3-audio-snd-mem-runtime-ml-1480699965"></a>
### DEFAULT_SOUND_MEGS

```ml
const DEFAULT_SOUND_MEGS = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L11)

<a id="function-function-mq3-audio-snd-mem-runtime-emit-function-emit-state-message-src-mq3-audio-snd-mem-runtime-ml-1077832022"></a>
### emit

```ml
function emit(state, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L22)

<a id="function-function-mq3-audio-snd-mem-runtime-emptyinfo-function-emptyinfo-src-mq3-audio-snd-mem-runtime-ml-819248612"></a>
### emptyInfo

```ml
function emptyInfo()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L24)

<a id="function-function-mq3-audio-snd-mem-runtime-fail-function-fail-message-src-mq3-audio-snd-mem-runtime-ml-221038041"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L21)

<a id="function-function-mq3-audio-snd-mem-runtime-findchunk-function-findchunk-value-name-src-mq3-audio-snd-mem-runtime-ml-11741236"></a>
### FindChunk

```ml
function FindChunk(value, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L67)

<a id="function-function-mq3-audio-snd-mem-runtime-findnextchunk-function-findnextchunk-value-name-src-mq3-audio-snd-mem-runtime-ml-1379877482"></a>
### FindNextChunk

```ml
function FindNextChunk(value, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L56)

<a id="function-function-mq3-audio-snd-mem-runtime-getlittlelong-function-getlittlelong-value-src-mq3-audio-snd-mem-runtime-ml-855426547"></a>
### GetLittleLong

```ml
function GetLittleLong(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L51)

<a id="function-function-mq3-audio-snd-mem-runtime-getlittleshort-function-getlittleshort-value-src-mq3-audio-snd-mem-runtime-ml-1690598291"></a>
### GetLittleShort

```ml
function GetLittleShort(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L47)

<a id="function-function-mq3-audio-snd-mem-runtime-getwavinfo-function-getwavinfo-name-wav-wavlength-src-mq3-audio-snd-mem-runtime-ml-1717444269"></a>
### GetWavinfo

```ml
function GetWavinfo(name, wav, wavlength)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `wav` | `dynamic` | — |  |
| `wavlength` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L69)

<a id="function-function-mq3-audio-snd-mem-runtime-newbuffer-function-newbuffer-src-mq3-audio-snd-mem-runtime-ml-275247434"></a>
### newBuffer

```ml
function newBuffer()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L25)

<a id="function-function-mq3-audio-snd-mem-runtime-reader-function-reader-data-src-mq3-audio-snd-mem-runtime-ml-1085692890"></a>
### reader

```ml
function reader(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L23)

<a id="function-function-mq3-audio-snd-mem-runtime-releasefile-function-releasefile-state-data-src-mq3-audio-snd-mem-runtime-ml-1065413697"></a>
### releaseFile

```ml
function releaseFile(state, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L100)

<a id="function-function-mq3-audio-snd-mem-runtime-resamplesfx-function-resamplesfx-state-sfx-inrate-inwidth-data-compressed-src-mq3-audio-snd-mem-runtime-ml-326467509"></a>
### ResampleSfx

```ml
function ResampleSfx(state, sfx, inrate, inwidth, data, compressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sfx` | `dynamic` | — |  |
| `inrate` | `dynamic` | — |  |
| `inwidth` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `compressed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L89)

<a id="function-function-mq3-audio-snd-mem-runtime-resamplesfxraw-function-resamplesfxraw-state-inrate-inwidth-samples-data-src-mq3-audio-snd-mem-runtime-ml-1093945282"></a>
### ResampleSfxRaw

```ml
function ResampleSfxRaw(state, inrate, inwidth, samples, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `inrate` | `dynamic` | — |  |
| `inwidth` | `dynamic` | — |  |
| `samples` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L84)

<a id="function-function-mq3-audio-snd-mem-runtime-s-displayfreememory-function-s-displayfreememory-state-src-mq3-audio-snd-mem-runtime-ml-48054969"></a>
### S_DisplayFreeMemory

```ml
function S_DisplayFreeMemory(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L45)

<a id="function-function-mq3-audio-snd-mem-runtime-s-loadsound-function-s-loadsound-state-sfx-src-mq3-audio-snd-mem-runtime-ml-1212648036"></a>
### S_LoadSound

```ml
function S_LoadSound(state, sfx)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sfx` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L101)

<a id="function-function-mq3-audio-snd-mem-runtime-services-function-services-src-mq3-audio-snd-mem-runtime-ml-143860290"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L20)

- [mq3.audio.snd_mem_runtime.Services](Type-mq3-audio-snd-mem-runtime-services-1718217382.md) — struct
- [mq3.audio.snd_mem_runtime.Sfx](Type-mq3-audio-snd-mem-runtime-sfx-1804539885.md) — struct
<a id="constant-constant-mq3-audio-snd-mem-runtime-snd-chunk-size-const-snd-chunk-size-1024-src-mq3-audio-snd-mem-runtime-ml-189203026"></a>
### SND_CHUNK_SIZE

```ml
const SND_CHUNK_SIZE = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L9)

<a id="function-function-mq3-audio-snd-mem-runtime-snd-free-function-snd-free-state-value-src-mq3-audio-snd-mem-runtime-ml-1980006360"></a>
### SND_free

```ml
function SND_free(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L35)

<a id="function-function-mq3-audio-snd-mem-runtime-snd-malloc-function-snd-malloc-state-src-mq3-audio-snd-mem-runtime-ml-226779263"></a>
### SND_malloc

```ml
function SND_malloc(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L39)

<a id="function-function-mq3-audio-snd-mem-runtime-snd-setup-function-snd-setup-state-soundmegs-src-mq3-audio-snd-mem-runtime-ml-1787618176"></a>
### SND_setup

```ml
function SND_setup(state, soundMegs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `soundMegs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L28)

- [mq3.audio.snd_mem_runtime.State](Type-mq3-audio-snd-mem-runtime-state-1723131423.md) — struct
- [mq3.audio.snd_mem_runtime.WavInfo](Type-mq3-audio-snd-mem-runtime-wavinfo-790698128.md) — struct
<a id="function-function-mq3-audio-snd-mem-runtime-writechunksample-function-writechunksample-chunk-index-source-offset-src-mq3-audio-snd-mem-runtime-ml-568147103"></a>
### writeChunkSample

```ml
function writeChunkSample(chunk, index, source, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `chunk` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L88)
