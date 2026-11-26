# `src/mq3/client/input_command.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.input_command`](Package-mq3-client-input-command-269645981.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-client-input-command-accumulatemouse-function-accumulatemouse-state-dx-dy-src-mq3-client-input-command-ml-351532332"></a>
### accumulateMouse

```ml
function accumulateMouse(state, dx, dy)
```

Updates `state.mouseDx[state.mouseIndex]`, `state.mouseDy[state.mouseIndex]` during input command `accumulateMouse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable input command record/storage; this routine assigns `state.mouseDx[state.mouseIndex]`, `state.mouseDy[state.mouseIndex]`. |
| `dx` | `dynamic` | — | Value used by `if state==void or typeof(dx)!="int" or typeof(dy)!="int" then return error(7700,"input command: invalid mouse delta") end if`. |
| `dy` | `dynamic` | — | Value used by `if state==void or typeof(dx)!="int" or typeof(dy)!="int" then return error(7700,"input command: invalid mouse delta") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L94)

<a id="function-function-mq3-client-input-command-adjustangles-function-adjustangles-state-config-frametime-framemsec-src-mq3-client-input-command-ml-2084204174"></a>
### adjustAngles

```ml
function adjustAngles(state, config, frameTime, frameMsec)
```

Updates `state.viewangles[1]`, `state.viewangles[0]` during input command `adjustAngles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable input command record/storage; this routine assigns `state.viewangles[1]`, `state.viewangles[0]`. |
| `config` | `dynamic` | — | Record read through `config.angleSpeedKey`, `config.yawSpeed`, `config.pitchSpeed`. |
| `frameTime` | `dynamic` | — | Value used by `if not state.strafe.active then state.viewangles[1]=n.f32(state.viewangles[1]-scale*config.yawSpeed*keyState(state.right,frameTime,frameMsec))`. |
| `frameMsec` | `dynamic` | — | Elapsed frame interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L118)

<a id="function-function-mq3-client-input-command-angleshort-function-angleshort-value-src-mq3-client-input-command-ml-1984569151"></a>
### angleShort

```ml
function angleShort(value)
```

Computes `n.trunc32(value*65536.0/360.0)&65535` for input command `angleShort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `return n.trunc32(value*65536.0/360.0)&65535`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L43)

<a id="function-function-mq3-client-input-command-button-function-button-src-mq3-client-input-command-ml-1698313926"></a>
### button

```ml
function button()
```

Creates a `mq3.client.input_command.Button` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L24)

- [mq3.client.input_command.Button](Type-mq3-client-input-command-button-1295425149.md) — struct
<a id="constant-constant-mq3-client-input-command-button-any-const-button-any-2048-src-mq3-client-input-command-ml-1333872831"></a>
### BUTTON_ANY

```ml
const BUTTON_ANY = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L11)

<a id="constant-constant-mq3-client-input-command-button-attack-const-button-attack-1-src-mq3-client-input-command-ml-1937836016"></a>
### BUTTON_ATTACK

```ml
const BUTTON_ATTACK = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L8)

<a id="constant-constant-mq3-client-input-command-button-talk-const-button-talk-2-src-mq3-client-input-command-ml-799089129"></a>
### BUTTON_TALK

```ml
const BUTTON_TALK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L9)

<a id="constant-constant-mq3-client-input-command-button-walking-const-button-walking-16-src-mq3-client-input-command-ml-1682790380"></a>
### BUTTON_WALKING

```ml
const BUTTON_WALKING = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L10)

<a id="function-function-mq3-client-input-command-clampchar-function-clampchar-value-src-mq3-client-input-command-ml-1165281305"></a>
### clampChar

```ml
function clampChar(value)
```

Calls `mq3.compat.numeric.trunc32` from input command `clampChar`. The final path returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value< -128`, `value>127` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L38)

<a id="function-function-mq3-client-input-command-clearmouse-function-clearmouse-state-src-mq3-client-input-command-ml-1050656251"></a>
### clearMouse

```ml
function clearMouse(state)
```

Updates `state.mouseDx[0]`, `state.mouseDx[1]`, `state.mouseDy[0]`, `state.mouseDy[1]` during input command `clearMouse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable input command record/storage; this routine assigns `state.mouseDx[0]`, `state.mouseDx[1]`, `state.mouseDy[0]`, `state.mouseDy[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L100)

- [mq3.client.input_command.Command](Type-mq3-client-input-command-command-1791324198.md) — struct
<a id="function-function-mq3-client-input-command-commandbuttons-function-commandbuttons-state-command-keycatchers-anykeydown-src-mq3-client-input-command-ml-1892526559"></a>
### commandButtons

```ml
function commandButtons(state, command, keyCatchers, anyKeyDown)
```

Updates `command.buttons`, `state.buttons[index].wasPressed` during input command `commandButtons`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable input command record/storage; this routine assigns `state.buttons[index].wasPressed`. |
| `command` | `dynamic` | — | Mutable input command record/storage; this routine assigns `command.buttons`. |
| `keyCatchers` | `dynamic` | — | Value used by `if keyCatchers!=0 then command.buttons=command.buttons\|BUTTON_TALK end if`. |
| `anyKeyDown` | `dynamic` | — | Value used by `if anyKeyDown and keyCatchers==0 then command.buttons=command.buttons\|BUTTON_ANY end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L169)

