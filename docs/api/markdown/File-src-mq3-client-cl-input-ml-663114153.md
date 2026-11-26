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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `cstr` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L178)

<a id="function-function-mq3-client-cl-input-cl-adjustangles-function-cl-adjustangles-state-src-mq3-client-cl-input-ml-1975365763"></a>
### CL_AdjustAngles

```ml
function CL_AdjustAngles(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L100)

<a id="function-function-mq3-client-cl-input-cl-cmdbuttons-function-cl-cmdbuttons-state-value-src-mq3-client-cl-input-ml-63949894"></a>
### CL_CmdButtons

```ml
function CL_CmdButtons(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L115)

<a id="function-function-mq3-client-cl-input-cl-createcmd-function-cl-createcmd-state-src-mq3-client-cl-input-ml-1474617937"></a>
### CL_CreateCmd

```ml
function CL_CreateCmd(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L122)

<a id="function-function-mq3-client-cl-input-cl-createnewcommands-function-cl-createnewcommands-state-frametime-src-mq3-client-cl-input-ml-427316241"></a>
### CL_CreateNewCommands

```ml
function CL_CreateNewCommands(state, frameTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L132)

<a id="function-function-mq3-client-cl-input-cl-finishmove-function-cl-finishmove-state-value-src-mq3-client-cl-input-ml-921960012"></a>
### CL_FinishMove

```ml
function CL_FinishMove(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L116)

<a id="function-function-mq3-client-cl-input-cl-initinput-function-cl-initinput-state-src-mq3-client-cl-input-ml-12096777"></a>
### CL_InitInput

```ml
function CL_InitInput(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L171)

<a id="function-function-mq3-client-cl-input-cl-joystickevent-function-cl-joystickevent-state-axis-value-time-src-mq3-client-cl-input-ml-853441562"></a>
### CL_JoystickEvent

```ml
function CL_JoystickEvent(state, axis, value, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L107)

<a id="function-function-mq3-client-cl-input-cl-joystickmove-function-cl-joystickmove-state-value-src-mq3-client-cl-input-ml-1032641602"></a>
### CL_JoystickMove

```ml
function CL_JoystickMove(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L113)

<a id="function-function-mq3-client-cl-input-cl-keymove-function-cl-keymove-state-value-src-mq3-client-cl-input-ml-1314695104"></a>
### CL_KeyMove

```ml
function CL_KeyMove(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L101)

<a id="function-function-mq3-client-cl-input-cl-keystate-function-cl-keystate-state-value-src-mq3-client-cl-input-ml-2131410240"></a>
### CL_KeyState

```ml
function CL_KeyState(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L34)

<a id="function-function-mq3-client-cl-input-cl-mouseevent-function-cl-mouseevent-state-dx-dy-time-src-mq3-client-cl-input-ml-928895489"></a>
### CL_MouseEvent

```ml
function CL_MouseEvent(state, dx, dy, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L102)

<a id="function-function-mq3-client-cl-input-cl-mousemove-function-cl-mousemove-state-value-src-mq3-client-cl-input-ml-903882160"></a>
### CL_MouseMove

```ml
function CL_MouseMove(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L114)

<a id="function-function-mq3-client-cl-input-cl-readytosendpacket-function-cl-readytosendpacket-state-src-mq3-client-cl-input-ml-1644932909"></a>
### CL_ReadyToSendPacket

```ml
function CL_ReadyToSendPacket(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L139)

<a id="function-function-mq3-client-cl-input-cl-sendcmd-function-cl-sendcmd-state-frametime-src-mq3-client-cl-input-ml-1808036709"></a>
### CL_SendCmd

```ml
function CL_SendCmd(state, frameTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L141)

<a id="function-function-mq3-client-cl-input-cl-writepacket-function-cl-writepacket-state-src-mq3-client-cl-input-ml-1518891581"></a>
### CL_WritePacket

