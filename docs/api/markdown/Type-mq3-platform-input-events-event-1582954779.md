# `mq3.platform.input_events.Event`

[Home](README.md) · [Source file](File-src-mq3-platform-input-events-ml-1710405869.md)

<a id="struct-struct-mq3-platform-input-events-event-struct-event-src-mq3-platform-input-events-ml-2107705185"></a>
## Event

```ml
struct Event
```

Data record for `mq3.platform.input_events.Event`; groups `time`, `type`, `value`, `value2`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L26)

## Members

<a id="field-field-mq3-platform-input-events-event-time-time-src-mq3-platform-input-events-ml-1473305459"></a>
### time

```ml
time
```

Input occurrence time in milliseconds used when dispatching the queued event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L28)

<a id="field-field-mq3-platform-input-events-event-type-type-src-mq3-platform-input-events-ml-1453548229"></a>
### type

```ml
type
```

System-event category selecting how the accompanying values are interpreted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L30)

<a id="field-field-mq3-platform-input-events-event-value-value-src-mq3-platform-input-events-ml-1501576153"></a>
### value

```ml
value
```

Primary event value: a key or character code, horizontal motion, or joystick-axis selector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L32)

<a id="field-field-mq3-platform-input-events-event-value2-value2-src-mq3-platform-input-events-ml-165328167"></a>
### value2

```ml
value2
```

Secondary event value: key press state, vertical motion, or joystick-axis magnitude.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/input_events.ml#L34)
