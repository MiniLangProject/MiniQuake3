# `src/mq3/client/cl_input.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cl_input`](Package-mq3-client-cl-input-1679649989.md)

Reachable from entry: **no**

## Imports

- `mq3/client/command_ring.ml` as `commandRing` → [src/mq3/client/command_ring.ml](File-src-mq3-client-command-ring-ml-1850754325.md)
- `mq3/client/input_command.ml` as `input` → [src/mq3/client/input_command.ml](File-src-mq3-client-input-command-ml-1980603655.md)
- `mq3/client/send_cmd.ml` as `send` → [src/mq3/client/send_cmd.ml](File-src-mq3-client-send-cmd-ml-1342588170.md)
- `mq3/qcommon/command_buffer.ml` as `command` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)

## Declarations

<a id="extern_function-extern-function-mq3-client-cl-input-atoi-extern-function-atoi-text-as-cstr-from-ucrtbase-dll-returns-i32-src-mq3-client-cl-input-ml-1927826502"></a>
### atoi

```ml
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32
```

Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by engine client input.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — | NUL-terminated C string containing the decimal numeric text. |


**Returns:** The converted integer; a string with no initial numeric conversion yields zero.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L496)

<a id="function-function-mq3-client-cl-input-cl-adjustangles-function-cl-adjustangles-state-src-mq3-client-cl-input-ml-1975365763"></a>
### CL_AdjustAngles

```ml
function CL_AdjustAngles(state)
```

Adapts `mq3.client.input_command.adjustAngles` to engine client input `CL_AdjustAngles`, returning its result for `state.inputState, state.config, state.frameTime, state.frameMsec`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState`, `state.config`, `state.frameTime`, `state.frameMsec`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L370)

<a id="function-function-mq3-client-cl-input-cl-cmdbuttons-function-cl-cmdbuttons-state-value-src-mq3-client-cl-input-ml-63949894"></a>
### CL_CmdButtons

```ml
function CL_CmdButtons(state, value)
```

Adapts `mq3.client.input_command.commandButtons` to engine client input `CL_CmdButtons`, returning its result for `state.inputState, value, state.keyCatchers, state.anyKeyDown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState`, `state.keyCatchers`, `state.anyKeyDown`. |
| `value` | `dynamic` | — | Argument 2 of `mq3.client.input_command.commandButtons`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L407)

<a id="function-function-mq3-client-cl-input-cl-createcmd-function-cl-createcmd-state-src-mq3-client-cl-input-ml-1474617937"></a>
### CL_CreateCmd

```ml
function CL_CreateCmd(state)
```

Updates `state.inputState.viewangles[0]` during engine client input `CL_CreateCmd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client input record/storage; this routine assigns `state.inputState.viewangles[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L421)

<a id="function-function-mq3-client-cl-input-cl-createnewcommands-function-cl-createnewcommands-state-frametime-src-mq3-client-cl-input-ml-427316241"></a>
### CL_CreateNewCommands

```ml
function CL_CreateNewCommands(state, frameTime)
```

Updates `state.frameTime`, `state.frameMsec`, `state.sendState.frameMsec`, `state.sendState.oldFrameTime` and additional values during engine client input `CL_CreateNewCommands`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client input record/storage; this routine assigns `state.frameTime`, `state.frameMsec`, `state.sendState.frameMsec`, `state.sendState.oldFrameTime` and additional values. |
| `frameTime` | `dynamic` | — | Value assigned to `state.frameTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L434)

<a id="function-function-mq3-client-cl-input-cl-finishmove-function-cl-finishmove-state-value-src-mq3-client-cl-input-ml-921960012"></a>
### CL_FinishMove

```ml
function CL_FinishMove(state, value)
```

Updates `value.weapon`, `value.serverTime`, `value.angles`, `value.viewangles` during engine client input `CL_FinishMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.weapon`, `state.serverTime`, `state.inputState.viewangles`. |
| `value` | `dynamic` | — | Mutable engine client input record/storage; this routine assigns `value.weapon`, `value.serverTime`, `value.angles`, `value.viewangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L411)

<a id="function-function-mq3-client-cl-input-cl-initinput-function-cl-initinput-state-src-mq3-client-cl-input-ml-12096777"></a>
### CL_InitInput

```ml
function CL_InitInput(state)
```

Updates `state.initialized` during engine client input `CL_InitInput`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client input record/storage; this routine assigns `state.initialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L486)

