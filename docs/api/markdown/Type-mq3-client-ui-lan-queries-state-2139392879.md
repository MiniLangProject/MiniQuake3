# `mq3.client.ui_lan_queries.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-lan-queries-ml-738625990.md)

<a id="struct-struct-mq3-client-ui-lan-queries-state-struct-state-src-mq3-client-ui-lan-queries-ml-581599305"></a>
## State

```ml
struct State
```

Stores UI LAN queries state, including `browser`, `ingress`, `services`, `realtime`, `maxPing`, `statusResendTime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L46)

## Members

<a id="field-field-mq3-client-ui-lan-queries-state-browser-browser-src-mq3-client-ui-lan-queries-ml-337180482"></a>
### browser

```ml
browser
```

When constructing this record, `create` supplies `browser` for this member. Used by `scanLocal` and `scanGlobal` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L49)

<a id="field-field-mq3-client-ui-lan-queries-state-ingress-ingress-src-mq3-client-ui-lan-queries-ml-1395974842"></a>
### ingress

```ml
ingress
```

When constructing this record, `create` supplies `ingressState` for this member. Used by `setRealtime` and `scanLocal` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L52)

<a id="field-field-mq3-client-ui-lan-queries-state-masterhost-masterhost-src-mq3-client-ui-lan-queries-ml-566118730"></a>
### masterHost

```ml
masterHost
```

When constructing this record, `create` supplies `MASTER_SERVER_NAME` for this member. Used by `setMasterHost` and `scanGlobal` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L64)

<a id="field-field-mq3-client-ui-lan-queries-state-maxping-maxping-src-mq3-client-ui-lan-queries-ml-1408190730"></a>
### maxPing

```ml
maxPing
```

Maximum acceptable server-browser latency in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L58)

<a id="field-field-mq3-client-ui-lan-queries-state-realtime-realtime-src-mq3-client-ui-lan-queries-ml-856093772"></a>
### realtime

```ml
realtime
```

Local clock in milliseconds used to timestamp server-browser requests and detect query timeouts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L56)

<a id="field-field-mq3-client-ui-lan-queries-state-services-services-src-mq3-client-ui-lan-queries-ml-815101962"></a>
### services

```ml
services
```

Service callbacks and context used to access the host engine from this client subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L54)

<a id="field-field-mq3-client-ui-lan-queries-state-statusrequests-statusrequests-src-mq3-client-ui-lan-queries-ml-453109154"></a>
### statusRequests

```ml
statusRequests
```

When constructing this record, `create` supplies an empty list for this member. Used by `findStatusRequest` and `serverStatus` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L67)

<a id="field-field-mq3-client-ui-lan-queries-state-statusresendtime-statusresendtime-src-mq3-client-ui-lan-queries-ml-1709686730"></a>
### statusResendTime

```ml
statusResendTime
```

When constructing this record, `create` supplies `750` for this member. Used by `setStatusResendTime` and `serverStatus` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_queries.ml#L61)
