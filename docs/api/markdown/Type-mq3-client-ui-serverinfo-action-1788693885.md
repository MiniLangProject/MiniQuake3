# `mq3.client.ui_serverinfo.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-serverinfo-ml-1776030261.md)

<a id="struct-struct-mq3-client-ui-serverinfo-action-struct-action-src-mq3-client-ui-serverinfo-ml-1012571631"></a>
## Action

```ml
struct Action
```

Stores UI serverinfo queued engine action, including `boundary`, `kind`, `name`, `text`, `x`, `y` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L26)

## Members

<a id="field-field-mq3-client-ui-serverinfo-action-boundary-boundary-src-mq3-client-ui-serverinfo-ml-893982379"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while displaying current server cvars and handling the dialog controls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L29)

<a id="field-field-mq3-client-ui-serverinfo-action-dispatched-dispatched-src-mq3-client-ui-serverinfo-ml-1314663809"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while displaying current server cvars and handling the dialog controls; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L49)

<a id="field-field-mq3-client-ui-serverinfo-action-kind-kind-src-mq3-client-ui-serverinfo-ml-1295877075"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while displaying current server cvars and handling the dialog controls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L32)

<a id="field-field-mq3-client-ui-serverinfo-action-name-name-src-mq3-client-ui-serverinfo-ml-1529558229"></a>
### name

```ml
name
```

Favorite-server cvar, drawing color, menu target, or artwork resource selected by the server-information action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L35)

<a id="field-field-mq3-client-ui-serverinfo-action-number-number-src-mq3-client-ui-serverinfo-ml-747823281"></a>
### number

```ml
number
```

Numeric argument interpreted by the selected host operation while displaying current server cvars and handling the dialog controls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L46)

<a id="field-field-mq3-client-ui-serverinfo-action-text-text-src-mq3-client-ui-serverinfo-ml-1918709737"></a>
### text

```ml
text
```

Server-info label or value to draw, or the server address written into a favorite slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L37)

<a id="field-field-mq3-client-ui-serverinfo-action-x-x-src-mq3-client-ui-serverinfo-ml-613888655"></a>
### x

```ml
x
```

Horizontal position of this queued drawing operation in the virtual layout used by the server-information dialog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L40)

<a id="field-field-mq3-client-ui-serverinfo-action-y-y-src-mq3-client-ui-serverinfo-ml-1999345755"></a>
### y

```ml
y
```

Vertical position of this queued drawing operation in the virtual layout used by the server-information dialog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_serverinfo.ml#L43)
