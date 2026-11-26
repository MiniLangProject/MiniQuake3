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

Updates `queue.used` in `mq3.renderer.command_queue.allocate`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Mutable record or buffer; this call updates `queue.used`. |
| `bytes` | `dynamic` | — | Input tested by `bytes<=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L142)

<a id="function-function-mq3-renderer-command-queue-append-function-append-queue-id-bytes-values-shader-src-mq3-renderer-command-queue-ml-480172160"></a>
### append

```ml
function append(queue, id, bytes, values, shader)
```

Updates `queue.commands` in `mq3.renderer.command_queue.append`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Mutable record or buffer; this call updates `queue.commands`. |
| `id` | `dynamic` | — | Value used for `mq3.renderer.command_queue.Command.id`. |
| `bytes` | `dynamic` | — | Value forwarded as `bytes` to `mq3.renderer.command_queue.allocate`. |
| `values` | `dynamic` | — | Value used for `mq3.renderer.command_queue.Command.values`. |
| `shader` | `dynamic` | — | Value used for `mq3.renderer.command_queue.Command.shader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L160)

<a id="function-function-mq3-renderer-command-queue-backend-function-backend-host-src-mq3-renderer-command-queue-ml-1725222264"></a>
### backend

```ml
function backend(host)
```

Returns `Back` from `mq3.renderer.command_queue.backend`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Value used for `mq3.renderer.command_queue.Backend.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L134)

- [mq3.renderer.command_queue.Backend](Type-mq3-renderer-command-queue-backend-119222016.md) — struct
- [mq3.renderer.command_queue.Command](Type-mq3-renderer-command-queue-command-1924622401.md) — struct
<a id="function-function-mq3-renderer-command-queue-count-function-count-queue-src-mq3-renderer-command-queue-ml-1922066709"></a>
### count

```ml
function count(queue)
```

Returns `len(queue.commands)` from `mq3.renderer.command_queue.count`; earlier branches return `0`, `queue.commandList.len()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Record providing `queue.commandList`, `queue.commands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L131)

<a id="function-function-mq3-renderer-command-queue-create-function-create-shaderfn-shadercontext-src-mq3-renderer-command-queue-ml-1076620031"></a>
### create

```ml
function create(shaderFn, shaderContext)
```

Constructs `mq3.renderer.command_queue.Queue` with `commands` = `[]`, `used` = `0`, `registered` = `true`, `commandList` = `void` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shaderFn` | `dynamic` | — | Initial value for `mq3.renderer.command_queue.Queue.shaderFn`. |
| `shaderContext` | `dynamic` | — | Initial value for `mq3.renderer.command_queue.Queue.shaderContext`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L111)

<a id="function-function-mq3-renderer-command-queue-createfast-function-createfast-shaderfn-shadercontext-capacity-src-mq3-renderer-command-queue-ml-1134635331"></a>
### createFast

```ml
function createFast(shaderFn, shaderContext, capacity)
```

Productive QVM drawing emits dozens to hundreds of commands each frame. Repeated array concatenation is quadratic in MiniLang, so accumulate into a geometric std list and expose the exact legacy array once the QVM returns.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shaderFn` | `dynamic` | — | Initial value for `mq3.renderer.command_queue.Queue.shaderFn`. |
| `shaderContext` | `dynamic` | — | Initial value for `mq3.renderer.command_queue.Queue.shaderContext`. |
| `capacity` | `dynamic` | — | Argument 1 supplied to `std.ds.list.List.withCapacity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L118)

<a id="constant-constant-mq3-renderer-command-queue-draw-buffer-bytes-const-draw-buffer-bytes-8-src-mq3-renderer-command-queue-ml-1913968629"></a>
### DRAW_BUFFER_BYTES

```ml
const DRAW_BUFFER_BYTES = 8
```

Serialized byte size of the draw-buffer command record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L32)

<a id="function-function-mq3-renderer-command-queue-drawbuffer-function-drawbuffer-queue-buffer-src-mq3-renderer-command-queue-ml-1170250049"></a>
### drawBuffer

```ml
function drawBuffer(queue, buffer)
```

Returns `app` from `mq3.renderer.command_queue.drawBuffer`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Record providing `queue.registered`. |
| `buffer` | `dynamic` | — | Input used in the result expression `append(queue,RC_DRAW_BUFFER,DRAW_BUFFER_BYTES,[buffer],void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L205)

<a id="function-function-mq3-renderer-command-queue-emit-function-emit-state-kind-value-src-mq3-renderer-command-queue-ml-323395506"></a>
### emit

```ml
function emit(state, kind, value)
```

Sends a renderer-backend diagnostic event through the optional diagnostic service callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`. |
| `kind` | `dynamic` | — | Argument 2 supplied to `state.services.diagnosticFn`. |
| `value` | `dynamic` | — | Argument 3 supplied to `state.services.diagnosticFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L221)

<a id="constant-constant-mq3-renderer-command-queue-end-command-bytes-const-end-command-bytes-4-src-mq3-renderer-command-queue-ml-940191513"></a>
### END_COMMAND_BYTES

```ml
const END_COMMAND_BYTES = 4
```

Serialized byte size of the end-of-list sentinel record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L26)

<a id="function-function-mq3-renderer-command-queue-execute-function-execute-state-queue-src-mq3-renderer-command-queue-ml-636763276"></a>
### execute

```ml
function execute(state, queue)
```

Snapshots and executes queued renderer commands in order, dispatching each recognized command kind.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.command_queue.executeSetColor`. |
| `queue` | `dynamic` | — | Value forwarded as `queue` to `mq3.renderer.command_queue.snapshot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L278)

<a id="function-function-mq3-renderer-command-queue-executedrawbuffer-function-executedrawbuffer-state-command-src-mq3-renderer-command-queue-ml-223697910"></a>
### executeDrawBuffer

```ml
function executeDrawBuffer(state, command)
```

Selects the requested draw buffer and optionally clears it through backend service callbacks.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`, `state.clearOnDrawBuffer`. |
| `command` | `dynamic` | — | Record providing `command.values`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L260)

