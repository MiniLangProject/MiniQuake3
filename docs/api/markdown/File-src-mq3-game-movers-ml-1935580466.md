# `src/mq3/game/movers.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.movers`](Package-mq3-game-movers-1210120180.md)

Reachable from entry: **no**

## Imports

- `mq3/collision/visibility.ml` as `vis` → [src/mq3/collision/visibility.ml](File-src-mq3-collision-visibility-ml-1423508826.md)
- `mq3/collision/world.ml` as `cm` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/events.ml` as `events` → [src/mq3/game/events.ml](File-src-mq3-game-events-ml-426242211.md)
- `mq3/game/items.ml` as `items` → [src/mq3/game/items.ml](File-src-mq3-game-items-ml-152650830.md)
- `mq3/game/missiles.ml` as `missiles` → [src/mq3/game/missiles.ml](File-src-mq3-game-missiles-ml-1154787103.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/targets.ml` as `targets` → [src/mq3/game/targets.ml](File-src-mq3-game-targets-ml-1419507080.md)
- `mq3/game/teleport.ml` as `teleport` → [src/mq3/game/teleport.ml](File-src-mq3-game-teleport-ml-594448221.md)
- `mq3/game/trajectory.ml` as `trajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/directions.ml` as `dirs` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-movers-addsound-function-addsound-level-ent-index-src-mq3-game-movers-ml-1823144261"></a>
### addSound

```ml
function addSound(level, ent, index)
```

Apply `mq3.game.events.add` while evaluating `addSound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `s` and `eventTime`. May update `ent.s.event`, `ent.s.eventParm` and `ent.eventTime` in place. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L57)

<a id="function-function-mq3-game-movers-adjustareaportal-function-adjustareaportal-level-ent-open-src-mq3-game-movers-ml-1371141107"></a>
### adjustAreaPortal

```ml
function adjustAreaPortal(level, ent, open)
```

Apply `mq3.collision.visibility.adjustAreaPortalState` while evaluating `adjustAreaPortal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`. |
| `open` | `dynamic` | — | Value used by `adjustAreaPortalState` in `if not open then change = -1 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L66)

<a id="function-function-mq3-game-movers-beginmoving-function-beginmoving-level-ent-src-mq3-game-movers-ml-1003239193"></a>
### beginMoving

```ml
function beginMoving(level, ent)
```

Set `ent.s.pos.trTime` to `level.time` and `ent.s.pos.trType` to `c.TR_LINEAR_STOP` in `mq3.game.movers.beginMoving`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. May update `ent.s.pos.trTime` and `ent.s.pos.trType` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L344)

<a id="function-function-mq3-game-movers-blockeddoor-function-blockeddoor-level-ent-other-src-mq3-game-movers-ml-1903548999"></a>
### blockedDoor

```ml
function blockedDoor(level, ent, other)
```

Apply `mq3.game.items.itemType`, `mq3.game.items.droppedFlagThink` and `mq3.game.entities.tempEntity` while evaluating `blockedDoor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `damage` and `spawnflags`. |
| `other` | `dynamic` | — | Other record; accesses `client`, `s` and `item`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L189)

<a id="function-function-mq3-game-movers-checkproxmineposition-function-checkproxmineposition-level-check-src-mq3-game-movers-ml-809025116"></a>
### checkProxMinePosition

```ml
function checkProxMinePosition(level, check)
```

Apply `mq3.server.world.trace` while evaluating `checkProxMinePosition`. Return paths include `not hit.trace.startsolid and hit.trace.fraction == 1.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `check` | `dynamic` | — | Check record; accesses `s` and `movedir`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L538)

<a id="function-function-mq3-game-movers-createrotationmatrix-function-createrotationmatrix-angles-src-mq3-game-movers-ml-583999296"></a>
### createRotationMatrix

```ml
function createRotationMatrix(angles)
```

Forward `createRotationMatrix` to `mq3.collision.world.rotationMatrix` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L518)

<a id="function-function-mq3-game-movers-dispatch-function-dispatch-level-ent-src-mq3-game-movers-ml-1758993147"></a>
### dispatch

```ml
function dispatch(level, ent)
```

Apply `mq3.game.movers.spawnDoor`, `mq3.game.movers.spawnPlat` and `mq3.game.movers.spawnButton` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `classname`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L452)

