# `src/mq3/audio/snd_local.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_local`](Package-mq3-audio-snd-local-1732015029.md)

Reachable from entry: **yes**

## Declarations

- [mq3.audio.snd_local.AdpcmState](Type-mq3-audio-snd-local-adpcmstate-1721802829.md) — struct
<a id="function-function-mq3-audio-snd-local-allrecordfields-function-allrecordfields-src-mq3-audio-snd-local-ml-405672382"></a>
### allRecordFields

```ml
function allRecordFields()
```

List the 52 names in audio.snd_local.allRecordFields, beginning with `left`, `right`, `sample`, `index`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L158)

- [mq3.audio.snd_local.Channel](Type-mq3-audio-snd-local-channel-48098440.md) — struct
<a id="function-function-mq3-audio-snd-local-chunkcount-function-chunkcount-samples-src-mq3-audio-snd-local-ml-824962833"></a>
### chunkCount

```ml
function chunkCount(samples)
```

Compute chunk count in audio.snd_local; the normal completion returns `(((samples + SND_CHUNK_SIZE) - 1) / SND_CHUNK_SIZE)`.

Validation failures include `snd_local.h: negative sample count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — | Samples used in `(samples < 0)` and `(samples == 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L167)

<a id="function-function-mq3-audio-snd-local-clampvolume-function-clampvolume-value-src-mq3-audio-snd-local-ml-738618669"></a>
### clampVolume

```ml
function clampVolume(value)
```

Clamp volume in audio.snd_local; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value < 0)` and `(value > 255)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L170)

<a id="function-function-mq3-audio-snd-local-declarationnames-function-declarationnames-src-mq3-audio-snd-local-ml-1594599424"></a>
### declarationNames

```ml
function declarationNames()
```

List the 20 names in audio.snd_local.declarationNames, beginning with `SNDDMA_Init`, `SNDDMA_GetDMAPos`, `SNDDMA_Shutdown`, `SNDDMA_BeginPainting`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L160)

- [mq3.audio.snd_local.Dma](Type-mq3-audio-snd-local-dma-858754229.md) — struct
<a id="function-function-mq3-audio-snd-local-externalnames-function-externalnames-src-mq3-audio-snd-local-ml-343884398"></a>
### externalNames

```ml
function externalNames()
```

