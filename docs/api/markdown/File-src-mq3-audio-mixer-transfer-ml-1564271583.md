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

Saturate an integer sample to the signed 16-bit PCM range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value > 32767)` and `(value < - 32768)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/mixer_transfer.ml#L21)

<a id="function-function-mq3-audio-mixer-transfer-fail-function-fail-message-src-mq3-audio-mixer-transfer-ml-1495100951"></a>
### fail

```ml
function fail(message)
```

Create the audio.mixer_transfer error for `fail` with 7240 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("audio mixer transfer: " + message)` and `error(7240, ("audio mixer transfer: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/mixer_transfer.ml#L9)

<a id="function-function-mq3-audio-mixer-transfer-poweroftwo-function-poweroftwo-value-src-mq3-audio-mixer-transfer-ml-2110100685"></a>
### powerOfTwo

```ml
function powerOfTwo(value)
```

Compute audio.mixer_transfer.powerOfTwo as `((value > 0) and ((value & (value - 1)) == 0))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value > 0)` and `(value - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/mixer_transfer.ml#L15)

<a id="function-function-mq3-audio-mixer-transfer-transfer-function-transfer-paint-paintedtime-endtime-samplebits-channels-dmasamples-output-src-mq3-audio-mixer-transfer-ml-1807417656"></a>
### transfer

```ml
function transfer(paint, paintedTime, endTime, sampleBits, channels, dmaSamples, output)
```

The paint array is interleaved [left,right,...], in the original 24.8 mix scale. output contains logical DMA samples: signed integers for 16-bit and bytes 0..255 for 8-bit. It is modified in place, matching the DMA ring buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `paint` | `dynamic` | — | Paint used in `len(paint)` and `paint[source]`. |
| `paintedTime` | `dynamic` | — | Painted time used in `(paintedTime < 0)` and `(endTime < paintedTime)`. |
| `endTime` | `dynamic` | — | End time used in `(endTime < paintedTime)` and `(endTime - paintedTime)`. |
| `sampleBits` | `dynamic` | — | Sample bits used in `(sampleBits != 8)` and `(sampleBits == 8)`. |
| `channels` | `dynamic` | — | Channels used in `(channels != 1)` and `(channels != 2)`. |
| `dmaSamples` | `dynamic` | — | Value passed as `value` to `mq3.audio.mixer_transfer.powerOfTwo`. |
| `output` | `dynamic` | — | Mutable sequence written at `outIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/mixer_transfer.ml#L37)
