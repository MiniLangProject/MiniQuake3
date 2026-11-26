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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `action` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L52)

<a id="function-function-mq3-client-input-command-events-anydown-function-anydown-state-src-mq3-client-input-command-events-ml-1683533565"></a>
### anyDown

```ml
function anyDown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L103)

<a id="function-function-mq3-client-input-command-events-apply-function-apply-state-time-type-value-value2-src-mq3-client-input-command-events-ml-668559986"></a>
### apply

```ml
function apply(state, time, type, value, value2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L86)

<a id="function-function-mq3-client-input-command-events-applybound-function-applybound-state-time-type-value-value2-binding-src-mq3-client-input-command-events-ml-512177545"></a>
### applyBound

```ml
function applyBound(state, time, type, value, value2, binding)
```

Preserve the virtual-key input API used by offline probes and older hosts.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |
| `binding` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L82)

<a id="function-function-mq3-client-input-command-events-applyboundquake-function-applyboundquake-state-time-type-value-value2-binding-src-mq3-client-input-command-events-ml-224138839"></a>
### applyBoundQuake

```ml
function applyBoundQuake(state, time, type, value, value2, binding)
```

Productive Sys_QueEvent records already contain Quake keynums. Do not map them through Win32 again: lowercase p..z overlap the VK_F1..VK_F11 range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |
| `binding` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L73)

<a id="function-function-mq3-client-input-command-events-defaultbinding-function-defaultbinding-key-src-mq3-client-input-command-events-ml-615826531"></a>
### defaultBinding

```ml
function defaultBinding(key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L47)

<a id="function-function-mq3-client-input-command-events-execute-function-execute-state-command-src-mq3-client-input-command-events-ml-333655066"></a>
### execute

```ml
function execute(state, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L64)

<a id="constant-constant-mq3-client-input-command-events-input-key-const-input-key-1-src-mq3-client-input-command-events-ml-914949892"></a>
### INPUT_KEY

```ml
const INPUT_KEY = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L8)

<a id="constant-constant-mq3-client-input-command-events-input-mouse-const-input-mouse-3-src-mq3-client-input-command-events-ml-418174758"></a>
### INPUT_MOUSE

```ml
const INPUT_MOUSE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L9)

<a id="function-function-mq3-client-input-command-events-quakekey-function-quakekey-virtualkey-src-mq3-client-input-command-events-ml-1167054864"></a>
### quakeKey

```ml
function quakeKey(virtualKey)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `virtualKey` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L21)

<a id="function-function-mq3-client-input-command-events-release-function-release-state-time-src-mq3-client-input-command-events-ml-913150598"></a>
### release

```ml
function release(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L96)

<a id="function-function-mq3-client-input-command-events-releasebutton-function-releasebutton-value-time-src-mq3-client-input-command-events-ml-873026542"></a>
### releaseButton

```ml
function releaseButton(value, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L91)

<a id="constant-constant-mq3-client-input-command-events-vk-a-const-vk-a-65-src-mq3-client-input-command-events-ml-1474302064"></a>
### VK_A

```ml
const VK_A = 65
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L16)

<a id="constant-constant-mq3-client-input-command-events-vk-d-const-vk-d-68-src-mq3-client-input-command-events-ml-133797031"></a>
### VK_D

```ml
const VK_D = 68
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L17)

<a id="constant-constant-mq3-client-input-command-events-vk-lbutton-const-vk-lbutton-1-src-mq3-client-input-command-events-ml-1230544386"></a>
### VK_LBUTTON

```ml
const VK_LBUTTON = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L10)

<a id="constant-constant-mq3-client-input-command-events-vk-mbutton-const-vk-mbutton-4-src-mq3-client-input-command-events-ml-156470821"></a>
### VK_MBUTTON

```ml
const VK_MBUTTON = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L12)

<a id="constant-constant-mq3-client-input-command-events-vk-rbutton-const-vk-rbutton-2-src-mq3-client-input-command-events-ml-12856501"></a>
### VK_RBUTTON

```ml
const VK_RBUTTON = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L11)

<a id="constant-constant-mq3-client-input-command-events-vk-s-const-vk-s-83-src-mq3-client-input-command-events-ml-1092549892"></a>
### VK_S

```ml
const VK_S = 83
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L18)

<a id="constant-constant-mq3-client-input-command-events-vk-space-const-vk-space-32-src-mq3-client-input-command-events-ml-1219212994"></a>
### VK_SPACE

```ml
const VK_SPACE = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L15)

<a id="constant-constant-mq3-client-input-command-events-vk-w-const-vk-w-87-src-mq3-client-input-command-events-ml-2034213336"></a>
### VK_W

```ml
const VK_W = 87
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L19)

<a id="constant-constant-mq3-client-input-command-events-vk-xbutton1-const-vk-xbutton1-5-src-mq3-client-input-command-events-ml-1643277092"></a>
### VK_XBUTTON1

```ml
const VK_XBUTTON1 = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L13)

<a id="constant-constant-mq3-client-input-command-events-vk-xbutton2-const-vk-xbutton2-6-src-mq3-client-input-command-events-ml-2008501699"></a>
### VK_XBUTTON2

```ml
const VK_XBUTTON2 = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/input_command_events.ml#L14)
