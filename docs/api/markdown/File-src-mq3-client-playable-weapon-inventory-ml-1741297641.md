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

Updates `state.ammo[weapon]` during playable weapon inventory `addAmmo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon inventory record/storage; this routine assigns `state.ammo[weapon]`. |
| `weapon` | `dynamic` | — | Value used by `if not validState(state) or not validWeaponId(weapon) then return fail("invalid ammo target") end if`. |
| `amount` | `dynamic` | — | Value tested by `if typeof(amount)!="int"` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L170)

<a id="function-function-mq3-client-playable-weapon-inventory-ammodefinition-function-ammodefinition-classname-src-mq3-client-playable-weapon-inventory-ml-811584685"></a>
### ammoDefinition

```ml
function ammoDefinition(classname)
```

Calls `mq3.client.playable_weapon_inventory.definitions`, `stringEqualsIgnoreCaseAscii` from playable weapon inventory `ammoDefinition`. The final path returns `def`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `if typeof(classname)!="string" then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L106)

<a id="function-function-mq3-client-playable-weapon-inventory-ammofor-function-ammofor-state-weapon-src-mq3-client-playable-weapon-inventory-ml-197871569"></a>
### ammoFor

```ml
function ammoFor(state, weapon)
```

Calls `mq3.client.playable_weapon_inventory.validState`, `mq3.client.playable_weapon_inventory.validWeaponId` from playable weapon inventory `ammoFor`. The final path returns `state.ammo[weapon]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ammo`. |
| `weapon` | `dynamic` | — | Value used by `if not validState(state) or not validWeaponId(weapon) then return fail("invalid ammo query") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L161)

<a id="function-function-mq3-client-playable-weapon-inventory-consume-function-consume-state-weapon-amount-src-mq3-client-playable-weapon-inventory-ml-1628882199"></a>
### consume

```ml
function consume(state, weapon, amount)
```

Updates `state.ammo[weapon]` during playable weapon inventory `consume`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon inventory record/storage; this routine assigns `state.ammo[weapon]`. |
| `weapon` | `dynamic` | — | Value used by `if not validState(state) or not validWeaponId(weapon) or typeof(amount)!="int" or amount<0 then return fail("invalid ammo consumption") end if`. |
| `amount` | `dynamic` | — | Value tested by `not validState(state) or not validWeaponId(weapon) or typeof(amount)!="int" or amount<0`, `if state.ammo[weapon]<amount` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L222)

<a id="function-function-mq3-client-playable-weapon-inventory-create-function-create-teammode-src-mq3-client-playable-weapon-inventory-ml-1962703304"></a>
### create

```ml
function create(teamMode)
```

Calls `mq3.client.playable_weapon_inventory.Inventory`, `mq3.client.playable_weapon_inventory.resetBaseLoadout` from playable weapon inventory `create`. The final path returns `resetBaseLoadout(state,teamMode)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `teamMode` | `dynamic` | — | Value used by `return resetBaseLoadout(state,teamMode)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L135)

<a id="function-function-mq3-client-playable-weapon-inventory-cycle-function-cycle-state-direction-src-mq3-client-playable-weapon-inventory-ml-651272292"></a>
### cycle

```ml
function cycle(state, direction)
```

Updates `state.selectedWeapon` during playable weapon inventory `cycle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon inventory record/storage; this routine assigns `state.selectedWeapon`. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L264)

- [mq3.client.playable_weapon_inventory.Definition](Type-mq3-client-playable-weapon-inventory-definition-1326086658.md) — struct
<a id="function-function-mq3-client-playable-weapon-inventory-definitions-function-definitions-src-mq3-client-playable-weapon-inventory-ml-1713173734"></a>
### definitions

```ml
function definitions()
```

Quantities and giTag relationships are the stock baseq3 bg_itemlist entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L66)

<a id="function-function-mq3-client-playable-weapon-inventory-fail-function-fail-message-src-mq3-client-playable-weapon-inventory-ml-1208877513"></a>
### fail

```ml
function fail(message)
```

