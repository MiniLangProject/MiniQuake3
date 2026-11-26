# `src/mq3/game/pmove.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.pmove`](Package-mq3-game-pmove-1726315227.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/brush.ml` as `brush` → [src/mq3/collision/brush.ml](File-src-mq3-collision-brush-ml-582513812.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/game_internal_headers.ml` as `internal` → [src/mq3/game/game_internal_headers.ml](File-src-mq3-game-game-internal-headers-ml-370319487.md)
- `mq3/game/movement.ml` as `kernel` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-pmove-accelerate-function-accelerate-p-dir-speed-accel-src-mq3-game-pmove-ml-342486304"></a>
### accelerate

```ml
function accelerate(p, dir, speed, accel)
```

Apply `mq3.game.pmove.syncKernel`, `mq3.game.movement.accelerate` and `mq3.game.pmove.syncPlayer` while evaluating `accelerate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`. |
| `dir` | `dynamic` | — | Value passed as argument 2 to `mq3.shared.math.DotProduct`. |
| `speed` | `dynamic` | — | Requested movement speed. |
| `accel` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L132)

<a id="function-function-mq3-game-pmove-addevent-function-addevent-p-event-src-mq3-game-pmove-ml-1954529014"></a>
### addEvent

```ml
function addEvent(p, event)
```

Update `p.ps.events[slot]`, `p.ps.eventParms[slot]` and `p.ps.eventSequence` during `addEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. May update `p.ps.events[slot]`, `p.ps.eventParms[slot]` and `p.ps.eventSequence` in place. |
| `event` | `dynamic` | — | Player or entity event identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L155)

<a id="function-function-mq3-game-pmove-airmove-function-airmove-p-src-mq3-game-pmove-ml-1133189074"></a>
### airMove

```ml
function airMove(p)
```

Update `p.forward[2]`, `p.right[2]` and `p.ps.velocity` during `airMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `forward`, `right`, `cmd`, `k` and `ps`. May update `p.forward[2]`, `p.right[2]` and `p.ps.velocity` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L320)

<a id="constant-constant-mq3-game-pmove-all-times-const-all-times-352-src-mq3-game-pmove-ml-632968233"></a>
### ALL_TIMES

```ml
const ALL_TIMES = 352
```

Combined movement mask for landing, knockback, and water-jump timers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L14)

<a id="function-function-mq3-game-pmove-animate-function-animate-p-src-mq3-game-pmove-ml-1713434970"></a>
### animate

```ml
function animate(p)
```