<a id="constant-constant-mq3-game-movers-ef-mover-stop-const-ef-mover-stop-1024-src-mq3-game-movers-ml-1994655780"></a>
### EF_MOVER_STOP

```ml
const EF_MOVER_STOP = 1024
```

Network entity-flag bit indicating mover stop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L38)

<a id="function-function-mq3-game-movers-explodeproxmine-function-explodeproxmine-level-check-src-mq3-game-movers-ml-1281639292"></a>
### explodeProxMine

```ml
function explodeProxMine(level, check)
```

Set `check.s.loopSound` to `0` and `check.activator` to `void` in `mq3.game.movers.explodeProxMine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `check` | `dynamic` | — | Check record; accesses `s` and `activator`. May update `check.s.loopSound` and `check.activator` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L569)

<a id="function-function-mq3-game-movers-findpath-function-findpath-level-name-start-src-mq3-game-movers-ml-646453783"></a>
### findPath

```ml
function findPath(level, name, start)
```

Find the next active path_corner with a matching target name, beginning at the supplied entity index.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `start` | `dynamic` | — | Value used by `findPath` in `i = start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L351)

<a id="constant-constant-mq3-game-movers-fl-teamslave-const-fl-teamslave-1024-src-mq3-game-movers-ml-1009017736"></a>
### FL_TEAMSLAVE

```ml
const FL_TEAMSLAVE = 1024
```

Game entity-flag bit enabling or marking teamslave.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L34)

<a id="function-function-mq3-game-movers-initmover-function-initmover-level-ent-src-mq3-game-movers-ml-8984917"></a>
### initMover

```ml
function initMover(level, ent)
```

Update `ent.s.modelindex2`, `ent.s.loopSound`, `ent.s.constantLight` and `ent.use` and related state during `initMover`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `model2`, `s`, `use`, `reached` and `moverState` and related fields. May update `ent.s.modelindex2`, `ent.s.loopSound` and `ent.s.constantLight` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L160)

<a id="function-function-mq3-game-movers-matchteam-function-matchteam-level-leader-state-time-src-mq3-game-movers-ml-176545297"></a>
### matchTeam

```ml
function matchTeam(level, leader, state, time)
```

Apply `mq3.game.movers.setMoverState` while evaluating `matchTeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `leader` | `dynamic` | — | Value used by `matchTeam` in `part = leader`. |
| `state` | `dynamic` | — | Value used by `setMoverState` in `ent.moverState = state`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L99)

<a id="function-function-mq3-game-movers-movedirvector-function-movedirvector-angles-src-mq3-game-movers-ml-367107130"></a>
### movedirVector

```ml
function movedirVector(angles)
```

Forward `movedirVector` to `mq3.shared.directions.movedirVector` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L272)

<a id="constant-constant-mq3-game-movers-mover-1to2-const-mover-1to2-2-src-mq3-game-movers-ml-1978110885"></a>
### MOVER_1TO2

```ml
const MOVER_1TO2 = 2
```

Mover-state identifier representing the 1 to2 position or transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L30)

<a id="constant-constant-mq3-game-movers-mover-2to1-const-mover-2to1-3-src-mq3-game-movers-ml-1205727276"></a>
### MOVER_2TO1

```ml
const MOVER_2TO1 = 3
```

Mover-state identifier representing the 2 to1 position or transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L32)

<a id="constant-constant-mq3-game-movers-mover-pos1-const-mover-pos1-0-src-mq3-game-movers-ml-390573165"></a>
### MOVER_POS1

```ml
const MOVER_POS1 = 0
```

Mover-state identifier representing the pos1 position or transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L26)

<a id="constant-constant-mq3-game-movers-mover-pos2-const-mover-pos2-1-src-mq3-game-movers-ml-940497554"></a>
### MOVER_POS2

```ml
const MOVER_POS2 = 1
```

Mover-state identifier representing the pos2 position or transition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L28)

<a id="function-function-mq3-game-movers-moveteam-function-moveteam-level-leader-src-mq3-game-movers-ml-1908835103"></a>
### moveTeam

```ml
function moveTeam(level, leader)
```

Use `leader.blocked` to perform `moveTeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `leader` | `dynamic` | — | Leader record; accesses `blocked`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L699)

