# `mq3.qcommon.msg.ChangeReport`

[Home](README.md) · [Source file](File-src-mq3-qcommon-msg-ml-766500529.md)

<a id="struct-struct-mq3-qcommon-msg-changereport-struct-changereport-src-mq3-qcommon-msg-ml-1014218781"></a>
## ChangeReport

```ml
struct ChangeReport
```

ChangeReport record for qcommon.msg, containing `counts`, `printFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L12)

## Members

<a id="field-field-mq3-qcommon-msg-changereport-context-context-src-mq3-qcommon-msg-ml-1070426507"></a>
### context

```ml
context
```

Caller-supplied data associated with printing statistics about changed network delta fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L18)

<a id="field-field-mq3-qcommon-msg-changereport-counts-counts-src-mq3-qcommon-msg-ml-1573674147"></a>
### counts

```ml
counts
```

Per-field counters recording which network fields changed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L14)

<a id="field-field-mq3-qcommon-msg-changereport-printfn-printfn-src-mq3-qcommon-msg-ml-457326251"></a>
### printFn

```ml
printFn
```

Host callback that prints per-field delta-compression change counts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L16)
