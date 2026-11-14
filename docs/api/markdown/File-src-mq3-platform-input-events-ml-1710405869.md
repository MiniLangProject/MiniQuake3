# `src/mq3/platform/input_events.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.input_events`](Package-mq3-platform-input-events-1650871381.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-platform-input-events-charevent-function-charevent-queue-time-character-src-mq3-platform-input-events-ml-1421195647"></a>
### charEvent

```ml
function charEvent(queue, time, character)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `character` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L56)

<a id="function-function-mq3-platform-input-events-create-function-create-clockcontext-clockfn-src-mq3-platform-input-events-ml-110066661"></a>
### create

```ml
function create(clockContext, clockFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clockContext` | `dynamic` | — |  |
| `clockFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L22)

<a id="function-function-mq3-platform-input-events-dispatch-function-dispatch-event-sink-src-mq3-platform-input-events-ml-733613159"></a>
### dispatch

```ml
function dispatch(event, sink)
```

Productive Com_EventLoop input half. A desktop window adapter only has to enqueue events; engine callbacks stay independent of the native GUI API.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `event` | `dynamic` | — |  |
| `sink` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L94)

<a id="function-function-mq3-platform-input-events-drain-function-drain-queue-sink-maxevents-src-mq3-platform-input-events-ml-283756669"></a>
### drain

```ml
function drain(queue, sink, maxEvents)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `sink` | `dynamic` | — |  |
| `maxEvents` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L110)

- [mq3.platform.input_events.Event](Type-mq3-platform-input-events-event-1582954779.md) — struct
<a id="function-function-mq3-platform-input-events-handlers-function-handlers-context-keyfn-charfn-mousefn-joystickfn-src-mq3-platform-input-events-ml-1600023915"></a>
### handlers

```ml
function handlers(context, keyFn, charFn, mouseFn, joystickFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `keyFn` | `dynamic` | — |  |
| `charFn` | `dynamic` | — |  |
| `mouseFn` | `dynamic` | — |  |
| `joystickFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L88)

- [mq3.platform.input_events.Handlers](Type-mq3-platform-input-events-handlers-646550524.md) — struct
<a id="function-function-mq3-platform-input-events-joystickevent-function-joystickevent-queue-time-axis-value-src-mq3-platform-input-events-ml-406383114"></a>
### joystickEvent

```ml
function joystickEvent(queue, time, axis, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L67)

<a id="constant-constant-mq3-platform-input-events-k-mwheeldown-const-k-mwheeldown-183-src-mq3-platform-input-events-ml-1222826189"></a>
### K_MWHEELDOWN

```ml
const K_MWHEELDOWN = 183
```

Baseq3 key numbers from keys.h. A wheel notch is represented as a complete key press so bindings cannot remain stuck when a host only reports deltas.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L15)

<a id="constant-constant-mq3-platform-input-events-k-mwheelup-const-k-mwheelup-184-src-mq3-platform-input-events-ml-211822396"></a>
### K_MWHEELUP

```ml
const K_MWHEELUP = 184
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L16)

<a id="function-function-mq3-platform-input-events-keyevent-function-keyevent-queue-time-key-down-src-mq3-platform-input-events-ml-694994047"></a>
### keyEvent

```ml
function keyEvent(queue, time, key, down)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `down` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L50)

<a id="constant-constant-mq3-platform-input-events-max-qued-events-const-max-qued-events-256-src-mq3-platform-input-events-ml-1216338214"></a>
### MAX_QUED_EVENTS

```ml
const MAX_QUED_EVENTS = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L11)

<a id="function-function-mq3-platform-input-events-mouseevent-function-mouseevent-queue-time-dx-dy-src-mq3-platform-input-events-ml-1900111333"></a>
### mouseEvent

```ml
function mouseEvent(queue, time, dx, dy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `dx` | `dynamic` | — |  |
| `dy` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L61)

<a id="function-function-mq3-platform-input-events-poll-function-poll-queue-src-mq3-platform-input-events-ml-1446245603"></a>
### poll

```ml
function poll(queue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L81)

- [mq3.platform.input_events.Queue](Type-mq3-platform-input-events-queue-1813437868.md) — struct
<a id="function-function-mq3-platform-input-events-queued-function-queued-queue-src-mq3-platform-input-events-ml-627835447"></a>
### queued

```ml
function queued(queue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L26)

<a id="function-function-mq3-platform-input-events-queueevent-function-queueevent-queue-time-type-value-value2-src-mq3-platform-input-events-ml-88770392"></a>
### queueEvent

```ml
function queueEvent(queue, time, type, value, value2)
```

Exact ownership rule of Sys_QueEvent for input-only events: overwrite the oldest slot on overflow, then append at the current head position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `value2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L33)

<a id="constant-constant-mq3-platform-input-events-se-char-const-se-char-2-src-mq3-platform-input-events-ml-675090987"></a>
### SE_CHAR

```ml
const SE_CHAR = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L8)

<a id="constant-constant-mq3-platform-input-events-se-joystick-axis-const-se-joystick-axis-4-src-mq3-platform-input-events-ml-1966378517"></a>
### SE_JOYSTICK_AXIS

```ml
const SE_JOYSTICK_AXIS = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L10)

<a id="constant-constant-mq3-platform-input-events-se-key-const-se-key-1-src-mq3-platform-input-events-ml-474918174"></a>
### SE_KEY

```ml
const SE_KEY = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L7)

<a id="constant-constant-mq3-platform-input-events-se-mouse-const-se-mouse-3-src-mq3-platform-input-events-ml-1827309228"></a>
### SE_MOUSE

```ml
const SE_MOUSE = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L9)

<a id="constant-constant-mq3-platform-input-events-se-none-const-se-none-0-src-mq3-platform-input-events-ml-678810773"></a>
### SE_NONE

```ml
const SE_NONE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L6)

<a id="function-function-mq3-platform-input-events-wheelevent-function-wheelevent-queue-time-delta-src-mq3-platform-input-events-ml-841208962"></a>
### wheelEvent

```ml
function wheelEvent(queue, time, delta)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `delta` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L72)
