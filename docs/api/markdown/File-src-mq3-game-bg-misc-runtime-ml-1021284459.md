# `src/mq3/game/bg_misc_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bg_misc_runtime`](Package-mq3-game-bg-misc-runtime-1355233229.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/items.ml` as `items` → [src/mq3/game/items.ml](File-src-mq3-game-items-ml-152650830.md)
- `mq3/game/jumppad.ml` as `jumppad` → [src/mq3/game/jumppad.ml](File-src-mq3-game-jumppad-ml-1270203041.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/spawn_tables.ml` as `tables` → [src/mq3/game/spawn_tables.ml](File-src-mq3-game-spawn-tables-ml-2143892395.md)
- `mq3/game/trajectory.ml` as `trajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-bg-misc-runtime-bg-addpredictableeventtoplayerstate-function-bg-addpredictableeventtoplayerstate-event-parm-ps-src-mq3-game-bg-misc-runtime-ml-516600615"></a>
### BG_AddPredictableEventToPlayerstate

```ml
function BG_AddPredictableEventToPlayerstate(event, parm, ps)
```

Update `ps.events[slot]`, `ps.eventParms[slot]` and `ps.eventSequence` during `BG_AddPredictableEventToPlayerstate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `event` | `dynamic` | — | Player or entity event identifier. |
| `parm` | `dynamic` | — | Integer parameter stored alongside the emitted event. |
| `ps` | `dynamic` | — | Player movement state; accesses `eventSequence`, `events` and `eventParms`. May update `ps.events[slot]`, `ps.eventParms[slot]` and `ps.eventSequence` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L99)

<a id="function-function-mq3-game-bg-misc-runtime-bg-canitembegrabbed-function-bg-canitembegrabbed-gametype-ent-ps-src-mq3-game-bg-misc-runtime-ml-1032948388"></a>
### BG_CanItemBeGrabbed

```ml
function BG_CanItemBeGrabbed(gametype, ent, ps)
```

Forward `BG_CanItemBeGrabbed` to `mq3.game.items.canGrab` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gametype` | `dynamic` | — | Value used by `canGrab` in `if gametype == 7 then return true end if`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `ps` | `dynamic` | — | Items state; accesses `ammo`, `stats`, `persistant` and `powerups`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L110)

<a id="function-function-mq3-game-bg-misc-runtime-bg-evaluatetrajectory-function-bg-evaluatetrajectory-tr-attime-src-mq3-game-bg-misc-runtime-ml-409656176"></a>
### BG_EvaluateTrajectory

```ml
function BG_EvaluateTrajectory(tr, atTime)
```

Forward `BG_EvaluateTrajectory` to `mq3.game.trajectory.evaluate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tr` | `dynamic` | — | Trajectory record containing type, base position, velocity, start time and duration. |
| `atTime` | `dynamic` | — | Game time in milliseconds at which the trajectory is evaluated. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L114)

<a id="function-function-mq3-game-bg-misc-runtime-bg-evaluatetrajectorydelta-function-bg-evaluatetrajectorydelta-tr-attime-src-mq3-game-bg-misc-runtime-ml-1187858548"></a>
### BG_EvaluateTrajectoryDelta

```ml
function BG_EvaluateTrajectoryDelta(tr, atTime)
```

