# `src/mq3/platform/win_input_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.win_input_runtime`](Package-mq3-platform-win-input-runtime-2116688941.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-platform-win-input-runtime-create-function-create-src-mq3-platform-win-input-runtime-ml-60272350"></a>
### create

```ml
function create()
```

Constructs `mq3.platform.win_input_runtime.Runtime` with `appActive` = `false`, `mouse` = `Mouse(false,false,false,false,0,0,0)`, `joystick` = `Joystick(false,false,0,0,false,0,0,0.15,0.02)`, `midi` = `Midi(false,false,0,1,0)` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L104)

<a id="function-function-mq3-platform-win-input-runtime-directionkey-function-directionkey-index-src-mq3-platform-win-input-runtime-ml-229138200"></a>
### directionKey

```ml
function directionKey(index)
```

Returns `keys[index]` from `mq3.platform.win_input_runtime.directionKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Input used in the result expression `keys[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L209)

<a id="function-function-mq3-platform-win-input-runtime-in-activate-function-in-activate-runtime-active-src-mq3-platform-win-input-runtime-ml-573141556"></a>
### IN_Activate

```ml
function IN_Activate(runtime, active)
```

Updates `runtime.appActive` in `mq3.platform.win_input_runtime.IN_Activate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.appActive`. |
| `active` | `dynamic` | — | Value assigned to `runtime.appActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L283)

<a id="function-function-mq3-platform-win-input-runtime-in-activatedimouse-function-in-activatedimouse-runtime-src-mq3-platform-win-input-runtime-ml-1826293860"></a>
### IN_ActivateDIMouse

```ml
function IN_ActivateDIMouse(runtime)
```

Updates `runtime.mouse.active` in `mq3.platform.win_input_runtime.IN_ActivateDIMouse`; returns `runtime.mouse.active`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.mouse.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L135)

<a id="function-function-mq3-platform-win-input-runtime-in-activatemouse-function-in-activatemouse-runtime-src-mq3-platform-win-input-runtime-ml-1020629428"></a>
### IN_ActivateMouse

```ml
function IN_ActivateMouse(runtime)
```

Returns `IN_ActivateWin32Mouse(runtime)` from `mq3.platform.win_input_runtime.IN_ActivateMouse`; earlier branches return `IN_ActivateDIMouse(runtime)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record providing `runtime.mouse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L141)

<a id="function-function-mq3-platform-win-input-runtime-in-activatewin32mouse-function-in-activatewin32mouse-runtime-src-mq3-platform-win-input-runtime-ml-746754406"></a>
### IN_ActivateWin32Mouse

```ml
function IN_ActivateWin32Mouse(runtime)
```

Updates `runtime.mouse.active` in `mq3.platform.win_input_runtime.IN_ActivateWin32Mouse`; returns `runtime.mouse.active`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.mouse.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L122)

<a id="function-function-mq3-platform-win-input-runtime-in-clearstates-function-in-clearstates-runtime-src-mq3-platform-win-input-runtime-ml-1945262132"></a>
### IN_ClearStates

```ml
function IN_ClearStates(runtime)
```

Updates `runtime.mouse.oldButtonState` in `mq3.platform.win_input_runtime.IN_ClearStates`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.mouse.oldButtonState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L295)

<a id="function-function-mq3-platform-win-input-runtime-in-deactivatedimouse-function-in-deactivatedimouse-runtime-src-mq3-platform-win-input-runtime-ml-859527860"></a>
### IN_DeactivateDIMouse

```ml
function IN_DeactivateDIMouse(runtime)
```

Updates `runtime.mouse.active` in `mq3.platform.win_input_runtime.IN_DeactivateDIMouse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.mouse.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L138)

<a id="function-function-mq3-platform-win-input-runtime-in-deactivatemouse-function-in-deactivatemouse-runtime-src-mq3-platform-win-input-runtime-ml-1106560980"></a>
### IN_DeactivateMouse

```ml
function IN_DeactivateMouse(runtime)
```

