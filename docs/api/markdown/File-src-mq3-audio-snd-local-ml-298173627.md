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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L25)

- [mq3.audio.snd_local.Channel](Type-mq3-audio-snd-local-channel-48098440.md) — struct
<a id="function-function-mq3-audio-snd-local-chunkcount-function-chunkcount-samples-src-mq3-audio-snd-local-ml-824962833"></a>
### chunkCount

```ml
function chunkCount(samples)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L28)

<a id="function-function-mq3-audio-snd-local-clampvolume-function-clampvolume-value-src-mq3-audio-snd-local-ml-738618669"></a>
### clampVolume

```ml
function clampVolume(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L29)

<a id="function-function-mq3-audio-snd-local-declarationnames-function-declarationnames-src-mq3-audio-snd-local-ml-1594599424"></a>
### declarationNames

```ml
function declarationNames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L26)

- [mq3.audio.snd_local.Dma](Type-mq3-audio-snd-local-dma-858754229.md) — struct
<a id="function-function-mq3-audio-snd-local-externalnames-function-externalnames-src-mq3-audio-snd-local-ml-343884398"></a>
### externalNames

```ml
function externalNames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L27)

- [mq3.audio.snd_local.LoopSound](Type-mq3-audio-snd-local-loopsound-1501385974.md) — struct
<a id="constant-constant-mq3-audio-snd-local-max-channels-const-max-channels-96-src-mq3-audio-snd-local-ml-604442264"></a>
### MAX_CHANNELS

```ml
const MAX_CHANNELS = 96
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L11)

<a id="constant-constant-mq3-audio-snd-local-max-raw-samples-const-max-raw-samples-16384-src-mq3-audio-snd-local-ml-1525682803"></a>
### MAX_RAW_SAMPLES

```ml
const MAX_RAW_SAMPLES = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L12)

<a id="constant-constant-mq3-audio-snd-local-nxstream-is-byte-const-nxstream-is-byte-true-src-mq3-audio-snd-local-ml-1884309919"></a>
### NXSTREAM_IS_BYTE

```ml
const NXSTREAM_IS_BYTE = true
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L15)

<a id="constant-constant-mq3-audio-snd-local-paintbuffer-size-const-paintbuffer-size-4096-src-mq3-audio-snd-local-ml-1655778738"></a>
### PAINTBUFFER_SIZE

```ml
const PAINTBUFFER_SIZE = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L5)

- [mq3.audio.snd_local.PortableSamplePair](Type-mq3-audio-snd-local-portablesamplepair-654338504.md) — struct
<a id="function-function-mq3-audio-snd-local-rawsampleslot-function-rawsampleslot-sample-src-mq3-audio-snd-local-ml-388482018"></a>
### rawSampleSlot

```ml
function rawSampleSlot(sample)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sample` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L30)

<a id="constant-constant-mq3-audio-snd-local-sentinel-mulaw-four-bit-run-const-sentinel-mulaw-four-bit-run-126-src-mq3-audio-snd-local-ml-14686150"></a>
### SENTINEL_MULAW_FOUR_BIT_RUN

```ml
const SENTINEL_MULAW_FOUR_BIT_RUN = 126
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L14)

<a id="constant-constant-mq3-audio-snd-local-sentinel-mulaw-zero-run-const-sentinel-mulaw-zero-run-127-src-mq3-audio-snd-local-ml-1941370171"></a>
### SENTINEL_MULAW_ZERO_RUN

```ml
const SENTINEL_MULAW_ZERO_RUN = 127
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L13)

- [mq3.audio.snd_local.Sfx](Type-mq3-audio-snd-local-sfx-637032184.md) — struct
<a id="constant-constant-mq3-audio-snd-local-snd-chunk-size-const-snd-chunk-size-1024-src-mq3-audio-snd-local-ml-799559724"></a>
### SND_CHUNK_SIZE

```ml
const SND_CHUNK_SIZE = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L6)

<a id="constant-constant-mq3-audio-snd-local-snd-chunk-size-byte-const-snd-chunk-size-byte-2048-src-mq3-audio-snd-local-ml-1782348699"></a>
### SND_CHUNK_SIZE_BYTE

```ml
const SND_CHUNK_SIZE_BYTE = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L8)

<a id="constant-constant-mq3-audio-snd-local-snd-chunk-size-float-const-snd-chunk-size-float-512-src-mq3-audio-snd-local-ml-1138623625"></a>
### SND_CHUNK_SIZE_FLOAT

```ml
const SND_CHUNK_SIZE_FLOAT = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L7)

- [mq3.audio.snd_local.SndBuffer](Type-mq3-audio-snd-local-sndbuffer-331805054.md) — struct
<a id="constant-constant-mq3-audio-snd-local-start-sample-immediate-const-start-sample-immediate-2147483647-src-mq3-audio-snd-local-ml-517618889"></a>
### START_SAMPLE_IMMEDIATE

```ml
const START_SAMPLE_IMMEDIATE = 2147483647
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L9)

<a id="function-function-mq3-audio-snd-local-typenames-function-typenames-src-mq3-audio-snd-local-ml-1699267804"></a>
### typeNames

```ml
function typeNames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L24)

<a id="constant-constant-mq3-audio-snd-local-wav-format-pcm-const-wav-format-pcm-1-src-mq3-audio-snd-local-ml-810359038"></a>
### WAV_FORMAT_PCM

```ml
const WAV_FORMAT_PCM = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_local.ml#L10)

- [mq3.audio.snd_local.WavInfo](Type-mq3-audio-snd-local-wavinfo-196852461.md) — struct
