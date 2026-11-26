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

Forward `PM_Accelerate` to `mq3.game.pmove.accelerate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`. |
| `wishdir` | `dynamic` | — | Value passed as argument 2 to `mq3.shared.math.DotProduct`. |
| `wishspeed` | `dynamic` | — | Requested movement speed. |
| `accel` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L15)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-addevent-function-pm-addevent-p-event-src-mq3-game-bg-pmove-runtime-ml-88285610"></a>
### PM_AddEvent

```ml
function PM_AddEvent(p, event)
```

Forward `PM_AddEvent` to `mq3.game.pmove.addEvent` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. May update `p.ps.events[slot]`, `p.ps.eventParms[slot]` and `p.ps.eventSequence` in place. |
| `event` | `dynamic` | — | Player or entity event identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L19)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-addtouchent-function-pm-addtouchent-p-entity-src-mq3-game-bg-pmove-runtime-ml-691690887"></a>
### PM_AddTouchEnt

```ml
function PM_AddTouchEnt(p, entity)
```

Forward `PM_AddTouchEnt` to `mq3.game.movement.addTouchEnt` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`. |
| `entity` | `dynamic` | — | Value used by `addTouchEnt` in `if entity == 1022 or len(state.touches) == 32 then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L23)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-airmove-function-pm-airmove-p-src-mq3-game-bg-pmove-runtime-ml-1876983892"></a>
### PM_AirMove

```ml
function PM_AirMove(p)
```

Forward `PM_AirMove` to `mq3.game.pmove.airMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `forward`, `right`, `cmd`, `k` and `ps`. May update `p.forward[2]`, `p.right[2]` and `p.ps.velocity` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L26)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-animate-function-pm-animate-p-src-mq3-game-bg-pmove-runtime-ml-379713420"></a>
### PM_Animate

```ml
function PM_Animate(p)
```

Forward `PM_Animate` to `mq3.game.pmove.animate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `cmd` and `ps`. May update `p.ps.torsoTimer` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L29)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-beginweaponchange-function-pm-beginweaponchange-p-weapon-src-mq3-game-bg-pmove-runtime-ml-2110242784"></a>
### PM_BeginWeaponChange

```ml
function PM_BeginWeaponChange(p, weapon)
```

Forward `PM_BeginWeaponChange` to `mq3.game.pmove.beginWeaponChange` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. May update `p.ps.weaponstate` and `p.ps.weaponTime` in place. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L33)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-checkduck-function-pm-checkduck-p-src-mq3-game-bg-pmove-runtime-ml-1910531056"></a>
### PM_CheckDuck

```ml
function PM_CheckDuck(p)
```

Forward `PM_CheckDuck` to `mq3.game.pmove.checkDuck` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `k`, `cmd` and `traceFn`. May update `p.k.mins`, `p.k.maxs` and `p.ps.pm_flags` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L36)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-checkjump-function-pm-checkjump-p-src-mq3-game-bg-pmove-runtime-ml-466674536"></a>
### PM_CheckJump

```ml
function PM_CheckJump(p)
```

Forward `PM_CheckJump` to `mq3.game.pmove.checkJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `cmd` and `k`. May update `p.cmd.upmove`, `p.k.groundPlane` and `p.k.walking` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L39)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-checkstuck-function-pm-checkstuck-p-src-mq3-game-bg-pmove-runtime-ml-1123913604"></a>
### PM_CheckStuck

```ml
function PM_CheckStuck(p)
```

Forward `PM_CheckStuck` to `mq3.game.pmove.checkStuck` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `traceFn` and `ps`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L42)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-checkwaterjump-function-pm-checkwaterjump-p-src-mq3-game-bg-pmove-runtime-ml-894652054"></a>
### PM_CheckWaterJump

```ml
function PM_CheckWaterJump(p)
```

Forward `PM_CheckWaterJump` to `mq3.game.pmove.checkWaterJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `k`, `forward` and `pointFn`. May update `p.ps.velocity`, `p.ps.velocity[2]` and `p.ps.pm_flags` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L45)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-clipvelocity-function-pm-clipvelocity-velocity-normal-overbounce-src-mq3-game-bg-pmove-runtime-ml-1080284956"></a>
### PM_ClipVelocity

```ml
function PM_ClipVelocity(velocity, normal, overbounce)
```