Set `p.ps.torsoTimer` to `internal.TIMER_GESTURE` in `mq3.game.pmove.animate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `cmd` and `ps`. May update `p.ps.torsoTimer` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L707)

<a id="function-function-mq3-game-pmove-beginweaponchange-function-beginweaponchange-p-weapon-src-mq3-game-pmove-ml-1346492394"></a>
### beginWeaponChange

```ml
function beginWeaponChange(p, weapon)
```

Set `p.ps.weaponstate` to `c.WEAPON_DROPPING` and `p.ps.weaponTime` to `p.ps.weaponTime+200` in `mq3.game.pmove.beginWeaponChange`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. May update `p.ps.weaponstate` and `p.ps.weaponTime` in place. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L635)

<a id="function-function-mq3-game-pmove-checkduck-function-checkduck-p-src-mq3-game-pmove-ml-133061486"></a>
### checkDuck

```ml
function checkDuck(p)
```

Update `p.k.mins`, `p.k.maxs`, `p.ps.pm_flags` and `p.ps.viewheight` and related state during `checkDuck`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `k`, `cmd` and `traceFn`. May update `p.k.mins`, `p.k.maxs` and `p.ps.pm_flags` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L557)

<a id="function-function-mq3-game-pmove-checkjump-function-checkjump-p-src-mq3-game-pmove-ml-1830275336"></a>
### checkJump

```ml
function checkJump(p)
```

Update `p.cmd.upmove`, `p.k.groundPlane`, `p.k.walking` and `p.ps.pm_flags` and related state during `checkJump`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `cmd` and `k`. May update `p.cmd.upmove`, `p.k.groundPlane` and `p.k.walking` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L237)

<a id="function-function-mq3-game-pmove-checkstuck-function-checkstuck-p-src-mq3-game-pmove-ml-1461164508"></a>
### checkStuck

```ml
function checkStuck(p)
```

Return `p.traceFn(p,p.ps.origin,p.ps.origin).trace.allsolid` for `checkStuck`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `traceFn` and `ps`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L493)

<a id="function-function-mq3-game-pmove-checkwaterjump-function-checkwaterjump-p-src-mq3-game-pmove-ml-1652438776"></a>
### checkWaterJump

```ml
function checkWaterJump(p)
```

Update `p.ps.velocity`, `p.ps.velocity[2]`, `p.ps.pm_flags` and `p.ps.pm_time` during `checkWaterJump`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `k`, `forward` and `pointFn`. May update `p.ps.velocity`, `p.ps.velocity[2]` and `p.ps.pm_flags` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L249)

<a id="function-function-mq3-game-pmove-clearground-function-clearground-p-src-mq3-game-pmove-ml-491287928"></a>
### clearGround

```ml
function clearGround(p)
```

Update `p.ps.groundEntityNum`, `p.k.groundPlane` and `p.k.walking` during `clearGround`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `k`. May update `p.ps.groundEntityNum`, `p.k.groundPlane` and `p.k.walking` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L468)

- [mq3.game.pmove.Command](Type-mq3-game-pmove-command-1751700588.md) — struct
<a id="function-function-mq3-game-pmove-continuelegs-function-continuelegs-p-anim-src-mq3-game-pmove-ml-2108847395"></a>
### continueLegs

```ml
function continueLegs(p, anim)
```

Apply `mq3.game.pmove.startLegs` while evaluating `continueLegs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. |
| `anim` | `dynamic` | — | Value used by `startLegs` in `p.ps.legsAnim = ((p.ps.legsAnim & 128)^128)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L181)

<a id="function-function-mq3-game-pmove-continuetorso-function-continuetorso-p-anim-src-mq3-game-pmove-ml-660253583"></a>
### continueTorso

```ml
function continueTorso(p, anim)
```

Apply `mq3.game.pmove.startTorso` while evaluating `continueTorso`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. |
| `anim` | `dynamic` | — | Value used by `startTorso` in `p.ps.torsoAnim = ((p.ps.torsoAnim & 128)^128)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L189)

<a id="function-function-mq3-game-pmove-correctallsolid-function-correctallsolid-p-src-mq3-game-pmove-ml-1261807240"></a>
### correctAllSolid

```ml
function correctAllSolid(p)
```

Use `p.traceFn` to perform `correctAllSolid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `traceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L474)

<a id="function-function-mq3-game-pmove-crashland-function-crashland-p-src-mq3-game-pmove-ml-328675112"></a>
### crashLand

```ml
function crashLand(p)
```

