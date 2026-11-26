# `mq3.server.main_runtime.Client`

[Home](README.md) · [Source file](File-src-mq3-server-main-runtime-ml-68872411.md)

<a id="struct-struct-mq3-server-main-runtime-client-struct-client-src-mq3-server-main-runtime-ml-854575211"></a>
## Client

```ml
struct Client
```

Client record for server.main_runtime, containing `state`, `name`, `ping`, `score`, `reliableAcknowledge`, `reliableSequence`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/main_runtime.ml#L40)

## Members

<a id="field-field-mq3-server-main-runtime-client-name-name-src-mq3-server-main-runtime-ml-100730884"></a>
### name

```ml
name
```

Extracted from userinfo, high bits masked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/main_runtime.ml#L45)

<a id="field-field-mq3-server-main-runtime-client-ping-ping-src-mq3-server-main-runtime-ml-291334050"></a>
### ping

```ml
ping
```

Estimated round-trip client latency in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/main_runtime.ml#L47)

<a id="field-field-mq3-server-main-runtime-client-reliableacknowledge-reliableacknowledge-src-mq3-server-main-runtime-ml-408846846"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Reliable acknowledgment cursor available to the assembled server connection runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/main_runtime.ml#L51)

<a id="field-field-mq3-server-main-runtime-client-reliablecommands-reliablecommands-src-mq3-server-main-runtime-ml-1368924746"></a>
### reliableCommands

```ml
reliableCommands
```

Reliable command entries retained until the peer acknowledges them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/main_runtime.ml#L57)

<a id="field-field-mq3-server-main-runtime-client-reliablesent-reliablesent-src-mq3-server-main-runtime-ml-500347098"></a>
### reliableSent

```ml
reliableSent
```

Sequence number of the newest reliable command transmitted to the peer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/main_runtime.ml#L55)

<a id="field-field-mq3-server-main-runtime-client-reliablesequence-reliablesequence-src-mq3-server-main-runtime-ml-370459764"></a>
### reliableSequence

```ml
reliableSequence
```

Sequence number of the newest queued reliable command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/main_runtime.ml#L53)

<a id="field-field-mq3-server-main-runtime-client-score-score-src-mq3-server-main-runtime-ml-504117014"></a>
### score

```ml
score
```

Client score advertised by server-status responses.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/main_runtime.ml#L49)

<a id="field-field-mq3-server-main-runtime-client-state-state-src-mq3-server-main-runtime-ml-909647362"></a>
### state

```ml
state
```

Connection lifecycle value that drives connection, status, and client-command handling in the server runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/main_runtime.ml#L43)
