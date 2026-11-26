# `mq3.client.ui_sp_level.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-sp-level-ml-908068758.md)

<a id="struct-struct-mq3-client-ui-sp-level-action-struct-action-src-mq3-client-ui-sp-level-ml-1675579351"></a>
## Action

```ml
struct Action
```

Stores UI sp level queued engine action, including `boundary`, `kind`, `x`, `y`, `w`, `h` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_level.ml#L82)

## Members

<a id="field-field-mq3-client-ui-sp-level-action-asset-asset-src-mq3-client-ui-sp-level-ml-485364047"></a>
### asset

```ml
asset
```

When constructing this record, `emit` supplies `asset` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_level.ml#L103)

<a id="field-field-mq3-client-ui-sp-level-action-boundary-boundary-src-mq3-client-ui-sp-level-ml-522769727"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while selecting an unlocked arena and presenting its bots and best result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_level.ml#L85)

<a id="field-field-mq3-client-ui-sp-level-action-dispatched-dispatched-src-mq3-client-ui-sp-level-ml-705364329"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while selecting an unlocked arena and presenting its bots and best result; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_level.ml#L109)

<a id="field-field-mq3-client-ui-sp-level-action-h-h-src-mq3-client-ui-sp-level-ml-483062303"></a>
### h

```ml
h
```

Height of the rectangular display region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_level.ml#L98)

<a id="field-field-mq3-client-ui-sp-level-action-kind-kind-src-mq3-client-ui-sp-level-ml-1126311759"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while selecting an unlocked arena and presenting its bots and best result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_level.ml#L88)

<a id="field-field-mq3-client-ui-sp-level-action-text-text-src-mq3-client-ui-sp-level-ml-1591434473"></a>
### text

```ml
text
```

Arena-selection text payload, including labels, confirmation prompts, menu targets, or serialized cvar assignments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_level.ml#L101)

<a id="field-field-mq3-client-ui-sp-level-action-value-value-src-mq3-client-ui-sp-level-ml-1279141643"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while selecting an unlocked arena and presenting its bots and best result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_level.ml#L106)

<a id="field-field-mq3-client-ui-sp-level-action-w-w-src-mq3-client-ui-sp-level-ml-561837459"></a>
### w

```ml
w
```

Width of the rectangular display region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_level.ml#L96)

<a id="field-field-mq3-client-ui-sp-level-action-x-x-src-mq3-client-ui-sp-level-ml-880596255"></a>
### x

```ml
x
```

Horizontal position of this queued drawing operation in the virtual layout used by the single-player arena selection menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_level.ml#L91)

<a id="field-field-mq3-client-ui-sp-level-action-y-y-src-mq3-client-ui-sp-level-ml-1130029555"></a>
### y

```ml
y
```

Vertical position of this queued drawing operation in the virtual layout used by the single-player arena selection menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_sp_level.ml#L94)
