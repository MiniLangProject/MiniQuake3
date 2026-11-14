# `src/mq3/botlib/ai_weapon_weights.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_weapon_weights`](Package-mq3-botlib-ai-weapon-weights-654419809.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_item_weights.ml` as `fuzzy` → [src/mq3/botlib/ai_item_weights.ml](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)
- `mq3/botlib/ai_resource_pools.ml` as `pools` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/vm/pc_parser.ml` as `pc` → [src/mq3/vm/pc_parser.ml](File-src-mq3-vm-pc-parser-ml-1324474776.md)

## Declarations

<a id="constant-constant-mq3-botlib-ai-weapon-weights-blerr-cannotloadweaponconfig-const-blerr-cannotloadweaponconfig-12-src-mq3-botlib-ai-weapon-weights-ml-1490628966"></a>
### BLERR_CANNOTLOADWEAPONCONFIG

```ml
const BLERR_CANNOTLOADWEAPONCONFIG = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L14)

<a id="constant-constant-mq3-botlib-ai-weapon-weights-blerr-cannotloadweaponweights-const-blerr-cannotloadweaponweights-11-src-mq3-botlib-ai-weapon-weights-ml-1779889647"></a>
### BLERR_CANNOTLOADWEAPONWEIGHTS

```ml
const BLERR_CANNOTLOADWEAPONWEIGHTS = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L13)

<a id="constant-constant-mq3-botlib-ai-weapon-weights-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-ai-weapon-weights-ml-1264678151"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L12)

<a id="function-function-mq3-botlib-ai-weapon-weights-close-function-close-reader-src-mq3-botlib-ai-weapon-weights-ml-146049347"></a>
### close

```ml
function close(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L29)

<a id="function-function-mq3-botlib-ai-weapon-weights-create-function-create-context-readfn-fuzzyruntime-src-mq3-botlib-ai-weapon-weights-ml-2133404849"></a>
### create

```ml
function create(context, readFn, fuzzyRuntime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `readFn` | `dynamic` | — |  |
| `fuzzyRuntime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L26)

<a id="function-function-mq3-botlib-ai-weapon-weights-emptyprojectile-function-emptyprojectile-src-mq3-botlib-ai-weapon-weights-ml-801641958"></a>
### emptyProjectile

```ml
function emptyProjectile()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L24)

<a id="function-function-mq3-botlib-ai-weapon-weights-emptyweapon-function-emptyweapon-src-mq3-botlib-ai-weapon-weights-ml-1817871720"></a>
### emptyWeapon

```ml
function emptyWeapon()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L25)

<a id="function-function-mq3-botlib-ai-weapon-weights-ensureconfig-function-ensureconfig-runtime-src-mq3-botlib-ai-weapon-weights-ml-661625916"></a>
### ensureConfig

```ml
function ensureConfig(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L93)

<a id="function-function-mq3-botlib-ai-weapon-weights-expect-function-expect-reader-text-src-mq3-botlib-ai-weapon-weights-ml-126287958"></a>
### expect

```ml
function expect(reader, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L31)

<a id="function-function-mq3-botlib-ai-weapon-weights-fail-function-fail-message-src-mq3-botlib-ai-weapon-weights-ml-120838757"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L23)

<a id="function-function-mq3-botlib-ai-weapon-weights-freeweaponweights-function-freeweaponweights-runtime-statepools-handle-src-mq3-botlib-ai-weapon-weights-ml-442698740"></a>
### freeWeaponWeights

```ml
function freeWeaponWeights(runtime, statePools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `statePools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L95)

<a id="function-function-mq3-botlib-ai-weapon-weights-loadtext-function-loadtext-runtime-name-src-mq3-botlib-ai-weapon-weights-ml-1286568753"></a>
### loadText

```ml
function loadText(runtime, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L27)

<a id="function-function-mq3-botlib-ai-weapon-weights-loadweaponweights-function-loadweaponweights-runtime-statepools-handle-filename-src-mq3-botlib-ai-weapon-weights-ml-144912147"></a>
### loadWeaponWeights

```ml
function loadWeaponWeights(runtime, statePools, handle, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `statePools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L96)

<a id="constant-constant-mq3-botlib-ai-weapon-weights-max-projectileinfo-const-max-projectileinfo-32-src-mq3-botlib-ai-weapon-weights-ml-1083535106"></a>
### MAX_PROJECTILEINFO

```ml
const MAX_PROJECTILEINFO = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L11)