<a id="function-function-mq3-game-movers-overlaps-function-overlaps-first-second-src-mq3-game-movers-ml-474707450"></a>
### overlaps

```ml
function overlaps(first, second)
```

Test strict overlap of two entities' absolute collision bounds on all three axes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | First record; accesses `r`. |
| `second` | `dynamic` | — | Second record; accesses `r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L488)

<a id="function-function-mq3-game-movers-positionblocked-function-positionblocked-level-ent-src-mq3-game-movers-ml-1435050149"></a>
### positionBlocked

```ml
function positionBlocked(level, ent)
```

Test `testEntityPosition(level,ent) != void` as the condition for `positionBlocked`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `client`, `clipmask` and `r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L498)

<a id="function-function-mq3-game-movers-pushpart-function-pushpart-level-pusher-move-anglemove-records-src-mq3-game-movers-ml-599691392"></a>
### pushPart

```ml
function pushPart(level, pusher, move, angleMove, records)
```

Update `pusher.r.currentOrigin` and `pusher.r.currentAngles` during `pushPart`. Return paths include `[true,void,records]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `entities`. |
| `pusher` | `dynamic` | — | Pusher record; accesses `r` and `s`. May update `pusher.r.currentOrigin` and `pusher.r.currentAngles` in place. |
| `move` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `angleMove` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `records` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `pushPart`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L628)

<a id="function-function-mq3-game-movers-reachedbinary-function-reachedbinary-level-ent-src-mq3-game-movers-ml-2002812105"></a>
### reachedBinary

```ml
function reachedBinary(level, ent)
```

Update `ent.s.loopSound`, `ent.think`, `ent.nextthink` and `ent.activator` during `reachedBinary`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `soundLoop`, `moverState`, `soundPos2` and `think` and related fields. May update `ent.s.loopSound`, `ent.think` and `ent.nextthink` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L118)

<a id="function-function-mq3-game-movers-reachedtrain-function-reachedtrain-level-ent-src-mq3-game-movers-ml-1593303447"></a>
### reachedTrain

```ml
function reachedTrain(level, ent)
```

Update `ent.nextTrain`, `ent.pos1`, `ent.pos2` and `ent.s.pos.trDuration` and related state during `reachedTrain`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `nextTrain`, `pos1`, `pos2`, `speed` and `s` and related fields. May update `ent.nextTrain`, `ent.pos1` and `ent.pos2` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L362)

<a id="function-function-mq3-game-movers-restorepush-function-restorepush-level-record-src-mq3-game-movers-ml-1869291627"></a>
### restorePush

```ml
function restorePush(level, record)
```

Apply `mq3.game.movement.copy` and `mq3.game.entities.link` while evaluating `restorePush`. Return paths include `game.link(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `record` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L616)

<a id="function-function-mq3-game-movers-returntopos1-function-returntopos1-level-ent-src-mq3-game-movers-ml-1115847371"></a>
### returnToPos1

```ml
function returnToPos1(level, ent)
```

Set `ent.s.loopSound` to `ent.soundLoop` in `mq3.game.movers.returnToPos1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `soundLoop` and `sound2to1`. May update `ent.s.loopSound` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L110)

<a id="function-function-mq3-game-movers-rollbackteam-function-rollbackteam-level-leader-records-src-mq3-game-movers-ml-238603227"></a>
### rollbackTeam

```ml
function rollbackTeam(level, leader, records)
```

Apply `mq3.game.movers.restorePush`, `mq3.game.trajectory.evaluate` and `mq3.game.entities.link` while evaluating `rollbackTeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `previousTime`. |
| `leader` | `dynamic` | — | Value used by `rollbackTeam` in `part = leader`. |
| `records` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L683)

<a id="function-function-mq3-game-movers-rotatepoint-function-rotatepoint-point-matrix-src-mq3-game-movers-ml-127347833"></a>
### rotatePoint

```ml
function rotatePoint(point, matrix)
```

Forward `rotatePoint` to `mq3.collision.world.rotatePoint` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `matrix` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L531)

<a id="function-function-mq3-game-movers-run-function-run-level-ent-src-mq3-game-movers-ml-1401736345"></a>
### run

```ml
function run(level, ent)
```

Apply `mq3.game.movers.moveTeam` and `mq3.game.entities.runThink` while evaluating `run`. Return paths include `game.runThink(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `flags` and `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L725)

