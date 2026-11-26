# `mq3.renderer.tr_init.Action`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-init-ml-1583039474.md)

<a id="struct-struct-mq3-renderer-tr-init-action-struct-action-src-mq3-renderer-tr-init-ml-1487368523"></a>
## Action

```ml
struct Action
```

Data record for `mq3.renderer.tr_init.Action`; groups `boundary`, `kind`, `name`, `value`, `number`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L12)

## Members

<a id="field-field-mq3-renderer-tr-init-action-boundary-boundary-src-mq3-renderer-tr-init-ml-1931851295"></a>
### boundary

```ml
boundary
```

Host operation boundary at which this platform action is dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L14)

<a id="field-field-mq3-renderer-tr-init-action-dispatched-dispatched-src-mq3-renderer-tr-init-ml-1937869357"></a>
### dispatched

```ml
dispatched
```

Whether the recorded action was delivered to its host implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L24)

<a id="field-field-mq3-renderer-tr-init-action-kind-kind-src-mq3-renderer-tr-init-ml-505313583"></a>
### kind

```ml
kind
```

Renderer lifecycle operation to dispatch through the named platform boundary.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L16)

<a id="field-field-mq3-renderer-tr-init-action-name-name-src-mq3-renderer-tr-init-ml-2116970229"></a>
### name

```ml
name
```

Resource, command, or console-variable name targeted by the renderer lifecycle action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L18)

<a id="field-field-mq3-renderer-tr-init-action-number-number-src-mq3-renderer-tr-init-ml-1188490737"></a>
### number

```ml
number
```

Numeric argument supplied to the platform action handler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L22)

<a id="field-field-mq3-renderer-tr-init-action-value-value-src-mq3-renderer-tr-init-ml-1145189395"></a>
### value

```ml
value
```

Value carried by the event, configuration item, or requested operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_init.ml#L20)
