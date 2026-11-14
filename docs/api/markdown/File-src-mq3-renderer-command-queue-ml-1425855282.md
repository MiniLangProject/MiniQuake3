# `src/mq3/renderer/command_queue.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.command_queue`](Package-mq3-renderer-command-queue-1873949526.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-command-queue-allocate-function-allocate-queue-bytes-src-mq3-renderer-command-queue-ml-1308866764"></a>
### allocate

```ml
function allocate(queue, bytes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `bytes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L49)

<a id="function-function-mq3-renderer-command-queue-append-function-append-queue-id-bytes-values-shader-src-mq3-renderer-command-queue-ml-480172160"></a>
### append

```ml
function append(queue, id, bytes, values, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `bytes` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L61)

<a id="function-function-mq3-renderer-command-queue-backend-function-backend-host-src-mq3-renderer-command-queue-ml-1725222264"></a>
### backend

```ml
function backend(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L44)

- [mq3.renderer.command_queue.Backend](Type-mq3-renderer-command-queue-backend-119222016.md) — struct
- [mq3.renderer.command_queue.Command](Type-mq3-renderer-command-queue-command-1924622401.md) — struct
<a id="function-function-mq3-renderer-command-queue-count-function-count-queue-src-mq3-renderer-command-queue-ml-1922066709"></a>
### count

```ml
function count(queue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L43)

<a id="function-function-mq3-renderer-command-queue-create-function-create-shaderfn-shadercontext-src-mq3-renderer-command-queue-ml-1076620031"></a>
### create

```ml
function create(shaderFn, shaderContext)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shaderFn` | `dynamic` | — |  |
| `shaderContext` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L30)

<a id="function-function-mq3-renderer-command-queue-createfast-function-createfast-shaderfn-shadercontext-capacity-src-mq3-renderer-command-queue-ml-1134635331"></a>
### createFast

```ml
function createFast(shaderFn, shaderContext, capacity)
```

Productive QVM drawing emits dozens to hundreds of commands each frame. Repeated array concatenation is quadratic in MiniLang, so accumulate into a geometric std list and expose the exact legacy array once the QVM returns.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shaderFn` | `dynamic` | — |  |
| `shaderContext` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L34)

<a id="constant-constant-mq3-renderer-command-queue-draw-buffer-bytes-const-draw-buffer-bytes-8-src-mq3-renderer-command-queue-ml-1913968629"></a>
### DRAW_BUFFER_BYTES

```ml
const DRAW_BUFFER_BYTES = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L20)

<a id="function-function-mq3-renderer-command-queue-drawbuffer-function-drawbuffer-queue-buffer-src-mq3-renderer-command-queue-ml-1170250049"></a>
### drawBuffer

```ml
function drawBuffer(queue, buffer)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L83)

<a id="function-function-mq3-renderer-command-queue-emit-function-emit-state-kind-value-src-mq3-renderer-command-queue-ml-323395506"></a>
### emit

```ml
function emit(state, kind, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L93)

<a id="constant-constant-mq3-renderer-command-queue-end-command-bytes-const-end-command-bytes-4-src-mq3-renderer-command-queue-ml-940191513"></a>
### END_COMMAND_BYTES

```ml
const END_COMMAND_BYTES = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L17)

<a id="function-function-mq3-renderer-command-queue-execute-function-execute-state-queue-src-mq3-renderer-command-queue-ml-636763276"></a>
### execute

```ml
function execute(state, queue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `queue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L136)

<a id="function-function-mq3-renderer-command-queue-executedrawbuffer-function-executedrawbuffer-state-command-src-mq3-renderer-command-queue-ml-223697910"></a>
### executeDrawBuffer

```ml
function executeDrawBuffer(state, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L123)

<a id="function-function-mq3-renderer-command-queue-executesetcolor-function-executesetcolor-state-command-src-mq3-renderer-command-queue-ml-475578156"></a>
### executeSetColor

```ml
function executeSetColor(state, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L97)

<a id="function-function-mq3-renderer-command-queue-executestretchpic-function-executestretchpic-state-command-src-mq3-renderer-command-queue-ml-1262215776"></a>
### executeStretchPic

```ml
function executeStretchPic(state, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L103)

<a id="function-function-mq3-renderer-command-queue-executeswapbuffers-function-executeswapbuffers-state-src-mq3-renderer-command-queue-ml-2079252621"></a>
### executeSwapBuffers

```ml
function executeSwapBuffers(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L128)

<a id="function-function-mq3-renderer-command-queue-fail-function-fail-message-src-mq3-renderer-command-queue-ml-949867487"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L28)

<a id="constant-constant-mq3-renderer-command-queue-max-render-commands-const-max-render-commands-262144-src-mq3-renderer-command-queue-ml-180272464"></a>
### MAX_RENDER_COMMANDS