Set `p.ps.legsTimer` to `internal.TIMER_LAND` and `p.ps.bobCycle` to `0` in `mq3.game.pmove.crashLand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `previousOrigin`, `previousVelocity` and `k`. May update `p.ps.legsTimer` and `p.ps.bobCycle` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L429)

<a id="function-function-mq3-game-pmove-create-function-create-ps-tracefn-pointfn-context-src-mq3-game-pmove-ml-77096573"></a>
### create

```ml
function create(ps, traceFn, pointFn, context)
```

Apply `mq3.game.movement.create` and `mq3.collision.brush.emptyTrace` while evaluating `create`. Return paths include `p`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Initial value stored in `mq3.game.pmove.PmoveContext.ps`. |
| `traceFn` | `dynamic` | — | Initial value stored in `mq3.game.pmove.PmoveContext.traceFn`. |
| `pointFn` | `dynamic` | — | Initial value stored in `mq3.game.pmove.PmoveContext.pointFn`. |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L94)

<a id="function-function-mq3-game-pmove-deadmove-function-deadmove-p-src-mq3-game-pmove-ml-1603697552"></a>
### deadMove

```ml
function deadMove(p)
```

Set `p.ps.velocity` to `[0.0,0.0,0.0]` and `p.ps.velocity` to `q.VectorScale(p.ps.velocity,speed)` in `mq3.game.pmove.deadMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k` and `ps`. May update `p.ps.velocity` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L387)

<a id="function-function-mq3-game-pmove-droptimers-function-droptimers-p-src-mq3-game-pmove-ml-1543451820"></a>
### dropTimers

```ml
function dropTimers(p)
```

Advance movement and animation timers by the frame duration, clearing expired movement flags and clamping timers to zero.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `msec`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L715)

<a id="function-function-mq3-game-pmove-finishweaponchange-function-finishweaponchange-p-src-mq3-game-pmove-ml-454323312"></a>
### finishWeaponChange

```ml
function finishWeaponChange(p)
```

Update `p.ps.weapon`, `p.ps.weaponstate` and `p.ps.weaponTime` during `finishWeaponChange`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `cmd` and `ps`. May update `p.ps.weapon`, `p.ps.weaponstate` and `p.ps.weaponTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L644)

<a id="function-function-mq3-game-pmove-flymove-function-flymove-p-src-mq3-game-pmove-ml-1294450536"></a>
### flyMove

```ml
function flyMove(p)
```

Apply `mq3.game.pmove.friction`, `mq3.game.pmove.swimmingWish` and `mq3.game.pmove.scale` while evaluating `flyMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L312)

<a id="function-function-mq3-game-pmove-footstepforsurface-function-footstepforsurface-p-src-mq3-game-pmove-ml-2036289912"></a>
### footstepForSurface

```ml
function footstepForSurface(p)
```

Select no footstep, a metal footstep or a normal footstep from the ground surface flags.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L422)

<a id="function-function-mq3-game-pmove-footsteps-function-footsteps-p-src-mq3-game-pmove-ml-880760994"></a>
### footsteps

```ml
function footsteps(p)
```

Update `p.xyspeed` and `p.ps.bobCycle` during `footsteps`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `xyspeed`, `ps`, `k`, `cmd` and `msec` and related fields. May update `p.xyspeed` and `p.ps.bobCycle` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L584)

<a id="function-function-mq3-game-pmove-forcelegs-function-forcelegs-p-anim-src-mq3-game-pmove-ml-1906610087"></a>
### forceLegs

```ml
function forceLegs(p, anim)
```

Set `p.ps.legsTimer` to `0` in `mq3.game.pmove.forceLegs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. May update `p.ps.legsTimer` in place. |
| `anim` | `dynamic` | — | Value used by `startLegs` in `p.ps.legsAnim = ((p.ps.legsAnim & 128)^128)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L197)

<a id="function-function-mq3-game-pmove-friction-function-friction-p-src-mq3-game-pmove-ml-1833737688"></a>
### friction

```ml
function friction(p)
```

Apply `mq3.game.pmove.syncKernel`, `mq3.game.movement.friction` and `mq3.game.pmove.syncPlayer` while evaluating `friction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L123)

<a id="function-function-mq3-game-pmove-grapplemove-function-grapplemove-p-src-mq3-game-pmove-ml-1044153928"></a>
### grappleMove

```ml
function grappleMove(p)
```

Set `p.ps.velocity` to `q.VectorScale(wish,speed)` and `p.k.groundPlane` to `false` in `mq3.game.pmove.grappleMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `forward` and `k`. May update `p.ps.velocity` and `p.k.groundPlane` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L336)

<a id="function-function-mq3-game-pmove-groundtrace-function-groundtrace-p-src-mq3-game-pmove-ml-327296616"></a>
### groundTrace

```ml
function groundTrace(p)
```

Update `p.ps.groundEntityNum`, `p.k.groundPlane`, `p.k.walking` and `p.ps.pm_flags` and related state during `groundTrace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `traceFn`, `groundTrace`, `k` and `previousVelocity`. May update `p.ps.groundEntityNum`, `p.k.groundPlane` and `p.k.walking` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L511)

