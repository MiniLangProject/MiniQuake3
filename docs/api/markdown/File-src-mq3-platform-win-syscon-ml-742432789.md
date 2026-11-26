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

Native console command identifier for clearing the displayed text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L11)

<a id="function-function-mq3-platform-win-syscon-conbuf-appendtext-function-conbuf-appendtext-state-message-src-mq3-platform-win-syscon-ml-1603289652"></a>
### Conbuf_AppendText

```ml
function Conbuf_AppendText(state, message)
```

Conbuf_AppendText

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.totalChars`, `state.displayText`. |
| `message` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L112)

<a id="constant-constant-mq3-platform-win-syscon-console-buffer-size-const-console-buffer-size-16384-src-mq3-platform-win-syscon-ml-1774137357"></a>
### CONSOLE_BUFFER_SIZE

```ml
const CONSOLE_BUFFER_SIZE = 16384
```

Character capacity of the native console text buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L19)

<a id="function-function-mq3-platform-win-syscon-conwndproc-function-conwndproc-state-message-value-minimized-src-mq3-platform-win-syscon-ml-1879140121"></a>
### ConWndProc

```ml
function ConWndProc(state, message, value, minimized)
```

ConWndProc. This preserves every state-changing branch of the Win32 callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.viewlog`, `state.displayText`, `state.timePolarity`. |
| `message` | `dynamic` | — | Input tested by `message=="activate"`. |
| `value` | `dynamic` | — | Input tested by `message=="activate"`. |
| `minimized` | `dynamic` | — | Input tested by `state.viewlog==1 and minimized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L144)

<a id="constant-constant-mq3-platform-win-syscon-copy-id-const-copy-id-1-src-mq3-platform-win-syscon-ml-1445440380"></a>
### COPY_ID

```ml
const COPY_ID = 1
```

Native console command identifier for copying selected text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L7)

<a id="function-function-mq3-platform-win-syscon-copylimit-function-copylimit-text-count-src-mq3-platform-win-syscon-ml-1347933486"></a>
### copyLimit

```ml
function copyLimit(text, count)
```

Returns `decode(raw)` from `mq3.platform.win_syscon.copyLimit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 supplied to `bytes`. |
| `count` | `dynamic` | — | Argument 3 supplied to `slice`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L81)

<a id="function-function-mq3-platform-win-syscon-create-function-create-retailactive-src-mq3-platform-win-syscon-ml-1702136199"></a>
### create

```ml
function create(retailActive)
```

Constructs `mq3.platform.win_syscon.State` with `created` = `false`, `visLevel` = `0`, `quitOnClose` = `false`, `consoleText` = `""` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `retailActive` | `dynamic` | — | Initial value for `mq3.platform.win_syscon.State.retailActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L70)

<a id="function-function-mq3-platform-win-syscon-emit-function-emit-state-boundary-kind-text-value-src-mq3-platform-win-syscon-ml-1978328349"></a>
### emit

```ml
function emit(state, boundary, kind, text, value)
```

Updates `state.actions` in `mq3.platform.win_syscon.emit`; returns `action`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.actions`. |
| `boundary` | `dynamic` | — | Value used for `mq3.platform.win_syscon.Action.boundary`. |
| `kind` | `dynamic` | — | Value used for `mq3.platform.win_syscon.Action.kind`. |
| `text` | `dynamic` | — | Value used for `mq3.platform.win_syscon.Action.text`. |
| `value` | `dynamic` | — | Value used for `mq3.platform.win_syscon.Action.value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L77)

<a id="function-function-mq3-platform-win-syscon-inputlinewndproc-function-inputlinewndproc-state-message-value-focustarget-src-mq3-platform-win-syscon-ml-761940832"></a>
### InputLineWndProc

```ml
function InputLineWndProc(state, message, value, focusTarget)
```

InputLineWndProc. Message names model WM_KILLFOCUS and WM_CHAR.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.consoleText`. |
| `message` | `dynamic` | — | Input tested by `message=="killfocus" and (focusTarget=="console" or focusTarget=="error")`. |
| `value` | `dynamic` | — | Input tested by `message=="char" and value==13`. |
| `focusTarget` | `dynamic` | — | Value forwarded as `text` to `mq3.platform.win_syscon.copyLimit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L134)

<a id="function-function-mq3-platform-win-syscon-iscolor-function-iscolor-raw-index-src-mq3-platform-win-syscon-ml-261256870"></a>
### isColor

```ml
function isColor(raw, index)
```

Computes `index+1<len(raw) and raw[index]==94 and raw[index+1]!=94` for `mq3.platform.win_syscon.isColor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `raw` | `dynamic` | — | Indexed input read at `index`, `index+1`. |
| `index` | `dynamic` | — | Input used in the result expression `index+1<len(raw) and raw[index]==94 and raw[index+1]!=94`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L85)

