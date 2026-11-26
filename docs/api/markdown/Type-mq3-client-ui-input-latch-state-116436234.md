# `mq3.client.ui_input_latch.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-input-latch-ml-1943622233.md)

<a id="struct-struct-mq3-client-ui-input-latch-state-struct-state-src-mq3-client-ui-input-latch-ml-70230827"></a>
## State

```ml
struct State
```

Stores UI input latch state, including `down`, `pulse`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_input_latch.ml#L9)

## Members

<a id="field-field-mq3-client-ui-input-latch-state-down-down-src-mq3-client-ui-input-latch-ml-982911922"></a>
### down

```ml
down
```

When constructing this record, `create` supplies `array(keyCount,false)` for this member. Used by `observe` and `keyDown` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_input_latch.ml#L12)

<a id="field-field-mq3-client-ui-input-latch-state-pulse-pulse-src-mq3-client-ui-input-latch-ml-1200502314"></a>
### pulse

```ml
pulse
```

When constructing this record, `create` supplies `array(keyCount,false)` for this member. Used by `beginFrame` and `observe` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_input_latch.ml#L15)
