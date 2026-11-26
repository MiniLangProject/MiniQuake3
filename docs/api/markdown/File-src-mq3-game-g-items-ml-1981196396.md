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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L12)

<a id="function-function-mq3-game-g-items-clearregistereditems-function-clearregistereditems-level-src-mq3-game-g-items-ml-522654400"></a>
### ClearRegisteredItems

```ml
function ClearRegisteredItems(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L24)

<a id="function-function-mq3-game-g-items-drop-item-function-drop-item-level-ent-item-angle-src-mq3-game-g-items-ml-1932210125"></a>
### Drop_Item

```ml
function Drop_Item(level, ent, item, angle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |
| `angle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L20)

<a id="function-function-mq3-game-g-items-finishspawningitem-function-finishspawningitem-level-ent-src-mq3-game-g-items-ml-1644135103"></a>
### FinishSpawningItem

```ml
function FinishSpawningItem(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L22)

<a id="function-function-mq3-game-g-items-g-bounceitem-function-g-bounceitem-level-ent-trace-src-mq3-game-g-items-ml-696021642"></a>
### G_BounceItem

```ml
function G_BounceItem(level, ent, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L33)

<a id="function-function-mq3-game-g-items-g-checkteamitems-function-g-checkteamitems-level-src-mq3-game-g-items-ml-970250560"></a>
### G_CheckTeamItems

```ml
function G_CheckTeamItems(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L23)

<a id="function-function-mq3-game-g-items-g-itemdisabled-function-g-itemdisabled-level-item-src-mq3-game-g-items-ml-1970085373"></a>
### G_ItemDisabled

```ml
function G_ItemDisabled(level, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L27)

<a id="function-function-mq3-game-g-items-g-runitem-function-g-runitem-level-ent-src-mq3-game-g-items-ml-2030139043"></a>
### G_RunItem

```ml
function G_RunItem(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L34)

<a id="function-function-mq3-game-g-items-g-spawnitem-function-g-spawnitem-level-ent-item-src-mq3-game-g-items-ml-24738774"></a>
### G_SpawnItem

```ml
function G_SpawnItem(level, ent, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L32)

<a id="function-function-mq3-game-g-items-launchitem-function-launchitem-level-item-origin-velocity-src-mq3-game-g-items-ml-760832178"></a>
### LaunchItem

```ml
function LaunchItem(level, item, origin, velocity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L19)

<a id="function-function-mq3-game-g-items-pickup-ammo-function-pickup-ammo-level-ent-other-src-mq3-game-g-items-ml-1757469549"></a>
### Pickup_Ammo

```ml
function Pickup_Ammo(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L13)

<a id="function-function-mq3-game-g-items-pickup-armor-function-pickup-armor-level-ent-other-src-mq3-game-g-items-ml-371918767"></a>
### Pickup_Armor

```ml
function Pickup_Armor(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L16)

<a id="function-function-mq3-game-g-items-pickup-health-function-pickup-health-level-ent-other-src-mq3-game-g-items-ml-59895297"></a>
### Pickup_Health

```ml
function Pickup_Health(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L15)

<a id="function-function-mq3-game-g-items-pickup-holdable-function-pickup-holdable-level-ent-other-src-mq3-game-g-items-ml-865316815"></a>
### Pickup_Holdable

```ml
function Pickup_Holdable(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L11)

<a id="function-function-mq3-game-g-items-pickup-persistantpowerup-function-pickup-persistantpowerup-level-ent-other-src-mq3-game-g-items-ml-719023159"></a>
### Pickup_PersistantPowerup

```ml
function Pickup_PersistantPowerup(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L10)

<a id="function-function-mq3-game-g-items-pickup-powerup-function-pickup-powerup-level-ent-other-src-mq3-game-g-items-ml-1297142171"></a>
### Pickup_Powerup

```ml
function Pickup_Powerup(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L9)

<a id="function-function-mq3-game-g-items-pickup-weapon-function-pickup-weapon-level-ent-other-src-mq3-game-g-items-ml-1476403081"></a>
### Pickup_Weapon

```ml
function Pickup_Weapon(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L14)

<a id="function-function-mq3-game-g-items-registeritem-function-registeritem-level-item-src-mq3-game-g-items-ml-265063149"></a>
### RegisterItem

```ml
function RegisterItem(level, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L25)

<a id="function-function-mq3-game-g-items-respawnitem-function-respawnitem-level-ent-src-mq3-game-g-items-ml-975885433"></a>
### RespawnItem

```ml
function RespawnItem(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L17)

<a id="function-function-mq3-game-g-items-saveregistereditems-function-saveregistereditems-level-src-mq3-game-g-items-ml-55510706"></a>
### SaveRegisteredItems

```ml
function SaveRegisteredItems(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L26)

<a id="function-function-mq3-game-g-items-touch-item-function-touch-item-level-ent-other-trace-src-mq3-game-g-items-ml-730417230"></a>
### Touch_Item

```ml
function Touch_Item(level, ent, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L18)

<a id="function-function-mq3-game-g-items-use-item-function-use-item-level-ent-other-activator-src-mq3-game-g-items-ml-958662900"></a>
### Use_Item

```ml
function Use_Item(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_items.ml#L21)
