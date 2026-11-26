# `mq3.client.cl_keys_runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-client-cl-keys-runtime-ml-1022053976.md)

<a id="struct-struct-mq3-client-cl-keys-runtime-runtime-struct-runtime-src-mq3-client-cl-keys-runtime-ml-519125693"></a>
## Runtime

```ml
struct Runtime
```

Stores engine client keys runtime runtime wiring and state, including `keyState`, `consoleState`, `repeats`, `anyKeyDown`, `events`, `commandState` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_keys_runtime.ml#L88)

## Members

<a id="field-field-mq3-client-cl-keys-runtime-runtime-anykeydown-anykeydown-src-mq3-client-cl-keys-runtime-ml-2097779635"></a>
### anyKeyDown

```ml
anyKeyDown
```

When constructing this record, `create` supplies `0` for this member. Used by `CL_KeyEvent` and `Key_ClearStates` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_keys_runtime.ml#L100)

<a id="field-field-mq3-client-cl-keys-runtime-runtime-archivemodified-archivemodified-src-mq3-client-cl-keys-runtime-ml-5959497"></a>
### archiveModified

```ml
archiveModified
```

When constructing this record, `create` supplies `false` for this member. Used by `Key_SetBinding` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_keys_runtime.ml#L112)

<a id="field-field-mq3-client-cl-keys-runtime-runtime-bindingstate-bindingstate-src-mq3-client-cl-keys-runtime-ml-38876393"></a>
### bindingState

```ml
bindingState
```

When constructing this record, `create` supplies `config.create(keyState)` for this member. Used by `Key_WriteBindings` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_keys_runtime.ml#L109)

<a id="field-field-mq3-client-cl-keys-runtime-runtime-cameramode-cameramode-src-mq3-client-cl-keys-runtime-ml-1250102073"></a>
### cameraMode

```ml
cameraMode
```

When constructing this record, `create` supplies `0` for this member. Used by `CL_KeyEvent` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_keys_runtime.ml#L117)

<a id="field-field-mq3-client-cl-keys-runtime-runtime-commandstate-commandstate-src-mq3-client-cl-keys-runtime-ml-2027899601"></a>
### commandState

```ml
commandState
```

When constructing this record, `create` supplies `commandState` for this member. Used by `CL_InitKeyCommands` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_keys_runtime.ml#L106)

<a id="field-field-mq3-client-cl-keys-runtime-runtime-consolestate-consolestate-src-mq3-client-cl-keys-runtime-ml-819129633"></a>
### consoleState

```ml
consoleState
```

When constructing this record, `create` supplies `consoleState` for this member. Used by `syncCatcher` and `Key_SetOverstrikeMode` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_keys_runtime.ml#L94)

<a id="field-field-mq3-client-cl-keys-runtime-runtime-demoplaying-demoplaying-src-mq3-client-cl-keys-runtime-ml-560065053"></a>
### demoPlaying

```ml
demoPlaying
```

True while the client receives its game data from a recorded demo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_keys_runtime.ml#L114)

<a id="field-field-mq3-client-cl-keys-runtime-runtime-events-events-src-mq3-client-cl-keys-runtime-ml-891748423"></a>
### events

```ml
events
```

When constructing this record, `create` supplies an empty list for this member. Used by `event` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_keys_runtime.ml#L103)

<a id="field-field-mq3-client-cl-keys-runtime-runtime-initialized-initialized-src-mq3-client-cl-keys-runtime-ml-1456992337"></a>
### initialized

```ml
initialized
```

True after the keyboard runtime's commands and bindings have been initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_keys_runtime.ml#L119)

<a id="field-field-mq3-client-cl-keys-runtime-runtime-keystate-keystate-src-mq3-client-cl-keys-runtime-ml-1643865173"></a>
### keyState

```ml
keyState
```

When constructing this record, `create` supplies `keyState` for this member. Used by `syncCatcher` and `Key_IsDown` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_keys_runtime.ml#L91)

<a id="field-field-mq3-client-cl-keys-runtime-runtime-repeats-repeats-src-mq3-client-cl-keys-runtime-ml-652473929"></a>
### repeats

```ml
repeats
```

When constructing this record, `create` supplies `array(MAX_KEYS,0)` for this member. Used by `CL_KeyEvent` and `Key_ClearStates` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cl_keys_runtime.ml#L97)
