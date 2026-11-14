# `src/mq3/audio/qvm_sound_assets.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.qvm_sound_assets`](Package-mq3-audio-qvm-sound-assets-117713232.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/snd_mem_resample.ml` as `sndmem` → [src/mq3/audio/snd_mem_resample.ml](File-src-mq3-audio-snd-mem-resample-ml-898891771.md)
- `mq3/audio/wav.ml` as `wav` → [src/mq3/audio/wav.ml](File-src-mq3-audio-wav-ml-983927564.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-audio-qvm-sound-assets-canonicalpath-function-canonicalpath-name-src-mq3-audio-qvm-sound-assets-ml-2131205299"></a>
### canonicalPath

```ml
function canonicalPath(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L20)

- [mq3.audio.qvm_sound_assets.Catalog](Type-mq3-audio-qvm-sound-assets-catalog-1374778137.md) — struct
- [mq3.audio.qvm_sound_assets.Clip](Type-mq3-audio-qvm-sound-assets-clip-741452940.md) — struct
<a id="function-function-mq3-audio-qvm-sound-assets-clipforhandle-function-clipforhandle-catalog-handle-src-mq3-audio-qvm-sound-assets-ml-296920641"></a>
### clipForHandle

```ml
function clipForHandle(catalog, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L35)

<a id="function-function-mq3-audio-qvm-sound-assets-clipforpath-function-clipforpath-catalog-path-src-mq3-audio-qvm-sound-assets-ml-839609208"></a>
### clipForPath

```ml
function clipForPath(catalog, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L45)

<a id="function-function-mq3-audio-qvm-sound-assets-decodeeffectpath-function-decodeeffectpath-archive-handle-path-src-mq3-audio-qvm-sound-assets-ml-1573881201"></a>
### decodeEffectPath

```ml
function decodeEffectPath(archive, handle, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L80)

<a id="function-function-mq3-audio-qvm-sound-assets-decodepath-function-decodepath-archive-handle-path-src-mq3-audio-qvm-sound-assets-ml-934384217"></a>
### decodePath

```ml
function decodePath(archive, handle, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L71)

<a id="function-function-mq3-audio-qvm-sound-assets-decodeplayereffectpath-function-decodeplayereffectpath-archive-handle-path-playermodel-src-mq3-audio-qvm-sound-assets-ml-1907065265"></a>
### decodePlayerEffectPath

```ml
function decodePlayerEffectPath(archive, handle, path, playerModel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `playerModel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L75)

<a id="function-function-mq3-audio-qvm-sound-assets-decodeplayerpath-function-decodeplayerpath-archive-handle-path-playermodel-src-mq3-audio-qvm-sound-assets-ml-1445181401"></a>
### decodePlayerPath

```ml
function decodePlayerPath(archive, handle, path, playerModel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |
| `playerModel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L64)

<a id="function-function-mq3-audio-qvm-sound-assets-decoderetailwav-function-decoderetailwav-data-src-mq3-audio-qvm-sound-assets-ml-375387550"></a>
### decodeRetailWav

```ml
function decodeRetailWav(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L52)

<a id="constant-constant-mq3-audio-qvm-sound-assets-effect-output-rate-const-effect-output-rate-22050-src-mq3-audio-qvm-sound-assets-ml-1776001956"></a>
### EFFECT_OUTPUT_RATE

```ml
const EFFECT_OUTPUT_RATE = 22050
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L12)

<a id="function-function-mq3-audio-qvm-sound-assets-ensurepath-function-ensurepath-catalog-path-src-mq3-audio-qvm-sound-assets-ml-1394153784"></a>
### ensurePath

```ml
function ensurePath(catalog, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L82)

<a id="function-function-mq3-audio-qvm-sound-assets-fail-function-fail-message-src-mq3-audio-qvm-sound-assets-ml-1316305033"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L18)

<a id="function-function-mq3-audio-qvm-sound-assets-load-function-load-archive-assetnames-kinds-src-mq3-audio-qvm-sound-assets-ml-1879341259"></a>
### load

```ml
function load(archive, assetNames, kinds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `assetNames` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L101)

<a id="function-function-mq3-audio-qvm-sound-assets-loadforplayer-function-loadforplayer-archive-assetnames-kinds-playermodel-src-mq3-audio-qvm-sound-assets-ml-433688967"></a>
### loadForPlayer

```ml
function loadForPlayer(archive, assetNames, kinds, playerModel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `assetNames` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `playerModel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L89)

- [mq3.audio.qvm_sound_assets.Missing](Type-mq3-audio-qvm-sound-assets-missing-207760702.md) — struct
<a id="function-function-mq3-audio-qvm-sound-assets-missingforhandle-function-missingforhandle-catalog-handle-src-mq3-audio-qvm-sound-assets-ml-729406667"></a>
### missingForHandle

```ml
function missingForHandle(catalog, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L40)

<a id="function-function-mq3-audio-qvm-sound-assets-normalizeeffect-function-normalizeeffect-sound-src-mq3-audio-qvm-sound-assets-ml-350443257"></a>
### normalizeEffect

```ml
function normalizeEffect(sound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L73)

<a id="function-function-mq3-audio-qvm-sound-assets-retailpath-function-retailpath-name-playermodel-src-mq3-audio-qvm-sound-assets-ml-2000819421"></a>
### retailPath

```ml
function retailPath(name, playerModel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `playerModel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L28)

<a id="function-function-mq3-audio-qvm-sound-assets-sync-function-sync-catalog-assetnames-kinds-src-mq3-audio-qvm-sound-assets-ml-1968122598"></a>
### sync

```ml
function sync(catalog, assetNames, kinds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `assetNames` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L115)

<a id="function-function-mq3-audio-qvm-sound-assets-syncforplayer-function-syncforplayer-catalog-assetnames-kinds-playermodel-src-mq3-audio-qvm-sound-assets-ml-1042627886"></a>
### syncForPlayer

```ml
function syncForPlayer(catalog, assetNames, kinds, playerModel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `assetNames` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `playerModel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L103)
