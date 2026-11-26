# `mq3.botlib.l_memory.State`

[Home](README.md) · [Source file](File-src-mq3-botlib-l-memory-ml-1776975564.md)

<a id="struct-struct-mq3-botlib-l-memory-state-struct-state-src-mq3-botlib-l-memory-ml-283830709"></a>
## State

```ml
struct State
```

`State` record for l memory, containing `blocks`, `nextHandle`, `headerSize`, `allocatedmemory` and `totalmemorysize` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L48)

## Members

<a id="field-field-mq3-botlib-l-memory-state-actions-actions-src-mq3-botlib-l-memory-ml-1228296446"></a>
### actions

```ml
actions
```

Recorded allocation, release, and memory-diagnostic requests for host dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L64)

<a id="field-field-mq3-botlib-l-memory-state-allocatedmemory-allocatedmemory-src-mq3-botlib-l-memory-ml-454727722"></a>
### allocatedmemory

```ml
allocatedmemory
```

Bytes currently charged to active botlib allocations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L56)

<a id="field-field-mq3-botlib-l-memory-state-availablebytes-availablebytes-src-mq3-botlib-l-memory-ml-1923020966"></a>
### availableBytes

```ml
availableBytes
```

Remaining host-memory budget available for botlib allocations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L62)

<a id="field-field-mq3-botlib-l-memory-state-blocks-blocks-src-mq3-botlib-l-memory-ml-742873242"></a>
### blocks

```ml
blocks
```

Managed memory blocks currently tracked by the allocator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L50)

<a id="field-field-mq3-botlib-l-memory-state-diagnostics-diagnostics-src-mq3-botlib-l-memory-ml-1282197666"></a>
### diagnostics

```ml
diagnostics
```

Diagnostics collected while processing the subsystem's requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L66)

<a id="field-field-mq3-botlib-l-memory-state-headersize-headersize-src-mq3-botlib-l-memory-ml-76368514"></a>
### headerSize

```ml
headerSize
```

Bytes reserved for allocation metadata before the usable payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L54)

<a id="field-field-mq3-botlib-l-memory-state-memorymanager-memorymanager-src-mq3-botlib-l-memory-ml-907769218"></a>
### memoryManager

```ml
memoryManager
```

Host or managed allocator servicing botlib memory requests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L68)

<a id="field-field-mq3-botlib-l-memory-state-nexthandle-nexthandle-src-mq3-botlib-l-memory-ml-538902344"></a>
### nextHandle

```ml
nextHandle
```

Handle to assign to the next allocated managed resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L52)

<a id="field-field-mq3-botlib-l-memory-state-numblocks-numblocks-src-mq3-botlib-l-memory-ml-1335538898"></a>
### numblocks

```ml
numblocks
```

Number of active memory blocks tracked by the botlib allocator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L60)

<a id="field-field-mq3-botlib-l-memory-state-totalmemorysize-totalmemorysize-src-mq3-botlib-l-memory-ml-704473390"></a>
### totalmemorysize

```ml
totalmemorysize
```

Total memory size recorded by the botlib allocator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L58)
