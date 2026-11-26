# `mq3.platform.playable_window.InputEvent`

[Home](README.md) · [Source file](File-src-mq3-platform-playable-window-ml-933960264.md)

<a id="struct-struct-mq3-platform-playable-window-inputevent-struct-inputevent-src-mq3-platform-playable-window-ml-636751591"></a>
## InputEvent

```ml
struct InputEvent
```

Data record for `mq3.platform.playable_window.InputEvent`; groups `time`, `type`, `value`, `value2`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L622)

## Members

<a id="field-field-mq3-platform-playable-window-inputevent-time-time-src-mq3-platform-playable-window-ml-1331632999"></a>
### time

```ml
time
```

Timestamp in milliseconds attached to a native window input record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L624)

<a id="field-field-mq3-platform-playable-window-inputevent-type-type-src-mq3-platform-playable-window-ml-761968413"></a>
### type

```ml
type
```

System-event category selecting how the accompanying values are interpreted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L626)

<a id="field-field-mq3-platform-playable-window-inputevent-value-value-src-mq3-platform-playable-window-ml-1483325453"></a>
### value

```ml
value
```

Primary event value: a key or character code, horizontal motion, or joystick-axis selector.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L628)

<a id="field-field-mq3-platform-playable-window-inputevent-value2-value2-src-mq3-platform-playable-window-ml-146917267"></a>
### value2

```ml
value2
```

Secondary event value: key press state, vertical motion, or joystick-axis magnitude.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/playable_window.ml#L630)
