# `mq3.server.pause.Client`

[Home](README.md) · [Source file](File-src-mq3-server-pause-ml-1830413695.md)

<a id="struct-struct-mq3-server-pause-client-struct-client-src-mq3-server-pause-ml-500038867"></a>
## Client

```ml
struct Client
```

Client record for server.pause, containing `state`, `addressType`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L20)

## Members

<a id="field-field-mq3-server-pause-client-addresstype-addresstype-src-mq3-server-pause-ml-1303229046"></a>
### addressType

```ml
addressType
```

Network-address kind, such as loopback, IPv4, or bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L25)

<a id="field-field-mq3-server-pause-client-state-state-src-mq3-server-pause-ml-113248006"></a>
### state

```ml
state
```

Connection lifecycle value that determines whether this slot counts as a connected or playing participant.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L23)
