# `mq3.platform.engine_loop.Runtime`

[Home](README.md) · [Source file](File-src-mq3-platform-engine-loop-ml-224472914.md)

<a id="struct-struct-mq3-platform-engine-loop-runtime-struct-runtime-src-mq3-platform-engine-loop-ml-1982028333"></a>
## Runtime

```ml
struct Runtime
```

Data record for `mq3.platform.engine_loop.Runtime`; groups `inputQueue`, `inputHandlers`, `inputBudget`, `serverState`, `serverServices`, `clientState`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L13)

## Members

<a id="field-field-mq3-platform-engine-loop-runtime-clientservices-clientservices-src-mq3-platform-engine-loop-ml-1240753851"></a>
### clientServices

```ml
clientServices
```

Host operations supplied to the client frame pipeline.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L27)

<a id="field-field-mq3-platform-engine-loop-runtime-clientstate-clientstate-src-mq3-platform-engine-loop-ml-2061250469"></a>
### clientState

```ml
clientState
```

Mutable state of the client frame pipeline.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L25)

<a id="field-field-mq3-platform-engine-loop-runtime-commandstate-commandstate-src-mq3-platform-engine-loop-ml-1362859897"></a>
### commandState

```ml
commandState
```

Runtime state of the command parser and command buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L39)

<a id="field-field-mq3-platform-engine-loop-runtime-configstate-configstate-src-mq3-platform-engine-loop-ml-1983587865"></a>
### configState

```ml
configState
```

Runtime state of the console-variable configuration subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L37)

<a id="field-field-mq3-platform-engine-loop-runtime-framecount-framecount-src-mq3-platform-engine-loop-ml-1393524657"></a>
### frameCount

```ml
frameCount
```

Sequence count of frames processed by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L35)

<a id="field-field-mq3-platform-engine-loop-runtime-inputbudget-inputbudget-src-mq3-platform-engine-loop-ml-697025565"></a>
### inputBudget

```ml
inputBudget
```

Maximum number of queued input events handled in one frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L19)

<a id="field-field-mq3-platform-engine-loop-runtime-inputcount-inputcount-src-mq3-platform-engine-loop-ml-1359473687"></a>
### inputCount

```ml
inputCount
```

Number of input events delivered by the engine loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L29)

<a id="field-field-mq3-platform-engine-loop-runtime-inputhandlers-inputhandlers-src-mq3-platform-engine-loop-ml-458634621"></a>
### inputHandlers

```ml
inputHandlers
```

Callbacks that receive keyboard, text, mouse, and joystick events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L17)

<a id="field-field-mq3-platform-engine-loop-runtime-inputqueue-inputqueue-src-mq3-platform-engine-loop-ml-874601475"></a>
### inputQueue

```ml
inputQueue
```

Queue from which the engine drains input events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L15)

<a id="field-field-mq3-platform-engine-loop-runtime-lastclientresult-lastclientresult-src-mq3-platform-engine-loop-ml-1488711977"></a>
### lastClientResult

```ml
lastClientResult
```

Result returned by the most recent client frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L33)

<a id="field-field-mq3-platform-engine-loop-runtime-lastserverresult-lastserverresult-src-mq3-platform-engine-loop-ml-1731020649"></a>
### lastServerResult

```ml
lastServerResult
```

Result returned by the most recent server frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L31)

<a id="field-field-mq3-platform-engine-loop-runtime-serverservices-serverservices-src-mq3-platform-engine-loop-ml-839123627"></a>
### serverServices

```ml
serverServices
```

Host operations supplied to the server frame pipeline.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L23)

<a id="field-field-mq3-platform-engine-loop-runtime-serverstate-serverstate-src-mq3-platform-engine-loop-ml-1874458589"></a>
### serverState

```ml
serverState
```

Mutable state of the server frame pipeline.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/engine_loop.ml#L21)
