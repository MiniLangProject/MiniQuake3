# `src/mq3/audio/spatial_mixer.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.spatial_mixer`](Package-mq3-audio-spatial-mixer-1066941016.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-audio-spatial-mixer-addloop-function-addloop-state-id-origin-sound-volume-globalsound-src-mq3-audio-spatial-mixer-ml-382528747"></a>
### addLoop

```ml
function addLoop(state, id, origin, sound, volume, globalSound)
```

Return `mq3.audio.spatial_mixer.addSharedLoop(state, id, ("#" + str(id)), origin, sound, volume, globalSound)` from `audio.spatial_mixer.addLoop`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.audio.spatial_mixer.addSharedLoop`. |
| `id` | `dynamic` | — | Id passed as `id` to `mq3.audio.spatial_mixer.addSharedLoop`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.audio.spatial_mixer.addSharedLoop`. |
| `sound` | `dynamic` | — | Sound passed as `sound` to `mq3.audio.spatial_mixer.addSharedLoop`. |
| `volume` | `dynamic` | — | Volume passed as `volume` to `mq3.audio.spatial_mixer.addSharedLoop`. |
| `globalSound` | `dynamic` | — | Global sound passed as `globalSound` to `mq3.audio.spatial_mixer.addSharedLoop`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L65)

<a id="function-function-mq3-audio-spatial-mixer-addsharedloop-function-addsharedloop-state-id-key-origin-sound-volume-globalsound-src-mq3-audio-spatial-mixer-ml-2011147434"></a>
### addSharedLoop

```ml
function addSharedLoop(state, id, key, origin, sound, volume, globalSound)
```

Add shared loop in audio.spatial_mixer; the normal completion returns `(len(state.sources) - 1)`.

Direct state writes: `state.sources`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `sources`. Updated in place: `sources`. |
| `id` | `dynamic` | — | Initial `id` field stored in the returned or constructed `mq3.audio.spatial_mixer.Source` record. |
| `key` | `dynamic` | — | Initial `key` field stored in the returned or constructed `mq3.audio.spatial_mixer.Source` record. |
| `origin` | `dynamic` | — | Origin used in `origin[0]` and `origin[1]`. |
| `sound` | `dynamic` | — | Record exposing `samples`, `blockAlign`. |
| `volume` | `dynamic` | — | Initial `volume` field stored in the returned or constructed `mq3.audio.spatial_mixer.Source` record. |
| `globalSound` | `dynamic` | — | Initial `globalSound` field stored in the returned or constructed `mq3.audio.spatial_mixer.Source` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L49)

- [mq3.audio.spatial_mixer.Chunk](Type-mq3-audio-spatial-mixer-chunk-559152199.md) — struct
<a id="function-function-mq3-audio-spatial-mixer-create-function-create-outputrate-chunkframes-src-mq3-audio-spatial-mixer-ml-624026912"></a>
### create

```ml
function create(outputRate, chunkFrames)
```

Create spatial mixer in audio.spatial_mixer; the normal completion returns `State(outputRate, chunkFrames, [])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `outputRate` | `dynamic` | — | Initial `outputRate` field stored in the returned or constructed `mq3.audio.spatial_mixer.State` record. |
| `chunkFrames` | `dynamic` | — | Initial `chunkFrames` field stored in the returned or constructed `mq3.audio.spatial_mixer.State` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L33)

<a id="function-function-mq3-audio-spatial-mixer-fail-function-fail-message-src-mq3-audio-spatial-mixer-ml-1451982677"></a>
### fail

```ml
function fail(message)
```

Create the audio.spatial_mixer error for `fail` with 7620 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("spatial mixer: " + message)` and `error(7620, ("spatial mixer: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L28)

- [mq3.audio.spatial_mixer.Group](Type-mq3-audio-spatial-mixer-group-1052340149.md) — struct
<a id="constant-constant-mq3-audio-spatial-mixer-max-frames-const-max-frames-4096-src-mq3-audio-spatial-mixer-ml-83727282"></a>
### MAX_FRAMES

```ml
const MAX_FRAMES = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L13)

<a id="constant-constant-mq3-audio-spatial-mixer-max-sources-const-max-sources-64-src-mq3-audio-spatial-mixer-ml-1754303249"></a>
### MAX_SOURCES

