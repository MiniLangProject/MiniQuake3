# `src/mq3/format/player_animation.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.format.player_animation`](Package-mq3-format-player-animation-2082262189.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/format/md3.ml` as `md3` → [src/mq3/format/md3.ml](File-src-mq3-format-md3-ml-2098563759.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-format-player-animation-animation-function-animation-firstframe-numframes-loopframes-framelerp-reversed-src-mq3-format-player-animation-ml-666802521"></a>
### animation

```ml
function animation(firstFrame, numFrames, loopFrames, frameLerp, reversed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `firstFrame` | `dynamic` | — |  |
| `numFrames` | `dynamic` | — |  |
| `loopFrames` | `dynamic` | — |  |
| `frameLerp` | `dynamic` | — |  |
| `reversed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L39)

- [mq3.format.player_animation.Animation](Type-mq3-format-player-animation-animation-435129777.md) — struct
<a id="constant-constant-mq3-format-player-animation-both-dead1-const-both-dead1-1-src-mq3-format-player-animation-ml-1455504048"></a>
### BOTH_DEAD1

```ml
const BOTH_DEAD1 = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L13)

<a id="constant-constant-mq3-format-player-animation-both-death1-const-both-death1-0-src-mq3-format-player-animation-ml-1061722717"></a>
### BOTH_DEATH1

```ml
const BOTH_DEATH1 = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L12)

<a id="function-function-mq3-format-player-animation-clearlerpframe-function-clearlerpframe-config-state-animationnumber-now-src-mq3-format-player-animation-ml-586975118"></a>
### clearLerpFrame

```ml
function clearLerpFrame(config, state, animationNumber, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `animationNumber` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L82)

<a id="function-function-mq3-format-player-animation-clone-function-clone-value-reversed-src-mq3-format-player-animation-ml-248296993"></a>
### clone

```ml
function clone(value, reversed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `reversed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L42)

- [mq3.format.player_animation.Config](Type-mq3-format-player-animation-config-1151437643.md) — struct
<a id="function-function-mq3-format-player-animation-enemyadvancefinished-function-enemyadvancefinished-state-now-lower-upper-src-mq3-format-player-animation-ml-989339258"></a>
### enemyAdvanceFinished

```ml
function enemyAdvanceFinished(state, now, lower, upper)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `lower` | `dynamic` | — |  |
| `upper` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L265)

- [mq3.format.player_animation.EnemyAnimationSample](Type-mq3-format-player-animation-enemyanimationsample-870130061.md) — struct
- [mq3.format.player_animation.EnemyAnimationSelection](Type-mq3-format-player-animation-enemyanimationselection-160737163.md) — struct
- [mq3.format.player_animation.EnemyAnimationState](Type-mq3-format-player-animation-enemyanimationstate-70235216.md) — struct
<a id="function-function-mq3-format-player-animation-enemyattack-function-enemyattack-state-now-src-mq3-format-player-animation-ml-144605581"></a>
### enemyAttack

```ml
function enemyAttack(state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L223)

<a id="function-function-mq3-format-player-animation-enemybegin-function-enemybegin-state-mode-now-src-mq3-format-player-animation-ml-1406389656"></a>
### enemyBegin

```ml
function enemyBegin(state, mode, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L208)

<a id="function-function-mq3-format-player-animation-enemycreate-function-enemycreate-now-src-mq3-format-player-animation-ml-146043684"></a>
### enemyCreate

```ml
function enemyCreate(now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L203)

<a id="function-function-mq3-format-player-animation-enemydie-function-enemydie-state-now-variant-src-mq3-format-player-animation-ml-784573588"></a>
### enemyDie

```ml
function enemyDie(state, now, variant)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `variant` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L235)

<a id="function-function-mq3-format-player-animation-enemyfail-function-enemyfail-message-src-mq3-format-player-animation-ml-1509410411"></a>
### enemyFail

```ml
function enemyFail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L198)

<a id="function-function-mq3-format-player-animation-enemyislocomotion-function-enemyislocomotion-mode-src-mq3-format-player-animation-ml-47003027"></a>
### enemyIsLocomotion

```ml
function enemyIsLocomotion(mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L199)

<a id="function-function-mq3-format-player-animation-enemyisterminal-function-enemyisterminal-mode-src-mq3-format-player-animation-ml-1333589229"></a>
### enemyIsTerminal

```ml
function enemyIsTerminal(mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L200)

<a id="function-function-mq3-format-player-animation-enemylocomote-function-enemylocomote-state-mode-now-src-mq3-format-player-animation-ml-398345300"></a>
### enemyLocomote

```ml
function enemyLocomote(state, mode, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L216)

<a id="function-function-mq3-format-player-animation-enemylocomotionlower-function-enemylocomotionlower-mode-src-mq3-format-player-animation-ml-930216373"></a>
### enemyLocomotionLower

