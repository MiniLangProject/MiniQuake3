# `src/mq3/client/playable_movement.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_movement`](Package-mq3-client-playable-movement-2018373597.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-playable-movement-clampdelta-function-clampdelta-milliseconds-src-mq3-client-playable-movement-ml-1107520688"></a>
### clampDelta

```ml
function clampDelta(milliseconds)
```

Evaluates playable movement `clampDelta` and returns `0`, `MAX_FRAME_MILLISECONDS`, `milliseconds` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `milliseconds` | `dynamic` | — | Time interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L67)

- [mq3.client.playable_movement.Controller](Type-mq3-client-playable-movement-controller-1211553373.md) — struct
<a id="function-function-mq3-client-playable-movement-create-function-create-world-position-src-mq3-client-playable-movement-ml-1844321705"></a>
### create

```ml
function create(world, position)
```

Calls `mq3.client.playable_movement.createWithTrace` from playable movement `create`. The final path returns `createWithTrace(worldTrace,world,position)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | world record passed to the playable movement helper calls. |
| `position` | `dynamic` | — | Value used by `return createWithTrace(worldTrace,world,position)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L60)

<a id="function-function-mq3-client-playable-movement-createwithtrace-function-createwithtrace-tracefn-context-position-src-mq3-client-playable-movement-ml-586476505"></a>
### createWithTrace

```ml
function createWithTrace(traceFn, context, position)
```

Calls `mq3.client.playable_movement.validPosition`, `mq3.game.movement.create`, `mq3.compat.numeric.f32` and additional helpers from playable movement `createWithTrace`. The final path returns `Controller(motion,false,false)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable movement helper calls. |
| `position` | `dynamic` | — | Sequence read at `position[0]`, `position[1]`, `position[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L47)

<a id="constant-constant-mq3-client-playable-movement-gravity-const-gravity-800-src-mq3-client-playable-movement-ml-1882356315"></a>
### GRAVITY

```ml
const GRAVITY = 800
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L11)

<a id="constant-constant-mq3-client-playable-movement-ground-normal-const-ground-normal-0-7-src-mq3-client-playable-movement-ml-1664979208"></a>
### GROUND_NORMAL

```ml
const GROUND_NORMAL = 0.7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L14)

<a id="constant-constant-mq3-client-playable-movement-ground-probe-const-ground-probe-0-25-src-mq3-client-playable-movement-ml-2000943228"></a>
### GROUND_PROBE

```ml
const GROUND_PROBE = 0.25
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L15)

<a id="function-function-mq3-client-playable-movement-groundcheck-function-groundcheck-controller-src-mq3-client-playable-movement-ml-1308565580"></a>
### groundCheck

```ml
function groundCheck(controller)
```

Updates `controller.grounded` during playable movement `groundCheck`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `controller` | `dynamic` | — | Mutable playable movement record/storage; this routine assigns `controller.grounded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L75)

<a id="function-function-mq3-client-playable-movement-isgrounded-function-isgrounded-controller-src-mq3-client-playable-movement-ml-412399066"></a>
### isGrounded

```ml
function isGrounded(controller)
```

Reads `controller.grounded` for playable movement `isGrounded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `controller` | `dynamic` | — | Record read through `controller.grounded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L180)

<a id="constant-constant-mq3-client-playable-movement-jump-velocity-const-jump-velocity-270-src-mq3-client-playable-movement-ml-1898330130"></a>
### JUMP_VELOCITY

```ml
const JUMP_VELOCITY = 270
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L13)

<a id="constant-constant-mq3-client-playable-movement-max-frame-milliseconds-const-max-frame-milliseconds-100-src-mq3-client-playable-movement-ml-1481079328"></a>
### MAX_FRAME_MILLISECONDS

```ml
const MAX_FRAME_MILLISECONDS = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L16)

<a id="constant-constant-mq3-client-playable-movement-player-mask-const-player-mask-33619969-src-mq3-client-playable-movement-ml-420317661"></a>
### PLAYER_MASK

```ml
const PLAYER_MASK = 33619969
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L10)

<a id="function-function-mq3-client-playable-movement-position-function-position-controller-src-mq3-client-playable-movement-ml-1862587438"></a>
### position

```ml
function position(controller)
```

Reads `controller.motion.origin` for playable movement `position`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `controller` | `dynamic` | — | Record read through `controller.motion.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L174)

<a id="constant-constant-mq3-client-playable-movement-speed-const-speed-320-src-mq3-client-playable-movement-ml-135381032"></a>
### SPEED

