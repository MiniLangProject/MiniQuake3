# `src/mq3/audio/snd_mem_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_mem_runtime`](Package-mq3-audio-snd-mem-runtime-2069624288.md)

Reachable from entry: **no**

## Imports

- `mq3/audio/snd_mem_resample.ml` as `resample` → [src/mq3/audio/snd_mem_resample.ml](File-src-mq3-audio-snd-mem-resample-ml-898891771.md)
- `std/array.ml` as `arrays` → `../../a7594a0c0299/MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

- [mq3.audio.snd_mem_runtime.Buffer](Type-mq3-audio-snd-mem-runtime-buffer-1656977268.md) — struct
<a id="constant-constant-mq3-audio-snd-mem-runtime-buffer-bytes-const-buffer-bytes-2052-src-mq3-audio-snd-mem-runtime-ml-2042766486"></a>
### BUFFER_BYTES

```ml
const BUFFER_BYTES = 2052
```

Storage budget in bytes charged for each managed sound buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L12)

<a id="function-function-mq3-audio-snd-mem-runtime-bytesequal-function-bytesequal-data-offset-text-src-mq3-audio-snd-mem-runtime-ml-995615882"></a>
### bytesEqual

```ml
function bytesEqual(data, offset, text)
```

Compute bytes equal in audio.snd_mem_runtime; the normal completion returns `(decode(slice(data, offset, len(bytes(text)))) == text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `slice(data, offset, len(bytes(text)))`. |
| `offset` | `dynamic` | — | Offset used in `(offset < 0)` and `(offset + len(bytes(text)))`. |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `len(bytes(text))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L209)

<a id="function-function-mq3-audio-snd-mem-runtime-chunkname-function-chunkname-data-offset-src-mq3-audio-snd-mem-runtime-ml-1401230809"></a>
### chunkName

```ml
function chunkName(data, offset)
```

Compute chunk name in audio.snd_mem_runtime; the normal completion returns `decode(slice(data, offset, 4))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `slice(data, offset, 4)`. |
| `offset` | `dynamic` | — | Offset used in `(offset < 0)` and `(offset + 4)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L182)

- [mq3.audio.snd_mem_runtime.ChunkReader](Type-mq3-audio-snd-mem-runtime-chunkreader-1639699504.md) — struct
<a id="function-function-mq3-audio-snd-mem-runtime-create-function-create-dmaspeed-host-src-mq3-audio-snd-mem-runtime-ml-1408311421"></a>
### create

```ml
function create(dmaSpeed, host)
```

Create snd mem runtime in audio.snd_mem_runtime; the normal completion returns `State([], [], 0, 0, bytes(((SND_CHUNK_SIZE * 2) * 4), 0), void, 0, dmaSpeed, host)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dmaSpeed` | `dynamic` | — | Initial `dmaSpeed` field stored in the returned or constructed `mq3.audio.snd_mem_runtime.State` record. |
| `host` | `dynamic` | — | Initial `services` field stored in the returned or constructed `mq3.audio.snd_mem_runtime.State` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L126)

<a id="constant-constant-mq3-audio-snd-mem-runtime-default-sound-megs-const-default-sound-megs-8-src-mq3-audio-snd-mem-runtime-ml-1480699965"></a>
### DEFAULT_SOUND_MEGS

```ml
const DEFAULT_SOUND_MEGS = 8
```

Default soundMegs setting used to calculate the sound-buffer pool size.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L14)

<a id="function-function-mq3-audio-snd-mem-runtime-emit-function-emit-state-message-src-mq3-audio-snd-mem-runtime-ml-1077832022"></a>
### emit

```ml
function emit(state, message)
```

Emit snd mem runtime in audio.snd_mem_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. |
| `message` | `dynamic` | — | Message used in `state.services.diagnosticFn(state.services.context, message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L115)

<a id="function-function-mq3-audio-snd-mem-runtime-emptyinfo-function-emptyinfo-src-mq3-audio-snd-mem-runtime-ml-819248612"></a>
### emptyInfo

```ml
function emptyInfo()
```

Create `mq3.audio.snd_mem_runtime.WavInfo` with format=0; channels=0; rate=0; width=0; samples=0; dataofs=0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L120)