<a id="function-function-mq3-client-cl-input-cl-joystickevent-function-cl-joystickevent-state-axis-value-time-src-mq3-client-cl-input-ml-853441562"></a>
### CL_JoystickEvent

```ml
function CL_JoystickEvent(state, axis, value, time)
```

Updates `state.inputState.joystickAxis[axis]` during engine client input `CL_JoystickEvent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client input record/storage; this routine assigns `state.inputState.joystickAxis[axis]`. |
| `axis` | `dynamic` | — | Value used by `if state==void or axis<0 or axis>=input.MAX_JOYSTICK_AXIS then return error(7740,"CL_JoystickEvent: bad axis "+str(axis)) end if`. |
| `value` | `dynamic` | — | Value used by `state.inputState.joystickAxis[axis]=value`. |
| `time` | `dynamic` | — | Accepted for compatibility with `CL_JoystickEvent`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L390)

<a id="function-function-mq3-client-cl-input-cl-joystickmove-function-cl-joystickmove-state-value-src-mq3-client-cl-input-ml-1032641602"></a>
### CL_JoystickMove

```ml
function CL_JoystickMove(state, value)
```

Adapts `mq3.client.input_command.joystickMove` to engine client input `CL_JoystickMove`, returning its result for `state.inputState, state.config, value, state.frameMsec`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState`, `state.config`, `state.frameMsec`. |
| `value` | `dynamic` | — | Argument 3 of `mq3.client.input_command.joystickMove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L399)

<a id="function-function-mq3-client-cl-input-cl-keymove-function-cl-keymove-state-value-src-mq3-client-cl-input-ml-1314695104"></a>
### CL_KeyMove

```ml
function CL_KeyMove(state, value)
```

Adapts `mq3.client.input_command.keyMove` to engine client input `CL_KeyMove`, returning its result for `state.inputState, state.config, value, state.frameTime, state.frameMsec`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState`, `state.config`, `state.frameTime`, `state.frameMsec`. |
| `value` | `dynamic` | — | Argument 3 of `mq3.client.input_command.keyMove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L374)

<a id="function-function-mq3-client-cl-input-cl-keystate-function-cl-keystate-state-value-src-mq3-client-cl-input-ml-2131410240"></a>
### CL_KeyState

```ml
function CL_KeyState(state, value)
```

Calls `mq3.client.input_command.keyState` from engine client input `CL_KeyState`. The final path returns `input.keyState(value,state.frameTime,state.frameMsec)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.frameTime`, `state.frameMsec`. |
| `value` | `dynamic` | — | Value used by `return input.keyState(value,state.frameTime,state.frameMsec)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L60)

<a id="function-function-mq3-client-cl-input-cl-mouseevent-function-cl-mouseevent-state-dx-dy-time-src-mq3-client-cl-input-ml-928895489"></a>
### CL_MouseEvent

```ml
function CL_MouseEvent(state, dx, dy, time)
```

Calls `state.host.uiMouseFn`, `state.host.cgameMouseFn`, `mq3.client.input_command.accumulateMouse` from engine client input `CL_MouseEvent`. The final path returns `"game"`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.keyCatchers`, `state.host.uiMouseFn`, `state.host.context`, `state.host.cgameMouseFn` and additional values. |
| `dx` | `dynamic` | — | Value used by `if (state.keyCatchers&KEYCATCH_UI)!=0 then if state.host.uiMouseFn!=void then state.host.uiMouseFn(state.host.context,dx,dy) end if`. |
| `dy` | `dynamic` | — | Value used by `if (state.keyCatchers&KEYCATCH_UI)!=0 then if state.host.uiMouseFn!=void then state.host.uiMouseFn(state.host.context,dx,dy) end if`. |
| `time` | `dynamic` | — | Accepted for compatibility with `CL_MouseEvent`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L380)

<a id="function-function-mq3-client-cl-input-cl-mousemove-function-cl-mousemove-state-value-src-mq3-client-cl-input-ml-903882160"></a>
### CL_MouseMove

```ml
function CL_MouseMove(state, value)
```

Adapts `mq3.client.input_command.mouseMove` to engine client input `CL_MouseMove`, returning its result for `state.inputState, state.config, value, state.frameMsec, state.cgameSensitivity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState`, `state.config`, `state.frameMsec`, `state.cgameSensitivity`. |
| `value` | `dynamic` | — | Argument 3 of `mq3.client.input_command.mouseMove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L403)

<a id="function-function-mq3-client-cl-input-cl-readytosendpacket-function-cl-readytosendpacket-state-src-mq3-client-cl-input-ml-1644932909"></a>
### CL_ReadyToSendPacket