```ml
const SPEED = 320
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L12)

<a id="function-function-mq3-client-playable-movement-step-function-step-controller-yaw-forwardinput-rightinput-jumpdown-deltamilliseconds-src-mq3-client-playable-movement-ml-388928316"></a>
### step

```ml
function step(controller, yaw, forwardInput, rightInput, jumpDown, deltaMilliseconds)
```

Updates `controller.jumpHeld` during playable movement `step`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `controller` | `dynamic` | — | Mutable playable movement record/storage; this routine assigns `controller.jumpHeld`. |
| `yaw` | `dynamic` | — | Value used by `result=substep(controller,yaw,forwardInput,rightInput,jumpPressed,slice)`. |
| `forwardInput` | `dynamic` | — | Value used by `forwardInput=numeric.f32(forwardInput)`. |
| `rightInput` | `dynamic` | — | Value used by `rightInput=numeric.f32(rightInput)`. |
| `jumpDown` | `dynamic` | — | Value assigned to `controller.jumpHeld`. |
| `deltaMilliseconds` | `dynamic` | — | Elapsed simulation interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L145)

<a id="function-function-mq3-client-playable-movement-substep-function-substep-controller-yaw-forwardinput-rightinput-jumppressed-milliseconds-src-mq3-client-playable-movement-ml-943181992"></a>
### substep

```ml
function substep(controller, yaw, forwardInput, rightInput, jumpPressed, milliseconds)
```

Updates `controller.grounded` during playable movement `substep`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `controller` | `dynamic` | — | Mutable playable movement record/storage; this routine assigns `controller.grounded`. |
| `yaw` | `dynamic` | — | Value used by `wish=wishDirection(yaw,forwardInput,rightInput)`. |
| `forwardInput` | `dynamic` | — | Value used by `wish=wishDirection(yaw,forwardInput,rightInput)`. |
| `rightInput` | `dynamic` | — | Value used by `wish=wishDirection(yaw,forwardInput,rightInput)`. |
| `jumpPressed` | `dynamic` | — | Value used by `if jumpPressed and controller.grounded then`. |
| `milliseconds` | `dynamic` | — | Time interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L119)

<a id="constant-constant-mq3-client-playable-movement-substep-milliseconds-const-substep-milliseconds-8-src-mq3-client-playable-movement-ml-1056671623"></a>
### SUBSTEP_MILLISECONDS

```ml
const SUBSTEP_MILLISECONDS = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L17)

<a id="function-function-mq3-client-playable-movement-validposition-function-validposition-position-src-mq3-client-playable-movement-ml-133776601"></a>
### validPosition

```ml
function validPosition(position)
```

Computes `typeof(position)=="array" and len(position)==3` for playable movement `validPosition`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — | Sequence whose length/content is inspected by `validPosition`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L39)

<a id="function-function-mq3-client-playable-movement-velocity-function-velocity-controller-src-mq3-client-playable-movement-ml-47175174"></a>
### velocity

```ml
function velocity(controller)
```

Reads `controller.motion.velocity` for playable movement `velocity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `controller` | `dynamic` | — | Record read through `controller.motion.velocity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L177)

<a id="function-function-mq3-client-playable-movement-wishdirection-function-wishdirection-yaw-forwardinput-rightinput-src-mq3-client-playable-movement-ml-2061540662"></a>
### wishDirection

```ml
function wishDirection(yaw, forwardInput, rightInput)
```

Calls `mq3.shared.math.AngleVectors`, `mq3.compat.numeric.f32`, `mq3.compat.numeric.fadd` and additional helpers from playable movement `wishDirection`. The final path returns `[wish,numeric.fmul(SPEED,length)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `yaw` | `dynamic` | — | Value used by `axes=qmath.AngleVectors([0.0,numeric.f32(yaw),0.0])`. |
| `forwardInput` | `dynamic` | — | Value used by `wish=[numeric.fadd(numeric.fmul(forwardInput,axes[0][0]),numeric.fmul(rightInput,axes[1][0])),numeric.fadd(numeric.fmul(forwardInput,axes[0][1...`. |
| `rightInput` | `dynamic` | — | Value used by `wish=[numeric.fadd(numeric.fmul(forwardInput,axes[0][0]),numeric.fmul(rightInput,axes[1][0])),numeric.fadd(numeric.fmul(forwardInput,axes[0][1...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L102)

<a id="function-function-mq3-client-playable-movement-worldtrace-function-worldtrace-state-startpoint-endpoint-src-mq3-client-playable-movement-ml-1928580074"></a>
### worldTrace

```ml
function worldTrace(state, startPoint, endPoint)
```

Calls `mq3.collision.world.boxTrace`, `mq3.game.movement.Collision` from playable movement `worldTrace`. The final path returns `movement.Collision(hit.trace,hit.endpos,entity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.context`, `state.mins`, `state.maxs`, `state.mask`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_movement.ml#L30)
