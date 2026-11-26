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

Calls `mq3.client.playable_weapon_sounds.findClip`, `mq3.client.playable_weapon_sounds.loadClip` from playable weapon sounds `addPath`. The final path returns `clips+[clip]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `clips` | `dynamic` | — | Value used by `if findClip(clips,path)!=void then return clips end if`. |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L86)

- [mq3.client.playable_weapon_sounds.Catalog](Type-mq3-client-playable-weapon-sounds-catalog-1734826936.md) — struct
<a id="function-function-mq3-client-playable-weapon-sounds-choose-function-choose-clips-sequence-src-mq3-client-playable-weapon-sounds-ml-67292786"></a>
### choose

```ml
function choose(clips, sequence)
```

Evaluates playable weapon sounds `choose` and returns `void`, `clips[index].sound` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clips` | `dynamic` | — | Sequence read at `clips[index]`. |
| `sequence` | `dynamic` | — | Value used by `index=sequence%len(clips)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L136)

- [mq3.client.playable_weapon_sounds.Clip](Type-mq3-client-playable-weapon-sounds-clip-2067069723.md) — struct
<a id="function-function-mq3-client-playable-weapon-sounds-decodeclip-function-decodeclip-path-data-src-mq3-client-playable-weapon-sounds-ml-1102755113"></a>
### decodeClip

```ml
function decodeClip(path, data)
```

Calls `mq3.audio.wav.decode`, `mq3.client.playable_weapon_sounds.Clip` from playable weapon sounds `decodeClip`. The final path returns `Clip(path,decoded)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `path` | `dynamic` | — | File or asset path used by this operation. |
| `data` | `dynamic` | — | Value used by `decoded=try(wav.decode(data))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L69)

<a id="function-function-mq3-client-playable-weapon-sounds-definition-function-definition-name-src-mq3-client-playable-weapon-sounds-ml-852724781"></a>
### definition

```ml
function definition(name)
```

Calls `mq3.client.playable_weapon_sounds.definitions`, `mq3.client.playable_weapon_sounds.isName` from playable weapon sounds `definition`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable weapon sounds resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L52)

- [mq3.client.playable_weapon_sounds.Definition](Type-mq3-client-playable-weapon-sounds-definition-2089340608.md) — struct
<a id="function-function-mq3-client-playable-weapon-sounds-definitions-function-definitions-src-mq3-client-playable-weapon-sounds-ml-522742786"></a>
### definitions

```ml
function definitions()
```

Builds the playable weapon sounds `definitions` sequence from `[ Definition("gauntlet","weapon_gauntlet",["sound/weapons/melee/fstrun.wav"],[],PICKUP_PATH), Definition("machinegun","weapon_machinegun",["sound/weapons/machinegun/machgf1b.wav","sound/weapons/mac...`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L24)

<a id="function-function-mq3-client-playable-weapon-sounds-fail-function-fail-message-src-mq3-client-playable-weapon-sounds-ml-445929423"></a>
### fail

```ml
function fail(message)
```

Creates the playable weapon sounds error `7570` with diagnostic text `"Weapon sounds: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"Weapon sounds: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L21)

<a id="function-function-mq3-client-playable-weapon-sounds-find-function-find-catalog-name-src-mq3-client-playable-weapon-sounds-ml-776154144"></a>
### find

```ml
function find(catalog, name)
```

Searches the playable weapon sounds collection for find, returning `void` when no entry matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. Record read through `catalog.weapons`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable weapon sounds resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L127)

<a id="function-function-mq3-client-playable-weapon-sounds-findclip-function-findclip-clips-path-src-mq3-client-playable-weapon-sounds-ml-141987948"></a>
### findClip

```ml
function findClip(clips, path)
```

Searches the playable weapon sounds collection for find clip, returning `void` when no entry matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clips` | `dynamic` | — | Value used by `for each clip in clips if stringEqualsIgnoreCaseAscii(clip.path,path) then return clip end if end for`. |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L61)

<a id="function-function-mq3-client-playable-weapon-sounds-firesound-function-firesound-catalog-name-sequence-src-mq3-client-playable-weapon-sounds-ml-803747819"></a>
### fireSound

```ml
function fireSound(catalog, name, sequence)
```

Calls `mq3.client.playable_weapon_sounds.find`, `mq3.client.playable_weapon_sounds.choose` from playable weapon sounds `fireSound`. The final path returns `choose(weapon.fire,sequence)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable weapon sounds resource. |
| `sequence` | `dynamic` | — | Value used by `return choose(weapon.fire,sequence)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L146)

<a id="function-function-mq3-client-playable-weapon-sounds-impactsound-function-impactsound-catalog-name-sequence-src-mq3-client-playable-weapon-sounds-ml-538135095"></a>
### impactSound

```ml
function impactSound(catalog, name, sequence)
```

Calls `mq3.client.playable_weapon_sounds.find`, `mq3.client.playable_weapon_sounds.choose` from playable weapon sounds `impactSound`. The final path returns `choose(weapon.impact,sequence)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable weapon sounds resource. |
| `sequence` | `dynamic` | — | Value used by `return choose(weapon.impact,sequence)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L151)