```ml
function CL_ReadyToSendPacket(state)
```

Adapts `mq3.client.send_cmd.ready` to engine client input `CL_ReadyToSendPacket`, returning its result for `state.sendState, state.sendHost`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.sendState`, `state.sendHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L443)

<a id="function-function-mq3-client-cl-input-cl-sendcmd-function-cl-sendcmd-state-frametime-src-mq3-client-cl-input-ml-1808036709"></a>
### CL_SendCmd

```ml
function CL_SendCmd(state, frameTime)
```

Calls `mq3.client.cl_input.CL_CreateNewCommands`, `mq3.client.cl_input.CL_ReadyToSendPacket`, `mq3.client.cl_input.CL_WritePacket` from engine client input `CL_SendCmd`. The final path returns `CL_WritePacket(state)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.sendState`, `state.sendHost`, `state.sendState.connectionState`, `state.sendState.serverRunning` and additional values. |
| `frameTime` | `dynamic` | — | Value used by `created=CL_CreateNewCommands(state,frameTime)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L450)

<a id="function-function-mq3-client-cl-input-cl-writepacket-function-cl-writepacket-state-src-mq3-client-cl-input-ml-1518891581"></a>
### CL_WritePacket

```ml
function CL_WritePacket(state)
```

Adapts `mq3.client.send_cmd.writePacket` to engine client input `CL_WritePacket`, returning its result for `state.sendState, state.sendHost`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.sendState`, `state.sendHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L446)

<a id="function-function-mq3-client-cl-input-create-function-create-commandstate-sendstate-sendhost-src-mq3-client-cl-input-ml-1213589561"></a>
### create

```ml
function create(commandState, sendState, sendHost)
```

Creates a `mq3.client.cl_input.State` record. Assigns `sendState` from `sendState`, `sendHost` from `sendHost`, `commandState` from `commandState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | Value used to initialize `State.commandState`. |
| `sendState` | `dynamic` | — | Value used to initialize `State.sendState`. |
| `sendHost` | `dynamic` | — | Value used to initialize `State.sendHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L27)

<a id="function-function-mq3-client-cl-input-dispatchinputcommand-function-dispatchinputcommand-commandstate-state-src-mq3-client-cl-input-ml-1647361379"></a>
### dispatchInputCommand

```ml
function dispatchInputCommand(commandState, state)
```

Calls `mq3.qcommon.command_buffer.argv`, `mq3.qcommon.command_buffer.sameInsensitive`, `mq3.client.cl_input.IN_CenterView` and additional helpers from engine client input `dispatchInputCommand`. The final path returns `IN_KeyUp(state,target,key,time)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | commandState record passed to the engine client input helper calls. |
| `state` | `dynamic` | — | Record read through `state.inputState.up`, `state.inputState.down`, `state.inputState.left`, `state.inputState.right` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L462)

<a id="function-function-mq3-client-cl-input-emit-function-emit-state-text-src-mq3-client-cl-input-ml-1093561306"></a>
### emit

```ml
function emit(state, text)
```

Calls `state.host.printFn` from engine client input `emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.host`, `state.host.printFn`, `state.host.context`. |
| `text` | `dynamic` | — | Text consumed or emitted by `emit` in the engine client input path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L33)

- [mq3.client.cl_input.Host](Type-mq3-client-cl-input-host-1945411211.md) — struct
<a id="function-function-mq3-client-cl-input-hostservices-function-hostservices-src-mq3-client-cl-input-ml-1916266"></a>
### hostServices

```ml
function hostServices()
```

Creates a `mq3.client.cl_input.Host` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L22)

<a id="function-function-mq3-client-cl-input-in-backdown-function-in-backdown-state-key-time-src-mq3-client-cl-input-ml-1475151125"></a>
### IN_BackDown

```ml
function IN_BackDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_BackDown`, returning its result for `state, state.inputState.back, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.back`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L130)

<a id="function-function-mq3-client-cl-input-in-backup-function-in-backup-state-key-time-src-mq3-client-cl-input-ml-1867316091"></a>
### IN_BackUp

```ml
function IN_BackUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_BackUp`, returning its result for `state, state.inputState.back, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.back`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L135)

<a id="function-function-mq3-client-cl-input-in-button0down-function-in-button0down-state-key-time-src-mq3-client-cl-input-ml-217238691"></a>
### IN_Button0Down