Creates the playable weapon inventory error `7580` with diagnostic text `"Weapon inventory: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"Weapon inventory: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L63)

- [mq3.client.playable_weapon_inventory.Inventory](Type-mq3-client-playable-weapon-inventory-inventory-682321681.md) — struct
<a id="function-function-mq3-client-playable-weapon-inventory-isweaponname-function-isweaponname-def-name-src-mq3-client-playable-weapon-inventory-ml-1336910872"></a>
### isWeaponName

```ml
function isWeaponName(def, name)
```

Calls `stringEqualsIgnoreCaseAscii` from playable weapon inventory `isWeaponName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `def` | `dynamic` | — | Record read through `def.name`, `def.classname`, `def.id`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable weapon inventory resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L82)

<a id="constant-constant-mq3-client-playable-weapon-inventory-max-ammo-const-max-ammo-200-src-mq3-client-playable-weapon-inventory-ml-942891629"></a>
### MAX_AMMO

```ml
const MAX_AMMO = 200
```

Maximum ammunition quantity retained for a weapon inventory slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L8)

<a id="constant-constant-mq3-client-playable-weapon-inventory-max-weapons-const-max-weapons-16-src-mq3-client-playable-weapon-inventory-ml-26848938"></a>
### MAX_WEAPONS

```ml
const MAX_WEAPONS = 16
```

Capacity limit for the weapons collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L6)

<a id="function-function-mq3-client-playable-weapon-inventory-nextweapon-function-nextweapon-state-src-mq3-client-playable-weapon-inventory-ml-1498966847"></a>
### nextWeapon

```ml
function nextWeapon(state)
```

Adapts `mq3.client.playable_weapon_inventory.cycle` to playable weapon inventory `nextWeapon`, returning its result for `state, 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.playable_weapon_inventory.cycle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L282)

<a id="function-function-mq3-client-playable-weapon-inventory-outofammochange-function-outofammochange-state-src-mq3-client-playable-weapon-inventory-ml-1564473573"></a>
### outOfAmmoChange

```ml
function outOfAmmoChange(state)
```

Exact CG_OutOfAmmoChange preference: highest numbered selectable weapon, including the unlimited gauntlet as the final fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon inventory record/storage; this routine assigns `state.selectedWeapon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L290)

<a id="function-function-mq3-client-playable-weapon-inventory-owns-function-owns-state-weapon-src-mq3-client-playable-weapon-inventory-ml-1976522235"></a>
### owns

```ml
function owns(state, weapon)
```

Calls `mq3.client.playable_weapon_inventory.validState`, `mq3.client.playable_weapon_inventory.validWeaponId` from playable weapon inventory `owns`. The final path returns `(state.ownedBits&(1<<weapon))!=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ownedBits`. |
| `weapon` | `dynamic` | — | Value used by `if not validState(state) or not validWeaponId(weapon) then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L153)

<a id="function-function-mq3-client-playable-weapon-inventory-pickupammo-function-pickupammo-state-classname-countoverride-src-mq3-client-playable-weapon-inventory-ml-223730701"></a>
### pickupAmmo

```ml
function pickupAmmo(state, classname, countOverride)
```

Calls `mq3.client.playable_weapon_inventory.validState`, `mq3.client.playable_weapon_inventory.ammoDefinition`, `mq3.client.playable_weapon_inventory.addAmmo` from playable weapon inventory `pickupAmmo`. The final path returns `quantity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared playable weapon inventory state passed to the helper calls in `pickupAmmo`. |
| `classname` | `dynamic` | — | Value used by `def=ammoDefinition(classname)`. |
| `countOverride` | `dynamic` | — | Value used by `if typeof(countOverride)!="int" then return fail("ammo pickup count must be an integer") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L209)

<a id="function-function-mq3-client-playable-weapon-inventory-pickupweapon-function-pickupweapon-state-name-countoverride-dropped-teammode-src-mq3-client-playable-weapon-inventory-ml-480872637"></a>
### pickupWeapon

```ml
function pickupWeapon(state, name, countOverride, dropped, teamMode)
```

countOverride follows g_items.c: zero uses bg_itemlist, a negative weapon count grants ownership without ammo, and a positive value overrides quantity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon inventory record/storage; this routine assigns `state.ownedBits`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding playable weapon inventory resource. |
| `countOverride` | `dynamic` | — | Value used by `if typeof(countOverride)!="int" then return fail("weapon pickup count must be an integer") end if`. |
| `dropped` | `dynamic` | — | Value used by `if not dropped and not teamMode then`. |
| `teamMode` | `dynamic` | — | Value used by `if not dropped and not teamMode then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L187)

