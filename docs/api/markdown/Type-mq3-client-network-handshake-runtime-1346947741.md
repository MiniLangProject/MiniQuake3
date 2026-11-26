# `mq3.client.network_handshake.Runtime`

[Home](README.md) · [Source file](File-src-mq3-client-network-handshake-ml-1823279509.md)

<a id="struct-struct-mq3-client-network-handshake-runtime-struct-runtime-src-mq3-client-network-handshake-ml-1844224729"></a>
## Runtime

```ml
struct Runtime
```

Stores network handshake runtime wiring and state, including `group`, `server`, `slots`, `lastError`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L27)

## Members

<a id="field-field-mq3-client-network-handshake-runtime-group-group-src-mq3-client-network-handshake-ml-537741191"></a>
### group

```ml
group
```

When constructing this record, `create` supplies `groupState` for this member. Used by `reconcile` and `setTime` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L30)

<a id="field-field-mq3-client-network-handshake-runtime-lasterror-lasterror-src-mq3-client-network-handshake-ml-619756911"></a>
### lastError

```ml
lastError
```

When constructing this record, `create` supplies an empty string for this member. Used by `reconcile` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L39)

<a id="field-field-mq3-client-network-handshake-runtime-server-server-src-mq3-client-network-handshake-ml-1621324581"></a>
### server

```ml
server
```

When constructing this record, `create` supplies `serverState` for this member. Used by `bindServer` and `reconcile` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L33)

<a id="field-field-mq3-client-network-handshake-runtime-slots-slots-src-mq3-client-network-handshake-ml-1061653803"></a>
### slots

```ml
slots
```

When constructing this record, `create` supplies `slots` for this member. Used by `findSlot` and `bindServer` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_handshake.ml#L36)
