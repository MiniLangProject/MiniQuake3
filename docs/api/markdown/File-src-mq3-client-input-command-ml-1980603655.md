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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L59)

<a id="function-function-mq3-client-input-command-adjustangles-function-adjustangles-state-config-frametime-framemsec-src-mq3-client-input-command-ml-2084204174"></a>
### adjustAngles

```ml
function adjustAngles(state, config, frameTime, frameMsec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |
| `frameMsec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L72)

<a id="function-function-mq3-client-input-command-angleshort-function-angleshort-value-src-mq3-client-input-command-ml-1984569151"></a>
### angleShort

```ml
function angleShort(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L29)

<a id="function-function-mq3-client-input-command-button-function-button-src-mq3-client-input-command-ml-1698313926"></a>
### button

```ml
function button()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L19)

- [mq3.client.input_command.Button](Type-mq3-client-input-command-button-1295425149.md) — struct
<a id="constant-constant-mq3-client-input-command-button-any-const-button-any-2048-src-mq3-client-input-command-ml-1333872831"></a>
### BUTTON_ANY

```ml
const BUTTON_ANY = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L11)

<a id="constant-constant-mq3-client-input-command-button-attack-const-button-attack-1-src-mq3-client-input-command-ml-1937836016"></a>
### BUTTON_ATTACK

```ml
const BUTTON_ATTACK = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L8)

<a id="constant-constant-mq3-client-input-command-button-talk-const-button-talk-2-src-mq3-client-input-command-ml-799089129"></a>
### BUTTON_TALK

```ml
const BUTTON_TALK = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L9)

<a id="constant-constant-mq3-client-input-command-button-walking-const-button-walking-16-src-mq3-client-input-command-ml-1682790380"></a>
### BUTTON_WALKING

```ml
const BUTTON_WALKING = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L10)

<a id="function-function-mq3-client-input-command-clampchar-function-clampchar-value-src-mq3-client-input-command-ml-1165281305"></a>
### clampChar

```ml
function clampChar(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L26)

<a id="function-function-mq3-client-input-command-clearmouse-function-clearmouse-state-src-mq3-client-input-command-ml-1050656251"></a>
### clearMouse

```ml
function clearMouse(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L63)

- [mq3.client.input_command.Command](Type-mq3-client-input-command-command-1791324198.md) — struct
<a id="function-function-mq3-client-input-command-commandbuttons-function-commandbuttons-state-command-keycatchers-anykeydown-src-mq3-client-input-command-ml-1892526559"></a>
### commandButtons

```ml
function commandButtons(state, command, keyCatchers, anyKeyDown)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `keyCatchers` | `dynamic` | — |  |
| `anyKeyDown` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L101)

- [mq3.client.input_command.Config](Type-mq3-client-input-command-config-767474203.md) — struct
<a id="function-function-mq3-client-input-command-create-function-create-pitch-yaw-roll-src-mq3-client-input-command-ml-102531456"></a>
### create

```ml
function create(pitch, yaw, roll)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pitch` | `dynamic` | — |  |
| `yaw` | `dynamic` | — |  |
| `roll` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L21)

<a id="function-function-mq3-client-input-command-createcommand-function-createcommand-state-config-frametime-framemsec-servertime-weapon-cgamesensitivity-keycatchers-anykeydown-src-mq3-client-input-command-ml-140919699"></a>
### createCommand

```ml
function createCommand(state, config, frameTime, frameMsec, serverTime, weapon, cgameSensitivity, keyCatchers, anyKeyDown)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |
| `frameMsec` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `cgameSensitivity` | `dynamic` | — |  |
| `keyCatchers` | `dynamic` | — |  |
| `anyKeyDown` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L106)

<a id="function-function-mq3-client-input-command-defaults-function-defaults-src-mq3-client-input-command-ml-746014542"></a>
### defaults

```ml
function defaults()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L20)

<a id="function-function-mq3-client-input-command-joystickevent-function-joystickevent-state-axis-value-src-mq3-client-input-command-ml-132357641"></a>
### joystickEvent

```ml
function joystickEvent(state, axis, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L67)

<a id="function-function-mq3-client-input-command-joystickmove-function-joystickmove-state-config-command-framemsec-src-mq3-client-input-command-ml-865505231"></a>
### joystickMove

```ml
function joystickMove(state, config, command, frameMsec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `frameMsec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L94)

<a id="function-function-mq3-client-input-command-keydown-function-keydown-value-key-time-src-mq3-client-input-command-ml-197993219"></a>
### keyDown

```ml
function keyDown(value, key, time)
```

IN_KeyDown/IN_KeyUp preserve two independent physical sources and exact sub-frame timestamps. A zero timestamp on release means half a frame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L33)

<a id="function-function-mq3-client-input-command-keymove-function-keymove-state-config-command-frametime-framemsec-src-mq3-client-input-command-ml-2050745353"></a>
### keyMove

```ml
function keyMove(state, config, command, frameTime, frameMsec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |
| `frameMsec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L77)

<a id="function-function-mq3-client-input-command-keystate-function-keystate-value-frametime-framemsec-src-mq3-client-input-command-ml-781548716"></a>
### keyState

```ml
function keyState(value, frameTime, frameMsec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |
| `frameMsec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L52)

<a id="function-function-mq3-client-input-command-keyup-function-keyup-value-key-time-framemsec-src-mq3-client-input-command-ml-1400370686"></a>
### keyUp

```ml
function keyUp(value, key, time, frameMsec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `frameMsec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L40)

<a id="constant-constant-mq3-client-input-command-max-joystick-axis-const-max-joystick-axis-16-src-mq3-client-input-command-ml-712909698"></a>
### MAX_JOYSTICK_AXIS

```ml
const MAX_JOYSTICK_AXIS = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L12)

<a id="function-function-mq3-client-input-command-mousemove-function-mousemove-state-config-command-framemsec-cgamesensitivity-src-mq3-client-input-command-ml-1098644317"></a>
### mouseMove

```ml
function mouseMove(state, config, command, frameMsec, cgameSensitivity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `frameMsec` | `dynamic` | — |  |
| `cgameSensitivity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L86)

<a id="function-function-mq3-client-input-command-setpolled-function-setpolled-value-active-time-framemsec-src-mq3-client-input-command-ml-1375195715"></a>
### setPolled

```ml
function setPolled(value, active, time, frameMsec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `active` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `frameMsec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/input_command.ml#L47)

- [mq3.client.input_command.State](Type-mq3-client-input-command-state-1220533610.md) — struct