```ml
function CL_WritePacket(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L140)

<a id="function-function-mq3-client-cl-input-create-function-create-commandstate-sendstate-sendhost-src-mq3-client-cl-input-ml-1213589561"></a>
### create

```ml
function create(commandState, sendState, sendHost)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `sendState` | `dynamic` | — |  |
| `sendHost` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L21)

<a id="function-function-mq3-client-cl-input-dispatchinputcommand-function-dispatchinputcommand-commandstate-state-src-mq3-client-cl-input-ml-1647361379"></a>
### dispatchInputCommand

```ml
function dispatchInputCommand(commandState, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L150)

<a id="function-function-mq3-client-cl-input-emit-function-emit-state-text-src-mq3-client-cl-input-ml-1093561306"></a>
### emit

```ml
function emit(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L24)

- [mq3.client.cl_input.Host](Type-mq3-client-cl-input-host-1945411211.md) — struct
<a id="function-function-mq3-client-cl-input-hostservices-function-hostservices-src-mq3-client-cl-input-ml-1916266"></a>
### hostServices

```ml
function hostServices()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L20)

<a id="function-function-mq3-client-cl-input-in-backdown-function-in-backdown-state-key-time-src-mq3-client-cl-input-ml-1475151125"></a>
### IN_BackDown

```ml
function IN_BackDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L50)

<a id="function-function-mq3-client-cl-input-in-backup-function-in-backup-state-key-time-src-mq3-client-cl-input-ml-1867316091"></a>
### IN_BackUp

```ml
function IN_BackUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L51)

<a id="function-function-mq3-client-cl-input-in-button0down-function-in-button0down-state-key-time-src-mq3-client-cl-input-ml-217238691"></a>
### IN_Button0Down

```ml
function IN_Button0Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L65)

<a id="function-function-mq3-client-cl-input-in-button0up-function-in-button0up-state-key-time-src-mq3-client-cl-input-ml-811283199"></a>
### IN_Button0Up

```ml
function IN_Button0Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L66)

<a id="function-function-mq3-client-cl-input-in-button10down-function-in-button10down-state-key-time-src-mq3-client-cl-input-ml-1165708585"></a>
### IN_Button10Down

```ml
function IN_Button10Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L85)

<a id="function-function-mq3-client-cl-input-in-button10up-function-in-button10up-state-key-time-src-mq3-client-cl-input-ml-266356751"></a>
### IN_Button10Up

```ml
function IN_Button10Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L86)

<a id="function-function-mq3-client-cl-input-in-button11down-function-in-button11down-state-key-time-src-mq3-client-cl-input-ml-463118807"></a>
### IN_Button11Down

```ml
function IN_Button11Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L87)

<a id="function-function-mq3-client-cl-input-in-button11up-function-in-button11up-state-key-time-src-mq3-client-cl-input-ml-362581649"></a>
### IN_Button11Up

```ml
function IN_Button11Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L88)

<a id="function-function-mq3-client-cl-input-in-button12down-function-in-button12down-state-key-time-src-mq3-client-cl-input-ml-973607397"></a>
### IN_Button12Down

```ml
function IN_Button12Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L89)

<a id="function-function-mq3-client-cl-input-in-button12up-function-in-button12up-state-key-time-src-mq3-client-cl-input-ml-158340247"></a>
### IN_Button12Up

```ml
function IN_Button12Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L90)

<a id="function-function-mq3-client-cl-input-in-button13down-function-in-button13down-state-key-time-src-mq3-client-cl-input-ml-472039383"></a>
### IN_Button13Down

```ml
function IN_Button13Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L91)

<a id="function-function-mq3-client-cl-input-in-button13up-function-in-button13up-state-key-time-src-mq3-client-cl-input-ml-848716789"></a>
### IN_Button13Up

```ml
function IN_Button13Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L92)

<a id="function-function-mq3-client-cl-input-in-button14down-function-in-button14down-state-key-time-src-mq3-client-cl-input-ml-612983305"></a>
### IN_Button14Down

```ml
function IN_Button14Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L93)

<a id="function-function-mq3-client-cl-input-in-button14up-function-in-button14up-state-key-time-src-mq3-client-cl-input-ml-239648455"></a>
### IN_Button14Up

