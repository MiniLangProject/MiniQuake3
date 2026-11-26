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
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-bg-misc-runtime-bg-addpredictableeventtoplayerstate-function-bg-addpredictableeventtoplayerstate-event-parm-ps-src-mq3-game-bg-misc-runtime-ml-516600615"></a>
### BG_AddPredictableEventToPlayerstate

```ml
function BG_AddPredictableEventToPlayerstate(event, parm, ps)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `event` | `dynamic` | — |  |
| `parm` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L73)

<a id="function-function-mq3-game-bg-misc-runtime-bg-canitembegrabbed-function-bg-canitembegrabbed-gametype-ent-ps-src-mq3-game-bg-misc-runtime-ml-1032948388"></a>
### BG_CanItemBeGrabbed

```ml
function BG_CanItemBeGrabbed(gametype, ent, ps)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gametype` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L80)

<a id="function-function-mq3-game-bg-misc-runtime-bg-evaluatetrajectory-function-bg-evaluatetrajectory-tr-attime-src-mq3-game-bg-misc-runtime-ml-409656176"></a>
### BG_EvaluateTrajectory

```ml
function BG_EvaluateTrajectory(tr, atTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tr` | `dynamic` | — |  |
| `atTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L81)

<a id="function-function-mq3-game-bg-misc-runtime-bg-evaluatetrajectorydelta-function-bg-evaluatetrajectorydelta-tr-attime-src-mq3-game-bg-misc-runtime-ml-1187858548"></a>
### BG_EvaluateTrajectoryDelta

```ml
function BG_EvaluateTrajectoryDelta(tr, atTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tr` | `dynamic` | — |  |
| `atTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L82)

<a id="function-function-mq3-game-bg-misc-runtime-bg-finditem-function-bg-finditem-pickupname-missionpack-src-mq3-game-bg-misc-runtime-ml-1818610354"></a>
### BG_FindItem

```ml
function BG_FindItem(pickupName, missionpack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pickupName` | `dynamic` | — |  |
| `missionpack` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L65)

<a id="function-function-mq3-game-bg-misc-runtime-bg-finditemforholdable-function-bg-finditemforholdable-holdable-missionpack-src-mq3-game-bg-misc-runtime-ml-1475369892"></a>
### BG_FindItemForHoldable

```ml
function BG_FindItemForHoldable(holdable, missionpack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `holdable` | `dynamic` | — |  |
| `missionpack` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L51)

<a id="function-function-mq3-game-bg-misc-runtime-bg-finditemforpowerup-function-bg-finditemforpowerup-powerup-missionpack-src-mq3-game-bg-misc-runtime-ml-841053173"></a>
### BG_FindItemForPowerup

```ml
function BG_FindItemForPowerup(powerup, missionpack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `powerup` | `dynamic` | — |  |
| `missionpack` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L43)

<a id="function-function-mq3-game-bg-misc-runtime-bg-finditemforweapon-function-bg-finditemforweapon-weapon-missionpack-src-mq3-game-bg-misc-runtime-ml-464824589"></a>
### BG_FindItemForWeapon

```ml
function BG_FindItemForWeapon(weapon, missionpack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weapon` | `dynamic` | — |  |
| `missionpack` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L58)

<a id="function-function-mq3-game-bg-misc-runtime-bg-playerstatetoentitystate-function-bg-playerstatetoentitystate-ps-state-snap-src-mq3-game-bg-misc-runtime-ml-2055416120"></a>
### BG_PlayerStateToEntityState

```ml
function BG_PlayerStateToEntityState(ps, state, snap)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `snap` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L83)

<a id="function-function-mq3-game-bg-misc-runtime-bg-playerstatetoentitystateextrapolate-function-bg-playerstatetoentitystateextrapolate-ps-state-time-snap-src-mq3-game-bg-misc-runtime-ml-268610709"></a>
### BG_PlayerStateToEntityStateExtraPolate

```ml
function BG_PlayerStateToEntityStateExtraPolate(ps, state, time, snap)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `snap` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L84)

<a id="function-function-mq3-game-bg-misc-runtime-bg-playertouchesitem-function-bg-playertouchesitem-ps-item-attime-src-mq3-game-bg-misc-runtime-ml-2007886104"></a>
### BG_PlayerTouchesItem

```ml
function BG_PlayerTouchesItem(ps, item, atTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |
| `atTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L85)

<a id="function-function-mq3-game-bg-misc-runtime-bg-touchjumppad-function-bg-touchjumppad-ps-item-src-mq3-game-bg-misc-runtime-ml-137969032"></a>
### BG_TouchJumpPad

```ml
function BG_TouchJumpPad(ps, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L86)

<a id="function-function-mq3-game-bg-misc-runtime-itemlimit-function-itemlimit-missionpack-src-mq3-game-bg-misc-runtime-ml-1179471973"></a>
### itemLimit

```ml
function itemLimit(missionpack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `missionpack` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L14)

<a id="function-function-mq3-game-bg-misc-runtime-pickupnames-function-pickupnames-missionpack-src-mq3-game-bg-misc-runtime-ml-291806533"></a>
### pickupNames

```ml
function pickupNames(missionpack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `missionpack` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L29)

<a id="function-function-mq3-game-bg-misc-runtime-resolveditemtag-function-resolveditemtag-index-missionpack-src-mq3-game-bg-misc-runtime-ml-1114484141"></a>
### resolvedItemTag

```ml
function resolvedItemTag(index, missionpack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |
| `missionpack` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L24)

<a id="function-function-mq3-game-bg-misc-runtime-resolveditemtype-function-resolveditemtype-index-missionpack-src-mq3-game-bg-misc-runtime-ml-1781793147"></a>
### resolvedItemType

```ml
function resolvedItemType(index, missionpack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |
| `missionpack` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_misc_runtime.ml#L19)
