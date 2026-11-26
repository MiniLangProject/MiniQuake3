# `mq3.client.cgame_servercmds.Action`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-servercmds-ml-56240583.md)

<a id="struct-struct-mq3-client-cgame-servercmds-action-struct-action-src-mq3-client-cgame-servercmds-ml-1855349383"></a>
## Action

```ml
struct Action
```

Stores client game servercmds queued engine action, including `boundary`, `kind`, `value`, `value2`, `number`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L210)

## Members

<a id="field-field-mq3-client-cgame-servercmds-action-boundary-boundary-src-mq3-client-cgame-servercmds-ml-146334965"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while applying reliable server commands and playing server-directed feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L213)

<a id="field-field-mq3-client-cgame-servercmds-action-dispatched-dispatched-src-mq3-client-cgame-servercmds-ml-849526995"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while applying reliable server commands and playing server-directed feedback; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L227)

<a id="field-field-mq3-client-cgame-servercmds-action-kind-kind-src-mq3-client-cgame-servercmds-ml-936039597"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while applying reliable server commands and playing server-directed feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L216)

<a id="field-field-mq3-client-cgame-servercmds-action-number-number-src-mq3-client-cgame-servercmds-ml-850659811"></a>
### number

```ml
number
```

Numeric argument interpreted by the selected host operation while applying reliable server commands and playing server-directed feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L224)

<a id="field-field-mq3-client-cgame-servercmds-action-value-value-src-mq3-client-cgame-servercmds-ml-766058357"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while applying reliable server commands and playing server-directed feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L219)

<a id="field-field-mq3-client-cgame-servercmds-action-value2-value2-src-mq3-client-cgame-servercmds-ml-1647331855"></a>
### value2

```ml
value2
```

When constructing this record, `action` supplies `value2` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_servercmds.ml#L221)
