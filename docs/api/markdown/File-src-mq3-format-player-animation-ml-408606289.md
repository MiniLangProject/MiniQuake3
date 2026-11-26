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

Create `mq3.format.player_animation.Animation` with firstFrame=firstFrame; numFrames=numFrames; loopFrames=loopFrames; frameLerp=frameLerp; initialLerp=frameLerp; reversed=reversed; flipflop=false.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `firstFrame` | `dynamic` | — | Initial `firstFrame` field stored in the returned or constructed `mq3.format.player_animation.Animation` record. |
| `numFrames` | `dynamic` | — | Initial `numFrames` field stored in the returned or constructed `mq3.format.player_animation.Animation` record. |
| `loopFrames` | `dynamic` | — | Initial `loopFrames` field stored in the returned or constructed `mq3.format.player_animation.Animation` record. |
| `frameLerp` | `dynamic` | — | Initial `frameLerp` field stored in the returned or constructed `mq3.format.player_animation.Animation` record. |
| `reversed` | `dynamic` | — | Initial `reversed` field stored in the returned or constructed `mq3.format.player_animation.Animation` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L130)

- [mq3.format.player_animation.Animation](Type-mq3-format-player-animation-animation-435129777.md) — struct
<a id="constant-constant-mq3-format-player-animation-both-dead1-const-both-dead1-1-src-mq3-format-player-animation-ml-1455504048"></a>
### BOTH_DEAD1

```ml
const BOTH_DEAD1 = 1
```

Animation identifier for both dead1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L15)

<a id="constant-constant-mq3-format-player-animation-both-death1-const-both-death1-0-src-mq3-format-player-animation-ml-1061722717"></a>
### BOTH_DEATH1

```ml
const BOTH_DEATH1 = 0
```

Animation identifier for both death1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L13)

<a id="function-function-mq3-format-player-animation-clearlerpframe-function-clearlerpframe-config-state-animationnumber-now-src-mq3-format-player-animation-ml-586975118"></a>
### clearLerpFrame

```ml
function clearLerpFrame(config, state, animationNumber, now)
```

Clear lerp frame in format.player_animation; the normal completion returns `state`.

Direct state writes: `state.frameTime`, `state.oldFrameTime`, `state.oldFrame`, `state.frame`, `state.backlerp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Config passed as `config` to `mq3.format.player_animation.setLerpFrameAnimation`. |
| `state` | `dynamic` | — | Record exposing `animation`. Updated in place: `frameTime`, `oldFrameTime`, `oldFrame`, `frame`, `backlerp`. |
| `animationNumber` | `dynamic` | — | New animation passed as `newAnimation` to `mq3.format.player_animation.setLerpFrameAnimation`. |
| `now` | `dynamic` | — | Now used in `(now < 0)` and `((state == void) or (now < 0))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L198)

<a id="function-function-mq3-format-player-animation-clone-function-clone-value-reversed-src-mq3-format-player-animation-ml-248296993"></a>
### clone

```ml
function clone(value, reversed)
```

Create `mq3.format.player_animation.Animation` with firstFrame=value.firstFrame; numFrames=value.numFrames; loopFrames=value.loopFrames; frameLerp=value.frameLerp; initialLerp=value.initialLerp; reversed=reversed; flipflop=value.flipflop.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `firstFrame`, `numFrames`, `loopFrames`, `frameLerp`, `initialLerp`, `flipflop`. |
| `reversed` | `dynamic` | — | Initial `reversed` field stored in the returned or constructed `mq3.format.player_animation.Animation` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L136)

- [mq3.format.player_animation.Config](Type-mq3-format-player-animation-config-1151437643.md) — struct
<a id="function-function-mq3-format-player-animation-enemyadvancefinished-function-enemyadvancefinished-state-now-lower-upper-src-mq3-format-player-animation-ml-989339258"></a>
### enemyAdvanceFinished

```ml
function enemyAdvanceFinished(state, now, lower, upper)
```

Update `state.mode`, `state.startedAt`, `state.transitionCount` in format.player_animation; the normal completion returns `true`.

