# `src/mq3/game/bg_pmove_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bg_pmove_runtime`](Package-mq3-game-bg-pmove-runtime-303399108.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/pmove.ml` as `pm` → [src/mq3/game/pmove.ml](File-src-mq3-game-pmove-ml-1046301421.md)

## Declarations

<a id="function-function-mq3-game-bg-pmove-runtime-pm-accelerate-function-pm-accelerate-p-wishdir-wishspeed-accel-src-mq3-game-bg-pmove-runtime-ml-1214956394"></a>
### PM_Accelerate

```ml
function PM_Accelerate(p, wishdir, wishspeed, accel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `wishdir` | `dynamic` | — |  |
| `wishspeed` | `dynamic` | — |  |
| `accel` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L10)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-addevent-function-pm-addevent-p-event-src-mq3-game-bg-pmove-runtime-ml-88285610"></a>
### PM_AddEvent

```ml
function PM_AddEvent(p, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L11)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-addtouchent-function-pm-addtouchent-p-entity-src-mq3-game-bg-pmove-runtime-ml-691690887"></a>
### PM_AddTouchEnt

```ml
function PM_AddTouchEnt(p, entity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L12)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-airmove-function-pm-airmove-p-src-mq3-game-bg-pmove-runtime-ml-1876983892"></a>
### PM_AirMove

```ml
function PM_AirMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L13)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-animate-function-pm-animate-p-src-mq3-game-bg-pmove-runtime-ml-379713420"></a>
### PM_Animate

```ml
function PM_Animate(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L14)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-beginweaponchange-function-pm-beginweaponchange-p-weapon-src-mq3-game-bg-pmove-runtime-ml-2110242784"></a>
### PM_BeginWeaponChange

```ml
function PM_BeginWeaponChange(p, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L15)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-checkduck-function-pm-checkduck-p-src-mq3-game-bg-pmove-runtime-ml-1910531056"></a>
### PM_CheckDuck

```ml
function PM_CheckDuck(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L16)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-checkjump-function-pm-checkjump-p-src-mq3-game-bg-pmove-runtime-ml-466674536"></a>
### PM_CheckJump

```ml
function PM_CheckJump(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L17)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-checkstuck-function-pm-checkstuck-p-src-mq3-game-bg-pmove-runtime-ml-1123913604"></a>
### PM_CheckStuck

```ml
function PM_CheckStuck(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L18)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-checkwaterjump-function-pm-checkwaterjump-p-src-mq3-game-bg-pmove-runtime-ml-894652054"></a>
### PM_CheckWaterJump

```ml
function PM_CheckWaterJump(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L19)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-clipvelocity-function-pm-clipvelocity-velocity-normal-overbounce-src-mq3-game-bg-pmove-runtime-ml-1080284956"></a>
### PM_ClipVelocity

```ml
function PM_ClipVelocity(velocity, normal, overbounce)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `velocity` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `overbounce` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L20)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-cmdscale-function-pm-cmdscale-p-src-mq3-game-bg-pmove-runtime-ml-731276920"></a>
### PM_CmdScale

```ml
function PM_CmdScale(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L21)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-continuelegsanim-function-pm-continuelegsanim-p-anim-src-mq3-game-bg-pmove-runtime-ml-1396286247"></a>
### PM_ContinueLegsAnim

```ml
function PM_ContinueLegsAnim(p, anim)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L22)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-continuetorsoanim-function-pm-continuetorsoanim-p-anim-src-mq3-game-bg-pmove-runtime-ml-1720460565"></a>
### PM_ContinueTorsoAnim

```ml
function PM_ContinueTorsoAnim(p, anim)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L23)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-correctallsolid-function-pm-correctallsolid-p-src-mq3-game-bg-pmove-runtime-ml-885976740"></a>
### PM_CorrectAllSolid

```ml
function PM_CorrectAllSolid(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L24)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-crashland-function-pm-crashland-p-src-mq3-game-bg-pmove-runtime-ml-1663649496"></a>
### PM_CrashLand

```ml
function PM_CrashLand(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L25)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-deadmove-function-pm-deadmove-p-src-mq3-game-bg-pmove-runtime-ml-235606110"></a>
### PM_DeadMove

```ml
function PM_DeadMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L26)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-droptimers-function-pm-droptimers-p-src-mq3-game-bg-pmove-runtime-ml-601586882"></a>
### PM_DropTimers

```ml
function PM_DropTimers(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L27)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-finishweaponchange-function-pm-finishweaponchange-p-src-mq3-game-bg-pmove-runtime-ml-260644922"></a>
### PM_FinishWeaponChange

```ml
function PM_FinishWeaponChange(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L28)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-flymove-function-pm-flymove-p-src-mq3-game-bg-pmove-runtime-ml-1242406420"></a>
### PM_FlyMove

```ml
function PM_FlyMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L29)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-footstepforsurface-function-pm-footstepforsurface-p-src-mq3-game-bg-pmove-runtime-ml-26107432"></a>
### PM_FootstepForSurface