<a id="function-function-mq3-audio-snd-mem-runtime-fail-function-fail-message-src-mq3-audio-snd-mem-runtime-ml-221038041"></a>
### fail

```ml
function fail(message)
```

Create the audio.snd_mem_runtime error for `fail` with 7760 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("snd_mem: " + message)` and `error(7760, ("snd_mem: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L111)

<a id="function-function-mq3-audio-snd-mem-runtime-findchunk-function-findchunk-value-name-src-mq3-audio-snd-mem-runtime-ml-11741236"></a>
### FindChunk

```ml
function FindChunk(value, name)
```

Find chunk in audio.snd_mem_runtime; the normal completion returns `FindNextChunk(value, name)`.

Direct state writes: `value.lastChunk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `iffData`. Updated in place: `lastChunk`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.audio.snd_mem_runtime.FindNextChunk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L204)

<a id="function-function-mq3-audio-snd-mem-runtime-findnextchunk-function-findnextchunk-value-name-src-mq3-audio-snd-mem-runtime-ml-1379877482"></a>
### FindNextChunk

```ml
function FindNextChunk(value, name)
```

Find next chunk in audio.snd_mem_runtime; updates `value.dataPos`, `value.chunkLen`, `value.lastChunk`.

Direct state writes: `value.dataPos`, `value.chunkLen`, `value.lastChunk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `data`, `lastChunk`, `iffEnd`. Updated in place: `dataPos`, `chunkLen`, `lastChunk`. |
| `name` | `dynamic` | — | Name used in `bytes(name)` and `len(bytes(name))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L188)

<a id="function-function-mq3-audio-snd-mem-runtime-getlittlelong-function-getlittlelong-value-src-mq3-audio-snd-mem-runtime-ml-855426547"></a>
### GetLittleLong

```ml
function GetLittleLong(value)
```

Get little long in audio.snd_mem_runtime; the normal completion returns `result`.

Direct state writes: `value.dataPos`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `data`, `dataPos`, `iffEnd`. Updated in place: `dataPos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L175)

<a id="function-function-mq3-audio-snd-mem-runtime-getlittleshort-function-getlittleshort-value-src-mq3-audio-snd-mem-runtime-ml-1690598291"></a>
### GetLittleShort

```ml
function GetLittleShort(value)
```

Get little short in audio.snd_mem_runtime; the normal completion returns `result`.

Direct state writes: `value.dataPos`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `data`, `dataPos`, `iffEnd`. Updated in place: `dataPos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L167)

<a id="function-function-mq3-audio-snd-mem-runtime-getwavinfo-function-getwavinfo-name-wav-wavlength-src-mq3-audio-snd-mem-runtime-ml-1717444269"></a>
### GetWavinfo

```ml
function GetWavinfo(name, wav, wavlength)
```

Get wavinfo in audio.snd_mem_runtime; the normal completion returns `WavInfo(format, channels, rate, width, (dataLength / width), dataofs)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `wav` | `dynamic` | — | Data passed as `data` to `mq3.audio.snd_mem_runtime.reader`. |
| `wavlength` | `dynamic` | — | Wavlength used in `(wavlength < 0)` and `(wavlength > len(wav))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L214)

<a id="function-function-mq3-audio-snd-mem-runtime-newbuffer-function-newbuffer-src-mq3-audio-snd-mem-runtime-ml-275247434"></a>
### newBuffer

```ml
function newBuffer()
```

Create `mq3.audio.snd_mem_runtime.Buffer` with samples=bytes((SND_CHUNK_SIZE * 2), 0); next=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L122)

<a id="function-function-mq3-audio-snd-mem-runtime-reader-function-reader-data-src-mq3-audio-snd-mem-runtime-ml-1085692890"></a>
### reader

```ml
function reader(data)
```

Compute reader in audio.snd_mem_runtime; the normal completion returns `ChunkReader(data, 0, len(data), 0, 0, 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Initial `data` field stored in the returned or constructed `mq3.audio.snd_mem_runtime.ChunkReader` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L118)

<a id="function-function-mq3-audio-snd-mem-runtime-releasefile-function-releasefile-state-data-src-mq3-audio-snd-mem-runtime-ml-1065413697"></a>
### releaseFile

```ml
function releaseFile(state, data)
```

Release file in audio.snd_mem_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. |
| `data` | `dynamic` | — | Data used in `state.services.freeFileFn(state.services.context, data)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L268)

<a id="function-function-mq3-audio-snd-mem-runtime-resamplesfx-function-resamplesfx-state-sfx-inrate-inwidth-data-compressed-src-mq3-audio-snd-mem-runtime-ml-326467509"></a>
### ResampleSfx

```ml
function ResampleSfx(state, sfx, inrate, inwidth, data, compressed)
```

Update `sfx.soundLength`, `sfx.soundData` in audio.snd_mem_runtime; the normal completion returns `count`.

Direct state writes: `sfx.soundLength`, `sfx.soundData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.audio.snd_mem_runtime.ResampleSfxRaw`. |
| `sfx` | `dynamic` | — | Record exposing `soundLength`. Updated in place: `soundLength`, `soundData`. |
| `inrate` | `dynamic` | — | Inrate passed as `inrate` to `mq3.audio.snd_mem_runtime.ResampleSfxRaw`. |
| `inwidth` | `dynamic` | — | Inwidth passed as `inwidth` to `mq3.audio.snd_mem_runtime.ResampleSfxRaw`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.audio.snd_mem_runtime.ResampleSfxRaw`. |
| `compressed` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L254)

