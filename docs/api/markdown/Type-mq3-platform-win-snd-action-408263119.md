# `mq3.platform.win_snd.Action`

[Home](README.md) · [Source file](File-src-mq3-platform-win-snd-ml-1865364643.md)

<a id="struct-struct-mq3-platform-win-snd-action-struct-action-src-mq3-platform-win-snd-ml-24379743"></a>
## Action

```ml
struct Action
```

Data record for `mq3.platform.win_snd.Action`; groups `boundary`, `kind`, `size`, `dispatched`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L20)

## Members

<a id="field-field-mq3-platform-win-snd-action-boundary-boundary-src-mq3-platform-win-snd-ml-1978118463"></a>
### boundary

```ml
boundary
```

Host operation boundary at which this platform action is dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L22)

<a id="field-field-mq3-platform-win-snd-action-dispatched-dispatched-src-mq3-platform-win-snd-ml-2002775461"></a>
### dispatched

```ml
dispatched
```

Whether the recorded action was delivered to its host implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L28)

<a id="field-field-mq3-platform-win-snd-action-kind-kind-src-mq3-platform-win-snd-ml-1489966855"></a>
### kind

```ml
kind
```

DirectSound lifecycle or buffer operation represented by this dispatch request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L24)

<a id="field-field-mq3-platform-win-snd-action-size-size-src-mq3-platform-win-snd-ml-477851725"></a>
### size

```ml
size
```

Configured size or capacity used by the enclosing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L26)