Direct state writes: `state.mode`, `state.startedAt`, `state.transitionCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `mode`, `resumeMode`, `transitionCount`. Updated in place: `mode`, `startedAt`, `transitionCount`. |
| `now` | `dynamic` | — | Now operand used by `enemyAdvanceFinished`; its reads are shown in the implementation. |
| `lower` | `dynamic` | — | Record exposing `finished`. |
| `upper` | `dynamic` | — | Record exposing `finished`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L499)

- [mq3.format.player_animation.EnemyAnimationSample](Type-mq3-format-player-animation-enemyanimationsample-870130061.md) — struct
- [mq3.format.player_animation.EnemyAnimationSelection](Type-mq3-format-player-animation-enemyanimationselection-160737163.md) — struct
- [mq3.format.player_animation.EnemyAnimationState](Type-mq3-format-player-animation-enemyanimationstate-70235216.md) — struct
<a id="function-function-mq3-format-player-animation-enemyattack-function-enemyattack-state-now-src-mq3-format-player-animation-ml-144605581"></a>
### enemyAttack

```ml
function enemyAttack(state, now)
```

Test enemy attack in format.player_animation; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `mode`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.format.player_animation.enemyBegin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L433)

<a id="function-function-mq3-format-player-animation-enemybegin-function-enemybegin-state-mode-now-src-mq3-format-player-animation-ml-1406389656"></a>
### enemyBegin

```ml
function enemyBegin(state, mode, now)
```

Update `state.resumeMode`, `state.mode`, `state.startedAt`, `state.transitionCount` in format.player_animation.

Direct state writes: `state.resumeMode`, `state.mode`, `state.startedAt`, `state.transitionCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `startedAt`, `mode`, `transitionCount`. Updated in place: `resumeMode`, `mode`, `startedAt`, `transitionCount`. |
| `mode` | `dynamic` | — | Mode passed as `mode` to `mq3.format.player_animation.enemyValidMode`. |
| `now` | `dynamic` | — | Now used in `(now < state.startedAt)` and `(((state == void) or not enemyValidMode(mode)) or (now < state.startedAt))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L411)

<a id="function-function-mq3-format-player-animation-enemycreate-function-enemycreate-now-src-mq3-format-player-animation-ml-146043684"></a>
### enemyCreate

```ml
function enemyCreate(now)
```

Compute enemy create in format.player_animation; the normal completion returns `EnemyAnimationState("idle", "idle", now, 0, 0, lerpFrame(), lerpFrame())`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — | Initial `startedAt` field stored in the returned or constructed `mq3.format.player_animation.EnemyAnimationState` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L400)

<a id="function-function-mq3-format-player-animation-enemydie-function-enemydie-state-now-variant-src-mq3-format-player-animation-ml-784573588"></a>
### enemyDie

```ml
function enemyDie(state, now, variant)
```

Update `state.deathVariant` in format.player_animation; the normal completion returns `enemyBegin(state, "death", now)`.

Direct state writes: `state.deathVariant`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `deathVariant`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.format.player_animation.enemyBegin`. |
| `variant` | `dynamic` | — | Variant used in `(variant < 0)` and `(variant > 2)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L454)

<a id="function-function-mq3-format-player-animation-enemyfail-function-enemyfail-message-src-mq3-format-player-animation-ml-1509410411"></a>
### enemyFail

```ml
function enemyFail(message)
```

Create the format.player_animation error for `enemyFail` with 7540 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("preview enemy animation: " + message)` and `error(7540, ("preview enemy animation: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L387)

<a id="function-function-mq3-format-player-animation-enemyislocomotion-function-enemyislocomotion-mode-src-mq3-format-player-animation-ml-47003027"></a>
### enemyIsLocomotion

```ml
function enemyIsLocomotion(mode)
```

Compute format.player_animation.enemyIsLocomotion as `(((mode == "idle") or (mode == "walk")) or (mode == "run"))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — | Mode used in `(mode == "run")` and `(mode == "idle")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L390)

<a id="function-function-mq3-format-player-animation-enemyisterminal-function-enemyisterminal-mode-src-mq3-format-player-animation-ml-1333589229"></a>
### enemyIsTerminal

```ml
function enemyIsTerminal(mode)
```

Compute format.player_animation.enemyIsTerminal as `((mode == "death") or (mode == "dead"))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — | Mode used in `(mode == "dead")` and `(mode == "death")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L393)

<a id="function-function-mq3-format-player-animation-enemylocomote-function-enemylocomote-state-mode-now-src-mq3-format-player-animation-ml-398345300"></a>
### enemyLocomote

```ml
function enemyLocomote(state, mode, now)
```

Test enemy locomote in format.player_animation; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `mode`. |
| `mode` | `dynamic` | — | Mode passed as `mode` to `mq3.format.player_animation.enemyIsLocomotion`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.format.player_animation.enemyBegin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L423)

<a id="function-function-mq3-format-player-animation-enemylocomotionlower-function-enemylocomotionlower-mode-src-mq3-format-player-animation-ml-930216373"></a>
### enemyLocomotionLower

```ml
function enemyLocomotionLower(mode)
```

Compute enemy locomotion lower in format.player_animation; the normal completion returns `LEGS_IDLE`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — | Mode used in `(mode == "run")` and `(mode == "walk")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L472)

