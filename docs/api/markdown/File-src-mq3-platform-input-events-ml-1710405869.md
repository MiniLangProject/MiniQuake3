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

Returns `queueEvent(queue,time,SE_CHAR,character,0)` from `mq3.platform.input_events.charEvent`; earlier branches return `error(7100,"input events: invalid character")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Value forwarded as `queue` to `mq3.platform.input_events.queueEvent`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.input_events.queueEvent`. |
| `character` | `dynamic` | — | Value forwarded as `value` to `mq3.platform.input_events.queueEvent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L118)

<a id="function-function-mq3-platform-input-events-create-function-create-clockcontext-clockfn-src-mq3-platform-input-events-ml-110066661"></a>
### create

```ml
function create(clockContext, clockFn)
```

Constructs `mq3.platform.input_events.Queue` with `events` = `array(MAX_QUED_EVENTS,void)`, `head` = `0`, `tail` = `0`, `overflows` = `0` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clockContext` | `dynamic` | — | Initial value for `mq3.platform.input_events.Queue.clockContext`. |
| `clockFn` | `dynamic` | — | Initial value for `mq3.platform.input_events.Queue.clockFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L68)

<a id="function-function-mq3-platform-input-events-dispatch-function-dispatch-event-sink-src-mq3-platform-input-events-ml-733613159"></a>
### dispatch

```ml
function dispatch(event, sink)
```

Productive Com_EventLoop input half. A desktop window adapter only has to enqueue events; engine callbacks stay independent of the native GUI API.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `event` | `dynamic` | — | Record providing `event.type`, `event.value`, `event.value2`, `event.time`. |
| `sink` | `dynamic` | — | Record providing `sink.keyFn`, `sink.context`, `sink.charFn`, `sink.mouseFn`, `sink.joystickFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L180)

<a id="function-function-mq3-platform-input-events-drain-function-drain-queue-sink-maxevents-src-mq3-platform-input-events-ml-283756669"></a>
### drain

```ml
function drain(queue, sink, maxEvents)
```

Dispatches at most maxEvents queued input events to the supplied sink and returns the dispatched count.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Record providing `queue.head`, `queue.tail`. |
| `sink` | `dynamic` | — | Value forwarded as `sink` to `mq3.platform.input_events.dispatch`. |
| `maxEvents` | `dynamic` | — | Input tested by `queue==void or sink==void or typeof(maxEvents)!="int" or maxEvents<0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L200)

- [mq3.platform.input_events.Event](Type-mq3-platform-input-events-event-1582954779.md) — struct
<a id="function-function-mq3-platform-input-events-handlers-function-handlers-context-keyfn-charfn-mousefn-joystickfn-src-mq3-platform-input-events-ml-1600023915"></a>
### handlers

```ml
function handlers(context, keyFn, charFn, mouseFn, joystickFn)
```

Constructs `mq3.platform.input_events.Handlers` from `context`, `keyFn`, `charFn`, `mouseFn`, `joystickFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Initial value for `mq3.platform.input_events.Handlers.context`. |
| `keyFn` | `dynamic` | — | Initial value for `mq3.platform.input_events.Handlers.keyFn`. |
| `charFn` | `dynamic` | — | Initial value for `mq3.platform.input_events.Handlers.charFn`. |
| `mouseFn` | `dynamic` | — | Initial value for `mq3.platform.input_events.Handlers.mouseFn`. |
| `joystickFn` | `dynamic` | — | Initial value for `mq3.platform.input_events.Handlers.joystickFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L172)

- [mq3.platform.input_events.Handlers](Type-mq3-platform-input-events-handlers-646550524.md) — struct
<a id="function-function-mq3-platform-input-events-joystickevent-function-joystickevent-queue-time-axis-value-src-mq3-platform-input-events-ml-406383114"></a>
### joystickEvent

```ml
function joystickEvent(queue, time, axis, value)
```

Returns `queueEvent(queue,time,SE_JOYSTICK_AXIS,axis,value)` from `mq3.platform.input_events.joystickEvent`; earlier branches return `error(7100,"input events: invalid joystick value")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Value forwarded as `queue` to `mq3.platform.input_events.queueEvent`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.input_events.queueEvent`. |
| `axis` | `dynamic` | — | Value forwarded as `value` to `mq3.platform.input_events.queueEvent`. |
| `value` | `dynamic` | — | Value forwarded as `value2` to `mq3.platform.input_events.queueEvent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L139)

<a id="constant-constant-mq3-platform-input-events-k-mwheeldown-const-k-mwheeldown-183-src-mq3-platform-input-events-ml-1222826189"></a>
### K_MWHEELDOWN

```ml
const K_MWHEELDOWN = 183
```

Baseq3 key numbers from keys.h. A wheel notch is represented as a complete key press so bindings cannot remain stuck when a host only reports deltas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L21)

<a id="constant-constant-mq3-platform-input-events-k-mwheelup-const-k-mwheelup-184-src-mq3-platform-input-events-ml-211822396"></a>
### K_MWHEELUP

```ml
const K_MWHEELUP = 184
```

Engine input key code for the upward mouse-wheel step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L23)

<a id="function-function-mq3-platform-input-events-keyevent-function-keyevent-queue-time-key-down-src-mq3-platform-input-events-ml-694994047"></a>
### keyEvent