<a id="function-function-mq3-client-playable-weapon-inventory-previousweapon-function-previousweapon-state-src-mq3-client-playable-weapon-inventory-ml-938204015"></a>
### previousWeapon

```ml
function previousWeapon(state)
```

Adapts `mq3.client.playable_weapon_inventory.cycle` to playable weapon inventory `previousWeapon`, returning its result for `state, -1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.playable_weapon_inventory.cycle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L285)

<a id="function-function-mq3-client-playable-weapon-inventory-resetbaseloadout-function-resetbaseloadout-state-teammode-src-mq3-client-playable-weapon-inventory-ml-1395871973"></a>
### resetBaseLoadout

```ml
function resetBaseLoadout(state, teamMode)
```

Updates `state.ownedBits`, `state.ammo[index]`, `state.ammo[WP_GAUNTLET]`, `state.ammo[WP_GRAPPLING_HOOK]` and additional values during playable weapon inventory `resetBaseLoadout`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon inventory record/storage; this routine assigns `state.ownedBits`, `state.ammo[index]`, `state.ammo[WP_GAUNTLET]`, `state.ammo[WP_GRAPPLING_HOOK]` and additional values. |
| `teamMode` | `dynamic` | — | Value used by `if teamMode then state.ammo[WP_MACHINEGUN]=50 else state.ammo[WP_MACHINEGUN]=100 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L122)

<a id="function-function-mq3-client-playable-weapon-inventory-respawn-function-respawn-state-teammode-src-mq3-client-playable-weapon-inventory-ml-2066500501"></a>
### respawn

```ml
function respawn(state, teamMode)
```

Like ClientSpawn, transient weapons and ammo are reset while persistent spawn bookkeeping survives. The Inventory object and ammo array retain their identity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon inventory record/storage; this routine assigns `state.spawnCount`. |
| `teamMode` | `dynamic` | — | Value used by `return resetBaseLoadout(state,teamMode)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L144)

<a id="function-function-mq3-client-playable-weapon-inventory-select-function-select-state-weapon-src-mq3-client-playable-weapon-inventory-ml-217602331"></a>
### select

```ml
function select(state, weapon)
```

CG_Weapon_f allows direct selection of an owned weapon even when empty.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon inventory record/storage; this routine assigns `state.selectedWeapon`. |
| `weapon` | `dynamic` | — | Value assigned to `state.selectedWeapon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L242)

<a id="function-function-mq3-client-playable-weapon-inventory-selectable-function-selectable-state-weapon-src-mq3-client-playable-weapon-inventory-ml-1108207903"></a>
### selectable

```ml
function selectable(state, weapon)
```

Calls `mq3.client.playable_weapon_inventory.owns` from playable weapon inventory `selectable`. The final path returns `state.ammo[weapon]!=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ammo`. |
| `weapon` | `dynamic` | — | Value used by `if not owns(state,weapon) then return false end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L234)

<a id="function-function-mq3-client-playable-weapon-inventory-selectdigit-function-selectdigit-state-digit-src-mq3-client-playable-weapon-inventory-ml-1977319434"></a>
### selectDigit

```ml
function selectDigit(state, digit)
```

Baseq3's `weapon N` command maps number keys directly to weapon ids. It permits selecting an owned weapon with zero ammo; the next attack produces EV_NOAMMO and invokes the normal fallback selection.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon inventory record/storage; this routine assigns `state.selectedWeapon`. |
| `digit` | `dynamic` | — | Value assigned to `state.selectedWeapon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L254)

<a id="function-function-mq3-client-playable-weapon-inventory-validstate-function-validstate-state-src-mq3-client-playable-weapon-inventory-ml-1032645815"></a>
### validState

```ml
function validState(state)
```

