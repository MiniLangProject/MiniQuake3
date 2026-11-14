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
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-movers-addsound-function-addsound-level-ent-index-src-mq3-game-movers-ml-1823144261"></a>
### addSound

```ml
function addSound(level, ent, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L42)

<a id="function-function-mq3-game-movers-adjustareaportal-function-adjustareaportal-level-ent-open-src-mq3-game-movers-ml-1371141107"></a>
### adjustAreaPortal

```ml
function adjustAreaPortal(level, ent, open)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `open` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L47)

<a id="function-function-mq3-game-movers-beginmoving-function-beginmoving-level-ent-src-mq3-game-movers-ml-1003239193"></a>
### beginMoving

```ml
function beginMoving(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L254)

<a id="function-function-mq3-game-movers-blockeddoor-function-blockeddoor-level-ent-other-src-mq3-game-movers-ml-1903548999"></a>
### blockedDoor

```ml
function blockedDoor(level, ent, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L142)

<a id="function-function-mq3-game-movers-checkproxmineposition-function-checkproxmineposition-level-check-src-mq3-game-movers-ml-809025116"></a>
### checkProxMinePosition

```ml
function checkProxMinePosition(level, check)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `check` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L398)

<a id="function-function-mq3-game-movers-createrotationmatrix-function-createrotationmatrix-angles-src-mq3-game-movers-ml-583999296"></a>
### createRotationMatrix

```ml
function createRotationMatrix(angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L386)

<a id="function-function-mq3-game-movers-dispatch-function-dispatch-level-ent-src-mq3-game-movers-ml-1758993147"></a>
### dispatch

```ml
function dispatch(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L331)

<a id="constant-constant-mq3-game-movers-ef-mover-stop-const-ef-mover-stop-1024-src-mq3-game-movers-ml-1994655780"></a>
### EF_MOVER_STOP

```ml
const EF_MOVER_STOP = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L31)

<a id="function-function-mq3-game-movers-explodeproxmine-function-explodeproxmine-level-check-src-mq3-game-movers-ml-1281639292"></a>
### explodeProxMine

```ml
function explodeProxMine(level, check)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `check` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L420)

<a id="function-function-mq3-game-movers-findpath-function-findpath-level-name-start-src-mq3-game-movers-ml-646453783"></a>
### findPath

```ml
function findPath(level, name, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L257)

<a id="constant-constant-mq3-game-movers-fl-teamslave-const-fl-teamslave-1024-src-mq3-game-movers-ml-1009017736"></a>
### FL_TEAMSLAVE

```ml
const FL_TEAMSLAVE = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L29)

<a id="function-function-mq3-game-movers-initmover-function-initmover-level-ent-src-mq3-game-movers-ml-8984917"></a>
### initMover

```ml
function initMover(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L117)

<a id="function-function-mq3-game-movers-matchteam-function-matchteam-level-leader-state-time-src-mq3-game-movers-ml-176545297"></a>
### matchTeam

```ml
function matchTeam(level, leader, state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `leader` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L70)

<a id="function-function-mq3-game-movers-movedirvector-function-movedirvector-angles-src-mq3-game-movers-ml-367107130"></a>
### movedirVector

```ml
function movedirVector(angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L209)

<a id="constant-constant-mq3-game-movers-mover-1to2-const-mover-1to2-2-src-mq3-game-movers-ml-1978110885"></a>
### MOVER_1TO2

```ml
const MOVER_1TO2 = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L27)

<a id="constant-constant-mq3-game-movers-mover-2to1-const-mover-2to1-3-src-mq3-game-movers-ml-1205727276"></a>
### MOVER_2TO1

```ml
const MOVER_2TO1 = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L28)

<a id="constant-constant-mq3-game-movers-mover-pos1-const-mover-pos1-0-src-mq3-game-movers-ml-390573165"></a>
### MOVER_POS1

```ml
const MOVER_POS1 = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L25)

<a id="constant-constant-mq3-game-movers-mover-pos2-const-mover-pos2-1-src-mq3-game-movers-ml-940497554"></a>
### MOVER_POS2

```ml
const MOVER_POS2 = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L26)

<a id="function-function-mq3-game-movers-moveteam-function-moveteam-level-leader-src-mq3-game-movers-ml-1908835103"></a>
### moveTeam

