# `src/mq3/audio/qvm_sound_assets.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.audio.qvm_sound_assets`](Package-mq3-audio-qvm-sound-assets-117713232.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/snd_mem_resample.ml` as `sndmem` → [src/mq3/audio/snd_mem_resample.ml](File-src-mq3-audio-snd-mem-resample-ml-898891771.md)
- `mq3/audio/wav.ml` as `wav` → [src/mq3/audio/wav.ml](File-src-mq3-audio-wav-ml-983927564.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `std/ds/list.ml` as `lists` → `../../a7594a0c0299/MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-audio-qvm-sound-assets-canonicalpath-function-canonicalpath-name-src-mq3-audio-qvm-sound-assets-ml-2131205299"></a>
### canonicalPath

```ml
function canonicalPath(name)
```

Compute canonical path in audio.qvm_sound_assets; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `(name == void)` and `strings.toLowerAscii(name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L59)

- [mq3.audio.qvm_sound_assets.Catalog](Type-mq3-audio-qvm-sound-assets-catalog-1374778137.md) — struct
<a id="constant-constant-mq3-audio-qvm-sound-assets-chunk-frames-const-chunk-frames-1024-src-mq3-audio-qvm-sound-assets-ml-1138393406"></a>
### CHUNK_FRAMES

```ml
const CHUNK_FRAMES = 1024
```

Three buffers at 22050 Hz hold at most 139 ms of sampled audio.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L15)

- [mq3.audio.qvm_sound_assets.Clip](Type-mq3-audio-qvm-sound-assets-clip-741452940.md) — struct
<a id="function-function-mq3-audio-qvm-sound-assets-clipforhandle-function-clipforhandle-catalog-handle-src-mq3-audio-qvm-sound-assets-ml-296920641"></a>
### clipForHandle

```ml
function clipForHandle(catalog, handle)
```

Compute clip for handle in audio.qvm_sound_assets; the normal completion returns `clip`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record exposing `handles`. |
| `handle` | `dynamic` | — | Zero-based index into `catalog.handles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L80)

<a id="function-function-mq3-audio-qvm-sound-assets-clipforpath-function-clipforpath-catalog-path-src-mq3-audio-qvm-sound-assets-ml-839609208"></a>
### clipForPath

```ml
function clipForPath(catalog, path)
```

Compute clip for path in audio.qvm_sound_assets.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record exposing `clips`. |
| `path` | `dynamic` | — | Name passed as `name` to `mq3.audio.qvm_sound_assets.canonicalPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L94)

<a id="function-function-mq3-audio-qvm-sound-assets-decodeeffectpath-function-decodeeffectpath-archive-handle-path-src-mq3-audio-qvm-sound-assets-ml-1573881201"></a>
### decodeEffectPath

```ml
function decodeEffectPath(archive, handle, path)
```

