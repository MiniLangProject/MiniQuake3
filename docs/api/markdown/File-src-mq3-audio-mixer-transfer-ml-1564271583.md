# `src/mq3/audio/mixer_transfer.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.mixer_transfer`](Package-mq3-audio-mixer-transfer-344106251.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-audio-mixer-transfer-clamp16-function-clamp16-value-src-mq3-audio-mixer-transfer-ml-1389408885"></a>
### clamp16

```ml
function clamp16(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/mixer_transfer.ml#L15)

<a id="function-function-mq3-audio-mixer-transfer-fail-function-fail-message-src-mq3-audio-mixer-transfer-ml-1495100951"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/mixer_transfer.ml#L7)

<a id="function-function-mq3-audio-mixer-transfer-poweroftwo-function-poweroftwo-value-src-mq3-audio-mixer-transfer-ml-2110100685"></a>
### powerOfTwo

```ml
function powerOfTwo(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/mixer_transfer.ml#L11)

<a id="function-function-mq3-audio-mixer-transfer-transfer-function-transfer-paint-paintedtime-endtime-samplebits-channels-dmasamples-output-src-mq3-audio-mixer-transfer-ml-1807417656"></a>
### transfer

```ml
function transfer(paint, paintedTime, endTime, sampleBits, channels, dmaSamples, output)
```

The paint array is interleaved [left,right,...], in the original 24.8 mix scale. output contains logical DMA samples: signed integers for 16-bit and bytes 0..255 for 8-bit. It is modified in place, matching the DMA ring buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — |  |
| `paintedTime` | `dynamic` | — |  |
| `endTime` | `dynamic` | — |  |
| `sampleBits` | `dynamic` | — |  |
| `channels` | `dynamic` | — |  |
| `dmaSamples` | `dynamic` | — |  |
| `output` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/mixer_transfer.ml#L24)
