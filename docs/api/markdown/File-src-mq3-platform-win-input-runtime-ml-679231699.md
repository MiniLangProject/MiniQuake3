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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L23)

<a id="function-function-mq3-platform-win-input-runtime-directionkey-function-directionkey-index-src-mq3-platform-win-input-runtime-ml-229138200"></a>
### directionKey

```ml
function directionKey(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L67)

<a id="function-function-mq3-platform-win-input-runtime-in-activate-function-in-activate-runtime-active-src-mq3-platform-win-input-runtime-ml-573141556"></a>
### IN_Activate

```ml
function IN_Activate(runtime, active)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `active` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L101)

<a id="function-function-mq3-platform-win-input-runtime-in-activatedimouse-function-in-activatedimouse-runtime-src-mq3-platform-win-input-runtime-ml-1826293860"></a>
### IN_ActivateDIMouse

```ml
function IN_ActivateDIMouse(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L33)

<a id="function-function-mq3-platform-win-input-runtime-in-activatemouse-function-in-activatemouse-runtime-src-mq3-platform-win-input-runtime-ml-1020629428"></a>
### IN_ActivateMouse

```ml
function IN_ActivateMouse(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L35)

<a id="function-function-mq3-platform-win-input-runtime-in-activatewin32mouse-function-in-activatewin32mouse-runtime-src-mq3-platform-win-input-runtime-ml-746754406"></a>
### IN_ActivateWin32Mouse

```ml
function IN_ActivateWin32Mouse(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L29)

<a id="function-function-mq3-platform-win-input-runtime-in-clearstates-function-in-clearstates-runtime-src-mq3-platform-win-input-runtime-ml-1945262132"></a>
### IN_ClearStates

```ml
function IN_ClearStates(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L106)

<a id="function-function-mq3-platform-win-input-runtime-in-deactivatedimouse-function-in-deactivatedimouse-runtime-src-mq3-platform-win-input-runtime-ml-859527860"></a>
### IN_DeactivateDIMouse

```ml
function IN_DeactivateDIMouse(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L34)

<a id="function-function-mq3-platform-win-input-runtime-in-deactivatemouse-function-in-deactivatemouse-runtime-src-mq3-platform-win-input-runtime-ml-1106560980"></a>
### IN_DeactivateMouse

```ml
function IN_DeactivateMouse(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L36)

<a id="function-function-mq3-platform-win-input-runtime-in-deactivatewin32mouse-function-in-deactivatewin32mouse-runtime-src-mq3-platform-win-input-runtime-ml-579753256"></a>
### IN_DeactivateWin32Mouse

```ml
function IN_DeactivateWin32Mouse(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L30)

<a id="function-function-mq3-platform-win-input-runtime-in-dimouse-function-in-dimouse-runtime-dx-dy-src-mq3-platform-win-input-runtime-ml-1686931573"></a>
### IN_DIMouse

```ml
function IN_DIMouse(runtime, dx, dy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L53)

<a id="function-function-mq3-platform-win-input-runtime-in-frame-function-in-frame-runtime-dx-dy-time-src-mq3-platform-win-input-runtime-ml-1301493262"></a>
### IN_Frame

```ml
function IN_Frame(runtime, dx, dy, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L102)

<a id="function-function-mq3-platform-win-input-runtime-in-init-function-in-init-runtime-directinputavailable-windowavailable-src-mq3-platform-win-input-runtime-ml-471872193"></a>
### IN_Init

```ml
function IN_Init(runtime, directInputAvailable, windowAvailable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `directInputAvailable` | `dynamic` | — |  |
| `windowAvailable` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L100)

<a id="function-function-mq3-platform-win-input-runtime-in-initdimouse-function-in-initdimouse-runtime-available-src-mq3-platform-win-input-runtime-ml-1628175499"></a>
### IN_InitDIMouse

```ml
function IN_InitDIMouse(runtime, available)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `available` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L31)

<a id="function-function-mq3-platform-win-input-runtime-in-initwin32mouse-function-in-initwin32mouse-runtime-src-mq3-platform-win-input-runtime-ml-1334958760"></a>
### IN_InitWin32Mouse

```ml
function IN_InitWin32Mouse(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L27)

<a id="function-function-mq3-platform-win-input-runtime-in-joymove-function-in-joymove-runtime-buttons-axes-pov-time-src-mq3-platform-win-input-runtime-ml-750091768"></a>
### IN_JoyMove