```ml
function IN_Button0Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button0Down`, returning its result for `state, state.inputState.buttons[0], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L201)

<a id="function-function-mq3-client-cl-input-in-button0up-function-in-button0up-state-key-time-src-mq3-client-cl-input-ml-811283199"></a>
### IN_Button0Up

```ml
function IN_Button0Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button0Up`, returning its result for `state, state.inputState.buttons[0], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L206)

<a id="function-function-mq3-client-cl-input-in-button10down-function-in-button10down-state-key-time-src-mq3-client-cl-input-ml-1165708585"></a>
### IN_Button10Down

```ml
function IN_Button10Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button10Down`, returning its result for `state, state.inputState.buttons[10], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L301)

<a id="function-function-mq3-client-cl-input-in-button10up-function-in-button10up-state-key-time-src-mq3-client-cl-input-ml-266356751"></a>
### IN_Button10Up

```ml
function IN_Button10Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button10Up`, returning its result for `state, state.inputState.buttons[10], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L306)

<a id="function-function-mq3-client-cl-input-in-button11down-function-in-button11down-state-key-time-src-mq3-client-cl-input-ml-463118807"></a>
### IN_Button11Down

```ml
function IN_Button11Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button11Down`, returning its result for `state, state.inputState.buttons[11], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L311)

<a id="function-function-mq3-client-cl-input-in-button11up-function-in-button11up-state-key-time-src-mq3-client-cl-input-ml-362581649"></a>
### IN_Button11Up

```ml
function IN_Button11Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button11Up`, returning its result for `state, state.inputState.buttons[11], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L316)

<a id="function-function-mq3-client-cl-input-in-button12down-function-in-button12down-state-key-time-src-mq3-client-cl-input-ml-973607397"></a>
### IN_Button12Down

```ml
function IN_Button12Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button12Down`, returning its result for `state, state.inputState.buttons[12], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L321)

<a id="function-function-mq3-client-cl-input-in-button12up-function-in-button12up-state-key-time-src-mq3-client-cl-input-ml-158340247"></a>
### IN_Button12Up

```ml
function IN_Button12Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button12Up`, returning its result for `state, state.inputState.buttons[12], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L326)

<a id="function-function-mq3-client-cl-input-in-button13down-function-in-button13down-state-key-time-src-mq3-client-cl-input-ml-472039383"></a>
### IN_Button13Down

```ml
function IN_Button13Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button13Down`, returning its result for `state, state.inputState.buttons[13], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L331)

<a id="function-function-mq3-client-cl-input-in-button13up-function-in-button13up-state-key-time-src-mq3-client-cl-input-ml-848716789"></a>
### IN_Button13Up

```ml
function IN_Button13Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button13Up`, returning its result for `state, state.inputState.buttons[13], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L336)

<a id="function-function-mq3-client-cl-input-in-button14down-function-in-button14down-state-key-time-src-mq3-client-cl-input-ml-612983305"></a>
### IN_Button14Down

```ml
function IN_Button14Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button14Down`, returning its result for `state, state.inputState.buttons[14], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L341)

<a id="function-function-mq3-client-cl-input-in-button14up-function-in-button14up-state-key-time-src-mq3-client-cl-input-ml-239648455"></a>
### IN_Button14Up

```ml
function IN_Button14Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button14Up`, returning its result for `state, state.inputState.buttons[14], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L346)

<a id="function-function-mq3-client-cl-input-in-button15down-function-in-button15down-state-key-time-src-mq3-client-cl-input-ml-1415846271"></a>
### IN_Button15Down

```ml
function IN_Button15Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button15Down`, returning its result for `state, state.inputState.buttons[15], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L351)

<a id="function-function-mq3-client-cl-input-in-button15up-function-in-button15up-state-key-time-src-mq3-client-cl-input-ml-1139938881"></a>
### IN_Button15Up

```ml
function IN_Button15Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button15Up`, returning its result for `state, state.inputState.buttons[15], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L356)

<a id="function-function-mq3-client-cl-input-in-button1down-function-in-button1down-state-key-time-src-mq3-client-cl-input-ml-1490930735"></a>
### IN_Button1Down

```ml
function IN_Button1Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button1Down`, returning its result for `state, state.inputState.buttons[1], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L211)

<a id="function-function-mq3-client-cl-input-in-button1up-function-in-button1up-state-key-time-src-mq3-client-cl-input-ml-1867758023"></a>
### IN_Button1Up

```ml
function IN_Button1Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button1Up`, returning its result for `state, state.inputState.buttons[1], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L216)

