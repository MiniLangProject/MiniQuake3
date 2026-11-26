# `mq3.client.network_handshake.Slot`

[Home](README.md) · [Source file](File-src-mq3-client-network-handshake-ml-1823279509.md)

<a id="struct-struct-mq3-client-network-handshake-slot-struct-slot-src-mq3-client-network-handshake-ml-1355200967"></a>
## Slot

```ml
struct Slot
```

Stores network handshake slot record, including `runtime`, `clientBound`, `serverBound`, `serverSlot`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L12)

## Members

<a id="field-field-mq3-client-network-handshake-slot-clientbound-clientbound-src-mq3-client-network-handshake-ml-489974361"></a>
### clientBound

```ml
clientBound
```

When constructing this record, `create` supplies `false` for this member. Used by `bindClient` and `reconcile` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L18)

<a id="field-field-mq3-client-network-handshake-slot-runtime-runtime-src-mq3-client-network-handshake-ml-745164149"></a>
### runtime

```ml
runtime
```

When constructing this record, `create` supplies `current` for this member. Used by `bindClient` and `findSlot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L15)

<a id="field-field-mq3-client-network-handshake-slot-serverbound-serverbound-src-mq3-client-network-handshake-ml-1878477401"></a>
### serverBound

```ml
serverBound
```

When constructing this record, `create` supplies `false` for this member. Used by `bindServer` and `reconcile` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L21)

<a id="field-field-mq3-client-network-handshake-slot-serverslot-serverslot-src-mq3-client-network-handshake-ml-1270575139"></a>
### serverSlot

```ml
serverSlot
```

When constructing this record, `create` supplies `-1` for this member. Used by `bindServer` and `activate` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/network_handshake.ml#L24)
