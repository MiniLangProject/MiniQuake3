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

Record or dispatch `"memory"` actions in `allocate`. Return paths include `handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `id` | `dynamic` | — | Initial value stored in `mq3.botlib.l_memory.MemoryBlock.id`. |
| `cleared` | `dynamic` | — | Initial value stored in `mq3.botlib.l_memory.MemoryBlock.cleared`. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |
| `file` | `dynamic` | — | Source filename attached to the diagnostic. |
| `line` | `dynamic` | — | Source line number attached to the diagnostic. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L97)

<a id="function-function-mq3-botlib-l-memory-availablememory-function-availablememory-state-src-mq3-botlib-l-memory-ml-892495245"></a>
### AvailableMemory

```ml
function AvailableMemory(state)
```

AvailableMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `availableBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L183)

<a id="function-function-mq3-botlib-l-memory-blockfrompointer-function-blockfrompointer-state-handle-operation-retailactive-src-mq3-botlib-l-memory-ml-1699071969"></a>
### BlockFromPointer

```ml
function BlockFromPointer(state, handle, operation, retailActive)
```

BlockFromPointer

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `diagnostics` and `blocks`. May update `state.diagnostics` in place. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `operation` | `dynamic` | — | Value used by `BlockFromPointer` in `if handle==void or handle==0 then message=operation+": NULL pointer"`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L169)

<a id="function-function-mq3-botlib-l-memory-copystring-function-copystring-state-text-retailactive-src-mq3-botlib-l-memory-ml-626611999"></a>
### CopyString

```ml
function CopyString(state, text, retailActive)
```

Apply `mq3.botlib.l_memory.GetMemory` and `mq3.botlib.l_memory.writeBytes` while evaluating `CopyString`. Return paths include `handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L222)

<a id="function-function-mq3-botlib-l-memory-create-function-create-availablebytes-memorymanager-src-mq3-botlib-l-memory-ml-2085154056"></a>
### create

```ml
function create(availableBytes, memoryManager)
```

Create a `mq3.botlib.l_memory.State` record, initializing `nextHandle` as `1`, `headerSize` as `20` and `availableBytes` from `availableBytes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `availableBytes` | `dynamic` | — | Initial value stored in `mq3.botlib.l_memory.State.availableBytes`. |
| `memoryManager` | `dynamic` | — | Initial value stored in `mq3.botlib.l_memory.State.memoryManager`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L74)

<a id="function-function-mq3-botlib-l-memory-dumpmemory-function-dumpmemory-state-retailactive-src-mq3-botlib-l-memory-ml-224764460"></a>
### DumpMemory

```ml
function DumpMemory(state, retailActive)
```

DumpMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `blocks`, `totalmemorysize` and `allocatedmemory`. May update `state.totalmemorysize` and `state.allocatedmemory` in place. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L202)

<a id="function-function-mq3-botlib-l-memory-emit-function-emit-state-boundary-kind-handle-size-message-retailactive-src-mq3-botlib-l-memory-ml-134717164"></a>
### emit

```ml
function emit(state, boundary, kind, handle, size, message, retailActive)
```

Set `state.actions` to `state.actions+[value]` in `mq3.botlib.l_memory.emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `actions`. May update `state.actions` in place. |
| `boundary` | `dynamic` | — | Initial value stored in `mq3.botlib.l_memory.Action.boundary`. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.botlib.l_memory.Action.kind`. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L83)

<a id="function-function-mq3-botlib-l-memory-freememory-function-freememory-state-handle-retailactive-src-mq3-botlib-l-memory-ml-2028008190"></a>
### FreeMemory

```ml
function FreeMemory(state, handle, retailActive)
```

FreeMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `allocatedmemory`, `totalmemorysize`, `headerSize` and `numblocks`. May update `state.allocatedmemory`, `state.totalmemorysize` and `state.numblocks` in place. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L177)

