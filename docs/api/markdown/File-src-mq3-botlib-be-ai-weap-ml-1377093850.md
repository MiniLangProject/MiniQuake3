# `src/mq3/botlib/be_ai_weap.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.be_ai_weap`](Package-mq3-botlib-be-ai-weap-96715484.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/ai_resource_pools.ml` as `pools` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/botlib/ai_weapon_combat.ml` as `combat` → [src/mq3/botlib/ai_weapon_combat.ml](File-src-mq3-botlib-ai-weapon-combat-ml-661609126.md)
- `mq3/botlib/ai_weapon_weights.ml` as `weights` → [src/mq3/botlib/ai_weapon_weights.ml](File-src-mq3-botlib-ai-weapon-weights-ml-776993711.md)

## Declarations

<a id="function-function-mq3-botlib-be-ai-weap-botallocweaponstate-function-botallocweaponstate-statepools-src-mq3-botlib-be-ai-weap-ml-1688234670"></a>
### BotAllocWeaponState

```ml
function BotAllocWeaponState(statePools)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `statePools` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L30)

<a id="function-function-mq3-botlib-be-ai-weap-botchoosebestfightweapon-function-botchoosebestfightweapon-runtime-statepools-weaponstate-inventory-src-mq3-botlib-be-ai-weap-ml-1400276371"></a>
### BotChooseBestFightWeapon

```ml
function BotChooseBestFightWeapon(runtime, statePools, weaponState, inventory)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `statePools` | `dynamic` | — |  |
| `weaponState` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L28)

<a id="function-function-mq3-botlib-be-ai-weap-botfreeweaponstate-function-botfreeweaponstate-statepools-handle-src-mq3-botlib-be-ai-weap-ml-1549961278"></a>
### BotFreeWeaponState

```ml
function BotFreeWeaponState(statePools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `statePools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L31)

<a id="function-function-mq3-botlib-be-ai-weap-botfreeweaponweights-function-botfreeweaponweights-runtime-statepools-weaponstate-src-mq3-botlib-be-ai-weap-ml-869358001"></a>
### BotFreeWeaponWeights

```ml
function BotFreeWeaponWeights(runtime, statePools, weaponState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `statePools` | `dynamic` | — |  |
| `weaponState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L25)

<a id="function-function-mq3-botlib-be-ai-weap-botgetweaponinfo-function-botgetweaponinfo-runtime-statepools-weaponstate-weapon-src-mq3-botlib-be-ai-weap-ml-362490473"></a>
### BotGetWeaponInfo

```ml
function BotGetWeaponInfo(runtime, statePools, weaponState, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `statePools` | `dynamic` | — |  |
| `weaponState` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L27)

<a id="function-function-mq3-botlib-be-ai-weap-botloadweaponweights-function-botloadweaponweights-runtime-statepools-weaponstate-filename-src-mq3-botlib-be-ai-weap-ml-1101735572"></a>
### BotLoadWeaponWeights

```ml
function BotLoadWeaponWeights(runtime, statePools, weaponState, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `statePools` | `dynamic` | — |  |
| `weaponState` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L26)

<a id="function-function-mq3-botlib-be-ai-weap-botresetweaponstate-function-botresetweaponstate-statepools-weaponstate-src-mq3-botlib-be-ai-weap-ml-390260839"></a>
### BotResetWeaponState

```ml
function BotResetWeaponState(statePools, weaponState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `statePools` | `dynamic` | — |  |
| `weaponState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L29)

<a id="function-function-mq3-botlib-be-ai-weap-botsetupweaponai-function-botsetupweaponai-runtime-src-mq3-botlib-be-ai-weap-ml-1688691656"></a>
### BotSetupWeaponAI

```ml
function BotSetupWeaponAI(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L32)

<a id="function-function-mq3-botlib-be-ai-weap-botshutdownweaponai-function-botshutdownweaponai-runtime-statepools-src-mq3-botlib-be-ai-weap-ml-651086822"></a>
### BotShutdownWeaponAI

```ml
function BotShutdownWeaponAI(runtime, statePools)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `statePools` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L36)

<a id="function-function-mq3-botlib-be-ai-weap-botvalidweaponnumber-function-botvalidweaponnumber-runtime-weaponnum-src-mq3-botlib-be-ai-weap-ml-1933697796"></a>
### BotValidWeaponNumber

```ml
function BotValidWeaponNumber(runtime, weaponNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `weaponNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L10)

<a id="function-function-mq3-botlib-be-ai-weap-botweaponstatefromhandle-function-botweaponstatefromhandle-statepools-handle-src-mq3-botlib-be-ai-weap-ml-1579131118"></a>
### BotWeaponStateFromHandle

```ml
function BotWeaponStateFromHandle(statePools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `statePools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L16)

<a id="function-function-mq3-botlib-be-ai-weap-dumpweaponconfig-function-dumpweaponconfig-config-src-mq3-botlib-be-ai-weap-ml-1174770698"></a>
### DumpWeaponConfig

```ml
function DumpWeaponConfig(config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L17)

<a id="function-function-mq3-botlib-be-ai-weap-loadweaponconfig-function-loadweaponconfig-runtime-filename-src-mq3-botlib-be-ai-weap-ml-494205605"></a>
### LoadWeaponConfig

```ml
function LoadWeaponConfig(runtime, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L23)

<a id="function-function-mq3-botlib-be-ai-weap-weaponweightindex-function-weaponweightindex-profile-config-src-mq3-botlib-be-ai-weap-ml-1587439739"></a>
### WeaponWeightIndex

```ml
function WeaponWeightIndex(profile, config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `profile` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L24)
