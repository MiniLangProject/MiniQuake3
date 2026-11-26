# `mq3.client.ui_atoms.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-atoms-ml-614034284.md)

<a id="struct-struct-mq3-client-ui-atoms-action-struct-action-src-mq3-client-ui-atoms-ml-1584069821"></a>
## Action

```ml
struct Action
```

Stores UI atoms queued engine action, including `boundary`, `kind`, `name`, `text`, `values`, `color` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L61)

## Members

<a id="field-field-mq3-client-ui-atoms-action-boundary-boundary-src-mq3-client-ui-atoms-ml-1208022863"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while drawing base-game UI primitives and changing the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L64)

<a id="field-field-mq3-client-ui-atoms-action-color-color-src-mq3-client-ui-atoms-ml-1088209083"></a>
### color

```ml
color
```

Optional RGBA modulation recorded with a shared UI drawing action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L77)

<a id="field-field-mq3-client-ui-atoms-action-dispatched-dispatched-src-mq3-client-ui-atoms-ml-1298620225"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while drawing base-game UI primitives and changing the active menu stack; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L80)

<a id="field-field-mq3-client-ui-atoms-action-kind-kind-src-mq3-client-ui-atoms-ml-189973887"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while drawing base-game UI primitives and changing the active menu stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L67)

<a id="field-field-mq3-client-ui-atoms-action-name-name-src-mq3-client-ui-atoms-ml-1091945849"></a>
### name

```ml
name
```

Menu sound, command, rendering resource, or other named target used by the common UI host operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L70)

<a id="field-field-mq3-client-ui-atoms-action-text-text-src-mq3-client-ui-atoms-ml-1080986145"></a>
### text

```ml
text
```

Text or serialized value supplied by a common UI drawing, command, diagnostic, or menu-stack operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L73)

<a id="field-field-mq3-client-ui-atoms-action-values-values-src-mq3-client-ui-atoms-ml-2107379103"></a>
### values

```ml
values
```

When constructing this record, `emit` supplies `values` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_atoms.ml#L75)