```ml
const MAX_SOURCES = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L12)

<a id="function-function-mq3-audio-spatial-mixer-monosample-function-monosample-sound-frame-src-mq3-audio-spatial-mixer-ml-1555219978"></a>
### monoSample

```ml
function monoSample(sound, frame)
```

Compute mono sample in audio.spatial_mixer; the normal completion returns `((left + right) / 2)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — | Record exposing `samples`, `blockAlign`, `bitsPerSample`, `channels`. |
| `frame` | `dynamic` | — | Frame used in `(frame % frames)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L106)

<a id="function-function-mq3-audio-spatial-mixer-render-function-render-state-listener-right-src-mq3-audio-spatial-mixer-ml-1940948907"></a>
### render

```ml
function render(state, listener, right)
```

Render spatial mixer in audio.spatial_mixer; the normal completion returns `Chunk(output, state.chunkFrames, audible, peak, limiter)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `chunkFrames`, `sources`, `outputRate`. |
| `listener` | `dynamic` | — | Listener passed as `listener` to `mq3.audio.spatial_mixer.spatialize`. |
| `right` | `dynamic` | — | A passed as `a` to `mq3.shared.math.VectorLength`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L135)

<a id="function-function-mq3-audio-spatial-mixer-setenabled-function-setenabled-state-id-enabled-src-mq3-audio-spatial-mixer-ml-2018008191"></a>
### setEnabled

```ml
function setEnabled(state, id, enabled)
```

Set enabled in audio.spatial_mixer; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `sources`. |
| `id` | `dynamic` | — | Id used in `(source.id == id)`. |
| `enabled` | `dynamic` | — | Enabled operand used by `setEnabled`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L71)

<a id="function-function-mq3-audio-spatial-mixer-signed16-function-signed16-data-offset-src-mq3-audio-spatial-mixer-ml-1490208529"></a>
### signed16

```ml
function signed16(data, offset)
```

Compute signed 16 in audio.spatial_mixer; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `data[offset]` and `data[(offset + 1)]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L99)

<a id="constant-constant-mq3-audio-spatial-mixer-sound-attenuate-const-sound-attenuate-0-0008-src-mq3-audio-spatial-mixer-ml-996329553"></a>
### SOUND_ATTENUATE

```ml
const SOUND_ATTENUATE = 0.0008
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L11)

<a id="constant-constant-mq3-audio-spatial-mixer-sound-fullvolume-const-sound-fullvolume-80-src-mq3-audio-spatial-mixer-ml-888494599"></a>
### SOUND_FULLVOLUME

```ml
const SOUND_FULLVOLUME = 80
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L10)

- [mq3.audio.spatial_mixer.Source](Type-mq3-audio-spatial-mixer-source-419957791.md) — struct
- [mq3.audio.spatial_mixer.Spatial](Type-mq3-audio-spatial-mixer-spatial-1639915850.md) — struct
<a id="function-function-mq3-audio-spatial-mixer-spatialize-function-spatialize-origin-listener-right-volume-globalsound-src-mq3-audio-spatial-mixer-ml-1027595470"></a>
### spatialize

```ml
function spatialize(origin, listener, right, volume, globalSound)
```

Compute spatialize in audio.spatial_mixer; the normal completion returns `Spatial(left, rightGain, distance, attenuation)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Origin used in `origin[0]` and `origin[1]`. |
| `listener` | `dynamic` | — | Listener used in `listener[0]` and `listener[1]`. |
| `right` | `dynamic` | — | Left three-element vector. |
| `volume` | `dynamic` | — | Initial `left` field stored in the returned or constructed `mq3.audio.spatial_mixer.Spatial` record. |
| `globalSound` | `dynamic` | — | Global sound operand used by `spatialize`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L82)

- [mq3.audio.spatial_mixer.State](Type-mq3-audio-spatial-mixer-state-1239949287.md) — struct
<a id="function-function-mq3-audio-spatial-mixer-write16-function-write16-output-offset-value-src-mq3-audio-spatial-mixer-ml-495538765"></a>
### write16

```ml
function write16(output, offset, value)
```

Write 16 in audio.spatial_mixer; updates `output entries`.

Direct state writes: `output elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — | Mutable sequence written at `offset`, `(offset + 1)`. |
| `offset` | `dynamic` | — | Offset used in `(offset + 1)`. |
| `value` | `dynamic` | — | Floating-point value to convert to signed 32-bit integer semantics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L125)
