# `mq3.server.client_message.Services`

[Home](README.md) · [Source file](File-src-mq3-server-client-message-ml-526567844.md)

<a id="struct-struct-mq3-server-client-message-services-struct-services-src-mq3-server-client-message-ml-2011126261"></a>
## Services

```ml
struct Services
```

Callback boundary for reliable commands, movement, gamestate resends, and invalid client messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L54)

## Members

<a id="field-field-mq3-server-client-message-services-clientcommandfn-clientcommandfn-src-mq3-server-client-message-ml-1660733593"></a>
### clientCommandFn

```ml
clientCommandFn
```

Callback `(host, clientState, msg)` that consumes a reliable command and returns true to continue. A false result stops message processing with `commandRejected`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L57)

<a id="field-field-mq3-server-client-message-services-context-context-src-mq3-server-client-message-ml-1530737565"></a>
### context

```ml
context
```

Caller-owned data available to every service callback as `host.context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L68)

<a id="field-field-mq3-server-client-message-services-diagnosticfn-diagnosticfn-src-mq3-server-client-message-ml-1758743987"></a>
### diagnosticFn

```ml
diagnosticFn
```

Optional callback `(host, clientState, opcode)` reporting an unrecognized final client-message opcode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L66)

<a id="field-field-mq3-server-client-message-services-dropfn-dropfn-src-mq3-server-client-message-ml-2108049979"></a>
### dropFn

```ml
dropFn
```

Optional callback `(host, clientState, reason)` invoked for invalid message or reliable acknowledgments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L64)

<a id="field-field-mq3-server-client-message-services-sendgamestatefn-sendgamestatefn-src-mq3-server-client-message-ml-1352578969"></a>
### sendGamestateFn

```ml
sendGamestateFn
```

Optional callback `(host, clientState)` requesting a new gamestate after a mismatched server identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L62)

<a id="field-field-mq3-server-client-message-services-usermovefn-usermovefn-src-mq3-server-client-message-ml-1248475445"></a>
### userMoveFn

```ml
userMoveFn
```

Optional callback `(host, clientState, msg, delta)` that consumes movement commands. `delta` is true for CLC_MOVE and false for CLC_MOVE_NO_DELTA; its return value is ignored.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L60)