Returns `void` from `mq3.platform.win_input_runtime.IN_DeactivateMouse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record providing `runtime.mouse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L144)

<a id="function-function-mq3-platform-win-input-runtime-in-deactivatewin32mouse-function-in-deactivatewin32mouse-runtime-src-mq3-platform-win-input-runtime-ml-579753256"></a>
### IN_DeactivateWin32Mouse

```ml
function IN_DeactivateWin32Mouse(runtime)
```

Updates `runtime.mouse.active` in `mq3.platform.win_input_runtime.IN_DeactivateWin32Mouse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.mouse.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L125)

<a id="function-function-mq3-platform-win-input-runtime-in-dimouse-function-in-dimouse-runtime-dx-dy-src-mq3-platform-win-input-runtime-ml-1686931573"></a>
### IN_DIMouse

```ml
function IN_DIMouse(runtime, dx, dy)
```

Returns `[dx,dy]` from `mq3.platform.win_input_runtime.IN_DIMouse`; earlier branches return `[0,0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record providing `runtime.mouse`. |
| `dx` | `dynamic` | — | Input used in the result expression `[dx,dy]`. |
| `dy` | `dynamic` | — | Input used in the result expression `[dx,dy]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L173)

<a id="function-function-mq3-platform-win-input-runtime-in-frame-function-in-frame-runtime-dx-dy-time-src-mq3-platform-win-input-runtime-ml-1301493262"></a>
### IN_Frame

```ml
function IN_Frame(runtime, dx, dy, time)
```

Returns `IN_MouseMove(runtime,dx,dy,time)` from `mq3.platform.win_input_runtime.IN_Frame`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record providing `runtime.mouse`, `runtime.appActive`. |
| `dx` | `dynamic` | — | Value forwarded as `dx` to `mq3.platform.win_input_runtime.IN_MouseMove`. |
| `dy` | `dynamic` | — | Value forwarded as `dy` to `mq3.platform.win_input_runtime.IN_MouseMove`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.win_input_runtime.IN_MouseMove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L289)

<a id="function-function-mq3-platform-win-input-runtime-in-init-function-in-init-runtime-directinputavailable-windowavailable-src-mq3-platform-win-input-runtime-ml-471872193"></a>
### IN_Init

```ml
function IN_Init(runtime, directInputAvailable, windowAvailable)
```

Returns `runtime` from `mq3.platform.win_input_runtime.IN_Init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Value forwarded as `runtime` to `mq3.platform.win_input_runtime.IN_Startup`. |
| `directInputAvailable` | `dynamic` | — | Value forwarded as `directInputAvailable` to `mq3.platform.win_input_runtime.IN_Startup`. |
| `windowAvailable` | `dynamic` | — | Value forwarded as `windowAvailable` to `mq3.platform.win_input_runtime.IN_Startup`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L279)

<a id="function-function-mq3-platform-win-input-runtime-in-initdimouse-function-in-initdimouse-runtime-available-src-mq3-platform-win-input-runtime-ml-1628175499"></a>
### IN_InitDIMouse

```ml
function IN_InitDIMouse(runtime, available)
```

Updates `runtime.mouse.directInput`, `runtime.mouse.initialized` in `mq3.platform.win_input_runtime.IN_InitDIMouse`; returns `available`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.mouse.directInput`, `runtime.mouse.initialized`. |
| `available` | `dynamic` | — | Value assigned to `runtime.mouse.directInput`, `runtime.mouse.initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L129)

<a id="function-function-mq3-platform-win-input-runtime-in-initwin32mouse-function-in-initwin32mouse-runtime-src-mq3-platform-win-input-runtime-ml-1334958760"></a>
### IN_InitWin32Mouse

```ml
function IN_InitWin32Mouse(runtime)
```

Updates `runtime.mouse.directInput`, `runtime.mouse.initialized` in `mq3.platform.win_input_runtime.IN_InitWin32Mouse`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.mouse.directInput`, `runtime.mouse.initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L116)

<a id="function-function-mq3-platform-win-input-runtime-in-joymove-function-in-joymove-runtime-buttons-axes-pov-time-src-mq3-platform-win-input-runtime-ml-750091768"></a>
### IN_JoyMove

