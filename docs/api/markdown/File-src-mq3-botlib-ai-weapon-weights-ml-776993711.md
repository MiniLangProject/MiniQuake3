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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L14)

<a id="constant-constant-mq3-botlib-ai-weapon-weights-blerr-cannotloadweaponweights-const-blerr-cannotloadweaponweights-11-src-mq3-botlib-ai-weapon-weights-ml-1779889647"></a>
### BLERR_CANNOTLOADWEAPONWEIGHTS

```ml
const BLERR_CANNOTLOADWEAPONWEIGHTS = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L13)

<a id="constant-constant-mq3-botlib-ai-weapon-weights-blerr-noerror-const-blerr-noerror-0-src-mq3-botlib-ai-weapon-weights-ml-1264678151"></a>
### BLERR_NOERROR

```ml
const BLERR_NOERROR = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L12)

<a id="function-function-mq3-botlib-ai-weapon-weights-close-function-close-reader-src-mq3-botlib-ai-weapon-weights-ml-146049347"></a>
### close

```ml
function close(reader)
```

Apply `mq3.vm.pc_parser.free` while evaluating `close`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L50)

<a id="function-function-mq3-botlib-ai-weapon-weights-create-function-create-context-readfn-fuzzyruntime-src-mq3-botlib-ai-weapon-weights-ml-2133404849"></a>
### create

```ml
function create(context, readFn, fuzzyRuntime)
```

Create a `mq3.botlib.ai_weapon_weights.Runtime` record, initializing `context` from `context`, `readFn` from `readFn` and `fuzzyRuntime` from `fuzzyRuntime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `readFn` | `dynamic` | — | Callback that loads a named resource through the supplied context. |
| `fuzzyRuntime` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_weapon_weights.Runtime.fuzzyRuntime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L39)

<a id="function-function-mq3-botlib-ai-weapon-weights-emptyprojectile-function-emptyprojectile-src-mq3-botlib-ai-weapon-weights-ml-801641958"></a>
### emptyProjectile

```ml
function emptyProjectile()
```

Create a `mq3.botlib.ai_weapon_weights.Projectile` record with the declared empty defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L32)

<a id="function-function-mq3-botlib-ai-weapon-weights-emptyweapon-function-emptyweapon-src-mq3-botlib-ai-weapon-weights-ml-1817871720"></a>
### emptyWeapon

```ml
function emptyWeapon()
```

Create a `mq3.botlib.ai_weapon_weights.Weapon` record, initializing `recoil` as `[0.0,0.0,0.0]`, `offset` as `[0.0,0.0,0.0]` and `angleOffset` as `[0.0,0.0,0.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L34)

<a id="function-function-mq3-botlib-ai-weapon-weights-ensureconfig-function-ensureconfig-runtime-src-mq3-botlib-ai-weapon-weights-ml-661625916"></a>
### ensureConfig

```ml
function ensureConfig(runtime)
```

Set `runtime.config` to `parseWeaponConfig(runtime,"weapons.c")` in `mq3.botlib.ai_weapon_weights.ensureConfig`. Return paths include `runtime.config`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI weapon weights runtime; accesses `config`. May update `runtime.config` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L133)

<a id="function-function-mq3-botlib-ai-weapon-weights-expect-function-expect-reader-text-src-mq3-botlib-ai-weapon-weights-ml-126287958"></a>
### expect

```ml
function expect(reader, text)
```

Apply `mq3.botlib.ai_weapon_weights.take` while evaluating `expect`. Return paths include `token`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L57)

<a id="function-function-mq3-botlib-ai-weapon-weights-fail-function-fail-message-src-mq3-botlib-ai-weapon-weights-ml-120838757"></a>
### fail

```ml
function fail(message)
```

Construct error `7580` with diagnostic text `"AI weapon weights: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L30)

<a id="function-function-mq3-botlib-ai-weapon-weights-freeweaponweights-function-freeweaponweights-runtime-statepools-handle-src-mq3-botlib-ai-weapon-weights-ml-442698740"></a>
### freeWeaponWeights

```ml
function freeWeaponWeights(runtime, statePools, handle)
```

Apply `mq3.botlib.ai_resource_pools.weaponState` while evaluating `freeWeaponWeights`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Not read by this implementation; retained in the `freeWeaponWeights` signature. |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot weapon state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L142)

<a id="function-function-mq3-botlib-ai-weapon-weights-loadtext-function-loadtext-runtime-name-src-mq3-botlib-ai-weapon-weights-ml-1286568753"></a>
### loadText

```ml
function loadText(runtime, name)
```

Set `runtime.fileReads` to `runtime.fileReads+1` in `mq3.botlib.ai_weapon_weights.loadText`. Return paths include `runtime.readFn(runtime.context,fuzzy.botPath(name))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI weapon weights runtime; accesses `fileReads`, `readFn` and `context`. May update `runtime.fileReads` in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L43)

<a id="function-function-mq3-botlib-ai-weapon-weights-loadweaponweights-function-loadweaponweights-runtime-statepools-handle-filename-src-mq3-botlib-ai-weapon-weights-ml-144912147"></a>
### loadWeaponWeights

```ml
function loadWeaponWeights(runtime, statePools, handle, filename)
```

Apply `mq3.botlib.ai_resource_pools.weaponState`, `mq3.botlib.ai_weapon_weights.freeWeaponWeights` and `mq3.botlib.ai_item_weights.weightConfig` while evaluating `loadWeaponWeights`. Return paths include `BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI weapon weights runtime; accesses `fuzzyRuntime`. |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot weapon state. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L148)

<a id="constant-constant-mq3-botlib-ai-weapon-weights-max-projectileinfo-const-max-projectileinfo-32-src-mq3-botlib-ai-weapon-weights-ml-1083535106"></a>
### MAX_PROJECTILEINFO

```ml
const MAX_PROJECTILEINFO = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L11)

