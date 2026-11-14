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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `dir` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |
| `accel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L80)

<a id="function-function-mq3-game-pmove-addevent-function-addevent-p-event-src-mq3-game-pmove-ml-1954529014"></a>
### addEvent

```ml
function addEvent(p, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L94)

<a id="function-function-mq3-game-pmove-airmove-function-airmove-p-src-mq3-game-pmove-ml-1133189074"></a>
### airMove

```ml
function airMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L222)

<a id="constant-constant-mq3-game-pmove-all-times-const-all-times-352-src-mq3-game-pmove-ml-632968233"></a>
### ALL_TIMES

```ml
const ALL_TIMES = 352
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L13)

<a id="function-function-mq3-game-pmove-animate-function-animate-p-src-mq3-game-pmove-ml-1713434970"></a>
### animate

```ml
function animate(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L562)

<a id="function-function-mq3-game-pmove-beginweaponchange-function-beginweaponchange-p-weapon-src-mq3-game-pmove-ml-1346492394"></a>
### beginWeaponChange

```ml
function beginWeaponChange(p, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L501)

<a id="function-function-mq3-game-pmove-checkduck-function-checkduck-p-src-mq3-game-pmove-ml-133061486"></a>
### checkDuck

```ml
function checkDuck(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L430)

<a id="function-function-mq3-game-pmove-checkjump-function-checkjump-p-src-mq3-game-pmove-ml-1830275336"></a>
### checkJump

```ml
function checkJump(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L155)

<a id="function-function-mq3-game-pmove-checkstuck-function-checkstuck-p-src-mq3-game-pmove-ml-1461164508"></a>
### checkStuck

```ml
function checkStuck(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L374)

<a id="function-function-mq3-game-pmove-checkwaterjump-function-checkwaterjump-p-src-mq3-game-pmove-ml-1652438776"></a>
### checkWaterJump

```ml
function checkWaterJump(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L165)

<a id="function-function-mq3-game-pmove-clearground-function-clearground-p-src-mq3-game-pmove-ml-491287928"></a>
### clearGround

```ml
function clearGround(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L353)

- [mq3.game.pmove.Command](Type-mq3-game-pmove-command-1751700588.md) — struct
<a id="function-function-mq3-game-pmove-continuelegs-function-continuelegs-p-anim-src-mq3-game-pmove-ml-2108847395"></a>
### continueLegs

```ml
function continueLegs(p, anim)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L111)

<a id="function-function-mq3-game-pmove-continuetorso-function-continuetorso-p-anim-src-mq3-game-pmove-ml-660253583"></a>
### continueTorso

```ml
function continueTorso(p, anim)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L116)

<a id="function-function-mq3-game-pmove-correctallsolid-function-correctallsolid-p-src-mq3-game-pmove-ml-1261807240"></a>
### correctAllSolid

```ml
function correctAllSolid(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L357)

<a id="function-function-mq3-game-pmove-crashland-function-crashland-p-src-mq3-game-pmove-ml-328675112"></a>
### crashLand

```ml
function crashLand(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L319)

<a id="function-function-mq3-game-pmove-create-function-create-ps-tracefn-pointfn-context-src-mq3-game-pmove-ml-77096573"></a>
### create

```ml
function create(ps, traceFn, pointFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `traceFn` | `dynamic` | — |  |
| `pointFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L53)

<a id="function-function-mq3-game-pmove-deadmove-function-deadmove-p-src-mq3-game-pmove-ml-1603697552"></a>
### deadMove

```ml
function deadMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L283)

<a id="function-function-mq3-game-pmove-droptimers-function-droptimers-p-src-mq3-game-pmove-ml-1543451820"></a>
### dropTimers

```ml
function dropTimers(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L568)

<a id="function-function-mq3-game-pmove-finishweaponchange-function-finishweaponchange-p-src-mq3-game-pmove-ml-454323312"></a>
### finishWeaponChange

```ml
function finishWeaponChange(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L508)

<a id="function-function-mq3-game-pmove-flymove-function-flymove-p-src-mq3-game-pmove-ml-1294450536"></a>
### flyMove

```ml
function flyMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L216)

<a id="function-function-mq3-game-pmove-footstepforsurface-function-footstepforsurface-p-src-mq3-game-pmove-ml-2036289912"></a>
### footstepForSurface

```ml
function footstepForSurface(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L314)

<a id="function-function-mq3-game-pmove-footsteps-function-footsteps-p-src-mq3-game-pmove-ml-880760994"></a>
### footsteps

```ml
function footsteps(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L455)

<a id="function-function-mq3-game-pmove-forcelegs-function-forcelegs-p-anim-src-mq3-game-pmove-ml-1906610087"></a>
### forceLegs

```ml
function forceLegs(p, anim)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L121)

<a id="function-function-mq3-game-pmove-friction-function-friction-p-src-mq3-game-pmove-ml-1833737688"></a>
### friction

```ml
function friction(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L76)

<a id="function-function-mq3-game-pmove-grapplemove-function-grapplemove-p-src-mq3-game-pmove-ml-1044153928"></a>
### grappleMove

```ml
function grappleMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L236)

<a id="function-function-mq3-game-pmove-groundtrace-function-groundtrace-p-src-mq3-game-pmove-ml-327296616"></a>
### groundTrace

```ml
function groundTrace(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L388)

<a id="function-function-mq3-game-pmove-groundtracemissed-function-groundtracemissed-p-src-mq3-game-pmove-ml-164809258"></a>
### groundTraceMissed

```ml
function groundTraceMissed(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L379)