<a id="function-function-mq3-game-movers-setbrushmodel-function-setbrushmodel-level-ent-name-src-mq3-game-movers-ml-934317306"></a>
### setBrushModel

```ml
function setBrushModel(level, ent, name)
```

Update `ent.s.modelindex`, `ent.r.mins`, `ent.r.maxs` and `ent.r.bmodel` and related state during `setBrushModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `r` and `slot`. May update `ent.s.modelindex`, `ent.r.mins` and `ent.r.maxs` and additional fields in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L44)

<a id="function-function-mq3-game-movers-setmoverstate-function-setmoverstate-level-ent-state-time-src-mq3-game-movers-ml-990327645"></a>
### setMoverState

```ml
function setMoverState(level, ent, state, time)
```

Update `ent.moverState`, `ent.s.pos.trTime`, `ent.s.pos.trBase` and `ent.s.pos.trType` and related state during `setMoverState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `moverState`, `s`, `pos1`, `pos2` and `r`. May update `ent.moverState`, `ent.s.pos.trTime` and `ent.s.pos.trBase` and additional fields in place. |
| `state` | `dynamic` | — | Value used by `setMoverState` in `ent.moverState = state`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L76)

<a id="function-function-mq3-game-movers-setuptrain-function-setuptrain-level-ent-src-mq3-game-movers-ml-968968075"></a>
### setupTrain

```ml
function setupTrain(level, ent)
```

Set `ent.nextTrain` to `findPath(level,ent.target,0)` in `mq3.game.movers.setupTrain`. Return paths include `reachedTrain(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `nextTrain`, `target` and `r`. May update `ent.nextTrain` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L375)

<a id="function-function-mq3-game-movers-spawnbobbing-function-spawnbobbing-level-ent-src-mq3-game-movers-ml-645805043"></a>
### spawnBobbing

```ml
function spawnBobbing(level, ent)
```

Update `ent.speed`, `ent.damage`, `ent.s.pos.trBase` and `ent.r.currentOrigin` and related state during `spawnBobbing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `speed`, `damage`, `model`, `s` and `r` and related fields. May update `ent.speed`, `ent.damage` and `ent.s.pos.trBase` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L417)

<a id="function-function-mq3-game-movers-spawnbutton-function-spawnbutton-level-ent-src-mq3-game-movers-ml-1214759097"></a>
### spawnButton

```ml
function spawnButton(level, ent)
```

Update `ent.sound1to2`, `ent.speed`, `ent.wait` and `ent.pos1` and related state during `spawnButton`. Return paths include `initMover(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `sound1to2`, `speed`, `wait`, `pos1` and `s` and related fields. May update `ent.sound1to2`, `ent.speed` and `ent.wait` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L331)

<a id="function-function-mq3-game-movers-spawndoor-function-spawndoor-level-ent-src-mq3-game-movers-ml-1460367493"></a>
### spawnDoor

```ml
function spawnDoor(level, ent)
```

Update `ent.sound1to2`, `ent.sound2to1`, `ent.soundPos1` and `ent.soundPos2` and related state during `spawnDoor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `sound1to2`, `sound2to1`, `soundPos1`, `soundPos2` and `blocked` and related fields. May update `ent.sound1to2`, `ent.sound2to1` and `ent.soundPos1` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L252)

<a id="function-function-mq3-game-movers-spawndoortrigger-function-spawndoortrigger-level-ent-src-mq3-game-movers-ml-453564407"></a>
### spawnDoorTrigger

```ml
function spawnDoorTrigger(level, ent)
```

Apply `mq3.game.movement.copy`, `mq3.game.entities.spawn` and `mq3.game.entities.link` while evaluating `spawnDoorTrigger`. Return paths include `matchTeam(level,ent,ent.moverState,level.time)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `r` and `moverState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L230)

<a id="function-function-mq3-game-movers-spawnpathcorner-function-spawnpathcorner-level-ent-src-mq3-game-movers-ml-1150615781"></a>
### spawnPathCorner

```ml
function spawnPathCorner(level, ent)
```

