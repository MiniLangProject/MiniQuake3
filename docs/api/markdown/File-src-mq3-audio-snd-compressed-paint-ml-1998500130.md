# `src/mq3/audio/snd_compressed_paint.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_compressed_paint`](Package-mq3-audio-snd-compressed-paint-1089930228.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-audio-snd-compressed-paint-addsample-function-addsample-paint-frame-data-leftvolume-rightvolume-src-mq3-audio-snd-compressed-paint-ml-2037076488"></a>
### addSample

```ml
function addSample(paint, frame, data, leftVolume, rightVolume)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `leftVolume` | `dynamic` | — |  |
| `rightVolume` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L103)

<a id="constant-constant-mq3-audio-snd-compressed-paint-adpcm-block-samples-const-adpcm-block-samples-4096-src-mq3-audio-snd-compressed-paint-ml-1349485640"></a>
### ADPCM_BLOCK_SAMPLES

```ml
const ADPCM_BLOCK_SAMPLES = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L11)

<a id="function-function-mq3-audio-snd-compressed-paint-adpcmdecode-function-adpcmdecode-data-count-predictor-startindex-src-mq3-audio-snd-compressed-paint-ml-1903683829"></a>
### adpcmDecode

```ml
function adpcmDecode(data, count, predictor, startIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `predictor` | `dynamic` | — |  |
| `startIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L22)

- [mq3.audio.snd_compressed_paint.Block](Type-mq3-audio-snd-compressed-paint-block-2083299179.md) — struct
<a id="constant-constant-mq3-audio-snd-compressed-paint-byte-block-samples-const-byte-block-samples-2048-src-mq3-audio-snd-compressed-paint-ml-587457079"></a>
### BYTE_BLOCK_SAMPLES

```ml
const BYTE_BLOCK_SAMPLES = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L12)

- [mq3.audio.snd_compressed_paint.Compressed](Type-mq3-audio-snd-compressed-paint-compressed-853921143.md) — struct
<a id="function-function-mq3-audio-snd-compressed-paint-daub4-function-daub4-values-size-inverse-src-mq3-audio-snd-compressed-paint-ml-1965490375"></a>
### daub4

```ml
function daub4(values, size, inverse)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `inverse` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L47)

<a id="function-function-mq3-audio-snd-compressed-paint-decodeblock-function-decodeblock-compressed-block-src-mq3-audio-snd-compressed-paint-ml-1721013612"></a>
### decodeBlock

```ml
function decodeBlock(compressed, block)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compressed` | `dynamic` | — |  |
| `block` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L84)

<a id="function-function-mq3-audio-snd-compressed-paint-decodedsamples-function-decodedsamples-compressed-src-mq3-audio-snd-compressed-paint-ml-1315184151"></a>
### decodedSamples

```ml
function decodedSamples(compressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compressed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L94)

<a id="function-function-mq3-audio-snd-compressed-paint-fail-function-fail-message-src-mq3-audio-snd-compressed-paint-ml-1234420517"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L20)

<a id="function-function-mq3-audio-snd-compressed-paint-indextable-function-indextable-src-mq3-audio-snd-compressed-paint-ml-275272408"></a>
### indexTable

```ml
function indexTable()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L17)

<a id="constant-constant-mq3-audio-snd-compressed-paint-method-adpcm-const-method-adpcm-1-src-mq3-audio-snd-compressed-paint-ml-967669808"></a>
### METHOD_ADPCM

```ml
const METHOD_ADPCM = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L8)

<a id="constant-constant-mq3-audio-snd-compressed-paint-method-mulaw-const-method-mulaw-3-src-mq3-audio-snd-compressed-paint-ml-1338361852"></a>
### METHOD_MULAW

```ml
const METHOD_MULAW = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L10)

<a id="constant-constant-mq3-audio-snd-compressed-paint-method-wavelet-const-method-wavelet-2-src-mq3-audio-snd-compressed-paint-ml-1860969783"></a>
### METHOD_WAVELET

```ml
const METHOD_WAVELET = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L9)

<a id="function-function-mq3-audio-snd-compressed-paint-mulawdecode-function-mulawdecode-value-src-mq3-audio-snd-compressed-paint-ml-1483766583"></a>
### muLawDecode

```ml
function muLawDecode(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L40)

<a id="function-function-mq3-audio-snd-compressed-paint-paint-function-paint-paintbuffer-compressed-count-sampleoffset-bufferoffset-leftvol-rightvol-sndvol-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-compressed-paint-ml-464350214"></a>
### paint

```ml
function paint(paintBuffer, compressed, count, sampleOffset, bufferOffset, leftVol, rightVol, sndVol, doppler, dopplerScale, oldDopplerScale)
```

Mirrors the three compressed S_PaintChannelFrom* entry points. Wavelet and ADPCM use decoded scratch blocks; MuLaw retains the original nearest-sample Doppler stepping. The caller splits loops at the logical sfx length.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paintBuffer` | `dynamic` | — |  |
| `compressed` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `sampleOffset` | `dynamic` | — |  |
| `bufferOffset` | `dynamic` | — |  |
| `leftVol` | `dynamic` | — |  |
| `rightVol` | `dynamic` | — |  |
| `sndVol` | `dynamic` | — |  |
| `doppler` | `dynamic` | — |  |
| `dopplerScale` | `dynamic` | — |  |
| `oldDopplerScale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L112)

<a id="function-function-mq3-audio-snd-compressed-paint-steptable-function-steptable-src-mq3-audio-snd-compressed-paint-ml-1660035460"></a>
### stepTable

```ml
function stepTable()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L18)

<a id="function-function-mq3-audio-snd-compressed-paint-waveletdecode-function-waveletdecode-data-size-src-mq3-audio-snd-compressed-paint-ml-1773595535"></a>
### waveletDecode

```ml
function waveletDecode(data, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L73)
