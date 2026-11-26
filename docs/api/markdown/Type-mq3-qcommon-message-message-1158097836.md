# `mq3.qcommon.message.Message`

[Home](README.md) · [Source file](File-src-mq3-qcommon-message-ml-1547411275.md)

<a id="struct-struct-mq3-qcommon-message-message-struct-message-src-mq3-qcommon-message-ml-1088685245"></a>
## Message

```ml
struct Message
```

Message record for qcommon.message, containing `allowoverflow`, `overflowed`, `oob`, `data`, `maxsize`, `cursize`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message.ml#L13)

## Members

<a id="field-field-mq3-qcommon-message-message-allowoverflow-allowoverflow-src-mq3-qcommon-message-ml-552482314"></a>
### allowoverflow

```ml
allowoverflow
```

Compatibility flag recording whether message-buffer overflow is permitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message.ml#L15)

<a id="field-field-mq3-qcommon-message-message-bit-bit-src-mq3-qcommon-message-ml-843816418"></a>
### bit

```ml
bit
```

Current bit position used by message reads and writes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message.ml#L29)

<a id="field-field-mq3-qcommon-message-message-codec-codec-src-mq3-qcommon-message-ml-711301030"></a>
### codec

```ml
codec
```

Huffman codec used for bit-packed message fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message.ml#L31)

<a id="field-field-mq3-qcommon-message-message-cursize-cursize-src-mq3-qcommon-message-ml-258758370"></a>
### cursize

```ml
cursize
```

Number of valid bytes currently stored in the message buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message.ml#L25)

<a id="field-field-mq3-qcommon-message-message-data-data-src-mq3-qcommon-message-ml-848488794"></a>
### data

```ml
data
```

Byte buffer containing the encoded network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message.ml#L21)

<a id="field-field-mq3-qcommon-message-message-maxsize-maxsize-src-mq3-qcommon-message-ml-1678131922"></a>
### maxsize

```ml
maxsize
```

Capacity of the message byte buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message.ml#L23)

<a id="field-field-mq3-qcommon-message-message-oob-oob-src-mq3-qcommon-message-ml-1621085138"></a>
### oob

```ml
oob
```

True for direct byte-oriented network messages that bypass Huffman bitstream coding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message.ml#L19)

<a id="field-field-mq3-qcommon-message-message-overflowed-overflowed-src-mq3-qcommon-message-ml-1089870780"></a>
### overflowed

```ml
overflowed
```

True after a write exceeds the available message-buffer capacity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message.ml#L17)

<a id="field-field-mq3-qcommon-message-message-readcount-readcount-src-mq3-qcommon-message-ml-576794914"></a>
### readcount

```ml
readcount
```

Byte position reached while consuming the message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message.ml#L27)
