# `src/mq3/audio/snd_mem_resample.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_mem_resample`](Package-mq3-audio-snd-mem-resample-1381257039.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/wav.ml` as `wav` → [src/mq3/audio/wav.ml](File-src-mq3-audio-wav-ml-983927564.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-audio-snd-mem-resample-convert-function-convert-sound-outputrate-src-mq3-audio-snd-mem-resample-ml-1641892388"></a>
### convert

```ml
function convert(sound, outputRate)
```

Convert decoded WAV data into the mono 16-bit sound-cache representation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — | Record exposing `channels`, `bitsPerSample`, `samples`, `blockAlign`, `sampleRate`. |
| `outputRate` | `dynamic` | — | Output rate passed as `outputRate` to `mq3.audio.snd_mem_resample.resampleRaw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_resample.ml#L80)

<a id="function-function-mq3-audio-snd-mem-resample-fail-function-fail-message-src-mq3-audio-snd-mem-resample-ml-1479270487"></a>
### fail

```ml
function fail(message)
```

Create the audio.snd_mem_resample error for `fail` with 7660 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("S_LoadSound: " + message)` and `error(7660, ("S_LoadSound: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_resample.ml#L18)

<a id="constant-constant-mq3-audio-snd-mem-resample-max-output-samples-const-max-output-samples-67108864-src-mq3-audio-snd-mem-resample-ml-548542765"></a>
### MAX_OUTPUT_SAMPLES

```ml
const MAX_OUTPUT_SAMPLES = 67108864
```

Upper bound on samples allocated for a resampled sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_resample.ml#L14)

<a id="constant-constant-mq3-audio-snd-mem-resample-max-rate-const-max-rate-192000-src-mq3-audio-snd-mem-resample-ml-1944886587"></a>
### MAX_RATE

```ml
const MAX_RATE = 192000
```

Highest accepted source or output sample rate, in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_resample.ml#L12)

<a id="constant-constant-mq3-audio-snd-mem-resample-min-rate-const-min-rate-4000-src-mq3-audio-snd-mem-resample-ml-1798513763"></a>
### MIN_RATE

```ml
const MIN_RATE = 4000
```

Lowest accepted source or output sample rate, in hertz.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_resample.ml#L10)

<a id="function-function-mq3-audio-snd-mem-resample-outputcount-function-outputcount-samples-inputrate-outputrate-src-mq3-audio-snd-mem-resample-ml-2087790676"></a>
### outputCount

```ml
function outputCount(samples, inputRate, outputRate)
```

Compute the destination sample count from source and DMA rates using binary32 compatibility arithmetic.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `inputRate` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `outputRate` | `dynamic` | — | Floating-point value to narrow to binary32. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_resample.ml#L45)

<a id="function-function-mq3-audio-snd-mem-resample-resampleraw-function-resampleraw-data-inputrate-inputwidth-samples-outputrate-src-mq3-audio-snd-mem-resample-ml-1905618960"></a>
### resampleRaw

```ml
function resampleRaw(data, inputRate, inputWidth, samples, outputRate)
```

Resample source PCM into the sound-cache format using the original fixed-point stepping.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | PCM byte buffer with at least two bytes at offset. |
| `inputRate` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `inputWidth` | `dynamic` | — | Input width used in `(inputWidth != 1)` and `(inputWidth != 2)`. |
| `samples` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `outputRate` | `dynamic` | — | Floating-point value to narrow to binary32. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_resample.ml#L56)

<a id="function-function-mq3-audio-snd-mem-resample-signed16-function-signed16-data-as-bytes-offset-as-int-returns-int-src-mq3-audio-snd-mem-resample-ml-1369403677"></a>
### signed16

```ml
function signed16(data as bytes, offset as int) returns int
```

Decode a signed 16-bit little-endian PCM sample for sound-cache resampling.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `bytes` | — | PCM byte buffer with at least two bytes at offset. |
| `offset` | `int` | — | Byte offset of the low-order sample byte. |


**Returns:** The signed sample value from -32768 through 32767.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_resample.ml#L24)

<a id="function-function-mq3-audio-snd-mem-resample-write16-function-write16-data-offset-value-src-mq3-audio-snd-mem-resample-ml-1679274834"></a>
### write16

```ml
function write16(data, offset, value)
```

Write 16 in audio.snd_mem_resample; updates `data entries`.

Direct state writes: `data elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Mutable sequence written at `offset`, `(offset + 1)`. |
| `offset` | `dynamic` | — | Offset used in `(offset + 1)`. |
| `value` | `dynamic` | — | Value used in `(value >> 8)` and `(value & 255)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_mem_resample.ml#L36)
