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

Create the audio.snd_spatialize error for `fail` with 7662 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("S_SpatializeOrigin: " + message)` and `error(7662, ("S_SpatializeOrigin: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_spatialize.ml#L29)

<a id="function-function-mq3-audio-snd-spatialize-gains-function-gains-origin-listenerorigin-listeneraxis-mastervolume-src-mq3-audio-snd-spatialize-ml-318797539"></a>
### gains

```ml
function gains(origin, listenerOrigin, listenerAxis, masterVolume)
```

Convert spatialized channel volumes into normalized left/right gains with distance and attenuation metadata.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.audio.snd_spatialize.spatialize`. |
| `listenerOrigin` | `dynamic` | — | Listener origin passed as `listenerOrigin` to `mq3.audio.snd_spatialize.spatialize`. |
| `listenerAxis` | `dynamic` | — | Listener axis passed as `listenerAxis` to `mq3.audio.snd_spatialize.spatialize`. |
| `masterVolume` | `dynamic` | — | Master volume passed as `masterVolume` to `mq3.audio.snd_spatialize.spatialize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_spatialize.ml#L68)

<a id="constant-constant-mq3-audio-snd-spatialize-sound-attenuate-const-sound-attenuate-0-0008-src-mq3-audio-snd-spatialize-ml-420647277"></a>
### SOUND_ATTENUATE

```ml
const SOUND_ATTENUATE = 0.0008
```

Linear gain reduction per world unit beyond the full-volume distance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_spatialize.ml#L11)

<a id="constant-constant-mq3-audio-snd-spatialize-sound-fullvolume-const-sound-fullvolume-80-src-mq3-audio-snd-spatialize-ml-589102647"></a>
### SOUND_FULLVOLUME

```ml
const SOUND_FULLVOLUME = 80
```

Distance in world units within which distance attenuation is not applied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_spatialize.ml#L9)

<a id="function-function-mq3-audio-snd-spatialize-spatialize-function-spatialize-origin-listenerorigin-listeneraxis-mastervolume-channels-src-mq3-audio-snd-spatialize-ml-974394755"></a>
### spatialize

```ml
function spatialize(origin, listenerOrigin, listenerAxis, masterVolume, channels)
```

Calculate left/right gains from listener orientation, source distance, and attenuation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Value passed as `value` to `mq3.audio.snd_spatialize.validVector`. |
| `listenerOrigin` | `dynamic` | — | Value passed as `value` to `mq3.audio.snd_spatialize.validVector`. |
| `listenerAxis` | `dynamic` | — | Listener axis used in `listenerAxis[0]` and `listenerAxis[1]`. |
| `masterVolume` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `channels` | `dynamic` | — | Channels used in `(channels != 1)` and `(channels != 2)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_spatialize.ml#L41)

<a id="function-function-mq3-audio-snd-spatialize-validvector-function-validvector-value-src-mq3-audio-snd-spatialize-ml-899845965"></a>
### validVector

```ml
function validVector(value)
```

Compute audio.snd_spatialize.validVector as `((value != void) and (len(value) == 3))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `len(value)` and `(value != void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/snd_spatialize.ml#L33)

- [mq3.audio.snd_spatialize.Volumes](Type-mq3-audio-snd-spatialize-volumes-1889082757.md) — struct