```ml
function IN_Button14Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L94)

<a id="function-function-mq3-client-cl-input-in-button15down-function-in-button15down-state-key-time-src-mq3-client-cl-input-ml-1415846271"></a>
### IN_Button15Down

```ml
function IN_Button15Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L95)

<a id="function-function-mq3-client-cl-input-in-button15up-function-in-button15up-state-key-time-src-mq3-client-cl-input-ml-1139938881"></a>
### IN_Button15Up

```ml
function IN_Button15Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L96)

<a id="function-function-mq3-client-cl-input-in-button1down-function-in-button1down-state-key-time-src-mq3-client-cl-input-ml-1490930735"></a>
### IN_Button1Down

```ml
function IN_Button1Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L67)

<a id="function-function-mq3-client-cl-input-in-button1up-function-in-button1up-state-key-time-src-mq3-client-cl-input-ml-1867758023"></a>
### IN_Button1Up

```ml
function IN_Button1Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L68)

<a id="function-function-mq3-client-cl-input-in-button2down-function-in-button2down-state-key-time-src-mq3-client-cl-input-ml-176677743"></a>
### IN_Button2Down

```ml
function IN_Button2Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L69)

<a id="function-function-mq3-client-cl-input-in-button2up-function-in-button2up-state-key-time-src-mq3-client-cl-input-ml-849865315"></a>
### IN_Button2Up

```ml
function IN_Button2Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L70)

<a id="function-function-mq3-client-cl-input-in-button3down-function-in-button3down-state-key-time-src-mq3-client-cl-input-ml-1978869723"></a>
### IN_Button3Down

```ml
function IN_Button3Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L71)

<a id="function-function-mq3-client-cl-input-in-button3up-function-in-button3up-state-key-time-src-mq3-client-cl-input-ml-1785746715"></a>
### IN_Button3Up

```ml
function IN_Button3Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L72)

<a id="function-function-mq3-client-cl-input-in-button4down-function-in-button4down-state-key-time-src-mq3-client-cl-input-ml-724114195"></a>
### IN_Button4Down

```ml
function IN_Button4Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L73)

<a id="function-function-mq3-client-cl-input-in-button4up-function-in-button4up-state-key-time-src-mq3-client-cl-input-ml-1260391511"></a>
### IN_Button4Up

```ml
function IN_Button4Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L74)

<a id="function-function-mq3-client-cl-input-in-button5down-function-in-button5down-state-key-time-src-mq3-client-cl-input-ml-132919943"></a>
### IN_Button5Down

```ml
function IN_Button5Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L75)

<a id="function-function-mq3-client-cl-input-in-button5up-function-in-button5up-state-key-time-src-mq3-client-cl-input-ml-753887983"></a>
### IN_Button5Up

```ml
function IN_Button5Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L76)

<a id="function-function-mq3-client-cl-input-in-button6down-function-in-button6down-state-key-time-src-mq3-client-cl-input-ml-641492343"></a>
### IN_Button6Down

```ml
function IN_Button6Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L77)

<a id="function-function-mq3-client-cl-input-in-button6up-function-in-button6up-state-key-time-src-mq3-client-cl-input-ml-1481977635"></a>
### IN_Button6Up

```ml
function IN_Button6Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L78)

<a id="function-function-mq3-client-cl-input-in-button7down-function-in-button7down-state-key-time-src-mq3-client-cl-input-ml-664854235"></a>
### IN_Button7Down

```ml
function IN_Button7Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L79)

<a id="function-function-mq3-client-cl-input-in-button7up-function-in-button7up-state-key-time-src-mq3-client-cl-input-ml-35243835"></a>
### IN_Button7Up

```ml
function IN_Button7Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L80)

<a id="function-function-mq3-client-cl-input-in-button8down-function-in-button8down-state-key-time-src-mq3-client-cl-input-ml-655233043"></a>
### IN_Button8Down

```ml
function IN_Button8Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L81)

<a id="function-function-mq3-client-cl-input-in-button8up-function-in-button8up-state-key-time-src-mq3-client-cl-input-ml-112797087"></a>
### IN_Button8Up