<a id="function-function-mq3-client-cl-input-in-button2down-function-in-button2down-state-key-time-src-mq3-client-cl-input-ml-176677743"></a>
### IN_Button2Down

```ml
function IN_Button2Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button2Down`, returning its result for `state, state.inputState.buttons[2], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L221)

<a id="function-function-mq3-client-cl-input-in-button2up-function-in-button2up-state-key-time-src-mq3-client-cl-input-ml-849865315"></a>
### IN_Button2Up

```ml
function IN_Button2Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button2Up`, returning its result for `state, state.inputState.buttons[2], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L226)

<a id="function-function-mq3-client-cl-input-in-button3down-function-in-button3down-state-key-time-src-mq3-client-cl-input-ml-1978869723"></a>
### IN_Button3Down

```ml
function IN_Button3Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button3Down`, returning its result for `state, state.inputState.buttons[3], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L231)

<a id="function-function-mq3-client-cl-input-in-button3up-function-in-button3up-state-key-time-src-mq3-client-cl-input-ml-1785746715"></a>
### IN_Button3Up

```ml
function IN_Button3Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button3Up`, returning its result for `state, state.inputState.buttons[3], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L236)

<a id="function-function-mq3-client-cl-input-in-button4down-function-in-button4down-state-key-time-src-mq3-client-cl-input-ml-724114195"></a>
### IN_Button4Down

```ml
function IN_Button4Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button4Down`, returning its result for `state, state.inputState.buttons[4], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L241)

<a id="function-function-mq3-client-cl-input-in-button4up-function-in-button4up-state-key-time-src-mq3-client-cl-input-ml-1260391511"></a>
### IN_Button4Up

```ml
function IN_Button4Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button4Up`, returning its result for `state, state.inputState.buttons[4], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L246)

<a id="function-function-mq3-client-cl-input-in-button5down-function-in-button5down-state-key-time-src-mq3-client-cl-input-ml-132919943"></a>
### IN_Button5Down

```ml
function IN_Button5Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button5Down`, returning its result for `state, state.inputState.buttons[5], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L251)

<a id="function-function-mq3-client-cl-input-in-button5up-function-in-button5up-state-key-time-src-mq3-client-cl-input-ml-753887983"></a>
### IN_Button5Up

```ml
function IN_Button5Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button5Up`, returning its result for `state, state.inputState.buttons[5], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L256)

<a id="function-function-mq3-client-cl-input-in-button6down-function-in-button6down-state-key-time-src-mq3-client-cl-input-ml-641492343"></a>
### IN_Button6Down

```ml
function IN_Button6Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button6Down`, returning its result for `state, state.inputState.buttons[6], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L261)

<a id="function-function-mq3-client-cl-input-in-button6up-function-in-button6up-state-key-time-src-mq3-client-cl-input-ml-1481977635"></a>
### IN_Button6Up

```ml
function IN_Button6Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button6Up`, returning its result for `state, state.inputState.buttons[6], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L266)

<a id="function-function-mq3-client-cl-input-in-button7down-function-in-button7down-state-key-time-src-mq3-client-cl-input-ml-664854235"></a>
### IN_Button7Down

```ml
function IN_Button7Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button7Down`, returning its result for `state, state.inputState.buttons[7], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L271)

<a id="function-function-mq3-client-cl-input-in-button7up-function-in-button7up-state-key-time-src-mq3-client-cl-input-ml-35243835"></a>
### IN_Button7Up

```ml
function IN_Button7Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button7Up`, returning its result for `state, state.inputState.buttons[7], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L276)

<a id="function-function-mq3-client-cl-input-in-button8down-function-in-button8down-state-key-time-src-mq3-client-cl-input-ml-655233043"></a>
### IN_Button8Down

```ml
function IN_Button8Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button8Down`, returning its result for `state, state.inputState.buttons[8], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L281)

<a id="function-function-mq3-client-cl-input-in-button8up-function-in-button8up-state-key-time-src-mq3-client-cl-input-ml-112797087"></a>
### IN_Button8Up

```ml
function IN_Button8Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button8Up`, returning its result for `state, state.inputState.buttons[8], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L286)

<a id="function-function-mq3-client-cl-input-in-button9down-function-in-button9down-state-key-time-src-mq3-client-cl-input-ml-803226447"></a>
### IN_Button9Down