<a id="function-function-mq3-botlib-l-memory-getclearedhunkmemory-function-getclearedhunkmemory-state-size-retailactive-src-mq3-botlib-l-memory-ml-2076030385"></a>
### GetClearedHunkMemory

```ml
function GetClearedHunkMemory(state, size, retailActive)
```

GetClearedHunkMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L130)

<a id="function-function-mq3-botlib-l-memory-getclearedhunkmemorydebug-function-getclearedhunkmemorydebug-state-size-label-file-line-retailactive-src-mq3-botlib-l-memory-ml-334404423"></a>
### GetClearedHunkMemoryDebug

```ml
function GetClearedHunkMemoryDebug(state, size, label, file, line, retailActive)
```

Forward `GetClearedHunkMemoryDebug` to `mq3.botlib.l_memory.allocate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |
| `file` | `dynamic` | — | Source filename attached to the diagnostic. |
| `line` | `dynamic` | — | Source line number attached to the diagnostic. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L162)

<a id="function-function-mq3-botlib-l-memory-getclearedmemory-function-getclearedmemory-state-size-retailactive-src-mq3-botlib-l-memory-ml-2133094653"></a>
### GetClearedMemory

```ml
function GetClearedMemory(state, size, retailActive)
```

GetClearedMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L120)

<a id="function-function-mq3-botlib-l-memory-getclearedmemorydebug-function-getclearedmemorydebug-state-size-label-file-line-retailactive-src-mq3-botlib-l-memory-ml-1368317511"></a>
### GetClearedMemoryDebug

```ml
function GetClearedMemoryDebug(state, size, label, file, line, retailActive)
```

Forward `GetClearedMemoryDebug` to `mq3.botlib.l_memory.allocate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |
| `file` | `dynamic` | — | Source filename attached to the diagnostic. |
| `line` | `dynamic` | — | Source line number attached to the diagnostic. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L146)

<a id="function-function-mq3-botlib-l-memory-gethunkmemory-function-gethunkmemory-state-size-retailactive-src-mq3-botlib-l-memory-ml-483807495"></a>
### GetHunkMemory

```ml
function GetHunkMemory(state, size, retailActive)
```

GetHunkMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L125)

<a id="function-function-mq3-botlib-l-memory-gethunkmemorydebug-function-gethunkmemorydebug-state-size-label-file-line-retailactive-src-mq3-botlib-l-memory-ml-1500252759"></a>
### GetHunkMemoryDebug

```ml
function GetHunkMemoryDebug(state, size, label, file, line, retailActive)
```

Forward `GetHunkMemoryDebug` to `mq3.botlib.l_memory.allocate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |
| `file` | `dynamic` | — | Source filename attached to the diagnostic. |
| `line` | `dynamic` | — | Source line number attached to the diagnostic. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L154)

<a id="function-function-mq3-botlib-l-memory-getmemory-function-getmemory-state-size-retailactive-src-mq3-botlib-l-memory-ml-1697553171"></a>
### GetMemory

```ml
function GetMemory(state, size, retailActive)
```

GetMemory

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L115)

<a id="function-function-mq3-botlib-l-memory-getmemorydebug-function-getmemorydebug-state-size-label-file-line-retailactive-src-mq3-botlib-l-memory-ml-521436055"></a>
### GetMemoryDebug

```ml
function GetMemoryDebug(state, size, label, file, line, retailActive)
```

Forward `GetMemoryDebug` to `mq3.botlib.l_memory.allocate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `nextHandle`, `headerSize`, `allocatedmemory`, `totalmemorysize` and `numblocks`. May update `state.nextHandle`, `state.allocatedmemory` and `state.totalmemorysize` and additional fields in place. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |
| `file` | `dynamic` | — | Source filename attached to the diagnostic. |
| `line` | `dynamic` | — | Source line number attached to the diagnostic. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L138)

<a id="constant-constant-mq3-botlib-l-memory-hunk-id-const-hunk-id-2271560481-src-mq3-botlib-l-memory-ml-30675229"></a>
### HUNK_ID

```ml
const HUNK_ID = 2271560481
```