<a id="function-function-mq3-game-pmove-groundtracemissed-function-groundtracemissed-p-src-mq3-game-pmove-ml-164809258"></a>
### groundTraceMissed

```ml
function groundTraceMissed(p)
```

Use `p.traceFn` to perform `groundTraceMissed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `traceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L500)

<a id="function-function-mq3-game-pmove-invulnerabilitymove-function-invulnerabilitymove-p-src-mq3-game-pmove-ml-1226493676"></a>
### invulnerabilityMove

```ml
function invulnerabilityMove(p)
```

Update `p.cmd.forwardmove`, `p.cmd.rightmove`, `p.cmd.upmove` and `p.ps.velocity` during `invulnerabilityMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `cmd` and `ps`. May update `p.cmd.forwardmove`, `p.cmd.rightmove` and `p.cmd.upmove` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L304)

<a id="function-function-mq3-game-pmove-jumpanimation-function-jumpanimation-p-src-mq3-game-pmove-ml-1260564184"></a>
### jumpAnimation

```ml
function jumpAnimation(p)
```

Set `p.ps.pm_flags` to `p.ps.pm_flags & ~8` and `p.ps.pm_flags` to `p.ps.pm_flags | 8` in `mq3.game.pmove.jumpAnimation`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `cmd` and `ps`. May update `p.ps.pm_flags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L226)

<a id="function-function-mq3-game-pmove-kerneltrace-function-kerneltrace-k-start-finish-src-mq3-game-pmove-ml-742067610"></a>
### kernelTrace

```ml
function kernelTrace(k, start, finish)
```

Run the movement collision callback with the kernel bounds and preserve its trace result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `k` | `dynamic` | — | K record; accesses `context`. |
| `start` | `dynamic` | — | Value passed as argument 2 to `p.traceFn`. |
| `finish` | `dynamic` | — | Value passed as argument 3 to `p.traceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L84)

<a id="function-function-mq3-game-pmove-move-function-move-p-src-mq3-game-pmove-ml-1508235592"></a>
### move

```ml
function move(p)
```

Update `p.cmd.weapon`, `p.cmd.forwardmove`, `p.cmd.rightmove` and `p.cmd.upmove` and related state during `move`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `fixed`, `fixedMsec`, `ps` and `cmd`. May update `p.cmd.weapon`, `p.cmd.forwardmove` and `p.cmd.rightmove` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L792)

<a id="function-function-mq3-game-pmove-movementdir-function-movementdir-p-src-mq3-game-pmove-ml-1541720416"></a>
### movementDir

```ml
function movementDir(p)
```

Update `p.ps.movementDir` during `movementDir`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `cmd` and `ps`. May update `p.ps.movementDir` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L205)

<a id="function-function-mq3-game-pmove-noclipmove-function-noclipmove-p-src-mq3-game-pmove-ml-1752206632"></a>
### noclipMove

```ml
function noclipMove(p)
```

Update `p.ps.viewheight`, `p.ps.velocity` and `p.ps.origin` during `noclipMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `k`, `forward`, `cmd` and `right`. May update `p.ps.viewheight`, `p.ps.velocity` and `p.ps.origin` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L398)

<a id="constant-constant-mq3-game-pmove-overclip-const-overclip-internal-overclip-src-mq3-game-pmove-ml-1282249584"></a>
### OVERCLIP

```ml
const OVERCLIP = internal.OVERCLIP
```

Small collision-plane overbounce factor that prevents motion from sticking to a surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L16)

- [mq3.game.pmove.PmoveContext](Type-mq3-game-pmove-pmovecontext-1916135903.md) — struct
<a id="function-function-mq3-game-pmove-scale-function-scale-p-src-mq3-game-pmove-ml-1618783152"></a>
### scale

```ml
function scale(p)
```

Set `p.k.speed` to `p.ps.speed` in `mq3.game.pmove.scale`. Return paths include `kernel.cmdScale(p.k,p.cmd.forwardmove,p.cmd.rightmove,p.cmd.upmove)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`, `ps` and `cmd`. May update `p.k.speed` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L148)

