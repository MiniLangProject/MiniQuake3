# `mq3.botlib.l_memory.Action`

[Home](README.md) · [Source file](File-src-mq3-botlib-l-memory-ml-1776975564.md)

<a id="struct-struct-mq3-botlib-l-memory-action-struct-action-src-mq3-botlib-l-memory-ml-1316328693"></a>
## Action

```ml
struct Action
```

`Action` record for l memory, containing `boundary`, `kind`, `handle`, `size` and `message` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L33)

## Members

<a id="field-field-mq3-botlib-l-memory-action-boundary-boundary-src-mq3-botlib-l-memory-ml-551319735"></a>
### boundary

```ml
boundary
```

Subsystem boundary at which this host action must be dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L35)

<a id="field-field-mq3-botlib-l-memory-action-dispatched-dispatched-src-mq3-botlib-l-memory-ml-1835485813"></a>
### dispatched

```ml
dispatched
```

True after the recorded action has been delivered to the host.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L45)

<a id="field-field-mq3-botlib-l-memory-action-handle-handle-src-mq3-botlib-l-memory-ml-2081699015"></a>
### handle

```ml
handle
```

Managed allocation handle affected by the operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L39)

<a id="field-field-mq3-botlib-l-memory-action-kind-kind-src-mq3-botlib-l-memory-ml-208378439"></a>
### kind

```ml
kind
```

Memory-manager operation represented by this host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L37)

<a id="field-field-mq3-botlib-l-memory-action-message-message-src-mq3-botlib-l-memory-ml-1302528659"></a>
### message

```ml
message
```

Text associated with the reported event or diagnostic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L43)

<a id="field-field-mq3-botlib-l-memory-action-size-size-src-mq3-botlib-l-memory-ml-810404973"></a>
### size

```ml
size
```

Byte count supplied with the recorded memory-allocation or release action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L41)
