# `mq3.server.client_message.Server`

[Home](README.md) · [Source file](File-src-mq3-server-client-message-ml-526567844.md)

<a id="struct-struct-mq3-server-client-message-server-struct-server-src-mq3-server-client-message-ml-484515765"></a>
## Server

```ml
struct Server
```

Current and restart-era server identifiers used to reject stale client message streams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L22)

## Members

<a id="field-field-mq3-server-client-message-server-restartedserverid-restartedserverid-src-mq3-server-client-message-ml-1724149076"></a>
### restartedServerId

```ml
restartedServerId
```

Server identifier retained from before the latest map restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L26)

<a id="field-field-mq3-server-client-message-server-serverid-serverid-src-mq3-server-client-message-ml-2029974292"></a>
### serverId

```ml
serverId
```

Identifier distinguishing the current server or map session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L24)