<a id="function-function-mq3-format-player-animation-enemypain-function-enemypain-state-now-src-mq3-format-player-animation-ml-311969101"></a>
### enemyPain

```ml
function enemyPain(state, now)
```

Test enemy pain in format.player_animation; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `mode`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.format.player_animation.enemyBegin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L442)

<a id="function-function-mq3-format-player-animation-enemyrespawn-function-enemyrespawn-state-now-src-mq3-format-player-animation-ml-2122400029"></a>
### enemyRespawn

```ml
function enemyRespawn(state, now)
```

Update `state.resumeMode` in format.player_animation; the normal completion returns `true`.

Direct state writes: `state.resumeMode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `mode`. Updated in place: `resumeMode`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.format.player_animation.enemyBegin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L464)

<a id="function-function-mq3-format-player-animation-enemysample-function-enemysample-config-state-now-src-mq3-format-player-animation-ml-638197879"></a>
### enemySample

```ml
function enemySample(config, state, now)
```

Apply `mq3.format.player_animation.enemyFail`, `mq3.format.player_animation.enemySelect`, `mq3.format.player_animation.clearLerpFrame` for enemy sample in format.player_animation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Config passed as `config` to `mq3.format.player_animation.clearLerpFrame`. |
| `state` | `dynamic` | — | Record exposing `startedAt`, `lowerLerp`, `upperLerp`, `mode`. |
| `now` | `dynamic` | — | Now passed as `now` to `mq3.format.player_animation.runLerpFrame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L514)

<a id="function-function-mq3-format-player-animation-enemyselect-function-enemyselect-state-src-mq3-format-player-animation-ml-1760480641"></a>
### enemySelect

```ml
function enemySelect(state)
```

Baseq3 has no player pain row; TORSO_GESTURE is used as the preview flinch.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `mode`, `resumeMode`, `deathVariant`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L480)

<a id="function-function-mq3-format-player-animation-enemyvalidmode-function-enemyvalidmode-mode-src-mq3-format-player-animation-ml-366836973"></a>
### enemyValidMode

```ml
function enemyValidMode(mode)
```

Compute format.player_animation.enemyValidMode as `((((enemyIsLocomotion(mode) or (mode == "attack")) or (mode == "pain")) or enemyIsTerminal(mode)) or (mode == "respawn"))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mode` | `dynamic` | — | Mode passed as `mode` to `mq3.format.player_animation.enemyIsLocomotion`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L396)

<a id="function-function-mq3-format-player-animation-fail-function-fail-message-src-mq3-format-player-animation-ml-1375043675"></a>
### fail

```ml
function fail(message)
```

Create the format.player_animation error for `fail` with 7520 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("animation.cfg: " + message)` and `error(7520, ("animation.cfg: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L123)

<a id="constant-constant-mq3-format-player-animation-flag-run-const-flag-run-33-src-mq3-format-player-animation-ml-1808242463"></a>
### FLAG_RUN

```ml
const FLAG_RUN = 33
```

Animation identifier for flag run.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L43)

<a id="constant-constant-mq3-format-player-animation-flag-stand-const-flag-stand-34-src-mq3-format-player-animation-ml-122054270"></a>
### FLAG_STAND

```ml
const FLAG_STAND = 34
```

Animation identifier for flag stand.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L45)

<a id="constant-constant-mq3-format-player-animation-flag-stand2run-const-flag-stand2run-35-src-mq3-format-player-animation-ml-1151806457"></a>
### FLAG_STAND2RUN

```ml
const FLAG_STAND2RUN = 35
```