<a id="function-function-mq3-audio-snd-mem-runtime-resamplesfxraw-function-resamplesfxraw-state-inrate-inwidth-samples-data-src-mq3-audio-snd-mem-runtime-ml-1093945282"></a>
### ResampleSfxRaw

```ml
function ResampleSfxRaw(state, inrate, inwidth, samples, data)
```

Compute resample sfx raw in audio.snd_mem_runtime; the normal completion returns `resample.resampleRaw(data, inrate, inwidth, samples, state.dmaSpeed)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `dmaSpeed`. |
| `inrate` | `dynamic` | — | Input rate passed as `inputRate` to `mq3.audio.snd_mem_resample.resampleRaw`. |
| `inwidth` | `dynamic` | — | Input width passed as `inputWidth` to `mq3.audio.snd_mem_resample.resampleRaw`. |
| `samples` | `dynamic` | — | Samples passed as `samples` to `mq3.audio.snd_mem_resample.resampleRaw`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.audio.snd_mem_resample.resampleRaw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L235)

<a id="function-function-mq3-audio-snd-mem-runtime-s-displayfreememory-function-s-displayfreememory-state-src-mq3-audio-snd-mem-runtime-ml-48054969"></a>
### S_DisplayFreeMemory

```ml
function S_DisplayFreeMemory(state)
```

Compute display free memory in audio.snd_mem_runtime; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `inUse`, `totalInUse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L161)

<a id="function-function-mq3-audio-snd-mem-runtime-s-loadsound-function-s-loadsound-state-sfx-src-mq3-audio-snd-mem-runtime-ml-1212648036"></a>
### S_LoadSound

```ml
function S_LoadSound(state, sfx)
```

Load sound in audio.snd_mem_runtime; the normal completion returns `true`.

Direct state writes: `sfx.lastTimeUsed`, `sfx.soundCompressionMethod`, `sfx.soundData`, `sfx.soundLength`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `services`. |
| `sfx` | `dynamic` | — | Record exposing `soundName`, `soundCompressed`. Updated in place: `lastTimeUsed`, `soundCompressionMethod`, `soundData`, `soundLength`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L274)

<a id="function-function-mq3-audio-snd-mem-runtime-services-function-services-src-mq3-audio-snd-mem-runtime-ml-143860290"></a>
### services