<a id="function-function-mq3-renderer-command-queue-executesetcolor-function-executesetcolor-state-command-src-mq3-renderer-command-queue-ml-475578156"></a>
### executeSetColor

```ml
function executeSetColor(state, command)
```

Updates `state.color2D` in `mq3.renderer.command_queue.executeSetColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.color2D`. |
| `command` | `dynamic` | — | Record providing `command.values`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L228)

<a id="function-function-mq3-renderer-command-queue-executestretchpic-function-executestretchpic-state-command-src-mq3-renderer-command-queue-ml-1262215776"></a>
### executeStretchPic

```ml
function executeStretchPic(state, command)
```

Updates `state.projection2D`, `state.numIndexes`, `state.shader` in `mq3.renderer.command_queue.executeStretchPic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.projection2D`, `state.numIndexes`, `state.shader`. |
| `command` | `dynamic` | — | Record providing `command.shader`, `command.values`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L237)

<a id="function-function-mq3-renderer-command-queue-executeswapbuffers-function-executeswapbuffers-state-src-mq3-renderer-command-queue-ml-2079252621"></a>
### executeSwapBuffers

```ml
function executeSwapBuffers(state)
```

Updates `state.numIndexes`, `state.shader`, `state.projection2D` in `mq3.renderer.command_queue.executeSwapBuffers`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.numIndexes`, `state.shader`, `state.projection2D`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L267)

<a id="function-function-mq3-renderer-command-queue-fail-function-fail-message-src-mq3-renderer-command-queue-ml-949867487"></a>
### fail

```ml
function fail(message)
```

Creates error `7260` with message `"render commands: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7260,"render commands: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L105)

<a id="constant-constant-mq3-renderer-command-queue-max-render-commands-const-max-render-commands-262144-src-mq3-renderer-command-queue-ml-180272464"></a>
### MAX_RENDER_COMMANDS

```ml
const MAX_RENDER_COMMANDS = 262144
```

Byte capacity of the serialized renderer command buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L24)

- [mq3.renderer.command_queue.Queue](Type-mq3-renderer-command-queue-queue-686890311.md) — struct
<a id="constant-constant-mq3-renderer-command-queue-rc-draw-buffer-const-rc-draw-buffer-4-src-mq3-renderer-command-queue-ml-1774217801"></a>
### RC_DRAW_BUFFER

```ml
const RC_DRAW_BUFFER = 4
```

Render-command identifier that selects the graphics draw buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L18)

<a id="constant-constant-mq3-renderer-command-queue-rc-draw-surfs-const-rc-draw-surfs-3-src-mq3-renderer-command-queue-ml-1314790504"></a>
### RC_DRAW_SURFS

```ml
const RC_DRAW_SURFS = 3
```

Render-command identifier that submits the sorted scene surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L16)

<a id="constant-constant-mq3-renderer-command-queue-rc-end-of-list-const-rc-end-of-list-0-src-mq3-renderer-command-queue-ml-17046523"></a>
### RC_END_OF_LIST

```ml
const RC_END_OF_LIST = 0
```

Render-command sentinel that terminates the command stream.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L10)

<a id="constant-constant-mq3-renderer-command-queue-rc-screenshot-const-rc-screenshot-6-src-mq3-renderer-command-queue-ml-1962357575"></a>
### RC_SCREENSHOT

```ml
const RC_SCREENSHOT = 6
```

Render-command identifier that captures pixels from the framebuffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L22)

<a id="constant-constant-mq3-renderer-command-queue-rc-set-color-const-rc-set-color-1-src-mq3-renderer-command-queue-ml-1290255636"></a>
### RC_SET_COLOR

```ml
const RC_SET_COLOR = 1
```

Render-command identifier that changes the current two-dimensional modulation color.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L12)

<a id="constant-constant-mq3-renderer-command-queue-rc-stretch-pic-const-rc-stretch-pic-2-src-mq3-renderer-command-queue-ml-2147051969"></a>
### RC_STRETCH_PIC

```ml
const RC_STRETCH_PIC = 2
```

Render-command identifier that draws a textured two-dimensional rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L14)

