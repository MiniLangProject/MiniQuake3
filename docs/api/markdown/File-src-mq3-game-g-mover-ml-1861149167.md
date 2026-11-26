# `src/mq3/game/g_mover.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_mover`](Package-mq3-game-g-mover-2018167381.md)

Reachable from entry: **no**

## Imports

- `mq3/game/movers.ml` as `moverKernel` → [src/mq3/game/movers.ml](File-src-mq3-game-movers-ml-1935580466.md)

## Declarations

<a id="function-function-mq3-game-g-mover-blocked-door-function-blocked-door-level-ent-other-src-mq3-game-g-mover-ml-1204634541"></a>
### Blocked_Door

```ml
function Blocked_Door(level, ent, other)
```

Forward `Blocked_Door` to `mq3.game.movers.blockedDoor` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `damage` and `spawnflags`. |
| `other` | `dynamic` | — | Other record; accesses `client`, `s` and `item`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L100)

<a id="function-function-mq3-game-g-mover-dispatch-function-dispatch-level-ent-src-mq3-game-g-mover-ml-858598263"></a>
### dispatch

```ml
function dispatch(level, ent)
```

Forward `dispatch` to `mq3.game.movers.dispatch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `classname`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L195)

<a id="function-function-mq3-game-g-mover-g-checkproxmineposition-function-g-checkproxmineposition-level-check-src-mq3-game-g-mover-ml-657041586"></a>
### G_CheckProxMinePosition

```ml
function G_CheckProxMinePosition(level, check)
```

Forward `G_CheckProxMinePosition` to `mq3.game.movers.checkProxMinePosition` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `check` | `dynamic` | — | Check record; accesses `s` and `movedir`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L35)

<a id="function-function-mq3-game-g-mover-g-createrotationmatrix-function-g-createrotationmatrix-angles-src-mq3-game-g-mover-ml-1414496122"></a>
### G_CreateRotationMatrix

```ml
function G_CreateRotationMatrix(angles)
```

Forward `G_CreateRotationMatrix` to `mq3.game.movers.createRotationMatrix` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L14)

<a id="function-function-mq3-game-g-mover-g-moverpush-function-g-moverpush-level-pusher-move-amove-src-mq3-game-g-mover-ml-1660023486"></a>
### G_MoverPush

```ml
function G_MoverPush(level, pusher, move, amove)
```

Apply `mq3.game.movers.pushPart` and `mq3.game.movers.restorePush` while evaluating `G_MoverPush`. Return paths include `[result[0],result[1]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `entities`. |
| `pusher` | `dynamic` | — | Pusher record; accesses `r` and `s`. May update `pusher.r.currentOrigin` and `pusher.r.currentAngles` in place. |
| `move` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `amove` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L48)

<a id="function-function-mq3-game-g-mover-g-moverteam-function-g-moverteam-level-ent-src-mq3-game-g-mover-ml-1872006011"></a>
### G_MoverTeam

```ml
function G_MoverTeam(level, ent)
```

Forward `G_MoverTeam` to `mq3.game.movers.moveTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Leader record; accesses `blocked`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L61)

<a id="function-function-mq3-game-g-mover-g-rotatepoint-function-g-rotatepoint-point-matrix-src-mq3-game-g-mover-ml-1384049559"></a>
### G_RotatePoint

```ml
function G_RotatePoint(point, matrix)
```

Forward `G_RotatePoint` to `mq3.game.movers.rotatePoint` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `matrix` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L21)

<a id="function-function-mq3-game-g-mover-g-runmover-function-g-runmover-level-ent-src-mq3-game-g-mover-ml-1499029447"></a>
### G_RunMover

```ml
function G_RunMover(level, ent)
```

Forward `G_RunMover` to `mq3.game.movers.run` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `flags` and `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L65)

<a id="function-function-mq3-game-g-mover-g-testentityposition-function-g-testentityposition-level-ent-src-mq3-game-g-mover-ml-483298159"></a>
### G_TestEntityPosition

```ml
function G_TestEntityPosition(level, ent)
```

Forward `G_TestEntityPosition` to `mq3.game.movers.testEntityPosition` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `client`, `clipmask` and `r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L11)

<a id="function-function-mq3-game-g-mover-g-transposematrix-function-g-transposematrix-matrix-src-mq3-game-g-mover-ml-1258273005"></a>
### G_TransposeMatrix

```ml
function G_TransposeMatrix(matrix)
```

Forward `G_TransposeMatrix` to `mq3.game.movers.transposeMatrix` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L17)

<a id="function-function-mq3-game-g-mover-g-trypushingentity-function-g-trypushingentity-level-check-pusher-move-amove-src-mq3-game-g-mover-ml-1413660946"></a>
### G_TryPushingEntity

```ml
function G_TryPushingEntity(level, check, pusher, move, amove)
```

Apply `mq3.game.movers.tryPush` while evaluating `G_TryPushingEntity`. Return paths include `result[0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `entities`. |
| `check` | `dynamic` | — | Check record; accesses `s`, `client` and `r`. May update `check.s.pos.trBase[axis]`, `check.client.ps.origin[axis]` and `check.client.ps.delta_angles[1]` and additional fields in place. |
| `pusher` | `dynamic` | — | Pusher record; accesses `s` and `r`. |
| `move` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `amove` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L28)

