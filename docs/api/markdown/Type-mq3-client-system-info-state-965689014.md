# `mq3.client.system_info.State`

[Home](README.md) · [Source file](File-src-mq3-client-system-info-ml-628530239.md)

<a id="struct-struct-mq3-client-system-info-state-struct-state-src-mq3-client-system-info-ml-227325443"></a>
## State

```ml
struct State
```

Stores system info state, including `serverId`, `demoPlaying`, `connectedPure`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L11)

## Members

<a id="field-field-mq3-client-system-info-state-connectedpure-connectedpure-src-mq3-client-system-info-ml-205875874"></a>
### connectedPure

```ml
connectedPure
```

When constructing this record, `create` supplies `0` for this member. Used by `apply` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L18)

<a id="field-field-mq3-client-system-info-state-demoplaying-demoplaying-src-mq3-client-system-info-ml-1159913102"></a>
### demoPlaying

```ml
demoPlaying
```

True while the client receives its game data from a recorded demo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L15)

<a id="field-field-mq3-client-system-info-state-serverid-serverid-src-mq3-client-system-info-ml-1500286498"></a>
### serverId

```ml
serverId
```

Server-instance identifier included in client messages to reject stale connections.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/system_info.ml#L13)
