# `src/mq3/botlib/l_memory.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.l_memory`](Package-mq3-botlib-l-memory-38303534.md)

Reachable from entry: **no**

## Declarations

- [mq3.botlib.l_memory.Action](Type-mq3-botlib-l-memory-action-654611930.md) — struct
<a id="function-function-mq3-botlib-l-memory-allocate-function-allocate-state-size-id-cleared-label-file-line-retailactive-src-mq3-botlib-l-memory-ml-411839686"></a>
### allocate

```ml
function allocate(state, size, id, cleared, label, file, line, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `cleared` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L16)

<a id="function-function-mq3-botlib-l-memory-availablememory-function-availablememory-state-src-mq3-botlib-l-memory-ml-892495245"></a>
### AvailableMemory

```ml
function AvailableMemory(state)
```

AvailableMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L50)

<a id="function-function-mq3-botlib-l-memory-blockfrompointer-function-blockfrompointer-state-handle-operation-retailactive-src-mq3-botlib-l-memory-ml-1699071969"></a>
### BlockFromPointer

```ml
function BlockFromPointer(state, handle, operation, retailActive)
```

BlockFromPointer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `operation` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L40)

<a id="function-function-mq3-botlib-l-memory-copystring-function-copystring-state-text-retailactive-src-mq3-botlib-l-memory-ml-626611999"></a>
### CopyString

```ml
function CopyString(state, text, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L64)

<a id="function-function-mq3-botlib-l-memory-create-function-create-availablebytes-memorymanager-src-mq3-botlib-l-memory-ml-2085154056"></a>
### create

```ml
function create(availableBytes, memoryManager)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `availableBytes` | `dynamic` | — |  |
| `memoryManager` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L13)

<a id="function-function-mq3-botlib-l-memory-dumpmemory-function-dumpmemory-state-retailactive-src-mq3-botlib-l-memory-ml-224764460"></a>
### DumpMemory

```ml
function DumpMemory(state, retailActive)
```

DumpMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L60)

<a id="function-function-mq3-botlib-l-memory-emit-function-emit-state-boundary-kind-handle-size-message-retailactive-src-mq3-botlib-l-memory-ml-134717164"></a>
### emit

```ml
function emit(state, boundary, kind, handle, size, message, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L14)

<a id="function-function-mq3-botlib-l-memory-freememory-function-freememory-state-handle-retailactive-src-mq3-botlib-l-memory-ml-2028008190"></a>
### FreeMemory

```ml
function FreeMemory(state, handle, retailActive)
```

FreeMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L45)

<a id="function-function-mq3-botlib-l-memory-getclearedhunkmemory-function-getclearedhunkmemory-state-size-retailactive-src-mq3-botlib-l-memory-ml-2076030385"></a>
### GetClearedHunkMemory

```ml
function GetClearedHunkMemory(state, size, retailActive)
```

GetClearedHunkMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L33)

<a id="function-function-mq3-botlib-l-memory-getclearedhunkmemorydebug-function-getclearedhunkmemorydebug-state-size-label-file-line-retailactive-src-mq3-botlib-l-memory-ml-334404423"></a>
### GetClearedHunkMemoryDebug

```ml
function GetClearedHunkMemoryDebug(state, size, label, file, line, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L37)

<a id="function-function-mq3-botlib-l-memory-getclearedmemory-function-getclearedmemory-state-size-retailactive-src-mq3-botlib-l-memory-ml-2133094653"></a>
### GetClearedMemory

```ml
function GetClearedMemory(state, size, retailActive)
```

GetClearedMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L29)

<a id="function-function-mq3-botlib-l-memory-getclearedmemorydebug-function-getclearedmemorydebug-state-size-label-file-line-retailactive-src-mq3-botlib-l-memory-ml-1368317511"></a>
### GetClearedMemoryDebug

```ml
function GetClearedMemoryDebug(state, size, label, file, line, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L35)

<a id="function-function-mq3-botlib-l-memory-gethunkmemory-function-gethunkmemory-state-size-retailactive-src-mq3-botlib-l-memory-ml-483807495"></a>
### GetHunkMemory