<a id="constant-constant-mq3-botlib-ai-weapon-weights-max-weaponinfo-const-max-weaponinfo-32-src-mq3-botlib-ai-weapon-weights-ml-1265441272"></a>
### MAX_WEAPONINFO

```ml
const MAX_WEAPONINFO = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L10)

<a id="constant-constant-mq3-botlib-ai-weapon-weights-op-load-weapon-weights-const-op-load-weapon-weights-560-src-mq3-botlib-ai-weapon-weights-ml-1946901702"></a>
### OP_LOAD_WEAPON_WEIGHTS

```ml
const OP_LOAD_WEAPON_WEIGHTS = 560
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L15)

<a id="function-function-mq3-botlib-ai-weapon-weights-open-function-open-runtime-name-src-mq3-botlib-ai-weapon-weights-ml-1776484361"></a>
### open

```ml
function open(runtime, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L28)

<a id="function-function-mq3-botlib-ai-weapon-weights-parseprojectile-function-parseprojectile-reader-src-mq3-botlib-ai-weapon-weights-ml-1113290395"></a>
### parseProjectile

```ml
function parseProjectile(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L34)

<a id="function-function-mq3-botlib-ai-weapon-weights-parseweapon-function-parseweapon-reader-src-mq3-botlib-ai-weapon-weights-ml-650688649"></a>
### parseWeapon

```ml
function parseWeapon(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L54)

<a id="function-function-mq3-botlib-ai-weapon-weights-parseweaponconfig-function-parseweaponconfig-runtime-filename-src-mq3-botlib-ai-weapon-weights-ml-59745805"></a>
### parseWeaponConfig

```ml
function parseWeaponConfig(runtime, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L83)

- [mq3.botlib.ai_weapon_weights.Projectile](Type-mq3-botlib-ai-weapon-weights-projectile-2022640914.md) — struct
<a id="function-function-mq3-botlib-ai-weapon-weights-projectilenamed-function-projectilenamed-projectiles-name-src-mq3-botlib-ai-weapon-weights-ml-1984444821"></a>
### projectileNamed

```ml
function projectileNamed(projectiles, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projectiles` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L82)

- [mq3.botlib.ai_weapon_weights.Reader](Type-mq3-botlib-ai-weapon-weights-reader-1995034542.md) — struct
<a id="function-function-mq3-botlib-ai-weapon-weights-readstring-function-readstring-reader-src-mq3-botlib-ai-weapon-weights-ml-1845091947"></a>
### readString

```ml
function readString(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L32)

- [mq3.botlib.ai_weapon_weights.Runtime](Type-mq3-botlib-ai-weapon-weights-runtime-1155330563.md) — struct
<a id="function-function-mq3-botlib-ai-weapon-weights-shutdown-function-shutdown-runtime-src-mq3-botlib-ai-weapon-weights-ml-6190608"></a>
### shutdown

```ml
function shutdown(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L101)

<a id="function-function-mq3-botlib-ai-weapon-weights-take-function-take-reader-src-mq3-botlib-ai-weapon-weights-ml-106913819"></a>
### take

```ml
function take(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L30)

- [mq3.botlib.ai_weapon_weights.Weapon](Type-mq3-botlib-ai-weapon-weights-weapon-1941373401.md) — struct
- [mq3.botlib.ai_weapon_weights.WeaponConfig](Type-mq3-botlib-ai-weapon-weights-weaponconfig-1789585707.md) — struct
<a id="function-function-mq3-botlib-ai-weapon-weights-weaponweightindex-function-weaponweightindex-profile-config-src-mq3-botlib-ai-weapon-weights-ml-1311756029"></a>
### weaponWeightIndex

```ml
function weaponWeightIndex(profile, config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `profile` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weights.ml#L94)