```ml
const MAX_RENDER_COMMANDS = 262144
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L16)

- [mq3.renderer.command_queue.Queue](Type-mq3-renderer-command-queue-queue-686890311.md) — struct
<a id="constant-constant-mq3-renderer-command-queue-rc-draw-buffer-const-rc-draw-buffer-4-src-mq3-renderer-command-queue-ml-1774217801"></a>
### RC_DRAW_BUFFER

```ml
const RC_DRAW_BUFFER = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L13)

<a id="constant-constant-mq3-renderer-command-queue-rc-draw-surfs-const-rc-draw-surfs-3-src-mq3-renderer-command-queue-ml-1314790504"></a>
### RC_DRAW_SURFS

```ml
const RC_DRAW_SURFS = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L12)

<a id="constant-constant-mq3-renderer-command-queue-rc-end-of-list-const-rc-end-of-list-0-src-mq3-renderer-command-queue-ml-17046523"></a>
### RC_END_OF_LIST

```ml
const RC_END_OF_LIST = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L9)

<a id="constant-constant-mq3-renderer-command-queue-rc-screenshot-const-rc-screenshot-6-src-mq3-renderer-command-queue-ml-1962357575"></a>
### RC_SCREENSHOT

```ml
const RC_SCREENSHOT = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L15)

<a id="constant-constant-mq3-renderer-command-queue-rc-set-color-const-rc-set-color-1-src-mq3-renderer-command-queue-ml-1290255636"></a>
### RC_SET_COLOR

```ml
const RC_SET_COLOR = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L10)

<a id="constant-constant-mq3-renderer-command-queue-rc-stretch-pic-const-rc-stretch-pic-2-src-mq3-renderer-command-queue-ml-2147051969"></a>
### RC_STRETCH_PIC

```ml
const RC_STRETCH_PIC = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L11)

<a id="constant-constant-mq3-renderer-command-queue-rc-swap-buffers-const-rc-swap-buffers-5-src-mq3-renderer-command-queue-ml-53166874"></a>
### RC_SWAP_BUFFERS

```ml
const RC_SWAP_BUFFERS = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L14)

<a id="function-function-mq3-renderer-command-queue-reset-function-reset-queue-src-mq3-renderer-command-queue-ml-6368249"></a>
### reset

```ml
function reset(queue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L152)

<a id="function-function-mq3-renderer-command-queue-services-function-services-src-mq3-renderer-command-queue-ml-1844326686"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L29)

- [mq3.renderer.command_queue.Services](Type-mq3-renderer-command-queue-services-505187096.md) — struct
<a id="constant-constant-mq3-renderer-command-queue-set-color-bytes-const-set-color-bytes-20-src-mq3-renderer-command-queue-ml-617904151"></a>
### SET_COLOR_BYTES

```ml
const SET_COLOR_BYTES = 20
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L18)

<a id="function-function-mq3-renderer-command-queue-setcolor-function-setcolor-queue-rgba-src-mq3-renderer-command-queue-ml-786405529"></a>
### setColor

```ml
function setColor(queue, rgba)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `rgba` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L69)

<a id="function-function-mq3-renderer-command-queue-snapshot-function-snapshot-queue-src-mq3-renderer-command-queue-ml-1269096951"></a>
### snapshot

```ml
function snapshot(queue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L38)

<a id="constant-constant-mq3-renderer-command-queue-stretch-pic-bytes-const-stretch-pic-bytes-40-src-mq3-renderer-command-queue-ml-304961577"></a>
### STRETCH_PIC_BYTES

```ml
const STRETCH_PIC_BYTES = 40
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L19)

<a id="function-function-mq3-renderer-command-queue-stretchpic-function-stretchpic-queue-x-y-w-h-s1-t1-s2-t2-shaderhandle-src-mq3-renderer-command-queue-ml-1461911122"></a>
### stretchPic

```ml
function stretchPic(queue, x, y, w, h, s1, t1, s2, t2, shaderHandle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |
| `h` | `dynamic` | — |  |
| `s1` | `dynamic` | — |  |
| `t1` | `dynamic` | — |  |
| `s2` | `dynamic` | — |  |
| `t2` | `dynamic` | — |  |
| `shaderHandle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L76)

<a id="constant-constant-mq3-renderer-command-queue-swap-buffers-bytes-const-swap-buffers-bytes-4-src-mq3-renderer-command-queue-ml-2030612633"></a>
### SWAP_BUFFERS_BYTES

```ml
const SWAP_BUFFERS_BYTES = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L21)

<a id="function-function-mq3-renderer-command-queue-swapbuffers-function-swapbuffers-queue-src-mq3-renderer-command-queue-ml-1674074195"></a>
### swapBuffers

```ml
function swapBuffers(queue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/command_queue.ml#L88)
