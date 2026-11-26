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

Creates the playable ambient sounds error `7610` with diagnostic text `"preview ambience: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview ambience: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L19)

<a id="function-function-mq3-client-playable-ambient-sounds-field-function-field-fields-key-src-mq3-client-playable-ambient-sounds-ml-2032794172"></a>
### field

```ml
function field(fields, key)
```

Calls `std.string.toLowerAscii` from playable ambient sounds `field`. The final path returns `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fields` | `dynamic` | — | Value used by `for each pair in fields if len(pair)>=2 and strings.toLowerAscii(pair[0])==wanted then return pair[1] end if end for`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding playable ambient sounds entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L24)

<a id="function-function-mq3-client-playable-ambient-sounds-globalloops-function-globalloops-catalog-src-mq3-client-playable-ambient-sounds-ml-1331043441"></a>
### globalLoops

```ml
function globalLoops(catalog)
```

WinMM currently has no listener-relative attenuation. Playing spatial map speakers as full-volume global loops is both inaccurate and easily clips. Until the mixer owns positions, start only speakers carrying Baseq3's global sound flag and deduplicate equal sound paths.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.speakers`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L88)

<a id="function-function-mq3-client-playable-ambient-sounds-load-function-load-map-archive-src-mq3-client-playable-ambient-sounds-ml-2142122870"></a>
### load

```ml
function load(map, archive)
```

Calls `mq3.format.bsp.entities`, `mq3.client.playable_ambient_sounds.loopDefinitions`, `mq3.format.pk3.read` and additional helpers from playable ambient sounds `load`. The final path returns `Catalog(loaded,unique,skipped)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | map record passed to the playable ambient sounds helper calls. |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L61)

<a id="function-function-mq3-client-playable-ambient-sounds-loopdefinitions-function-loopdefinitions-entities-src-mq3-client-playable-ambient-sounds-ml-206537559"></a>
### loopDefinitions

```ml
function loopDefinitions(entities)
```

Calls `std.string.toLowerAscii`, `mq3.client.playable_ambient_sounds.field`, `toNumber` and additional helpers from playable ambient sounds `loopDefinitions`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value used by `if entities==void then return fail("entities are required") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L41)

<a id="constant-constant-mq3-client-playable-ambient-sounds-looped-on-const-looped-on-1-src-mq3-client-playable-ambient-sounds-ml-2037997648"></a>
### LOOPED_ON

```ml
const LOOPED_ON = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L10)

<a id="function-function-mq3-client-playable-ambient-sounds-soundpath-function-soundpath-noise-src-mq3-client-playable-ambient-sounds-ml-1300492506"></a>
### soundPath

```ml
function soundPath(noise)
```

Calls `std.string.toLowerAscii`, `std.string.startsWith`, `std.string.endsWith` from playable ambient sounds `soundPath`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `noise` | `dynamic` | — | Value used by `value=strings.toLowerAscii(noise)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_ambient_sounds.ml#L32)

- [mq3.client.playable_ambient_sounds.Speaker](Type-mq3-client-playable-ambient-sounds-speaker-848871510.md) — struct