<a id="function-function-mq3-game-pmove-setgroundtrace-function-setgroundtrace-p-hit-src-mq3-game-pmove-ml-975010301"></a>
### setGroundTrace

```ml
function setGroundTrace(p, hit)
```

Update `p.groundTrace`, `p.k.groundNormal` and `p.k.groundFlags` during `setGroundTrace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `groundTrace` and `k`. May update `p.groundTrace`, `p.k.groundNormal` and `p.k.groundFlags` in place. |
| `hit` | `dynamic` | — | Hit record; accesses `trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L461)

<a id="function-function-mq3-game-pmove-setwaterlevel-function-setwaterlevel-p-src-mq3-game-pmove-ml-919607510"></a>
### setWaterLevel

```ml
function setWaterLevel(p)
```

Update `p.k.waterlevel` and `p.watertype` during `setWaterLevel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`, `watertype`, `ps` and `pointFn`. May update `p.k.waterlevel` and `p.watertype` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L539)

<a id="function-function-mq3-game-pmove-single-function-single-p-src-mq3-game-pmove-ml-1762688816"></a>
### single

```ml
function single(p)
```

Update `p.watertype`, `p.previousWaterlevel`, `p.msec` and `p.previousOrigin` and related state during `single`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `cmd`, `k`, `watertype` and `previousWaterlevel` and related fields. May update `p.watertype`, `p.previousWaterlevel` and `p.msec` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L745)

<a id="function-function-mq3-game-pmove-slide-function-slide-p-gravity-step-src-mq3-game-pmove-ml-622661496"></a>
### slide

```ml
function slide(p, gravity, step)
```

Apply `mq3.game.pmove.syncKernel`, `mq3.game.movement.stepSlideMove` and `mq3.game.movement.slideMove` while evaluating `slide`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`. |
| `gravity` | `dynamic` | — | Value used by `slideMove` in `if gravity then`. |
| `step` | `dynamic` | — | Value used by `slide` in `if step then kernel.stepSlideMove(p.k,gravity) else kernel.slideMove(p.k,gravity) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L140)

<a id="function-function-mq3-game-pmove-standtorso-function-standtorso-p-continuing-src-mq3-game-pmove-ml-560869258"></a>
### standTorso

```ml
function standTorso(p, continuing)
```

