# `mq3.client.ui_cdkey.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-cdkey-ml-1843695940.md)

<a id="struct-struct-mq3-client-ui-cdkey-action-struct-action-src-mq3-client-ui-cdkey-ml-1536085029"></a>
## Action

```ml
struct Action
```

Stores UI cdkey queued engine action, including `boundary`, `kind`, `name`, `text`, `value`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L30)

## Members

<a id="field-field-mq3-client-ui-cdkey-action-boundary-boundary-src-mq3-client-ui-cdkey-ml-1685841159"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while validating and storing the entered product key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L33)

<a id="field-field-mq3-client-ui-cdkey-action-dispatched-dispatched-src-mq3-client-ui-cdkey-ml-1967521169"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while validating and storing the entered product key; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L46)

<a id="field-field-mq3-client-ui-cdkey-action-kind-kind-src-mq3-client-ui-cdkey-ml-795778071"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while validating and storing the entered product key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L36)

<a id="field-field-mq3-client-ui-cdkey-action-name-name-src-mq3-client-ui-cdkey-ml-339542377"></a>
### name

```ml
name
```

CD-key menu control, console variable, or artwork resource targeted by the host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L38)

<a id="field-field-mq3-client-ui-cdkey-action-text-text-src-mq3-client-ui-cdkey-ml-1420670449"></a>
### text

```ml
text
```

Entered CD-key text, validation message, or cvar value emitted by the key-entry menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L40)

<a id="field-field-mq3-client-ui-cdkey-action-value-value-src-mq3-client-ui-cdkey-ml-859524555"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while validating and storing the entered product key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_cdkey.ml#L43)