```ml
function IN_JoyMove(runtime, buttons, axes, pov, time)
```

Builds `joy.oldButtons`, `joy.oldDirections` in `mq3.platform.win_input_runtime.IN_JoyMove`; returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record providing `runtime.joystick`. |
| `buttons` | `dynamic` | — | Value assigned to `joy.oldButtons`. |
| `axes` | `dynamic` | — | Indexed input read at `i`, `4`, `5`. |
| `pov` | `dynamic` | — | Input tested by `joy.hasPov`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.win_input_runtime.queue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L219)

<a id="function-function-mq3-platform-win-input-runtime-in-mouseevent-function-in-mouseevent-runtime-mstate-time-src-mq3-platform-win-input-runtime-ml-1614069161"></a>
### IN_MouseEvent

```ml
function IN_MouseEvent(runtime, mstate, time)
```

Updates `runtime.mouse.oldButtonState` in `mq3.platform.win_input_runtime.IN_MouseEvent`; returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.mouse.oldButtonState`. |
| `mstate` | `dynamic` | — | Value assigned to `runtime.mouse.oldButtonState`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.win_input_runtime.queue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L159)

<a id="function-function-mq3-platform-win-input-runtime-in-mousemove-function-in-mousemove-runtime-dx-dy-time-src-mq3-platform-win-input-runtime-ml-595594338"></a>
### IN_MouseMove

```ml
function IN_MouseMove(runtime, dx, dy, time)
```

Routes movement through the configured mouse path and queues a mouse event only for nonzero motion.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record providing `runtime.mouse`. |
| `dx` | `dynamic` | — | Value forwarded as `dx` to `mq3.platform.win_input_runtime.IN_Win32Mouse`. |
| `dy` | `dynamic` | — | Value forwarded as `dy` to `mq3.platform.win_input_runtime.IN_Win32Mouse`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.win_input_runtime.queue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L184)

<a id="function-function-mq3-platform-win-input-runtime-in-shutdown-function-in-shutdown-runtime-src-mq3-platform-win-input-runtime-ml-1979417952"></a>
### IN_Shutdown

```ml
function IN_Shutdown(runtime)
```

Updates `runtime.mouse.initialized` in `mq3.platform.win_input_runtime.IN_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.mouse.initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L298)

<a id="function-function-mq3-platform-win-input-runtime-in-shutdowndimouse-function-in-shutdowndimouse-runtime-src-mq3-platform-win-input-runtime-ml-2085556212"></a>
### IN_ShutdownDIMouse

```ml
function IN_ShutdownDIMouse(runtime)
```

Updates `runtime.mouse.directInput` in `mq3.platform.win_input_runtime.IN_ShutdownDIMouse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.mouse.directInput`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L132)

<a id="function-function-mq3-platform-win-input-runtime-in-shutdownmidi-function-in-shutdownmidi-runtime-src-mq3-platform-win-input-runtime-ml-2051395854"></a>
### IN_ShutdownMIDI

```ml
function IN_ShutdownMIDI(runtime)
```

Updates `runtime.midi.active` in `mq3.platform.win_input_runtime.IN_ShutdownMIDI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.midi.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L269)

<a id="function-function-mq3-platform-win-input-runtime-in-shutdownwin32mouse-function-in-shutdownwin32mouse-runtime-src-mq3-platform-win-input-runtime-ml-217478360"></a>
### IN_ShutdownWin32Mouse

```ml
function IN_ShutdownWin32Mouse(runtime)
```

Updates `runtime.mouse.active`, `runtime.mouse.initialized` in `mq3.platform.win_input_runtime.IN_ShutdownWin32Mouse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.mouse.active`, `runtime.mouse.initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L119)

<a id="function-function-mq3-platform-win-input-runtime-in-startup-function-in-startup-runtime-directinputavailable-windowavailable-src-mq3-platform-win-input-runtime-ml-86459393"></a>
### IN_Startup