Forward `BG_EvaluateTrajectoryDelta` to `mq3.game.trajectory.evaluateDelta` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tr` | `dynamic` | — | Trajectory record containing type, velocity, start time and duration. |
| `atTime` | `dynamic` | — | Game time in milliseconds at which the trajectory is evaluated. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L118)

<a id="function-function-mq3-game-bg-misc-runtime-bg-finditem-function-bg-finditem-pickupname-missionpack-src-mq3-game-bg-misc-runtime-ml-1818610354"></a>
### BG_FindItem

```ml
function BG_FindItem(pickupName, missionpack)
```

Apply `mq3.game.bg_misc_runtime.pickupNames` while evaluating `BG_FindItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pickupName` | `dynamic` | — | Value passed as argument 2 to `std.string.equalsIgnoreCaseAscii`. |
| `missionpack` | `dynamic` | — | Whether Team Arena rules and definitions are active. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L87)

<a id="function-function-mq3-game-bg-misc-runtime-bg-finditemforholdable-function-bg-finditemforholdable-holdable-missionpack-src-mq3-game-bg-misc-runtime-ml-1475369892"></a>
### BG_FindItemForHoldable

```ml
function BG_FindItemForHoldable(holdable, missionpack)
```

Apply `mq3.game.bg_misc_runtime.itemLimit`, `mq3.game.bg_misc_runtime.resolvedItemType` and `mq3.game.bg_misc_runtime.resolvedItemTag` while evaluating `BG_FindItemForHoldable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `holdable` | `dynamic` | — | Value used by `BG_FindItemForHoldable` in `if resolvedItemType(index,missionpack) == c.IT_HOLDABLE and resolvedItemTag(index,missionpack) == holdable then...`. |
| `missionpack` | `dynamic` | — | Whether Team Arena rules and definitions are active. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L67)

<a id="function-function-mq3-game-bg-misc-runtime-bg-finditemforpowerup-function-bg-finditemforpowerup-powerup-missionpack-src-mq3-game-bg-misc-runtime-ml-841053173"></a>
### BG_FindItemForPowerup

```ml
function BG_FindItemForPowerup(powerup, missionpack)
```

Apply `mq3.game.bg_misc_runtime.itemLimit`, `mq3.game.bg_misc_runtime.resolvedItemType` and `mq3.game.bg_misc_runtime.resolvedItemTag` while evaluating `BG_FindItemForPowerup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `powerup` | `dynamic` | — | Value used by `BG_FindItemForPowerup` in `if (kind == c.IT_POWERUP or kind == c.IT_TEAM or kind == c.IT_PERSISTANT_POWERUP) and resolvedItemTag(index,miss...`. |
| `missionpack` | `dynamic` | — | Whether Team Arena rules and definitions are active. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L56)

<a id="function-function-mq3-game-bg-misc-runtime-bg-finditemforweapon-function-bg-finditemforweapon-weapon-missionpack-src-mq3-game-bg-misc-runtime-ml-464824589"></a>
### BG_FindItemForWeapon

```ml
function BG_FindItemForWeapon(weapon, missionpack)
```

Apply `mq3.game.bg_misc_runtime.itemLimit`, `mq3.game.bg_misc_runtime.resolvedItemType` and `mq3.game.bg_misc_runtime.resolvedItemTag` while evaluating `BG_FindItemForWeapon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |
| `missionpack` | `dynamic` | — | Whether Team Arena rules and definitions are active. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L77)

<a id="function-function-mq3-game-bg-misc-runtime-bg-playerstatetoentitystate-function-bg-playerstatetoentitystate-ps-state-snap-src-mq3-game-bg-misc-runtime-ml-2055416120"></a>
### BG_PlayerStateToEntityState

```ml
function BG_PlayerStateToEntityState(ps, state, snap)
```