Return `mq3.audio.qvm_sound_assets.decodePlayerEffectPath(archive, handle, path, "sarge")` from `audio.qvm_sound_assets.decodeEffectPath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.audio.qvm_sound_assets.decodePlayerEffectPath`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.audio.qvm_sound_assets.decodePlayerEffectPath`. |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.audio.qvm_sound_assets.decodePlayerEffectPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L151)

<a id="function-function-mq3-audio-qvm-sound-assets-decodepath-function-decodepath-archive-handle-path-src-mq3-audio-qvm-sound-assets-ml-934384217"></a>
### decodePath

```ml
function decodePath(archive, handle, path)
```

Return `mq3.audio.qvm_sound_assets.decodePlayerPath(archive, handle, path, "sarge")` from `audio.qvm_sound_assets.decodePath`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.audio.qvm_sound_assets.decodePlayerPath`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.audio.qvm_sound_assets.decodePlayerPath`. |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.audio.qvm_sound_assets.decodePlayerPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L131)

<a id="function-function-mq3-audio-qvm-sound-assets-decodeplayereffectpath-function-decodeplayereffectpath-archive-handle-path-playermodel-src-mq3-audio-qvm-sound-assets-ml-1907065265"></a>
### decodePlayerEffectPath

```ml
function decodePlayerEffectPath(archive, handle, path, playerModel)
```

Decode player effect path in audio.qvm_sound_assets; the normal completion returns `Clip(decoded.handle, decoded.path, sound, void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.audio.qvm_sound_assets.decodePlayerPath`. |
| `handle` | `dynamic` | — | Handle passed as `handle` to `mq3.audio.qvm_sound_assets.decodePlayerPath`. |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.audio.qvm_sound_assets.decodePlayerPath`. |
| `playerModel` | `dynamic` | — | Player model passed as `playerModel` to `mq3.audio.qvm_sound_assets.decodePlayerPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L142)

<a id="function-function-mq3-audio-qvm-sound-assets-decodeplayerpath-function-decodeplayerpath-archive-handle-path-playermodel-src-mq3-audio-qvm-sound-assets-ml-1445181401"></a>
### decodePlayerPath

```ml
function decodePlayerPath(archive, handle, path, playerModel)
```

Decode player path in audio.qvm_sound_assets; the normal completion returns `Clip(handle, canonical, sound, void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.format.pk3.read`. |
| `handle` | `dynamic` | — | Initial `handle` field stored in the returned or constructed `mq3.audio.qvm_sound_assets.Clip` record. |
| `path` | `dynamic` | — | Name passed as `name` to `mq3.audio.qvm_sound_assets.retailPath`. |
| `playerModel` | `dynamic` | — | Player model passed as `playerModel` to `mq3.audio.qvm_sound_assets.retailPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L120)

<a id="function-function-mq3-audio-qvm-sound-assets-decoderetailwav-function-decoderetailwav-data-src-mq3-audio-qvm-sound-assets-ml-375387550"></a>
### decodeRetailWav

```ml
function decodeRetailWav(data)
```

Decode retail wav in audio.qvm_sound_assets; the normal completion returns `wav.decode(padded)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.audio.wav.decode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L103)

<a id="constant-constant-mq3-audio-qvm-sound-assets-effect-output-rate-const-effect-output-rate-22050-src-mq3-audio-qvm-sound-assets-ml-1776001956"></a>
### EFFECT_OUTPUT_RATE

```ml
const EFFECT_OUTPUT_RATE = 22050
```

Sample rate in hertz used when preparing registered sound effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L13)

<a id="function-function-mq3-audio-qvm-sound-assets-ensurepath-function-ensurepath-catalog-path-src-mq3-audio-qvm-sound-assets-ml-1394153784"></a>
### ensurePath

```ml
function ensurePath(catalog, path)
```

Ensure path in audio.qvm_sound_assets; the normal completion returns `decoded`.

Direct state writes: `catalog.clips`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record exposing `archive`, `clips`. Updated in place: `clips`. |
| `path` | `dynamic` | — | Path passed as `path` to `mq3.audio.qvm_sound_assets.clipForPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L158)

<a id="function-function-mq3-audio-qvm-sound-assets-fail-function-fail-message-src-mq3-audio-qvm-sound-assets-ml-1316305033"></a>
### fail

```ml
function fail(message)
```

