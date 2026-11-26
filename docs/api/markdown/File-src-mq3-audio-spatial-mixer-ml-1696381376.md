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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `volume` | `dynamic` | — |  |
| `globalSound` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L38)

<a id="function-function-mq3-audio-spatial-mixer-addsharedloop-function-addsharedloop-state-id-key-origin-sound-volume-globalsound-src-mq3-audio-spatial-mixer-ml-2011147434"></a>
### addSharedLoop

```ml
function addSharedLoop(state, id, key, origin, sound, volume, globalSound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `sound` | `dynamic` | — |  |
| `volume` | `dynamic` | — |  |
| `globalSound` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L29)

- [mq3.audio.spatial_mixer.Chunk](Type-mq3-audio-spatial-mixer-chunk-559152199.md) — struct
<a id="function-function-mq3-audio-spatial-mixer-create-function-create-outputrate-chunkframes-src-mq3-audio-spatial-mixer-ml-624026912"></a>
### create

```ml
function create(outputRate, chunkFrames)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `outputRate` | `dynamic` | — |  |
| `chunkFrames` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L23)

<a id="function-function-mq3-audio-spatial-mixer-fail-function-fail-message-src-mq3-audio-spatial-mixer-ml-1451982677"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L21)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L63)

<a id="function-function-mq3-audio-spatial-mixer-render-function-render-state-listener-right-src-mq3-audio-spatial-mixer-ml-1940948907"></a>
### render

```ml
function render(state, listener, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `listener` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L82)

<a id="function-function-mq3-audio-spatial-mixer-setenabled-function-setenabled-state-id-enabled-src-mq3-audio-spatial-mixer-ml-2018008191"></a>
### setEnabled

```ml
function setEnabled(state, id, enabled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L40)

<a id="function-function-mq3-audio-spatial-mixer-signed16-function-signed16-data-offset-src-mq3-audio-spatial-mixer-ml-1490208529"></a>
### signed16

```ml
function signed16(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L59)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `listener` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `volume` | `dynamic` | — |  |
| `globalSound` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L45)

- [mq3.audio.spatial_mixer.State](Type-mq3-audio-spatial-mixer-state-1239949287.md) — struct
<a id="function-function-mq3-audio-spatial-mixer-write16-function-write16-output-offset-value-src-mq3-audio-spatial-mixer-ml-495538765"></a>
### write16

```ml
function write16(output, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/audio/spatial_mixer.ml#L76)