<a id="function-function-mq3-game-g-mover-g-trypushingproxmine-function-g-trypushingproxmine-level-check-pusher-move-amove-src-mq3-game-g-mover-ml-1725175798"></a>
### G_TryPushingProxMine

```ml
function G_TryPushingProxMine(level, check, pusher, move, amove)
```

Forward `G_TryPushingProxMine` to `mq3.game.movers.tryPushingProxMine` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `check` | `dynamic` | — | Check record; accesses `s` and `r`. May update `check.s.pos.trBase[axis]` and `check.r.currentOrigin` in place. |
| `pusher` | `dynamic` | — | Pusher record; accesses `r`. |
| `move` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `amove` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L42)

<a id="function-function-mq3-game-g-mover-initmover-function-initmover-level-ent-src-mq3-game-g-mover-ml-309843085"></a>
### InitMover

```ml
function InitMover(level, ent)
```

Forward `InitMover` to `mq3.game.movers.initMover` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `model2`, `s`, `use`, `reached` and `moverState` and related fields. May update `ent.s.modelindex2`, `ent.s.loopSound` and `ent.s.constantLight` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L95)

<a id="function-function-mq3-game-g-mover-matchteam-function-matchteam-level-leader-state-time-src-mq3-game-g-mover-ml-179352445"></a>
### MatchTeam

```ml
function MatchTeam(level, leader, state, time)
```

Forward `MatchTeam` to `mq3.game.movers.matchTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `leader` | `dynamic` | — | Value used by `matchTeam` in `part = leader`. |
| `state` | `dynamic` | — | Value used by `setMoverState` in `ent.moverState = state`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L77)

<a id="function-function-mq3-game-g-mover-reached-binarymover-function-reached-binarymover-level-ent-src-mq3-game-g-mover-ml-1043475889"></a>
### Reached_BinaryMover

```ml
function Reached_BinaryMover(level, ent)
```

Forward `Reached_BinaryMover` to `mq3.game.movers.reachedBinary` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `soundLoop`, `moverState`, `soundPos2` and `think` and related fields. May update `ent.s.loopSound`, `ent.think` and `ent.nextthink` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L85)

<a id="function-function-mq3-game-g-mover-reached-train-function-reached-train-level-ent-src-mq3-game-g-mover-ml-808815929"></a>
### Reached_Train

```ml
function Reached_Train(level, ent)
```

Forward `Reached_Train` to `mq3.game.movers.reachedTrain` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `nextTrain`, `pos1`, `pos2`, `speed` and `s` and related fields. May update `ent.nextTrain`, `ent.pos1` and `ent.pos2` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L162)

<a id="function-function-mq3-game-g-mover-returntopos1-function-returntopos1-level-ent-src-mq3-game-g-mover-ml-2102009455"></a>
### ReturnToPos1

```ml
function ReturnToPos1(level, ent)
```

Forward `ReturnToPos1` to `mq3.game.movers.returnToPos1` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `soundLoop` and `sound2to1`. May update `ent.s.loopSound` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L81)

<a id="function-function-mq3-game-g-mover-setmoverstate-function-setmoverstate-level-ent-state-time-src-mq3-game-g-mover-ml-2054761055"></a>
### SetMoverState

```ml
function SetMoverState(level, ent, state, time)
```

Forward `SetMoverState` to `mq3.game.movers.setMoverState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `moverState`, `s`, `pos1`, `pos2` and `r`. May update `ent.moverState`, `ent.s.pos.trTime` and `ent.s.pos.trBase` and additional fields in place. |
| `state` | `dynamic` | — | Value used by `setMoverState` in `ent.moverState = state`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L71)

<a id="function-function-mq3-game-g-mover-sp-func-bobbing-function-sp-func-bobbing-level-ent-src-mq3-game-g-mover-ml-144961231"></a>
### SP_func_bobbing

```ml
function SP_func_bobbing(level, ent)
```

Forward `SP_func_bobbing` to `mq3.game.movers.spawnBobbing` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `speed`, `damage`, `model`, `s` and `r` and related fields. May update `ent.speed`, `ent.damage` and `ent.s.pos.trBase` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L186)