```ml
function IN_JoyMove(runtime, buttons, axes, pov, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `buttons` | `dynamic` | — |  |
| `axes` | `dynamic` | — |  |
| `pov` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L71)

<a id="function-function-mq3-platform-win-input-runtime-in-mouseevent-function-in-mouseevent-runtime-mstate-time-src-mq3-platform-win-input-runtime-ml-1614069161"></a>
### IN_MouseEvent

```ml
function IN_MouseEvent(runtime, mstate, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `mstate` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L43)

<a id="function-function-mq3-platform-win-input-runtime-in-mousemove-function-in-mousemove-runtime-dx-dy-time-src-mq3-platform-win-input-runtime-ml-595594338"></a>
### IN_MouseMove

```ml
function IN_MouseMove(runtime, dx, dy, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L55)

<a id="function-function-mq3-platform-win-input-runtime-in-shutdown-function-in-shutdown-runtime-src-mq3-platform-win-input-runtime-ml-1979417952"></a>
### IN_Shutdown

```ml
function IN_Shutdown(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L107)

<a id="function-function-mq3-platform-win-input-runtime-in-shutdowndimouse-function-in-shutdowndimouse-runtime-src-mq3-platform-win-input-runtime-ml-2085556212"></a>
### IN_ShutdownDIMouse

```ml
function IN_ShutdownDIMouse(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L32)

<a id="function-function-mq3-platform-win-input-runtime-in-shutdownmidi-function-in-shutdownmidi-runtime-src-mq3-platform-win-input-runtime-ml-2051395854"></a>
### IN_ShutdownMIDI

```ml
function IN_ShutdownMIDI(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L98)

<a id="function-function-mq3-platform-win-input-runtime-in-shutdownwin32mouse-function-in-shutdownwin32mouse-runtime-src-mq3-platform-win-input-runtime-ml-217478360"></a>
### IN_ShutdownWin32Mouse

```ml
function IN_ShutdownWin32Mouse(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L28)

<a id="function-function-mq3-platform-win-input-runtime-in-startup-function-in-startup-runtime-directinputavailable-windowavailable-src-mq3-platform-win-input-runtime-ml-86459393"></a>
### IN_Startup

```ml
function IN_Startup(runtime, directInputAvailable, windowAvailable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `directInputAvailable` | `dynamic` | — |  |
| `windowAvailable` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L99)

<a id="function-function-mq3-platform-win-input-runtime-in-startupjoystick-function-in-startupjoystick-runtime-enabled-available-buttoncount-axiscount-haspov-src-mq3-platform-win-input-runtime-ml-1643700584"></a>
### IN_StartupJoystick

```ml
function IN_StartupJoystick(runtime, enabled, available, buttonCount, axisCount, hasPov)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |
| `available` | `dynamic` | — |  |
| `buttonCount` | `dynamic` | — |  |
| `axisCount` | `dynamic` | — |  |
| `hasPov` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L62)

<a id="function-function-mq3-platform-win-input-runtime-in-startupmidi-function-in-startupmidi-runtime-enabled-device-channel-devicecount-src-mq3-platform-win-input-runtime-ml-1487829843"></a>
### IN_StartupMIDI

```ml
function IN_StartupMIDI(runtime, enabled, device, channel, deviceCount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |
| `device` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |
| `deviceCount` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L94)

<a id="function-function-mq3-platform-win-input-runtime-in-startupmouse-function-in-startupmouse-runtime-directinputavailable-windowavailable-src-mq3-platform-win-input-runtime-ml-870965749"></a>
### IN_StartupMouse

```ml
function IN_StartupMouse(runtime, directInputAvailable, windowAvailable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `directInputAvailable` | `dynamic` | — |  |
| `windowAvailable` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L37)

<a id="function-function-mq3-platform-win-input-runtime-in-win32mouse-function-in-win32mouse-runtime-dx-dy-src-mq3-platform-win-input-runtime-ml-1687757973"></a>
### IN_Win32Mouse

```ml
function IN_Win32Mouse(runtime, dx, dy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L54)

- [mq3.platform.win_input_runtime.InputEvent](Type-mq3-platform-win-input-runtime-inputevent-1720077469.md) — struct
- [mq3.platform.win_input_runtime.Joystick](Type-mq3-platform-win-input-runtime-joystick-764395571.md) — struct
<a id="function-function-mq3-platform-win-input-runtime-joytof-function-joytof-value-src-mq3-platform-win-input-runtime-ml-1986173147"></a>
### JoyToF

