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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L9)

<a id="function-function-mq3-audio-snd-adpcm-runtime-clampindex-function-clampindex-value-src-mq3-audio-snd-adpcm-runtime-ml-990609907"></a>
### clampIndex

```ml
function clampIndex(value)
```

Clamp index in audio.snd_adpcm_runtime; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value < 0)` and `(value > 88)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L18)

<a id="function-function-mq3-audio-snd-adpcm-runtime-clampsample-function-clampsample-value-src-mq3-audio-snd-adpcm-runtime-ml-148176181"></a>
### clampSample

```ml
function clampSample(value)
```

Clamp sample in audio.snd_adpcm_runtime; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value > 32767)` and `(value < - 32768)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L21)

- [mq3.audio.snd_adpcm_runtime.Encoded](Type-mq3-audio-snd-adpcm-runtime-encoded-5239126.md) — struct
<a id="constant-constant-mq3-audio-snd-adpcm-runtime-header-bytes-const-header-bytes-8-src-mq3-audio-snd-adpcm-runtime-ml-652547275"></a>
### HEADER_BYTES

```ml
const HEADER_BYTES = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L10)

<a id="function-function-mq3-audio-snd-adpcm-runtime-memory-function-memory-rate-samples-dmaspeed-src-mq3-audio-snd-adpcm-runtime-ml-1417343814"></a>
### memory

```ml
function memory(rate, samples, dmaSpeed)
```

Return `mq3.audio.snd_adpcm_runtime.S_AdpcmMemoryNeeded(rate, samples, dmaSpeed)` from `audio.snd_adpcm_runtime.memory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `dynamic` | — | Rate passed as `rate` to `mq3.audio.snd_adpcm_runtime.S_AdpcmMemoryNeeded`. |
| `samples` | `dynamic` | — | Samples passed as `samples` to `mq3.audio.snd_adpcm_runtime.S_AdpcmMemoryNeeded`. |
| `dmaSpeed` | `dynamic` | — | Dma speed passed as `dmaSpeed` to `mq3.audio.snd_adpcm_runtime.S_AdpcmMemoryNeeded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L104)

<a id="function-function-mq3-audio-snd-adpcm-runtime-s-adpcmdecode-function-s-adpcmdecode-data-count-state-src-mq3-audio-snd-adpcm-runtime-ml-937322456"></a>
### S_AdpcmDecode

```ml
function S_AdpcmDecode(data, count, state)
```

Update `state.sample`, `state.index` in audio.snd_adpcm_runtime; the normal completion returns `samples`.

Validation failures include `S_AdpcmDecode: state is required`.
Direct state writes: `state.sample`, `state.index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.audio.snd_compressed_paint.adpcmDecode`. |
| `count` | `dynamic` | — | Count passed as `count` to `mq3.audio.snd_compressed_paint.adpcmDecode`. |
| `state` | `dynamic` | — | Record exposing `sample`, `index`. Updated in place: `sample`, `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L53)

<a id="function-function-mq3-audio-snd-adpcm-runtime-s-adpcmencode-function-s-adpcmencode-samples-state-src-mq3-audio-snd-adpcm-runtime-ml-1691659188"></a>
### S_AdpcmEncode

```ml
function S_AdpcmEncode(samples, state)
```

Update `state.sample`, `state.index` in audio.snd_adpcm_runtime; the normal completion returns `Encoded(output, state)`.

Validation failures include `S_AdpcmEncode: invalid input`.
Direct state writes: `state.sample`, `state.index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — | Samples used in `len(samples)` and `(samples == void)`. |
| `state` | `dynamic` | — | Record exposing `index`, `sample`. Updated in place: `sample`, `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L29)

<a id="function-function-mq3-audio-snd-adpcm-runtime-s-adpcmencodesound-function-s-adpcmencodesound-samples-src-mq3-audio-snd-adpcm-runtime-ml-960153"></a>
### S_AdpcmEncodeSound

```ml
function S_AdpcmEncodeSound(samples)
```

Compute adpcm encode sound in audio.snd_adpcm_runtime; the normal completion returns `compressed.Compressed(compressed.METHOD_ADPCM, blocks, len(samples))`.

Validation failures include `S_AdpcmEncodeSound: samples are required`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — | Samples used in `samples[0]` and `len(samples)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L76)

<a id="function-function-mq3-audio-snd-adpcm-runtime-s-adpcmgetsamples-function-s-adpcmgetsamples-block-src-mq3-audio-snd-adpcm-runtime-ml-580104939"></a>
### S_AdpcmGetSamples

```ml
function S_AdpcmGetSamples(block)
```

Compute adpcm get samples in audio.snd_adpcm_runtime; the normal completion returns `S_AdpcmDecode(block.data, block.size, state)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `block` | `dynamic` | — | Record exposing `sample`, `index`, `data`, `size`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L67)

<a id="function-function-mq3-audio-snd-adpcm-runtime-s-adpcmmemoryneeded-function-s-adpcmmemoryneeded-rate-samples-dmaspeed-src-mq3-audio-snd-adpcm-runtime-ml-920232288"></a>
### S_AdpcmMemoryNeeded

```ml
function S_AdpcmMemoryNeeded(rate, samples, dmaSpeed)
```

Compute adpcm memory needed in audio.snd_adpcm_runtime; the normal completion returns `((scaled / 2) + (blocks * HEADER_BYTES))`.

Validation failures include `S_AdpcmMemoryNeeded: invalid format`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `samples` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `dmaSpeed` | `dynamic` | — | Floating-point value to narrow to binary32. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_adpcm_runtime.ml#L94)

- [mq3.audio.snd_adpcm_runtime.State](Type-mq3-audio-snd-adpcm-runtime-state-1551126345.md) — struct
