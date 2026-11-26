# `mq3.platform.win_wndproc_runtime.Event`

[Home](README.md) · [Source file](File-src-mq3-platform-win-wndproc-runtime-ml-1500188850.md)

<a id="struct-struct-mq3-platform-win-wndproc-runtime-event-struct-event-src-mq3-platform-win-wndproc-runtime-ml-1415582977"></a>
## Event

```ml
struct Event
```

Data record for `mq3.platform.win_wndproc_runtime.Event`; groups `time`, `type`, `value`, `value2`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L153)

## Members

<a id="field-field-mq3-platform-win-wndproc-runtime-event-time-time-src-mq3-platform-win-wndproc-runtime-ml-1413179387"></a>
### time

```ml
time
```

Millisecond timestamp assigned while translating a Windows window message into engine input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L155)

<a id="field-field-mq3-platform-win-wndproc-runtime-event-type-type-src-mq3-platform-win-wndproc-runtime-ml-1324124837"></a>
### type

```ml
type
```

System-event category selecting how the accompanying values are interpreted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L157)

<a id="field-field-mq3-platform-win-wndproc-runtime-event-value-value-src-mq3-platform-win-wndproc-runtime-ml-2032184477"></a>
### value

```ml
value
```

Primary event value: a key or character code, horizontal motion, or joystick-axis selector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L159)

<a id="field-field-mq3-platform-win-wndproc-runtime-event-value2-value2-src-mq3-platform-win-wndproc-runtime-ml-1798655535"></a>
### value2

```ml
value2
```

Secondary event value: key press state, vertical motion, or joystick-axis magnitude.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_wndproc_runtime.ml#L161)