- [mq3.client.input_command.Config](Type-mq3-client-input-command-config-767474203.md) — struct
<a id="function-function-mq3-client-input-command-create-function-create-pitch-yaw-roll-src-mq3-client-input-command-ml-102531456"></a>
### create

```ml
function create(pitch, yaw, roll)
```

Calls `mq3.client.input_command.button`, `mq3.client.input_command.State`, `mq3.compat.numeric.f32` from input command `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pitch` | `dynamic` | — | Value used by `return State(button(),button(),button(),button(),button(),button(),button(),button(),button(),button(),button(),button(),values,false,[n.f32(p...`. |
| `yaw` | `dynamic` | — | Value used by `return State(button(),button(),button(),button(),button(),button(),button(),button(),button(),button(),button(),button(),values,false,[n.f32(p...`. |
| `roll` | `dynamic` | — | Value used by `return State(button(),button(),button(),button(),button(),button(),button(),button(),button(),button(),button(),button(),values,false,[n.f32(p...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L31)

<a id="function-function-mq3-client-input-command-createcommand-function-createcommand-state-config-frametime-framemsec-servertime-weapon-cgamesensitivity-keycatchers-anykeydown-src-mq3-client-input-command-ml-140919699"></a>
### createCommand

```ml
function createCommand(state, config, frameTime, frameMsec, serverTime, weapon, cgameSensitivity, keyCatchers, anyKeyDown)
```

Updates `state.viewangles[0]` during input command `createCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable input command record/storage; this routine assigns `state.viewangles[0]`. |
| `config` | `dynamic` | — | Value used by `if state==void or config==void or frameMsec<=0 then return error(7700,"input command: invalid create") end if`. |
| `frameTime` | `dynamic` | — | Value used by `adjustAngles(state,config,frameTime,frameMsec)`. |
| `frameMsec` | `dynamic` | — | Elapsed frame interval in milliseconds. |
| `serverTime` | `dynamic` | — | Authoritative server timestamp in milliseconds. |
| `weapon` | `dynamic` | — | Value used by `command=Command([0,0,0],0,weapon&255,0,0,0,serverTime,[0.0,0.0,0.0])`. |
| `cgameSensitivity` | `dynamic` | — | Value used by `mouseMove(state,config,command,frameMsec,cgameSensitivity)`. |
| `keyCatchers` | `dynamic` | — | Value used by `commandButtons(state,command,keyCatchers,anyKeyDown)`. |
| `anyKeyDown` | `dynamic` | — | Value used by `commandButtons(state,command,keyCatchers,anyKeyDown)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L184)

<a id="function-function-mq3-client-input-command-defaults-function-defaults-src-mq3-client-input-command-ml-746014542"></a>
### defaults

```ml
function defaults()
```

Creates a `mq3.client.input_command.Config` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L26)

<a id="function-function-mq3-client-input-command-joystickevent-function-joystickevent-state-axis-value-src-mq3-client-input-command-ml-132357641"></a>
### joystickEvent

```ml
function joystickEvent(state, axis, value)
```

Updates `state.joystickAxis[axis]` during input command `joystickEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable input command record/storage; this routine assigns `state.joystickAxis[axis]`. |
| `axis` | `dynamic` | — | Value used by `if state==void or axis<0 or axis>=MAX_JOYSTICK_AXIS or value< -127 or value>127 then return error(7700,"input command: invalid joystick axis")...`. |
| `value` | `dynamic` | — | Value tested by `state==void or axis<0 or axis>=MAX_JOYSTICK_AXIS or value< -127 or value>127` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L108)

<a id="function-function-mq3-client-input-command-joystickmove-function-joystickmove-state-config-command-framemsec-src-mq3-client-input-command-ml-865505231"></a>
### joystickMove

```ml
function joystickMove(state, config, command, frameMsec)
```

Updates `command.buttons`, `state.viewangles[1]`, `command.rightmove`, `state.viewangles[0]` and additional values during input command `joystickMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable input command record/storage; this routine assigns `state.viewangles[1]`, `state.viewangles[0]`. |
| `config` | `dynamic` | — | Record read through `config.run`, `config.angleSpeedKey`, `config.yawSpeed`, `config.pitchSpeed`. |
| `command` | `dynamic` | — | Mutable input command record/storage; this routine assigns `command.buttons`, `command.rightmove`, `command.forwardmove`, `command.upmove`. |
| `frameMsec` | `dynamic` | — | Elapsed frame interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L157)

<a id="function-function-mq3-client-input-command-keydown-function-keydown-value-key-time-src-mq3-client-input-command-ml-197993219"></a>
### keyDown

```ml
function keyDown(value, key, time)
```

IN_KeyDown/IN_KeyUp preserve two independent physical sources and exact sub-frame timestamps. A zero timestamp on release means half a frame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable input command record/storage; this routine assigns `value.down0`, `value.down1`, `value.downtime`, `value.active` and additional values. |
| `key` | `dynamic` | — | Value assigned to `value.down0`, `value.down1`. |
| `time` | `dynamic` | — | Value assigned to `value.downtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L50)