<a id="function-function-mq3-game-g-mover-sp-func-button-function-sp-func-button-level-ent-src-mq3-game-g-mover-ml-324118455"></a>
### SP_func_button

```ml
function SP_func_button(level, ent)
```

Forward `SP_func_button` to `mq3.game.movers.spawnButton` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `sound1to2`, `speed`, `wait`, `pos1` and `s` and related fields. May update `ent.sound1to2`, `ent.speed` and `ent.wait` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L154)

<a id="function-function-mq3-game-g-mover-sp-func-door-function-sp-func-door-level-ent-src-mq3-game-g-mover-ml-1336730827"></a>
### SP_func_door

```ml
function SP_func_door(level, ent)
```

Forward `SP_func_door` to `mq3.game.movers.spawnDoor` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `sound1to2`, `sound2to1`, `soundPos1`, `soundPos2` and `blocked` and related fields. May update `ent.sound1to2`, `ent.sound2to1` and `ent.soundPos1` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L124)

<a id="function-function-mq3-game-g-mover-sp-func-pendulum-function-sp-func-pendulum-level-ent-src-mq3-game-g-mover-ml-1705513711"></a>
### SP_func_pendulum

```ml
function SP_func_pendulum(level, ent)
```

Forward `SP_func_pendulum` to `mq3.game.movers.spawnPendulum` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `damage`, `model`, `r` and `s`. May update `ent.damage`, `ent.s.pos.trDuration` and `ent.s.pos.trBase` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L190)

<a id="function-function-mq3-game-g-mover-sp-func-plat-function-sp-func-plat-level-ent-src-mq3-game-g-mover-ml-38616079"></a>
### SP_func_plat

```ml
function SP_func_plat(level, ent)
```

Forward `SP_func_plat` to `mq3.game.movers.spawnPlat` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `sound1to2`, `sound2to1`, `soundPos1`, `soundPos2` and `s` and related fields. May update `ent.sound1to2`, `ent.sound2to1` and `ent.soundPos1` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L144)

<a id="function-function-mq3-game-g-mover-sp-func-rotating-function-sp-func-rotating-level-ent-src-mq3-game-g-mover-ml-1093274111"></a>
### SP_func_rotating

```ml
function SP_func_rotating(level, ent)
```

Forward `SP_func_rotating` to `mq3.game.movers.spawnRotating` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `speed`, `damage`, `s`, `spawnflags` and `model` and related fields. May update `ent.speed`, `ent.damage` and `ent.s.apos.trType` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L182)

<a id="function-function-mq3-game-g-mover-sp-func-static-function-sp-func-static-level-ent-src-mq3-game-g-mover-ml-212347083"></a>
### SP_func_static

```ml
function SP_func_static(level, ent)
```

Forward `SP_func_static` to `mq3.game.movers.spawnStatic` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `model`, `s` and `r`. May update `ent.s.pos.trBase` and `ent.r.currentOrigin` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L178)

<a id="function-function-mq3-game-g-mover-sp-func-train-function-sp-func-train-level-ent-src-mq3-game-g-mover-ml-1226338701"></a>
### SP_func_train

```ml
function SP_func_train(level, ent)
```

Forward `SP_func_train` to `mq3.game.movers.spawnTrain` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `spawnflags`, `damage`, `speed` and `target` and related fields. May update `ent.s.angles`, `ent.damage` and `ent.speed` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L174)

<a id="function-function-mq3-game-g-mover-sp-path-corner-function-sp-path-corner-level-ent-src-mq3-game-g-mover-ml-682182347"></a>
### SP_path_corner

```ml
function SP_path_corner(level, ent)
```

Forward `SP_path_corner` to `mq3.game.movers.spawnPathCorner` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `targetname` and `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L170)

<a id="function-function-mq3-game-g-mover-spawnplattrigger-function-spawnplattrigger-level-ent-src-mq3-game-g-mover-ml-1429540767"></a>
### SpawnPlatTrigger

```ml
function SpawnPlatTrigger(level, ent)
```

Forward `SpawnPlatTrigger` to `mq3.game.movers.spawnPlatTrigger` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities`, `entities`, `startTime` and `time`. May update `level.num_entities` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `pos1` and `r`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L140)

<a id="function-function-mq3-game-g-mover-think-beginmoving-function-think-beginmoving-level-ent-src-mq3-game-g-mover-ml-288712247"></a>
### Think_BeginMoving

```ml
function Think_BeginMoving(level, ent)
```

Forward `Think_BeginMoving` to `mq3.game.movers.beginMoving` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. May update `ent.s.pos.trTime` and `ent.s.pos.trType` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L158)

<a id="function-function-mq3-game-g-mover-think-matchteam-function-think-matchteam-level-ent-src-mq3-game-g-mover-ml-176063361"></a>
### Think_MatchTeam

