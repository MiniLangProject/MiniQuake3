# `src/mq3/platform/win_snd.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.win_snd`](Package-mq3-platform-win-snd-1791938713.md)

Reachable from entry: **no**

## Declarations

- [mq3.platform.win_snd.Action](Type-mq3-platform-win-snd-action-408263119.md) — struct
<a id="function-function-mq3-platform-win-snd-create-function-create-retailactive-src-mq3-platform-win-snd-ml-1357906961"></a>
### create

```ml
function create(retailActive)
```

Constructs `mq3.platform.win_snd.State` with `dsoundInit` = `false`, `sample16` = `0`, `sndBufSize` = `0`, `lockSize` = `0` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Initial value for `mq3.platform.win_snd.State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L85)

- [mq3.platform.win_snd.Dma](Type-mq3-platform-win-snd-dma-1319651473.md) — struct
<a id="constant-constant-mq3-platform-win-snd-ds-ok-const-ds-ok-0-src-mq3-platform-win-snd-ml-545047775"></a>
### DS_OK

```ml
const DS_OK = 0
```

DirectSound result code indicating success.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L9)

<a id="constant-constant-mq3-platform-win-snd-dserr-bufferlost-const-dserr-bufferlost-1-src-mq3-platform-win-snd-ml-1887160487"></a>
### DSERR_BUFFERLOST

```ml
const DSERR_BUFFERLOST = -1
```

DirectSound error indicating that the playback buffer must be restored.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L11)

<a id="constant-constant-mq3-platform-win-snd-dserr-invalidcall-const-dserr-invalidcall-2-src-mq3-platform-win-snd-ml-1832856686"></a>
### DSERR_INVALIDCALL

```ml
const DSERR_INVALIDCALL = -2
```

DirectSound error indicating that an operation is invalid in the current state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L13)

<a id="constant-constant-mq3-platform-win-snd-dserr-invalidparam-const-dserr-invalidparam-3-src-mq3-platform-win-snd-ml-195156217"></a>
### DSERR_INVALIDPARAM

```ml
const DSERR_INVALIDPARAM = -3
```

DirectSound error indicating an invalid parameter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L15)

<a id="constant-constant-mq3-platform-win-snd-dserr-priolevelneeded-const-dserr-priolevelneeded-4-src-mq3-platform-win-snd-ml-1178081852"></a>
### DSERR_PRIOLEVELNEEDED

```ml
const DSERR_PRIOLEVELNEEDED = -4
```

DirectSound error indicating that the requested cooperative priority level is required.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L17)

<a id="function-function-mq3-platform-win-snd-dsounderror-function-dsounderror-errorcode-src-mq3-platform-win-snd-ml-1144145143"></a>
### DSoundError

```ml
function DSoundError(errorCode)
```

DSoundError

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `errorCode` | `dynamic` | — | Input tested by `errorCode==DSERR_BUFFERLOST`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L104)

<a id="function-function-mq3-platform-win-snd-emit-function-emit-state-kind-size-src-mq3-platform-win-snd-ml-128511746"></a>
### emit

```ml
function emit(state, kind, size)
```

Updates `state.actions` in `mq3.platform.win_snd.emit`; returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.actions`. |
| `kind` | `dynamic` | — | Value used for `mq3.platform.win_snd.Action.kind`. |
| `size` | `dynamic` | — | Value used for `mq3.platform.win_snd.Action.size`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L92)

<a id="function-function-mq3-platform-win-snd-fail-function-fail-state-text-src-mq3-platform-win-snd-ml-2056765982"></a>
### fail

```ml
function fail(state, text)
```

Updates `state.errors` in `mq3.platform.win_snd.fail`; returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.errors`. |
| `text` | `dynamic` | — | Input used by `state.errors=state.errors+[text]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L100)

<a id="function-function-mq3-platform-win-snd-note-function-note-state-text-src-mq3-platform-win-snd-ml-1036505786"></a>
### note

```ml
function note(state, text)
```

Updates `state.prints` in `mq3.platform.win_snd.note`; returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.prints`. |
| `text` | `dynamic` | — | Input used by `state.prints=state.prints+[text]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L96)

<a id="constant-constant-mq3-platform-win-snd-secondary-buffer-size-const-secondary-buffer-size-65536-src-mq3-platform-win-snd-ml-1888402042"></a>
### SECONDARY_BUFFER_SIZE

```ml
const SECONDARY_BUFFER_SIZE = 65536
```

Byte capacity of the DirectSound secondary playback buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L7)

<a id="function-function-mq3-platform-win-snd-snddma-activate-function-snddma-activate-state-priorityok-src-mq3-platform-win-snd-ml-2007488443"></a>
### SNDDMA_Activate

```ml
function SNDDMA_Activate(state, priorityOk)
```

SNDDMA_Activate

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.hasDS`. |
| `priorityOk` | `dynamic` | — | Input tested by `not priorityOk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L215)

<a id="function-function-mq3-platform-win-snd-snddma-beginpainting-function-snddma-beginpainting-state-statusok-restoreok-restartok-lockresults-src-mq3-platform-win-snd-ml-306999995"></a>
### SNDDMA_BeginPainting

```ml
function SNDDMA_BeginPainting(state, statusOk, restoreOk, restartOk, lockResults)
```