<a id="constant-constant-mq3-platform-win-syscon-quit-id-const-quit-id-2-src-mq3-platform-win-syscon-ml-1048058207"></a>
### QUIT_ID

```ml
const QUIT_ID = 2
```

Native console command identifier for requesting application shutdown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L9)

- [mq3.platform.win_syscon.State](Type-mq3-platform-win-syscon-state-880075106.md) — struct
<a id="function-function-mq3-platform-win-syscon-sys-consoleinput-function-sys-consoleinput-state-src-mq3-platform-win-syscon-ml-979616869"></a>
### Sys_ConsoleInput

```ml
function Sys_ConsoleInput(state)
```

Sys_ConsoleInput

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.returnedText`, `state.consoleText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L107)

<a id="function-function-mq3-platform-win-syscon-sys-createconsole-function-sys-createconsole-state-registerok-windowok-src-mq3-platform-win-syscon-ml-1163065750"></a>
### Sys_CreateConsole

```ml
function Sys_CreateConsole(state, registerOk, windowOk)
```

Sys_CreateConsole

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.created`, `state.hasInput`, `state.visLevel`. |
| `registerOk` | `dynamic` | — | Input tested by `not registerOk or not windowOk`. |
| `windowOk` | `dynamic` | — | Input tested by `not registerOk or not windowOk`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L91)

<a id="function-function-mq3-platform-win-syscon-sys-destroyconsole-function-sys-destroyconsole-state-src-mq3-platform-win-syscon-ml-528470061"></a>
### Sys_DestroyConsole

```ml
function Sys_DestroyConsole(state)
```

Sys_DestroyConsole

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.created`, `state.hasInput`, `state.hasError`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L96)

<a id="function-function-mq3-platform-win-syscon-sys-seterrortext-function-sys-seterrortext-state-text-src-mq3-platform-win-syscon-ml-105669078"></a>
### Sys_SetErrorText

```ml
function Sys_SetErrorText(state, text)
```

Sys_SetErrorText

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.errorString`, `state.hasError`, `state.hasInput`. |
| `text` | `dynamic` | — | Value forwarded as `text` to `mq3.platform.win_syscon.copyLimit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L127)

<a id="function-function-mq3-platform-win-syscon-sys-showconsole-function-sys-showconsole-state-vislevel-quitonclose-src-mq3-platform-win-syscon-ml-1110609491"></a>
### Sys_ShowConsole

```ml
function Sys_ShowConsole(state, visLevel, quitOnClose)
```

Sys_ShowConsole

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.quitOnClose`, `state.visLevel`. |
| `visLevel` | `dynamic` | — | Value assigned to `state.visLevel`. |
| `quitOnClose` | `dynamic` | — | Value assigned to `state.quitOnClose`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L101)

<a id="constant-constant-mq3-platform-win-syscon-vis-hidden-const-vis-hidden-0-src-mq3-platform-win-syscon-ml-2014853521"></a>
### VIS_HIDDEN

```ml
const VIS_HIDDEN = 0
```

Console visibility state that hides the native window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L13)

<a id="constant-constant-mq3-platform-win-syscon-vis-minimized-const-vis-minimized-2-src-mq3-platform-win-syscon-ml-906269895"></a>
### VIS_MINIMIZED

```ml
const VIS_MINIMIZED = 2
```

Console visibility state that minimizes the native window.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L17)

<a id="constant-constant-mq3-platform-win-syscon-vis-normal-const-vis-normal-1-src-mq3-platform-win-syscon-ml-1565719194"></a>
### VIS_NORMAL

```ml
const VIS_NORMAL = 1
```

Console visibility state that shows the native window normally.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_syscon.ml#L15)
