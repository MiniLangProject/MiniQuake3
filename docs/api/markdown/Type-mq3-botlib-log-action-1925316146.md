# `mq3.botlib.log.Action`

[Home](README.md) · [Source file](File-src-mq3-botlib-log-ml-480729422.md)

<a id="struct-struct-mq3-botlib-log-action-struct-action-src-mq3-botlib-log-ml-785964551"></a>
## Action

```ml
struct Action
```

`Action` record for log, containing `boundary`, `kind`, `severity`, `filename` and `text` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L38)

## Members

<a id="field-field-mq3-botlib-log-action-boundary-boundary-src-mq3-botlib-log-ml-436947031"></a>
### boundary

```ml
boundary
```

Subsystem boundary at which this host action must be dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L40)

<a id="field-field-mq3-botlib-log-action-dispatched-dispatched-src-mq3-botlib-log-ml-1866712525"></a>
### dispatched

```ml
dispatched
```

True after the recorded action has been delivered to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L52)

<a id="field-field-mq3-botlib-log-action-filename-filename-src-mq3-botlib-log-ml-1618180685"></a>
### filename

```ml
filename
```

Path of the file associated with this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L46)

<a id="field-field-mq3-botlib-log-action-handle-handle-src-mq3-botlib-log-ml-1657398631"></a>
### handle

```ml
handle
```

Host log-file handle affected by the action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L50)

<a id="field-field-mq3-botlib-log-action-kind-kind-src-mq3-botlib-log-ml-2018009575"></a>
### kind

```ml
kind
```

Discriminator selecting a log open, close, write, or flush action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L42)

<a id="field-field-mq3-botlib-log-action-severity-severity-src-mq3-botlib-log-ml-1793459445"></a>
### severity

```ml
severity
```

Diagnostic severity assigned to this log action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L44)

<a id="field-field-mq3-botlib-log-action-text-text-src-mq3-botlib-log-ml-346887149"></a>
### text

```ml
text
```

Formatted text associated with the logging action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L48)