Create the audio.qvm_sound_assets error for `fail` with 7650 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("QVM sound assets: " + message)` and `error(7650, ("QVM sound assets: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L55)

<a id="function-function-mq3-audio-qvm-sound-assets-load-function-load-archive-assetnames-kinds-src-mq3-audio-qvm-sound-assets-ml-1879341259"></a>
### load

```ml
function load(archive, assetNames, kinds)
```

Return `mq3.audio.qvm_sound_assets.loadForPlayer(archive, assetNames, kinds, "sarge")` from `audio.qvm_sound_assets.load`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Archive passed as `archive` to `mq3.audio.qvm_sound_assets.loadForPlayer`. |
| `assetNames` | `dynamic` | — | Asset names passed as `assetNames` to `mq3.audio.qvm_sound_assets.loadForPlayer`. |
| `kinds` | `dynamic` | — | Kinds passed as `kinds` to `mq3.audio.qvm_sound_assets.loadForPlayer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L179)

<a id="function-function-mq3-audio-qvm-sound-assets-loadforplayer-function-loadforplayer-archive-assetnames-kinds-playermodel-src-mq3-audio-qvm-sound-assets-ml-433688967"></a>
### loadForPlayer

```ml
function loadForPlayer(archive, assetNames, kinds, playerModel)
```

Load for player in audio.qvm_sound_assets; the normal completion returns `syncForPlayer(Catalog(archive, [], [], 0, 0, [void]), assetNames, kinds, playerModel)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Initial `archive` field stored in the returned or constructed `mq3.audio.qvm_sound_assets.Catalog` record. |
| `assetNames` | `dynamic` | — | Asset names passed as `assetNames` to `mq3.audio.qvm_sound_assets.syncForPlayer`. |
| `kinds` | `dynamic` | — | Kinds passed as `kinds` to `mq3.audio.qvm_sound_assets.syncForPlayer`. |
| `playerModel` | `dynamic` | — | Player model passed as `playerModel` to `mq3.audio.qvm_sound_assets.syncForPlayer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L170)

- [mq3.audio.qvm_sound_assets.Missing](Type-mq3-audio-qvm-sound-assets-missing-207760702.md) — struct
<a id="function-function-mq3-audio-qvm-sound-assets-missingforhandle-function-missingforhandle-catalog-handle-src-mq3-audio-qvm-sound-assets-ml-729406667"></a>
### missingForHandle

```ml
function missingForHandle(catalog, handle)
```

Compute audio.qvm_sound_assets.missingForHandle as `((((catalog != void) and (handle > 0)) and (handle < len(catalog.handles))) and (catalog.handles[handle] == false))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record exposing `handles`. |
| `handle` | `dynamic` | — | Zero-based index into `catalog.handles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L87)

<a id="function-function-mq3-audio-qvm-sound-assets-normalizeeffect-function-normalizeeffect-sound-src-mq3-audio-qvm-sound-assets-ml-350443257"></a>
### normalizeEffect

```ml
function normalizeEffect(sound)
```

Return `mq3.audio.snd_mem_resample.convert(sound, EFFECT_OUTPUT_RATE)` from `audio.qvm_sound_assets.normalizeEffect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — | Sound passed as `sound` to `mq3.audio.snd_mem_resample.convert`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L135)

<a id="function-function-mq3-audio-qvm-sound-assets-retailpath-function-retailpath-name-playermodel-src-mq3-audio-qvm-sound-assets-ml-2000819421"></a>
### retailPath

```ml
function retailPath(name, playerModel)
```

Compute retail path in audio.qvm_sound_assets; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.audio.qvm_sound_assets.canonicalPath`. |
| `playerModel` | `dynamic` | — | Player model used in `(playerModel == "")` and `(playerModel == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L70)

<a id="function-function-mq3-audio-qvm-sound-assets-sync-function-sync-catalog-assetnames-kinds-src-mq3-audio-qvm-sound-assets-ml-1968122598"></a>
### sync

```ml
function sync(catalog, assetNames, kinds)
```

Return `mq3.audio.qvm_sound_assets.syncForPlayer(catalog, assetNames, kinds, "sarge")` from `audio.qvm_sound_assets.sync`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Catalog passed as `catalog` to `mq3.audio.qvm_sound_assets.syncForPlayer`. |
| `assetNames` | `dynamic` | — | Asset names passed as `assetNames` to `mq3.audio.qvm_sound_assets.syncForPlayer`. |
| `kinds` | `dynamic` | — | Kinds passed as `kinds` to `mq3.audio.qvm_sound_assets.syncForPlayer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L214)

<a id="function-function-mq3-audio-qvm-sound-assets-syncforplayer-function-syncforplayer-catalog-assetnames-kinds-playermodel-src-mq3-audio-qvm-sound-assets-ml-1042627886"></a>
### syncForPlayer

```ml
function syncForPlayer(catalog, assetNames, kinds, playerModel)
```

Synchronize for player in audio.qvm_sound_assets; the normal completion returns `catalog`.

Direct state writes: `catalog.scanned`, `catalog.clips`, `catalog.missing`, `catalog.registered`, `catalog.handles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record exposing `scanned`, `clips`, `missing`, `handles`, `archive`, `registered`. Updated in place: `scanned`, `clips`, `missing`, `registered`, `handles`. |
| `assetNames` | `dynamic` | — | Asset names used in `len(assetNames)` and `assetNames[index]`. |
| `kinds` | `dynamic` | — | Kinds used in `len(kinds)` and `kinds[index]`. |
| `playerModel` | `dynamic` | — | Player model passed as `playerModel` to `mq3.audio.qvm_sound_assets.decodePlayerEffectPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/audio/qvm_sound_assets.ml#L188)
