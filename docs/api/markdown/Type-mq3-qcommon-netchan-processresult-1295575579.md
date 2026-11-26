# `mq3.qcommon.netchan.ProcessResult`

[Home](README.md) · [Source file](File-src-mq3-qcommon-netchan-ml-1381353623.md)

<a id="struct-struct-mq3-qcommon-netchan-processresult-struct-processresult-src-mq3-qcommon-netchan-ml-913360347"></a>
## ProcessResult

```ml
struct ProcessResult
```

ProcessResult record for qcommon.netchan, containing `accepted`, `data`, `cursize`, `readcount`, `bit`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L76)

## Members

<a id="field-field-mq3-qcommon-netchan-processresult-accepted-accepted-src-mq3-qcommon-netchan-ml-1246324237"></a>
### accepted

```ml
accepted
```

True when validation accepted the requested operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L78)

<a id="field-field-mq3-qcommon-netchan-processresult-bit-bit-src-mq3-qcommon-netchan-ml-1215759115"></a>
### bit

```ml
bit
```

Bit offset at which the accepted packet payload begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L86)

<a id="field-field-mq3-qcommon-netchan-processresult-cursize-cursize-src-mq3-qcommon-netchan-ml-658652291"></a>
### cursize

```ml
cursize
```

Number of valid bytes currently stored in the message buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L82)

<a id="field-field-mq3-qcommon-netchan-processresult-data-data-src-mq3-qcommon-netchan-ml-1077289335"></a>
### data

```ml
data
```

Accepted message payload after sequence and fragment processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L80)

<a id="field-field-mq3-qcommon-netchan-processresult-readcount-readcount-src-mq3-qcommon-netchan-ml-1624128059"></a>
### readcount

```ml
readcount
```

Byte position reached while consuming the message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L84)
