# `src/mq3/botlib/ai_weapon_combat.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_weapon_combat`](Package-mq3-botlib-ai-weapon-combat-1079708440.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_item_weights.ml` as `fuzzy` → [src/mq3/botlib/ai_item_weights.ml](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)
- `mq3/botlib/ai_resource_pools.ml` as `pools` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/botlib/ai_weapon_weights.ml` as `weapons` → [src/mq3/botlib/ai_weapon_weights.ml](File-src-mq3-botlib-ai-weapon-weights-ml-776993711.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-botlib-ai-weapon-combat-choosebestfightweapon-function-choosebestfightweapon-runtime-statepools-handle-inventory-src-mq3-botlib-ai-weapon-combat-ml-804006564"></a>
### chooseBestFightWeapon

```ml
function chooseBestFightWeapon(runtime, statePools, handle, inventory)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `statePools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L19)

<a id="function-function-mq3-botlib-ai-weapon-combat-encodeprojectile-function-encodeprojectile-output-offset-value-src-mq3-botlib-ai-weapon-combat-ml-1398830443"></a>
### encodeProjectile

```ml
function encodeProjectile(output, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L52)

<a id="function-function-mq3-botlib-ai-weapon-combat-encodeweaponinfo-function-encodeweaponinfo-value-src-mq3-botlib-ai-weapon-combat-ml-331370513"></a>
### encodeWeaponInfo

```ml
function encodeWeaponInfo(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L61)

<a id="function-function-mq3-botlib-ai-weapon-combat-fail-function-fail-message-src-mq3-botlib-ai-weapon-combat-ml-1499384759"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L17)

<a id="constant-constant-mq3-botlib-ai-weapon-combat-op-choose-best-fight-weapon-const-op-choose-best-fight-weapon-558-src-mq3-botlib-ai-weapon-combat-ml-129567979"></a>
### OP_CHOOSE_BEST_FIGHT_WEAPON

```ml
const OP_CHOOSE_BEST_FIGHT_WEAPON = 558
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L11)

<a id="constant-constant-mq3-botlib-ai-weapon-combat-op-get-weapon-info-const-op-get-weapon-info-559-src-mq3-botlib-ai-weapon-combat-ml-357144792"></a>
### OP_GET_WEAPON_INFO

```ml
const OP_GET_WEAPON_INFO = 559
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L12)

<a id="constant-constant-mq3-botlib-ai-weapon-combat-projectile-info-size-const-projectile-info-size-208-src-mq3-botlib-ai-weapon-combat-ml-1949090425"></a>
### PROJECTILE_INFO_SIZE

```ml
const PROJECTILE_INFO_SIZE = 208
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L14)

<a id="function-function-mq3-botlib-ai-weapon-combat-putf32-function-putf32-output-offset-value-src-mq3-botlib-ai-weapon-combat-ml-2075539379"></a>
### putF32

```ml
function putF32(output, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L44)

<a id="function-function-mq3-botlib-ai-weapon-combat-puti32-function-puti32-output-offset-value-src-mq3-botlib-ai-weapon-combat-ml-1113956443"></a>
### putI32

```ml
function putI32(output, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L43)

<a id="function-function-mq3-botlib-ai-weapon-combat-putstring-function-putstring-output-offset-value-src-mq3-botlib-ai-weapon-combat-ml-1762339411"></a>
### putString

```ml
function putString(output, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L46)

<a id="function-function-mq3-botlib-ai-weapon-combat-putvector-function-putvector-output-offset-value-src-mq3-botlib-ai-weapon-combat-ml-1402855027"></a>
### putVector

```ml
function putVector(output, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `output` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L45)

<a id="constant-constant-mq3-botlib-ai-weapon-combat-string-field-size-const-string-field-size-80-src-mq3-botlib-ai-weapon-combat-ml-1218877769"></a>
### STRING_FIELD_SIZE

```ml
const STRING_FIELD_SIZE = 80
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L13)

<a id="constant-constant-mq3-botlib-ai-weapon-combat-weapon-info-size-const-weapon-info-size-552-src-mq3-botlib-ai-weapon-combat-ml-26285789"></a>
### WEAPON_INFO_SIZE

```ml
const WEAPON_INFO_SIZE = 552
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L15)

<a id="function-function-mq3-botlib-ai-weapon-combat-weaponinfo-function-weaponinfo-runtime-statepools-handle-number-src-mq3-botlib-ai-weapon-combat-ml-1702627455"></a>
### weaponInfo

```ml
function weaponInfo(runtime, statePools, handle, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `statePools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat.ml#L36)