Animation identifier for flag stand2 run.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L47)

<a id="function-function-mq3-format-player-animation-frameat-function-frameat-value-ordinal-src-mq3-format-player-animation-ml-264236488"></a>
### frameAt

```ml
function frameAt(value, ordinal)
```

Compute frame at in format.player_animation; the normal completion returns `(value.firstFrame + frame)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `flipflop`, `numFrames`, `reversed`, `firstFrame`. |
| `ordinal` | `dynamic` | — | Ordinal operand used by `frameAt`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L262)

- [mq3.format.player_animation.FrameSample](Type-mq3-format-player-animation-framesample-1730049312.md) — struct
<a id="constant-constant-mq3-format-player-animation-legs-backcr-const-legs-backcr-31-src-mq3-format-player-animation-ml-1137744803"></a>
### LEGS_BACKCR

```ml
const LEGS_BACKCR = 31
```

Animation identifier for legs backcr.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L39)

<a id="constant-constant-mq3-format-player-animation-legs-backwalk-const-legs-backwalk-32-src-mq3-format-player-animation-ml-312103252"></a>
### LEGS_BACKWALK

```ml
const LEGS_BACKWALK = 32
```

Animation identifier for legs backwalk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L41)

<a id="constant-constant-mq3-format-player-animation-legs-idle-const-legs-idle-22-src-mq3-format-player-animation-ml-2098176295"></a>
### LEGS_IDLE

```ml
const LEGS_IDLE = 22
```

Animation identifier for legs idle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L31)

<a id="constant-constant-mq3-format-player-animation-legs-run-const-legs-run-15-src-mq3-format-player-animation-ml-76757389"></a>
### LEGS_RUN

```ml
const LEGS_RUN = 15
```

Animation identifier for legs run.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L29)

<a id="constant-constant-mq3-format-player-animation-legs-walk-const-legs-walk-14-src-mq3-format-player-animation-ml-1734911524"></a>
### LEGS_WALK

```ml
const LEGS_WALK = 14
```

Animation identifier for legs walk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L27)

<a id="constant-constant-mq3-format-player-animation-legs-walkcr-const-legs-walkcr-13-src-mq3-format-player-animation-ml-1400095387"></a>
### LEGS_WALKCR

```ml
const LEGS_WALKCR = 13
```

Animation identifier for legs walkcr.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L25)

<a id="function-function-mq3-format-player-animation-lerpframe-function-lerpframe-src-mq3-format-player-animation-ml-1255183898"></a>
### lerpFrame

```ml
function lerpFrame()
```

Stateful CG_SetLerpFrameAnimation / CG_RunLerpFrame.  Unlike sample(), this preserves the original initial-lerp, animation-toggle and hitch-clamp state across rendered frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L143)

- [mq3.format.player_animation.LerpFrame](Type-mq3-format-player-animation-lerpframe-665651353.md) — struct
<a id="constant-constant-mq3-format-player-animation-max-animations-const-max-animations-31-src-mq3-format-player-animation-ml-157199561"></a>
### MAX_ANIMATIONS

```ml
const MAX_ANIMATIONS = 31
```

Number of standard player animations before the additional flag animations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L37)

<a id="constant-constant-mq3-format-player-animation-max-totalanimations-const-max-totalanimations-36-src-mq3-format-player-animation-ml-1714581028"></a>
### MAX_TOTALANIMATIONS

```ml
const MAX_TOTALANIMATIONS = 36
```

Total player-animation table length including flag animations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L49)

<a id="function-function-mq3-format-player-animation-numberstarts-function-numberstarts-token-src-mq3-format-player-animation-ml-1830539961"></a>
### numberStarts

```ml
function numberStarts(token)
```

Compute number starts in format.player_animation; the normal completion returns `((raw[0] >= 48) and (raw[0] <= 57))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `token` | `dynamic` | — | Token used in `bytes(token)` and `(token == "")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L205)

<a id="function-function-mq3-format-player-animation-ordinalat-function-ordinalat-value-ordinal-src-mq3-format-player-animation-ml-83760520"></a>
### ordinalAt

```ml
function ordinalAt(value, ordinal)
```

Compute ordinal at in format.player_animation; the normal completion returns `(total - 1)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `numFrames`, `flipflop`, `loopFrames`. |
| `ordinal` | `dynamic` | — | Ordinal used in `(ordinal < total)` and `(ordinal - total)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L272)

<a id="function-function-mq3-format-player-animation-parse-function-parse-text-src-mq3-format-player-animation-ml-1275333111"></a>
### parse

```ml
function parse(text)
```

Matches CG_ParseAnimationFile, including optional directives, the lower.md3 frame-base correction, negative numFrames reversal and zero-fps fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.shared.parser.create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L213)

- [mq3.format.player_animation.PlayerSample](Type-mq3-format-player-animation-playersample-29064846.md) — struct
<a id="function-function-mq3-format-player-animation-render-function-render-model-surfaceindex-value-maxtriangles-src-mq3-format-player-animation-ml-1424259868"></a>
### render

```ml
function render(model, surfaceIndex, value, maxTriangles)
```

Render player animation in format.player_animation; the normal completion returns `md3.renderTriangles(model, surfaceIndex, value.frame, value.oldFrame, value.backlerp, maxTriangles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.format.md3.renderTriangles`. |
| `surfaceIndex` | `dynamic` | — | Surface index passed as `surfaceIndex` to `mq3.format.md3.renderTriangles`. |
| `value` | `dynamic` | — | Record exposing `frame`, `oldFrame`, `backlerp`. |
| `maxTriangles` | `dynamic` | — | Max triangles passed as `maxTriangles` to `mq3.format.md3.renderTriangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L323)

