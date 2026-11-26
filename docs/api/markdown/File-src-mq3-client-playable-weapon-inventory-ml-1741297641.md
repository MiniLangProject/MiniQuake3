# `src/mq3/client/playable_weapon_inventory.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_weapon_inventory`](Package-mq3-client-playable-weapon-inventory-1072219355.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-client-playable-weapon-inventory-addammo-function-addammo-state-weapon-amount-src-mq3-client-playable-weapon-inventory-ml-617369061"></a>
### addAmmo

```ml
function addAmmo(state, weapon, amount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L114)

<a id="function-function-mq3-client-playable-weapon-inventory-ammodefinition-function-ammodefinition-classname-src-mq3-client-playable-weapon-inventory-ml-811584685"></a>
### ammoDefinition

```ml
function ammoDefinition(classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L71)

<a id="function-function-mq3-client-playable-weapon-inventory-ammofor-function-ammofor-state-weapon-src-mq3-client-playable-weapon-inventory-ml-197871569"></a>
### ammoFor

```ml
function ammoFor(state, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L109)

<a id="function-function-mq3-client-playable-weapon-inventory-consume-function-consume-state-weapon-amount-src-mq3-client-playable-weapon-inventory-ml-1628882199"></a>
### consume

```ml
function consume(state, weapon, amount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L153)

<a id="function-function-mq3-client-playable-weapon-inventory-create-function-create-teammode-src-mq3-client-playable-weapon-inventory-ml-1962703304"></a>
### create

```ml
function create(teamMode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `teamMode` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L91)

<a id="function-function-mq3-client-playable-weapon-inventory-cycle-function-cycle-state-direction-src-mq3-client-playable-weapon-inventory-ml-651272292"></a>
### cycle

```ml
function cycle(state, direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L185)

- [mq3.client.playable_weapon_inventory.Definition](Type-mq3-client-playable-weapon-inventory-definition-1326086658.md) — struct
<a id="function-function-mq3-client-playable-weapon-inventory-definitions-function-definitions-src-mq3-client-playable-weapon-inventory-ml-1713173734"></a>
### definitions

```ml
function definitions()
```

Quantities and giTag relationships are the stock baseq3 bg_itemlist entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L38)

<a id="function-function-mq3-client-playable-weapon-inventory-fail-function-fail-message-src-mq3-client-playable-weapon-inventory-ml-1208877513"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L35)

- [mq3.client.playable_weapon_inventory.Inventory](Type-mq3-client-playable-weapon-inventory-inventory-682321681.md) — struct
<a id="function-function-mq3-client-playable-weapon-inventory-isweaponname-function-isweaponname-def-name-src-mq3-client-playable-weapon-inventory-ml-1336910872"></a>
### isWeaponName

```ml
function isWeaponName(def, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `def` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L51)

<a id="constant-constant-mq3-client-playable-weapon-inventory-max-ammo-const-max-ammo-200-src-mq3-client-playable-weapon-inventory-ml-942891629"></a>
### MAX_AMMO

```ml
const MAX_AMMO = 200
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L6)

<a id="constant-constant-mq3-client-playable-weapon-inventory-max-weapons-const-max-weapons-16-src-mq3-client-playable-weapon-inventory-ml-26848938"></a>
### MAX_WEAPONS

```ml
const MAX_WEAPONS = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L5)

<a id="function-function-mq3-client-playable-weapon-inventory-nextweapon-function-nextweapon-state-src-mq3-client-playable-weapon-inventory-ml-1498966847"></a>
### nextWeapon

```ml
function nextWeapon(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L201)

<a id="function-function-mq3-client-playable-weapon-inventory-outofammochange-function-outofammochange-state-src-mq3-client-playable-weapon-inventory-ml-1564473573"></a>
### outOfAmmoChange

```ml
function outOfAmmoChange(state)
```

Exact CG_OutOfAmmoChange preference: highest numbered selectable weapon, including the unlimited gauntlet as the final fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L206)

<a id="function-function-mq3-client-playable-weapon-inventory-owns-function-owns-state-weapon-src-mq3-client-playable-weapon-inventory-ml-1976522235"></a>
### owns

```ml
function owns(state, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L104)

<a id="function-function-mq3-client-playable-weapon-inventory-pickupammo-function-pickupammo-state-classname-countoverride-src-mq3-client-playable-weapon-inventory-ml-223730701"></a>
### pickupAmmo

```ml
function pickupAmmo(state, classname, countOverride)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |
| `countOverride` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L144)

<a id="function-function-mq3-client-playable-weapon-inventory-pickupweapon-function-pickupweapon-state-name-countoverride-dropped-teammode-src-mq3-client-playable-weapon-inventory-ml-480872637"></a>
### pickupWeapon

```ml
function pickupWeapon(state, name, countOverride, dropped, teamMode)
```

