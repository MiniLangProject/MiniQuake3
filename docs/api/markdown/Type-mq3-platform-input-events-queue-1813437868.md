# `mq3.platform.input_events.Queue`

[Home](README.md) · [Source file](File-src-mq3-platform-input-events-ml-1710405869.md)

<a id="struct-struct-mq3-platform-input-events-queue-struct-queue-src-mq3-platform-input-events-ml-312450003"></a>
## Queue

```ml
struct Queue
```

Data record for `mq3.platform.input_events.Queue`; groups `events`, `head`, `tail`, `overflows`, `clockFn`, `clockContext`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L37)

## Members

<a id="field-field-mq3-platform-input-events-queue-clockcontext-clockcontext-src-mq3-platform-input-events-ml-1182535646"></a>
### clockContext

```ml
clockContext
```

Host state passed to the clock callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L49)

<a id="field-field-mq3-platform-input-events-queue-clockfn-clockfn-src-mq3-platform-input-events-ml-860835104"></a>
### clockFn

```ml
clockFn
```

Host callback used to perform clock operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L47)

<a id="field-field-mq3-platform-input-events-queue-events-events-src-mq3-platform-input-events-ml-2041666334"></a>
### events

```ml
events
```

Pending input or system events awaiting delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L39)

<a id="field-field-mq3-platform-input-events-queue-head-head-src-mq3-platform-input-events-ml-2050778912"></a>
### head

```ml
head
```

Producer cursor of the next event slot to fill.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L41)

<a id="field-field-mq3-platform-input-events-queue-overflows-overflows-src-mq3-platform-input-events-ml-625584952"></a>
### overflows

```ml
overflows
```

Number of events lost because the queue reached capacity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L45)

<a id="field-field-mq3-platform-input-events-queue-tail-tail-src-mq3-platform-input-events-ml-1132078112"></a>
### tail

```ml
tail
```

Consumer position of the next event to remove from the queue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L43)
