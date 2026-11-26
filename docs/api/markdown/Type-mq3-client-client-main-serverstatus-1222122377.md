# `mq3.client.client_main.ServerStatus`

[Home](README.md) · [Source file](File-src-mq3-client-client-main-ml-798872826.md)

<a id="struct-struct-mq3-client-client-main-serverstatus-struct-serverstatus-src-mq3-client-client-main-ml-1108595867"></a>
## ServerStatus

```ml
struct ServerStatus
```

Stores client main server status record, including `address`, `text`, `start`, `pending`, `retrieved`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L117)

## Members

<a id="field-field-mq3-client-client-main-serverstatus-address-address-src-mq3-client-client-main-ml-1625186336"></a>
### address

```ml
address
```

When constructing this record, `CL_ServerStatus` supplies `address` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L119)

<a id="field-field-mq3-client-client-main-serverstatus-pending-pending-src-mq3-client-client-main-ml-165880964"></a>
### pending

```ml
pending
```

When constructing this record, `CL_ServerStatus` supplies `true` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L126)

<a id="field-field-mq3-client-client-main-serverstatus-retrieved-retrieved-src-mq3-client-client-main-ml-538543504"></a>
### retrieved

```ml
retrieved
```

When constructing this record, `CL_ServerStatus` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L128)

<a id="field-field-mq3-client-client-main-serverstatus-start-start-src-mq3-client-client-main-ml-530884596"></a>
### start

```ml
start
```

When constructing this record, `CL_ServerStatus` supplies `state.lifecycle.realtime` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L124)

<a id="field-field-mq3-client-client-main-serverstatus-text-text-src-mq3-client-client-main-ml-994396230"></a>
### text

```ml
text
```

Cached server-status reply returned to the browser after the status request completes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L121)
