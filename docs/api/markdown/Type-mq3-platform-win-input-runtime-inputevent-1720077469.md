# `mq3.platform.win_input_runtime.InputEvent`

[Home](README.md) · [Source file](File-src-mq3-platform-win-input-runtime-ml-679231699.md)

<a id="struct-struct-mq3-platform-win-input-runtime-inputevent-struct-inputevent-src-mq3-platform-win-input-runtime-ml-557606567"></a>
## InputEvent

```ml
struct InputEvent
```

Data record for `mq3.platform.win_input_runtime.InputEvent`; groups `time`, `type`, `value`, `value2`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L28)

## Members

<a id="field-field-mq3-platform-win-input-runtime-inputevent-time-time-src-mq3-platform-win-input-runtime-ml-2021352887"></a>
### time

```ml
time
```

Millisecond timestamp attached to translated mouse, joystick, or MIDI input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L30)

<a id="field-field-mq3-platform-win-input-runtime-inputevent-type-type-src-mq3-platform-win-input-runtime-ml-2140030373"></a>
### type

```ml
type
```

System-event category selecting how the accompanying values are interpreted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L32)

<a id="field-field-mq3-platform-win-input-runtime-inputevent-value-value-src-mq3-platform-win-input-runtime-ml-1863727737"></a>
### value

```ml
value
```

Primary event value: a key or character code, horizontal motion, or joystick-axis selector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L34)

<a id="field-field-mq3-platform-win-input-runtime-inputevent-value2-value2-src-mq3-platform-win-input-runtime-ml-1976034939"></a>
### value2

```ml
value2
```

Secondary event value: key press state, vertical motion, or joystick-axis magnitude.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_input_runtime.ml#L36)
