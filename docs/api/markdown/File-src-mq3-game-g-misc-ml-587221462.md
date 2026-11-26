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

Forward `DropPortalDestination` to `mq3.game.active_portals.DropPortalDestination` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. May update `level.spawner.portalSequence` in place. |
| `player` | `dynamic` | — | Player entity; accesses `s`, `r` and `client`. May update `player.client.portalID` and `player.client.ps.stats[c.STAT_HOLDABLE_ITEM]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L121)

<a id="function-function-mq3-game-g-misc-dropportalsource-function-dropportalsource-level-player-src-mq3-game-g-misc-ml-143565687"></a>
### DropPortalSource

```ml
function DropPortalSource(level, player)
```

Forward `DropPortalSource` to `mq3.game.active_portals.DropPortalSource` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `player` | `dynamic` | — | Player entity; accesses `s`, `r` and `client`. May update `player.client.portalID` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L125)

<a id="function-function-mq3-game-g-misc-initshooter-function-initshooter-level-ent-weapon-src-mq3-game-g-misc-ml-262737391"></a>
### InitShooter

```ml
function InitShooter(level, ent, weapon)
```

Update `ent.use`, `ent.s.weapon`, `ent.movedir` and `ent.s.angles` and related state during `InitShooter`. Return paths include `game.link(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `use`, `s`, `movedir`, `random` and `target` and related fields. May update `ent.use`, `ent.s.weapon` and `ent.movedir` and additional fields in place. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L76)

<a id="function-function-mq3-game-g-misc-initshooter-finish-function-initshooter-finish-level-ent-src-mq3-game-g-misc-ml-1157559027"></a>
### InitShooter_Finish

```ml
function InitShooter_Finish(level, ent)
```

Forward `InitShooter_Finish` to `mq3.game.shooters.finish` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `enemy`, `target`, `think` and `nextthink`. May update `ent.enemy`, `ent.think` and `ent.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L71)

<a id="function-function-mq3-game-g-misc-locatecamera-function-locatecamera-level-ent-src-mq3-game-g-misc-ml-1259599395"></a>
### locateCamera

```ml
function locateCamera(level, ent)
```

Forward `locateCamera` to `mq3.game.portals.locateCamera` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `target`, `r` and `s`. May update `ent.r.ownerNum`, `ent.s.frame` and `ent.s.powerups` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L52)

<a id="function-function-mq3-game-g-misc-portaldie-function-portaldie-level-self-inflictor-attacker-damage-mod-src-mq3-game-g-misc-ml-935123164"></a>
### PortalDie

```ml
function PortalDie(level, self, inflictor, attacker, damage, mod)
```

Forward `PortalDie` to `mq3.game.active_portals.PortalDie` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place. |
| `self` | `dynamic` | — | Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `self.r`, `self.s` and `self.client` and additional fields in place. |
| `inflictor` | `dynamic` | — | Entity directly delivering the damage. |
| `attacker` | `dynamic` | — | Entity credited with the attack. |
| `damage` | `dynamic` | — | Damage amount before the current operation applies its rules. |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L105)

<a id="function-function-mq3-game-g-misc-portalenable-function-portalenable-level-self-src-mq3-game-g-misc-ml-882320964"></a>
### PortalEnable

```ml
function PortalEnable(level, self)
```

Forward `PortalEnable` to `mq3.game.active_portals.PortalEnable` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `touch`, `think` and `nextthink`. May update `self.touch`, `self.think` and `self.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L115)

<a id="function-function-mq3-game-g-misc-portaltouch-function-portaltouch-level-self-other-trace-src-mq3-game-g-misc-ml-179340073"></a>
### PortalTouch

```ml
function PortalTouch(level, self, other, trace)
```

Forward `PortalTouch` to `mq3.game.active_portals.PortalTouch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `randSeed`. May update `level.randSeed` in place. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `count`, `pos1` and `s`. |
| `other` | `dynamic` | — | Other record; accesses `health` and `client`. |
| `trace` | `dynamic` | — | Value passed as argument 4 to `mq3.game.active_portals.PortalTouch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L111)

<a id="function-function-mq3-game-g-misc-sp-info-camp-function-sp-info-camp-level-self-src-mq3-game-g-misc-ml-1799089132"></a>
### SP_info_camp

```ml
function SP_info_camp(level, self)
```

Forward `SP_info_camp` to `mq3.game.entities.setOrigin` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `SP_info_camp` signature. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L27)

<a id="function-function-mq3-game-g-misc-sp-info-notnull-function-sp-info-notnull-level-self-src-mq3-game-g-misc-ml-1807520362"></a>
### SP_info_notnull

```ml
function SP_info_notnull(level, self)
```

Forward `SP_info_notnull` to `mq3.game.entities.setOrigin` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `SP_info_notnull` signature. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L35)

<a id="function-function-mq3-game-g-misc-sp-info-null-function-sp-info-null-level-self-src-mq3-game-g-misc-ml-1104674348"></a>
### SP_info_null

```ml
function SP_info_null(level, self)
```

Forward `SP_info_null` to `mq3.game.entities.free` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place. |
| `self` | `dynamic` | — | Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `self.r`, `self.s` and `self.client` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L31)

<a id="function-function-mq3-game-g-misc-sp-light-function-sp-light-level-self-src-mq3-game-g-misc-ml-348666276"></a>
### SP_light

```ml
function SP_light(level, self)
```

Forward `SP_light` to `mq3.game.entities.free` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place. |
| `self` | `dynamic` | — | Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `self.r`, `self.s` and `self.client` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L39)

