# `src/mq3/qcommon/received_message.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.received_message`](Package-mq3-qcommon-received-message-24128385.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/netchan.ml` as `netchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)

## Declarations

<a id="function-function-mq3-qcommon-received-message-create-function-create-data-src-mq3-qcommon-received-message-ml-1529664728"></a>
### create

```ml
function create(data)
```

Wraps a received datagram with message capacity appropriate for fragment reassembly. Ordinary packets, including the connectionless -1 prefix, borrow the supplied byte buffer and use its length as capacity. A packet carrying the fragment bit receives independent `MAX_MSGLEN` storage containing the datagram bytes. The returned message's valid byte count is always the datagram length, its read cursors start at zero, and Huffman mode is selected initially. Returns error 7981 for void data or a datagram larger than `MAX_MSGLEN`; protocol headers and fragment contents are validated later by the packet-event and netchan paths.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Received datagram bytes; retained by reference unless the sequence header marks a fragment. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/received_message.ml#L16)