```ml
function IN_Button9Down(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_Button9Down`, returning its result for `state, state.inputState.buttons[9], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L291)

<a id="function-function-mq3-client-cl-input-in-button9up-function-in-button9up-state-key-time-src-mq3-client-cl-input-ml-825886327"></a>
### IN_Button9Up

```ml
function IN_Button9Up(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_Button9Up`, returning its result for `state, state.inputState.buttons[9], key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.buttons`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L296)

<a id="function-function-mq3-client-cl-input-in-buttondown-function-in-buttondown-state-key-time-src-mq3-client-cl-input-ml-603132655"></a>
### IN_ButtonDown

```ml
function IN_ButtonDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_Button1Down` to engine client input `IN_ButtonDown`, returning its result for `state, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_input.IN_Button1Down`. |
| `key` | `dynamic` | — | Argument 2 of `mq3.client.cl_input.IN_Button1Down`. |
| `time` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_Button1Down`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L361)

<a id="function-function-mq3-client-cl-input-in-buttonup-function-in-buttonup-state-key-time-src-mq3-client-cl-input-ml-1777897353"></a>
### IN_ButtonUp

```ml
function IN_ButtonUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_Button1Up` to engine client input `IN_ButtonUp`, returning its result for `state, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cl_input.IN_Button1Up`. |
| `key` | `dynamic` | — | Argument 2 of `mq3.client.cl_input.IN_Button1Up`. |
| `time` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_Button1Up`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L366)

<a id="function-function-mq3-client-cl-input-in-centerview-function-in-centerview-state-src-mq3-client-cl-input-ml-2075232217"></a>
### IN_CenterView

```ml
function IN_CenterView(state)
```

Updates `state.inputState.viewangles[0]` during engine client input `IN_CenterView`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client input record/storage; this routine assigns `state.inputState.viewangles[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L74)

<a id="function-function-mq3-client-cl-input-in-downdown-function-in-downdown-state-key-time-src-mq3-client-cl-input-ml-1613746303"></a>
### IN_DownDown

```ml
function IN_DownDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_DownDown`, returning its result for `state, state.inputState.down, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.down`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L90)

<a id="function-function-mq3-client-cl-input-in-downup-function-in-downup-state-key-time-src-mq3-client-cl-input-ml-1746888677"></a>
### IN_DownUp

```ml
function IN_DownUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_DownUp`, returning its result for `state, state.inputState.down, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.down`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L95)

<a id="function-function-mq3-client-cl-input-in-forwarddown-function-in-forwarddown-state-key-time-src-mq3-client-cl-input-ml-1822936743"></a>
### IN_ForwardDown

```ml
function IN_ForwardDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_ForwardDown`, returning its result for `state, state.inputState.forward, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.forward`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L120)

<a id="function-function-mq3-client-cl-input-in-forwardup-function-in-forwardup-state-key-time-src-mq3-client-cl-input-ml-281861623"></a>
### IN_ForwardUp

```ml
function IN_ForwardUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_ForwardUp`, returning its result for `state, state.inputState.forward, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.forward`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L125)

<a id="function-function-mq3-client-cl-input-in-keydown-function-in-keydown-state-value-key-time-src-mq3-client-cl-input-ml-1978309364"></a>
### IN_KeyDown

```ml
function IN_KeyDown(state, value, key, time)
```

Calls `mq3.client.input_command.keyDown`, `mq3.client.cl_input.emit` from engine client input `IN_KeyDown`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client input state passed to the helper calls in `IN_KeyDown`. |
| `value` | `dynamic` | — | Record read through `value.down0`, `value.down1`, `value.active`. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding engine client input entry. |
| `time` | `dynamic` | — | Value used by `result=input.keyDown(value,key,time)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L45)

<a id="function-function-mq3-client-cl-input-in-keyup-function-in-keyup-state-value-key-time-src-mq3-client-cl-input-ml-1588015568"></a>
### IN_KeyUp

```ml
function IN_KeyUp(state, value, key, time)
```

Calls `mq3.client.input_command.keyUp` from engine client input `IN_KeyUp`. The final path returns `input.keyUp(value,key,time,state.frameMsec)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.frameMsec`. |
| `value` | `dynamic` | — | Value tested by `state==void or value==void` before the calculation continues. |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding engine client input entry. |
| `time` | `dynamic` | — | Value used by `return input.keyUp(value,key,time,state.frameMsec)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L56)

<a id="function-function-mq3-client-cl-input-in-leftdown-function-in-leftdown-state-key-time-src-mq3-client-cl-input-ml-1978050141"></a>
### IN_LeftDown

```ml
function IN_LeftDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_LeftDown`, returning its result for `state, state.inputState.left, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.left`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L100)

