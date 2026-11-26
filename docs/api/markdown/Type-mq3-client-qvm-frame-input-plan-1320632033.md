# `mq3.client.qvm_frame_input.Plan`

[Home](README.md) · [Source file](File-src-mq3-client-qvm-frame-input-ml-1180554640.md)

<a id="struct-struct-mq3-client-qvm-frame-input-plan-struct-plan-src-mq3-client-qvm-frame-input-ml-278377259"></a>
## Plan

```ml
struct Plan
```

Stores QVM frame input plan record, including `realtime`, `rawMsec`, `integrationMsec`, `commandNumber`, `send`, `sequence` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L46)

## Members

<a id="field-field-mq3-client-qvm-frame-input-plan-commandnumber-commandnumber-src-mq3-client-qvm-frame-input-ml-2057891790"></a>
### commandNumber

```ml
commandNumber
```

When constructing this record, `prepare` supplies `commandNumber` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L57)

<a id="field-field-mq3-client-qvm-frame-input-plan-integrationmsec-integrationmsec-src-mq3-client-qvm-frame-input-ml-521195070"></a>
### integrationMsec

```ml
integrationMsec
```

When constructing this record, `prepare` supplies `1` for this member. Used by `finish` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L55)

<a id="field-field-mq3-client-qvm-frame-input-plan-rawmsec-rawmsec-src-mq3-client-qvm-frame-input-ml-104175310"></a>
### rawMsec

```ml
rawMsec
```

When constructing this record, `prepare` supplies `0` for this member. Used by `applyBound` and `releaseAll` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L52)

<a id="field-field-mq3-client-qvm-frame-input-plan-realtime-realtime-src-mq3-client-qvm-frame-input-ml-1296868648"></a>
### realtime

```ml
realtime
```

Local frame timestamp in milliseconds passed to command creation and retained as the previous input-frame time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L49)

<a id="field-field-mq3-client-qvm-frame-input-plan-send-send-src-mq3-client-qvm-frame-input-ml-488303586"></a>
### send

```ml
send
```

When constructing this record, `prepare` supplies `false` for this member. Used by `finish` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L60)

<a id="field-field-mq3-client-qvm-frame-input-plan-sequence-sequence-src-mq3-client-qvm-frame-input-ml-878705812"></a>
### sequence

```ml
sequence
```

When constructing this record, `prepare` supplies `state.sequence` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L62)

<a id="field-field-mq3-client-qvm-frame-input-plan-used-used-src-mq3-client-qvm-frame-input-ml-34371980"></a>
### used

```ml
used
```

When constructing this record, `prepare` supplies `false` for this member. Used by `finish` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/qvm_frame_input.ml#L65)
