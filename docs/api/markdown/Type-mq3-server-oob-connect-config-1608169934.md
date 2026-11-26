# `mq3.server.oob_connect.Config`

[Home](README.md) · [Source file](File-src-mq3-server-oob-connect-ml-829458266.md)

<a id="struct-struct-mq3-server-oob-connect-config-struct-config-src-mq3-server-oob-connect-ml-745613783"></a>
## Config

```ml
struct Config
```

Config record for server.oob_connect, containing `singlePlayer`, `reconnectLimit`, `minPing`, `maxPing`, `privateClients`, `privatePassword`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L93)

## Members

<a id="field-field-mq3-server-oob-connect-config-maxping-maxping-src-mq3-server-oob-connect-ml-271762611"></a>
### maxPing

```ml
maxPing
```

Maximum client latency accepted by the connection policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L101)

<a id="field-field-mq3-server-oob-connect-config-minping-minping-src-mq3-server-oob-connect-ml-609626959"></a>
### minPing

```ml
minPing
```

Minimum client latency accepted by the connection policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L99)

<a id="field-field-mq3-server-oob-connect-config-privateclients-privateclients-src-mq3-server-oob-connect-ml-811646585"></a>
### privateClients

```ml
privateClients
```

Number of client slots reserved for clients with the private password.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L103)

<a id="field-field-mq3-server-oob-connect-config-privatepassword-privatepassword-src-mq3-server-oob-connect-ml-164892595"></a>
### privatePassword

```ml
privatePassword
```

Password required to use the reserved private client slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L105)

<a id="field-field-mq3-server-oob-connect-config-reconnectlimit-reconnectlimit-src-mq3-server-oob-connect-ml-93069159"></a>
### reconnectLimit

```ml
reconnectLimit
```

Minimum interval required before a client may reconnect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L97)

<a id="field-field-mq3-server-oob-connect-config-singleplayer-singleplayer-src-mq3-server-oob-connect-ml-661666785"></a>
### singlePlayer

```ml
singlePlayer
```

True when the connection policy is configured for single-player operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L95)