<a id="function-function-mq3-client-cl-input-in-leftup-function-in-leftup-state-key-time-src-mq3-client-cl-input-ml-1560310639"></a>
### IN_LeftUp

```ml
function IN_LeftUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_LeftUp`, returning its result for `state, state.inputState.left, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.left`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L105)

<a id="function-function-mq3-client-cl-input-in-lookdowndown-function-in-lookdowndown-state-key-time-src-mq3-client-cl-input-ml-1559562917"></a>
### IN_LookdownDown

```ml
function IN_LookdownDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_LookdownDown`, returning its result for `state, state.inputState.lookdown, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.lookdown`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L150)

<a id="function-function-mq3-client-cl-input-in-lookdownup-function-in-lookdownup-state-key-time-src-mq3-client-cl-input-ml-1019546135"></a>
### IN_LookdownUp

```ml
function IN_LookdownUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_LookdownUp`, returning its result for `state, state.inputState.lookdown, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.lookdown`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L155)

<a id="function-function-mq3-client-cl-input-in-lookupdown-function-in-lookupdown-state-key-time-src-mq3-client-cl-input-ml-2114950607"></a>
### IN_LookupDown

```ml
function IN_LookupDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_LookupDown`, returning its result for `state, state.inputState.lookup, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.lookup`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L140)

<a id="function-function-mq3-client-cl-input-in-lookupup-function-in-lookupup-state-key-time-src-mq3-client-cl-input-ml-1067466941"></a>
### IN_LookupUp

```ml
function IN_LookupUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_LookupUp`, returning its result for `state, state.inputState.lookup, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.lookup`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L145)

<a id="function-function-mq3-client-cl-input-in-mlookdown-function-in-mlookdown-state-key-time-src-mq3-client-cl-input-ml-540862171"></a>
### IN_MLookDown

```ml
function IN_MLookDown(state, key, time)
```

Updates `state.inputState.mlooking` during engine client input `IN_MLookDown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client input record/storage; this routine assigns `state.inputState.mlooking`. |
| `key` | `dynamic` | — | Accepted for compatibility with `IN_MLookDown`; the current implementation does not read it. |
| `time` | `dynamic` | — | Accepted for compatibility with `IN_MLookDown`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L66)

<a id="function-function-mq3-client-cl-input-in-mlookup-function-in-mlookup-state-key-time-src-mq3-client-cl-input-ml-1639537919"></a>
### IN_MLookUp

```ml
function IN_MLookUp(state, key, time)
```

Updates `state.inputState.mlooking` during engine client input `IN_MLookUp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable engine client input record/storage; this routine assigns `state.inputState.mlooking`. |
| `key` | `dynamic` | — | Accepted for compatibility with `IN_MLookUp`; the current implementation does not read it. |
| `time` | `dynamic` | — | Accepted for compatibility with `IN_MLookUp`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L71)

<a id="function-function-mq3-client-cl-input-in-moveleftdown-function-in-moveleftdown-state-key-time-src-mq3-client-cl-input-ml-98211215"></a>
### IN_MoveleftDown

```ml
function IN_MoveleftDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_MoveleftDown`, returning its result for `state, state.inputState.moveleft, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.moveleft`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L160)

<a id="function-function-mq3-client-cl-input-in-moveleftup-function-in-moveleftup-state-key-time-src-mq3-client-cl-input-ml-1294903697"></a>
### IN_MoveleftUp

```ml
function IN_MoveleftUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_MoveleftUp`, returning its result for `state, state.inputState.moveleft, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.moveleft`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L165)

<a id="function-function-mq3-client-cl-input-in-moverightdown-function-in-moverightdown-state-key-time-src-mq3-client-cl-input-ml-1858751763"></a>
### IN_MoverightDown

```ml
function IN_MoverightDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_MoverightDown`, returning its result for `state, state.inputState.moveright, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.moveright`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L170)

<a id="function-function-mq3-client-cl-input-in-moverightup-function-in-moverightup-state-key-time-src-mq3-client-cl-input-ml-1052317235"></a>
### IN_MoverightUp

```ml
function IN_MoverightUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_MoverightUp`, returning its result for `state, state.inputState.moveright, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.moveright`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L175)

<a id="function-function-mq3-client-cl-input-in-rightdown-function-in-rightdown-state-key-time-src-mq3-client-cl-input-ml-1557085927"></a>
### IN_RightDown

```ml
function IN_RightDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_RightDown`, returning its result for `state, state.inputState.right, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.right`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L110)

