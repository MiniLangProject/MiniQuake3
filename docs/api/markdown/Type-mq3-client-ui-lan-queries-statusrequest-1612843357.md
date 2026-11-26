# `mq3.client.ui_lan_queries.StatusRequest`

[Home](README.md) · [Source file](File-src-mq3-client-ui-lan-queries-ml-738625990.md)

<a id="struct-struct-mq3-client-ui-lan-queries-statusrequest-struct-statusrequest-src-mq3-client-ui-lan-queries-ml-1813159397"></a>
## StatusRequest

```ml
struct StatusRequest
```

Stores UI LAN queries status request record, including `address`, `start`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_queries.ml#L39)

## Members

<a id="field-field-mq3-client-ui-lan-queries-statusrequest-address-address-src-mq3-client-ui-lan-queries-ml-1916253588"></a>
### address

```ml
address
```

When constructing this record, `serverStatus` supplies `canonical` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_queries.ml#L41)

<a id="field-field-mq3-client-ui-lan-queries-statusrequest-start-start-src-mq3-client-ui-lan-queries-ml-1695811160"></a>
### start

```ml
start
```

When constructing this record, `serverStatus` supplies `state.realtime` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_lan_queries.ml#L43)
