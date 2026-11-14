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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L194)

<a id="constant-constant-mq3-client-playable-items-ammo-cap-const-ammo-cap-200-src-mq3-client-playable-items-ml-134725023"></a>
### AMMO_CAP

```ml
const AMMO_CAP = 200
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L14)

<a id="constant-constant-mq3-client-playable-items-armor-cap-const-armor-cap-200-src-mq3-client-playable-items-ml-794753919"></a>
### ARMOR_CAP

```ml
const ARMOR_CAP = 200
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L13)

<a id="function-function-mq3-client-playable-items-cantake-function-cantake-item-stats-src-mq3-client-playable-items-ml-399150444"></a>
### canTake

```ml
function canTake(item, stats)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `item` | `dynamic` | — |  |
| `stats` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L96)

<a id="function-function-mq3-client-playable-items-cantakeinventory-function-cantakeinventory-item-stats-inventory-src-mq3-client-playable-items-ml-2033689450"></a>
### canTakeInventory

```ml
function canTakeInventory(item, stats, inventory)
```

The integrated preview keeps Baseq3's independent ammo pools.  The legacy aggregate path above remains useful to small callers and map probes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `item` | `dynamic` | — |  |
| `stats` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L106)

<a id="constant-constant-mq3-client-playable-items-default-pickup-radius-const-default-pickup-radius-42-src-mq3-client-playable-items-ml-1468375713"></a>
### DEFAULT_PICKUP_RADIUS

```ml
const DEFAULT_PICKUP_RADIUS = 42.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L10)

<a id="function-function-mq3-client-playable-items-definition-function-definition-classname-src-mq3-client-playable-items-ml-1149955667"></a>
### definition

```ml
function definition(classname)
```

[kind, amount, cap, respawn milliseconds, weapon name]. Values follow the Baseq3 item table closely while the preview keeps one combined ammo counter.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L33)

<a id="function-function-mq3-client-playable-items-distancesquared-function-distancesquared-a-b-src-mq3-client-playable-items-ml-156251467"></a>
### distanceSquared

```ml
function distanceSquared(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L121)

<a id="function-function-mq3-client-playable-items-fail-function-fail-message-src-mq3-client-playable-items-ml-1097930527"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L21)

<a id="function-function-mq3-client-playable-items-field-function-field-fields-key-src-mq3-client-playable-items-ml-1212252796"></a>
### field

```ml
function field(fields, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fields` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L23)

<a id="function-function-mq3-client-playable-items-fromentities-function-fromentities-entities-pickupradius-src-mq3-client-playable-items-ml-2106058625"></a>
### fromEntities

```ml
function fromEntities(entities, pickupRadius)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `pickupRadius` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L68)

<a id="constant-constant-mq3-client-playable-items-health-normal-cap-const-health-normal-cap-100-src-mq3-client-playable-items-ml-1151679916"></a>
### HEALTH_NORMAL_CAP

```ml
const HEALTH_NORMAL_CAP = 100
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L11)

<a id="constant-constant-mq3-client-playable-items-health-overmax-cap-const-health-overmax-cap-200-src-mq3-client-playable-items-ml-856994197"></a>
### HEALTH_OVERMAX_CAP

```ml
const HEALTH_OVERMAX_CAP = 200
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L12)

- [mq3.client.playable_items.Item](Type-mq3-client-playable-items-item-1445328517.md) — struct
<a id="function-function-mq3-client-playable-items-load-function-load-map-src-mq3-client-playable-items-ml-1175186094"></a>
### load

```ml
function load(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L81)

- [mq3.client.playable_items.Pickup](Type-mq3-client-playable-items-pickup-1925681042.md) — struct
<a id="function-function-mq3-client-playable-items-setstats-function-setstats-state-health-armor-ammo-weapon-src-mq3-client-playable-items-ml-1043651740"></a>
### setStats

```ml
function setStats(state, health, armor, ammo, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `health` | `dynamic` | — |  |
| `armor` | `dynamic` | — |  |
| `ammo` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L86)

- [mq3.client.playable_items.State](Type-mq3-client-playable-items-state-1444940859.md) — struct
- [mq3.client.playable_items.Stats](Type-mq3-client-playable-items-stats-1277164669.md) — struct
<a id="function-function-mq3-client-playable-items-take-function-take-state-index-now-src-mq3-client-playable-items-ml-693113725"></a>
### take

```ml
function take(state, index, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L126)

<a id="function-function-mq3-client-playable-items-takeinventory-function-takeinventory-state-index-now-inventory-teammode-src-mq3-client-playable-items-ml-918499855"></a>
### takeInventory

```ml
function takeInventory(state, index, now, inventory, teamMode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |
| `teamMode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L152)

<a id="function-function-mq3-client-playable-items-update-function-update-state-playerposition-now-src-mq3-client-playable-items-ml-88296977"></a>
### update

```ml
function update(state, playerPosition, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `playerPosition` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L138)

<a id="function-function-mq3-client-playable-items-updateinventory-function-updateinventory-state-playerposition-now-inventory-teammode-src-mq3-client-playable-items-ml-1247885667"></a>
### updateInventory

```ml
function updateInventory(state, playerPosition, now, inventory, teamMode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `playerPosition` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |
| `teamMode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_items.ml#L179)
