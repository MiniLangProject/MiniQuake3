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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L17)

- [mq3.platform.win_snd.Dma](Type-mq3-platform-win-snd-dma-1319651473.md) — struct
<a id="constant-constant-mq3-platform-win-snd-ds-ok-const-ds-ok-0-src-mq3-platform-win-snd-ml-545047775"></a>
### DS_OK

```ml
const DS_OK = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L7)

<a id="constant-constant-mq3-platform-win-snd-dserr-bufferlost-const-dserr-bufferlost-1-src-mq3-platform-win-snd-ml-1887160487"></a>
### DSERR_BUFFERLOST

```ml
const DSERR_BUFFERLOST = -1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L8)

<a id="constant-constant-mq3-platform-win-snd-dserr-invalidcall-const-dserr-invalidcall-2-src-mq3-platform-win-snd-ml-1832856686"></a>
### DSERR_INVALIDCALL

```ml
const DSERR_INVALIDCALL = -2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L9)

<a id="constant-constant-mq3-platform-win-snd-dserr-invalidparam-const-dserr-invalidparam-3-src-mq3-platform-win-snd-ml-195156217"></a>
### DSERR_INVALIDPARAM

```ml
const DSERR_INVALIDPARAM = -3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L10)

<a id="constant-constant-mq3-platform-win-snd-dserr-priolevelneeded-const-dserr-priolevelneeded-4-src-mq3-platform-win-snd-ml-1178081852"></a>
### DSERR_PRIOLEVELNEEDED

```ml
const DSERR_PRIOLEVELNEEDED = -4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L11)

<a id="function-function-mq3-platform-win-snd-dsounderror-function-dsounderror-errorcode-src-mq3-platform-win-snd-ml-1144145143"></a>
### DSoundError

```ml
function DSoundError(errorCode)
```

DSoundError

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `errorCode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L25)

<a id="function-function-mq3-platform-win-snd-emit-function-emit-state-kind-size-src-mq3-platform-win-snd-ml-128511746"></a>
### emit

```ml
function emit(state, kind, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L20)

<a id="function-function-mq3-platform-win-snd-fail-function-fail-state-text-src-mq3-platform-win-snd-ml-2056765982"></a>
### fail

```ml
function fail(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L22)

<a id="function-function-mq3-platform-win-snd-note-function-note-state-text-src-mq3-platform-win-snd-ml-1036505786"></a>
### note

```ml
function note(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L21)

<a id="constant-constant-mq3-platform-win-snd-secondary-buffer-size-const-secondary-buffer-size-65536-src-mq3-platform-win-snd-ml-1888402042"></a>
### SECONDARY_BUFFER_SIZE

```ml
const SECONDARY_BUFFER_SIZE = 65536
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L6)

<a id="function-function-mq3-platform-win-snd-snddma-activate-function-snddma-activate-state-priorityok-src-mq3-platform-win-snd-ml-2007488443"></a>
### SNDDMA_Activate

```ml
function SNDDMA_Activate(state, priorityOk)
```

SNDDMA_Activate

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `priorityOk` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L107)

<a id="function-function-mq3-platform-win-snd-snddma-beginpainting-function-snddma-beginpainting-state-statusok-restoreok-restartok-lockresults-src-mq3-platform-win-snd-ml-306999995"></a>
### SNDDMA_BeginPainting

```ml
function SNDDMA_BeginPainting(state, statusOk, restoreOk, restartOk, lockResults)
```

SNDDMA_BeginPainting

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `statusOk` | `dynamic` | — |  |
| `restoreOk` | `dynamic` | — |  |
| `restartOk` | `dynamic` | — |  |
| `lockResults` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L85)

<a id="function-function-mq3-platform-win-snd-snddma-getdmapos-function-snddma-getdmapos-state-readcursor-src-mq3-platform-win-snd-ml-297862213"></a>
### SNDDMA_GetDMAPos

```ml
function SNDDMA_GetDMAPos(state, readCursor)
```

SNDDMA_GetDMAPos (the inventory extractor calls this candidate `position`).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `readCursor` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L79)

<a id="function-function-mq3-platform-win-snd-snddma-init-function-snddma-init-state-use8available-legacyavailable-priorityok-hardwarebufferok-softwarebufferok-playok-capsok-returnedbufferbytes-src-mq3-platform-win-snd-ml-107340929"></a>
### SNDDMA_Init

```ml
function SNDDMA_Init(state, use8Available, legacyAvailable, priorityOk, hardwareBufferOk, softwareBufferOk, playOk, capsOk, returnedBufferBytes)
```

SNDDMA_Init

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `use8Available` | `dynamic` | — |  |
| `legacyAvailable` | `dynamic` | — |  |
| `priorityOk` | `dynamic` | — |  |
| `hardwareBufferOk` | `dynamic` | — |  |
| `softwareBufferOk` | `dynamic` | — |  |
| `playOk` | `dynamic` | — |  |
| `capsOk` | `dynamic` | — |  |
| `returnedBufferBytes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L72)

<a id="function-function-mq3-platform-win-snd-snddma-initds-function-snddma-initds-state-use8available-legacyavailable-priorityok-hardwarebufferok-softwarebufferok-playok-capsok-returnedbufferbytes-src-mq3-platform-win-snd-ml-1005421347"></a>
### SNDDMA_InitDS

```ml
function SNDDMA_InitDS(state, use8Available, legacyAvailable, priorityOk, hardwareBufferOk, softwareBufferOk, playOk, capsOk, returnedBufferBytes)
```

SNDDMA_InitDS. Capability results are supplied by the Win32 host adapter.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `use8Available` | `dynamic` | — |  |
| `legacyAvailable` | `dynamic` | — |  |
| `priorityOk` | `dynamic` | — |  |
| `hardwareBufferOk` | `dynamic` | — |  |
| `softwareBufferOk` | `dynamic` | — |  |
| `playOk` | `dynamic` | — |  |
| `capsOk` | `dynamic` | — |  |
| `returnedBufferBytes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L47)

<a id="function-function-mq3-platform-win-snd-snddma-shutdown-function-snddma-shutdown-state-src-mq3-platform-win-snd-ml-89185051"></a>
### SNDDMA_Shutdown

```ml
function SNDDMA_Shutdown(state)
```

SNDDMA_Shutdown

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L34)

<a id="function-function-mq3-platform-win-snd-snddma-submit-function-snddma-submit-state-src-mq3-platform-win-snd-ml-1150572223"></a>
### SNDDMA_Submit

```ml
function SNDDMA_Submit(state)
```

SNDDMA_Submit

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_snd.ml#L101)

- [mq3.platform.win_snd.State](Type-mq3-platform-win-snd-state-402888614.md) — struct