```ml
function IN_Startup(runtime, directInputAvailable, windowAvailable)
```

Returns `runtime` from `mq3.platform.win_input_runtime.IN_Startup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Value forwarded as `runtime` to `mq3.platform.win_input_runtime.IN_StartupMouse`. |
| `directInputAvailable` | `dynamic` | — | Value forwarded as `directInputAvailable` to `mq3.platform.win_input_runtime.IN_StartupMouse`. |
| `windowAvailable` | `dynamic` | — | Value forwarded as `windowAvailable` to `mq3.platform.win_input_runtime.IN_StartupMouse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L274)

<a id="function-function-mq3-platform-win-input-runtime-in-startupjoystick-function-in-startupjoystick-runtime-enabled-available-buttoncount-axiscount-haspov-src-mq3-platform-win-input-runtime-ml-1643700584"></a>
### IN_StartupJoystick

```ml
function IN_StartupJoystick(runtime, enabled, available, buttonCount, axisCount, hasPov)
```

Updates `runtime.joystick.enabled`, `runtime.joystick.available`, `runtime.joystick.buttonCount`, `runtime.joystick.axisCount`, `runtime.joystick.hasPov` in `mq3.platform.win_input_runtime.IN_StartupJoystick`; returns `runtime.joystick.available`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.joystick.enabled`, `runtime.joystick.available`, `runtime.joystick.buttonCount`, `runtime.joystick.axisCount`, `runtime.joystick.hasPov`. |
| `enabled` | `dynamic` | — | Value assigned to `runtime.joystick.enabled`. |
| `available` | `dynamic` | — | Input used by `runtime.joystick.available=enabled and available`. |
| `buttonCount` | `dynamic` | — | Value assigned to `runtime.joystick.buttonCount`. |
| `axisCount` | `dynamic` | — | Value assigned to `runtime.joystick.axisCount`. |
| `hasPov` | `dynamic` | — | Value assigned to `runtime.joystick.hasPov`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L202)

<a id="function-function-mq3-platform-win-input-runtime-in-startupmidi-function-in-startupmidi-runtime-enabled-device-channel-devicecount-src-mq3-platform-win-input-runtime-ml-1487829843"></a>
### IN_StartupMIDI

```ml
function IN_StartupMIDI(runtime, enabled, device, channel, deviceCount)
```

Updates `runtime.midi.enabled`, `runtime.midi.device`, `runtime.midi.channel`, `runtime.midi.deviceCount`, `runtime.midi.active` in `mq3.platform.win_input_runtime.IN_StartupMIDI`; returns `runtime.midi.active`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.midi.enabled`, `runtime.midi.device`, `runtime.midi.channel`, `runtime.midi.deviceCount`, `runtime.midi.active`. |
| `enabled` | `dynamic` | — | Value assigned to `runtime.midi.enabled`. |
| `device` | `dynamic` | — | Value assigned to `runtime.midi.device`. |
| `channel` | `dynamic` | — | Value assigned to `runtime.midi.channel`. |
| `deviceCount` | `dynamic` | — | Value assigned to `runtime.midi.deviceCount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L263)

<a id="function-function-mq3-platform-win-input-runtime-in-startupmouse-function-in-startupmouse-runtime-directinputavailable-windowavailable-src-mq3-platform-win-input-runtime-ml-870965749"></a>
### IN_StartupMouse

```ml
function IN_StartupMouse(runtime, directInputAvailable, windowAvailable)
```

Updates `runtime.mouse.initialized`, `runtime.mouse.startupDelayed` in `mq3.platform.win_input_runtime.IN_StartupMouse`; returns `IN_InitWin32Mouse(runtime)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.mouse.initialized`, `runtime.mouse.startupDelayed`. |
| `directInputAvailable` | `dynamic` | — | Input tested by `directInputAvailable`. |
| `windowAvailable` | `dynamic` | — | Input tested by `not windowAvailable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L149)

<a id="function-function-mq3-platform-win-input-runtime-in-win32mouse-function-in-win32mouse-runtime-dx-dy-src-mq3-platform-win-input-runtime-ml-1687757973"></a>
### IN_Win32Mouse

