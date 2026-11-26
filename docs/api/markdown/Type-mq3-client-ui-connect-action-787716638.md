# `mq3.client.ui_connect.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-connect-ml-1918938180.md)

<a id="struct-struct-mq3-client-ui-connect-action-struct-action-src-mq3-client-ui-connect-ml-706139065"></a>
## Action

```ml
struct Action
```

Stores UI connect queued engine action, including `boundary`, `kind`, `x`, `y`, `width`, `height` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L39)

## Members

<a id="field-field-mq3-client-ui-connect-action-asset-asset-src-mq3-client-ui-connect-ml-1079598815"></a>
### asset

```ml
asset
```

When constructing this record, `emit` supplies `asset` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L64)

<a id="field-field-mq3-client-ui-connect-action-boundary-boundary-src-mq3-client-ui-connect-ml-114799055"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while drawing connection status and download progress.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L42)

<a id="field-field-mq3-client-ui-connect-action-color-color-src-mq3-client-ui-connect-ml-1005321131"></a>
### color

```ml
color
```

Optional RGBA tint for the connection-screen drawing request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L62)

<a id="field-field-mq3-client-ui-connect-action-dispatched-dispatched-src-mq3-client-ui-connect-ml-401939373"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while drawing connection status and download progress; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L70)

<a id="field-field-mq3-client-ui-connect-action-height-height-src-mq3-client-ui-connect-ml-1622602721"></a>
### height

```ml
height
```

Height of the image or rectangle drawn on the connection and download screen.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L55)

<a id="field-field-mq3-client-ui-connect-action-kind-kind-src-mq3-client-ui-connect-ml-1906362591"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while drawing connection status and download progress.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L45)

<a id="field-field-mq3-client-ui-connect-action-style-style-src-mq3-client-ui-connect-ml-377488867"></a>
### style

```ml
style
```

UI drawing-style flags controlling alignment, font selection, and text emphasis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L60)

<a id="field-field-mq3-client-ui-connect-action-text-text-src-mq3-client-ui-connect-ml-180965933"></a>
### text

```ml
text
```

Connection or download message to draw, or command text such as the disconnect request issued from the connection screen.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L58)

<a id="field-field-mq3-client-ui-connect-action-value-value-src-mq3-client-ui-connect-ml-748122427"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while drawing connection status and download progress.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L67)

<a id="field-field-mq3-client-ui-connect-action-width-width-src-mq3-client-ui-connect-ml-1161457571"></a>
### width

```ml
width
```

Width of the image or rectangle drawn on the connection and download screen.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L53)

<a id="field-field-mq3-client-ui-connect-action-x-x-src-mq3-client-ui-connect-ml-714468335"></a>
### x

```ml
x
```

Horizontal position of this queued drawing operation in the virtual layout used by the connection and download-progress screen.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L48)

<a id="field-field-mq3-client-ui-connect-action-y-y-src-mq3-client-ui-connect-ml-527226931"></a>
### y

```ml
y
```

Vertical position of this queued drawing operation in the virtual layout used by the connection and download-progress screen.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_connect.ml#L51)
