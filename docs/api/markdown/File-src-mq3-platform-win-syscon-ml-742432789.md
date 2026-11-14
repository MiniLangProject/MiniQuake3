# `src/mq3/platform/win_syscon.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.win_syscon`](Package-mq3-platform-win-syscon-994983141.md)

Reachable from entry: **no**

## Declarations

- [mq3.platform.win_syscon.Action](Type-mq3-platform-win-syscon-action-2030011907.md) — struct
<a id="constant-constant-mq3-platform-win-syscon-clear-id-const-clear-id-3-src-mq3-platform-win-syscon-ml-784799142"></a>
### CLEAR_ID

```ml
const CLEAR_ID = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L8)

<a id="function-function-mq3-platform-win-syscon-conbuf-appendtext-function-conbuf-appendtext-state-message-src-mq3-platform-win-syscon-ml-1603289652"></a>
### Conbuf_AppendText

```ml
function Conbuf_AppendText(state, message)
```

Conbuf_AppendText

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L37)

<a id="constant-constant-mq3-platform-win-syscon-console-buffer-size-const-console-buffer-size-16384-src-mq3-platform-win-syscon-ml-1774137357"></a>
### CONSOLE_BUFFER_SIZE

```ml
const CONSOLE_BUFFER_SIZE = 16384
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L12)

<a id="function-function-mq3-platform-win-syscon-conwndproc-function-conwndproc-state-message-value-minimized-src-mq3-platform-win-syscon-ml-1879140121"></a>
### ConWndProc

```ml
function ConWndProc(state, message, value, minimized)
```

ConWndProc. This preserves every state-changing branch of the Win32 callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `minimized` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L59)

<a id="constant-constant-mq3-platform-win-syscon-copy-id-const-copy-id-1-src-mq3-platform-win-syscon-ml-1445440380"></a>
### COPY_ID

```ml
const COPY_ID = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L6)

<a id="function-function-mq3-platform-win-syscon-copylimit-function-copylimit-text-count-src-mq3-platform-win-syscon-ml-1347933486"></a>
### copyLimit

```ml
function copyLimit(text, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L19)

<a id="function-function-mq3-platform-win-syscon-create-function-create-retailactive-src-mq3-platform-win-syscon-ml-1702136199"></a>
### create

```ml
function create(retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L17)

<a id="function-function-mq3-platform-win-syscon-emit-function-emit-state-boundary-kind-text-value-src-mq3-platform-win-syscon-ml-1978328349"></a>
### emit

```ml
function emit(state, boundary, kind, text, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L18)

<a id="function-function-mq3-platform-win-syscon-inputlinewndproc-function-inputlinewndproc-state-message-value-focustarget-src-mq3-platform-win-syscon-ml-761940832"></a>
### InputLineWndProc

```ml
function InputLineWndProc(state, message, value, focusTarget)
```

InputLineWndProc. Message names model WM_KILLFOCUS and WM_CHAR.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `focusTarget` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L53)

<a id="function-function-mq3-platform-win-syscon-iscolor-function-iscolor-raw-index-src-mq3-platform-win-syscon-ml-261256870"></a>
### isColor

```ml
function isColor(raw, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `raw` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L20)

<a id="constant-constant-mq3-platform-win-syscon-quit-id-const-quit-id-2-src-mq3-platform-win-syscon-ml-1048058207"></a>
### QUIT_ID

```ml
const QUIT_ID = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L7)

- [mq3.platform.win_syscon.State](Type-mq3-platform-win-syscon-state-880075106.md) — struct
<a id="function-function-mq3-platform-win-syscon-sys-consoleinput-function-sys-consoleinput-state-src-mq3-platform-win-syscon-ml-979616869"></a>
### Sys_ConsoleInput

```ml
function Sys_ConsoleInput(state)
```

Sys_ConsoleInput

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L34)

<a id="function-function-mq3-platform-win-syscon-sys-createconsole-function-sys-createconsole-state-registerok-windowok-src-mq3-platform-win-syscon-ml-1163065750"></a>
### Sys_CreateConsole

```ml
function Sys_CreateConsole(state, registerOk, windowOk)
```

Sys_CreateConsole

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `registerOk` | `dynamic` | — |  |
| `windowOk` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L23)

<a id="function-function-mq3-platform-win-syscon-sys-destroyconsole-function-sys-destroyconsole-state-src-mq3-platform-win-syscon-ml-528470061"></a>
### Sys_DestroyConsole

```ml
function Sys_DestroyConsole(state)
```

Sys_DestroyConsole

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L27)

<a id="function-function-mq3-platform-win-syscon-sys-seterrortext-function-sys-seterrortext-state-text-src-mq3-platform-win-syscon-ml-105669078"></a>
### Sys_SetErrorText

```ml
function Sys_SetErrorText(state, text)
```

Sys_SetErrorText

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L50)

<a id="function-function-mq3-platform-win-syscon-sys-showconsole-function-sys-showconsole-state-vislevel-quitonclose-src-mq3-platform-win-syscon-ml-1110609491"></a>
### Sys_ShowConsole

```ml
function Sys_ShowConsole(state, visLevel, quitOnClose)
```

Sys_ShowConsole

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `visLevel` | `dynamic` | — |  |
| `quitOnClose` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L29)

<a id="constant-constant-mq3-platform-win-syscon-vis-hidden-const-vis-hidden-0-src-mq3-platform-win-syscon-ml-2014853521"></a>
### VIS_HIDDEN

```ml
const VIS_HIDDEN = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L9)

<a id="constant-constant-mq3-platform-win-syscon-vis-minimized-const-vis-minimized-2-src-mq3-platform-win-syscon-ml-906269895"></a>
### VIS_MINIMIZED

```ml
const VIS_MINIMIZED = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L11)

<a id="constant-constant-mq3-platform-win-syscon-vis-normal-const-vis-normal-1-src-mq3-platform-win-syscon-ml-1565719194"></a>
### VIS_NORMAL

```ml
const VIS_NORMAL = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/win_syscon.ml#L10)