Computes `state!=void and typeof(state.ammo)=="array" and len(state.ammo)>=MAX_WEAPONS` for playable weapon inventory `validState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.ammo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L114)

<a id="function-function-mq3-client-playable-weapon-inventory-validweaponid-function-validweaponid-weapon-src-mq3-client-playable-weapon-inventory-ml-1463094960"></a>
### validWeaponId

```ml
function validWeaponId(weapon)
```

Computes `typeof(weapon)=="int" and weapon>WP_NONE and weapon<MAX_WEAPONS` for playable weapon inventory `validWeaponId`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Value used by `return typeof(weapon)=="int" and weapon>WP_NONE and weapon<MAX_WEAPONS`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L117)

<a id="function-function-mq3-client-playable-weapon-inventory-weapondefinition-function-weapondefinition-value-src-mq3-client-playable-weapon-inventory-ml-813317983"></a>
### weaponDefinition

```ml
function weaponDefinition(value)
```

Calls `stringEqualsIgnoreCaseAscii`, `mq3.client.playable_weapon_inventory.Definition`, `mq3.client.playable_weapon_inventory.definitions` and additional helpers from playable weapon inventory `weaponDefinition`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value==WP_GAUNTLET or (typeof(value)=="string" and (stringEqualsIgnoreCaseAscii(value,"gauntlet") or stringEqualsIgnoreCaseAscii(value,"weapon_gauntlet")))`, `value==def.id or isWeaponName(def,value)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L94)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-bfg-const-wp-bfg-9-src-mq3-client-playable-weapon-inventory-ml-1682689068"></a>
### WP_BFG

```ml
const WP_BFG = 9
```

Native weapon identifier selecting the BFG.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L28)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-gauntlet-const-wp-gauntlet-1-src-mq3-client-playable-weapon-inventory-ml-1787869096"></a>
### WP_GAUNTLET

```ml
const WP_GAUNTLET = 1
```

Native weapon identifier selecting the gauntlet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L12)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-grappling-hook-const-wp-grappling-hook-10-src-mq3-client-playable-weapon-inventory-ml-1930596120"></a>
### WP_GRAPPLING_HOOK

```ml
const WP_GRAPPLING_HOOK = 10
```

Native weapon identifier selecting the grappling hook.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L30)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-client-playable-weapon-inventory-ml-1118437323"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```

Native weapon identifier selecting the grenade launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L18)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-lightning-const-wp-lightning-6-src-mq3-client-playable-weapon-inventory-ml-1365231255"></a>
### WP_LIGHTNING

```ml
const WP_LIGHTNING = 6
```

Native weapon identifier selecting the lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L22)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-machinegun-const-wp-machinegun-2-src-mq3-client-playable-weapon-inventory-ml-1339744777"></a>
### WP_MACHINEGUN

```ml
const WP_MACHINEGUN = 2
```

Native weapon identifier selecting the machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L14)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-none-const-wp-none-0-src-mq3-client-playable-weapon-inventory-ml-2082962511"></a>
### WP_NONE

```ml
const WP_NONE = 0
```

Native weapon identifier selecting no selected weapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L10)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-plasmagun-const-wp-plasmagun-8-src-mq3-client-playable-weapon-inventory-ml-907566501"></a>
### WP_PLASMAGUN

```ml
const WP_PLASMAGUN = 8
```

Native weapon identifier selecting the plasma gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L26)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-railgun-const-wp-railgun-7-src-mq3-client-playable-weapon-inventory-ml-624997540"></a>
### WP_RAILGUN

```ml
const WP_RAILGUN = 7
```

Native weapon identifier selecting the railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L24)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-rocket-launcher-const-wp-rocket-launcher-5-src-mq3-client-playable-weapon-inventory-ml-94196820"></a>
### WP_ROCKET_LAUNCHER

```ml
const WP_ROCKET_LAUNCHER = 5
```

Native weapon identifier selecting the rocket launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L20)

<a id="constant-constant-mq3-client-playable-weapon-inventory-wp-shotgun-const-wp-shotgun-3-src-mq3-client-playable-weapon-inventory-ml-1095946956"></a>
### WP_SHOTGUN

```ml
const WP_SHOTGUN = 3
```

Native weapon identifier selecting the shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_weapon_inventory.ml#L16)