<a id="constant-constant-mq3-botlib-ai-weapon-weights-max-weaponinfo-const-max-weaponinfo-32-src-mq3-botlib-ai-weapon-weights-ml-1265441272"></a>
### MAX_WEAPONINFO

```ml
const MAX_WEAPONINFO = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L10)

<a id="constant-constant-mq3-botlib-ai-weapon-weights-op-load-weapon-weights-const-op-load-weapon-weights-560-src-mq3-botlib-ai-weapon-weights-ml-1946901702"></a>
### OP_LOAD_WEAPON_WEIGHTS

```ml
const OP_LOAD_WEAPON_WEIGHTS = 560
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L15)

<a id="function-function-mq3-botlib-ai-weapon-weights-open-function-open-runtime-name-src-mq3-botlib-ai-weapon-weights-ml-1776484361"></a>
### open

```ml
function open(runtime, name)
```

Build the `mq3.botlib.ai_weapon_weights.Reader` result for `open`. Return paths include `Reader(registry,handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L47)

<a id="function-function-mq3-botlib-ai-weapon-weights-parseprojectile-function-parseprojectile-reader-src-mq3-botlib-ai-weapon-weights-ml-1113290395"></a>
### parseProjectile

```ml
function parseProjectile(reader)
```

Apply `mq3.botlib.ai_weapon_weights.expect`, `mq3.botlib.ai_weapon_weights.emptyProjectile` and `mq3.botlib.ai_weapon_weights.take` while evaluating `parseProjectile`. Return paths include `fail("unknown projectile field "+field.text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L64)

<a id="function-function-mq3-botlib-ai-weapon-weights-parseweapon-function-parseweapon-reader-src-mq3-botlib-ai-weapon-weights-ml-650688649"></a>
### parseWeapon

```ml
function parseWeapon(reader)
```

Apply `mq3.botlib.ai_weapon_weights.expect`, `mq3.botlib.ai_weapon_weights.emptyWeapon` and `mq3.botlib.ai_weapon_weights.take` while evaluating `parseWeapon`. Return paths include `fail("unknown weapon field "+field.text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L86)

<a id="function-function-mq3-botlib-ai-weapon-weights-parseweaponconfig-function-parseweaponconfig-runtime-filename-src-mq3-botlib-ai-weapon-weights-ml-59745805"></a>
### parseWeaponConfig

```ml
function parseWeaponConfig(runtime, filename)
```

Build the `mq3.botlib.ai_weapon_weights.WeaponConfig` result for `parseWeaponConfig`. Return paths include `WeaponConfig(weapons,projectiles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L121)

- [mq3.botlib.ai_weapon_weights.Projectile](Type-mq3-botlib-ai-weapon-weights-projectile-2022640914.md) — struct
<a id="function-function-mq3-botlib-ai-weapon-weights-projectilenamed-function-projectilenamed-projectiles-name-src-mq3-botlib-ai-weapon-weights-ml-1984444821"></a>
### projectileNamed

```ml
function projectileNamed(projectiles, name)
```

Find a projectile definition by its exact name, returning void when absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `projectiles` | `dynamic` | — | Value used by `projectileNamed` in `for each projectile in projectiles if projectile.name==name then return projectile end if end for`. |
| `name` | `dynamic` | — | Lookup text matched against `projectile.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L117)

- [mq3.botlib.ai_weapon_weights.Reader](Type-mq3-botlib-ai-weapon-weights-reader-1995034542.md) — struct
<a id="function-function-mq3-botlib-ai-weapon-weights-readstring-function-readstring-reader-src-mq3-botlib-ai-weapon-weights-ml-1845091947"></a>
### readString

```ml
function readString(reader)
```

Apply `mq3.botlib.ai_weapon_weights.take` while evaluating `readString`. Return paths include `token.text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L60)

- [mq3.botlib.ai_weapon_weights.Runtime](Type-mq3-botlib-ai-weapon-weights-runtime-1155330563.md) — struct
<a id="function-function-mq3-botlib-ai-weapon-weights-shutdown-function-shutdown-runtime-src-mq3-botlib-ai-weapon-weights-ml-6190608"></a>
### shutdown

```ml
function shutdown(runtime)
```

Set `runtime.config` to `void` in `mq3.botlib.ai_weapon_weights.shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI weapon weights runtime; accesses `config`. May update `runtime.config` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L155)

<a id="function-function-mq3-botlib-ai-weapon-weights-take-function-take-reader-src-mq3-botlib-ai-weapon-weights-ml-106913819"></a>
### take

```ml
function take(reader)
```

Forward `take` to `mq3.vm.pc_parser.read` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Token-reader state; accesses `registry` and `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L53)

- [mq3.botlib.ai_weapon_weights.Weapon](Type-mq3-botlib-ai-weapon-weights-weapon-1941373401.md) — struct
- [mq3.botlib.ai_weapon_weights.WeaponConfig](Type-mq3-botlib-ai-weapon-weights-weaponconfig-1789585707.md) — struct
<a id="function-function-mq3-botlib-ai-weapon-weights-weaponweightindex-function-weaponweightindex-profile-config-src-mq3-botlib-ai-weapon-weights-ml-1311756029"></a>
### weaponWeightIndex

```ml
function weaponWeightIndex(profile, config)
```

Apply `mq3.botlib.ai_item_weights.findWeight` while evaluating `weaponWeightIndex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `profile` | `dynamic` | — | Configuration record; accesses `weights`. |
| `config` | `dynamic` | — | Configuration record; accesses `weapons`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_weights.ml#L137)