Apply `mq3.game.entities.diagnostic`, `mq3.game.entities.vtos` and `mq3.game.entities.free` while evaluating `spawnPathCorner`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `targetname` and `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L441)

<a id="function-function-mq3-game-movers-spawnpendulum-function-spawnpendulum-level-ent-src-mq3-game-movers-ml-99858505"></a>
### spawnPendulum

```ml
function spawnPendulum(level, ent)
```

Update `ent.damage`, `ent.s.pos.trDuration`, `ent.s.pos.trBase` and `ent.r.currentOrigin` and related state during `spawnPendulum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `damage`, `model`, `r` and `s`. May update `ent.damage`, `ent.s.pos.trDuration` and `ent.s.pos.trBase` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L427)

<a id="function-function-mq3-game-movers-spawnplat-function-spawnplat-level-ent-src-mq3-game-movers-ml-1605394715"></a>
### spawnPlat

```ml
function spawnPlat(level, ent)
```

Update `ent.sound1to2`, `ent.sound2to1`, `ent.soundPos1` and `ent.soundPos2` and related state during `spawnPlat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `sound1to2`, `sound2to1`, `soundPos1`, `soundPos2` and `s` and related fields. May update `ent.sound1to2`, `ent.sound2to1` and `ent.soundPos1` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L309)

<a id="function-function-mq3-game-movers-spawnplattrigger-function-spawnplattrigger-level-ent-src-mq3-game-movers-ml-1975672715"></a>
### spawnPlatTrigger

```ml
function spawnPlatTrigger(level, ent)
```

Apply `mq3.game.entities.spawn` and `mq3.game.entities.link` while evaluating `spawnPlatTrigger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities`, `entities`, `startTime` and `time`. May update `level.num_entities` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `pos1` and `r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L297)

<a id="function-function-mq3-game-movers-spawnrotating-function-spawnrotating-level-ent-src-mq3-game-movers-ml-1750764685"></a>
### spawnRotating

```ml
function spawnRotating(level, ent)
```

Update `ent.speed`, `ent.damage`, `ent.s.apos.trType` and `ent.s.apos.trDelta[2]` and related state during `spawnRotating`. Return paths include `game.link(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `speed`, `damage`, `s`, `spawnflags` and `model` and related fields. May update `ent.speed`, `ent.damage` and `ent.s.apos.trType` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L409)

<a id="function-function-mq3-game-movers-spawnstatic-function-spawnstatic-level-ent-src-mq3-game-movers-ml-2106763473"></a>
### spawnStatic

```ml
function spawnStatic(level, ent)
```

Set `ent.s.pos.trBase` to `movement.copy(ent.s.origin)` and `ent.r.currentOrigin` to `movement.copy(ent.s.origin)` in `mq3.game.movers.spawnStatic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `model`, `s` and `r`. May update `ent.s.pos.trBase` and `ent.r.currentOrigin` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L403)

<a id="function-function-mq3-game-movers-spawntrain-function-spawntrain-level-ent-src-mq3-game-movers-ml-465963579"></a>
### spawnTrain

```ml
function spawnTrain(level, ent)
```

Update `ent.s.angles`, `ent.damage`, `ent.speed` and `ent.reached` and related state during `spawnTrain`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `spawnflags`, `damage`, `speed` and `target` and related fields. May update `ent.s.angles`, `ent.damage` and `ent.speed` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L390)

<a id="constant-constant-mq3-game-movers-svf-use-current-origin-const-svf-use-current-origin-128-src-mq3-game-movers-ml-1774452552"></a>
### SVF_USE_CURRENT_ORIGIN

```ml
const SVF_USE_CURRENT_ORIGIN = 128
```

Server entity-flag bit controlling use current origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L36)

<a id="function-function-mq3-game-movers-testentityposition-function-testentityposition-level-ent-src-mq3-game-movers-ml-27744615"></a>
### testEntityPosition

```ml
function testEntityPosition(level, ent)
```

Apply `mq3.server.world.trace` while evaluating `testEntityPosition`. Return paths include `level.entities[hit.entityNum]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `client`, `clipmask` and `r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L505)

<a id="function-function-mq3-game-movers-thinkmatchteam-function-thinkmatchteam-level-ent-src-mq3-game-movers-ml-794975891"></a>
### thinkMatchTeam

```ml
function thinkMatchTeam(level, ent)
```

Forward `thinkMatchTeam` to `mq3.game.movers.matchTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `moverState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L223)

