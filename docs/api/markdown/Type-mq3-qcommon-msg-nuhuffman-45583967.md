# `mq3.qcommon.msg.NUHuffman`

[Home](README.md) · [Source file](File-src-mq3-qcommon-msg-ml-766500529.md)

<a id="struct-struct-mq3-qcommon-msg-nuhuffman-struct-nuhuffman-src-mq3-qcommon-msg-ml-971327727"></a>
## NUHuffman

```ml
struct NUHuffman
```

NUHuffman record for qcommon.msg, containing `compressor`, `decompressor`, `frequencies`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L21)

## Members

<a id="field-field-mq3-qcommon-msg-nuhuffman-compressor-compressor-src-mq3-qcommon-msg-ml-747504559"></a>
### compressor

```ml
compressor
```

Huffman state used to encode outgoing message data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L23)

<a id="field-field-mq3-qcommon-msg-nuhuffman-decompressor-decompressor-src-mq3-qcommon-msg-ml-1273050109"></a>
### decompressor

```ml
decompressor
```

Huffman state used to decode incoming message data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L25)

<a id="field-field-mq3-qcommon-msg-nuhuffman-frequencies-frequencies-src-mq3-qcommon-msg-ml-281819517"></a>
### frequencies

```ml
frequencies
```

Reference symbol frequencies used to initialize both codec directions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L27)
