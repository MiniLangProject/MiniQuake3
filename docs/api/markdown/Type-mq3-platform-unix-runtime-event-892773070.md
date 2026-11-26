# `mq3.platform.unix_runtime.Event`

[Home](README.md) · [Source file](File-src-mq3-platform-unix-runtime-ml-1537873738.md)

<a id="struct-struct-mq3-platform-unix-runtime-event-struct-event-src-mq3-platform-unix-runtime-ml-1655817623"></a>
## Event

```ml
struct Event
```

Data record for `mq3.platform.unix_runtime.Event`; groups `kind`, `value1`, `value2`, `time`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L47)

## Members

<a id="field-field-mq3-platform-unix-runtime-event-kind-kind-src-mq3-platform-unix-runtime-ml-1814186045"></a>
### kind

```ml
kind
```

System-event category selecting how the accompanying values are interpreted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L49)

<a id="field-field-mq3-platform-unix-runtime-event-time-time-src-mq3-platform-unix-runtime-ml-1620346943"></a>
### time

```ml
time
```

Millisecond timestamp retained with a Unix keyboard, mouse, or system event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L55)

<a id="field-field-mq3-platform-unix-runtime-event-value1-value1-src-mq3-platform-unix-runtime-ml-516891549"></a>
### value1

```ml
value1
```

Primary event value: a key or character code, horizontal motion, or joystick-axis selector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L51)

<a id="field-field-mq3-platform-unix-runtime-event-value2-value2-src-mq3-platform-unix-runtime-ml-195393803"></a>
### value2

```ml
value2
```

Secondary event value: key press state, vertical motion, or joystick-axis magnitude.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/unix_runtime.ml#L53)
