# `src/mq3/client/playable_items.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_items`](Package-mq3-client-playable-items-610725452.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_weapon_inventory.ml` as `weaponInventory` → [src/mq3/client/playable_weapon_inventory.ml](File-src-mq3-client-playable-weapon-inventory-ml-1741297641.md)
- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/format/bsp.ml` as `bsp` → [src/mq3/format/bsp.ml](File-src-mq3-format-bsp-ml-526613882.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-playable-items-activecount-function-activecount-state-src-mq3-client-playable-items-ml-109263703"></a>
### activeCount

```ml
function activeCount(state)
```

Evaluates playable items `activeCount` and returns `0`, `count` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.items`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L246)

<a id="constant-constant-mq3-client-playable-items-ammo-cap-const-ammo-cap-200-src-mq3-client-playable-items-ml-134725023"></a>
### AMMO_CAP

```ml
const AMMO_CAP = 200
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L14)

<a id="constant-constant-mq3-client-playable-items-armor-cap-const-armor-cap-200-src-mq3-client-playable-items-ml-794753919"></a>
### ARMOR_CAP

```ml
const ARMOR_CAP = 200
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L13)

<a id="function-function-mq3-client-playable-items-cantake-function-cantake-item-stats-src-mq3-client-playable-items-ml-399150444"></a>
### canTake

```ml
function canTake(item, stats)
```

Evaluates playable items `canTake` and returns `stats.health<item.cap`, `stats.armor<item.cap`, `stats.ammo<item.cap` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `item` | `dynamic` | — | Record read through `item.kind`, `item.cap`, `item.weapon`. |
| `stats` | `dynamic` | — | Record read through `stats.health`, `stats.armor`, `stats.ammo`, `stats.weapon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L120)

<a id="function-function-mq3-client-playable-items-cantakeinventory-function-cantakeinventory-item-stats-inventory-src-mq3-client-playable-items-ml-2033689450"></a>
### canTakeInventory

```ml
function canTakeInventory(item, stats, inventory)
```

The integrated preview keeps Baseq3's independent ammo pools.  The legacy aggregate path above remains useful to small callers and map probes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `item` | `dynamic` | — | Record read through `item.kind`, `item.classname`. |
| `stats` | `dynamic` | — | Value used by `if item.kind=="health" or item.kind=="armor" then return canTake(item,stats) end if`. |
| `inventory` | `dynamic` | — | Value used by `amount=weaponInventory.ammoFor(inventory,def.id)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L133)

<a id="constant-constant-mq3-client-playable-items-default-pickup-radius-const-default-pickup-radius-42-src-mq3-client-playable-items-ml-243410395"></a>
### DEFAULT_PICKUP_RADIUS

```ml
const DEFAULT_PICKUP_RADIUS = 42
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L10)

<a id="function-function-mq3-client-playable-items-definition-function-definition-classname-src-mq3-client-playable-items-ml-1149955667"></a>
### definition

```ml
function definition(classname)
```

[kind, amount, cap, respawn milliseconds, weapon name]. Values follow the Baseq3 item table closely while the preview keeps one combined ammo counter.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `name=strings.toLowerAscii(classname)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L43)

<a id="function-function-mq3-client-playable-items-distancesquared-function-distancesquared-a-b-src-mq3-client-playable-items-ml-156251467"></a>
### distanceSquared

```ml
function distanceSquared(a, b)
```

Evaluates playable items `distanceSquared` and returns `x*x+y*y+z*z` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Sequence read at `a[0]`, `a[1]`, `a[2]`. |
| `b` | `dynamic` | — | Sequence read at `b[0]`, `b[1]`, `b[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L151)

<a id="function-function-mq3-client-playable-items-fail-function-fail-message-src-mq3-client-playable-items-ml-1097930527"></a>
### fail

```ml
function fail(message)
```

Creates the playable items error `7501` with diagnostic text `"preview items: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview items: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L27)

<a id="function-function-mq3-client-playable-items-field-function-field-fields-key-src-mq3-client-playable-items-ml-1212252796"></a>
### field

```ml
function field(fields, key)
```

Calls `std.string.toLowerAscii` from playable items `field`. The final path returns `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fields` | `dynamic` | — | Value used by `for each pair in fields`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding playable items entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L32)

<a id="function-function-mq3-client-playable-items-fromentities-function-fromentities-entities-pickupradius-src-mq3-client-playable-items-ml-2106058625"></a>
### fromEntities

```ml
function fromEntities(entities, pickupRadius)
```

Calls `mq3.client.playable_items.field`, `mq3.client.playable_items.definition`, `mq3.compat.textnumbers.vector` and additional helpers from playable items `fromEntities`. The final path returns `State(items,Stats(100,0,50,"weapon_machinegun"),pickupRadius,0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Value used by `if entities==void or pickupRadius<=0.0 then return fail("entities and a positive pickup radius are required") end if`. |
| `pickupRadius` | `dynamic` | — | Value used by `if entities==void or pickupRadius<=0.0 then return fail("entities and a positive pickup radius are required") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L81)

