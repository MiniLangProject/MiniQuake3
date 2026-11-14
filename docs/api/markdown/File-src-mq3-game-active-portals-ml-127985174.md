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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L19)

<a id="constant-constant-mq3-game-active-portals-contents-trigger-const-contents-trigger-headers-contents-trigger-src-mq3-game-active-portals-ml-1927564190"></a>
### CONTENTS_TRIGGER

```ml
const CONTENTS_TRIGGER = headers.CONTENTS_TRIGGER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L20)

<a id="constant-constant-mq3-game-active-portals-damage-no-protection-const-damage-no-protection-8-src-mq3-game-active-portals-ml-1511142321"></a>
### DAMAGE_NO_PROTECTION

```ml
const DAMAGE_NO_PROTECTION = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L21)

<a id="function-function-mq3-game-active-portals-dropcarriedflag-function-dropcarriedflag-level-other-src-mq3-game-active-portals-ml-882308682"></a>
### dropCarriedFlag

```ml
function dropCarriedFlag(level, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L35)

<a id="function-function-mq3-game-active-portals-dropportaldestination-function-dropportaldestination-level-player-src-mq3-game-active-portals-ml-713615113"></a>
### DropPortalDestination

```ml
function DropPortalDestination(level, player)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `player` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L62)

<a id="function-function-mq3-game-active-portals-dropportalsource-function-dropportalsource-level-player-src-mq3-game-active-portals-ml-2088431719"></a>
### DropPortalSource

```ml
function DropPortalSource(level, player)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `player` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L75)

<a id="function-function-mq3-game-active-portals-finddestination-function-finddestination-level-id-src-mq3-game-active-portals-ml-435632129"></a>
### findDestination

```ml
function findDestination(level, id)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L27)

<a id="function-function-mq3-game-active-portals-portaldie-function-portaldie-level-self-inflictor-attacker-damage-mod-src-mq3-game-active-portals-ml-1478101472"></a>
### PortalDie

```ml
function PortalDie(level, self, inflictor, attacker, damage, mod)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `mod` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L23)

<a id="function-function-mq3-game-active-portals-portalenable-function-portalenable-level-self-src-mq3-game-active-portals-ml-1533715552"></a>
### PortalEnable

```ml
function PortalEnable(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L57)

<a id="function-function-mq3-game-active-portals-portaltouch-function-portaltouch-level-self-other-trace-src-mq3-game-active-portals-ml-610022993"></a>
### PortalTouch

```ml
function PortalTouch(level, self, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L44)

<a id="function-function-mq3-game-active-portals-use-function-use-level-player-src-mq3-game-active-portals-ml-485060485"></a>
### use

```ml
function use(level, player)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `player` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/active_portals.ml#L88)
