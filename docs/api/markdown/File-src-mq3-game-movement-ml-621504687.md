# `src/mq3/game/movement.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.movement`](Package-mq3-game-movement-984213995.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/game_internal_headers.ml` as `internal` → [src/mq3/game/game_internal_headers.ml](File-src-mq3-game-game-internal-headers-ml-370319487.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-movement-accelerate-function-accelerate-state-wishdir-wishspeed-accel-src-mq3-game-movement-ml-712332753"></a>
### accelerate

```ml
function accelerate(state, wishdir, wishspeed, accel)
```

Accelerate toward the requested movement direction, limiting the added speed to the remaining target speed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Movement state; accesses `velocity` and `frametime`. May update `state.velocity` in place. |
| `wishdir` | `dynamic` | — | Value passed as argument 2 to `mq3.shared.math.DotProduct`. |
| `wishspeed` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fsub`. |
| `accel` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L152)

<a id="function-function-mq3-game-movement-addevent-function-addevent-state-event-src-mq3-game-movement-ml-217927101"></a>
### addEvent

```ml
function addEvent(state, event)
```

Update `state.events[slot]`, `state.eventParms[slot]` and `state.eventSequence` during `addEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Movement state; accesses `eventSequence`, `events` and `eventParms`. May update `state.events[slot]`, `state.eventParms[slot]` and `state.eventSequence` in place. |
| `event` | `dynamic` | — | Player or entity event identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L101)

<a id="function-function-mq3-game-movement-addtouchent-function-addtouchent-state-entity-src-mq3-game-movement-ml-1890416392"></a>
### addTouchEnt

```ml
function addTouchEnt(state, entity)
```

Set `state.touches` to `state.touches+[entity]` in `mq3.game.movement.addTouchEnt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Movement state; accesses `touches`. May update `state.touches` in place. |
| `entity` | `dynamic` | — | Value used by `addTouchEnt` in `if entity == 1022 or len(state.touches) == 32 then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L89)

<a id="function-function-mq3-game-movement-clipvelocity-function-clipvelocity-velocity-normal-overbounce-src-mq3-game-movement-ml-1294174308"></a>
### clipVelocity

```ml
function clipVelocity(velocity, normal, overbounce)
```

Project velocity along a collision plane using the supplied overbounce factor.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `normal` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `overbounce` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L113)

<a id="function-function-mq3-game-movement-cmdscale-function-cmdscale-state-forward-right-up-src-mq3-game-movement-ml-1793007649"></a>
### cmdScale

```ml
function cmdScale(state, forward, right, up)
```

Normalize signed movement command axes to preserve the player speed limit during diagonal movement.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Movement state; accesses `speed`. |
| `forward` | `dynamic` | — | Value used by `cmdScale` in `for each input in [forward,right,up]`. |
| `right` | `dynamic` | — | Value used by `cmdScale` in `for each input in [forward,right,up]`. |
| `up` | `dynamic` | — | Value used by `cmdScale` in `for each input in [forward,right,up]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L167)

- [mq3.game.movement.Collision](Type-mq3-game-movement-collision-582373361.md) — struct
<a id="function-function-mq3-game-movement-copy-function-copy-v-src-mq3-game-movement-ml-1543934706"></a>
### copy

```ml
function copy(v)
```

Copy the three components of a movement vector into an independent array.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L82)

<a id="function-function-mq3-game-movement-create-function-create-tracefn-context-src-mq3-game-movement-ml-1081605290"></a>
### create

```ml
function create(traceFn, context)
```

Create a `mq3.game.movement.Movement` record, initializing `origin` as `[0.0,0.0,0.0]`, `velocity` as `[0.0,0.0,0.0]` and `mins` as `[-15.0,-15.0,-24.0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Initial value stored in `mq3.game.movement.Movement.traceFn`. |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L76)

<a id="function-function-mq3-game-movement-friction-function-friction-state-src-mq3-game-movement-ml-843375885"></a>
### friction

```ml
function friction(state)
```

Apply ground or water friction to the movement velocity while preserving the movement-state representation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Movement state; accesses `velocity`, `walking`, `waterlevel`, `groundFlags` and `pmFlags` and related fields. May update `state.velocity[0]`, `state.velocity[1]` and `state.velocity` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L121)

- [mq3.game.movement.Movement](Type-mq3-game-movement-movement-782007670.md) — struct
<a id="function-function-mq3-game-movement-slidemove-function-slidemove-state-gravity-src-mq3-game-movement-ml-35594123"></a>
### slideMove

```ml
function slideMove(state, gravity)
```

Update `state.velocity[2]`, `state.velocity`, `state.origin` and `state.velocity[axis]` and related state during `slideMove`. Return paths include `bumpcount != 0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Movement state; accesses `velocity`, `gravity`, `frametime`, `groundPlane` and `groundNormal` and related fields. May update `state.velocity[2]`, `state.velocity` and `state.origin` and additional fields in place. |
| `gravity` | `dynamic` | — | Value used by `slideMove` in `if gravity then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L185)

<a id="function-function-mq3-game-movement-stepslidemove-function-stepslidemove-state-gravity-src-mq3-game-movement-ml-1481808387"></a>
### stepSlideMove

```ml
function stepSlideMove(state, gravity)
```

Update `state.origin` and `state.velocity` during `stepSlideMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Movement state; accesses `origin`, `velocity` and `traceFn`. May update `state.origin` and `state.velocity` in place. |
| `gravity` | `dynamic` | — | Value used by `slideMove` in `if gravity then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/movement.ml#L268)
