# `src/mq3/audio/snd_spatialize.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.snd_spatialize`](Package-mq3-audio-snd-spatialize-1269984680.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-audio-snd-spatialize-fail-function-fail-message-src-mq3-audio-snd-spatialize-ml-59727521"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_spatialize.ml#L13)

<a id="function-function-mq3-audio-snd-spatialize-gains-function-gains-origin-listenerorigin-listeneraxis-mastervolume-src-mq3-audio-snd-spatialize-ml-318797539"></a>
### gains

```ml
function gains(origin, listenerOrigin, listenerAxis, masterVolume)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `listenerOrigin` | `dynamic` | — |  |
| `listenerAxis` | `dynamic` | — |  |
| `masterVolume` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_spatialize.ml#L39)

<a id="constant-constant-mq3-audio-snd-spatialize-sound-attenuate-const-sound-attenuate-8-e-004-src-mq3-audio-snd-spatialize-ml-245093267"></a>
### SOUND_ATTENUATE

```ml
const SOUND_ATTENUATE = 8.e-004
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_spatialize.ml#L9)

<a id="constant-constant-mq3-audio-snd-spatialize-sound-fullvolume-const-sound-fullvolume-80-src-mq3-audio-snd-spatialize-ml-1503327293"></a>
### SOUND_FULLVOLUME

```ml
const SOUND_FULLVOLUME = 80.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_spatialize.ml#L8)

<a id="function-function-mq3-audio-snd-spatialize-spatialize-function-spatialize-origin-listenerorigin-listeneraxis-mastervolume-channels-src-mq3-audio-snd-spatialize-ml-974394755"></a>
### spatialize

```ml
function spatialize(origin, listenerOrigin, listenerAxis, masterVolume, channels)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `listenerOrigin` | `dynamic` | — |  |
| `listenerAxis` | `dynamic` | — |  |
| `masterVolume` | `dynamic` | — |  |
| `channels` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_spatialize.ml#L17)

<a id="function-function-mq3-audio-snd-spatialize-validvector-function-validvector-value-src-mq3-audio-snd-spatialize-ml-899845965"></a>
### validVector

```ml
function validVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/snd_spatialize.ml#L15)

- [mq3.audio.snd_spatialize.Volumes](Type-mq3-audio-snd-spatialize-volumes-1889082757.md) — struct