<a id="constant-constant-mq3-client-playable-items-health-normal-cap-const-health-normal-cap-100-src-mq3-client-playable-items-ml-1151679916"></a>
### HEALTH_NORMAL_CAP

```ml
const HEALTH_NORMAL_CAP = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L11)

<a id="constant-constant-mq3-client-playable-items-health-overmax-cap-const-health-overmax-cap-200-src-mq3-client-playable-items-ml-856994197"></a>
### HEALTH_OVERMAX_CAP

```ml
const HEALTH_OVERMAX_CAP = 200
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L12)

- [mq3.client.playable_items.Item](Type-mq3-client-playable-items-item-1445328517.md) — struct
<a id="function-function-mq3-client-playable-items-load-function-load-map-src-mq3-client-playable-items-ml-1175186094"></a>
### load

```ml
function load(map)
```

Calls `mq3.format.bsp.entities`, `mq3.client.playable_items.fromEntities` from playable items `load`. The final path returns `fromEntities(entities,DEFAULT_PICKUP_RADIUS)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | map record passed to the playable items helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L96)

- [mq3.client.playable_items.Pickup](Type-mq3-client-playable-items-pickup-1925681042.md) — struct
<a id="function-function-mq3-client-playable-items-setstats-function-setstats-state-health-armor-ammo-weapon-src-mq3-client-playable-items-ml-1043651740"></a>
### setStats

```ml
function setStats(state, health, armor, ammo, weapon)
```

Updates `state.stats.health`, `state.stats.armor`, `state.stats.ammo`, `state.stats.weapon` during playable items `setStats`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable items record/storage; this routine assigns `state.stats.health`, `state.stats.armor`, `state.stats.ammo`, `state.stats.weapon`. |
| `health` | `dynamic` | — | Value assigned to `state.stats.health`. |
| `armor` | `dynamic` | — | Value assigned to `state.stats.armor`. |
| `ammo` | `dynamic` | — | Value assigned to `state.stats.ammo`. |
| `weapon` | `dynamic` | — | Value assigned to `state.stats.weapon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L107)

- [mq3.client.playable_items.State](Type-mq3-client-playable-items-state-1444940859.md) — struct
- [mq3.client.playable_items.Stats](Type-mq3-client-playable-items-stats-1277164669.md) — struct
<a id="function-function-mq3-client-playable-items-take-function-take-state-index-now-src-mq3-client-playable-items-ml-693113725"></a>
### take

```ml
function take(state, index, now)
```

Calls `mq3.client.playable_items.Pickup` from playable items `take`. The final path returns `Pickup(index,item.classname,item.kind,after-before,before,after,stats.weapon)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.items`, `state.stats`. |
| `index` | `dynamic` | — | Value used by `item=state.items[index]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L160)

<a id="function-function-mq3-client-playable-items-takeinventory-function-takeinventory-state-index-now-inventory-teammode-src-mq3-client-playable-items-ml-918499855"></a>
### takeInventory

```ml
function takeInventory(state, index, now, inventory, teamMode)
```

Updates `state.stats.ammo`, `state.stats.weapon` during playable items `takeInventory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable items record/storage; this routine assigns `state.stats.ammo`, `state.stats.weapon`. |
| `index` | `dynamic` | — | Value used by `item=state.items[index]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `inventory` | `dynamic` | — | Record read through `inventory.selectedWeapon`. |
| `teamMode` | `dynamic` | — | Value used by `granted=weaponInventory.pickupWeapon(inventory,item.classname,0,false,teamMode) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L196)

<a id="function-function-mq3-client-playable-items-update-function-update-state-playerposition-now-src-mq3-client-playable-items-ml-88296977"></a>
### update

```ml
function update(state, playerPosition, now)
```

Updates `state.lastTime` during playable items `update`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable items record/storage; this routine assigns `state.lastTime`. |
| `playerPosition` | `dynamic` | — | Sequence whose length/content is inspected by `update`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L176)

<a id="function-function-mq3-client-playable-items-updateinventory-function-updateinventory-state-playerposition-now-inventory-teammode-src-mq3-client-playable-items-ml-1247885667"></a>
### updateInventory

```ml
function updateInventory(state, playerPosition, now, inventory, teamMode)
```

Updates `state.lastTime` during playable items `updateInventory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable items record/storage; this routine assigns `state.lastTime`. |
| `playerPosition` | `dynamic` | — | Sequence whose length/content is inspected by `updateInventory`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `inventory` | `dynamic` | — | Value used by `if state==void or playerPosition==void or len(playerPosition)!=3 or inventory==void then return fail("state, inventory and three-axis player p...`. |
| `teamMode` | `dynamic` | — | Value used by `picked=takeInventory(state,index,now,inventory,teamMode)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_items.ml#L229)