List the 21 names in audio.snd_local.externalNames, beginning with `s_channels`, `loop_channels`, `numLoopChannels`, `s_paintedtime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L162)

- [mq3.audio.snd_local.LoopSound](Type-mq3-audio-snd-local-loopsound-1501385974.md) — struct
<a id="constant-constant-mq3-audio-snd-local-max-channels-const-max-channels-96-src-mq3-audio-snd-local-ml-604442264"></a>
### MAX_CHANNELS

```ml
const MAX_CHANNELS = 96
```

Maximum number of simultaneously allocated sound channels.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L18)

<a id="constant-constant-mq3-audio-snd-local-max-raw-samples-const-max-raw-samples-16384-src-mq3-audio-snd-local-ml-1525682803"></a>
### MAX_RAW_SAMPLES

```ml
const MAX_RAW_SAMPLES = 16384
```

Number of mono sample positions in each raw-stream ring buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L20)

<a id="constant-constant-mq3-audio-snd-local-nxstream-is-byte-const-nxstream-is-byte-true-src-mq3-audio-snd-local-ml-1884309919"></a>
### NXSTREAM_IS_BYTE

```ml
const NXSTREAM_IS_BYTE = true
```

Selects byte-oriented storage for the compressed sample stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L26)

<a id="constant-constant-mq3-audio-snd-local-paintbuffer-size-const-paintbuffer-size-4096-src-mq3-audio-snd-local-ml-1655778738"></a>
### PAINTBUFFER_SIZE

```ml
const PAINTBUFFER_SIZE = 4096
```

Maximum number of stereo frames accumulated in one paint buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L6)

- [mq3.audio.snd_local.PortableSamplePair](Type-mq3-audio-snd-local-portablesamplepair-654338504.md) — struct
<a id="function-function-mq3-audio-snd-local-rawsampleslot-function-rawsampleslot-sample-src-mq3-audio-snd-local-ml-388482018"></a>
### rawSampleSlot

```ml
function rawSampleSlot(sample)
```

Compute raw sample slot in audio.snd_local; the normal completion returns `(sample % MAX_RAW_SAMPLES)`.

Validation failures include `snd_local.h: negative raw sample`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sample` | `dynamic` | — | Sample used in `(sample < 0)` and `(sample % MAX_RAW_SAMPLES)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L175)

<a id="constant-constant-mq3-audio-snd-local-sentinel-mulaw-four-bit-run-const-sentinel-mulaw-four-bit-run-126-src-mq3-audio-snd-local-ml-14686150"></a>
### SENTINEL_MULAW_FOUR_BIT_RUN

```ml
const SENTINEL_MULAW_FOUR_BIT_RUN = 126
```

Mu-law stream marker introducing a run encoded with four-bit values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L24)

<a id="constant-constant-mq3-audio-snd-local-sentinel-mulaw-zero-run-const-sentinel-mulaw-zero-run-127-src-mq3-audio-snd-local-ml-1941370171"></a>
### SENTINEL_MULAW_ZERO_RUN

```ml
const SENTINEL_MULAW_ZERO_RUN = 127
```

Mu-law stream marker introducing a run of zero-valued samples.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L22)

- [mq3.audio.snd_local.Sfx](Type-mq3-audio-snd-local-sfx-637032184.md) — struct
<a id="constant-constant-mq3-audio-snd-local-snd-chunk-size-const-snd-chunk-size-1024-src-mq3-audio-snd-local-ml-799559724"></a>
### SND_CHUNK_SIZE

```ml
const SND_CHUNK_SIZE = 1024
```

Number of signed 16-bit mono samples stored in one sound-memory chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L8)

<a id="constant-constant-mq3-audio-snd-local-snd-chunk-size-byte-const-snd-chunk-size-byte-2048-src-mq3-audio-snd-local-ml-1782348699"></a>
### SND_CHUNK_SIZE_BYTE

```ml
const SND_CHUNK_SIZE_BYTE = 2048
```

Number of encoded bytes that fit in one sound-memory chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L12)

<a id="constant-constant-mq3-audio-snd-local-snd-chunk-size-float-const-snd-chunk-size-float-512-src-mq3-audio-snd-local-ml-1138623625"></a>
### SND_CHUNK_SIZE_FLOAT

```ml
const SND_CHUNK_SIZE_FLOAT = 512
```

Number of floating-point values that fit in one sound-memory chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L10)

- [mq3.audio.snd_local.SndBuffer](Type-mq3-audio-snd-local-sndbuffer-331805054.md) — struct
<a id="constant-constant-mq3-audio-snd-local-start-sample-immediate-const-start-sample-immediate-2147483647-src-mq3-audio-snd-local-ml-517618889"></a>
### START_SAMPLE_IMMEDIATE

```ml
const START_SAMPLE_IMMEDIATE = 2147483647
```

Sentinel that starts a channel at the beginning of the next mixing pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L14)

<a id="function-function-mq3-audio-snd-local-typenames-function-typenames-src-mq3-audio-snd-local-ml-1699267804"></a>
### typeNames

```ml
function typeNames()
```

List the 8 names in audio.snd_local.typeNames, beginning with `portable_samplepair_t`, `adpcm_state_t`, `sndBuffer`, `sfx_t`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L156)

<a id="constant-constant-mq3-audio-snd-local-wav-format-pcm-const-wav-format-pcm-1-src-mq3-audio-snd-local-ml-810359038"></a>
### WAV_FORMAT_PCM

```ml
const WAV_FORMAT_PCM = 1
```

RIFF WAVE format tag for uncompressed integer PCM samples.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_local.ml#L16)

- [mq3.audio.snd_local.WavInfo](Type-mq3-audio-snd-local-wavinfo-196852461.md) — struct
