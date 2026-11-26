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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L36)

<a id="function-function-mq3-game-g-mover-dispatch-function-dispatch-level-ent-src-mq3-game-g-mover-ml-858598263"></a>
### dispatch

```ml
function dispatch(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L58)

<a id="function-function-mq3-game-g-mover-g-checkproxmineposition-function-g-checkproxmineposition-level-check-src-mq3-game-g-mover-ml-657041586"></a>
### G_CheckProxMinePosition

```ml
function G_CheckProxMinePosition(level, check)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `check` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L16)

<a id="function-function-mq3-game-g-mover-g-createrotationmatrix-function-g-createrotationmatrix-angles-src-mq3-game-g-mover-ml-1414496122"></a>
### G_CreateRotationMatrix

```ml
function G_CreateRotationMatrix(angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L9)

<a id="function-function-mq3-game-g-mover-g-moverpush-function-g-moverpush-level-pusher-move-amove-src-mq3-game-g-mover-ml-1660023486"></a>
### G_MoverPush

```ml
function G_MoverPush(level, pusher, move, amove)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `pusher` | `dynamic` | — |  |
| `move` | `dynamic` | — |  |
| `amove` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L18)

<a id="function-function-mq3-game-g-mover-g-moverteam-function-g-moverteam-level-ent-src-mq3-game-g-mover-ml-1872006011"></a>
### G_MoverTeam

```ml
function G_MoverTeam(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L28)

<a id="function-function-mq3-game-g-mover-g-rotatepoint-function-g-rotatepoint-point-matrix-src-mq3-game-g-mover-ml-1384049559"></a>
### G_RotatePoint

```ml
function G_RotatePoint(point, matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L11)

<a id="function-function-mq3-game-g-mover-g-runmover-function-g-runmover-level-ent-src-mq3-game-g-mover-ml-1499029447"></a>
### G_RunMover

```ml
function G_RunMover(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L29)

<a id="function-function-mq3-game-g-mover-g-testentityposition-function-g-testentityposition-level-ent-src-mq3-game-g-mover-ml-483298159"></a>
### G_TestEntityPosition

```ml
function G_TestEntityPosition(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L8)

<a id="function-function-mq3-game-g-mover-g-transposematrix-function-g-transposematrix-matrix-src-mq3-game-g-mover-ml-1258273005"></a>
### G_TransposeMatrix

```ml
function G_TransposeMatrix(matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L10)

<a id="function-function-mq3-game-g-mover-g-trypushingentity-function-g-trypushingentity-level-check-pusher-move-amove-src-mq3-game-g-mover-ml-1413660946"></a>
### G_TryPushingEntity

```ml
function G_TryPushingEntity(level, check, pusher, move, amove)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `check` | `dynamic` | — |  |
| `pusher` | `dynamic` | — |  |
| `move` | `dynamic` | — |  |
| `amove` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L12)

<a id="function-function-mq3-game-g-mover-g-trypushingproxmine-function-g-trypushingproxmine-level-check-pusher-move-amove-src-mq3-game-g-mover-ml-1725175798"></a>
### G_TryPushingProxMine

```ml
function G_TryPushingProxMine(level, check, pusher, move, amove)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `check` | `dynamic` | — |  |
| `pusher` | `dynamic` | — |  |
| `move` | `dynamic` | — |  |
| `amove` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L17)

<a id="function-function-mq3-game-g-mover-initmover-function-initmover-level-ent-src-mq3-game-g-mover-ml-309843085"></a>
### InitMover

```ml
function InitMover(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L35)

<a id="function-function-mq3-game-g-mover-matchteam-function-matchteam-level-leader-state-time-src-mq3-game-g-mover-ml-179352445"></a>
### MatchTeam

```ml
function MatchTeam(level, leader, state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `leader` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L31)

<a id="function-function-mq3-game-g-mover-reached-binarymover-function-reached-binarymover-level-ent-src-mq3-game-g-mover-ml-1043475889"></a>
### Reached_BinaryMover

```ml
function Reached_BinaryMover(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L33)

<a id="function-function-mq3-game-g-mover-reached-train-function-reached-train-level-ent-src-mq3-game-g-mover-ml-808815929"></a>
### Reached_Train

```ml
function Reached_Train(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L49)

<a id="function-function-mq3-game-g-mover-returntopos1-function-returntopos1-level-ent-src-mq3-game-g-mover-ml-2102009455"></a>
### ReturnToPos1

```ml
function ReturnToPos1(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L32)

<a id="function-function-mq3-game-g-mover-setmoverstate-function-setmoverstate-level-ent-state-time-src-mq3-game-g-mover-ml-2054761055"></a>
### SetMoverState

```ml
function SetMoverState(level, ent, state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L30)

<a id="function-function-mq3-game-g-mover-sp-func-bobbing-function-sp-func-bobbing-level-ent-src-mq3-game-g-mover-ml-144961231"></a>
### SP_func_bobbing

```ml
function SP_func_bobbing(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L55)

