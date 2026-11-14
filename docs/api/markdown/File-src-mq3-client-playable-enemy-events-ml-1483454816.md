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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — |  |
| `track` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `lower` | `dynamic` | — |  |
| `upper` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L60)

<a id="constant-constant-mq3-client-playable-enemy-events-attack-milliseconds-const-attack-milliseconds-450-src-mq3-client-playable-enemy-events-ml-375995232"></a>
### ATTACK_MILLISECONDS

```ml
const ATTACK_MILLISECONDS = 450
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L15)

<a id="function-function-mq3-client-playable-enemy-events-attacked-function-attacked-ai-index-src-mq3-client-playable-enemy-events-ml-956314784"></a>
### attacked

```ml
function attacked(ai, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ai` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L35)

<a id="function-function-mq3-client-playable-enemy-events-beginaction-function-beginaction-result-track-kind-index-now-emit-src-mq3-client-playable-enemy-events-ml-321866683"></a>
### beginAction

```ml
function beginAction(result, track, kind, index, now, emit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — |  |
| `track` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `emit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L54)

<a id="constant-constant-mq3-client-playable-enemy-events-both-death1-const-both-death1-0-src-mq3-client-playable-enemy-events-ml-918556761"></a>
### BOTH_DEATH1

```ml
const BOTH_DEATH1 = 0
```

SPDX-License-Identifier: GPL-2.0-or-later Per-opponent preview events and Q3 animation-state inputs.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L5)

- [mq3.client.playable_enemy_events.Event](Type-mq3-client-playable-enemy-events-event-1429359326.md) — struct
<a id="function-function-mq3-client-playable-enemy-events-fail-function-fail-message-src-mq3-client-playable-enemy-events-ml-1740538231"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L22)

<a id="function-function-mq3-client-playable-enemy-events-input-function-input-value-index-src-mq3-client-playable-enemy-events-ml-725041879"></a>
### input

```ml
function input(value, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L111)

- [mq3.client.playable_enemy_events.Input](Type-mq3-client-playable-enemy-events-input-1017395398.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-events-legs-idle-const-legs-idle-22-src-mq3-client-playable-enemy-events-ml-2138760597"></a>
### LEGS_IDLE

```ml
const LEGS_IDLE = 22
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L12)

<a id="constant-constant-mq3-client-playable-enemy-events-legs-run-const-legs-run-15-src-mq3-client-playable-enemy-events-ml-1310938667"></a>
### LEGS_RUN

```ml
const LEGS_RUN = 15
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L11)

<a id="constant-constant-mq3-client-playable-enemy-events-legs-walk-const-legs-walk-14-src-mq3-client-playable-enemy-events-ml-449727320"></a>
### LEGS_WALK

```ml
const LEGS_WALK = 14
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L10)

<a id="function-function-mq3-client-playable-enemy-events-motionaction-function-motionaction-brain-ismoving-src-mq3-client-playable-enemy-events-ml-385801668"></a>
### motionAction

```ml
function motionAction(brain, isMoving)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `brain` | `dynamic` | — |  |
| `isMoving` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L48)

<a id="function-function-mq3-client-playable-enemy-events-moving-function-moving-track-target-brain-src-mq3-client-playable-enemy-events-ml-415254368"></a>
### moving

```ml
function moving(track, target, brain)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `track` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `brain` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L43)

<a id="constant-constant-mq3-client-playable-enemy-events-pain-milliseconds-const-pain-milliseconds-350-src-mq3-client-playable-enemy-events-ml-205183801"></a>
### PAIN_MILLISECONDS

```ml
const PAIN_MILLISECONDS = 350
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L14)

<a id="function-function-mq3-client-playable-enemy-events-point-function-point-value-src-mq3-client-playable-enemy-events-ml-463508165"></a>
### point

```ml
function point(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L23)

<a id="function-function-mq3-client-playable-enemy-events-state-function-state-targetstate-now-src-mq3-client-playable-enemy-events-ml-1422810594"></a>
### state

```ml
function state(targetState, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L25)

- [mq3.client.playable_enemy_events.State](Type-mq3-client-playable-enemy-events-state-268949671.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-events-torso-attack-const-torso-attack-7-src-mq3-client-playable-enemy-events-ml-1338745422"></a>
### TORSO_ATTACK

```ml
const TORSO_ATTACK = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L7)

<a id="constant-constant-mq3-client-playable-enemy-events-torso-gesture-const-torso-gesture-6-src-mq3-client-playable-enemy-events-ml-387550331"></a>
### TORSO_GESTURE

```ml
const TORSO_GESTURE = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L6)

<a id="constant-constant-mq3-client-playable-enemy-events-torso-raise-const-torso-raise-10-src-mq3-client-playable-enemy-events-ml-630035140"></a>
### TORSO_RAISE

```ml
const TORSO_RAISE = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L8)

<a id="constant-constant-mq3-client-playable-enemy-events-torso-stand-const-torso-stand-11-src-mq3-client-playable-enemy-events-ml-278293235"></a>
### TORSO_STAND

```ml
const TORSO_STAND = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L9)

- [mq3.client.playable_enemy_events.Track](Type-mq3-client-playable-enemy-events-track-871750161.md) — struct
<a id="function-function-mq3-client-playable-enemy-events-update-function-update-value-targetstate-ai-now-src-mq3-client-playable-enemy-events-ml-728717881"></a>
### update

```ml
function update(value, targetState, ai, now)
```

Call after target damage/update and enemyAi.step. Events describe transitions observed on this call; inputs remain complete for every opponent on every call.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `ai` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_events.ml#L68)
