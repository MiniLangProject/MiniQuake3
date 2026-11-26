# `src/mq3/game/active_portals.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.active_portals`](Package-mq3-game-active-portals-673340604.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/g_items.ml` as `gItems` → [src/mq3/game/g_items.ml](File-src-mq3-game-g-items-ml-1981196396.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/teleport.ml` as `teleport` → [src/mq3/game/teleport.ml](File-src-mq3-game-teleport-ml-594448221.md)

## Declarations

<a id="constant-constant-mq3-game-active-portals-contents-corpse-const-contents-corpse-headers-contents-corpse-src-mq3-game-active-portals-ml-2144683592"></a>
### CONTENTS_CORPSE

```ml
const CONTENTS_CORPSE = headers.CONTENTS_CORPSE
```

Collision-contents bit identifying corpse space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L20)

<a id="constant-constant-mq3-game-active-portals-contents-trigger-const-contents-trigger-headers-contents-trigger-src-mq3-game-active-portals-ml-1927564190"></a>
### CONTENTS_TRIGGER

```ml
const CONTENTS_TRIGGER = headers.CONTENTS_TRIGGER
```

Collision-contents bit identifying trigger space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L22)

<a id="constant-constant-mq3-game-active-portals-damage-no-protection-const-damage-no-protection-8-src-mq3-game-active-portals-ml-1511142321"></a>
### DAMAGE_NO_PROTECTION

```ml
const DAMAGE_NO_PROTECTION = 8
```

Damage-processing flag enabling no protection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L24)

<a id="function-function-mq3-game-active-portals-dropcarriedflag-function-dropcarriedflag-level-other-src-mq3-game-active-portals-ml-882308682"></a>
### dropCarriedFlag

```ml
function dropCarriedFlag(level, other)
```

Set `other.client.ps.powerups[powerup]` to `0` in `mq3.game.active_portals.dropCarriedFlag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `randSeed`. May update `level.randSeed` in place. |
| `other` | `dynamic` | — | Other record; accesses `client`. May update `other.client.ps.powerups[powerup]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L51)

<a id="function-function-mq3-game-active-portals-dropportaldestination-function-dropportaldestination-level-player-src-mq3-game-active-portals-ml-713615113"></a>
### DropPortalDestination

```ml
function DropPortalDestination(level, player)
```

Update `level.spawner.portalSequence`, `player.client.portalID` and `player.client.ps.stats[c.STAT_HOLDABLE_ITEM]` during `DropPortalDestination`. Return paths include `ent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. May update `level.spawner.portalSequence` in place. |
| `player` | `dynamic` | — | Player entity; accesses `s`, `r` and `client`. May update `player.client.portalID` and `player.client.ps.stats[c.STAT_HOLDABLE_ITEM]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L89)

<a id="function-function-mq3-game-active-portals-dropportalsource-function-dropportalsource-level-player-src-mq3-game-active-portals-ml-2088431719"></a>
### DropPortalSource

```ml
function DropPortalSource(level, player)
```

Set `player.client.portalID` to `0` in `mq3.game.active_portals.DropPortalSource`. Return paths include `ent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `player` | `dynamic` | — | Player entity; accesses `s`, `r` and `client`. May update `player.client.portalID` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L105)

<a id="function-function-mq3-game-active-portals-finddestination-function-finddestination-level-id-src-mq3-game-active-portals-ml-435632129"></a>
### findDestination

```ml
function findDestination(level, id)
```

Find the active personal-portal destination with the matching portal identifier.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `id` | `dynamic` | — | Value used by `findDestination` in `if ent.inuse and ent.classname == "hi_portal destination" and ent.count == id then return ent end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L40)

<a id="function-function-mq3-game-active-portals-portaldie-function-portaldie-level-self-inflictor-attacker-damage-mod-src-mq3-game-active-portals-ml-1478101472"></a>
### PortalDie

```ml
function PortalDie(level, self, inflictor, attacker, damage, mod)
```

Forward `PortalDie` to `mq3.game.entities.free` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place. |
| `self` | `dynamic` | — | Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `self.r`, `self.s` and `self.client` and additional fields in place. |
| `inflictor` | `dynamic` | — | Not read by this implementation; retained in the `PortalDie` signature. |
| `attacker` | `dynamic` | — | Not read by this implementation; retained in the `PortalDie` signature. |
| `damage` | `dynamic` | — | Not read by this implementation; retained in the `PortalDie` signature. |
| `mod` | `dynamic` | — | Not read by this implementation; retained in the `PortalDie` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L33)

<a id="function-function-mq3-game-active-portals-portalenable-function-portalenable-level-self-src-mq3-game-active-portals-ml-1533715552"></a>
### PortalEnable

```ml
function PortalEnable(level, self)
```

Update `self.touch`, `self.think` and `self.nextthink` during `PortalEnable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `touch`, `think` and `nextthink`. May update `self.touch`, `self.think` and `self.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L81)

<a id="function-function-mq3-game-active-portals-portaltouch-function-portaltouch-level-self-other-trace-src-mq3-game-active-portals-ml-610022993"></a>
### PortalTouch

```ml
function PortalTouch(level, self, other, trace)
```

Apply `mq3.game.active_portals.dropCarriedFlag`, `mq3.game.active_portals.findDestination` and `mq3.game.teleport.player` while evaluating `PortalTouch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `randSeed`. May update `level.randSeed` in place. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `count`, `pos1` and `s`. |
| `other` | `dynamic` | — | Other record; accesses `health` and `client`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `PortalTouch` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L65)

<a id="function-function-mq3-game-active-portals-use-function-use-level-player-src-mq3-game-active-portals-ml-485060485"></a>
### use

```ml
function use(level, player)
```

Apply `mq3.game.active_portals.DropPortalSource` and `mq3.game.active_portals.DropPortalDestination` while evaluating `use`. Return paths include `DropPortalDestination(level,player)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `player` | `dynamic` | — | Player entity; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L121)
