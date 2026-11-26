# `src/mq3/audio/snd_wavelet_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_wavelet_runtime`](Package-mq3-audio-snd-wavelet-runtime-1143701211.md)

Reachable from entry: **no**

## Imports

- `mq3/audio/snd_compressed_paint.ml` as `compressed` → [src/mq3/audio/snd_compressed_paint.ml](File-src-mq3-audio-snd-compressed-paint-ml-1998500130.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="constant-constant-mq3-audio-snd-wavelet-runtime-block-samples-const-block-samples-2048-src-mq3-audio-snd-wavelet-runtime-ml-2129434519"></a>
### BLOCK_SAMPLES

```ml
const BLOCK_SAMPLES = 2048
```

Maximum number of mono samples encoded in one wavelet or mu-law block.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L10)

<a id="function-function-mq3-audio-snd-wavelet-runtime-daub4-function-daub4-values-size-isign-src-mq3-audio-snd-wavelet-runtime-ml-194747513"></a>
### daub4

```ml
function daub4(values, size, isign)
```

Return `mq3.audio.snd_compressed_paint.daub4(values, size, (isign < 0))` from `audio.snd_wavelet_runtime.daub4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Values passed as `values` to `mq3.audio.snd_compressed_paint.daub4`. |
| `size` | `dynamic` | — | Size passed as `size` to `mq3.audio.snd_compressed_paint.daub4`. |
| `isign` | `dynamic` | — | Isign used in `(isign < 0)` and `compressed.daub4(values, size, (isign < 0))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L36)

<a id="function-function-mq3-audio-snd-wavelet-runtime-decodemulaw-function-decodemulaw-block-src-mq3-audio-snd-wavelet-runtime-ml-1733318407"></a>
### decodeMuLaw

```ml
function decodeMuLaw(block)
```

Decode mu law in audio.snd_wavelet_runtime; the normal completion returns `result`.

Validation failures include `decodeMuLaw: invalid block`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `block` | `dynamic` | — | Record exposing `data`, `size`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L112)

<a id="function-function-mq3-audio-snd-wavelet-runtime-decodewavelet-function-decodewavelet-block-src-mq3-audio-snd-wavelet-runtime-ml-252284991"></a>
### decodeWavelet

```ml
function decodeWavelet(block)
```

Return `mq3.audio.snd_compressed_paint.waveletDecode(block.data, block.size)` from `audio.snd_wavelet_runtime.decodeWavelet`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `block` | `dynamic` | — | Record exposing `data`, `size`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L91)

<a id="function-function-mq3-audio-snd-wavelet-runtime-encodemulaw-function-encodemulaw-samples-src-mq3-audio-snd-wavelet-runtime-ml-749433873"></a>
### encodeMuLaw

```ml
function encodeMuLaw(samples)
```

Encode mu law in audio.snd_wavelet_runtime; the normal completion returns `compressed.Compressed(compressed.METHOD_MULAW, blocks, len(samples))`.

Validation failures include `encodeMuLaw: samples are required`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — | Samples used in `len(samples)` and `(samples == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L97)

<a id="function-function-mq3-audio-snd-wavelet-runtime-encodewavelet-function-encodewavelet-samples-src-mq3-audio-snd-wavelet-runtime-ml-441856937"></a>
### encodeWavelet

```ml
function encodeWavelet(samples)
```

Encode wavelet in audio.snd_wavelet_runtime; the normal completion returns `compressed.Compressed(compressed.METHOD_WAVELET, blocks, len(samples))`.

Validation failures include `encodeWavelet: samples are required`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — | Samples passed as `samples` to `mq3.audio.snd_wavelet_runtime.slicePadded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L77)

<a id="function-function-mq3-audio-snd-wavelet-runtime-mulawdecode-function-mulawdecode-value-src-mq3-audio-snd-wavelet-runtime-ml-744168419"></a>
### MuLawDecode

```ml
function MuLawDecode(value)
```

Return `mq3.audio.snd_compressed_paint.muLawDecode(value)` from `audio.snd_wavelet_runtime.MuLawDecode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.audio.snd_compressed_paint.muLawDecode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L31)

<a id="function-function-mq3-audio-snd-wavelet-runtime-mulawencode-function-mulawencode-sample-src-mq3-audio-snd-wavelet-runtime-ml-581901890"></a>
### MuLawEncode

```ml
function MuLawEncode(sample)
```

Compute mu law encode in audio.snd_wavelet_runtime; the normal completion returns `(~ ((sign | (exponent << 4)) | mantissa) & 255)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sample` | `dynamic` | — | Sample used in `(sample >= 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L21)

<a id="function-function-mq3-audio-snd-wavelet-runtime-nxputc-function-nxputc-stream-outputbyte-src-mq3-audio-snd-wavelet-runtime-ml-553805591"></a>
### NXPutc

```ml
function NXPutc(stream, outputByte)
```

Update `stream.data`, `stream.count` in audio.snd_wavelet_runtime.

Validation failures include `NXPutc: stream is required`.
Direct state writes: `stream.data`, `stream.count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — | Record exposing `data`, `count`. Updated in place: `data`, `count`. |
| `outputByte` | `dynamic` | — | Output byte used in `(outputByte & 255)` and `(stream.data + [(outputByte & 255)])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L58)

<a id="function-function-mq3-audio-snd-wavelet-runtime-slicepadded-function-slicepadded-samples-offset-count-src-mq3-audio-snd-wavelet-runtime-ml-468828931"></a>
### slicePadded

```ml
function slicePadded(samples, offset, count)
```

Compute slice padded in audio.snd_wavelet_runtime; the normal completion returns `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — | Samples used in `len(samples)` and `samples[(offset + index)]`. |
| `offset` | `dynamic` | — | Offset used in `(offset + index)` and `samples[(offset + index)]`. |
| `count` | `dynamic` | — | Count used in `(count - 1)` and `array(count, 0.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L67)

- [mq3.audio.snd_wavelet_runtime.Stream](Type-mq3-audio-snd-wavelet-runtime-stream-1314189679.md) — struct
<a id="function-function-mq3-audio-snd-wavelet-runtime-wt1-function-wt1-values-size-isign-src-mq3-audio-snd-wavelet-runtime-ml-824933317"></a>
### wt1

```ml
function wt1(values, size, isign)
```

Compute wt 1 in audio.snd_wavelet_runtime; the normal completion returns `values`.

Validation failures include `wt1: invalid extent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Values passed as `values` to `mq3.audio.snd_compressed_paint.daub4`. |
| `size` | `dynamic` | — | Size used in `(size < 0)` and `(size >> 2)`. |
| `isign` | `dynamic` | — | Isign used in `(isign >= 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L44)
