# `src/mq3/client/playable_weapon_sounds.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_weapon_sounds`](Package-mq3-client-playable-weapon-sounds-253901417.md)

Reachable from entry: **yes**

## Imports

- `mq3/audio/wav.ml` as `wav` → [src/mq3/audio/wav.ml](File-src-mq3-audio-wav-ml-983927564.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/platform/playable_audio.ml` as `audio` → [src/mq3/platform/playable_audio.ml](File-src-mq3-platform-playable-audio-ml-1415322964.md)

## Declarations

<a id="function-function-mq3-client-playable-weapon-sounds-addpath-function-addpath-archive-clips-path-src-mq3-client-playable-weapon-sounds-ml-1386453476"></a>
### addPath

```ml
function addPath(archive, clips, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `clips` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L61)

- [mq3.client.playable_weapon_sounds.Catalog](Type-mq3-client-playable-weapon-sounds-catalog-1734826936.md) — struct
<a id="function-function-mq3-client-playable-weapon-sounds-choose-function-choose-clips-sequence-src-mq3-client-playable-weapon-sounds-ml-67292786"></a>
### choose

```ml
function choose(clips, sequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clips` | `dynamic` | — |  |
| `sequence` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L100)

- [mq3.client.playable_weapon_sounds.Clip](Type-mq3-client-playable-weapon-sounds-clip-2067069723.md) — struct
<a id="function-function-mq3-client-playable-weapon-sounds-decodeclip-function-decodeclip-path-data-src-mq3-client-playable-weapon-sounds-ml-1102755113"></a>
### decodeClip

```ml
function decodeClip(path, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L51)

<a id="function-function-mq3-client-playable-weapon-sounds-definition-function-definition-name-src-mq3-client-playable-weapon-sounds-ml-852724781"></a>
### definition

```ml
function definition(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L40)

- [mq3.client.playable_weapon_sounds.Definition](Type-mq3-client-playable-weapon-sounds-definition-2089340608.md) — struct
<a id="function-function-mq3-client-playable-weapon-sounds-definitions-function-definitions-src-mq3-client-playable-weapon-sounds-ml-522742786"></a>
### definitions

```ml
function definitions()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L17)

<a id="function-function-mq3-client-playable-weapon-sounds-fail-function-fail-message-src-mq3-client-playable-weapon-sounds-ml-445929423"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L15)

<a id="function-function-mq3-client-playable-weapon-sounds-find-function-find-catalog-name-src-mq3-client-playable-weapon-sounds-ml-776154144"></a>
### find

```ml
function find(catalog, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L94)

<a id="function-function-mq3-client-playable-weapon-sounds-findclip-function-findclip-clips-path-src-mq3-client-playable-weapon-sounds-ml-141987948"></a>
### findClip

```ml
function findClip(clips, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clips` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L46)

<a id="function-function-mq3-client-playable-weapon-sounds-firesound-function-firesound-catalog-name-sequence-src-mq3-client-playable-weapon-sounds-ml-803747819"></a>
### fireSound

```ml
function fireSound(catalog, name, sequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `sequence` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L106)

<a id="function-function-mq3-client-playable-weapon-sounds-impactsound-function-impactsound-catalog-name-sequence-src-mq3-client-playable-weapon-sounds-ml-538135095"></a>
### impactSound

```ml
function impactSound(catalog, name, sequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `sequence` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L107)

<a id="function-function-mq3-client-playable-weapon-sounds-isname-function-isname-def-name-src-mq3-client-playable-weapon-sounds-ml-1698181248"></a>
### isName

```ml
function isName(def, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `def` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L31)

<a id="function-function-mq3-client-playable-weapon-sounds-load-function-load-archive-src-mq3-client-playable-weapon-sounds-ml-1066428982"></a>
### load

```ml
function load(archive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L76)

<a id="function-function-mq3-client-playable-weapon-sounds-loadclip-function-loadclip-archive-path-src-mq3-client-playable-weapon-sounds-ml-104378969"></a>
### loadClip

```ml
function loadClip(archive, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L56)

<a id="constant-constant-mq3-client-playable-weapon-sounds-pickup-path-const-pickup-path-sound-misc-w-pkup-wav-src-mq3-client-playable-weapon-sounds-ml-208607306"></a>
### PICKUP_PATH

```ml
const PICKUP_PATH = "sound/misc/w_pkup.wav"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L8)

<a id="function-function-mq3-client-playable-weapon-sounds-pickupsound-function-pickupsound-catalog-name-src-mq3-client-playable-weapon-sounds-ml-288725150"></a>
### pickupSound

```ml
function pickupSound(catalog, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L108)

<a id="function-function-mq3-client-playable-weapon-sounds-play-function-play-sound-src-mq3-client-playable-weapon-sounds-ml-899781055"></a>
### play

```ml
function play(sound)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L110)

<a id="function-function-mq3-client-playable-weapon-sounds-resolve-function-resolve-clips-paths-src-mq3-client-playable-weapon-sounds-ml-840070931"></a>
### resolve

```ml
function resolve(clips, paths)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clips` | `dynamic` | — |  |
| `paths` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L67)

- [mq3.client.playable_weapon_sounds.WeaponSounds](Type-mq3-client-playable-weapon-sounds-weaponsounds-2125466897.md) — struct