<a id="function-function-mq3-client-playable-weapon-sounds-isname-function-isname-def-name-src-mq3-client-playable-weapon-sounds-ml-1698181248"></a>
### isName

```ml
function isName(def, name)
```

Calls `stringEqualsIgnoreCaseAscii` from playable weapon sounds `isName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `def` | `dynamic` | — | Record read through `def.weapon`, `def.classname`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable weapon sounds resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L41)

<a id="function-function-mq3-client-playable-weapon-sounds-load-function-load-archive-src-mq3-client-playable-weapon-sounds-ml-1066428982"></a>
### load

```ml
function load(archive)
```

Calls `mq3.client.playable_weapon_sounds.definitions`, `mq3.client.playable_weapon_sounds.addPath`, `mq3.client.playable_weapon_sounds.resolve` and additional helpers from playable weapon sounds `load`. The final path returns `Catalog(weapons,clips)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L106)

<a id="function-function-mq3-client-playable-weapon-sounds-loadclip-function-loadclip-archive-path-src-mq3-client-playable-weapon-sounds-ml-104378969"></a>
### loadClip

```ml
function loadClip(archive, path)
```

Calls `mq3.format.pk3.read`, `mq3.client.playable_weapon_sounds.decodeClip` from playable weapon sounds `loadClip`. The final path returns `decodeClip(path,data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Opened game archive supplying maps, models, textures or other assets. |
| `path` | `dynamic` | — | File or asset path used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L77)

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

Calls `mq3.client.playable_weapon_sounds.find` from playable weapon sounds `pickupSound`. The final path returns `weapon.pickup.sound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Asset catalog used to resolve names to loaded resources. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable weapon sounds resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L155)

<a id="function-function-mq3-client-playable-weapon-sounds-play-function-play-sound-src-mq3-client-playable-weapon-sounds-ml-899781055"></a>
### play

```ml
function play(sound)
```

Calls `mq3.platform.playable_audio.play` from playable weapon sounds `play`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sound` | `dynamic` | — | Sound handle or asset name passed to the audio action. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L159)

<a id="function-function-mq3-client-playable-weapon-sounds-resolve-function-resolve-clips-paths-src-mq3-client-playable-weapon-sounds-ml-840070931"></a>
### resolve

```ml
function resolve(clips, paths)
```

Calls `mq3.client.playable_weapon_sounds.findClip` from playable weapon sounds `resolve`. The final path returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clips` | `dynamic` | — | Value used by `clip=findClip(clips,path)`. |
| `paths` | `dynamic` | — | Value used by `for each path in paths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_sounds.ml#L95)

- [mq3.client.playable_weapon_sounds.WeaponSounds](Type-mq3-client-playable-weapon-sounds-weaponsounds-2125466897.md) — struct