```ml
function moveTeam(level, leader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `leader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L528)

<a id="function-function-mq3-game-movers-overlaps-function-overlaps-first-second-src-mq3-game-movers-ml-474707450"></a>
### overlaps

```ml
function overlaps(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L364)

<a id="function-function-mq3-game-movers-positionblocked-function-positionblocked-level-ent-src-mq3-game-movers-ml-1435050149"></a>
### positionBlocked

```ml
function positionBlocked(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L371)

<a id="function-function-mq3-game-movers-pushpart-function-pushpart-level-pusher-move-anglemove-records-src-mq3-game-movers-ml-599691392"></a>
### pushPart

```ml
function pushPart(level, pusher, move, angleMove, records)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `pusher` | `dynamic` | — |  |
| `move` | `dynamic` | — |  |
| `angleMove` | `dynamic` | — |  |
| `records` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L464)

<a id="function-function-mq3-game-movers-reachedbinary-function-reachedbinary-level-ent-src-mq3-game-movers-ml-2002812105"></a>
### reachedBinary

```ml
function reachedBinary(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L83)

<a id="function-function-mq3-game-movers-reachedtrain-function-reachedtrain-level-ent-src-mq3-game-movers-ml-1593303447"></a>
### reachedTrain

```ml
function reachedTrain(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L265)

<a id="function-function-mq3-game-movers-restorepush-function-restorepush-level-record-src-mq3-game-movers-ml-1869291627"></a>
### restorePush

```ml
function restorePush(level, record)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `record` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L458)

<a id="function-function-mq3-game-movers-returntopos1-function-returntopos1-level-ent-src-mq3-game-movers-ml-1115847371"></a>
### returnToPos1

```ml
function returnToPos1(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L78)

<a id="function-function-mq3-game-movers-rollbackteam-function-rollbackteam-level-leader-records-src-mq3-game-movers-ml-238603227"></a>
### rollbackTeam

```ml
function rollbackTeam(level, leader, records)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `leader` | `dynamic` | — |  |
| `records` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L515)

<a id="function-function-mq3-game-movers-rotatepoint-function-rotatepoint-point-matrix-src-mq3-game-movers-ml-127347833"></a>
### rotatePoint

```ml
function rotatePoint(point, matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L394)

<a id="function-function-mq3-game-movers-run-function-run-level-ent-src-mq3-game-movers-ml-1401736345"></a>
### run

```ml
function run(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L551)

<a id="function-function-mq3-game-movers-setbrushmodel-function-setbrushmodel-level-ent-name-src-mq3-game-movers-ml-934317306"></a>
### setBrushModel

```ml
function setBrushModel(level, ent, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L33)

<a id="function-function-mq3-game-movers-setmoverstate-function-setmoverstate-level-ent-state-time-src-mq3-game-movers-ml-990327645"></a>
### setMoverState

```ml
function setMoverState(level, ent, state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L52)

<a id="function-function-mq3-game-movers-setuptrain-function-setuptrain-level-ent-src-mq3-game-movers-ml-968968075"></a>
### setupTrain

```ml
function setupTrain(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L275)

<a id="function-function-mq3-game-movers-spawnbobbing-function-spawnbobbing-level-ent-src-mq3-game-movers-ml-645805043"></a>
### spawnBobbing

```ml
function spawnBobbing(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L305)

<a id="function-function-mq3-game-movers-spawnbutton-function-spawnbutton-level-ent-src-mq3-game-movers-ml-1214759097"></a>
### spawnButton

```ml
function spawnButton(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L244)

<a id="function-function-mq3-game-movers-spawndoor-function-spawndoor-level-ent-src-mq3-game-movers-ml-1460367493"></a>
### spawnDoor

```ml
function spawnDoor(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L191)

<a id="function-function-mq3-game-movers-spawndoortrigger-function-spawndoortrigger-level-ent-src-mq3-game-movers-ml-453564407"></a>
### spawnDoorTrigger

```ml
function spawnDoorTrigger(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L172)

<a id="function-function-mq3-game-movers-spawnpathcorner-function-spawnpathcorner-level-ent-src-mq3-game-movers-ml-1150615781"></a>
### spawnPathCorner

```ml
function spawnPathCorner(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L323)

