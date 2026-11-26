# `src/mq3/client/playable_enemy_events.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_enemy_events`](Package-mq3-client-playable-enemy-events-855821976.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-client-playable-enemy-events-appendinput-function-appendinput-result-track-index-lower-upper-now-src-mq3-client-playable-enemy-events-ml-686305773"></a>
### appendInput

```ml
function appendInput(result, track, index, lower, upper, now)
```

Updates `result.inputs` during playable enemy events `appendInput`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Mutable playable enemy events record/storage; this routine assigns `result.inputs`. |
| `track` | `dynamic` | — | Record read through `track.actionSince`, `track.action`. |
| `index` | `dynamic` | — | Value used by `result.inputs=result.inputs+[Input(index,lower,upper,elapsed,track.action)]`. |
| `lower` | `dynamic` | — | Value used by `result.inputs=result.inputs+[Input(index,lower,upper,elapsed,track.action)]`. |
| `upper` | `dynamic` | — | Value used by `result.inputs=result.inputs+[Input(index,lower,upper,elapsed,track.action)]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L143)

<a id="constant-constant-mq3-client-playable-enemy-events-attack-milliseconds-const-attack-milliseconds-450-src-mq3-client-playable-enemy-events-ml-375995232"></a>
### ATTACK_MILLISECONDS

```ml
const ATTACK_MILLISECONDS = 450
```

Duration or scheduling interval in milliseconds controlling attack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L24)

<a id="function-function-mq3-client-playable-enemy-events-attacked-function-attacked-ai-index-src-mq3-client-playable-enemy-events-ml-956314784"></a>
### attacked

```ml
function attacked(ai, index)
```

Evaluates playable enemy events `attacked` and returns `false`, `true` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ai` | `dynamic` | — | Record read through `ai.events`. |
| `index` | `dynamic` | — | Value tested by `value.attacker==index` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L97)

<a id="function-function-mq3-client-playable-enemy-events-beginaction-function-beginaction-result-track-kind-index-now-emit-src-mq3-client-playable-enemy-events-ml-321866683"></a>
### beginAction

```ml
function beginAction(result, track, kind, index, now, emit)
```

Updates `track.action`, `track.actionSince`, `result.events` during playable enemy events `beginAction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Mutable playable enemy events record/storage; this routine assigns `result.events`. |
| `track` | `dynamic` | — | Mutable playable enemy events record/storage; this routine assigns `track.action`, `track.actionSince`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `index` | `dynamic` | — | Value used by `if emit then result.events=result.events+[Event(kind,index,now)] end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `emit` | `dynamic` | — | Value used by `if emit then result.events=result.events+[Event(kind,index,now)] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L130)

<a id="constant-constant-mq3-client-playable-enemy-events-both-death1-const-both-death1-0-src-mq3-client-playable-enemy-events-ml-918556761"></a>
### BOTH_DEATH1

```ml
const BOTH_DEATH1 = 0
```

SPDX-License-Identifier: GPL-2.0-or-later Per-opponent preview events and Q3 animation-state inputs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L5)

- [mq3.client.playable_enemy_events.Event](Type-mq3-client-playable-enemy-events-event-1429359326.md) — struct
<a id="function-function-mq3-client-playable-enemy-events-fail-function-fail-message-src-mq3-client-playable-enemy-events-ml-1740538231"></a>
### fail

```ml
function fail(message)
```

Creates the playable enemy events error `7550` with diagnostic text `"preview enemy events: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview enemy events: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L76)

<a id="function-function-mq3-client-playable-enemy-events-input-function-input-value-index-src-mq3-client-playable-enemy-events-ml-725041879"></a>
### input

```ml
function input(value, index)
```

Evaluates playable enemy events `input` and returns `fail("input index outside opponents")`, `value.inputs[index]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.inputs`. |
| `index` | `dynamic` | — | Value tested by `value==void or index<0 or index>=len(value.inputs)` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L201)

- [mq3.client.playable_enemy_events.Input](Type-mq3-client-playable-enemy-events-input-1017395398.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-events-legs-idle-const-legs-idle-22-src-mq3-client-playable-enemy-events-ml-2138760597"></a>
### LEGS_IDLE

```ml
const LEGS_IDLE = 22
```

Native lower-body animation slot for the idle sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L19)

<a id="constant-constant-mq3-client-playable-enemy-events-legs-run-const-legs-run-15-src-mq3-client-playable-enemy-events-ml-1310938667"></a>
### LEGS_RUN