```ml
function JoyToF(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L60)

<a id="function-function-mq3-platform-win-input-runtime-joytoi-function-joytoi-value-src-mq3-platform-win-input-runtime-ml-605850879"></a>
### JoyToI

```ml
function JoyToI(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L61)

<a id="constant-constant-mq3-platform-win-input-runtime-k-aux1-const-k-aux1-217-src-mq3-platform-win-input-runtime-ml-441651501"></a>
### K_AUX1

```ml
const K_AUX1 = 217
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L15)

<a id="constant-constant-mq3-platform-win-input-runtime-k-downarrow-const-k-downarrow-133-src-mq3-platform-win-input-runtime-ml-821046014"></a>
### K_DOWNARROW

```ml
const K_DOWNARROW = 133
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L11)

<a id="constant-constant-mq3-platform-win-input-runtime-k-joy1-const-k-joy1-185-src-mq3-platform-win-input-runtime-ml-431438739"></a>
### K_JOY1

```ml
const K_JOY1 = 185
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L13)

<a id="constant-constant-mq3-platform-win-input-runtime-k-joy16-const-k-joy16-200-src-mq3-platform-win-input-runtime-ml-371044761"></a>
### K_JOY16

```ml
const K_JOY16 = 200
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L14)

<a id="constant-constant-mq3-platform-win-input-runtime-k-leftarrow-const-k-leftarrow-134-src-mq3-platform-win-input-runtime-ml-1300319831"></a>
### K_LEFTARROW

```ml
const K_LEFTARROW = 134
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L8)

<a id="constant-constant-mq3-platform-win-input-runtime-k-mouse1-const-k-mouse1-178-src-mq3-platform-win-input-runtime-ml-2111480225"></a>
### K_MOUSE1

```ml
const K_MOUSE1 = 178
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L12)

<a id="constant-constant-mq3-platform-win-input-runtime-k-rightarrow-const-k-rightarrow-135-src-mq3-platform-win-input-runtime-ml-341130660"></a>
### K_RIGHTARROW

```ml
const K_RIGHTARROW = 135
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L9)

<a id="constant-constant-mq3-platform-win-input-runtime-k-uparrow-const-k-uparrow-132-src-mq3-platform-win-input-runtime-ml-526268393"></a>
### K_UPARROW

```ml
const K_UPARROW = 132
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L10)

- [mq3.platform.win_input_runtime.Midi](Type-mq3-platform-win-input-runtime-midi-1199181544.md) — struct
<a id="function-function-mq3-platform-win-input-runtime-midi-noteoff-function-midi-noteoff-runtime-note-time-src-mq3-platform-win-input-runtime-ml-1207084631"></a>
### MIDI_NoteOff

```ml
function MIDI_NoteOff(runtime, note, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `note` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L83)

<a id="function-function-mq3-platform-win-input-runtime-midi-noteon-function-midi-noteon-runtime-note-velocity-time-src-mq3-platform-win-input-runtime-ml-1918219236"></a>
### MIDI_NoteOn

```ml
function MIDI_NoteOn(runtime, note, velocity, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `note` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L84)

<a id="function-function-mq3-platform-win-input-runtime-midiinfo-f-function-midiinfo-f-runtime-src-mq3-platform-win-input-runtime-ml-249836768"></a>
### MidiInfo_f

```ml
function MidiInfo_f(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L93)

<a id="function-function-mq3-platform-win-input-runtime-midiinproc-function-midiinproc-runtime-message-time-src-mq3-platform-win-input-runtime-ml-1815691848"></a>
### MidiInProc

```ml
function MidiInProc(runtime, message, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L88)

- [mq3.platform.win_input_runtime.Mouse](Type-mq3-platform-win-input-runtime-mouse-258179808.md) — struct
<a id="function-function-mq3-platform-win-input-runtime-queue-function-queue-runtime-time-type-value-value2-src-mq3-platform-win-input-runtime-ml-1053549389"></a>
### queue

```ml
function queue(runtime, time, type, value, value2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L26)

- [mq3.platform.win_input_runtime.Runtime](Type-mq3-platform-win-input-runtime-runtime-828973151.md) — struct
<a id="constant-constant-mq3-platform-win-input-runtime-se-key-const-se-key-1-src-mq3-platform-win-input-runtime-ml-1659505122"></a>
### SE_KEY

```ml
const SE_KEY = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L6)

<a id="constant-constant-mq3-platform-win-input-runtime-se-mouse-const-se-mouse-3-src-mq3-platform-win-input-runtime-ml-810311692"></a>
### SE_MOUSE

```ml
const SE_MOUSE = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L7)