countOverride follows g_items.c: zero uses bg_itemlist, a negative weapon count grants ownership without ammo, and a positive value overrides quantity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `countOverride` | `dynamic` | — |  |
| `dropped` | `dynamic` | — |  |
| `teamMode` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L126)

<a id="function-function-mq3-client-playable-weapon-inventory-previousweapon-function-previousweapon-state-src-mq3-client-playable-weapon-inventory-ml-938204015"></a>
### previousWeapon

```ml
function previousWeapon(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L202)

<a id="function-function-mq3-client-playable-weapon-inventory-resetbaseloadout-function-resetbaseloadout-state-teammode-src-mq3-client-playable-weapon-inventory-ml-1395871973"></a>
### resetBaseLoadout

```ml
function resetBaseLoadout(state, teamMode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `teamMode` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L80)

<a id="function-function-mq3-client-playable-weapon-inventory-respawn-function-respawn-state-teammode-src-mq3-client-playable-weapon-inventory-ml-2066500501"></a>
### respawn

```ml
function respawn(state, teamMode)
```

Like ClientSpawn, transient weapons and ammo are reset while persistent spawn bookkeeping survives. The Inventory object and ammo array retain their identity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `teamMode` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L98)

<a id="function-function-mq3-client-playable-weapon-inventory-select-function-select-state-weapon-src-mq3-client-playable-weapon-inventory-ml-217602331"></a>
### select

```ml
function select(state, weapon)
```

CG_Weapon_f allows direct selection of an owned weapon even when empty.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L168)

<a id="function-function-mq3-client-playable-weapon-inventory-selectable-function-selectable-state-weapon-src-mq3-client-playable-weapon-inventory-ml-1108207903"></a>
### selectable

```ml
function selectable(state, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L162)

<a id="function-function-mq3-client-playable-weapon-inventory-selectdigit-function-selectdigit-state-digit-src-mq3-client-playable-weapon-inventory-ml-1977319434"></a>
### selectDigit

```ml
function selectDigit(state, digit)
```

Baseq3's `weapon N` command maps number keys directly to weapon ids. It permits selecting an owned weapon with zero ammo; the next attack produces EV_NOAMMO and invokes the normal fallback selection.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `digit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L178)

<a id="function-function-mq3-client-playable-weapon-inventory-validstate-function-validstate-state-src-mq3-client-playable-weapon-inventory-ml-1032645815"></a>
### validState

```ml
function validState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L77)

<a id="function-function-mq3-client-playable-weapon-inventory-validweaponid-function-validweaponid-weapon-src-mq3-client-playable-weapon-inventory-ml-1463094960"></a>
### validWeaponId

```ml
function validWeaponId(weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L78)

<a id="function-function-mq3-client-playable-weapon-inventory-weapondefinition-function-weapondefinition-value-src-mq3-client-playable-weapon-inventory-ml-813317983"></a>
### weaponDefinition

```ml
function weaponDefinition(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L61)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-bfg-const-wp-bfg-9-src-mq3-client-playable-weapon-inventory-ml-1682689068"></a>
### WP_BFG

```ml
const WP_BFG = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L16)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-gauntlet-const-wp-gauntlet-1-src-mq3-client-playable-weapon-inventory-ml-1787869096"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L8)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-grappling-hook-const-wp-grappling-hook-10-src-mq3-client-playable-weapon-inventory-ml-1930596120"></a>
### WP_GRAPPLING_HOOK

```ml
const WP_GRAPPLING_HOOK = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L17)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-client-playable-weapon-inventory-ml-1118437323"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L11)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-lightning-const-wp-lightning-6-src-mq3-client-playable-weapon-inventory-ml-1365231255"></a>
### WP_LIGHTNING

```ml
const WP_LIGHTNING = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L13)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-machinegun-const-wp-machinegun-2-src-mq3-client-playable-weapon-inventory-ml-1339744777"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L9)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-none-const-wp-none-0-src-mq3-client-playable-weapon-inventory-ml-2082962511"></a>
### WP_NONE

```ml
const WP_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L7)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-plasmagun-const-wp-plasmagun-8-src-mq3-client-playable-weapon-inventory-ml-907566501"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L15)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-railgun-const-wp-railgun-7-src-mq3-client-playable-weapon-inventory-ml-624997540"></a>
### WP_RAILGUN

```ml
const WP_RAILGUN = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L14)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-rocket-launcher-const-wp-rocket-launcher-5-src-mq3-client-playable-weapon-inventory-ml-94196820"></a>
### WP_ROCKET_LAUNCHER

```ml
const WP_ROCKET_LAUNCHER = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L12)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-shotgun-const-wp-shotgun-3-src-mq3-client-playable-weapon-inventory-ml-1095946956"></a>
### WP_SHOTGUN

```ml
const WP_SHOTGUN = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon_inventory.ml#L10)
