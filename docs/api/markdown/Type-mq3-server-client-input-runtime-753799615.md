# `mq3.server.client_input.Runtime`

[Home](README.md) · [Source file](File-src-mq3-server-client-input-ml-936991025.md)

<a id="struct-struct-mq3-server-client-input-runtime-struct-runtime-src-mq3-server-client-input-ml-496104153"></a>
## Runtime

```ml
struct Runtime
```

Runtime record for server.client_input, containing `commandHost`, `dispatchHost`, `moveServer`, `moveHost`, `serverState`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L47)

## Members

<a id="field-field-mq3-server-client-input-runtime-commandhost-commandhost-src-mq3-server-client-input-ml-388188085"></a>
### commandHost

```ml
commandHost
```

Host callbacks used to validate and execute reliable client commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L49)

<a id="field-field-mq3-server-client-input-runtime-dispatchhost-dispatchhost-src-mq3-server-client-input-ml-128514501"></a>
### dispatchHost

```ml
dispatchHost
```

Host callbacks routing built-in and game-specific client commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L51)

<a id="field-field-mq3-server-client-input-runtime-movehost-movehost-src-mq3-server-client-input-ml-1441839243"></a>
### moveHost

```ml
moveHost
```

Host callbacks that deliver user movement to game simulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L55)

<a id="field-field-mq3-server-client-input-runtime-moveserver-moveserver-src-mq3-server-client-input-ml-743447689"></a>
### moveServer

```ml
moveServer
```

Server state used while decoding and applying user movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L53)

<a id="field-field-mq3-server-client-input-runtime-serverstate-serverstate-src-mq3-server-client-input-ml-1184099041"></a>
### serverState

```ml
serverState
```

Current server lifecycle state, including loading and active gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L57)