```ml
function IN_Button8Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L82)

<a id="function-function-mq3-client-cl-input-in-button9down-function-in-button9down-state-key-time-src-mq3-client-cl-input-ml-803226447"></a>
### IN_Button9Down

```ml
function IN_Button9Down(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L83)

<a id="function-function-mq3-client-cl-input-in-button9up-function-in-button9up-state-key-time-src-mq3-client-cl-input-ml-825886327"></a>
### IN_Button9Up

```ml
function IN_Button9Up(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L84)

<a id="function-function-mq3-client-cl-input-in-buttondown-function-in-buttondown-state-key-time-src-mq3-client-cl-input-ml-603132655"></a>
### IN_ButtonDown

```ml
function IN_ButtonDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L97)

<a id="function-function-mq3-client-cl-input-in-buttonup-function-in-buttonup-state-key-time-src-mq3-client-cl-input-ml-1777897353"></a>
### IN_ButtonUp

```ml
function IN_ButtonUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L98)

<a id="function-function-mq3-client-cl-input-in-centerview-function-in-centerview-state-src-mq3-client-cl-input-ml-2075232217"></a>
### IN_CenterView

```ml
function IN_CenterView(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L38)

<a id="function-function-mq3-client-cl-input-in-downdown-function-in-downdown-state-key-time-src-mq3-client-cl-input-ml-1613746303"></a>
### IN_DownDown

```ml
function IN_DownDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L42)

<a id="function-function-mq3-client-cl-input-in-downup-function-in-downup-state-key-time-src-mq3-client-cl-input-ml-1746888677"></a>
### IN_DownUp

```ml
function IN_DownUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L43)

<a id="function-function-mq3-client-cl-input-in-forwarddown-function-in-forwarddown-state-key-time-src-mq3-client-cl-input-ml-1822936743"></a>
### IN_ForwardDown

```ml
function IN_ForwardDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L48)

<a id="function-function-mq3-client-cl-input-in-forwardup-function-in-forwardup-state-key-time-src-mq3-client-cl-input-ml-281861623"></a>
### IN_ForwardUp

```ml
function IN_ForwardUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L49)

<a id="function-function-mq3-client-cl-input-in-keydown-function-in-keydown-state-value-key-time-src-mq3-client-cl-input-ml-1978309364"></a>
### IN_KeyDown

```ml
function IN_KeyDown(state, value, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L27)

<a id="function-function-mq3-client-cl-input-in-keyup-function-in-keyup-state-value-key-time-src-mq3-client-cl-input-ml-1588015568"></a>
### IN_KeyUp

```ml
function IN_KeyUp(state, value, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L33)

<a id="function-function-mq3-client-cl-input-in-leftdown-function-in-leftdown-state-key-time-src-mq3-client-cl-input-ml-1978050141"></a>
### IN_LeftDown

```ml
function IN_LeftDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L44)

<a id="function-function-mq3-client-cl-input-in-leftup-function-in-leftup-state-key-time-src-mq3-client-cl-input-ml-1560310639"></a>
### IN_LeftUp

```ml
function IN_LeftUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L45)

<a id="function-function-mq3-client-cl-input-in-lookdowndown-function-in-lookdowndown-state-key-time-src-mq3-client-cl-input-ml-1559562917"></a>
### IN_LookdownDown

```ml
function IN_LookdownDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L54)

<a id="function-function-mq3-client-cl-input-in-lookdownup-function-in-lookdownup-state-key-time-src-mq3-client-cl-input-ml-1019546135"></a>
### IN_LookdownUp

```ml
function IN_LookdownUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L55)

<a id="function-function-mq3-client-cl-input-in-lookupdown-function-in-lookupdown-state-key-time-src-mq3-client-cl-input-ml-2114950607"></a>
### IN_LookupDown

```ml
function IN_LookupDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L52)

<a id="function-function-mq3-client-cl-input-in-lookupup-function-in-lookupup-state-key-time-src-mq3-client-cl-input-ml-1067466941"></a>
### IN_LookupUp

```ml
function IN_LookupUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L53)

