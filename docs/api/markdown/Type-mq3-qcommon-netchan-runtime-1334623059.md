# `mq3.qcommon.netchan.Runtime`

[Home](README.md) · [Source file](File-src-mq3-qcommon-netchan-ml-1381353623.md)

<a id="struct-struct-mq3-qcommon-netchan-runtime-struct-runtime-src-mq3-qcommon-netchan-ml-1336545747"></a>
## Runtime

```ml
struct Runtime
```

Runtime record for qcommon.netchan, containing `qport`, `sendPacketFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L36)

## Members

<a id="field-field-mq3-qcommon-netchan-runtime-context-context-src-mq3-qcommon-netchan-ml-1046323755"></a>
### context

```ml
context
```

Caller-supplied data associated with network-channel packet transmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L42)

<a id="field-field-mq3-qcommon-netchan-runtime-qport-qport-src-mq3-qcommon-netchan-ml-2102493835"></a>
### qport

```ml
qport
```

Client-selected virtual port used to recognize a connection across address translation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L38)

<a id="field-field-mq3-qcommon-netchan-runtime-sendpacketfn-sendpacketfn-src-mq3-qcommon-netchan-ml-209053175"></a>
### sendPacketFn

```ml
sendPacketFn
```

Host callback that sends a network datagram to the supplied endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L40)
