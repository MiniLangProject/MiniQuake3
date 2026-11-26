# `mq3.server.timeouts.Client`

[Home](README.md) · [Source file](File-src-mq3-server-timeouts-ml-1356487829.md)

<a id="struct-struct-mq3-server-timeouts-client-struct-client-src-mq3-server-timeouts-ml-1207897303"></a>
## Client

```ml
struct Client
```

Client record for server.timeouts, containing `state`, `lastPacketTime`, `timeoutCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/timeouts.ml#L19)

## Members

<a id="field-field-mq3-server-timeouts-client-lastpackettime-lastpackettime-src-mq3-server-timeouts-ml-930815104"></a>
### lastPacketTime

```ml
lastPacketTime
```

Server timestamp of the most recently received client packet, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/timeouts.ml#L24)

<a id="field-field-mq3-server-timeouts-client-state-state-src-mq3-server-timeouts-ml-1213154814"></a>
### state

```ml
state
```

Connection lifecycle value that selects inactivity handling for connected, active, and lingering zombie slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/timeouts.ml#L22)

<a id="field-field-mq3-server-timeouts-client-timeoutcount-timeoutcount-src-mq3-server-timeouts-ml-517366154"></a>
### timeoutCount

```ml
timeoutCount
```

Consecutive timeout checks exceeded before disconnecting the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/timeouts.ml#L26)
