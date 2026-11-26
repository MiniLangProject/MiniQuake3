# `mq3.platform.win_qgl_runtime.State`

[Home](README.md) · [Source file](File-src-mq3-platform-win-qgl-runtime-ml-1575058175.md)

<a id="struct-struct-mq3-platform-win-qgl-runtime-state-struct-state-src-mq3-platform-win-qgl-runtime-ml-73842155"></a>
## State

```ml
struct State
```

Data record for `mq3.platform.win_qgl_runtime.State`; groups `loaded`, `driver`, `logging`, `logCounter`, `logOpen`, `logLines`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L100)

## Members

<a id="field-field-mq3-platform-win-qgl-runtime-state-calls-calls-src-mq3-platform-win-qgl-runtime-ml-1544772850"></a>
### calls

```ml
calls
```

Graphics entry-point calls recorded by the adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L114)

<a id="field-field-mq3-platform-win-qgl-runtime-state-driver-driver-src-mq3-platform-win-qgl-runtime-ml-300290186"></a>
### driver

```ml
driver
```

Graphics driver selected or loaded by the platform layer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L104)

<a id="field-field-mq3-platform-win-qgl-runtime-state-loaded-loaded-src-mq3-platform-win-qgl-runtime-ml-605543988"></a>
### loaded

```ml
loaded
```

Whether the selected OpenGL driver library is loaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L102)

<a id="field-field-mq3-platform-win-qgl-runtime-state-logcounter-logcounter-src-mq3-platform-win-qgl-runtime-ml-145709498"></a>
### logCounter

```ml
logCounter
```

Number of frames or operations included in graphics-call logging.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L108)

<a id="field-field-mq3-platform-win-qgl-runtime-state-logging-logging-src-mq3-platform-win-qgl-runtime-ml-730964546"></a>
### logging

```ml
logging
```

Whether graphics or platform call logging is enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L106)

<a id="field-field-mq3-platform-win-qgl-runtime-state-loglines-loglines-src-mq3-platform-win-qgl-runtime-ml-794003488"></a>
### logLines

```ml
logLines
```

Graphics-call log lines accumulated by the adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L112)

<a id="field-field-mq3-platform-win-qgl-runtime-state-logopen-logopen-src-mq3-platform-win-qgl-runtime-ml-315071282"></a>
### logOpen

```ml
logOpen
```

Whether the graphics-call log is open.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_qgl_runtime.ml#L110)