<a id="function-function-mq3-format-player-animation-renderat-function-renderat-model-surfaceindex-config-animationindex-elapsedms-maxtriangles-src-mq3-format-player-animation-ml-1187064141"></a>
### renderAt

```ml
function renderAt(model, surfaceIndex, config, animationIndex, elapsedMs, maxTriangles)
```

Render at in format.player_animation; the normal completion returns `render(model, surfaceIndex, value, maxTriangles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Model passed as `model` to `mq3.format.player_animation.render`. |
| `surfaceIndex` | `dynamic` | — | Surface index passed as `surfaceIndex` to `mq3.format.player_animation.render`. |
| `config` | `dynamic` | — | Config passed as `config` to `mq3.format.player_animation.sampleAnimation`. |
| `animationIndex` | `dynamic` | — | Index passed as `index` to `mq3.format.player_animation.sampleAnimation`. |
| `elapsedMs` | `dynamic` | — | Elapsed ms passed as `elapsedMs` to `mq3.format.player_animation.sampleAnimation`. |
| `maxTriangles` | `dynamic` | — | Max triangles passed as `maxTriangles` to `mq3.format.player_animation.render`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L335)

<a id="function-function-mq3-format-player-animation-runlerpframe-function-runlerpframe-config-state-newanimation-speedscale-now-enabled-src-mq3-format-player-animation-ml-1103453197"></a>
### runLerpFrame

```ml
function runLerpFrame(config, state, newAnimation, speedScale, now, enabled)
```

Update `state.oldFrame`, `state.frame`, `state.backlerp`, `state.oldFrameTime` in format.player_animation; the normal completion returns `FrameSample(state.oldFrame, state.frame, state.backlerp, finished)`.

Direct state writes: `state.oldFrame`, `state.frame`, `state.backlerp`, `state.oldFrameTime`, `state.frameTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Config passed as `config` to `mq3.format.player_animation.setLerpFrameAnimation`. |
| `state` | `dynamic` | — | Record exposing `animationNumber`, `animation`, `frameTime`, `frame`, `oldFrame`, `backlerp`, `animationTime` and further fields. Updated in place: `oldFrame`, `frame`, `backlerp`, `oldFrameTime`, `frameTime`. |
| `newAnimation` | `dynamic` | — | New animation passed as `newAnimation` to `mq3.format.player_animation.setLerpFrameAnimation`. |
| `speedScale` | `dynamic` | — | Speed scale used in `(speedScale < 0.0)` and `(frame * speedScale)`. |
| `now` | `dynamic` | — | Now used in `(now < 0)` and `(now + 200)`. |
| `enabled` | `dynamic` | — | Enabled operand used by `runLerpFrame`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L165)

<a id="function-function-mq3-format-player-animation-sample-function-sample-value-elapsedms-src-mq3-format-player-animation-ml-1234279601"></a>
### sample

```ml
function sample(value, elapsedMs)
```