```ml
const LEGS_RUN = 15
```

Native lower-body animation slot for the run sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L17)

<a id="constant-constant-mq3-client-playable-enemy-events-legs-walk-const-legs-walk-14-src-mq3-client-playable-enemy-events-ml-449727320"></a>
### LEGS_WALK

```ml
const LEGS_WALK = 14
```

Native lower-body animation slot for the walk sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L15)

<a id="function-function-mq3-client-playable-enemy-events-motionaction-function-motionaction-brain-ismoving-src-mq3-client-playable-enemy-events-ml-385801668"></a>
### motionAction

```ml
function motionAction(brain, isMoving)
```

Evaluates playable enemy events `motionAction` and returns `"idle"`, `"run"`, `"walk"` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `brain` | `dynamic` | — | Record read through `brain.mode`. |
| `isMoving` | `dynamic` | — | Value used by `if not isMoving then return "idle" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L117)

<a id="function-function-mq3-client-playable-enemy-events-moving-function-moving-track-target-brain-src-mq3-client-playable-enemy-events-ml-415254368"></a>
### moving

```ml
function moving(track, target, brain)
```

Detects chase/strafe/patrol AI modes or a changed target origin relative to the recorded track.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `track` | `dynamic` | — | Record read through `track.origin`. |
| `target` | `dynamic` | — | Record read through `target.origin`. |
| `brain` | `dynamic` | — | Record read through `brain.mode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L109)

<a id="constant-constant-mq3-client-playable-enemy-events-pain-milliseconds-const-pain-milliseconds-350-src-mq3-client-playable-enemy-events-ml-205183801"></a>
### PAIN_MILLISECONDS

```ml
const PAIN_MILLISECONDS = 350
```

Duration or scheduling interval in milliseconds controlling pain.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L22)

<a id="function-function-mq3-client-playable-enemy-events-point-function-point-value-src-mq3-client-playable-enemy-events-ml-463508165"></a>
### point

```ml
function point(value)
```

Copies the X, Y and Z components into a fresh playable enemy events vector.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L79)

<a id="function-function-mq3-client-playable-enemy-events-state-function-state-targetstate-now-src-mq3-client-playable-enemy-events-ml-1422810594"></a>
### state

```ml
function state(targetState, now)
```

Calls `mq3.client.playable_enemy_events.Track`, `mq3.client.playable_enemy_events.point`, `mq3.client.playable_enemy_events.State` from playable enemy events `state`. The final path returns `State(tracks,now,[],[])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L84)

- [mq3.client.playable_enemy_events.State](Type-mq3-client-playable-enemy-events-state-268949671.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-events-torso-attack-const-torso-attack-7-src-mq3-client-playable-enemy-events-ml-1338745422"></a>
### TORSO_ATTACK

```ml
const TORSO_ATTACK = 7
```

Native upper-body animation slot for the attack sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L9)

<a id="constant-constant-mq3-client-playable-enemy-events-torso-gesture-const-torso-gesture-6-src-mq3-client-playable-enemy-events-ml-387550331"></a>
### TORSO_GESTURE

```ml
const TORSO_GESTURE = 6
```

Native upper-body animation slot for the gesture sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L7)

<a id="constant-constant-mq3-client-playable-enemy-events-torso-raise-const-torso-raise-10-src-mq3-client-playable-enemy-events-ml-630035140"></a>
### TORSO_RAISE

```ml
const TORSO_RAISE = 10
```

Native upper-body animation slot for the raise sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L11)

<a id="constant-constant-mq3-client-playable-enemy-events-torso-stand-const-torso-stand-11-src-mq3-client-playable-enemy-events-ml-278293235"></a>
### TORSO_STAND

```ml
const TORSO_STAND = 11
```

Native upper-body animation slot for the stand sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L13)

- [mq3.client.playable_enemy_events.Track](Type-mq3-client-playable-enemy-events-track-871750161.md) — struct
<a id="function-function-mq3-client-playable-enemy-events-update-function-update-value-targetstate-ai-now-src-mq3-client-playable-enemy-events-ml-728717881"></a>
### update

```ml
function update(value, targetState, ai, now)
```

Call after target damage/update and enemyAi.step. Events describe transitions observed on this call; inputs remain complete for every opponent on every call.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable playable enemy events record/storage; this routine assigns `value.lastTime`, `value.inputs`, `value.events`. |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |
| `ai` | `dynamic` | — | Record read through `ai.brains`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_events.ml#L155)
