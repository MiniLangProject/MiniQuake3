# `mq3.client.ui_rankstatus.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-rankstatus-ml-1210092028.md)

<a id="struct-struct-mq3-client-ui-rankstatus-action-struct-action-src-mq3-client-ui-rankstatus-ml-1994897215"></a>
## Action

```ml
struct Action
```

Stores UI rankstatus queued engine action, including `boundary`, `kind`, `name`, `text`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L14)

## Members

<a id="field-field-mq3-client-ui-rankstatus-action-boundary-boundary-src-mq3-client-ui-rankstatus-ml-1562404315"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while displaying ranked-account status and dismissing its message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L17)

<a id="field-field-mq3-client-ui-rankstatus-action-dispatched-dispatched-src-mq3-client-ui-rankstatus-ml-456225493"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while displaying ranked-account status and dismissing its message; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L28)

<a id="field-field-mq3-client-ui-rankstatus-action-kind-kind-src-mq3-client-ui-rankstatus-ml-1925428219"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while displaying ranked-account status and dismissing its message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L20)

<a id="field-field-mq3-client-ui-rankstatus-action-name-name-src-mq3-client-ui-rankstatus-ml-1117435789"></a>
### name

```ml
name
```

Menu destination or status-frame artwork resource selected by the rankings-status workflow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L22)

<a id="field-field-mq3-client-ui-rankstatus-action-text-text-src-mq3-client-ui-rankstatus-ml-1307260925"></a>
### text

```ml
text
```

Optional text argument reserved for ranking-status host actions; current menu operations pass an empty string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_rankstatus.ml#L25)