<a id="function-function-mq3-game-movers-touchbutton-function-touchbutton-level-ent-other-trace-src-mq3-game-movers-ml-767379086"></a>
### touchButton

```ml
function touchButton(level, ent, other, trace)
```

Apply `mq3.game.movers.useBinary` while evaluating `touchButton`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `moverState`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `touchButton` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L325)

<a id="function-function-mq3-game-movers-touchdoortrigger-function-touchdoortrigger-level-ent-other-trace-src-mq3-game-movers-ml-119485512"></a>
### touchDoorTrigger

```ml
function touchDoorTrigger(level, ent, other, trace)
```

Apply `mq3.game.teleport.player` and `mq3.game.movers.useBinary` while evaluating `touchDoorTrigger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `parent`, `count` and `r`. |
| `other` | `dynamic` | — | Other record; accesses `client` and `s`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `touchDoorTrigger` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L204)

<a id="function-function-mq3-game-movers-touchplat-function-touchplat-level-ent-other-trace-src-mq3-game-movers-ml-1775867480"></a>
### touchPlat

```ml
function touchPlat(level, ent, other, trace)
```

Set `ent.nextthink` to `n.add32(level.time,1000)` in `mq3.game.movers.touchPlat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `moverState` and `nextthink`. May update `ent.nextthink` in place. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `touchPlat` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L281)

<a id="function-function-mq3-game-movers-touchplattrigger-function-touchplattrigger-level-ent-other-trace-src-mq3-game-movers-ml-934353128"></a>
### touchPlatTrigger

```ml
function touchPlatTrigger(level, ent, other, trace)
```

Apply `mq3.game.movers.useBinary` while evaluating `touchPlatTrigger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `parent`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `trace` | `dynamic` | — | Not read by this implementation; retained in the `touchPlatTrigger` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L290)

<a id="function-function-mq3-game-movers-transposematrix-function-transposematrix-matrix-src-mq3-game-movers-ml-1009330493"></a>
### transposeMatrix

```ml
function transposeMatrix(matrix)
```

Forward `transposeMatrix` to `mq3.collision.world.transpose` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L524)

<a id="function-function-mq3-game-movers-trypush-function-trypush-level-check-pusher-move-anglemove-src-mq3-game-movers-ml-653254772"></a>
### tryPush

```ml
function tryPush(level, check, pusher, move, angleMove)
```

Update `check.s.pos.trBase[axis]`, `check.client.ps.origin[axis]`, `check.client.ps.delta_angles[1]` and `check.s.groundEntityNum` and related state during `tryPush`. Return paths include `[false,[check,oldOrigin,oldAngles,oldDeltaYaw]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `entities`. |
| `check` | `dynamic` | — | Check record; accesses `s`, `client` and `r`. May update `check.s.pos.trBase[axis]`, `check.client.ps.origin[axis]` and `check.client.ps.delta_angles[1]` and additional fields in place. |
| `pusher` | `dynamic` | — | Pusher record; accesses `s` and `r`. |
| `move` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `angleMove` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L581)

<a id="function-function-mq3-game-movers-trypushingproxmine-function-trypushingproxmine-level-check-pusher-move-anglemove-src-mq3-game-movers-ml-1216677654"></a>
### tryPushingProxMine

```ml
function tryPushingProxMine(level, check, pusher, move, angleMove)
```

Update `check.s.pos.trBase[axis]` and `check.r.currentOrigin` during `tryPushingProxMine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `check` | `dynamic` | — | Check record; accesses `s` and `r`. May update `check.s.pos.trBase[axis]` and `check.r.currentOrigin` in place. |
| `pusher` | `dynamic` | — | Pusher record; accesses `r`. |
| `move` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `angleMove` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L551)

<a id="function-function-mq3-game-movers-usebinary-function-usebinary-level-ent-other-activator-src-mq3-game-movers-ml-2026124606"></a>
### useBinary

```ml
function useBinary(level, ent, other, activator)
```

Update `ent.activator`, `ent.s.loopSound` and `ent.nextthink` during `useBinary`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `flags`, `teammaster`, `activator`, `moverState` and `sound1to2` and related fields. May update `ent.activator`, `ent.s.loopSound` and `ent.nextthink` in place. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.movers.useBinary`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movers.ml#L137)
