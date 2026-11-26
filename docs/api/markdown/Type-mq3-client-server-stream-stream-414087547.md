# `mq3.client.server_stream.Stream`

[Home](README.md) · [Source file](File-src-mq3-client-server-stream-ml-1251342773.md)

<a id="struct-struct-mq3-client-server-stream-stream-struct-stream-src-mq3-client-server-stream-ml-268205287"></a>
## Stream

```ml
struct Stream
```

Stores server stream stream record, including `protocol`, `epoch`, `demoPlaying`, `pure`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_stream.ml#L15)

## Members

<a id="field-field-mq3-client-server-stream-stream-demoplaying-demoplaying-src-mq3-client-server-stream-ml-1843326221"></a>
### demoPlaying

```ml
demoPlaying
```

True while the client receives its game data from a recorded demo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_stream.ml#L22)

<a id="field-field-mq3-client-server-stream-stream-epoch-epoch-src-mq3-client-server-stream-ml-905949869"></a>
### epoch

```ml
epoch
```

When constructing this record, `attach` supplies `protocol.dispatcher.snapshotState` for this member. Used by `at` and `entity` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_stream.ml#L20)

<a id="field-field-mq3-client-server-stream-stream-protocol-protocol-src-mq3-client-server-stream-ml-1663937529"></a>
### protocol

```ml
protocol
```

Client protocol parser runtime whose gamestate and snapshot history back this stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_stream.ml#L17)

<a id="field-field-mq3-client-server-stream-stream-pure-pure-src-mq3-client-server-stream-ml-425154745"></a>
### pure

```ml
pure
```

When constructing this record, `attach` supplies `pure` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_stream.ml#L24)
