# `mq3.client.remote_session.Session`

[Home](README.md) · [Source file](File-src-mq3-client-remote-session-ml-2090039014.md)

<a id="struct-struct-mq3-client-remote-session-session-struct-session-src-mq3-client-remote-session-ml-2142587447"></a>
## Session

```ml
struct Session
```

Coordinates a protocol-68 connection, message parser, command sender and reliable-command consumer. The application owns the UDP socket, asset loading, rendering and clock. A received gamestate enters loading until the application explicitly accepts its unpure asset configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L24)

## Members

<a id="field-field-mq3-client-remote-session-session-commands-commands-src-mq3-client-remote-session-ml-1734761465"></a>
### commands

```ml
commands
```

Reliable server-command consumer retaining its execution cursor and partial large configstring across gamestates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L52)

<a id="field-field-mq3-client-remote-session-session-commandservices-commandservices-src-mq3-client-remote-session-ml-2001940009"></a>
### commandServices

```ml
commandServices
```

Command-consumer callbacks applying configstrings, systeminfo changes and map-restart cleanup to this session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L54)

<a id="field-field-mq3-client-remote-session-session-connection-connection-src-mq3-client-remote-session-ml-1148765705"></a>
### connection

```ml
connection
```

Connectionless handshake state, including the server address, challenge and established netchan.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L30)

<a id="field-field-mq3-client-remote-session-session-gamestategeneration-gamestategeneration-src-mq3-client-remote-session-ml-1970051533"></a>
### gamestateGeneration

```ml
gamestateGeneration
```

Number of complete gamestates delivered to this session; zero means none has been received.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L44)

<a id="field-field-mq3-client-remote-session-session-ingress-ingress-src-mq3-client-remote-session-ml-262026433"></a>
### ingress

```ml
ingress
```

Client packet-event adapter connecting the handshake, netchan and server-message parser.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L36)

<a id="field-field-mq3-client-remote-session-session-lastrealtime-lastrealtime-src-mq3-client-remote-session-ml-1169233175"></a>
### lastRealtime

```ml
lastRealtime
```

Client realtime in milliseconds supplied by the most recent poll call.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L50)

<a id="field-field-mq3-client-remote-session-session-preparedgeneration-preparedgeneration-src-mq3-client-remote-session-ml-888033979"></a>
### preparedGeneration

```ml
preparedGeneration
```

Gamestate generation explicitly accepted by the application; zero invalidates readiness after loading or stop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L46)

<a id="field-field-mq3-client-remote-session-session-protocol-protocol-src-mq3-client-remote-session-ml-2081673217"></a>
### protocol

```ml
protocol
```

Server-message parser runtime containing the current gamestate, snapshots and reliable command ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L34)

<a id="field-field-mq3-client-remote-session-session-pump-pump-src-mq3-client-remote-session-ml-524497201"></a>
### pump

```ml
pump
```

Network pump configured to receive server datagrams through this session's ingress adapter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L42)

<a id="field-field-mq3-client-remote-session-session-restartcount-restartcount-src-mq3-client-remote-session-ml-1301341825"></a>
### restartCount

```ml
restartCount
```

Number of consumed map-restart commands whose cleanup callback has cleared the user-command ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L60)

<a id="field-field-mq3-client-remote-session-session-send-send-src-mq3-client-remote-session-ml-1007085449"></a>
### send

```ml
send
```

Outgoing user-command and reliable-command state, including packet history and acknowledgement cursors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L38)

<a id="field-field-mq3-client-remote-session-session-sendservices-sendservices-src-mq3-client-remote-session-ml-880345137"></a>
### sendServices

```ml
sendServices
```

Live sender callbacks whose channel is replaced with the established connection channel when available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L40)

<a id="field-field-mq3-client-remote-session-session-servercommandfn-servercommandfn-src-mq3-client-remote-session-ml-1518838821"></a>
### serverCommandFn

```ml
serverCommandFn
```

Optional callback `(session, sequence, commandState)` for a delivered reliable command. Tokenized arguments are borrowed until the next command; retaining them requires copying during the call. A callback error stops the session and is propagated by `runServerCommands`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L58)

<a id="field-field-mq3-client-remote-session-session-serverprint-serverprint-src-mq3-client-remote-session-ml-196302801"></a>
### serverPrint

```ml
serverPrint
```

Most recent server print, disconnect message or local terminal-session explanation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L48)

<a id="field-field-mq3-client-remote-session-session-socket-socket-src-mq3-client-remote-session-ml-1767974391"></a>
### socket

```ml
socket
```

Borrowed UDP socket used for handshake packets and sequenced traffic; this module never closes it.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L26)

<a id="field-field-mq3-client-remote-session-session-userinfo-userinfo-src-mq3-client-remote-session-ml-1238711415"></a>
### userinfo

```ml
userinfo
```

Userinfo text returned to the connection handshake when constructing the connect request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L28)

<a id="field-field-mq3-client-remote-session-session-wire-wire-src-mq3-client-remote-session-ml-1478781575"></a>
### wire

```ml
wire
```

Client netchan runtime providing transport and protocol payload encoding/decoding state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/remote_session.ml#L32)
