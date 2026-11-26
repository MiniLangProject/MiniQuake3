# `mq3.botlib.l_memory.MemoryBlock`

[Home](README.md) · [Source file](File-src-mq3-botlib-l-memory-ml-1776975564.md)

<a id="struct-struct-mq3-botlib-l-memory-memoryblock-struct-memoryblock-src-mq3-botlib-l-memory-ml-1588331699"></a>
## MemoryBlock

```ml
struct MemoryBlock
```

`MemoryBlock` record for l memory, containing `id`, `handle`, `size`, `payloadSize` and `data` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L12)

## Members

<a id="field-field-mq3-botlib-l-memory-memoryblock-cleared-cleared-src-mq3-botlib-l-memory-ml-1809680065"></a>
### cleared

```ml
cleared
```

True when the allocation was initialized with zero-filled bytes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L24)

<a id="field-field-mq3-botlib-l-memory-memoryblock-data-data-src-mq3-botlib-l-memory-ml-1412022093"></a>
### data

```ml
data
```

Usable bytes owned by this managed allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L22)

<a id="field-field-mq3-botlib-l-memory-memoryblock-file-file-src-mq3-botlib-l-memory-ml-421657697"></a>
### file

```ml
file
```

Source file associated with the diagnostic or allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L28)

<a id="field-field-mq3-botlib-l-memory-memoryblock-handle-handle-src-mq3-botlib-l-memory-ml-39153897"></a>
### handle

```ml
handle
```

Managed identifier used to find and release this allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L16)

<a id="field-field-mq3-botlib-l-memory-memoryblock-id-id-src-mq3-botlib-l-memory-ml-1627037271"></a>
### id

```ml
id
```

Allocation-header marker distinguishing ordinary and hunk-backed memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L14)

<a id="field-field-mq3-botlib-l-memory-memoryblock-label-label-src-mq3-botlib-l-memory-ml-248896137"></a>
### label

```ml
label
```

Human-readable label identifying the allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L26)

<a id="field-field-mq3-botlib-l-memory-memoryblock-line-line-src-mq3-botlib-l-memory-ml-1156561129"></a>
### line

```ml
line
```

Source-line number associated with the token, diagnostic, or allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L30)

<a id="field-field-mq3-botlib-l-memory-memoryblock-payloadsize-payloadsize-src-mq3-botlib-l-memory-ml-1269718365"></a>
### payloadSize

```ml
payloadSize
```

Byte length of the usable data in this allocation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L20)

<a id="field-field-mq3-botlib-l-memory-memoryblock-size-size-src-mq3-botlib-l-memory-ml-1030249575"></a>
### size

```ml
size
```

Accounted block byte size, including the configured memory header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L18)