```ml
function keyEvent(queue, time, key, down)
```

Returns `queueEvent(queue,time,SE_KEY,key,value)` from `mq3.platform.input_events.keyEvent`; earlier branches return `error(7100,"input events: invalid key")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Value forwarded as `queue` to `mq3.platform.input_events.queueEvent`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.input_events.queueEvent`. |
| `key` | `dynamic` | — | Value forwarded as `value` to `mq3.platform.input_events.queueEvent`. |
| `down` | `dynamic` | — | Input tested by `down`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L108)

<a id="constant-constant-mq3-platform-input-events-max-qued-events-const-max-qued-events-256-src-mq3-platform-input-events-ml-1216338214"></a>
### MAX_QUED_EVENTS

```ml
const MAX_QUED_EVENTS = 256
```

Capacity of the bounded system-event queue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L17)

<a id="function-function-mq3-platform-input-events-mouseevent-function-mouseevent-queue-time-dx-dy-src-mq3-platform-input-events-ml-1900111333"></a>
### mouseEvent

```ml
function mouseEvent(queue, time, dx, dy)
```

Returns `queueEvent(queue,time,SE_MOUSE,dx,dy)` from `mq3.platform.input_events.mouseEvent`; earlier branches return `error(7100,"input events: invalid mouse delta")`, `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Value forwarded as `queue` to `mq3.platform.input_events.queueEvent`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.input_events.queueEvent`. |
| `dx` | `dynamic` | — | Value forwarded as `value` to `mq3.platform.input_events.queueEvent`. |
| `dy` | `dynamic` | — | Value forwarded as `value2` to `mq3.platform.input_events.queueEvent`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L128)

<a id="function-function-mq3-platform-input-events-poll-function-poll-queue-src-mq3-platform-input-events-ml-1446245603"></a>
### poll

```ml
function poll(queue)
```

Updates `queue.tail` in `mq3.platform.input_events.poll`; returns `event`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Mutable record or buffer; this call updates `queue.tail`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L159)

- [mq3.platform.input_events.Queue](Type-mq3-platform-input-events-queue-1813437868.md) — struct
<a id="function-function-mq3-platform-input-events-queued-function-queued-queue-src-mq3-platform-input-events-ml-627835447"></a>
### queued

```ml
function queued(queue)
```

Returns `queue.head-queue.tail` from `mq3.platform.input_events.queued`; earlier branches return `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Record providing `queue.head`, `queue.tail`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L74)

<a id="function-function-mq3-platform-input-events-queueevent-function-queueevent-queue-time-type-value-value2-src-mq3-platform-input-events-ml-88770392"></a>
### queueEvent

```ml
function queueEvent(queue, time, type, value, value2)
```

Exact ownership rule of Sys_QueEvent for input-only events: overwrite the oldest slot on overflow, then append at the current head position.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Mutable record or buffer; this call updates `queue.tail`, `queue.overflows`, `queue.events[index]`, `queue.head`. |
| `time` | `dynamic` | — | Value used for `mq3.platform.input_events.Event.time`. |
| `type` | `dynamic` | — | Value used for `mq3.platform.input_events.Event.type`. |
| `value` | `dynamic` | — | Value used for `mq3.platform.input_events.Event.value`. |
| `value2` | `dynamic` | — | Value used for `mq3.platform.input_events.Event.value2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L86)

<a id="constant-constant-mq3-platform-input-events-se-char-const-se-char-2-src-mq3-platform-input-events-ml-675090987"></a>
### SE_CHAR

```ml
const SE_CHAR = 2
```

System-event type carrying a character for text input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L11)

<a id="constant-constant-mq3-platform-input-events-se-joystick-axis-const-se-joystick-axis-4-src-mq3-platform-input-events-ml-1966378517"></a>
### SE_JOYSTICK_AXIS

```ml
const SE_JOYSTICK_AXIS = 4
```

System-event type carrying a joystick axis identifier and value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L15)

<a id="constant-constant-mq3-platform-input-events-se-key-const-se-key-1-src-mq3-platform-input-events-ml-474918174"></a>
### SE_KEY

```ml
const SE_KEY = 1
```

System-event type carrying a key code and its press or release state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L9)

<a id="constant-constant-mq3-platform-input-events-se-mouse-const-se-mouse-3-src-mq3-platform-input-events-ml-1827309228"></a>
### SE_MOUSE

```ml
const SE_MOUSE = 3
```

System-event type carrying relative horizontal and vertical mouse movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L13)

<a id="constant-constant-mq3-platform-input-events-se-none-const-se-none-0-src-mq3-platform-input-events-ml-678810773"></a>
### SE_NONE

```ml
const SE_NONE = 0
```

Event-queue result indicating that no input or system event is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L7)

<a id="function-function-mq3-platform-input-events-wheelevent-function-wheelevent-queue-time-delta-src-mq3-platform-input-events-ml-841208962"></a>
### wheelEvent

```ml
function wheelEvent(queue, time, delta)
```

Expands signed mouse-wheel steps into matching press/release key-event pairs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Value forwarded as `queue` to `mq3.platform.input_events.keyEvent`. |
| `time` | `dynamic` | — | Value forwarded as `time` to `mq3.platform.input_events.keyEvent`. |
| `delta` | `dynamic` | — | Input tested by `typeof(delta)!="int"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/input_events.ml#L148)
