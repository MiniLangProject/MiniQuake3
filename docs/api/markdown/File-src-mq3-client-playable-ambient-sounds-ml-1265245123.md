# `src/mq3/client/playable_ambient_sounds.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_ambient_sounds`](Package-mq3-client-playable-ambient-sounds-29231333.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/wav.ml` as `wav` → [src/mq3/audio/wav.ml](File-src-mq3-audio-wav-ml-983927564.md)
- `mq3/format/bsp.ml` as `bsp` → [src/mq3/format/bsp.ml](File-src-mq3-format-bsp-ml-526613882.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.client.playable_ambient_sounds.Catalog](Type-mq3-client-playable-ambient-sounds-catalog-260233468.md) — struct
<a id="function-function-mq3-client-playable-ambient-sounds-fail-function-fail-message-src-mq3-client-playable-ambient-sounds-ml-336386621"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_ambient_sounds.ml#L15)

<a id="function-function-mq3-client-playable-ambient-sounds-field-function-field-fields-key-src-mq3-client-playable-ambient-sounds-ml-2032794172"></a>
### field

```ml
function field(fields, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fields` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_ambient_sounds.ml#L17)

<a id="function-function-mq3-client-playable-ambient-sounds-globalloops-function-globalloops-catalog-src-mq3-client-playable-ambient-sounds-ml-1331043441"></a>
### globalLoops

```ml
function globalLoops(catalog)
```

WinMM currently has no listener-relative attenuation. Playing spatial map speakers as full-volume global loops is both inaccurate and easily clips. Until the mixer owns positions, start only speakers carrying Baseq3's global sound flag and deduplicate equal sound paths.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_ambient_sounds.ml#L73)

<a id="function-function-mq3-client-playable-ambient-sounds-load-function-load-map-archive-src-mq3-client-playable-ambient-sounds-ml-2142122870"></a>
### load

```ml
function load(map, archive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `archive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_ambient_sounds.ml#L47)

<a id="function-function-mq3-client-playable-ambient-sounds-loopdefinitions-function-loopdefinitions-entities-src-mq3-client-playable-ambient-sounds-ml-206537559"></a>
### loopDefinitions

```ml
function loopDefinitions(entities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_ambient_sounds.ml#L30)

<a id="constant-constant-mq3-client-playable-ambient-sounds-looped-on-const-looped-on-1-src-mq3-client-playable-ambient-sounds-ml-2037997648"></a>
### LOOPED_ON

```ml
const LOOPED_ON = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_ambient_sounds.ml#L10)

<a id="function-function-mq3-client-playable-ambient-sounds-soundpath-function-soundpath-noise-src-mq3-client-playable-ambient-sounds-ml-1300492506"></a>
### soundPath

```ml
function soundPath(noise)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `noise` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_ambient_sounds.ml#L23)

- [mq3.client.playable_ambient_sounds.Speaker](Type-mq3-client-playable-ambient-sounds-speaker-848871510.md) — struct