<a id="function-function-mq3-client-input-command-keymove-function-keymove-state-config-command-frametime-framemsec-src-mq3-client-input-command-ml-2050745353"></a>
### keyMove

```ml
function keyMove(state, config, command, frameTime, frameMsec)
```

Updates `command.buttons`, `command.forwardmove`, `command.rightmove`, `command.upmove` during input command `keyMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.speed.active`, `state.strafe.active`, `state.right`, `state.left` and additional values. |
| `config` | `dynamic` | — | Record read through `config.run`. |
| `command` | `dynamic` | — | Mutable input command record/storage; this routine assigns `command.buttons`, `command.forwardmove`, `command.rightmove`, `command.upmove`. |
| `frameTime` | `dynamic` | — | Value used by `if state.strafe.active then side=side+n.trunc32(moveSpeed*keyState(state.right,frameTime,frameMsec))`. |
| `frameMsec` | `dynamic` | — | Elapsed frame interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L129)

<a id="function-function-mq3-client-input-command-keystate-function-keystate-value-frametime-framemsec-src-mq3-client-input-command-ml-781548716"></a>
### keyState

```ml
function keyState(value, frameTime, frameMsec)
```

Updates `value.msec`, `value.downtime` during input command `keyState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable input command record/storage; this routine assigns `value.msec`, `value.downtime`. |
| `frameTime` | `dynamic` | — | Value assigned to `value.downtime`. |
| `frameMsec` | `dynamic` | — | Elapsed frame interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L83)

<a id="function-function-mq3-client-input-command-keyup-function-keyup-value-key-time-framemsec-src-mq3-client-input-command-ml-1400370686"></a>
### keyUp

```ml
function keyUp(value, key, time, frameMsec)
```

Updates `value.down0`, `value.down1`, `value.active`, `value.msec` during input command `keyUp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Mutable input command record/storage; this routine assigns `value.down0`, `value.down1`, `value.active`, `value.msec`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding input command entry. |
| `time` | `dynamic` | — | Value used by `if value==void or typeof(key)!="int" or typeof(time)!="int" or typeof(frameMsec)!="int" or time<0 or frameMsec<=0 then return error(7700,"inpu...`. |
| `frameMsec` | `dynamic` | — | Elapsed frame interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L62)

<a id="constant-constant-mq3-client-input-command-max-joystick-axis-const-max-joystick-axis-16-src-mq3-client-input-command-ml-712909698"></a>
### MAX_JOYSTICK_AXIS

```ml
const MAX_JOYSTICK_AXIS = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L12)

<a id="function-function-mq3-client-input-command-mousemove-function-mousemove-state-config-command-framemsec-cgamesensitivity-src-mq3-client-input-command-ml-1098644317"></a>
### mouseMove

```ml
function mouseMove(state, config, command, frameMsec, cgameSensitivity)
```

Updates `state.mouseIndex`, `state.mouseDx[state.mouseIndex]`, `state.mouseDy[state.mouseIndex]`, `command.rightmove` and additional values during input command `mouseMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable input command record/storage; this routine assigns `state.mouseIndex`, `state.mouseDx[state.mouseIndex]`, `state.mouseDy[state.mouseIndex]`, `state.viewangles[1]` and additional values. |
| `config` | `dynamic` | — | Record read through `config.filter`, `config.sensitivity`, `config.mouseAccel`, `config.mouseSide` and additional values. |
| `command` | `dynamic` | — | Mutable input command record/storage; this routine assigns `command.rightmove`, `command.forwardmove`. |
| `frameMsec` | `dynamic` | — | Elapsed frame interval in milliseconds. |
| `cgameSensitivity` | `dynamic` | — | Value used by `acceleration=(config.sensitivity+rate*config.mouseAccel)*cgameSensitivity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L144)

<a id="function-function-mq3-client-input-command-setpolled-function-setpolled-value-active-time-framemsec-src-mq3-client-input-command-ml-1375195715"></a>
### setPolled

```ml
function setPolled(value, active, time, frameMsec)
```

Calls `mq3.client.input_command.keyDown`, `mq3.client.input_command.keyUp` from input command `setPolled`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.active`. |
| `active` | `dynamic` | — | Value used by `if active and not value.active then return keyDown(value,1,time) end if`. |
| `time` | `dynamic` | — | Value used by `if active and not value.active then return keyDown(value,1,time) end if`. |
| `frameMsec` | `dynamic` | — | Elapsed frame interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command.ml#L74)

- [mq3.client.input_command.State](Type-mq3-client-input-command-state-1220533610.md) — struct