Allocation-header marker identifying hunk-backed botlib memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L9)

<a id="function-function-mq3-botlib-l-memory-indexof-function-indexof-state-handle-src-mq3-botlib-l-memory-ml-1097908189"></a>
### indexOf

```ml
function indexOf(state, handle)
```

Find the allocation-table index matching a memory handle, returning -1 when absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `blocks`. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L87)

<a id="function-function-mq3-botlib-l-memory-linkmemoryblock-function-linkmemoryblock-state-block-src-mq3-botlib-l-memory-ml-456082806"></a>
### LinkMemoryBlock

```ml
function LinkMemoryBlock(state, block)
```

LinkMemoryBlock

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `blocks`. May update `state.blocks` in place. |
| `block` | `dynamic` | — | Operand used to evaluate the returned expression `block`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L104)

<a id="constant-constant-mq3-botlib-l-memory-mem-id-const-mem-id-305419896-src-mq3-botlib-l-memory-ml-439114504"></a>
### MEM_ID

```ml
const MEM_ID = 305419896
```

Allocation-header marker identifying ordinary botlib memory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L7)

- [mq3.botlib.l_memory.MemoryBlock](Type-mq3-botlib-l-memory-memoryblock-689510748.md) — struct
<a id="function-function-mq3-botlib-l-memory-memorybytesize-function-memorybytesize-state-handle-retailactive-src-mq3-botlib-l-memory-ml-494744306"></a>
### MemoryByteSize

```ml
function MemoryByteSize(state, handle, retailActive)
```

MemoryByteSize

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `diagnostics` and `blocks`. May update `state.diagnostics` in place. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L188)

<a id="function-function-mq3-botlib-l-memory-printmemorylabels-function-printmemorylabels-state-retailactive-src-mq3-botlib-l-memory-ml-591847230"></a>
### PrintMemoryLabels

```ml
function PrintMemoryLabels(state, retailActive)
```

PrintMemoryLabels

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `blocks`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L196)

<a id="function-function-mq3-botlib-l-memory-printusedmemorysize-function-printusedmemorysize-state-retailactive-src-mq3-botlib-l-memory-ml-293401744"></a>
### PrintUsedMemorySize

```ml
function PrintUsedMemorySize(state, retailActive)
```

PrintUsedMemorySize

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `allocatedmemory`, `totalmemorysize` and `numblocks`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L192)

<a id="function-function-mq3-botlib-l-memory-readbytes-function-readbytes-state-handle-offset-count-retailactive-src-mq3-botlib-l-memory-ml-106911664"></a>
### readBytes

```ml
function readBytes(state, handle, offset, count, retailActive)
```

Apply `mq3.botlib.l_memory.BlockFromPointer` while evaluating `readBytes`. Return paths include `slice(block.data,offset,count)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `diagnostics` and `blocks`. May update `state.diagnostics` in place. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L217)

- [mq3.botlib.l_memory.State](Type-mq3-botlib-l-memory-state-504344501.md) — struct
<a id="function-function-mq3-botlib-l-memory-unlinkmemoryblock-function-unlinkmemoryblock-state-block-src-mq3-botlib-l-memory-ml-793084652"></a>
### UnlinkMemoryBlock

```ml
function UnlinkMemoryBlock(state, block)
```

UnlinkMemoryBlock

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `blocks`. May update `state.blocks` in place. |
| `block` | `dynamic` | — | Block record; accesses `handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L108)

<a id="function-function-mq3-botlib-l-memory-writebytes-function-writebytes-state-handle-offset-data-retailactive-src-mq3-botlib-l-memory-ml-476351761"></a>
### writeBytes

```ml
function writeBytes(state, handle, offset, data, retailActive)
```

Apply `mq3.botlib.l_memory.BlockFromPointer` while evaluating `writeBytes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | L memory state; accesses `diagnostics` and `blocks`. May update `state.diagnostics` in place. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `data` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `writeBytes`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/l_memory.ml#L210)
