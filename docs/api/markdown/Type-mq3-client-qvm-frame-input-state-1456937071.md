# `mq3.client.qvm_frame_input.State`

[Home](README.md) · [Source file](File-src-mq3-client-qvm-frame-input-ml-1180554640.md)

<a id="struct-struct-mq3-client-qvm-frame-input-state-struct-state-src-mq3-client-qvm-frame-input-ml-752839983"></a>
## State

```ml
struct State
```

Stores QVM frame input state, including `input`, `config`, `oldFrameTime`, `lastCommandTime`, `sequence`, `produced` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L20)

## Members

<a id="field-field-mq3-client-qvm-frame-input-state-config-config-src-mq3-client-qvm-frame-input-ml-256288108"></a>
### config

```ml
config
```

When constructing this record, `create` supplies `qvmFrameCommands.defaults()` for this member. Used by `syncConfig` and `finish` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L27)

<a id="field-field-mq3-client-qvm-frame-input-state-epochs-epochs-src-mq3-client-qvm-frame-input-ml-675154540"></a>
### epochs

```ml
epochs
```

When constructing this record, `create` supplies `0` for this member. Used by `finish` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L40)

<a id="field-field-mq3-client-qvm-frame-input-state-input-input-src-mq3-client-qvm-frame-input-ml-1848847504"></a>
### input

```ml
input
```

When constructing this record, `create` supplies `qvmFrameCommands.create(localAngles[0],localAngles[1],localAngles[2])` for this member. Used by `handlesAction` and `applyBound` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L24)

<a id="field-field-mq3-client-qvm-frame-input-state-lastcommandtime-lastcommandtime-src-mq3-client-qvm-frame-input-ml-727378356"></a>
### lastCommandTime

```ml
lastCommandTime
```

When constructing this record, `create` supplies `commandTime` for this member. Used by `commandTime` and `finish` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L32)

<a id="field-field-mq3-client-qvm-frame-input-state-oldframetime-oldframetime-src-mq3-client-qvm-frame-input-ml-222986790"></a>
### oldFrameTime

```ml
oldFrameTime
```

Client time in milliseconds at which the previous animation frame was exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L29)

<a id="field-field-mq3-client-qvm-frame-input-state-produced-produced-src-mq3-client-qvm-frame-input-ml-1392993084"></a>
### produced

```ml
produced
```

When constructing this record, `create` supplies `0` for this member. Used by `finish` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L37)

<a id="field-field-mq3-client-qvm-frame-input-state-sequence-sequence-src-mq3-client-qvm-frame-input-ml-1610862538"></a>
### sequence

```ml
sequence
```

Monotonically increasing input-plan sequence copied into each newly generated frame plan.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L34)

<a id="field-field-mq3-client-qvm-frame-input-state-variables-variables-src-mq3-client-qvm-frame-input-ml-99172800"></a>
### variables

```ml
variables
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `bindConfig` and `syncConfig` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L43)