<a id="function-function-mq3-client-cl-input-in-rightup-function-in-rightup-state-key-time-src-mq3-client-cl-input-ml-2078737495"></a>
### IN_RightUp

```ml
function IN_RightUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_RightUp`, returning its result for `state, state.inputState.right, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.right`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L115)

<a id="function-function-mq3-client-cl-input-in-speeddown-function-in-speeddown-state-key-time-src-mq3-client-cl-input-ml-627710603"></a>
### IN_SpeedDown

```ml
function IN_SpeedDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_SpeedDown`, returning its result for `state, state.inputState.speed, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.speed`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L180)

<a id="function-function-mq3-client-cl-input-in-speedup-function-in-speedup-state-key-time-src-mq3-client-cl-input-ml-1435473623"></a>
### IN_SpeedUp

```ml
function IN_SpeedUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_SpeedUp`, returning its result for `state, state.inputState.speed, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.speed`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L185)

<a id="function-function-mq3-client-cl-input-in-strafedown-function-in-strafedown-state-key-time-src-mq3-client-cl-input-ml-1900598217"></a>
### IN_StrafeDown

```ml
function IN_StrafeDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_StrafeDown`, returning its result for `state, state.inputState.strafe, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.strafe`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L190)

<a id="function-function-mq3-client-cl-input-in-strafeup-function-in-strafeup-state-key-time-src-mq3-client-cl-input-ml-1652192283"></a>
### IN_StrafeUp

```ml
function IN_StrafeUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_StrafeUp`, returning its result for `state, state.inputState.strafe, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.strafe`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L195)

<a id="function-function-mq3-client-cl-input-in-updown-function-in-updown-state-key-time-src-mq3-client-cl-input-ml-102686277"></a>
### IN_UpDown

```ml
function IN_UpDown(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyDown` to engine client input `IN_UpDown`, returning its result for `state, state.inputState.up, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.up`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyDown`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyDown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L80)

<a id="function-function-mq3-client-cl-input-in-upup-function-in-upup-state-key-time-src-mq3-client-cl-input-ml-1664034239"></a>
### IN_UpUp

```ml
function IN_UpUp(state, key, time)
```

Adapts `mq3.client.cl_input.IN_KeyUp` to engine client input `IN_UpUp`, returning its result for `state, state.inputState.up, key, time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.inputState.up`. |
| `key` | `dynamic` | — | Argument 3 of `mq3.client.cl_input.IN_KeyUp`. |
| `time` | `dynamic` | — | Argument 4 of `mq3.client.cl_input.IN_KeyUp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L85)

<a id="function-function-mq3-client-cl-input-inputcommandnames-function-inputcommandnames-src-mq3-client-cl-input-ml-1924942912"></a>
### inputCommandNames

```ml
function inputCommandNames()
```

Evaluates engine client input `inputCommandNames` and returns `names+["+mlook","-mlook"]` according to its guard/selection conditions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L479)

<a id="constant-constant-mq3-client-cl-input-keycatch-cgame-const-keycatch-cgame-8-src-mq3-client-cl-input-ml-120102367"></a>
### KEYCATCH_CGAME

```ml
const KEYCATCH_CGAME = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L12)

<a id="constant-constant-mq3-client-cl-input-keycatch-ui-const-keycatch-ui-2-src-mq3-client-cl-input-ml-712430715"></a>
### KEYCATCH_UI

```ml
const KEYCATCH_UI = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L11)

<a id="function-function-mq3-client-cl-input-magnitude-function-magnitude-value-src-mq3-client-cl-input-ml-1106446309"></a>
### magnitude

```ml
function magnitude(value)
```

Evaluates engine client input `magnitude` and returns `0.0-value`, `value` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value tested by `value<0.0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L418)

<a id="function-function-mq3-client-cl-input-parsearg-function-parsearg-commandstate-index-fallback-src-mq3-client-cl-input-ml-1681476556"></a>
### parseArg

```ml
function parseArg(commandState, index, fallback)
```

Calls `mq3.qcommon.command_buffer.argc`, `mq3.client.cl_input.atoi`, `mq3.qcommon.command_buffer.argv` from engine client input `parseArg`. The final path returns `atoi(command.argv(commandState,index))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | commandState record passed to the engine client input helper calls. |
| `index` | `dynamic` | — | Value tested by `command.argc(commandState)<=index` before the calculation continues. |
| `fallback` | `dynamic` | — | Value used by `if command.argc(commandState)<=index then return fallback end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L38)

- [mq3.client.cl_input.State](Type-mq3-client-cl-input-state-457779714.md) — struct