<a id="function-function-mq3-client-cl-input-in-mlookdown-function-in-mlookdown-state-key-time-src-mq3-client-cl-input-ml-540862171"></a>
### IN_MLookDown

```ml
function IN_MLookDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L36)

<a id="function-function-mq3-client-cl-input-in-mlookup-function-in-mlookup-state-key-time-src-mq3-client-cl-input-ml-1639537919"></a>
### IN_MLookUp

```ml
function IN_MLookUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L37)

<a id="function-function-mq3-client-cl-input-in-moveleftdown-function-in-moveleftdown-state-key-time-src-mq3-client-cl-input-ml-98211215"></a>
### IN_MoveleftDown

```ml
function IN_MoveleftDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L56)

<a id="function-function-mq3-client-cl-input-in-moveleftup-function-in-moveleftup-state-key-time-src-mq3-client-cl-input-ml-1294903697"></a>
### IN_MoveleftUp

```ml
function IN_MoveleftUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L57)

<a id="function-function-mq3-client-cl-input-in-moverightdown-function-in-moverightdown-state-key-time-src-mq3-client-cl-input-ml-1858751763"></a>
### IN_MoverightDown

```ml
function IN_MoverightDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L58)

<a id="function-function-mq3-client-cl-input-in-moverightup-function-in-moverightup-state-key-time-src-mq3-client-cl-input-ml-1052317235"></a>
### IN_MoverightUp

```ml
function IN_MoverightUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L59)

<a id="function-function-mq3-client-cl-input-in-rightdown-function-in-rightdown-state-key-time-src-mq3-client-cl-input-ml-1557085927"></a>
### IN_RightDown

```ml
function IN_RightDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L46)

<a id="function-function-mq3-client-cl-input-in-rightup-function-in-rightup-state-key-time-src-mq3-client-cl-input-ml-2078737495"></a>
### IN_RightUp

```ml
function IN_RightUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L47)

<a id="function-function-mq3-client-cl-input-in-speeddown-function-in-speeddown-state-key-time-src-mq3-client-cl-input-ml-627710603"></a>
### IN_SpeedDown

```ml
function IN_SpeedDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L60)

<a id="function-function-mq3-client-cl-input-in-speedup-function-in-speedup-state-key-time-src-mq3-client-cl-input-ml-1435473623"></a>
### IN_SpeedUp

```ml
function IN_SpeedUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L61)

<a id="function-function-mq3-client-cl-input-in-strafedown-function-in-strafedown-state-key-time-src-mq3-client-cl-input-ml-1900598217"></a>
### IN_StrafeDown

```ml
function IN_StrafeDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L62)

<a id="function-function-mq3-client-cl-input-in-strafeup-function-in-strafeup-state-key-time-src-mq3-client-cl-input-ml-1652192283"></a>
### IN_StrafeUp

```ml
function IN_StrafeUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L63)

<a id="function-function-mq3-client-cl-input-in-updown-function-in-updown-state-key-time-src-mq3-client-cl-input-ml-102686277"></a>
### IN_UpDown

```ml
function IN_UpDown(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L40)

<a id="function-function-mq3-client-cl-input-in-upup-function-in-upup-state-key-time-src-mq3-client-cl-input-ml-1664034239"></a>
### IN_UpUp

```ml
function IN_UpUp(state, key, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L41)

<a id="function-function-mq3-client-cl-input-inputcommandnames-function-inputcommandnames-src-mq3-client-cl-input-ml-1924942912"></a>
### inputCommandNames

```ml
function inputCommandNames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L166)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L121)

<a id="function-function-mq3-client-cl-input-parsearg-function-parsearg-commandstate-index-fallback-src-mq3-client-cl-input-ml-1681476556"></a>
### parseArg

```ml
function parseArg(commandState, index, fallback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `fallback` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_input.ml#L25)

- [mq3.client.cl_input.State](Type-mq3-client-cl-input-state-457779714.md) — struct
