# `mq3.platform.win_input_runtime.Mouse`

[Home](README.md) · [Source file](File-src-mq3-platform-win-input-runtime-ml-679231699.md)

<a id="struct-struct-mq3-platform-win-input-runtime-mouse-struct-mouse-src-mq3-platform-win-input-runtime-ml-393603619"></a>
## Mouse

```ml
struct Mouse
```

Data record for `mq3.platform.win_input_runtime.Mouse`; groups `initialized`, `active`, `directInput`, `startupDelayed`, `oldButtonState`, `dx`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L39)

## Members

<a id="field-field-mq3-platform-win-input-runtime-mouse-active-active-src-mq3-platform-win-input-runtime-ml-972362784"></a>
### active

```ml
active
```

Whether this object is currently active and accepts processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L43)

<a id="field-field-mq3-platform-win-input-runtime-mouse-directinput-directinput-src-mq3-platform-win-input-runtime-ml-1193146360"></a>
### directInput

```ml
directInput
```

Whether mouse input uses the DirectInput path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L45)

<a id="field-field-mq3-platform-win-input-runtime-mouse-dx-dx-src-mq3-platform-win-input-runtime-ml-694155972"></a>
### dx

```ml
dx
```

Relative horizontal mouse movement accumulated for the current sample.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L51)

<a id="field-field-mq3-platform-win-input-runtime-mouse-dy-dy-src-mq3-platform-win-input-runtime-ml-342258946"></a>
### dy

```ml
dy
```

Relative vertical mouse movement accumulated for the current sample.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L53)

<a id="field-field-mq3-platform-win-input-runtime-mouse-initialized-initialized-src-mq3-platform-win-input-runtime-ml-622950432"></a>
### initialized

```ml
initialized
```

Whether initialization completed successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L41)

<a id="field-field-mq3-platform-win-input-runtime-mouse-oldbuttonstate-oldbuttonstate-src-mq3-platform-win-input-runtime-ml-847881552"></a>
### oldButtonState

```ml
oldButtonState
```

Mouse-button bit mask retained from the preceding input sample.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L49)

<a id="field-field-mq3-platform-win-input-runtime-mouse-startupdelayed-startupdelayed-src-mq3-platform-win-input-runtime-ml-899234358"></a>
### startupDelayed

```ml
startupDelayed
```

Whether mouse startup is postponed until the window can acquire input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_input_runtime.ml#L47)
