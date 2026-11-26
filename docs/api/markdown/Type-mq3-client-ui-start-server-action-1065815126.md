# `mq3.client.ui_start_server.Action`

[Home](README.md) · [Source file](File-src-mq3-client-ui-start-server-ml-1691378486.md)

<a id="struct-struct-mq3-client-ui-start-server-action-struct-action-src-mq3-client-ui-start-server-ml-1715395571"></a>
## Action

```ml
struct Action
```

Stores UI start server queued engine action, including `boundary`, `kind`, `name`, `value`, `number`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L28)

## Members

<a id="field-field-mq3-client-ui-start-server-action-boundary-boundary-src-mq3-client-ui-start-server-ml-319638479"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while choosing a map and game rules, configuring bot slots, and launching a server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L31)

<a id="field-field-mq3-client-ui-start-server-action-dispatched-dispatched-src-mq3-client-ui-start-server-ml-1830845537"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while choosing a map and game rules, configuring bot slots, and launching a server; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L46)

<a id="field-field-mq3-client-ui-start-server-action-kind-kind-src-mq3-client-ui-start-server-ml-622282559"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while choosing a map and game rules, configuring bot slots, and launching a server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L34)

<a id="field-field-mq3-client-ui-start-server-action-name-name-src-mq3-client-ui-start-server-ml-2139309337"></a>
### name

```ml
name
```

Map, bot/server-setting cvar, command, menu destination, or artwork resource targeted by server setup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L37)

<a id="field-field-mq3-client-ui-start-server-action-number-number-src-mq3-client-ui-start-server-ml-1096812429"></a>
### number

```ml
number
```

Numeric argument interpreted by the selected host operation while choosing a map and game rules, configuring bot slots, and launching a server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L43)

<a id="field-field-mq3-client-ui-start-server-action-value-value-src-mq3-client-ui-start-server-ml-904926955"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while choosing a map and game rules, configuring bot slots, and launching a server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_start_server.ml#L40)