<a id="function-function-mq3-game-movers-spawnpendulum-function-spawnpendulum-level-ent-src-mq3-game-movers-ml-99858505"></a>
### spawnPendulum

```ml
function spawnPendulum(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L312)

<a id="function-function-mq3-game-movers-spawnplat-function-spawnplat-level-ent-src-mq3-game-movers-ml-1605394715"></a>
### spawnPlat

```ml
function spawnPlat(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L230)

<a id="function-function-mq3-game-movers-spawnplattrigger-function-spawnplattrigger-level-ent-src-mq3-game-movers-ml-1975672715"></a>
### spawnPlatTrigger

```ml
function spawnPlatTrigger(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L221)

<a id="function-function-mq3-game-movers-spawnrotating-function-spawnrotating-level-ent-src-mq3-game-movers-ml-1750764685"></a>
### spawnRotating

```ml
function spawnRotating(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L300)

<a id="function-function-mq3-game-movers-spawnstatic-function-spawnstatic-level-ent-src-mq3-game-movers-ml-2106763473"></a>
### spawnStatic

```ml
function spawnStatic(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L297)

<a id="function-function-mq3-game-movers-spawntrain-function-spawntrain-level-ent-src-mq3-game-movers-ml-465963579"></a>
### spawnTrain

```ml
function spawnTrain(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L287)

<a id="constant-constant-mq3-game-movers-svf-use-current-origin-const-svf-use-current-origin-128-src-mq3-game-movers-ml-1774452552"></a>
### SVF_USE_CURRENT_ORIGIN

```ml
const SVF_USE_CURRENT_ORIGIN = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L30)

<a id="function-function-mq3-game-movers-testentityposition-function-testentityposition-level-ent-src-mq3-game-movers-ml-27744615"></a>
### testEntityPosition

```ml
function testEntityPosition(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L375)

<a id="function-function-mq3-game-movers-thinkmatchteam-function-thinkmatchteam-level-ent-src-mq3-game-movers-ml-794975891"></a>
### thinkMatchTeam

```ml
function thinkMatchTeam(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L168)

<a id="function-function-mq3-game-movers-touchbutton-function-touchbutton-level-ent-other-trace-src-mq3-game-movers-ml-767379086"></a>
### touchButton

```ml
function touchButton(level, ent, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L241)

<a id="function-function-mq3-game-movers-touchdoortrigger-function-touchdoortrigger-level-ent-other-trace-src-mq3-game-movers-ml-119485512"></a>
### touchDoorTrigger

```ml
function touchDoorTrigger(level, ent, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L152)

<a id="function-function-mq3-game-movers-touchplat-function-touchplat-level-ent-other-trace-src-mq3-game-movers-ml-1775867480"></a>
### touchPlat

```ml
function touchPlat(level, ent, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L213)

<a id="function-function-mq3-game-movers-touchplattrigger-function-touchplattrigger-level-ent-other-trace-src-mq3-game-movers-ml-934353128"></a>
### touchPlatTrigger

```ml
function touchPlatTrigger(level, ent, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L217)

<a id="function-function-mq3-game-movers-transposematrix-function-transposematrix-matrix-src-mq3-game-movers-ml-1009330493"></a>
### transposeMatrix

```ml
function transposeMatrix(matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L390)

<a id="function-function-mq3-game-movers-trypush-function-trypush-level-check-pusher-move-anglemove-src-mq3-game-movers-ml-653254772"></a>
### tryPush

```ml
function tryPush(level, check, pusher, move, angleMove)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `check` | `dynamic` | — |  |
| `pusher` | `dynamic` | — |  |
| `move` | `dynamic` | — |  |
| `angleMove` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L426)

<a id="function-function-mq3-game-movers-trypushingproxmine-function-trypushingproxmine-level-check-pusher-move-anglemove-src-mq3-game-movers-ml-1216677654"></a>
### tryPushingProxMine

```ml
function tryPushingProxMine(level, check, pusher, move, angleMove)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `check` | `dynamic` | — |  |
| `pusher` | `dynamic` | — |  |
| `move` | `dynamic` | — |  |
| `angleMove` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L405)

<a id="function-function-mq3-game-movers-usebinary-function-usebinary-level-ent-other-activator-src-mq3-game-movers-ml-2026124606"></a>
### useBinary

```ml
function useBinary(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/movers.ml#L97)
