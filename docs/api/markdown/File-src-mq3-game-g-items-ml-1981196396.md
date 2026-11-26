# `src/mq3/game/g_items.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_items`](Package-mq3-game-g-items-10817948.md)

Reachable from entry: **no**

## Imports

- `mq3/game/items.ml` as `itemCore` → [src/mq3/game/items.ml](File-src-mq3-game-items-ml-152650830.md)
- `mq3/qcommon/cvar.ml` as `cv` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)

## Declarations

<a id="function-function-mq3-game-g-items-add-ammo-function-add-ammo-ent-weapon-count-src-mq3-game-g-items-ml-28222026"></a>
### Add_Ammo

```ml
function Add_Ammo(ent, weapon, count)
```

Forward `Add_Ammo` to `mq3.game.items.addAmmo` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.ps.ammo[weapon]` in place. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L28)

<a id="function-function-mq3-game-g-items-clearregistereditems-function-clearregistereditems-level-src-mq3-game-g-items-ml-522654400"></a>
### ClearRegisteredItems

```ml
function ClearRegisteredItems(level)
```

Forward `ClearRegisteredItems` to `mq3.game.items.clearRegistered` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `itemRegistered` and `spawner`. May update `level.itemRegistered[index]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L86)

<a id="function-function-mq3-game-g-items-drop-item-function-drop-item-level-ent-item-angle-src-mq3-game-g-items-ml-1932210125"></a>
### Drop_Item

```ml
function Drop_Item(level, ent, item, angle)
```

Forward `Drop_Item` to `mq3.game.items.drop` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `randSeed`. May update `level.randSeed` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `item` | `dynamic` | — | Index of the entry to access. |
| `angle` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fadd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L70)

<a id="function-function-mq3-game-g-items-finishspawningitem-function-finishspawningitem-level-ent-src-mq3-game-g-items-ml-1644135103"></a>
### FinishSpawningItem

```ml
function FinishSpawningItem(level, ent)
```

Forward `FinishSpawningItem` to `mq3.game.items.finishSpawning` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `r`, `s`, `touch` and `use` and related fields. May update `ent.r.mins`, `ent.r.maxs` and `ent.s.eType` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L80)

<a id="function-function-mq3-game-g-items-g-bounceitem-function-g-bounceitem-level-ent-trace-src-mq3-game-g-items-ml-696021642"></a>
### G_BounceItem

```ml
function G_BounceItem(level, ent, trace)
```

Forward `G_BounceItem` to `mq3.game.items.bounce` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `previousTime` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `physicsBounce` and `r`. May update `ent.s.pos.trDelta`, `ent.s.pos.trDelta[axis]` and `ent.s.groundEntityNum` and additional fields in place. |
| `trace` | `dynamic` | — | Hit record; accesses `trace`, `endpos` and `entityNum`. May update `trace.endpos[2]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L111)

<a id="function-function-mq3-game-g-items-g-checkteamitems-function-g-checkteamitems-level-src-mq3-game-g-items-ml-970250560"></a>
### G_CheckTeamItems

```ml
function G_CheckTeamItems(level)
```

Forward `G_CheckTeamItems` to `mq3.game.items.checkTeamItems` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `itemRegistered`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L83)

<a id="function-function-mq3-game-g-items-g-itemdisabled-function-g-itemdisabled-level-item-src-mq3-game-g-items-ml-1970085373"></a>
### G_ItemDisabled

```ml
function G_ItemDisabled(level, item)
```

Apply `mq3.game.items.modeItemName` and `mq3.qcommon.cvar.find` while evaluating `G_ItemDisabled`. Return paths include `value.integer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `item` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L97)

<a id="function-function-mq3-game-g-items-g-runitem-function-g-runitem-level-ent-src-mq3-game-g-items-ml-2030139043"></a>
### G_RunItem

```ml
function G_RunItem(level, ent)
```

Forward `G_RunItem` to `mq3.game.items.run` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `physicsObject`, `s`, `clipmask` and `r`. May update `ent.s.pos.trType`, `ent.s.pos.trTime` and `ent.r.currentOrigin` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L115)

<a id="function-function-mq3-game-g-items-g-spawnitem-function-g-spawnitem-level-ent-item-src-mq3-game-g-items-ml-24738774"></a>
### G_SpawnItem

```ml
function G_SpawnItem(level, ent, item)
```

Forward `G_SpawnItem` to `mq3.game.items.spawnItem` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `random`, `wait`, `item`, `nextthink` and `think` and related fields. May update `ent.random`, `ent.wait` and `ent.item` and additional fields in place. |
| `item` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L106)

<a id="function-function-mq3-game-g-items-launchitem-function-launchitem-level-item-origin-velocity-src-mq3-game-g-items-ml-760832178"></a>
### LaunchItem

```ml
function LaunchItem(level, item, origin, velocity)
```

