# `mq3.platform.win_syscon.Action`

[Home](README.md) · [Source file](File-src-mq3-platform-win-syscon-ml-742432789.md)

<a id="struct-struct-mq3-platform-win-syscon-action-struct-action-src-mq3-platform-win-syscon-ml-923063071"></a>
## Action

```ml
struct Action
```

Data record for `mq3.platform.win_syscon.Action`; groups `boundary`, `kind`, `text`, `value`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L22)

## Members

<a id="field-field-mq3-platform-win-syscon-action-boundary-boundary-src-mq3-platform-win-syscon-ml-887398389"></a>
### boundary

```ml
boundary
```

Host operation boundary at which this platform action is dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L24)

<a id="field-field-mq3-platform-win-syscon-action-dispatched-dispatched-src-mq3-platform-win-syscon-ml-245270123"></a>
### dispatched

```ml
dispatched
```

Whether the recorded action was delivered to its host implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L32)

<a id="field-field-mq3-platform-win-syscon-action-kind-kind-src-mq3-platform-win-syscon-ml-116048189"></a>
### kind

```ml
kind
```

Native console-window operation, such as creation, text append, visibility change, or input focus.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L26)

<a id="field-field-mq3-platform-win-syscon-action-text-text-src-mq3-platform-win-syscon-ml-420662499"></a>
### text

```ml
text
```

Text payload, script source, or message associated with this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L28)

<a id="field-field-mq3-platform-win-syscon-action-value-value-src-mq3-platform-win-syscon-ml-1027664893"></a>
### value

```ml
value
```

Value carried by the event, configuration item, or requested operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L30)