<a id="function-function-mq3-game-g-misc-sp-misc-model-function-sp-misc-model-level-ent-src-mq3-game-g-misc-ml-1626153467"></a>
### SP_misc_model

```ml
function SP_misc_model(level, ent)
```

Forward `SP_misc_model` to `mq3.game.entities.free` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `ent.r`, `ent.s` and `ent.client` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L47)

<a id="function-function-mq3-game-g-misc-sp-misc-portal-camera-function-sp-misc-portal-camera-level-ent-src-mq3-game-g-misc-ml-1109399809"></a>
### SP_misc_portal_camera

```ml
function SP_misc_portal_camera(level, ent)
```

Forward `SP_misc_portal_camera` to `mq3.game.portals.camera` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `r` and `s`. May update `ent.r.mins[axis]`, `ent.r.maxs[axis]` and `ent.s.clientNum` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L60)

<a id="function-function-mq3-game-g-misc-sp-misc-portal-surface-function-sp-misc-portal-surface-level-ent-src-mq3-game-g-misc-ml-364312011"></a>
### SP_misc_portal_surface

```ml
function SP_misc_portal_surface(level, ent)
```

Forward `SP_misc_portal_surface` to `mq3.game.portals.surface` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`, `s`, `target`, `think` and `nextthink`. May update `ent.r.mins[axis]`, `ent.r.maxs[axis]` and `ent.r.svFlags` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L56)

<a id="function-function-mq3-game-g-misc-sp-misc-teleporter-dest-function-sp-misc-teleporter-dest-level-ent-src-mq3-game-g-misc-ml-584507579"></a>
### SP_misc_teleporter_dest

```ml
function SP_misc_teleporter_dest(level, ent)
```

Return `void` for `SP_misc_teleporter_dest`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `SP_misc_teleporter_dest` signature. |
| `ent` | `dynamic` | — | Not read by this implementation; retained in the `SP_misc_teleporter_dest` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L43)

<a id="function-function-mq3-game-g-misc-sp-shooter-grenade-function-sp-shooter-grenade-level-ent-src-mq3-game-g-misc-ml-1562060383"></a>
### SP_shooter_grenade

```ml
function SP_shooter_grenade(level, ent)
```

Forward `SP_shooter_grenade` to `mq3.game.g_misc.InitShooter` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `use`, `s`, `movedir`, `random` and `target` and related fields. May update `ent.use`, `ent.s.weapon` and `ent.movedir` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L96)

<a id="function-function-mq3-game-g-misc-sp-shooter-plasma-function-sp-shooter-plasma-level-ent-src-mq3-game-g-misc-ml-831234849"></a>
### SP_shooter_plasma

```ml
function SP_shooter_plasma(level, ent)
```

Forward `SP_shooter_plasma` to `mq3.game.g_misc.InitShooter` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `use`, `s`, `movedir`, `random` and `target` and related fields. May update `ent.use`, `ent.s.weapon` and `ent.movedir` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L92)

<a id="function-function-mq3-game-g-misc-sp-shooter-rocket-function-sp-shooter-rocket-level-ent-src-mq3-game-g-misc-ml-440994653"></a>
### SP_shooter_rocket

```ml
function SP_shooter_rocket(level, ent)
```

Forward `SP_shooter_rocket` to `mq3.game.g_misc.InitShooter` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `use`, `s`, `movedir`, `random` and `target` and related fields. May update `ent.use`, `ent.s.weapon` and `ent.movedir` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L88)

<a id="function-function-mq3-game-g-misc-teleportplayer-function-teleportplayer-level-player-origin-angles-src-mq3-game-g-misc-ml-1029969885"></a>
### TeleportPlayer

```ml
function TeleportPlayer(level, player, origin, angles)
```

Forward `TeleportPlayer` to `mq3.game.teleport.player` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `player` | `dynamic` | — | Game entity; accesses `client`, `s` and `r`. May update `player.r.currentOrigin` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L22)

<a id="function-function-mq3-game-g-misc-use-shooter-function-use-shooter-level-ent-other-activator-src-mq3-game-g-misc-ml-1234446942"></a>
### Use_Shooter

```ml
function Use_Shooter(level, ent, other, activator)
```

Forward `Use_Shooter` to `mq3.game.shooters.use` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `randSeed`. May update `level.randSeed` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `enemy`, `s`, `movedir` and `random`. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.shooters.use`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L67)

<a id="function-function-mq3-game-g-misc-useportalholdable-function-useportalholdable-level-player-src-mq3-game-g-misc-ml-537346467"></a>
### UsePortalHoldable

```ml
function UsePortalHoldable(level, player)
```

Apply `mq3.game.g_misc.DropPortalSource` and `mq3.game.g_misc.DropPortalDestination` while evaluating `UsePortalHoldable`. Return paths include `DropPortalDestination(level,player)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `player` | `dynamic` | — | Player entity; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L129)

<a id="function-function-mq3-game-g-misc-utilities-function-utilities-level-ent-src-mq3-game-g-misc-ml-642879279"></a>
### utilities

```ml
function utilities(level, ent)
```

`utilities` is a false-positive candidate produced by the historical inventory parser from the "calculations in the utilities" comment.  Keep a named, side-effect-free compatibility entry so the pinned 20-name ledger is exhaustively represented without inventing a Quake entity behavior.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `utilities` signature. |
| `ent` | `dynamic` | — | Not read by this implementation; retained in the `utilities` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_misc.ml#L140)
