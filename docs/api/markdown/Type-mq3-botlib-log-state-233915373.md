# `mq3.botlib.log.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-log-ml-480729422.md)

<a id="struct-struct-mq3-botlib-log-state-struct-state-src-mq3-botlib-log-ml-1837218639"></a>
## State

```ml
struct State
```

`State` record for log, containing `variables`, `services`, `filename`, `handle` and `numwrites` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L71)

## Members

<a id="field-field-mq3-botlib-log-state-actions-actions-src-mq3-botlib-log-ml-1871797216"></a>
### actions

```ml
actions
```

Recorded log-file operations and diagnostic messages awaiting host handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L87)

<a id="field-field-mq3-botlib-log-state-content-content-src-mq3-botlib-log-ml-1763469484"></a>
### content

```ml
content
```

Log text accumulated by the managed logging implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L85)

<a id="field-field-mq3-botlib-log-state-filename-filename-src-mq3-botlib-log-ml-2078902658"></a>
### filename

```ml
filename
```

Path of the file associated with this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L77)

<a id="field-field-mq3-botlib-log-state-flushes-flushes-src-mq3-botlib-log-ml-300369084"></a>
### flushes

```ml
flushes
```

Number of explicit log flush operations performed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L91)

<a id="field-field-mq3-botlib-log-state-handle-handle-src-mq3-botlib-log-ml-768296052"></a>
### handle

```ml
handle
```

Open host file handle receiving log output.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L79)

<a id="field-field-mq3-botlib-log-state-numwrites-numwrites-src-mq3-botlib-log-ml-1866396796"></a>
### numwrites

```ml
numwrites
```

Number of log writes performed by the logging state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L81)

<a id="field-field-mq3-botlib-log-state-retailactive-retailactive-src-mq3-botlib-log-ml-1975577270"></a>
### retailActive

```ml
retailActive
```

Indicates whether the host-backed retail-compatible runtime path is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L89)

<a id="field-field-mq3-botlib-log-state-services-services-src-mq3-botlib-log-ml-1472319148"></a>
### services

```ml
services
```

File and console callbacks implementing bot-library logging.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L75)

<a id="field-field-mq3-botlib-log-state-time-time-src-mq3-botlib-log-ml-1191225002"></a>
### time

```ml
time
```

Log timestamp in seconds, formatted into hours, minutes, seconds, and hundredths.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L83)

<a id="field-field-mq3-botlib-log-state-variables-variables-src-mq3-botlib-log-ml-452468056"></a>
### variables

```ml
variables
```

Bot-library variables controlling the logging destination and policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/log.ml#L73)
