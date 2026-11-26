# `mq3.client.ui_controls.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-controls-ml-1689765730.md)

<a id="struct-struct-mq3-client-ui-controls-action-struct-action-src-mq3-client-ui-controls-ml-1240776483"></a>
## Action

```ml
struct Action
```

Stores UI controls queued engine action, including `boundary`, `kind`, `name`, `text`, `value`, `number` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L248)

## Members

<a id="field-field-mq3-client-ui-controls-action-boundary-boundary-src-mq3-client-ui-controls-ml-1773890151"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while applying key bindings and mouse or movement settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L251)

<a id="field-field-mq3-client-ui-controls-action-dispatched-dispatched-src-mq3-client-ui-controls-ml-1395499861"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while applying key bindings and mouse or movement settings; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L267)

<a id="field-field-mq3-client-ui-controls-action-kind-kind-src-mq3-client-ui-controls-ml-436167639"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while applying key bindings and mouse or movement settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L254)

<a id="field-field-mq3-client-ui-controls-action-name-name-src-mq3-client-ui-controls-ml-1419295997"></a>
### name

```ml
name
```

Binding command, key name, cvar, preview model, or menu resource targeted by the controls action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L256)

<a id="field-field-mq3-client-ui-controls-action-number-number-src-mq3-client-ui-controls-ml-1805771305"></a>
### number

```ml
number
```

Numeric argument interpreted by the selected host operation while applying key bindings and mouse or movement settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L264)

<a id="field-field-mq3-client-ui-controls-action-text-text-src-mq3-client-ui-controls-ml-219376501"></a>
### text

```ml
text
```

Binding value, control-setting value, help message, or command text emitted by the controls menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L258)

<a id="field-field-mq3-client-ui-controls-action-value-value-src-mq3-client-ui-controls-ml-26081451"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while applying key bindings and mouse or movement settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_controls.ml#L261)
