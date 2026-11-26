# `mq3.server.client_lifecycle.Services`

[Home](README.md) · [Source file](File-src-mq3-server-client-lifecycle-ml-743240113.md)

<a id="struct-struct-mq3-server-client-lifecycle-services-struct-services-src-mq3-server-client-lifecycle-ml-622802351"></a>
## Services

```ml
struct Services
```

Services record for server.client_lifecycle, containing `context`, `transmitFn`, `snapshotFn`, `dropFn`, `gameBeginFn`, `gameDisconnectFn`, and 8 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L132)

## Members

<a id="field-field-mq3-server-client-lifecycle-services-botfreefn-botfreefn-src-mq3-server-client-lifecycle-ml-1916251011"></a>
### botFreeFn

```ml
botFreeFn
```

Host callback that releases a bot client and its associated resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L155)

<a id="field-field-mq3-server-client-lifecycle-services-broadcastfn-broadcastfn-src-mq3-server-client-lifecycle-ml-384485343"></a>
### broadcastFn

```ml
broadcastFn
```

Host callback that broadcasts a server command to the selected clients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L151)

<a id="field-field-mq3-server-client-lifecycle-services-challengedisconnectfn-challengedisconnectfn-src-mq3-server-client-lifecycle-ml-237462031"></a>
### challengeDisconnectFn

```ml
challengeDisconnectFn
```

Host callback that removes connection-challenge state when a client disconnects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L159)

<a id="field-field-mq3-server-client-lifecycle-services-closedownloadfn-closedownloadfn-src-mq3-server-client-lifecycle-ml-1124684127"></a>
### closeDownloadFn

```ml
closeDownloadFn
```

Host callback that closes the active client-download resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L149)

<a id="field-field-mq3-server-client-lifecycle-services-context-context-src-mq3-server-client-lifecycle-ml-379981131"></a>
### context

```ml
context
```

Caller-supplied data associated with client admission, userinfo changes, disconnection, and final messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L135)

<a id="field-field-mq3-server-client-lifecycle-services-dropfn-dropfn-src-mq3-server-client-lifecycle-ml-1506775513"></a>
### dropFn

```ml
dropFn
```

Host callback that disconnects a client and reports the supplied reason.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L141)

<a id="field-field-mq3-server-client-lifecycle-services-gamebeginfn-gamebeginfn-src-mq3-server-client-lifecycle-ml-83955491"></a>
### gameBeginFn

```ml
gameBeginFn
```

Host callback that notifies the game VM that a client is entering play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L143)

<a id="field-field-mq3-server-client-lifecycle-services-gamedisconnectfn-gamedisconnectfn-src-mq3-server-client-lifecycle-ml-1932562043"></a>
### gameDisconnectFn

```ml
gameDisconnectFn
```

Host callback that notifies the game VM that a client has disconnected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L145)

<a id="field-field-mq3-server-client-lifecycle-services-gameuserinfofn-gameuserinfofn-src-mq3-server-client-lifecycle-ml-242037685"></a>
### gameUserinfoFn

```ml
gameUserinfoFn
```

Host callback that notifies the game VM that client user information changed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L147)

<a id="field-field-mq3-server-client-lifecycle-services-heartbeatfn-heartbeatfn-src-mq3-server-client-lifecycle-ml-534589715"></a>
### heartbeatFn

```ml
heartbeatFn
```

Host callback that sends a server heartbeat to the configured master.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L157)

<a id="field-field-mq3-server-client-lifecycle-services-sendcommandfn-sendcommandfn-src-mq3-server-client-lifecycle-ml-63213011"></a>
### sendCommandFn

```ml
sendCommandFn
```

Host callback that queues a reliable command for a client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L153)

<a id="field-field-mq3-server-client-lifecycle-services-setuserinfofn-setuserinfofn-src-mq3-server-client-lifecycle-ml-1931570559"></a>
### setUserinfoFn

```ml
setUserinfoFn
```

Host callback that updates the server's information string for a client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L161)

<a id="field-field-mq3-server-client-lifecycle-services-snapshotfn-snapshotfn-src-mq3-server-client-lifecycle-ml-1075408851"></a>
### snapshotFn

```ml
snapshotFn
```

Host callback that sends lifecycle snapshot state to a client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L139)

<a id="field-field-mq3-server-client-lifecycle-services-transmitfn-transmitfn-src-mq3-server-client-lifecycle-ml-1204646419"></a>
### transmitFn

```ml
transmitFn
```

Host callback that transmits a complete message through a sequenced channel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L137)
