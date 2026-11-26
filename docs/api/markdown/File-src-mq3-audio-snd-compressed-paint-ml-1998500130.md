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

Add sample in audio.snd_compressed_paint; updates `paint entries`.

Direct state writes: `paint elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Mutable sequence written at `destination`, `(destination + 1)`. |
| `frame` | `dynamic` | — | Frame used in `(frame * 2)`. |
| `data` | `dynamic` | — | Left integer operand; only its low 32 bits participate. |
| `leftVolume` | `dynamic` | — | Right integer operand; only its low 32 bits participate. |
| `rightVolume` | `dynamic` | — | Right integer operand; only its low 32 bits participate. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L159)

<a id="constant-constant-mq3-audio-snd-compressed-paint-adpcm-block-samples-const-adpcm-block-samples-4096-src-mq3-audio-snd-compressed-paint-ml-1349485640"></a>
### ADPCM_BLOCK_SAMPLES

```ml
const ADPCM_BLOCK_SAMPLES = 4096
```

Maximum number of decoded mono samples represented by an ADPCM block.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L15)

<a id="function-function-mq3-audio-snd-compressed-paint-adpcmdecode-function-adpcmdecode-data-count-predictor-startindex-src-mq3-audio-snd-compressed-paint-ml-1903683829"></a>
### adpcmDecode

```ml
function adpcmDecode(data, count, predictor, startIndex)
```

Decode an IMA ADPCM block into signed PCM samples while advancing predictor and step-index state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `(data == void)`. |
| `count` | `dynamic` | — | Count used in `(count < 0)` and `(count - 1)`. |
| `predictor` | `dynamic` | — | Predictor operand used by `adpcmDecode`; its reads are shown in the implementation. |
| `startIndex` | `dynamic` | — | Start index used in `(startIndex < 0)` and `(startIndex > 88)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L54)

- [mq3.audio.snd_compressed_paint.Block](Type-mq3-audio-snd-compressed-paint-block-2083299179.md) — struct
<a id="constant-constant-mq3-audio-snd-compressed-paint-byte-block-samples-const-byte-block-samples-2048-src-mq3-audio-snd-compressed-paint-ml-587457079"></a>
### BYTE_BLOCK_SAMPLES

```ml
const BYTE_BLOCK_SAMPLES = 2048
```

Maximum number of samples represented by a byte-coded sound block.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L17)

- [mq3.audio.snd_compressed_paint.Compressed](Type-mq3-audio-snd-compressed-paint-compressed-853921143.md) — struct
<a id="function-function-mq3-audio-snd-compressed-paint-daub4-function-daub4-values-size-inverse-src-mq3-audio-snd-compressed-paint-ml-1965490375"></a>
### daub4

```ml
function daub4(values, size, inverse)
```

Update `values entries` in audio.snd_compressed_paint; the normal completion returns `values`.

Direct state writes: `values elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Mutable sequence written at `position`. |
| `size` | `dynamic` | — | Size used in `(size < 4)` and `(size - 4)`. |
| `inverse` | `dynamic` | — | Inverse operand used by `daub4`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L87)

<a id="function-function-mq3-audio-snd-compressed-paint-decodeblock-function-decodeblock-compressed-block-src-mq3-audio-snd-compressed-paint-ml-1721013612"></a>
### decodeBlock

```ml
function decodeBlock(compressed, block)
```

Decode block in audio.snd_compressed_paint; the normal completion returns `fail("unknown compression method")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compressed` | `dynamic` | — | Record exposing `compression`. |
| `block` | `dynamic` | — | Record exposing `data`, `size`, `sample`, `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L130)

<a id="function-function-mq3-audio-snd-compressed-paint-decodedsamples-function-decodedsamples-compressed-src-mq3-audio-snd-compressed-paint-ml-1315184151"></a>
### decodedSamples

```ml
function decodedSamples(compressed)
```

Compute decoded samples in audio.snd_compressed_paint; the normal completion returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `compressed` | `dynamic` | — | Record exposing `blocks`, `length`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L142)

<a id="function-function-mq3-audio-snd-compressed-paint-fail-function-fail-message-src-mq3-audio-snd-compressed-paint-ml-1234420517"></a>
### fail

```ml
function fail(message)
```