```ml
function IN_Win32Mouse(runtime, dx, dy)
```

Returns `[dx,dy]` from `mq3.platform.win_input_runtime.IN_Win32Mouse`; earlier branches return `[0,0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record providing `runtime.mouse`. |
| `dx` | `dynamic` | — | Input used in the result expression `[dx,dy]`. |
| `dy` | `dynamic` | — | Input used in the result expression `[dx,dy]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L178)

- [mq3.platform.win_input_runtime.InputEvent](Type-mq3-platform-win-input-runtime-inputevent-1720077469.md) — struct
- [mq3.platform.win_input_runtime.Joystick](Type-mq3-platform-win-input-runtime-joystick-764395571.md) — struct
<a id="function-function-mq3-platform-win-input-runtime-joytof-function-joytof-value-src-mq3-platform-win-input-runtime-ml-1986173147"></a>
### JoyToF

```ml
function JoyToF(value)
```

Returns `result` from `mq3.platform.win_input_runtime.JoyToF`; earlier branches return `0.0-1.0`, `1.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used by `result=(value-32768)/32768.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L191)

<a id="function-function-mq3-platform-win-input-runtime-joytoi-function-joytoi-value-src-mq3-platform-win-input-runtime-ml-605850879"></a>
### JoyToI

```ml
function JoyToI(value)
```

Computes `value-32768` for `mq3.platform.win_input_runtime.JoyToI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value-32768`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L194)

<a id="constant-constant-mq3-platform-win-input-runtime-k-aux1-const-k-aux1-217-src-mq3-platform-win-input-runtime-ml-441651501"></a>
### K_AUX1

```ml
const K_AUX1 = 217
```

Engine input key code for auxiliary input button 1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L25)

<a id="constant-constant-mq3-platform-win-input-runtime-k-downarrow-const-k-downarrow-133-src-mq3-platform-win-input-runtime-ml-821046014"></a>
### K_DOWNARROW

```ml
const K_DOWNARROW = 133
```

Engine input key code for the down arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L17)

<a id="constant-constant-mq3-platform-win-input-runtime-k-joy1-const-k-joy1-185-src-mq3-platform-win-input-runtime-ml-431438739"></a>
### K_JOY1

```ml
const K_JOY1 = 185
```

Engine input key code for joystick button 1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L21)

<a id="constant-constant-mq3-platform-win-input-runtime-k-joy16-const-k-joy16-200-src-mq3-platform-win-input-runtime-ml-371044761"></a>
### K_JOY16

```ml
const K_JOY16 = 200
```

Engine input key code for joystick button 16.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L23)

<a id="constant-constant-mq3-platform-win-input-runtime-k-leftarrow-const-k-leftarrow-134-src-mq3-platform-win-input-runtime-ml-1300319831"></a>
### K_LEFTARROW

```ml
const K_LEFTARROW = 134
```

Engine input key code for the left arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L11)

<a id="constant-constant-mq3-platform-win-input-runtime-k-mouse1-const-k-mouse1-178-src-mq3-platform-win-input-runtime-ml-2111480225"></a>
### K_MOUSE1

```ml
const K_MOUSE1 = 178
```

Engine input key code for mouse button 1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L19)

<a id="constant-constant-mq3-platform-win-input-runtime-k-rightarrow-const-k-rightarrow-135-src-mq3-platform-win-input-runtime-ml-341130660"></a>
### K_RIGHTARROW

```ml
const K_RIGHTARROW = 135
```

Engine input key code for the right arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L13)

<a id="constant-constant-mq3-platform-win-input-runtime-k-uparrow-const-k-uparrow-132-src-mq3-platform-win-input-runtime-ml-526268393"></a>
### K_UPARROW

```ml
const K_UPARROW = 132
```

Engine input key code for the up arrow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L15)

- [mq3.platform.win_input_runtime.Midi](Type-mq3-platform-win-input-runtime-midi-1199181544.md) — struct
<a id="function-function-mq3-platform-win-input-runtime-midi-noteoff-function-midi-noteoff-runtime-note-time-src-mq3-platform-win-input-runtime-ml-1207084631"></a>
### MIDI_NoteOff

