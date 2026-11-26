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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L9)

<a id="function-function-mq3-audio-snd-wavelet-runtime-daub4-function-daub4-values-size-isign-src-mq3-audio-snd-wavelet-runtime-ml-194747513"></a>
### daub4

```ml
function daub4(values, size, isign)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `isign` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L21)

<a id="function-function-mq3-audio-snd-wavelet-runtime-decodemulaw-function-decodemulaw-block-src-mq3-audio-snd-wavelet-runtime-ml-1733318407"></a>
### decodeMuLaw

```ml
function decodeMuLaw(block)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `block` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L67)

<a id="function-function-mq3-audio-snd-wavelet-runtime-decodewavelet-function-decodewavelet-block-src-mq3-audio-snd-wavelet-runtime-ml-252284991"></a>
### decodeWavelet

```ml
function decodeWavelet(block)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `block` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L54)

<a id="function-function-mq3-audio-snd-wavelet-runtime-encodemulaw-function-encodemulaw-samples-src-mq3-audio-snd-wavelet-runtime-ml-749433873"></a>
### encodeMuLaw

```ml
function encodeMuLaw(samples)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L56)

<a id="function-function-mq3-audio-snd-wavelet-runtime-encodewavelet-function-encodewavelet-samples-src-mq3-audio-snd-wavelet-runtime-ml-441856937"></a>
### encodeWavelet

```ml
function encodeWavelet(samples)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L42)

<a id="function-function-mq3-audio-snd-wavelet-runtime-mulawdecode-function-mulawdecode-value-src-mq3-audio-snd-wavelet-runtime-ml-744168419"></a>
### MuLawDecode

```ml
function MuLawDecode(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L20)

<a id="function-function-mq3-audio-snd-wavelet-runtime-mulawencode-function-mulawencode-sample-src-mq3-audio-snd-wavelet-runtime-ml-581901890"></a>
### MuLawEncode

```ml
function MuLawEncode(sample)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sample` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L12)

<a id="function-function-mq3-audio-snd-wavelet-runtime-nxputc-function-nxputc-stream-outputbyte-src-mq3-audio-snd-wavelet-runtime-ml-553805591"></a>
### NXPutc

```ml
function NXPutc(stream, outputByte)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stream` | `dynamic` | — |  |
| `outputByte` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L31)

<a id="function-function-mq3-audio-snd-wavelet-runtime-slicepadded-function-slicepadded-samples-offset-count-src-mq3-audio-snd-wavelet-runtime-ml-468828931"></a>
### slicePadded

```ml
function slicePadded(samples, offset, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L36)

- [mq3.audio.snd_wavelet_runtime.Stream](Type-mq3-audio-snd-wavelet-runtime-stream-1314189679.md) — struct
<a id="function-function-mq3-audio-snd-wavelet-runtime-wt1-function-wt1-values-size-isign-src-mq3-audio-snd-wavelet-runtime-ml-824933317"></a>
### wt1

```ml
function wt1(values, size, isign)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `isign` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_wavelet_runtime.ml#L23)