SNDDMA_BeginPainting

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.bufferLost`, `state.playing`, `state.dma.bufferValid`, `state.bufferLocked`, `state.lockSize`. |
| `statusOk` | `dynamic` | — | Input tested by `not statusOk`. |
| `restoreOk` | `dynamic` | — | Input tested by `state.bufferLost`. |
| `restartOk` | `dynamic` | — | Input tested by `not state.playing`. |
| `lockResults` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L190)

<a id="function-function-mq3-platform-win-snd-snddma-getdmapos-function-snddma-getdmapos-state-readcursor-src-mq3-platform-win-snd-ml-297862213"></a>
### SNDDMA_GetDMAPos

```ml
function SNDDMA_GetDMAPos(state, readCursor)
```

SNDDMA_GetDMAPos (the inventory extractor calls this candidate `position`).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.dsoundInit`, `state.sample16`, `state.dma`. |
| `readCursor` | `dynamic` | — | Input used in the result expression `(readCursor>>state.sample16)&(state.dma.samples-1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L179)

<a id="function-function-mq3-platform-win-snd-snddma-init-function-snddma-init-state-use8available-legacyavailable-priorityok-hardwarebufferok-softwarebufferok-playok-capsok-returnedbufferbytes-src-mq3-platform-win-snd-ml-107340929"></a>
### SNDDMA_Init

```ml
function SNDDMA_Init(state, use8Available, legacyAvailable, priorityOk, hardwareBufferOk, softwareBufferOk, playOk, capsOk, returnedBufferBytes)
```

SNDDMA_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.dma`, `state.dsoundInit`, `state.coInitialized`. |
| `use8Available` | `dynamic` | — | Value forwarded as `use8Available` to `mq3.platform.win_snd.SNDDMA_InitDS`. |
| `legacyAvailable` | `dynamic` | — | Value forwarded as `legacyAvailable` to `mq3.platform.win_snd.SNDDMA_InitDS`. |
| `priorityOk` | `dynamic` | — | Value forwarded as `priorityOk` to `mq3.platform.win_snd.SNDDMA_InitDS`. |
| `hardwareBufferOk` | `dynamic` | — | Value forwarded as `hardwareBufferOk` to `mq3.platform.win_snd.SNDDMA_InitDS`. |
| `softwareBufferOk` | `dynamic` | — | Value forwarded as `softwareBufferOk` to `mq3.platform.win_snd.SNDDMA_InitDS`. |
| `playOk` | `dynamic` | — | Value forwarded as `playOk` to `mq3.platform.win_snd.SNDDMA_InitDS`. |
| `capsOk` | `dynamic` | — | Value forwarded as `capsOk` to `mq3.platform.win_snd.SNDDMA_InitDS`. |
| `returnedBufferBytes` | `dynamic` | — | Value forwarded as `returnedBufferBytes` to `mq3.platform.win_snd.SNDDMA_InitDS`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L170)

<a id="function-function-mq3-platform-win-snd-snddma-initds-function-snddma-initds-state-use8available-legacyavailable-priorityok-hardwarebufferok-softwarebufferok-playok-capsok-returnedbufferbytes-src-mq3-platform-win-snd-ml-1005421347"></a>
### SNDDMA_InitDS

```ml
function SNDDMA_InitDS(state, use8Available, legacyAvailable, priorityOk, hardwareBufferOk, softwareBufferOk, playOk, capsOk, returnedBufferBytes)
```

SNDDMA_InitDS. Capability results are supplied by the Win32 host adapter.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.hasDS`, `state.dma.channels`, `state.dma.samplebits`, `state.dma.speed`, `state.hasPrimary`. |
| `use8Available` | `dynamic` | — | Input used by `use8=use8Available`. |
| `legacyAvailable` | `dynamic` | — | Input tested by `not use8Available and not legacyAvailable`. |
| `priorityOk` | `dynamic` | — | Input tested by `not priorityOk`. |
| `hardwareBufferOk` | `dynamic` | — | Input tested by `hardwareBufferOk`. |
| `softwareBufferOk` | `dynamic` | — | Input tested by `not softwareBufferOk`. |
| `playOk` | `dynamic` | — | Input tested by `not playOk`. |
| `capsOk` | `dynamic` | — | Input tested by `not capsOk`. |
| `returnedBufferBytes` | `dynamic` | — | Value assigned to `state.sndBufSize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L136)

<a id="function-function-mq3-platform-win-snd-snddma-shutdown-function-snddma-shutdown-state-src-mq3-platform-win-snd-ml-89185051"></a>
### SNDDMA_Shutdown

```ml
function SNDDMA_Shutdown(state)
```

SNDDMA_Shutdown

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.hasDS`, `state.hasDSBuf`, `state.hasPrimary`, `state.dllLoaded`, `state.dsoundInit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L114)

<a id="function-function-mq3-platform-win-snd-snddma-submit-function-snddma-submit-state-src-mq3-platform-win-snd-ml-1150572223"></a>
### SNDDMA_Submit

```ml
function SNDDMA_Submit(state)
```

SNDDMA_Submit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.bufferLocked`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_snd.ml#L207)

- [mq3.platform.win_snd.State](Type-mq3-platform-win-snd-state-402888614.md) — struct
