# `mq3.qcommon.common.Redirect`

[Home](README.md) · [Source file](File-src-mq3-qcommon-common-ml-778957851.md)

<a id="struct-struct-mq3-qcommon-common-redirect-struct-redirect-src-mq3-qcommon-common-ml-1291210105"></a>
## Redirect

```ml
struct Redirect
```

Redirect record for qcommon.common, containing `capacity`, `text`, `flushFn`, `context`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L102)

## Members

<a id="field-field-mq3-qcommon-common-redirect-capacity-capacity-src-mq3-qcommon-common-ml-1909832779"></a>
### capacity

```ml
capacity
```

Maximum number of entries allowed in the managed collection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L104)

<a id="field-field-mq3-qcommon-common-redirect-context-context-src-mq3-qcommon-common-ml-1458675299"></a>
### context

```ml
context
```

Caller-supplied data associated with flushing a completed redirected console-output buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L110)

<a id="field-field-mq3-qcommon-common-redirect-flushfn-flushfn-src-mq3-qcommon-common-ml-893611843"></a>
### flushFn

```ml
flushFn
```

Host callback that flushes buffered text to its host destination.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L108)

<a id="field-field-mq3-qcommon-common-redirect-text-text-src-mq3-qcommon-common-ml-1450971829"></a>
### text

```ml
text
```

Buffered console output awaiting delivery to the redirect callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L106)