Create the audio.snd_compressed_paint error for `fail` with 7668 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("compressed sound paint: " + message)` and `error(7668, ("compressed sound paint: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L47)

<a id="function-function-mq3-audio-snd-compressed-paint-indextable-function-indextable-src-mq3-audio-snd-compressed-paint-ml-275272408"></a>
### indexTable

```ml
function indexTable()
```

Compute audio.snd_compressed_paint.indexTable as `[- 1, - 1, - 1, - 1, 2, 4, 6, 8, - 1, - 1, - 1, - 1, 2, 4, 6, 8]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L41)

<a id="constant-constant-mq3-audio-snd-compressed-paint-method-adpcm-const-method-adpcm-1-src-mq3-audio-snd-compressed-paint-ml-967669808"></a>
### METHOD_ADPCM

```ml
const METHOD_ADPCM = 1
```

Compression-method identifier for four-bit adaptive differential PCM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L9)

<a id="constant-constant-mq3-audio-snd-compressed-paint-method-mulaw-const-method-mulaw-3-src-mq3-audio-snd-compressed-paint-ml-1338361852"></a>
### METHOD_MULAW

```ml
const METHOD_MULAW = 3
```

Compression-method identifier for eight-bit mu-law sound data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L13)

<a id="constant-constant-mq3-audio-snd-compressed-paint-method-wavelet-const-method-wavelet-2-src-mq3-audio-snd-compressed-paint-ml-1860969783"></a>
### METHOD_WAVELET

```ml
const METHOD_WAVELET = 2
```

Compression-method identifier for the wavelet sound decoder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L11)

<a id="function-function-mq3-audio-snd-compressed-paint-mulawdecode-function-mulawdecode-value-src-mq3-audio-snd-compressed-paint-ml-1483766583"></a>
### muLawDecode

```ml
function muLawDecode(value)
```

Expand one mu-law code byte into a signed PCM amplitude.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(~ value & 255)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L74)

<a id="function-function-mq3-audio-snd-compressed-paint-paint-function-paint-paintbuffer-compressed-count-sampleoffset-bufferoffset-leftvol-rightvol-sndvol-doppler-dopplerscale-olddopplerscale-src-mq3-audio-snd-compressed-paint-ml-464350214"></a>
### paint

```ml
function paint(paintBuffer, compressed, count, sampleOffset, bufferOffset, leftVol, rightVol, sndVol, doppler, dopplerScale, oldDopplerScale)
```

Mirrors the three compressed S_PaintChannelFrom* entry points. Wavelet and ADPCM use decoded scratch blocks; MuLaw retains the original nearest-sample Doppler stepping. The caller splits loops at the logical sfx length.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paintBuffer` | `dynamic` | — | Paint passed as `paint` to `mq3.audio.snd_compressed_paint.addSample`. |
| `compressed` | `dynamic` | — | Record exposing `length`, `compression`. |
| `count` | `dynamic` | — | Count used in `(count < 0)` and `(count - 1)`. |
| `sampleOffset` | `dynamic` | — | Sample offset used in `(sampleOffset < 0)` and `(sampleOffset + count)`. |
| `bufferOffset` | `dynamic` | — | Buffer offset used in `(bufferOffset < 0)` and `(bufferOffset + i)`. |
| `leftVol` | `dynamic` | — | Left integer operand; only its low 32 bits participate. |
| `rightVol` | `dynamic` | — | Left integer operand; only its low 32 bits participate. |
| `sndVol` | `dynamic` | — | Right integer operand; only its low 32 bits participate. |
| `doppler` | `dynamic` | — | Doppler used in `((compressed.compression == METHOD_ADPCM) and doppler)` and `((compressed.compression == METHOD_MULAW) and doppler)`. |
| `dopplerScale` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `oldDopplerScale` | `dynamic` | — | Old doppler scale used in `(oldDopplerScale < 0.0)` and `(sampleOffset * oldDopplerScale)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L179)

<a id="function-function-mq3-audio-snd-compressed-paint-steptable-function-steptable-src-mq3-audio-snd-compressed-paint-ml-1660035460"></a>
### stepTable

```ml
function stepTable()
```

Return the fixed IMA ADPCM quantization-step lookup table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L43)

<a id="function-function-mq3-audio-snd-compressed-paint-waveletdecode-function-waveletdecode-data-size-src-mq3-audio-snd-compressed-paint-ml-1773595535"></a>
### waveletDecode

```ml
function waveletDecode(data, size)
```

Expand compressed wavelet coefficients into the requested PCM sample block.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `(data == void)`. |
| `size` | `dynamic` | — | Size used in `(size < 0)` and `(size - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_compressed_paint.ml#L116)