```ml
function GetHunkMemory(state, size, retailActive)
```

GetHunkMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L31)

<a id="function-function-mq3-botlib-l-memory-gethunkmemorydebug-function-gethunkmemorydebug-state-size-label-file-line-retailactive-src-mq3-botlib-l-memory-ml-1500252759"></a>
### GetHunkMemoryDebug

```ml
function GetHunkMemoryDebug(state, size, label, file, line, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L36)

<a id="function-function-mq3-botlib-l-memory-getmemory-function-getmemory-state-size-retailactive-src-mq3-botlib-l-memory-ml-1697553171"></a>
### GetMemory

```ml
function GetMemory(state, size, retailActive)
```

GetMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L27)

<a id="function-function-mq3-botlib-l-memory-getmemorydebug-function-getmemorydebug-state-size-label-file-line-retailactive-src-mq3-botlib-l-memory-ml-521436055"></a>
### GetMemoryDebug

```ml
function GetMemoryDebug(state, size, label, file, line, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L34)

<a id="constant-constant-mq3-botlib-l-memory-hunk-id-const-hunk-id-2271560481-src-mq3-botlib-l-memory-ml-30675229"></a>
### HUNK_ID

```ml
const HUNK_ID = 2271560481
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L7)

<a id="function-function-mq3-botlib-l-memory-indexof-function-indexof-state-handle-src-mq3-botlib-l-memory-ml-1097908189"></a>
### indexOf

```ml
function indexOf(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L15)

<a id="function-function-mq3-botlib-l-memory-linkmemoryblock-function-linkmemoryblock-state-block-src-mq3-botlib-l-memory-ml-456082806"></a>
### LinkMemoryBlock

```ml
function LinkMemoryBlock(state, block)
```

LinkMemoryBlock

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `block` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L21)

<a id="constant-constant-mq3-botlib-l-memory-mem-id-const-mem-id-305419896-src-mq3-botlib-l-memory-ml-439114504"></a>
### MEM_ID

```ml
const MEM_ID = 305419896
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L6)

- [mq3.botlib.l_memory.MemoryBlock](Type-mq3-botlib-l-memory-memoryblock-689510748.md) — struct
<a id="function-function-mq3-botlib-l-memory-memorybytesize-function-memorybytesize-state-handle-retailactive-src-mq3-botlib-l-memory-ml-494744306"></a>
### MemoryByteSize

```ml
function MemoryByteSize(state, handle, retailActive)
```

MemoryByteSize

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L52)

<a id="function-function-mq3-botlib-l-memory-printmemorylabels-function-printmemorylabels-state-retailactive-src-mq3-botlib-l-memory-ml-591847230"></a>
### PrintMemoryLabels

```ml
function PrintMemoryLabels(state, retailActive)
```

PrintMemoryLabels

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L56)

<a id="function-function-mq3-botlib-l-memory-printusedmemorysize-function-printusedmemorysize-state-retailactive-src-mq3-botlib-l-memory-ml-293401744"></a>
### PrintUsedMemorySize

```ml
function PrintUsedMemorySize(state, retailActive)
```

PrintUsedMemorySize

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L54)

<a id="function-function-mq3-botlib-l-memory-readbytes-function-readbytes-state-handle-offset-count-retailactive-src-mq3-botlib-l-memory-ml-106911664"></a>
### readBytes

```ml
function readBytes(state, handle, offset, count, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L63)

- [mq3.botlib.l_memory.State](Type-mq3-botlib-l-memory-state-504344501.md) — struct
<a id="function-function-mq3-botlib-l-memory-unlinkmemoryblock-function-unlinkmemoryblock-state-block-src-mq3-botlib-l-memory-ml-793084652"></a>
### UnlinkMemoryBlock

```ml
function UnlinkMemoryBlock(state, block)
```

UnlinkMemoryBlock

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `block` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L23)

<a id="function-function-mq3-botlib-l-memory-writebytes-function-writebytes-state-handle-offset-data-retailactive-src-mq3-botlib-l-memory-ml-476351761"></a>
### writeBytes

```ml
function writeBytes(state, handle, offset, data, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/l_memory.ml#L62)