```ml
function enemyLocomotionLower(mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L246)

<a id="function-function-mq3-format-player-animation-enemypain-function-enemypain-state-now-src-mq3-format-player-animation-ml-311969101"></a>
### enemyPain

```ml
function enemyPain(state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L229)

<a id="function-function-mq3-format-player-animation-enemyrespawn-function-enemyrespawn-state-now-src-mq3-format-player-animation-ml-2122400029"></a>
### enemyRespawn

```ml
function enemyRespawn(state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L240)

<a id="function-function-mq3-format-player-animation-enemysample-function-enemysample-config-state-now-src-mq3-format-player-animation-ml-638197879"></a>
### enemySample

```ml
function enemySample(config, state, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L276)

<a id="function-function-mq3-format-player-animation-enemyselect-function-enemyselect-state-src-mq3-format-player-animation-ml-1760480641"></a>
### enemySelect

```ml
function enemySelect(state)
```

Baseq3 has no player pain row; TORSO_GESTURE is used as the preview flinch.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L253)

<a id="function-function-mq3-format-player-animation-enemyvalidmode-function-enemyvalidmode-mode-src-mq3-format-player-animation-ml-366836973"></a>
### enemyValidMode

```ml
function enemyValidMode(mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L201)

<a id="function-function-mq3-format-player-animation-fail-function-fail-message-src-mq3-format-player-animation-ml-1375043675"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L38)

<a id="constant-constant-mq3-format-player-animation-flag-run-const-flag-run-33-src-mq3-format-player-animation-ml-1808242463"></a>
### FLAG_RUN

```ml
const FLAG_RUN = 33
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L27)

<a id="constant-constant-mq3-format-player-animation-flag-stand-const-flag-stand-34-src-mq3-format-player-animation-ml-122054270"></a>
### FLAG_STAND

```ml
const FLAG_STAND = 34
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L28)

<a id="constant-constant-mq3-format-player-animation-flag-stand2run-const-flag-stand2run-35-src-mq3-format-player-animation-ml-1151806457"></a>
### FLAG_STAND2RUN

```ml
const FLAG_STAND2RUN = 35
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L29)

<a id="function-function-mq3-format-player-animation-frameat-function-frameat-value-ordinal-src-mq3-format-player-animation-ml-264236488"></a>
### frameAt

```ml
function frameAt(value, ordinal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `ordinal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L140)

- [mq3.format.player_animation.FrameSample](Type-mq3-format-player-animation-framesample-1730049312.md) — struct
<a id="constant-constant-mq3-format-player-animation-legs-backcr-const-legs-backcr-31-src-mq3-format-player-animation-ml-1137744803"></a>
### LEGS_BACKCR

```ml
const LEGS_BACKCR = 31
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L25)

<a id="constant-constant-mq3-format-player-animation-legs-backwalk-const-legs-backwalk-32-src-mq3-format-player-animation-ml-312103252"></a>
### LEGS_BACKWALK

```ml
const LEGS_BACKWALK = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L26)

<a id="constant-constant-mq3-format-player-animation-legs-idle-const-legs-idle-22-src-mq3-format-player-animation-ml-2098176295"></a>
### LEGS_IDLE

```ml
const LEGS_IDLE = 22
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L21)

<a id="constant-constant-mq3-format-player-animation-legs-run-const-legs-run-15-src-mq3-format-player-animation-ml-76757389"></a>
### LEGS_RUN

```ml
const LEGS_RUN = 15
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L20)

<a id="constant-constant-mq3-format-player-animation-legs-walk-const-legs-walk-14-src-mq3-format-player-animation-ml-1734911524"></a>
### LEGS_WALK

```ml
const LEGS_WALK = 14
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L19)

<a id="constant-constant-mq3-format-player-animation-legs-walkcr-const-legs-walkcr-13-src-mq3-format-player-animation-ml-1400095387"></a>
### LEGS_WALKCR

```ml
const LEGS_WALKCR = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L18)

<a id="function-function-mq3-format-player-animation-lerpframe-function-lerpframe-src-mq3-format-player-animation-ml-1255183898"></a>
### lerpFrame

```ml
function lerpFrame()
```

Stateful CG_SetLerpFrameAnimation / CG_RunLerpFrame.  Unlike sample(), this preserves the original initial-lerp, animation-toggle and hitch-clamp state across rendered frames.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L49)

- [mq3.format.player_animation.LerpFrame](Type-mq3-format-player-animation-lerpframe-665651353.md) — struct
<a id="constant-constant-mq3-format-player-animation-max-animations-const-max-animations-31-src-mq3-format-player-animation-ml-157199561"></a>
### MAX_ANIMATIONS

```ml
const MAX_ANIMATIONS = 31
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L24)

<a id="constant-constant-mq3-format-player-animation-max-totalanimations-const-max-totalanimations-36-src-mq3-format-player-animation-ml-1714581028"></a>
### MAX_TOTALANIMATIONS

```ml
const MAX_TOTALANIMATIONS = 36
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L30)

