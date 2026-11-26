# `mq3.client.cl_input.State`

[Home](README.md) · [Source file](File-src-mq3-client-cl-input-ml-663114153.md)

<a id="struct-struct-mq3-client-cl-input-state-struct-state-src-mq3-client-cl-input-ml-710676643"></a>
## State

```ml
struct State
```

Stores engine client input state, including `inputState`, `config`, `sendState`, `sendHost`, `commandState`, `host` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L37)

## Members

<a id="field-field-mq3-client-cl-input-state-anykeydown-anykeydown-src-mq3-client-cl-input-ml-1294453768"></a>
### anyKeyDown

```ml
anyKeyDown
```

When constructing this record, `create` supplies `false` for this member. Used by `CL_CmdButtons` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L72)

<a id="field-field-mq3-client-cl-input-state-cgamesensitivity-cgamesensitivity-src-mq3-client-cl-input-ml-1387019818"></a>
### cgameSensitivity

```ml
cgameSensitivity
```

When constructing this record, `create` supplies `1.0` for this member. Used by `CL_MouseMove` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L67)

<a id="field-field-mq3-client-cl-input-state-commandstate-commandstate-src-mq3-client-cl-input-ml-1902791258"></a>
### commandState

```ml
commandState
```

When constructing this record, `create` supplies `commandState` for this member. Used by `CL_InitInput` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L52)

<a id="field-field-mq3-client-cl-input-state-config-config-src-mq3-client-cl-input-ml-437854026"></a>
### config

```ml
config
```

When constructing this record, `create` supplies `input.defaults()` for this member. Used by `IN_MLookUp` and `CL_AdjustAngles` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L43)

<a id="field-field-mq3-client-cl-input-state-debugmove-debugmove-src-mq3-client-cl-input-ml-1303007626"></a>
### debugMove

```ml
debugMove
```

When constructing this record, `create` supplies `0` for this member. Used by `CL_CreateCmd` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L78)

<a id="field-field-mq3-client-cl-input-state-deltapitch-deltapitch-src-mq3-client-cl-input-ml-1037551858"></a>
### deltaPitch

```ml
deltaPitch
```

When constructing this record, `create` supplies `0` for this member. Used by `IN_CenterView` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L75)

<a id="field-field-mq3-client-cl-input-state-framemsec-framemsec-src-mq3-client-cl-input-ml-905160806"></a>
### frameMsec

```ml
frameMsec
```

When constructing this record, `create` supplies `1` for this member. Used by `IN_KeyUp` and `CL_KeyState` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L60)

<a id="field-field-mq3-client-cl-input-state-frametime-frametime-src-mq3-client-cl-input-ml-1960390234"></a>
### frameTime

```ml
frameTime
```

Absolute input-frame timestamp in milliseconds used to integrate held controls and construct the next user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L57)

<a id="field-field-mq3-client-cl-input-state-host-host-src-mq3-client-cl-input-ml-619410474"></a>
### host

```ml
host
```

Host-adapter callbacks and context used to execute the module's engine operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L54)

<a id="field-field-mq3-client-cl-input-state-initialized-initialized-src-mq3-client-cl-input-ml-223824986"></a>
### initialized

```ml
initialized
```

True after input commands and input-related cvars have been registered, preventing duplicate initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L81)

<a id="field-field-mq3-client-cl-input-state-inputstate-inputstate-src-mq3-client-cl-input-ml-2115992964"></a>
### inputState

```ml
inputState
```

When constructing this record, `create` supplies `input.create(0.0,0.0,0.0)` for this member. Used by `IN_MLookDown` and `IN_MLookUp` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L40)

<a id="field-field-mq3-client-cl-input-state-keycatchers-keycatchers-src-mq3-client-cl-input-ml-1458023658"></a>
### keyCatchers

```ml
keyCatchers
```

Bitmask selecting which subsystems currently intercept keyboard input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L69)

<a id="field-field-mq3-client-cl-input-state-sendhost-sendhost-src-mq3-client-cl-input-ml-822078150"></a>
### sendHost

```ml
sendHost
```

When constructing this record, `create` supplies `sendHost` for this member. Used by `CL_ReadyToSendPacket` and `CL_WritePacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L49)

<a id="field-field-mq3-client-cl-input-state-sendstate-sendstate-src-mq3-client-cl-input-ml-1764941726"></a>
### sendState

```ml
sendState
```

When constructing this record, `create` supplies `sendState` for this member. Used by `CL_CreateNewCommands` and `CL_ReadyToSendPacket` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L46)

<a id="field-field-mq3-client-cl-input-state-servertime-servertime-src-mq3-client-cl-input-ml-1999461242"></a>
### serverTime

```ml
serverTime
```

Current synchronized server-domain time in milliseconds used when constructing input commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L62)

<a id="field-field-mq3-client-cl-input-state-weapon-weapon-src-mq3-client-cl-input-ml-1382783098"></a>
### weapon

```ml
weapon
```

Requested weapon identifier copied into each generated user command with an eight-bit mask.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_input.ml#L64)