Forward `BG_PlayerStateToEntityState` to `mq3.game.snapshot.fromPlayer` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player movement state; accesses `pm_type`, `stats`, `clientNum`, `origin` and `velocity` and related fields. May update `ps.entityEventSequence` in place. |
| `state` | `dynamic` | — | S record; accesses `eType`, `number`, `pos`, `apos` and `angles2` and related fields. May update `state.eType`, `state.number` and `state.pos.trType` and additional fields in place. |
| `snap` | `dynamic` | — | Value used by `convert` in `if snap then snapVector(s.pos.trBase) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L123)

<a id="function-function-mq3-game-bg-misc-runtime-bg-playerstatetoentitystateextrapolate-function-bg-playerstatetoentitystateextrapolate-ps-state-time-snap-src-mq3-game-bg-misc-runtime-ml-268610709"></a>
### BG_PlayerStateToEntityStateExtraPolate

```ml
function BG_PlayerStateToEntityStateExtraPolate(ps, state, time, snap)
```

Forward `BG_PlayerStateToEntityStateExtraPolate` to `mq3.game.snapshot.extrapolate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player movement state; accesses `pm_type`, `stats`, `clientNum`, `origin` and `velocity` and related fields. May update `ps.entityEventSequence` in place. |
| `state` | `dynamic` | — | S record; accesses `eType`, `number`, `pos`, `apos` and `angles2` and related fields. May update `state.eType`, `state.number` and `state.pos.trType` and additional fields in place. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |
| `snap` | `dynamic` | — | Value used by `convert` in `if snap then snapVector(s.pos.trBase) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L129)

<a id="function-function-mq3-game-bg-misc-runtime-bg-playertouchesitem-function-bg-playertouchesitem-ps-item-attime-src-mq3-game-bg-misc-runtime-ml-2007886104"></a>
### BG_PlayerTouchesItem

```ml
function BG_PlayerTouchesItem(ps, item, atTime)
```

Forward `BG_PlayerTouchesItem` to `mq3.game.trajectory.playerTouchesItem` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player movement state; accesses `origin`. |
| `item` | `dynamic` | — | Item record; accesses `pos`. |
| `atTime` | `dynamic` | — | Game time in milliseconds at which the trajectory is evaluated. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L134)

<a id="function-function-mq3-game-bg-misc-runtime-bg-touchjumppad-function-bg-touchjumppad-ps-item-src-mq3-game-bg-misc-runtime-ml-137969032"></a>
### BG_TouchJumpPad

```ml
function BG_TouchJumpPad(ps, item)
```

Forward `BG_TouchJumpPad` to `mq3.game.jumppad.touch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player movement state; accesses `pm_type`, `powerups`, `jumppad_ent`, `eventSequence` and `events` and related fields. May update `ps.events[slot]`, `ps.eventParms[slot]` and `ps.eventSequence` and additional fields in place. |
| `item` | `dynamic` | — | Item record; accesses `number` and `origin2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L138)

<a id="function-function-mq3-game-bg-misc-runtime-itemlimit-function-itemlimit-missionpack-src-mq3-game-bg-misc-runtime-ml-1179471973"></a>
### itemLimit

```ml
function itemLimit(missionpack)
```

Apply `mq3.game.spawn_tables.missionpackItems` and `mq3.game.spawn_tables.items` while evaluating `itemLimit`. Return paths include `len(tables.items())`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `missionpack` | `dynamic` | — | Whether Team Arena rules and definitions are active. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L16)

<a id="function-function-mq3-game-bg-misc-runtime-pickupnames-function-pickupnames-missionpack-src-mq3-game-bg-misc-runtime-ml-291806533"></a>
### pickupNames

```ml
function pickupNames(missionpack)
```

Return the pinned pickup-name table, extending it with Team Arena items when requested.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `missionpack` | `dynamic` | — | Whether Team Arena rules and definitions are active. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L39)

<a id="function-function-mq3-game-bg-misc-runtime-resolveditemtag-function-resolveditemtag-index-missionpack-src-mq3-game-bg-misc-runtime-ml-1114484141"></a>
### resolvedItemTag

```ml
function resolvedItemTag(index, missionpack)
```

Apply `mq3.game.constants.missionpackItemTag` and `mq3.game.constants.itemTag` while evaluating `resolvedItemTag`. Return paths include `c.itemTag(index)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index of the entry to access. |
| `missionpack` | `dynamic` | — | Whether Team Arena rules and definitions are active. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L32)

<a id="function-function-mq3-game-bg-misc-runtime-resolveditemtype-function-resolveditemtype-index-missionpack-src-mq3-game-bg-misc-runtime-ml-1781793147"></a>
### resolvedItemType

```ml
function resolvedItemType(index, missionpack)
```

Apply `mq3.game.constants.missionpackItemType` and `mq3.game.constants.itemType` while evaluating `resolvedItemType`. Return paths include `c.itemType(index)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index of the entry to access. |
| `missionpack` | `dynamic` | — | Whether Team Arena rules and definitions are active. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_misc_runtime.ml#L24)
