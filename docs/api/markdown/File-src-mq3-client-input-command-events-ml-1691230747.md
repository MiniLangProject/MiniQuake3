# `src/mq3/client/input_command_events.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.input_command_events`](Package-mq3-client-input-command-events-853733587.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/input_command.ml` as `inputCommandCore` → [src/mq3/client/input_command.ml](File-src-mq3-client-input-command-ml-1980603655.md)
- `mq3/client/key_binding_dispatch.ml` as `eventBindingDispatch` → [src/mq3/client/key_binding_dispatch.ml](File-src-mq3-client-key-binding-dispatch-ml-676068433.md)

## Declarations

<a id="function-function-mq3-client-input-command-events-actionbutton-function-actionbutton-state-action-src-mq3-client-input-command-events-ml-1255955115"></a>
### actionButton

```ml
function actionButton(state, action)
```

Evaluates input command events `actionButton` and returns `void`, `state.left`, `state.right` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.left`, `state.right`, `state.forward`, `state.back` and additional values. |
| `action` | `dynamic` | — | Value used by `if action=="left" then return state.left end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L71)

<a id="function-function-mq3-client-input-command-events-anydown-function-anydown-state-src-mq3-client-input-command-events-ml-1683533565"></a>
### anyDown

```ml
function anyDown(state)
```

Evaluates input command events `anyDown` and returns `false`, `true` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.left.active`, `state.right.active`, `state.forward.active`, `state.back.active` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L151)

<a id="function-function-mq3-client-input-command-events-apply-function-apply-state-time-type-value-value2-src-mq3-client-input-command-events-ml-668559986"></a>
### apply

```ml
function apply(state, time, type, value, value2)
```

Calls `mq3.client.input_command_events.quakeKey`, `mq3.client.input_command_events.applyBound`, `mq3.client.input_command_events.defaultBinding` from input command events `apply`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared input command events state passed to the helper calls in `apply`. |
| `time` | `dynamic` | — | Value used by `applied=applyBound(state,time,type,value,value2,defaultBinding(key))`. |
| `type` | `dynamic` | — | Value used by `applied=applyBound(state,time,type,value,value2,defaultBinding(key))`. |
| `value` | `dynamic` | — | Value used by `key=quakeKey(value)`. |
| `value2` | `dynamic` | — | Value used by `applied=applyBound(state,time,type,value,value2,defaultBinding(key))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L126)

<a id="function-function-mq3-client-input-command-events-applybound-function-applybound-state-time-type-value-value2-binding-src-mq3-client-input-command-events-ml-512177545"></a>
### applyBound

```ml
function applyBound(state, time, type, value, value2, binding)
```

Preserve the virtual-key input API used by offline probes and older hosts.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared input command events state passed to the helper calls in `applyBound`. |
| `time` | `dynamic` | — | Value used by `return applyBoundQuake(state,time,type,value,value2,binding)`. |
| `type` | `dynamic` | — | Value used by `if type==INPUT_KEY then value=quakeKey(value) end if`. |
| `value` | `dynamic` | — | Value used by `if type==INPUT_KEY then value=quakeKey(value) end if`. |
| `value2` | `dynamic` | — | Value used by `return applyBoundQuake(state,time,type,value,value2,binding)`. |
| `binding` | `dynamic` | — | Command text associated with an input key. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L116)

<a id="function-function-mq3-client-input-command-events-applyboundquake-function-applyboundquake-state-time-type-value-value2-binding-src-mq3-client-input-command-events-ml-224138839"></a>
### applyBoundQuake

```ml
function applyBoundQuake(state, time, type, value, value2, binding)
```

Productive Sys_QueEvent records already contain Quake keynums. Do not map them through Win32 again: lowercase p..z overlap the VK_F1..VK_F11 range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared input command events state passed to the helper calls in `applyBoundQuake`. |
| `time` | `dynamic` | — | Value used by `if state==void or typeof(time)!="int" or time<0 then return error(7702,"input event bridge: invalid event") end if`. |
| `type` | `dynamic` | — | Value used by `if type==INPUT_MOUSE then accumulated=inputCommandCore.accumulateMouse(state,value,value2)`. |
| `value` | `dynamic` | — | Value used by `if type==INPUT_MOUSE then accumulated=inputCommandCore.accumulateMouse(state,value,value2)`. |
| `value2` | `dynamic` | — | Value used by `if type==INPUT_MOUSE then accumulated=inputCommandCore.accumulateMouse(state,value,value2)`. |
| `binding` | `dynamic` | — | Command text associated with an input key. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L101)

<a id="function-function-mq3-client-input-command-events-defaultbinding-function-defaultbinding-key-src-mq3-client-input-command-events-ml-615826531"></a>
### defaultBinding

```ml
function defaultBinding(key)
```

Evaluates input command events `defaultBinding` and returns `"+forward"`, `"+back"`, `"+moveright"` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Key or control identifier used to select the corresponding input command events entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L63)

<a id="function-function-mq3-client-input-command-events-execute-function-execute-state-command-src-mq3-client-input-command-events-ml-333655066"></a>
### execute

