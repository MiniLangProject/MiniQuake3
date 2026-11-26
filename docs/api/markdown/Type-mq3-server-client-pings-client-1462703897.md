# `mq3.server.client_pings.Client`

[Home](README.md) · [Source file](File-src-mq3-server-client-pings-ml-573754950.md)

<a id="struct-struct-mq3-server-client-pings-client-struct-client-src-mq3-server-client-pings-ml-1346751049"></a>
## Client

```ml
struct Client
```

Client record for server.client_pings, containing `state`, `ping`, `gentity`, `frames`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_pings.ml#L44)

## Members

<a id="field-field-mq3-server-client-pings-client-frames-frames-src-mq3-server-client-pings-ml-125231296"></a>
### frames

```ml
frames
```

Updates can be delta'd from here.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_pings.ml#L53)

<a id="field-field-mq3-server-client-pings-client-gentity-gentity-src-mq3-server-client-pings-ml-587823800"></a>
### gentity

```ml
gentity
```

Game-VM entity associated with this client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_pings.ml#L51)

<a id="field-field-mq3-server-client-pings-client-ping-ping-src-mq3-server-client-pings-ml-540156392"></a>
### ping

```ml
ping
```

Estimated round-trip client latency in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_pings.ml#L49)

<a id="field-field-mq3-server-client-pings-client-state-state-src-mq3-server-client-pings-ml-1296291260"></a>
### state

```ml
state
```

Connection lifecycle value that determines whether snapshot acknowledgments can produce a player ping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_pings.ml#L47)
