# `mq3.qcommon.common.CommonError`

[Home](README.md) · [Source file](File-src-mq3-qcommon-common-ml-778957851.md)

<a id="struct-struct-mq3-qcommon-common-commonerror-struct-commonerror-src-mq3-qcommon-common-ml-148394257"></a>
## CommonError

```ml
struct CommonError
```

CommonError record for qcommon.common, containing `code`, `message`, `fatal`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L113)

## Members

<a id="field-field-mq3-qcommon-common-commonerror-code-code-src-mq3-qcommon-common-ml-2136716950"></a>
### code

```ml
code
```

Engine error-severity code associated with the failure.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L115)

<a id="field-field-mq3-qcommon-common-commonerror-fatal-fatal-src-mq3-qcommon-common-ml-91346776"></a>
### fatal

```ml
fatal
```

True when the failure requires terminating the application.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L119)

<a id="field-field-mq3-qcommon-common-commonerror-message-message-src-mq3-qcommon-common-ml-1732638652"></a>
### message

```ml
message
```

Text associated with the reported event or diagnostic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/common.ml#L117)