```ml
function PM_FootstepForSurface(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L30)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-footsteps-function-pm-footsteps-p-src-mq3-game-bg-pmove-runtime-ml-1316416260"></a>
### PM_Footsteps

```ml
function PM_Footsteps(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L31)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-forcelegsanim-function-pm-forcelegsanim-p-anim-src-mq3-game-bg-pmove-runtime-ml-1899271681"></a>
### PM_ForceLegsAnim

```ml
function PM_ForceLegsAnim(p, anim)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L32)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-friction-function-pm-friction-p-src-mq3-game-bg-pmove-runtime-ml-998731080"></a>
### PM_Friction

```ml
function PM_Friction(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L33)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-grapplemove-function-pm-grapplemove-p-src-mq3-game-bg-pmove-runtime-ml-648937144"></a>
### PM_GrappleMove

```ml
function PM_GrappleMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L34)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-groundtrace-function-pm-groundtrace-p-src-mq3-game-bg-pmove-runtime-ml-2130385928"></a>
### PM_GroundTrace

```ml
function PM_GroundTrace(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L35)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-groundtracemissed-function-pm-groundtracemissed-p-src-mq3-game-bg-pmove-runtime-ml-296387956"></a>
### PM_GroundTraceMissed

```ml
function PM_GroundTraceMissed(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L36)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-invulnerabilitymove-function-pm-invulnerabilitymove-p-src-mq3-game-bg-pmove-runtime-ml-1228214736"></a>
### PM_InvulnerabilityMove

```ml
function PM_InvulnerabilityMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L37)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-noclipmove-function-pm-noclipmove-p-src-mq3-game-bg-pmove-runtime-ml-571677768"></a>
### PM_NoclipMove

```ml
function PM_NoclipMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L38)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-setmovementdir-function-pm-setmovementdir-p-src-mq3-game-bg-pmove-runtime-ml-1165552064"></a>
### PM_SetMovementDir

```ml
function PM_SetMovementDir(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L39)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-setwaterlevel-function-pm-setwaterlevel-p-src-mq3-game-bg-pmove-runtime-ml-1091632992"></a>
### PM_SetWaterLevel

```ml
function PM_SetWaterLevel(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L40)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-startlegsanim-function-pm-startlegsanim-p-anim-src-mq3-game-bg-pmove-runtime-ml-1043046521"></a>
### PM_StartLegsAnim

```ml
function PM_StartLegsAnim(p, anim)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L41)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-starttorsoanim-function-pm-starttorsoanim-p-anim-src-mq3-game-bg-pmove-runtime-ml-1295912613"></a>
### PM_StartTorsoAnim

```ml
function PM_StartTorsoAnim(p, anim)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L42)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-torsoanimation-function-pm-torsoanimation-p-src-mq3-game-bg-pmove-runtime-ml-684156934"></a>
### PM_TorsoAnimation

```ml
function PM_TorsoAnimation(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L43)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-updateviewangles-function-pm-updateviewangles-ps-cmd-src-mq3-game-bg-pmove-runtime-ml-1160475279"></a>
### PM_UpdateViewAngles

```ml
function PM_UpdateViewAngles(ps, cmd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L44)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-walkmove-function-pm-walkmove-p-src-mq3-game-bg-pmove-runtime-ml-905450764"></a>
### PM_WalkMove

```ml
function PM_WalkMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L45)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-waterevents-function-pm-waterevents-p-src-mq3-game-bg-pmove-runtime-ml-1523993656"></a>
### PM_WaterEvents

```ml
function PM_WaterEvents(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L46)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-waterjumpmove-function-pm-waterjumpmove-p-src-mq3-game-bg-pmove-runtime-ml-835447208"></a>
### PM_WaterJumpMove

```ml
function PM_WaterJumpMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L47)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-watermove-function-pm-watermove-p-src-mq3-game-bg-pmove-runtime-ml-1299014504"></a>
### PM_WaterMove

```ml
function PM_WaterMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L48)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-weapon-function-pm-weapon-p-src-mq3-game-bg-pmove-runtime-ml-310356992"></a>
### PM_Weapon

```ml
function PM_Weapon(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L49)

<a id="function-function-mq3-game-bg-pmove-runtime-pmove-function-pmove-p-src-mq3-game-bg-pmove-runtime-ml-906837270"></a>
### Pmove

```ml
function Pmove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L50)

<a id="function-function-mq3-game-bg-pmove-runtime-pmovesingle-function-pmovesingle-p-src-mq3-game-bg-pmove-runtime-ml-236519206"></a>
### PmoveSingle

```ml
function PmoveSingle(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L51)

<a id="function-function-mq3-game-bg-pmove-runtime-sqrt-function-sqrt-value-src-mq3-game-bg-pmove-runtime-ml-565612653"></a>
### sqrt

```ml
function sqrt(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_pmove_runtime.ml#L52)