<a id="function-function-mq3-format-player-animation-numberstarts-function-numberstarts-token-src-mq3-format-player-animation-ml-1830539961"></a>
### numberStarts

```ml
function numberStarts(token)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L87)

<a id="function-function-mq3-format-player-animation-ordinalat-function-ordinalat-value-ordinal-src-mq3-format-player-animation-ml-83760520"></a>
### ordinalAt

```ml
function ordinalAt(value, ordinal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `ordinal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L147)

<a id="function-function-mq3-format-player-animation-parse-function-parse-text-src-mq3-format-player-animation-ml-1275333111"></a>
### parse

```ml
function parse(text)
```

Matches CG_ParseAnimationFile, including optional directives, the lower.md3 frame-base correction, negative numFrames reversal and zero-fps fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L94)

- [mq3.format.player_animation.PlayerSample](Type-mq3-format-player-animation-playersample-29064846.md) — struct
<a id="function-function-mq3-format-player-animation-render-function-render-model-surfaceindex-value-maxtriangles-src-mq3-format-player-animation-ml-1424259868"></a>
### render

```ml
function render(model, surfaceIndex, value, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L182)

<a id="function-function-mq3-format-player-animation-renderat-function-renderat-model-surfaceindex-config-animationindex-elapsedms-maxtriangles-src-mq3-format-player-animation-ml-1187064141"></a>
### renderAt

```ml
function renderAt(model, surfaceIndex, config, animationIndex, elapsedMs, maxTriangles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `animationIndex` | `dynamic` | — |  |
| `elapsedMs` | `dynamic` | — |  |
| `maxTriangles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L187)

<a id="function-function-mq3-format-player-animation-runlerpframe-function-runlerpframe-config-state-newanimation-speedscale-now-enabled-src-mq3-format-player-animation-ml-1103453197"></a>
### runLerpFrame

```ml
function runLerpFrame(config, state, newAnimation, speedScale, now, enabled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `newAnimation` | `dynamic` | — |  |
| `speedScale` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L56)

<a id="function-function-mq3-format-player-animation-sample-function-sample-value-elapsedms-src-mq3-format-player-animation-ml-1234279601"></a>
### sample

```ml
function sample(value, elapsedMs)
```

Samples a sequence at elapsed milliseconds. backlerp is the weight of oldFrame expected by md3.renderTriangles/LerpMeshVertexes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `elapsedMs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L156)

<a id="function-function-mq3-format-player-animation-sampleanimation-function-sampleanimation-config-index-elapsedms-src-mq3-format-player-animation-ml-2125934120"></a>
### sampleAnimation

```ml
function sampleAnimation(config, index, elapsedMs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `elapsedMs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L171)

<a id="function-function-mq3-format-player-animation-sampleplayer-function-sampleplayer-config-loweranimation-upperanimation-elapsedms-src-mq3-format-player-animation-ml-2081302715"></a>
### samplePlayer

```ml
function samplePlayer(config, lowerAnimation, upperAnimation, elapsedMs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `lowerAnimation` | `dynamic` | — |  |
| `upperAnimation` | `dynamic` | — |  |
| `elapsedMs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L176)

<a id="function-function-mq3-format-player-animation-setlerpframeanimation-function-setlerpframeanimation-config-state-newanimation-src-mq3-format-player-animation-ml-1590960187"></a>
### setLerpFrameAnimation

```ml
function setLerpFrameAnimation(config, state, newAnimation)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `newAnimation` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L50)

<a id="constant-constant-mq3-format-player-animation-torso-attack-const-torso-attack-7-src-mq3-format-player-animation-ml-1204017428"></a>
### TORSO_ATTACK

```ml
const TORSO_ATTACK = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L15)

<a id="constant-constant-mq3-format-player-animation-torso-gesture-const-torso-gesture-6-src-mq3-format-player-animation-ml-853609995"></a>
### TORSO_GESTURE

```ml
const TORSO_GESTURE = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L14)

<a id="constant-constant-mq3-format-player-animation-torso-getflag-const-torso-getflag-25-src-mq3-format-player-animation-ml-12525420"></a>
### TORSO_GETFLAG

```ml
const TORSO_GETFLAG = 25
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L22)

<a id="constant-constant-mq3-format-player-animation-torso-negative-const-torso-negative-30-src-mq3-format-player-animation-ml-142449586"></a>
### TORSO_NEGATIVE

```ml
const TORSO_NEGATIVE = 30
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L23)

<a id="constant-constant-mq3-format-player-animation-torso-raise-const-torso-raise-10-src-mq3-format-player-animation-ml-1825865640"></a>
### TORSO_RAISE

```ml
const TORSO_RAISE = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L16)

<a id="constant-constant-mq3-format-player-animation-torso-stand-const-torso-stand-11-src-mq3-format-player-animation-ml-1619710493"></a>
### TORSO_STAND

```ml
const TORSO_STAND = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/player_animation.ml#L17)