Forward `PM_ClipVelocity` to `mq3.game.movement.clipVelocity` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `normal` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `overbounce` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L50)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-cmdscale-function-pm-cmdscale-p-src-mq3-game-bg-pmove-runtime-ml-731276920"></a>
### PM_CmdScale

```ml
function PM_CmdScale(p)
```

Forward `PM_CmdScale` to `mq3.game.pmove.scale` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`, `ps` and `cmd`. May update `p.k.speed` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L53)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-continuelegsanim-function-pm-continuelegsanim-p-anim-src-mq3-game-bg-pmove-runtime-ml-1396286247"></a>
### PM_ContinueLegsAnim

```ml
function PM_ContinueLegsAnim(p, anim)
```

Forward `PM_ContinueLegsAnim` to `mq3.game.pmove.continueLegs` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. |
| `anim` | `dynamic` | — | Value used by `startLegs` in `p.ps.legsAnim = ((p.ps.legsAnim & 128)^128)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L57)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-continuetorsoanim-function-pm-continuetorsoanim-p-anim-src-mq3-game-bg-pmove-runtime-ml-1720460565"></a>
### PM_ContinueTorsoAnim

```ml
function PM_ContinueTorsoAnim(p, anim)
```

Forward `PM_ContinueTorsoAnim` to `mq3.game.pmove.continueTorso` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. |
| `anim` | `dynamic` | — | Value used by `startTorso` in `p.ps.torsoAnim = ((p.ps.torsoAnim & 128)^128)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L61)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-correctallsolid-function-pm-correctallsolid-p-src-mq3-game-bg-pmove-runtime-ml-885976740"></a>
### PM_CorrectAllSolid

```ml
function PM_CorrectAllSolid(p)
```

Forward `PM_CorrectAllSolid` to `mq3.game.pmove.correctAllSolid` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `traceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L64)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-crashland-function-pm-crashland-p-src-mq3-game-bg-pmove-runtime-ml-1663649496"></a>
### PM_CrashLand

```ml
function PM_CrashLand(p)
```

Forward `PM_CrashLand` to `mq3.game.pmove.crashLand` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `previousOrigin`, `previousVelocity` and `k`. May update `p.ps.legsTimer` and `p.ps.bobCycle` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L67)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-deadmove-function-pm-deadmove-p-src-mq3-game-bg-pmove-runtime-ml-235606110"></a>
### PM_DeadMove

```ml
function PM_DeadMove(p)
```

Forward `PM_DeadMove` to `mq3.game.pmove.deadMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k` and `ps`. May update `p.ps.velocity` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L70)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-droptimers-function-pm-droptimers-p-src-mq3-game-bg-pmove-runtime-ml-601586882"></a>
### PM_DropTimers

```ml
function PM_DropTimers(p)
```

Forward `PM_DropTimers` to `mq3.game.pmove.dropTimers` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `msec`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L73)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-finishweaponchange-function-pm-finishweaponchange-p-src-mq3-game-bg-pmove-runtime-ml-260644922"></a>
### PM_FinishWeaponChange

```ml
function PM_FinishWeaponChange(p)
```

Forward `PM_FinishWeaponChange` to `mq3.game.pmove.finishWeaponChange` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `cmd` and `ps`. May update `p.ps.weapon`, `p.ps.weaponstate` and `p.ps.weaponTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L76)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-flymove-function-pm-flymove-p-src-mq3-game-bg-pmove-runtime-ml-1242406420"></a>
### PM_FlyMove

```ml
function PM_FlyMove(p)
```

Forward `PM_FlyMove` to `mq3.game.pmove.flyMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L79)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-footstepforsurface-function-pm-footstepforsurface-p-src-mq3-game-bg-pmove-runtime-ml-26107432"></a>
### PM_FootstepForSurface

```ml
function PM_FootstepForSurface(p)
```

Forward `PM_FootstepForSurface` to `mq3.game.pmove.footstepForSurface` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L82)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-footsteps-function-pm-footsteps-p-src-mq3-game-bg-pmove-runtime-ml-1316416260"></a>
### PM_Footsteps

```ml
function PM_Footsteps(p)
```

Forward `PM_Footsteps` to `mq3.game.pmove.footsteps` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `xyspeed`, `ps`, `k`, `cmd` and `msec` and related fields. May update `p.xyspeed` and `p.ps.bobCycle` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L85)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-forcelegsanim-function-pm-forcelegsanim-p-anim-src-mq3-game-bg-pmove-runtime-ml-1899271681"></a>
### PM_ForceLegsAnim