<a id="function-function-mq3-game-g-mover-sp-func-button-function-sp-func-button-level-ent-src-mq3-game-g-mover-ml-324118455"></a>
### SP_func_button

```ml
function SP_func_button(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L47)

<a id="function-function-mq3-game-g-mover-sp-func-door-function-sp-func-door-level-ent-src-mq3-game-g-mover-ml-1336730827"></a>
### SP_func_door

```ml
function SP_func_door(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L41)

<a id="function-function-mq3-game-g-mover-sp-func-pendulum-function-sp-func-pendulum-level-ent-src-mq3-game-g-mover-ml-1705513711"></a>
### SP_func_pendulum

```ml
function SP_func_pendulum(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L56)

<a id="function-function-mq3-game-g-mover-sp-func-plat-function-sp-func-plat-level-ent-src-mq3-game-g-mover-ml-38616079"></a>
### SP_func_plat

```ml
function SP_func_plat(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L45)

<a id="function-function-mq3-game-g-mover-sp-func-rotating-function-sp-func-rotating-level-ent-src-mq3-game-g-mover-ml-1093274111"></a>
### SP_func_rotating

```ml
function SP_func_rotating(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L54)

<a id="function-function-mq3-game-g-mover-sp-func-static-function-sp-func-static-level-ent-src-mq3-game-g-mover-ml-212347083"></a>
### SP_func_static

```ml
function SP_func_static(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L53)

<a id="function-function-mq3-game-g-mover-sp-func-train-function-sp-func-train-level-ent-src-mq3-game-g-mover-ml-1226338701"></a>
### SP_func_train

```ml
function SP_func_train(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L52)

<a id="function-function-mq3-game-g-mover-sp-path-corner-function-sp-path-corner-level-ent-src-mq3-game-g-mover-ml-682182347"></a>
### SP_path_corner

```ml
function SP_path_corner(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L51)

<a id="function-function-mq3-game-g-mover-spawnplattrigger-function-spawnplattrigger-level-ent-src-mq3-game-g-mover-ml-1429540767"></a>
### SpawnPlatTrigger

```ml
function SpawnPlatTrigger(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L44)

<a id="function-function-mq3-game-g-mover-think-beginmoving-function-think-beginmoving-level-ent-src-mq3-game-g-mover-ml-288712247"></a>
### Think_BeginMoving

```ml
function Think_BeginMoving(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L48)

<a id="function-function-mq3-game-g-mover-think-matchteam-function-think-matchteam-level-ent-src-mq3-game-g-mover-ml-176063361"></a>
### Think_MatchTeam

```ml
function Think_MatchTeam(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L40)

<a id="function-function-mq3-game-g-mover-think-setuptraintargets-function-think-setuptraintargets-level-ent-src-mq3-game-g-mover-ml-700290955"></a>
### Think_SetupTrainTargets

```ml
function Think_SetupTrainTargets(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L50)

<a id="function-function-mq3-game-g-mover-think-spawnnewdoortrigger-function-think-spawnnewdoortrigger-level-ent-src-mq3-game-g-mover-ml-1571867131"></a>
### Think_SpawnNewDoorTrigger

```ml
function Think_SpawnNewDoorTrigger(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L39)

<a id="function-function-mq3-game-g-mover-touch-button-function-touch-button-level-ent-other-trace-src-mq3-game-g-mover-ml-1688423698"></a>
### Touch_Button

```ml
function Touch_Button(level, ent, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L46)

<a id="function-function-mq3-game-g-mover-touch-doortrigger-function-touch-doortrigger-level-ent-other-trace-src-mq3-game-g-mover-ml-672627494"></a>
### Touch_DoorTrigger

```ml
function Touch_DoorTrigger(level, ent, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L38)

<a id="function-function-mq3-game-g-mover-touch-doortriggerspectator-function-touch-doortriggerspectator-level-ent-other-trace-src-mq3-game-g-mover-ml-1927512254"></a>
### Touch_DoorTriggerSpectator

```ml
function Touch_DoorTriggerSpectator(level, ent, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L37)

<a id="function-function-mq3-game-g-mover-touch-plat-function-touch-plat-level-ent-other-trace-src-mq3-game-g-mover-ml-479484046"></a>
### Touch_Plat

```ml
function Touch_Plat(level, ent, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L42)

<a id="function-function-mq3-game-g-mover-touch-platcentertrigger-function-touch-platcentertrigger-level-ent-other-trace-src-mq3-game-g-mover-ml-1747658982"></a>
### Touch_PlatCenterTrigger

```ml
function Touch_PlatCenterTrigger(level, ent, other, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L43)

<a id="function-function-mq3-game-g-mover-use-binarymover-function-use-binarymover-level-ent-other-activator-src-mq3-game-g-mover-ml-532793408"></a>
### Use_BinaryMover

```ml
function Use_BinaryMover(level, ent, other, activator)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `activator` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_mover.ml#L34)
