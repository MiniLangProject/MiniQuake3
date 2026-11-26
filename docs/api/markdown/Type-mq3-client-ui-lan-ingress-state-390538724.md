# `mq3.client.ui_lan_ingress.State`

[Home](README.md) · [Source file](File-src-mq3-client-ui-lan-ingress-ml-732601155.md)

<a id="struct-struct-mq3-client-ui-lan-ingress-state-struct-state-src-mq3-client-ui-lan-ingress-ml-277590815"></a>
## State

```ml
struct State
```

Stores UI LAN ingress state, including `browser`, `realtime`, `pingUpdateSource`, `masterNum`, `pendingPings`, `pendingStatuses`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L32)

## Members

<a id="field-field-mq3-client-ui-lan-ingress-state-browser-browser-src-mq3-client-ui-lan-ingress-ml-544943622"></a>
### browser

```ml
browser
```

When constructing this record, `create` supplies `browser` for this member. Used by `requestPing` and `responseInfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L35)

<a id="field-field-mq3-client-ui-lan-ingress-state-masternum-masternum-src-mq3-client-ui-lan-ingress-ml-199041694"></a>
### masterNum

```ml
masterNum
```

When constructing this record, `create` supplies `0` for this member. Used by `setMaster` and `responseServers` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L43)

<a id="field-field-mq3-client-ui-lan-ingress-state-pendingpings-pendingpings-src-mq3-client-ui-lan-ingress-ml-404236306"></a>
### pendingPings

```ml
pendingPings
```

When constructing this record, `create` supplies an empty list for this member. Used by `requestPing` and `consumePendingPing` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L46)

<a id="field-field-mq3-client-ui-lan-ingress-state-pendingstatuses-pendingstatuses-src-mq3-client-ui-lan-ingress-ml-798687702"></a>
### pendingStatuses

```ml
pendingStatuses
```

When constructing this record, `create` supplies an empty list for this member. Used by `requestStatus` and `consumePendingStatus` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L49)

<a id="field-field-mq3-client-ui-lan-ingress-state-pingupdatesource-pingupdatesource-src-mq3-client-ui-lan-ingress-ml-689190458"></a>
### pingUpdateSource

```ml
pingUpdateSource
```

When constructing this record, `create` supplies `lan.AS_GLOBAL` for this member. Used by `setPingUpdateSource` and `responseInfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L40)

<a id="field-field-mq3-client-ui-lan-ingress-state-realtime-realtime-src-mq3-client-ui-lan-ingress-ml-1415163792"></a>
### realtime

```ml
realtime
```

Local clock in milliseconds used to measure elapsed time for incoming LAN query responses.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_ingress.ml#L37)