```ml
function Think_MatchTeam(level, ent)
```

Forward `Think_MatchTeam` to `mq3.game.movers.thinkMatchTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `moverState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L120)

<a id="function-function-mq3-game-g-mover-think-setuptraintargets-function-think-setuptraintargets-level-ent-src-mq3-game-g-mover-ml-700290955"></a>
### Think_SetupTrainTargets

```ml
function Think_SetupTrainTargets(level, ent)
```

Forward `Think_SetupTrainTargets` to `mq3.game.movers.setupTrain` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `nextTrain`, `target` and `r`. May update `ent.nextTrain` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L166)

<a id="function-function-mq3-game-g-mover-think-spawnnewdoortrigger-function-think-spawnnewdoortrigger-level-ent-src-mq3-game-g-mover-ml-1571867131"></a>
### Think_SpawnNewDoorTrigger

```ml
function Think_SpawnNewDoorTrigger(level, ent)
```

Forward `Think_SpawnNewDoorTrigger` to `mq3.game.movers.spawnDoorTrigger` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `r` and `moverState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L116)

<a id="function-function-mq3-game-g-mover-touch-button-function-touch-button-level-ent-other-trace-src-mq3-game-g-mover-ml-1688423698"></a>
### Touch_Button

```ml
function Touch_Button(level, ent, other, trace)
```

Forward `Touch_Button` to `mq3.game.movers.touchButton` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `moverState`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `trace` | `dynamic` | — | Value passed as argument 4 to `mq3.game.movers.touchButton`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L150)

<a id="function-function-mq3-game-g-mover-touch-doortrigger-function-touch-doortrigger-level-ent-other-trace-src-mq3-game-g-mover-ml-672627494"></a>
### Touch_DoorTrigger

```ml
function Touch_DoorTrigger(level, ent, other, trace)
```

Forward `Touch_DoorTrigger` to `mq3.game.movers.touchDoorTrigger` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `parent`, `count` and `r`. |
| `other` | `dynamic` | — | Other record; accesses `client` and `s`. |
| `trace` | `dynamic` | — | Value passed as argument 4 to `mq3.game.movers.touchDoorTrigger`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L112)

<a id="function-function-mq3-game-g-mover-touch-doortriggerspectator-function-touch-doortriggerspectator-level-ent-other-trace-src-mq3-game-g-mover-ml-1927512254"></a>
### Touch_DoorTriggerSpectator

```ml
function Touch_DoorTriggerSpectator(level, ent, other, trace)
```

Forward `Touch_DoorTriggerSpectator` to `mq3.game.movers.touchDoorTrigger` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `parent`, `count` and `r`. |
| `other` | `dynamic` | — | Other record; accesses `client` and `s`. |
| `trace` | `dynamic` | — | Value passed as argument 4 to `mq3.game.movers.touchDoorTrigger`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L106)

<a id="function-function-mq3-game-g-mover-touch-plat-function-touch-plat-level-ent-other-trace-src-mq3-game-g-mover-ml-479484046"></a>
### Touch_Plat

```ml
function Touch_Plat(level, ent, other, trace)
```

Forward `Touch_Plat` to `mq3.game.movers.touchPlat` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `moverState` and `nextthink`. May update `ent.nextthink` in place. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `trace` | `dynamic` | — | Value passed as argument 4 to `mq3.game.movers.touchPlat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L130)

<a id="function-function-mq3-game-g-mover-touch-platcentertrigger-function-touch-platcentertrigger-level-ent-other-trace-src-mq3-game-g-mover-ml-1747658982"></a>
### Touch_PlatCenterTrigger

```ml
function Touch_PlatCenterTrigger(level, ent, other, trace)
```

Forward `Touch_PlatCenterTrigger` to `mq3.game.movers.touchPlatTrigger` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `parent`. |
| `other` | `dynamic` | — | Other record; accesses `client`. |
| `trace` | `dynamic` | — | Value passed as argument 4 to `mq3.game.movers.touchPlatTrigger`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L136)

<a id="function-function-mq3-game-g-mover-use-binarymover-function-use-binarymover-level-ent-other-activator-src-mq3-game-g-mover-ml-532793408"></a>
### Use_BinaryMover

```ml
function Use_BinaryMover(level, ent, other, activator)
```

Forward `Use_BinaryMover` to `mq3.game.movers.useBinary` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `flags`, `teammaster`, `activator`, `moverState` and `sound1to2` and related fields. May update `ent.activator`, `ent.s.loopSound` and `ent.nextthink` in place. |
| `other` | `dynamic` | — | Value passed as argument 3 to `mq3.game.movers.useBinary`. |
| `activator` | `dynamic` | — | Entity responsible for activating the target. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L91)