```ml
function MIDI_NoteOff(runtime, note, time)
```

Returns `true` from `mq3.platform.win_input_runtime.MIDI_NoteOff`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Value forwarded as `runtime` to `mq3.platform.win_input_runtime.queue`. |
| `note` | `dynamic` | — | Input used by `key=note-60+K_AUX1`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.win_input_runtime.queue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L235)

<a id="function-function-mq3-platform-win-input-runtime-midi-noteon-function-midi-noteon-runtime-note-velocity-time-src-mq3-platform-win-input-runtime-ml-1918219236"></a>
### MIDI_NoteOn

```ml
function MIDI_NoteOn(runtime, note, velocity, time)
```

Returns `true` from `mq3.platform.win_input_runtime.MIDI_NoteOn`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Value forwarded as `runtime` to `mq3.platform.win_input_runtime.MIDI_NoteOff`. |
| `note` | `dynamic` | — | Value forwarded as `note` to `mq3.platform.win_input_runtime.MIDI_NoteOff`. |
| `velocity` | `dynamic` | — | Input tested by `velocity==0`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.win_input_runtime.MIDI_NoteOff`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L241)

<a id="function-function-mq3-platform-win-input-runtime-midiinfo-f-function-midiinfo-f-runtime-src-mq3-platform-win-input-runtime-ml-249836768"></a>
### MidiInfo_f

```ml
function MidiInfo_f(runtime)
```

Returns `[runtime.midi.enabled,runtime.midi.device,runtime.midi.channel,runtime.midi.deviceCount,runtime.midi.active]` for `mq3.platform.win_input_runtime.MidiInfo_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record providing `runtime.midi`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L256)

<a id="function-function-mq3-platform-win-input-runtime-midiinproc-function-midiinproc-runtime-message-time-src-mq3-platform-win-input-runtime-ml-1815691848"></a>
### MidiInProc

```ml
function MidiInProc(runtime, message, time)
```

Filters a packed MIDI message by configured channel and dispatches note-on or note-off events.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record providing `runtime.midi`. |
| `message` | `dynamic` | — | Input used by `status=message&255`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.win_input_runtime.MIDI_NoteOn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L249)

- [mq3.platform.win_input_runtime.Mouse](Type-mq3-platform-win-input-runtime-mouse-258179808.md) — struct
<a id="function-function-mq3-platform-win-input-runtime-queue-function-queue-runtime-time-type-value-value2-src-mq3-platform-win-input-runtime-ml-1053549389"></a>
### queue

```ml
function queue(runtime, time, type, value, value2)
```

Updates `runtime.events` in `mq3.platform.win_input_runtime.queue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable record or buffer; this call updates `runtime.events`. |
| `time` | `dynamic` | — | Value used for `mq3.platform.win_input_runtime.InputEvent.time`. |
| `type` | `dynamic` | — | Value used for `mq3.platform.win_input_runtime.InputEvent.type`. |
| `value` | `dynamic` | — | Value used for `mq3.platform.win_input_runtime.InputEvent.value`. |
| `value2` | `dynamic` | — | Value used for `mq3.platform.win_input_runtime.InputEvent.value2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L113)

- [mq3.platform.win_input_runtime.Runtime](Type-mq3-platform-win-input-runtime-runtime-828973151.md) — struct
<a id="constant-constant-mq3-platform-win-input-runtime-se-key-const-se-key-1-src-mq3-platform-win-input-runtime-ml-1659505122"></a>
### SE_KEY

```ml
const SE_KEY = 1
```

System-event type carrying a key code and its press or release state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L7)

<a id="constant-constant-mq3-platform-win-input-runtime-se-mouse-const-se-mouse-3-src-mq3-platform-win-input-runtime-ml-810311692"></a>
### SE_MOUSE

```ml
const SE_MOUSE = 3
```

System-event type carrying relative horizontal and vertical mouse movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L9)