Samples a sequence at elapsed milliseconds. backlerp is the weight of oldFrame expected by md3.renderTriangles/LerpMeshVertexes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `numFrames`, `frameLerp`, `loopFrames`, `flipflop`. |
| `elapsedMs` | `dynamic` | — | A passed as `a` to `mq3.compat.numeric.quotient`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L283)

<a id="function-function-mq3-format-player-animation-sampleanimation-function-sampleanimation-config-index-elapsedms-src-mq3-format-player-animation-ml-2125934120"></a>
### sampleAnimation

```ml
function sampleAnimation(config, index, elapsedMs)
```

Sample animation in format.player_animation; the normal completion returns `sample(config.animations[index], elapsedMs)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Record exposing `animations`. |
| `index` | `dynamic` | — | Zero-based index into `config.animations`. |
| `elapsedMs` | `dynamic` | — | Elapsed ms passed as `elapsedMs` to `mq3.format.player_animation.sample`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L302)

<a id="function-function-mq3-format-player-animation-sampleplayer-function-sampleplayer-config-loweranimation-upperanimation-elapsedms-src-mq3-format-player-animation-ml-2081302715"></a>
### samplePlayer

```ml
function samplePlayer(config, lowerAnimation, upperAnimation, elapsedMs)
```

Sample player in format.player_animation; the normal completion returns `PlayerSample(lower, upper)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Config passed as `config` to `mq3.format.player_animation.sampleAnimation`. |
| `lowerAnimation` | `dynamic` | — | Index passed as `index` to `mq3.format.player_animation.sampleAnimation`. |
| `upperAnimation` | `dynamic` | — | Index passed as `index` to `mq3.format.player_animation.sampleAnimation`. |
| `elapsedMs` | `dynamic` | — | Elapsed ms passed as `elapsedMs` to `mq3.format.player_animation.sampleAnimation`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L312)

<a id="function-function-mq3-format-player-animation-setlerpframeanimation-function-setlerpframeanimation-config-state-newanimation-src-mq3-format-player-animation-ml-1590960187"></a>
### setLerpFrameAnimation

```ml
function setLerpFrameAnimation(config, state, newAnimation)
```

Set lerp frame animation in format.player_animation; the normal completion returns `state`.

Direct state writes: `state.animationNumber`, `state.animation`, `state.animationTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | `dynamic` | — | Record exposing `animations`. |
| `state` | `dynamic` | — | Record exposing `frameTime`, `animation`. Updated in place: `animationNumber`, `animation`, `animationTime`. |
| `newAnimation` | `dynamic` | — | New animation used in `(newAnimation & ~ 128)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L150)

<a id="constant-constant-mq3-format-player-animation-torso-attack-const-torso-attack-7-src-mq3-format-player-animation-ml-1204017428"></a>
### TORSO_ATTACK

```ml
const TORSO_ATTACK = 7
```

Animation identifier for torso attack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L19)

<a id="constant-constant-mq3-format-player-animation-torso-gesture-const-torso-gesture-6-src-mq3-format-player-animation-ml-853609995"></a>
### TORSO_GESTURE

```ml
const TORSO_GESTURE = 6
```

Animation identifier for torso gesture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L17)

<a id="constant-constant-mq3-format-player-animation-torso-getflag-const-torso-getflag-25-src-mq3-format-player-animation-ml-12525420"></a>
### TORSO_GETFLAG

```ml
const TORSO_GETFLAG = 25
```

Animation identifier for torso a capture-the-flag order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L33)

<a id="constant-constant-mq3-format-player-animation-torso-negative-const-torso-negative-30-src-mq3-format-player-animation-ml-142449586"></a>
### TORSO_NEGATIVE

```ml
const TORSO_NEGATIVE = 30
```

Animation identifier for torso negative.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L35)

<a id="constant-constant-mq3-format-player-animation-torso-raise-const-torso-raise-10-src-mq3-format-player-animation-ml-1825865640"></a>
### TORSO_RAISE

```ml
const TORSO_RAISE = 10
```

Animation identifier for torso raise.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L21)

<a id="constant-constant-mq3-format-player-animation-torso-stand-const-torso-stand-11-src-mq3-format-player-animation-ml-1619710493"></a>
### TORSO_STAND

```ml
const TORSO_STAND = 11
```

Animation identifier for torso stand.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L23)
