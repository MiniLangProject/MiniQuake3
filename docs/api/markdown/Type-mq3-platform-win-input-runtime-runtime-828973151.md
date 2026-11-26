# `mq3.platform.win_input_runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-platform-win-input-runtime-ml-679231699.md)

<a id="struct-struct-mq3-platform-win-input-runtime-runtime-struct-runtime-src-mq3-platform-win-input-runtime-ml-2099581037"></a>
## Runtime

```ml
struct Runtime
```

Data record for `mq3.platform.win_input_runtime.Runtime`; groups `appActive`, `mouse`, `joystick`, `midi`, `events`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L90)

## Members

<a id="field-field-mq3-platform-win-input-runtime-runtime-appactive-appactive-src-mq3-platform-win-input-runtime-ml-1785797231"></a>
### appActive

```ml
appActive
```

Whether the application has focus and may acquire input devices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L92)

<a id="field-field-mq3-platform-win-input-runtime-runtime-events-events-src-mq3-platform-win-input-runtime-ml-686134057"></a>
### events

```ml
events
```

Pending input or system events awaiting delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L100)

<a id="field-field-mq3-platform-win-input-runtime-runtime-joystick-joystick-src-mq3-platform-win-input-runtime-ml-1867915267"></a>
### joystick

```ml
joystick
```

Joystick device state and previous input samples.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L96)

<a id="field-field-mq3-platform-win-input-runtime-runtime-midi-midi-src-mq3-platform-win-input-runtime-ml-1513812981"></a>
### midi

```ml
midi
```

MIDI device selection and input state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L98)

<a id="field-field-mq3-platform-win-input-runtime-runtime-mouse-mouse-src-mq3-platform-win-input-runtime-ml-1878604775"></a>
### mouse

```ml
mouse
```

Mouse device state and pending relative input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L94)
