# `mq3.botlib.server_bridge.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-server-bridge-ml-1158932283.md)

<a id="struct-struct-mq3-botlib-server-bridge-state-struct-state-src-mq3-botlib-server-bridge-ml-1337720559"></a>
## State

```ml
struct State
```

`State` record for server bridge, containing `clients`, `now` and `lastFrameTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L41)

## Members

<a id="field-field-mq3-botlib-server-bridge-state-clients-clients-src-mq3-botlib-server-bridge-ml-1694952278"></a>
### clients

```ml
clients
```

Mirrored server clients used to transfer bot commands and client input state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L43)

<a id="field-field-mq3-botlib-server-bridge-state-lastframetime-lastframetime-src-mq3-botlib-server-bridge-ml-1025730238"></a>
### lastFrameTime

```ml
lastFrameTime
```

Timestamp retained from the preceding server-side bot frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L47)

<a id="field-field-mq3-botlib-server-bridge-state-now-now-src-mq3-botlib-server-bridge-ml-652964502"></a>
### now

```ml
now
```

Timestamp supplied by the current server-side bot frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L45)