```ml
function execute(state, command)
```

Updates `state.mlooking` during input command events `execute`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable input command events record/storage; this routine assigns `state.mlooking`. |
| `command` | `dynamic` | — | Record read through `command.button`, `command.action`, `command.down`, `command.key` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L86)

<a id="constant-constant-mq3-client-input-command-events-input-key-const-input-key-1-src-mq3-client-input-command-events-ml-914949892"></a>
### INPUT_KEY

```ml
const INPUT_KEY = 1
```

Platform input-event tag selecting a key press or release.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L9)

<a id="constant-constant-mq3-client-input-command-events-input-mouse-const-input-mouse-3-src-mq3-client-input-command-events-ml-418174758"></a>
### INPUT_MOUSE

```ml
const INPUT_MOUSE = 3
```

Platform input-event tag selecting relative mouse motion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L11)

<a id="function-function-mq3-client-input-command-events-quakekey-function-quakekey-virtualkey-src-mq3-client-input-command-events-ml-1167054864"></a>
### quakeKey

```ml
function quakeKey(virtualKey)
```

Evaluates input command events `quakeKey` and returns `virtualKey+32`, `178`, `179` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `virtualKey` | `dynamic` | — | Value used by `if virtualKey>=65 and virtualKey<=90 then return virtualKey+32 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L35)

<a id="function-function-mq3-client-input-command-events-release-function-release-state-time-src-mq3-client-input-command-events-ml-913150598"></a>
### release

```ml
function release(state, time)
```

Updates `state.mlooking` during input command events `release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable input command events record/storage; this routine assigns `state.mlooking`. |
| `time` | `dynamic` | — | Value used by `if state==void or typeof(time)!="int" or time<0 then return error(7702,"input event bridge: invalid release") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L142)

<a id="function-function-mq3-client-input-command-events-releasebutton-function-releasebutton-value-time-src-mq3-client-input-command-events-ml-873026542"></a>
### releaseButton

```ml
function releaseButton(value, time)
```

Calls `mq3.client.input_command.keyUp` from input command events `releaseButton`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record read through `value.down0`, `value.down1`. |
| `time` | `dynamic` | — | Value used by `if value.down0!=0 then released=inputCommandCore.keyUp(value,value.down0,time,50)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L134)

<a id="constant-constant-mq3-client-input-command-events-vk-a-const-vk-a-65-src-mq3-client-input-command-events-ml-1474302064"></a>
### VK_A

```ml
const VK_A = 65
```

Windows virtual-key code for the a input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L25)

<a id="constant-constant-mq3-client-input-command-events-vk-d-const-vk-d-68-src-mq3-client-input-command-events-ml-133797031"></a>
### VK_D

```ml
const VK_D = 68
```

Windows virtual-key code for the d input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L27)

<a id="constant-constant-mq3-client-input-command-events-vk-lbutton-const-vk-lbutton-1-src-mq3-client-input-command-events-ml-1230544386"></a>
### VK_LBUTTON

```ml
const VK_LBUTTON = 1
```

Windows virtual-key code for the lbutton input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L13)

<a id="constant-constant-mq3-client-input-command-events-vk-mbutton-const-vk-mbutton-4-src-mq3-client-input-command-events-ml-156470821"></a>
### VK_MBUTTON

```ml
const VK_MBUTTON = 4
```

Windows virtual-key code for the mbutton input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L17)

<a id="constant-constant-mq3-client-input-command-events-vk-rbutton-const-vk-rbutton-2-src-mq3-client-input-command-events-ml-12856501"></a>
### VK_RBUTTON

```ml
const VK_RBUTTON = 2
```

Windows virtual-key code for the rbutton input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L15)

<a id="constant-constant-mq3-client-input-command-events-vk-s-const-vk-s-83-src-mq3-client-input-command-events-ml-1092549892"></a>
### VK_S

```ml
const VK_S = 83
```

Windows virtual-key code for the s input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L29)

<a id="constant-constant-mq3-client-input-command-events-vk-space-const-vk-space-32-src-mq3-client-input-command-events-ml-1219212994"></a>
### VK_SPACE

```ml
const VK_SPACE = 32
```

Windows virtual-key code for the space input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L23)

<a id="constant-constant-mq3-client-input-command-events-vk-w-const-vk-w-87-src-mq3-client-input-command-events-ml-2034213336"></a>
### VK_W

```ml
const VK_W = 87
```

Windows virtual-key code for the w input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L31)

<a id="constant-constant-mq3-client-input-command-events-vk-xbutton1-const-vk-xbutton1-5-src-mq3-client-input-command-events-ml-1643277092"></a>
### VK_XBUTTON1

```ml
const VK_XBUTTON1 = 5
```

Windows virtual-key code for the xbutton1 input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L19)

<a id="constant-constant-mq3-client-input-command-events-vk-xbutton2-const-vk-xbutton2-6-src-mq3-client-input-command-events-ml-2008501699"></a>
### VK_XBUTTON2

```ml
const VK_XBUTTON2 = 6
```

Windows virtual-key code for the xbutton2 input before translation to engine key codes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/input_command_events.ml#L21)