Apply `mq3.game.pmove.continueTorso` and `mq3.game.pmove.startTorso` while evaluating `standTorso`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. |
| `continuing` | `dynamic` | — | Value used by `standTorso` in `if continuing then continueTorso(p,anim) else startTorso(p,anim) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L655)

<a id="function-function-mq3-game-pmove-startlegs-function-startlegs-p-anim-src-mq3-game-pmove-ml-1527557573"></a>
### startLegs

```ml
function startLegs(p, anim)
```

Set `p.ps.legsAnim` to `((p.ps.legsAnim & 128)^128)|anim` in `mq3.game.pmove.startLegs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. May update `p.ps.legsAnim` in place. |
| `anim` | `dynamic` | — | Value used by `startLegs` in `p.ps.legsAnim = ((p.ps.legsAnim & 128)^128)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L173)

<a id="function-function-mq3-game-pmove-starttorso-function-starttorso-p-anim-src-mq3-game-pmove-ml-1404309543"></a>
### startTorso

```ml
function startTorso(p, anim)
```

Set `p.ps.torsoAnim` to `((p.ps.torsoAnim & 128)^128)|anim` in `mq3.game.pmove.startTorso`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. May update `p.ps.torsoAnim` in place. |
| `anim` | `dynamic` | — | Value used by `startTorso` in `p.ps.torsoAnim = ((p.ps.torsoAnim & 128)^128)\|anim`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L165)

<a id="function-function-mq3-game-pmove-swimmingwish-function-swimmingwish-p-cmdscale-sink-src-mq3-game-pmove-ml-245834447"></a>
### swimmingWish

```ml
function swimmingWish(p, cmdscale, sink)
```

Build the desired swimming velocity from view-relative command axes, with an optional idle sinking velocity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `forward`, `cmd` and `right`. |
| `cmdscale` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fmul`. |
| `sink` | `dynamic` | — | Value used by `swimmingWish` in `if sink then wish[2] = -60.0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L273)

<a id="function-function-mq3-game-pmove-synckernel-function-synckernel-p-src-mq3-game-pmove-ml-818470648"></a>
### syncKernel

```ml
function syncKernel(p)
```

Copy the player movement inputs into the reusable collision and movement kernel.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `k`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L103)

<a id="function-function-mq3-game-pmove-syncplayer-function-syncplayer-p-src-mq3-game-pmove-ml-1859715896"></a>
### syncPlayer

```ml
function syncPlayer(p)
```

Copy the movement kernel results back into the player state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `k`. May update `p.ps.origin`, `p.ps.velocity` and `p.ps.eventSequence` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L115)

<a id="function-function-mq3-game-pmove-torsoanimation-function-torsoanimation-p-src-mq3-game-pmove-ml-1066067380"></a>
### torsoAnimation

```ml
function torsoAnimation(p)
```

Apply `mq3.game.pmove.standTorso` while evaluating `torsoAnimation`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L663)

<a id="function-function-mq3-game-pmove-updateviewangles-function-updateviewangles-ps-cmd-src-mq3-game-pmove-ml-380882677"></a>
### updateViewAngles

```ml
function updateViewAngles(ps, cmd)
```

Update `ps.delta_angles[axis]` and `ps.viewangles[axis]` during `updateViewAngles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player movement state; accesses `pm_type`, `stats`, `delta_angles` and `viewangles`. May update `ps.delta_angles[axis]` and `ps.viewangles[axis]` in place. |
| `cmd` | `dynamic` | — | Input user command; accesses `angles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L729)

<a id="function-function-mq3-game-pmove-walkmove-function-walkmove-p-src-mq3-game-pmove-ml-205469276"></a>
### walkMove

```ml
function walkMove(p)
```

Update `p.forward[2]`, `p.right[2]`, `p.forward` and `p.right` and related state during `walkMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `k`, `forward`, `right`, `cmd` and `ps`. May update `p.forward[2]`, `p.right[2]` and `p.forward` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L349)

<a id="function-function-mq3-game-pmove-waterevents-function-waterevents-p-src-mq3-game-pmove-ml-1810704284"></a>
### waterEvents

```ml
function waterEvents(p)
```

Apply `mq3.game.pmove.addEvent` while evaluating `waterEvents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `previousWaterlevel` and `k`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L623)

<a id="function-function-mq3-game-pmove-waterjumpmove-function-waterjumpmove-p-src-mq3-game-pmove-ml-766063252"></a>
### waterJumpMove

```ml
function waterJumpMove(p)
```

Update `p.ps.velocity[2]`, `p.ps.pm_flags` and `p.ps.pm_time` during `waterJumpMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `k`. May update `p.ps.velocity[2]`, `p.ps.pm_flags` and `p.ps.pm_time` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L262)

<a id="function-function-mq3-game-pmove-watermove-function-watermove-p-src-mq3-game-pmove-ml-2033233544"></a>
### waterMove

```ml
function waterMove(p)
```

Set `p.ps.velocity` to `kernel.clipVelocity(p.ps.velocity,p.k.groundNormal,OVERCLIP)` and `p.ps.velocity` to `q.VectorScale(p.ps.velocity,speed)` in `mq3.game.pmove.waterMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps` and `k`. May update `p.ps.velocity` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L287)

<a id="function-function-mq3-game-pmove-weapon-function-weapon-p-src-mq3-game-pmove-ml-62382976"></a>
### weapon

```ml
function weapon(p)
```

Apply `mq3.game.constants.itemTag`, `mq3.game.pmove.addEvent` and `mq3.game.pmove.beginWeaponChange` while evaluating `weapon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Player movement context; accesses `ps`, `cmd`, `msec` and `gauntletHit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L669)
