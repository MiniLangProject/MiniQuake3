# `mq3.client.ui_demos.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-demos-ml-1498146362.md)

<a id="struct-struct-mq3-client-ui-demos-action-struct-action-src-mq3-client-ui-demos-ml-2128321045"></a>
## Action

```ml
struct Action
```

Stores UI demos queued engine action, including `boundary`, `kind`, `name`, `text`, `value`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L48)

## Members

<a id="field-field-mq3-client-ui-demos-action-boundary-boundary-src-mq3-client-ui-demos-ml-1078132243"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while listing recorded demos and starting the selected recording.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L51)

<a id="field-field-mq3-client-ui-demos-action-dispatched-dispatched-src-mq3-client-ui-demos-ml-1598820173"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while listing recorded demos and starting the selected recording; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L64)

<a id="field-field-mq3-client-ui-demos-action-kind-kind-src-mq3-client-ui-demos-ml-1794650099"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while listing recorded demos and starting the selected recording.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L54)

<a id="field-field-mq3-client-ui-demos-action-name-name-src-mq3-client-ui-demos-ml-896799781"></a>
### name

```ml
name
```

Demo-menu target, playback command name, or artwork resource selected for host dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L56)

<a id="field-field-mq3-client-ui-demos-action-text-text-src-mq3-client-ui-demos-ml-390958277"></a>
### text

```ml
text
```

Selected demo playback command or serialized key input passed through the demo menu action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L58)

<a id="field-field-mq3-client-ui-demos-action-value-value-src-mq3-client-ui-demos-ml-2140160551"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while listing recorded demos and starting the selected recording.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_demos.ml#L61)
