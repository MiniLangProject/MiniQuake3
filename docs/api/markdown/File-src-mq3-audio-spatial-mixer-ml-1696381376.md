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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L130)

<a id="function-function-mq3-audio-spatial-mixer-addsharedloop-function-addsharedloop-state-id-key-origin-sound-volume-globalsound-src-mq3-audio-spatial-mixer-ml-2011147434"></a>
### addSharedLoop

```ml
function addSharedLoop(state, id, key, origin, sound, volume, globalSound)
```

Register an enabled looping source at cursor zero and return its zero-based source index. Copies the origin vector but retains the supplied sound record. Rejects duplicate identifiers, invalid PCM/gain, or registrations beyond MAX_SOURCES with error 7620.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mixer whose sources collection is extended in place. |
| `id` | `dynamic` | — | Caller identifier, unique among sources currently registered in this mixer. |
| `key` | `dynamic` | — | String used to group sources only when sound and playback cursor also compare equal. |
| `origin` | `dynamic` | — | Three-component source position in world units; copied into the source. |
| `sound` | `dynamic` | — | Decoded WAVE Sound containing at least one complete sample frame; retained without copying PCM. |
| `volume` | `dynamic` | — | Linear source gain from zero through one before distance attenuation and stereo panning. |
| `globalSound` | `dynamic` | — | True gives both output channels the full source gain, bypassing spatial attenuation and panning. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L114)

- [mq3.audio.spatial_mixer.Chunk](Type-mq3-audio-spatial-mixer-chunk-559152199.md) — struct
<a id="function-function-mq3-audio-spatial-mixer-create-function-create-outputrate-chunkframes-src-mq3-audio-spatial-mixer-ml-624026912"></a>
### create

```ml
function create(outputRate, chunkFrames)
```

Create an empty loop mixer, or report error 7620 for an unsupported rate or chunk size.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `outputRate` | `dynamic` | — | Stereo output sample rate in hertz, from 4,000 through 192,000. |
| `chunkFrames` | `dynamic` | — | Output frames per render call, from 1 through MAX_FRAMES; each frame occupies four PCM bytes. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L98)

<a id="function-function-mq3-audio-spatial-mixer-fail-function-fail-message-src-mq3-audio-spatial-mixer-ml-1451982677"></a>
### fail

```ml
function fail(message)
```

Create the audio.spatial_mixer error for `fail` with 7620 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("spatial mixer: " + message)` and `error(7620, ("spatial mixer: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L93)

- [mq3.audio.spatial_mixer.Group](Type-mq3-audio-spatial-mixer-group-1052340149.md) — struct
<a id="constant-constant-mq3-audio-spatial-mixer-max-frames-const-max-frames-4096-src-mq3-audio-spatial-mixer-ml-83727282"></a>
### MAX_FRAMES

```ml
const MAX_FRAMES = 4096
```

Maximum number of stereo output frames produced by one mixer chunk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L17)

<a id="constant-constant-mq3-audio-spatial-mixer-max-sources-const-max-sources-64-src-mq3-audio-spatial-mixer-ml-1754303249"></a>
### MAX_SOURCES

```ml
const MAX_SOURCES = 64
```

Maximum number of loop sources registered with the spatial mixer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L15)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L176)

<a id="function-function-mq3-audio-spatial-mixer-render-function-render-state-listener-right-src-mq3-audio-spatial-mixer-ml-1940948907"></a>
### render

```ml
function render(state, listener, right)
```

Mix one stereo PCM chunk, advancing only enabled sources with a positive spatial gain. Matching key, sound, and cursor values share resampling work. Source PCM is downmixed to mono before panning; fractional source positions select the preceding frame. A single chunk-wide limiter scales peaks above 32767 before signed 16-bit output conversion. Disabled and fully attenuated sources keep their cursors. Returns a Chunk or error 7620 for invalid listener data.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mixer supplying chunkFrames and outputRate; audible source cursors are updated in place. |
| `listener` | `dynamic` | — | Three-component listener position in world units. |
| `right` | `dynamic` | — | Listener's right vector; its length must lie from 0.99 through 1.01. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L210)

<a id="function-function-mq3-audio-spatial-mixer-setenabled-function-setenabled-state-id-enabled-src-mq3-audio-spatial-mixer-ml-2018008191"></a>
### setEnabled

```ml
function setEnabled(state, id, enabled)
```

Change a registered source's enabled flag, returning true when found or false for an unknown identifier. Disabling a source preserves its playback cursor until it contributes to a later render call.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mixer containing the source to update. |
| `id` | `dynamic` | — | Caller identifier supplied when registering the source. |
| `enabled` | `dynamic` | — | Whether subsequent render calls should consider the source. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L137)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L169)

<a id="constant-constant-mq3-audio-spatial-mixer-sound-attenuate-const-sound-attenuate-0-0008-src-mq3-audio-spatial-mixer-ml-996329553"></a>
### SOUND_ATTENUATE

```ml
const SOUND_ATTENUATE = 0.0008
```

Linear gain reduction per world unit beyond the full-volume distance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L13)

<a id="constant-constant-mq3-audio-spatial-mixer-sound-fullvolume-const-sound-fullvolume-80-src-mq3-audio-spatial-mixer-ml-888494599"></a>
### SOUND_FULLVOLUME

```ml
const SOUND_FULLVOLUME = 80
```

Distance in world units within which distance attenuation is not applied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L11)

- [mq3.audio.spatial_mixer.Source](Type-mq3-audio-spatial-mixer-source-419957791.md) — struct
- [mq3.audio.spatial_mixer.Spatial](Type-mq3-audio-spatial-mixer-spatial-1639915850.md) — struct
<a id="function-function-mq3-audio-spatial-mixer-spatialize-function-spatialize-origin-listener-right-volume-globalsound-src-mq3-audio-spatial-mixer-ml-1027595470"></a>
### spatialize

```ml
function spatialize(origin, listener, right, volume, globalSound)
```

Compute stereo gains using linear distance attenuation and the listener's right-axis projection. Local sources have full distance gain through SOUND_FULLVOLUME world units; panning divides that gain between left and right. Global sources receive the full volume in both channels, with reported distance zero and attenuation one. A nonpositive volume returns zero gains, distance, and attenuation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Source XYZ position in world units. |
| `listener` | `dynamic` | — | Listener XYZ position in the same coordinate system. |
| `right` | `dynamic` | — | Listener's normalized three-component right vector; positive projection favors the right channel. |
| `volume` | `dynamic` | — | Linear source gain before attenuation and panning. |
| `globalSound` | `dynamic` | — | Whether to bypass positional attenuation and panning. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L152)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L195)
