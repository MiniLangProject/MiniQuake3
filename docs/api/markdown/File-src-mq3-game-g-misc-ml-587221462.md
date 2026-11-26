# `src/mq3/game/g_misc.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_misc`](Package-mq3-game-g-misc-1064958448.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/game/active_portals.ml` as `activePortals` → [src/mq3/game/active_portals.ml](File-src-mq3-game-active-portals-ml-127985174.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/portals.ml` as `portals` → [src/mq3/game/portals.ml](File-src-mq3-game-portals-ml-1828127247.md)
- `mq3/game/shooters.ml` as `shooters` → [src/mq3/game/shooters.ml](File-src-mq3-game-shooters-ml-1959498419.md)
- `mq3/game/teleport.ml` as `teleport` → [src/mq3/game/teleport.ml](File-src-mq3-game-teleport-ml-594448221.md)
- `mq3/shared/directions.ml` as `directions` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)

## Declarations

<a id="function-function-mq3-game-g-misc-dropportaldestination-function-dropportaldestination-level-player-src-mq3-game-g-misc-ml-649139361"></a>
### DropPortalDestination

```ml
function DropPortalDestination(level, player)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `player` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L50)

<a id="function-function-mq3-game-g-misc-dropportalsource-function-dropportalsource-level-player-src-mq3-game-g-misc-ml-143565687"></a>
### DropPortalSource

```ml
function DropPortalSource(level, player)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `player` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L51)

<a id="function-function-mq3-game-g-misc-initshooter-function-initshooter-level-ent-weapon-src-mq3-game-g-misc-ml-262737391"></a>
### InitShooter

```ml
function InitShooter(level, ent, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L32)

<a id="function-function-mq3-game-g-misc-initshooter-finish-function-initshooter-finish-level-ent-src-mq3-game-g-misc-ml-1157559027"></a>
### InitShooter_Finish

```ml
function InitShooter_Finish(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L31)

<a id="function-function-mq3-game-g-misc-locatecamera-function-locatecamera-level-ent-src-mq3-game-g-misc-ml-1259599395"></a>
### locateCamera

```ml
function locateCamera(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L26)

<a id="function-function-mq3-game-g-misc-portaldie-function-portaldie-level-self-inflictor-attacker-damage-mod-src-mq3-game-g-misc-ml-935123164"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L45)

<a id="function-function-mq3-game-g-misc-portalenable-function-portalenable-level-self-src-mq3-game-g-misc-ml-882320964"></a>
### PortalEnable

```ml
function PortalEnable(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L47)

<a id="function-function-mq3-game-g-misc-portaltouch-function-portaltouch-level-self-other-trace-src-mq3-game-g-misc-ml-179340073"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L46)

<a id="function-function-mq3-game-g-misc-sp-info-camp-function-sp-info-camp-level-self-src-mq3-game-g-misc-ml-1799089132"></a>
### SP_info_camp

```ml
function SP_info_camp(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L19)

<a id="function-function-mq3-game-g-misc-sp-info-notnull-function-sp-info-notnull-level-self-src-mq3-game-g-misc-ml-1807520362"></a>
### SP_info_notnull

```ml
function SP_info_notnull(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L21)

<a id="function-function-mq3-game-g-misc-sp-info-null-function-sp-info-null-level-self-src-mq3-game-g-misc-ml-1104674348"></a>
### SP_info_null

```ml
function SP_info_null(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L20)

<a id="function-function-mq3-game-g-misc-sp-light-function-sp-light-level-self-src-mq3-game-g-misc-ml-348666276"></a>
### SP_light

```ml
function SP_light(level, self)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `self` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L22)

<a id="function-function-mq3-game-g-misc-sp-misc-model-function-sp-misc-model-level-ent-src-mq3-game-g-misc-ml-1626153467"></a>
### SP_misc_model

```ml
function SP_misc_model(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L24)

<a id="function-function-mq3-game-g-misc-sp-misc-portal-camera-function-sp-misc-portal-camera-level-ent-src-mq3-game-g-misc-ml-1109399809"></a>
### SP_misc_portal_camera

```ml
function SP_misc_portal_camera(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L28)

<a id="function-function-mq3-game-g-misc-sp-misc-portal-surface-function-sp-misc-portal-surface-level-ent-src-mq3-game-g-misc-ml-364312011"></a>
### SP_misc_portal_surface

```ml
function SP_misc_portal_surface(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L27)

<a id="function-function-mq3-game-g-misc-sp-misc-teleporter-dest-function-sp-misc-teleporter-dest-level-ent-src-mq3-game-g-misc-ml-584507579"></a>
### SP_misc_teleporter_dest

```ml
function SP_misc_teleporter_dest(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L23)

<a id="function-function-mq3-game-g-misc-sp-shooter-grenade-function-sp-shooter-grenade-level-ent-src-mq3-game-g-misc-ml-1562060383"></a>
### SP_shooter_grenade

```ml
function SP_shooter_grenade(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L43)

<a id="function-function-mq3-game-g-misc-sp-shooter-plasma-function-sp-shooter-plasma-level-ent-src-mq3-game-g-misc-ml-831234849"></a>
### SP_shooter_plasma

```ml
function SP_shooter_plasma(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L42)

<a id="function-function-mq3-game-g-misc-sp-shooter-rocket-function-sp-shooter-rocket-level-ent-src-mq3-game-g-misc-ml-440994653"></a>
### SP_shooter_rocket

```ml
function SP_shooter_rocket(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L41)

<a id="function-function-mq3-game-g-misc-teleportplayer-function-teleportplayer-level-player-origin-angles-src-mq3-game-g-misc-ml-1029969885"></a>
### TeleportPlayer

```ml
function TeleportPlayer(level, player, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `player` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L17)

<a id="function-function-mq3-game-g-misc-use-shooter-function-use-shooter-level-ent-other-activator-src-mq3-game-g-misc-ml-1234446942"></a>
### Use_Shooter

```ml
function Use_Shooter(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L30)

<a id="function-function-mq3-game-g-misc-useportalholdable-function-useportalholdable-level-player-src-mq3-game-g-misc-ml-537346467"></a>
### UsePortalHoldable

```ml
function UsePortalHoldable(level, player)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `player` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L52)

<a id="function-function-mq3-game-g-misc-utilities-function-utilities-level-ent-src-mq3-game-g-misc-ml-642879279"></a>
### utilities

```ml
function utilities(level, ent)
```

`utilities` is a false-positive candidate produced by the historical inventory parser from the "calculations in the utilities" comment.  Keep a named, side-effect-free compatibility entry so the pinned 20-name ledger is exhaustively represented without inventing a Quake entity behavior.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_misc.ml#L61)
