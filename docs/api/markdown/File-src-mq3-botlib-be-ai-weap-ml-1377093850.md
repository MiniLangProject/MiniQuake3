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

Forward `BotAllocWeaponState` to `mq3.botlib.ai_resource_pools.allocWeaponState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. May update `statePools.weaponStates[handle]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L68)

<a id="function-function-mq3-botlib-be-ai-weap-botchoosebestfightweapon-function-botchoosebestfightweapon-runtime-statepools-weaponstate-inventory-src-mq3-botlib-be-ai-weap-ml-1400276371"></a>
### BotChooseBestFightWeapon

```ml
function BotChooseBestFightWeapon(runtime, statePools, weaponState, inventory)
```

Forward `BotChooseBestFightWeapon` to `mq3.botlib.ai_weapon_combat.chooseBestFightWeapon` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI weapon combat runtime; accesses `config`. |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |
| `weaponState` | `dynamic` | — | Handle identifying the allocated bot weapon state. |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L61)

<a id="function-function-mq3-botlib-be-ai-weap-botfreeweaponstate-function-botfreeweaponstate-statepools-handle-src-mq3-botlib-be-ai-weap-ml-1549961278"></a>
### BotFreeWeaponState

```ml
function BotFreeWeaponState(statePools, handle)
```

Forward `BotFreeWeaponState` to `mq3.botlib.ai_resource_pools.freeWeaponState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. May update `statePools.weaponStates[handle]` in place. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot weapon state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L72)

<a id="function-function-mq3-botlib-be-ai-weap-botfreeweaponweights-function-botfreeweaponweights-runtime-statepools-weaponstate-src-mq3-botlib-be-ai-weap-ml-869358001"></a>
### BotFreeWeaponWeights

```ml
function BotFreeWeaponWeights(runtime, statePools, weaponState)
```

Forward `BotFreeWeaponWeights` to `mq3.botlib.ai_weapon_weights.freeWeaponWeights` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Value passed as argument 1 to `mq3.botlib.ai_weapon_weights.freeWeaponWeights`. |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |
| `weaponState` | `dynamic` | — | Handle identifying the allocated bot weapon state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L43)

<a id="function-function-mq3-botlib-be-ai-weap-botgetweaponinfo-function-botgetweaponinfo-runtime-statepools-weaponstate-weapon-src-mq3-botlib-be-ai-weap-ml-362490473"></a>
### BotGetWeaponInfo

```ml
function BotGetWeaponInfo(runtime, statePools, weaponState, weapon)
```

Forward `BotGetWeaponInfo` to `mq3.botlib.ai_weapon_combat.weaponInfo` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI weapon combat runtime; accesses `config`. |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |
| `weaponState` | `dynamic` | — | Handle identifying the allocated bot weapon state. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L55)

<a id="function-function-mq3-botlib-be-ai-weap-botloadweaponweights-function-botloadweaponweights-runtime-statepools-weaponstate-filename-src-mq3-botlib-be-ai-weap-ml-1101735572"></a>
### BotLoadWeaponWeights

```ml
function BotLoadWeaponWeights(runtime, statePools, weaponState, filename)
```

Forward `BotLoadWeaponWeights` to `mq3.botlib.ai_weapon_weights.loadWeaponWeights` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI weapon weights runtime; accesses `fuzzyRuntime`. |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |
| `weaponState` | `dynamic` | — | Handle identifying the allocated bot weapon state. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L49)

<a id="function-function-mq3-botlib-be-ai-weap-botresetweaponstate-function-botresetweaponstate-statepools-weaponstate-src-mq3-botlib-be-ai-weap-ml-390260839"></a>
### BotResetWeaponState

```ml
function BotResetWeaponState(statePools, weaponState)
```

Forward `BotResetWeaponState` to `mq3.botlib.ai_resource_pools.resetWeaponState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |
| `weaponState` | `dynamic` | — | Handle identifying the allocated bot weapon state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L65)

<a id="function-function-mq3-botlib-be-ai-weap-botsetupweaponai-function-botsetupweaponai-runtime-src-mq3-botlib-be-ai-weap-ml-1688691656"></a>
### BotSetupWeaponAI

```ml
function BotSetupWeaponAI(runtime)
```

Apply `mq3.botlib.ai_weapon_weights.ensureConfig` while evaluating `BotSetupWeaponAI`. Return paths include `weights.BLERR_NOERROR`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI weapon weights runtime; accesses `config`. May update `runtime.config` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L75)

<a id="function-function-mq3-botlib-be-ai-weap-botshutdownweaponai-function-botshutdownweaponai-runtime-statepools-src-mq3-botlib-be-ai-weap-ml-651086822"></a>
### BotShutdownWeaponAI

```ml
function BotShutdownWeaponAI(runtime, statePools)
```

Apply `mq3.botlib.ai_resource_pools.weaponState`, `mq3.botlib.ai_resource_pools.freeWeaponState` and `mq3.botlib.ai_weapon_weights.shutdown` while evaluating `BotShutdownWeaponAI`. Return paths include `weights.shutdown(runtime)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI weapon weights runtime; accesses `config`. May update `runtime.config` in place. |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L82)

<a id="function-function-mq3-botlib-be-ai-weap-botvalidweaponnumber-function-botvalidweaponnumber-runtime-weaponnum-src-mq3-botlib-be-ai-weap-ml-1933697796"></a>
### BotValidWeaponNumber

```ml
function BotValidWeaponNumber(runtime, weaponNum)
```

Check that a weapon number refers to an entry in a loaded weapon configuration.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AI weap runtime; accesses `config`. |
| `weaponNum` | `dynamic` | — | Operand used to evaluate the returned expression `weaponNum>0 and weaponNum<=len(runtime.config.weapons)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L13)

<a id="function-function-mq3-botlib-be-ai-weap-botweaponstatefromhandle-function-botweaponstatefromhandle-statepools-handle-src-mq3-botlib-be-ai-weap-ml-1579131118"></a>
### BotWeaponStateFromHandle

```ml
function BotWeaponStateFromHandle(statePools, handle)
```

Forward `BotWeaponStateFromHandle` to `mq3.botlib.ai_resource_pools.weaponState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `statePools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot weapon state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L22)

<a id="function-function-mq3-botlib-be-ai-weap-dumpweaponconfig-function-dumpweaponconfig-config-src-mq3-botlib-be-ai-weap-ml-1174770698"></a>
### DumpWeaponConfig

```ml
function DumpWeaponConfig(config)
```

List projectile names and valid weapon numbers and names from the weapon configuration.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Configuration record; accesses `projectiles` and `weapons`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L25)

<a id="function-function-mq3-botlib-be-ai-weap-loadweaponconfig-function-loadweaponconfig-runtime-filename-src-mq3-botlib-be-ai-weap-ml-494205605"></a>
### LoadWeaponConfig

```ml
function LoadWeaponConfig(runtime, filename)
```

Forward `LoadWeaponConfig` to `mq3.botlib.ai_weapon_weights.parseWeaponConfig` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L34)

<a id="function-function-mq3-botlib-be-ai-weap-weaponweightindex-function-weaponweightindex-profile-config-src-mq3-botlib-be-ai-weap-ml-1587439739"></a>
### WeaponWeightIndex

```ml
function WeaponWeightIndex(profile, config)
```

Forward `WeaponWeightIndex` to `mq3.botlib.ai_weapon_weights.weaponWeightIndex` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `profile` | `dynamic` | — | Configuration record; accesses `weights`. |
| `config` | `dynamic` | — | Configuration record; accesses `weapons`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_weap.ml#L38)