<a id="function-function-mq3-game-pmove-invulnerabilitymove-function-invulnerabilitymove-p-src-mq3-game-pmove-ml-1226493676"></a>
### invulnerabilityMove

```ml
function invulnerabilityMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L210)

<a id="function-function-mq3-game-pmove-jumpanimation-function-jumpanimation-p-src-mq3-game-pmove-ml-1260564184"></a>
### jumpAnimation

```ml
function jumpAnimation(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L146)

<a id="function-function-mq3-game-pmove-kerneltrace-function-kerneltrace-k-start-finish-src-mq3-game-pmove-ml-742067610"></a>
### kernelTrace

```ml
function kernelTrace(k, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `k` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L48)

<a id="function-function-mq3-game-pmove-move-function-move-p-src-mq3-game-pmove-ml-1508235592"></a>
### move

```ml
function move(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L638)

<a id="function-function-mq3-game-pmove-movementdir-function-movementdir-p-src-mq3-game-pmove-ml-1541720416"></a>
### movementDir

```ml
function movementDir(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L127)

<a id="function-function-mq3-game-pmove-noclipmove-function-noclipmove-p-src-mq3-game-pmove-ml-1752206632"></a>
### noclipMove

```ml
function noclipMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L292)

<a id="constant-constant-mq3-game-pmove-overclip-const-overclip-internal-overclip-src-mq3-game-pmove-ml-1282249584"></a>
### OVERCLIP

```ml
const OVERCLIP = internal.OVERCLIP
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L14)

- [mq3.game.pmove.PmoveContext](Type-mq3-game-pmove-pmovecontext-1916135903.md) — struct
<a id="function-function-mq3-game-pmove-scale-function-scale-p-src-mq3-game-pmove-ml-1618783152"></a>
### scale

```ml
function scale(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L90)

<a id="function-function-mq3-game-pmove-setgroundtrace-function-setgroundtrace-p-hit-src-mq3-game-pmove-ml-975010301"></a>
### setGroundTrace

```ml
function setGroundTrace(p, hit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `hit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L348)

<a id="function-function-mq3-game-pmove-setwaterlevel-function-setwaterlevel-p-src-mq3-game-pmove-ml-919607510"></a>
### setWaterLevel

```ml
function setWaterLevel(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L414)

<a id="function-function-mq3-game-pmove-single-function-single-p-src-mq3-game-pmove-ml-1762688816"></a>
### single

```ml
function single(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L593)

<a id="function-function-mq3-game-pmove-slide-function-slide-p-gravity-step-src-mq3-game-pmove-ml-622661496"></a>
### slide

```ml
function slide(p, gravity, step)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `gravity` | `dynamic` | — |  |
| `step` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L84)

<a id="function-function-mq3-game-pmove-standtorso-function-standtorso-p-continuing-src-mq3-game-pmove-ml-560869258"></a>
### standTorso

```ml
function standTorso(p, continuing)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `continuing` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L516)

<a id="function-function-mq3-game-pmove-startlegs-function-startlegs-p-anim-src-mq3-game-pmove-ml-1527557573"></a>
### startLegs

```ml
function startLegs(p, anim)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L106)

<a id="function-function-mq3-game-pmove-starttorso-function-starttorso-p-anim-src-mq3-game-pmove-ml-1404309543"></a>
### startTorso

```ml
function startTorso(p, anim)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `anim` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L101)

<a id="function-function-mq3-game-pmove-swimmingwish-function-swimmingwish-p-cmdscale-sink-src-mq3-game-pmove-ml-245834447"></a>
### swimmingWish

```ml
function swimmingWish(p, cmdscale, sink)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `cmdscale` | `dynamic` | — |  |
| `sink` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L183)

<a id="function-function-mq3-game-pmove-synckernel-function-synckernel-p-src-mq3-game-pmove-ml-818470648"></a>
### syncKernel

```ml
function syncKernel(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L60)

<a id="function-function-mq3-game-pmove-syncplayer-function-syncplayer-p-src-mq3-game-pmove-ml-1859715896"></a>
### syncPlayer

```ml
function syncPlayer(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L70)

<a id="function-function-mq3-game-pmove-torsoanimation-function-torsoanimation-p-src-mq3-game-pmove-ml-1066067380"></a>
### torsoAnimation

```ml
function torsoAnimation(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L522)

<a id="function-function-mq3-game-pmove-updateviewangles-function-updateviewangles-ps-cmd-src-mq3-game-pmove-ml-380882677"></a>
### updateViewAngles

```ml
function updateViewAngles(ps, cmd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L579)

<a id="function-function-mq3-game-pmove-walkmove-function-walkmove-p-src-mq3-game-pmove-ml-205469276"></a>
### walkMove

```ml
function walkMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L247)

<a id="function-function-mq3-game-pmove-waterevents-function-waterevents-p-src-mq3-game-pmove-ml-1810704284"></a>
### waterEvents

```ml
function waterEvents(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L492)

<a id="function-function-mq3-game-pmove-waterjumpmove-function-waterjumpmove-p-src-mq3-game-pmove-ml-766063252"></a>
### waterJumpMove

```ml
function waterJumpMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L176)

<a id="function-function-mq3-game-pmove-watermove-function-watermove-p-src-mq3-game-pmove-ml-2033233544"></a>
### waterMove

```ml
function waterMove(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L195)

<a id="function-function-mq3-game-pmove-weapon-function-weapon-p-src-mq3-game-pmove-ml-62382976"></a>
### weapon

```ml
function weapon(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/pmove.ml#L526)