<a id="constant-constant-mq3-renderer-command-queue-rc-swap-buffers-const-rc-swap-buffers-5-src-mq3-renderer-command-queue-ml-53166874"></a>
### RC_SWAP_BUFFERS

```ml
const RC_SWAP_BUFFERS = 5
```

Render-command identifier that presents the completed frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L20)

<a id="function-function-mq3-renderer-command-queue-reset-function-reset-queue-src-mq3-renderer-command-queue-ml-6368249"></a>
### reset

```ml
function reset(queue)
```

Updates `queue.commands`, `queue.used` in `mq3.renderer.command_queue.reset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Mutable record or buffer; this call updates `queue.commands`, `queue.used`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L296)

<a id="function-function-mq3-renderer-command-queue-services-function-services-src-mq3-renderer-command-queue-ml-1844326686"></a>
### services

```ml
function services()
```

Constructs `mq3.renderer.command_queue.Services` with `set2DFn` = `void`, `endSurfaceFn` = `void`, `beginSurfaceFn` = `void`, `quadFn` = `void` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L107)

- [mq3.renderer.command_queue.Services](Type-mq3-renderer-command-queue-services-505187096.md) — struct
<a id="constant-constant-mq3-renderer-command-queue-set-color-bytes-const-set-color-bytes-20-src-mq3-renderer-command-queue-ml-617904151"></a>
### SET_COLOR_BYTES

```ml
const SET_COLOR_BYTES = 20
```

Serialized byte size of the color-change command record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L28)

<a id="function-function-mq3-renderer-command-queue-setcolor-function-setcolor-queue-rgba-src-mq3-renderer-command-queue-ml-786405529"></a>
### setColor

```ml
function setColor(queue, rgba)
```

Queues four-component draw color, substituting opaque white when no color is supplied.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Record providing `queue.registered`. |
| `rgba` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L171)

<a id="function-function-mq3-renderer-command-queue-snapshot-function-snapshot-queue-src-mq3-renderer-command-queue-ml-1269096951"></a>
### snapshot

```ml
function snapshot(queue)
```

Updates `queue.commands` in `mq3.renderer.command_queue.snapshot`; returns `queue.commands`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Mutable record or buffer; this call updates `queue.commands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L124)

<a id="constant-constant-mq3-renderer-command-queue-stretch-pic-bytes-const-stretch-pic-bytes-40-src-mq3-renderer-command-queue-ml-304961577"></a>
### STRETCH_PIC_BYTES

```ml
const STRETCH_PIC_BYTES = 40
```

Serialized byte size of the textured-rectangle command record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L30)

<a id="function-function-mq3-renderer-command-queue-stretchpic-function-stretchpic-queue-x-y-w-h-s1-t1-s2-t2-shaderhandle-src-mq3-renderer-command-queue-ml-1461911122"></a>
### stretchPic

```ml
function stretchPic(queue, x, y, w, h, s1, t1, s2, t2, shaderHandle)
```

Calls `mq3.renderer.command_queue.stretchPicValues` with `(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Value forwarded as `queue` to `mq3.renderer.command_queue.stretchPicValues`. |
| `x` | `dynamic` | — | Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`. |
| `y` | `dynamic` | — | Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`. |
| `w` | `dynamic` | — | Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`. |
| `h` | `dynamic` | — | Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`. |
| `s1` | `dynamic` | — | Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`. |
| `t1` | `dynamic` | — | Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`. |
| `s2` | `dynamic` | — | Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`. |
| `t2` | `dynamic` | — | Input used in the result expression `stretchPicValues(queue,[x,y,w,h,s1,t1,s2,t2],shaderHandle)`. |
| `shaderHandle` | `dynamic` | — | Value forwarded as `shaderHandle` to `mq3.renderer.command_queue.stretchPicValues`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L200)

<a id="function-function-mq3-renderer-command-queue-stretchpicvalues-function-stretchpicvalues-queue-values-shaderhandle-src-mq3-renderer-command-queue-ml-1368773788"></a>
### stretchPicValues

```ml
function stretchPicValues(queue, values, shaderHandle)
```

Resolves the shader handle and queues a stretch-picture command with eight geometry/UV values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Record providing `queue.registered`, `queue.shaderFn`, `queue.shaderContext`. |
| `values` | `dynamic` | — | Value forwarded as `values` to `mq3.renderer.command_queue.append`. |
| `shaderHandle` | `dynamic` | — | Argument 2 supplied to `queue.shaderFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L182)

<a id="constant-constant-mq3-renderer-command-queue-swap-buffers-bytes-const-swap-buffers-bytes-4-src-mq3-renderer-command-queue-ml-2030612633"></a>
### SWAP_BUFFERS_BYTES

```ml
const SWAP_BUFFERS_BYTES = 4
```

Serialized byte size of the buffer-swap command record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L34)

<a id="function-function-mq3-renderer-command-queue-swapbuffers-function-swapbuffers-queue-src-mq3-renderer-command-queue-ml-1674074195"></a>
### swapBuffers

```ml
function swapBuffers(queue)
```

Returns `app` from `mq3.renderer.command_queue.swapBuffers`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Record providing `queue.registered`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/command_queue.ml#L212)
