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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — |  |
| `outputRate` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_resample.ml#L52)

<a id="function-function-mq3-audio-snd-mem-resample-fail-function-fail-message-src-mq3-audio-snd-mem-resample-ml-1479270487"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_resample.ml#L13)

<a id="constant-constant-mq3-audio-snd-mem-resample-max-output-samples-const-max-output-samples-67108864-src-mq3-audio-snd-mem-resample-ml-548542765"></a>
### MAX_OUTPUT_SAMPLES

```ml
const MAX_OUTPUT_SAMPLES = 67108864
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_resample.ml#L11)

<a id="constant-constant-mq3-audio-snd-mem-resample-max-rate-const-max-rate-192000-src-mq3-audio-snd-mem-resample-ml-1944886587"></a>
### MAX_RATE

```ml
const MAX_RATE = 192000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_resample.ml#L10)

<a id="constant-constant-mq3-audio-snd-mem-resample-min-rate-const-min-rate-4000-src-mq3-audio-snd-mem-resample-ml-1798513763"></a>
### MIN_RATE

```ml
const MIN_RATE = 4000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_resample.ml#L9)

<a id="function-function-mq3-audio-snd-mem-resample-outputcount-function-outputcount-samples-inputrate-outputrate-src-mq3-audio-snd-mem-resample-ml-2087790676"></a>
### outputCount

```ml
function outputCount(samples, inputRate, outputRate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — |  |
| `inputRate` | `dynamic` | — |  |
| `outputRate` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_resample.ml#L26)

<a id="function-function-mq3-audio-snd-mem-resample-resampleraw-function-resampleraw-data-inputrate-inputwidth-samples-outputrate-src-mq3-audio-snd-mem-resample-ml-1905618960"></a>
### resampleRaw

```ml
function resampleRaw(data, inputRate, inputWidth, samples, outputRate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `inputRate` | `dynamic` | — |  |
| `inputWidth` | `dynamic` | — |  |
| `samples` | `dynamic` | — |  |
| `outputRate` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_resample.ml#L31)

<a id="function-function-mq3-audio-snd-mem-resample-signed16-function-signed16-data-as-bytes-offset-as-int-returns-int-src-mq3-audio-snd-mem-resample-ml-1369403677"></a>
### signed16

```ml
function signed16(data as bytes, offset as int) returns int
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `bytes` | — |  |
| `offset` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_resample.ml#L15)

<a id="function-function-mq3-audio-snd-mem-resample-write16-function-write16-data-offset-value-src-mq3-audio-snd-mem-resample-ml-1679274834"></a>
### write16

```ml
function write16(data, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/snd_mem_resample.ml#L21)
