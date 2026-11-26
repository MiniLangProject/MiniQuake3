# `mq3.server.abi.NetchanBuffer`

[Home](README.md) · [Source file](File-src-mq3-server-abi-ml-141226179.md)

<a id="struct-struct-mq3-server-abi-netchanbuffer-struct-netchanbuffer-src-mq3-server-abi-ml-1859784831"></a>
## NetchanBuffer

```ml
struct NetchanBuffer
```

NetchanBuffer record for server.abi, containing `msg`, `msgBuffer`, `next`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L238)

## Members

<a id="field-field-mq3-server-abi-netchanbuffer-msg-msg-src-mq3-server-abi-ml-386159698"></a>
### msg

```ml
msg
```

Message descriptor for this queued network payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L240)

<a id="field-field-mq3-server-abi-netchanbuffer-msgbuffer-msgbuffer-src-mq3-server-abi-ml-608877230"></a>
### msgBuffer

```ml
msgBuffer
```

Backing byte buffer containing the queued message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L242)

<a id="field-field-mq3-server-abi-netchanbuffer-next-next-src-mq3-server-abi-ml-837690400"></a>
### next

```ml
next
```

Next queued message waiting for network-channel transmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/abi.ml#L244)