Forward `LaunchItem` to `mq3.game.items.launch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `spawner`. |
| `item` | `dynamic` | — | Index of the entry to access. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `velocity` | `dynamic` | — | Three-component movement velocity. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L64)

<a id="function-function-mq3-game-g-items-pickup-ammo-function-pickup-ammo-level-ent-other-src-mq3-game-g-items-ml-1757469549"></a>
### Pickup_Ammo

```ml
function Pickup_Ammo(level, ent, other)
```

Forward `Pickup_Ammo` to `mq3.game.items.pickupAmmo` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item` and `count`. |
| `other` | `dynamic` | — | Game entity; accesses `client`. May update `other.client.ps.ammo[weapon]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L33)

<a id="function-function-mq3-game-g-items-pickup-armor-function-pickup-armor-level-ent-other-src-mq3-game-g-items-ml-371918767"></a>
### Pickup_Armor

```ml
function Pickup_Armor(level, ent, other)
```

Forward `Pickup_Armor` to `mq3.game.items.pickupArmor` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`. |
| `other` | `dynamic` | — | Other record; accesses `client`. May update `other.client.ps.stats[c.STAT_ARMOR]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L48)

<a id="function-function-mq3-game-g-items-pickup-health-function-pickup-health-level-ent-other-src-mq3-game-g-items-ml-59895297"></a>
### Pickup_Health

```ml
function Pickup_Health(level, ent, other)
```

Forward `Pickup_Health` to `mq3.game.items.pickupHealth` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item` and `count`. |
| `other` | `dynamic` | — | Other record; accesses `client` and `health`. May update `other.health` and `other.client.ps.stats[c.STAT_HEALTH]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L43)

<a id="function-function-mq3-game-g-items-pickup-holdable-function-pickup-holdable-level-ent-other-src-mq3-game-g-items-ml-865316815"></a>
### Pickup_Holdable

```ml
function Pickup_Holdable(level, ent, other)
```

Forward `Pickup_Holdable` to `mq3.game.items.pickupHoldable` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`. |
| `other` | `dynamic` | — | Other record; accesses `client`. May update `other.client.ps.stats[c.STAT_HOLDABLE_ITEM]` and `other.client.ps.eFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L23)

<a id="function-function-mq3-game-g-items-pickup-persistantpowerup-function-pickup-persistantpowerup-level-ent-other-src-mq3-game-g-items-ml-719023159"></a>
### Pickup_PersistantPowerup

```ml
function Pickup_PersistantPowerup(level, ent, other)
```

Forward `Pickup_PersistantPowerup` to `mq3.game.items.pickupPersistantPowerup` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`. |
| `other` | `dynamic` | — | Other record; accesses `client` and `health`. May update `other.client.ps.stats[7]`, `other.client.persistantPowerup` and `other.health` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L18)

<a id="function-function-mq3-game-g-items-pickup-powerup-function-pickup-powerup-level-ent-other-src-mq3-game-g-items-ml-1297142171"></a>
### Pickup_Powerup

```ml
function Pickup_Powerup(level, ent, other)
```

Forward `Pickup_Powerup` to `mq3.game.items.pickupPowerup` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `maxclients`, `clients` and `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `count` and `s`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L13)

<a id="function-function-mq3-game-g-items-pickup-weapon-function-pickup-weapon-level-ent-other-src-mq3-game-g-items-ml-1476403081"></a>
### Pickup_Weapon

```ml
function Pickup_Weapon(level, ent, other)
```

Forward `Pickup_Weapon` to `mq3.game.items.pickupWeapon` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `weaponTeamRespawn` and `weaponRespawn`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `count` and `flags`. |
| `other` | `dynamic` | — | Other record; accesses `client`. May update `other.client.ps.stats[c.STAT_WEAPONS]` and `other.client.ps.ammo[tag]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L38)

<a id="function-function-mq3-game-g-items-registeritem-function-registeritem-level-item-src-mq3-game-g-items-ml-265063149"></a>
### RegisterItem

```ml
function RegisterItem(level, item)
```

Forward `RegisterItem` to `mq3.game.items.register` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `itemRegistered`. May update `level.itemRegistered[item]` in place. |
| `item` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L90)

<a id="function-function-mq3-game-g-items-respawnitem-function-respawnitem-level-ent-src-mq3-game-g-items-ml-975885433"></a>
### RespawnItem

```ml
function RespawnItem(level, ent)
```

Forward `RespawnItem` to `mq3.game.items.respawn` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `team`, `teammaster`, `r` and `s` and related fields. May update `ent.r.contents`, `ent.s.eFlags` and `ent.r.svFlags` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L52)

<a id="function-function-mq3-game-g-items-saveregistereditems-function-saveregistereditems-level-src-mq3-game-g-items-ml-55510706"></a>
### SaveRegisteredItems

```ml
function SaveRegisteredItems(level)
```

Forward `SaveRegisteredItems` to `mq3.game.items.saveRegistered` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `itemRegistered` and `spawner`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L93)

<a id="function-function-mq3-game-g-items-touch-item-function-touch-item-level-ent-other-trace-src-mq3-game-g-items-ml-730417230"></a>
### Touch_Item

```ml
function Touch_Item(level, ent, other, trace)
```

Forward `Touch_Item` to `mq3.game.items.touch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `gameLogFn` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `s`, `speed`, `wait` and `r` and related fields. May update `ent.r.svFlags`, `ent.s.eFlags` and `ent.r.contents` and additional fields in place. |
| `other` | `dynamic` | — | Other record; accesses `client`, `health` and `s`. |
| `trace` | `dynamic` | — | Value passed as argument 4 to `mq3.game.items.touch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L58)

<a id="function-function-mq3-game-g-items-use-item-function-use-item-level-ent-other-activator-src-mq3-game-g-items-ml-958662900"></a>
### Use_Item

```ml
function Use_Item(level, ent, other, activator)
```

Forward `Use_Item` to `mq3.game.items.use` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `item`, `team`, `teammaster`, `r` and `s` and related fields. May update `ent.r.contents`, `ent.s.eFlags` and `ent.r.svFlags` and additional fields in place. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.items.use`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L76)
