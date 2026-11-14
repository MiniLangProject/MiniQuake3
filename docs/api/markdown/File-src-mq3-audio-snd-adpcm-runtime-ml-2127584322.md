# `src/mq3/audio/snd_adpcm_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_adpcm_runtime`](Package-mq3-audio-snd-adpcm-runtime-1897702706.md)

Reachable from entry: **no**

## Imports

- `mq3/audio/snd_compressed_paint.ml` as `compressed` → [src/mq3/audio/snd_compressed_paint.ml](File-src-mq3-audio-snd-compressed-paint-ml-1998500130.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="constant-constant-mq3-audio-snd-adpcm-runtime-block-samples-const-block-samples-4096-src-mq3-audio-snd-adpcm-runtime-ml-1674865454"></a>
### BLOCK_SAMPLES

```ml
const BLOCK_SAMPLES = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L9)

<a id="function-function-mq3-audio-snd-adpcm-runtime-clampindex-function-clampindex-value-src-mq3-audio-snd-adpcm-runtime-ml-990609907"></a>
### clampIndex

```ml
function clampIndex(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L14)

<a id="function-function-mq3-audio-snd-adpcm-runtime-clampsample-function-clampsample-value-src-mq3-audio-snd-adpcm-runtime-ml-148176181"></a>
### clampSample

```ml
function clampSample(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L15)

- [mq3.audio.snd_adpcm_runtime.Encoded](Type-mq3-audio-snd-adpcm-runtime-encoded-5239126.md) — struct
<a id="constant-constant-mq3-audio-snd-adpcm-runtime-header-bytes-const-header-bytes-8-src-mq3-audio-snd-adpcm-runtime-ml-652547275"></a>
### HEADER_BYTES

```ml
const HEADER_BYTES = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L10)

<a id="function-function-mq3-audio-snd-adpcm-runtime-memory-function-memory-rate-samples-dmaspeed-src-mq3-audio-snd-adpcm-runtime-ml-1417343814"></a>
### memory

```ml
function memory(rate, samples, dmaSpeed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `dynamic` | — |  |
| `samples` | `dynamic` | — |  |
| `dmaSpeed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L69)

<a id="function-function-mq3-audio-snd-adpcm-runtime-s-adpcmdecode-function-s-adpcmdecode-data-count-state-src-mq3-audio-snd-adpcm-runtime-ml-937322456"></a>
### S_AdpcmDecode

```ml
function S_AdpcmDecode(data, count, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L34)

<a id="function-function-mq3-audio-snd-adpcm-runtime-s-adpcmencode-function-s-adpcmencode-samples-state-src-mq3-audio-snd-adpcm-runtime-ml-1691659188"></a>
### S_AdpcmEncode

```ml
function S_AdpcmEncode(samples, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L17)

<a id="function-function-mq3-audio-snd-adpcm-runtime-s-adpcmencodesound-function-s-adpcmencodesound-samples-src-mq3-audio-snd-adpcm-runtime-ml-960153"></a>
### S_AdpcmEncodeSound

```ml
function S_AdpcmEncodeSound(samples)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L51)

<a id="function-function-mq3-audio-snd-adpcm-runtime-s-adpcmgetsamples-function-s-adpcmgetsamples-block-src-mq3-audio-snd-adpcm-runtime-ml-580104939"></a>
### S_AdpcmGetSamples

```ml
function S_AdpcmGetSamples(block)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `block` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L46)

<a id="function-function-mq3-audio-snd-adpcm-runtime-s-adpcmmemoryneeded-function-s-adpcmmemoryneeded-rate-samples-dmaspeed-src-mq3-audio-snd-adpcm-runtime-ml-920232288"></a>
### S_AdpcmMemoryNeeded

```ml
function S_AdpcmMemoryNeeded(rate, samples, dmaSpeed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `dynamic` | — |  |
| `samples` | `dynamic` | — |  |
| `dmaSpeed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_adpcm_runtime.ml#L63)

- [mq3.audio.snd_adpcm_runtime.State](Type-mq3-audio-snd-adpcm-runtime-state-1551126345.md) — struct
