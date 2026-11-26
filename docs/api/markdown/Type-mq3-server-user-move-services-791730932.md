# `mq3.server.user_move.Services`

[Home](README.md) · [Source file](File-src-mq3-server-user-move-ml-1219627038.md)

<a id="struct-struct-mq3-server-user-move-services-struct-services-src-mq3-server-user-move-ml-1264697499"></a>
## Services

```ml
struct Services
```

Services record for server.user_move, containing `sendGamestateFn`, `enterWorldFn`, `dropFn`, `thinkFn`, `diagnosticFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L57)

## Members

<a id="field-field-mq3-server-user-move-services-context-context-src-mq3-server-user-move-ml-986460685"></a>
### context

```ml
context
```

Caller-supplied data associated with entry into the game world and execution of client movement commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L70)

<a id="field-field-mq3-server-user-move-services-diagnosticfn-diagnosticfn-src-mq3-server-user-move-ml-1112997683"></a>
### diagnosticFn

```ml
diagnosticFn
```

Host callback that reports subsystem diagnostics to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L67)

<a id="field-field-mq3-server-user-move-services-dropfn-dropfn-src-mq3-server-user-move-ml-795236427"></a>
### dropFn

```ml
dropFn
```

Host callback that disconnects a client and reports the supplied reason.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L63)

<a id="field-field-mq3-server-user-move-services-enterworldfn-enterworldfn-src-mq3-server-user-move-ml-269935365"></a>
### enterWorldFn

```ml
enterWorldFn
```

Host callback that transitions a connected client into active world simulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L61)

<a id="field-field-mq3-server-user-move-services-sendgamestatefn-sendgamestatefn-src-mq3-server-user-move-ml-783669617"></a>
### sendGamestateFn

```ml
sendGamestateFn
```

Host callback that transmits the current gamestate to a client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L59)

<a id="field-field-mq3-server-user-move-services-thinkfn-thinkfn-src-mq3-server-user-move-ml-957148509"></a>
### thinkFn

```ml
thinkFn
```

Host callback that passes a validated user command to game simulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L65)