```ml
function PM_ForceLegsAnim(p, anim)
```

Forward `PM_ForceLegsAnim` to `mq3.game.pmove.forceLegs` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. May update `p.ps.legsTimer` in place. |
| `anim` | `dynamic` | — | Value used by `startLegs` in `p.ps.legsAnim = ((p.ps.legsAnim & 128)^128)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L89)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-friction-function-pm-friction-p-src-mq3-game-bg-pmove-runtime-ml-998731080"></a>
### PM_Friction

```ml
function PM_Friction(p)
```

Forward `PM_Friction` to `mq3.game.pmove.friction` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L92)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-grapplemove-function-pm-grapplemove-p-src-mq3-game-bg-pmove-runtime-ml-648937144"></a>
### PM_GrappleMove

```ml
function PM_GrappleMove(p)
```

Forward `PM_GrappleMove` to `mq3.game.pmove.grappleMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `forward` and `k`. May update `p.ps.velocity` and `p.k.groundPlane` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L95)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-groundtrace-function-pm-groundtrace-p-src-mq3-game-bg-pmove-runtime-ml-2130385928"></a>
### PM_GroundTrace

```ml
function PM_GroundTrace(p)
```

Forward `PM_GroundTrace` to `mq3.game.pmove.groundTrace` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `traceFn`, `groundTrace`, `k` and `previousVelocity`. May update `p.ps.groundEntityNum`, `p.k.groundPlane` and `p.k.walking` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L98)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-groundtracemissed-function-pm-groundtracemissed-p-src-mq3-game-bg-pmove-runtime-ml-296387956"></a>
### PM_GroundTraceMissed

```ml
function PM_GroundTraceMissed(p)
```

Forward `PM_GroundTraceMissed` to `mq3.game.pmove.groundTraceMissed` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `traceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L101)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-invulnerabilitymove-function-pm-invulnerabilitymove-p-src-mq3-game-bg-pmove-runtime-ml-1228214736"></a>
### PM_InvulnerabilityMove

```ml
function PM_InvulnerabilityMove(p)
```

Forward `PM_InvulnerabilityMove` to `mq3.game.pmove.invulnerabilityMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `cmd` and `ps`. May update `p.cmd.forwardmove`, `p.cmd.rightmove` and `p.cmd.upmove` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L104)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-noclipmove-function-pm-noclipmove-p-src-mq3-game-bg-pmove-runtime-ml-571677768"></a>
### PM_NoclipMove

```ml
function PM_NoclipMove(p)
```

Forward `PM_NoclipMove` to `mq3.game.pmove.noclipMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `k`, `forward`, `cmd` and `right`. May update `p.ps.viewheight`, `p.ps.velocity` and `p.ps.origin` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L107)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-setmovementdir-function-pm-setmovementdir-p-src-mq3-game-bg-pmove-runtime-ml-1165552064"></a>
### PM_SetMovementDir

```ml
function PM_SetMovementDir(p)
```

Forward `PM_SetMovementDir` to `mq3.game.pmove.movementDir` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `cmd` and `ps`. May update `p.ps.movementDir` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L110)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-setwaterlevel-function-pm-setwaterlevel-p-src-mq3-game-bg-pmove-runtime-ml-1091632992"></a>
### PM_SetWaterLevel

```ml
function PM_SetWaterLevel(p)
```

Forward `PM_SetWaterLevel` to `mq3.game.pmove.setWaterLevel` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`, `watertype`, `ps` and `pointFn`. May update `p.k.waterlevel` and `p.watertype` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L113)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-startlegsanim-function-pm-startlegsanim-p-anim-src-mq3-game-bg-pmove-runtime-ml-1043046521"></a>
### PM_StartLegsAnim

```ml
function PM_StartLegsAnim(p, anim)
```

Forward `PM_StartLegsAnim` to `mq3.game.pmove.startLegs` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. May update `p.ps.legsAnim` in place. |
| `anim` | `dynamic` | — | Value used by `startLegs` in `p.ps.legsAnim = ((p.ps.legsAnim & 128)^128)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L117)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-starttorsoanim-function-pm-starttorsoanim-p-anim-src-mq3-game-bg-pmove-runtime-ml-1295912613"></a>
### PM_StartTorsoAnim

```ml
function PM_StartTorsoAnim(p, anim)
```

Forward `PM_StartTorsoAnim` to `mq3.game.pmove.startTorso` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. May update `p.ps.torsoAnim` in place. |
| `anim` | `dynamic` | — | Value used by `startTorso` in `p.ps.torsoAnim = ((p.ps.torsoAnim & 128)^128)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L121)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-torsoanimation-function-pm-torsoanimation-p-src-mq3-game-bg-pmove-runtime-ml-684156934"></a>
### PM_TorsoAnimation