```ml
function services()
```

Create `mq3.audio.snd_mem_runtime.Services` with readFileFn=void; freeFileFn=void; millisecondsFn=void; adpcmEncodeFn=void; freeOldestFn=void; diagnosticFn=void; context=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L108)

- [mq3.audio.snd_mem_runtime.Services](Type-mq3-audio-snd-mem-runtime-services-1718217382.md) — struct
- [mq3.audio.snd_mem_runtime.Sfx](Type-mq3-audio-snd-mem-runtime-sfx-1804539885.md) — struct
<a id="constant-constant-mq3-audio-snd-mem-runtime-snd-chunk-size-const-snd-chunk-size-1024-src-mq3-audio-snd-mem-runtime-ml-189203026"></a>
### SND_CHUNK_SIZE

```ml
const SND_CHUNK_SIZE = 1024
```

Number of signed 16-bit mono samples stored in one sound-memory chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L10)

<a id="function-function-mq3-audio-snd-mem-runtime-snd-free-function-snd-free-state-value-src-mq3-audio-snd-mem-runtime-ml-1980006360"></a>
### SND_free

```ml
function SND_free(state, value)
```

Update `state.freelist`, `state.inUse`, `value.next` in audio.snd_mem_runtime.

Direct state writes: `state.freelist`, `state.inUse`, `value.next`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `freelist`, `inUse`. Updated in place: `freelist`, `inUse`. |
| `value` | `dynamic` | — | Updated in place: `next`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L145)

<a id="function-function-mq3-audio-snd-mem-runtime-snd-malloc-function-snd-malloc-state-src-mq3-audio-snd-mem-runtime-ml-226779263"></a>
### SND_malloc

```ml
function SND_malloc(state)
```

Update `state.freelist`, `state.inUse`, `state.totalInUse` in audio.snd_mem_runtime; the normal completion returns `value`.

Direct state writes: `state.freelist`, `state.inUse`, `state.totalInUse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `freelist`, `services`, `inUse`, `totalInUse`. Updated in place: `freelist`, `inUse`, `totalInUse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L153)

<a id="function-function-mq3-audio-snd-mem-runtime-snd-setup-function-snd-setup-state-soundmegs-src-mq3-audio-snd-mem-runtime-ml-1787618176"></a>
### SND_setup

```ml
function SND_setup(state, soundMegs)
```

Update `state.buffers`, `state.freelist`, `state.inUse`, `state.totalInUse` in audio.snd_mem_runtime; the normal completion returns `count`.

Direct state writes: `state.buffers`, `state.freelist`, `state.inUse`, `state.totalInUse`, `state.scratch`, `state.scratchPointer`, `state.scratchIndex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `buffers`, `freelist`. Updated in place: `buffers`, `freelist`, `inUse`, `totalInUse`, `scratch`, `scratchPointer` and further fields. |
| `soundMegs` | `dynamic` | — | Sound megs used in `(soundMegs <= 0)` and `(soundMegs * 1536)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L133)

- [mq3.audio.snd_mem_runtime.State](Type-mq3-audio-snd-mem-runtime-state-1723131423.md) — struct
- [mq3.audio.snd_mem_runtime.WavInfo](Type-mq3-audio-snd-mem-runtime-wavinfo-790698128.md) — struct
<a id="function-function-mq3-audio-snd-mem-runtime-writechunksample-function-writechunksample-chunk-index-source-offset-src-mq3-audio-snd-mem-runtime-ml-568147103"></a>
### writeChunkSample

```ml
function writeChunkSample(chunk, index, source, offset)
```

Write chunk sample in audio.snd_mem_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `chunk` | `dynamic` | — | Record exposing `samples`. |
| `index` | `dynamic` | — | Index used in `(index * 2)` and `((index * 2) + 1)`. |
| `source` | `dynamic` | — | Source used in `source[offset]` and `source[(offset + 1)]`. |
| `offset` | `dynamic` | — | Zero-based index into `source`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_runtime.ml#L244)
