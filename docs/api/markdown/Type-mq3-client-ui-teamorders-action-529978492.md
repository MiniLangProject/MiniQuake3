# `mq3.client.ui_teamorders.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-teamorders-ml-1741634096.md)

<a id="struct-struct-mq3-client-ui-teamorders-action-struct-action-src-mq3-client-ui-teamorders-ml-1204211967"></a>
## Action

```ml
struct Action
```

Stores UI teamorders queued engine action, including `boundary`, `kind`, `name`, `text`, `x`, `y` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L33)

## Members

<a id="field-field-mq3-client-ui-teamorders-action-boundary-boundary-src-mq3-client-ui-teamorders-ml-1675956175"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while selecting a teammate and issuing a predefined team order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L36)

<a id="field-field-mq3-client-ui-teamorders-action-dispatched-dispatched-src-mq3-client-ui-teamorders-ml-1557772933"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while selecting a teammate and issuing a predefined team order; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L57)

<a id="field-field-mq3-client-ui-teamorders-action-kind-kind-src-mq3-client-ui-teamorders-ml-1007453455"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while selecting a teammate and issuing a predefined team order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L39)

<a id="field-field-mq3-client-ui-teamorders-action-name-name-src-mq3-client-ui-teamorders-ml-442895693"></a>
### name

```ml
name
```

Team-chat command name, drawing color, menu target, or artwork resource selected by the team-orders action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L42)

<a id="field-field-mq3-client-ui-teamorders-action-number-number-src-mq3-client-ui-teamorders-ml-1476044545"></a>
### number

```ml
number
```

Numeric argument interpreted by the selected host operation while selecting a teammate and issuing a predefined team order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L54)

<a id="field-field-mq3-client-ui-teamorders-action-text-text-src-mq3-client-ui-teamorders-ml-1226713485"></a>
### text

```ml
text
```

Team-order label to draw or the complete say_team command sent for the selected recipient and order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L45)

<a id="field-field-mq3-client-ui-teamorders-action-x-x-src-mq3-client-ui-teamorders-ml-2094859087"></a>
### x

```ml
x
```

Horizontal position of this queued drawing operation in the virtual layout used by the team-order command menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L48)

<a id="field-field-mq3-client-ui-teamorders-action-y-y-src-mq3-client-ui-teamorders-ml-1708877515"></a>
### y

```ml
y
```

Vertical position of this queued drawing operation in the virtual layout used by the team-order command menu.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_teamorders.ml#L51)