```ml
function PM_TorsoAnimation(p)
```

Forward `PM_TorsoAnimation` to `mq3.game.pmove.torsoAnimation` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L124)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-updateviewangles-function-pm-updateviewangles-ps-cmd-src-mq3-game-bg-pmove-runtime-ml-1160475279"></a>
### PM_UpdateViewAngles

```ml
function PM_UpdateViewAngles(ps, cmd)
```

Forward `PM_UpdateViewAngles` to `mq3.game.pmove.updateViewAngles` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player movement state; accesses `pm_type`, `stats`, `delta_angles` and `viewangles`. May update `ps.delta_angles[axis]` and `ps.viewangles[axis]` in place. |
| `cmd` | `dynamic` | — | Input user command; accesses `angles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L128)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-walkmove-function-pm-walkmove-p-src-mq3-game-bg-pmove-runtime-ml-905450764"></a>
### PM_WalkMove

```ml
function PM_WalkMove(p)
```

Forward `PM_WalkMove` to `mq3.game.pmove.walkMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`, `forward`, `right`, `cmd` and `ps`. May update `p.forward[2]`, `p.right[2]` and `p.forward` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L131)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-waterevents-function-pm-waterevents-p-src-mq3-game-bg-pmove-runtime-ml-1523993656"></a>
### PM_WaterEvents

```ml
function PM_WaterEvents(p)
```

Forward `PM_WaterEvents` to `mq3.game.pmove.waterEvents` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `previousWaterlevel` and `k`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L134)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-waterjumpmove-function-pm-waterjumpmove-p-src-mq3-game-bg-pmove-runtime-ml-835447208"></a>
### PM_WaterJumpMove

```ml
function PM_WaterJumpMove(p)
```

Forward `PM_WaterJumpMove` to `mq3.game.pmove.waterJumpMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `k`. May update `p.ps.velocity[2]`, `p.ps.pm_flags` and `p.ps.pm_time` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L137)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-watermove-function-pm-watermove-p-src-mq3-game-bg-pmove-runtime-ml-1299014504"></a>
### PM_WaterMove

```ml
function PM_WaterMove(p)
```

Forward `PM_WaterMove` to `mq3.game.pmove.waterMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `k`. May update `p.ps.velocity` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L140)

<a id="function-function-mq3-game-bg-pmove-runtime-pm-weapon-function-pm-weapon-p-src-mq3-game-bg-pmove-runtime-ml-310356992"></a>
### PM_Weapon

```ml
function PM_Weapon(p)
```

Forward `PM_Weapon` to `mq3.game.pmove.weapon` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `cmd`, `msec` and `gauntletHit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L143)

<a id="function-function-mq3-game-bg-pmove-runtime-pmove-function-pmove-p-src-mq3-game-bg-pmove-runtime-ml-906837270"></a>
### Pmove

```ml
function Pmove(p)
```

Forward `Pmove` to `mq3.game.pmove.move` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `fixed`, `fixedMsec`, `ps` and `cmd`. May update `p.cmd.weapon`, `p.cmd.forwardmove` and `p.cmd.rightmove` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L146)

<a id="function-function-mq3-game-bg-pmove-runtime-pmovesingle-function-pmovesingle-p-src-mq3-game-bg-pmove-runtime-ml-236519206"></a>
### PmoveSingle

```ml
function PmoveSingle(p)
```

Forward `PmoveSingle` to `mq3.game.pmove.single` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `cmd`, `k`, `watertype` and `previousWaterlevel` and related fields. May update `p.watertype`, `p.previousWaterlevel` and `p.msec` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L149)

<a id="function-function-mq3-game-bg-pmove-runtime-sqrt-function-sqrt-value-src-mq3-game-bg-pmove-runtime-ml-565612653"></a>
### sqrt

```ml
function sqrt(value)
```

Forward `sqrt` to `mq3.compat.transcendental.sqrt` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.transcendental.sqrt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bg_pmove_runtime.ml#L152)
