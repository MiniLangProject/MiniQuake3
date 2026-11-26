# `src/mq3/platform/null_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.null_runtime`](Package-mq3-platform-null-runtime-709793991.md)

Reachable from entry: **no**

## Declarations

- [mq3.platform.null_runtime.Address](Type-mq3-platform-null-runtime-address-1493385257.md) — struct
<a id="function-function-mq3-platform-null-runtime-cl-cddialog-function-cl-cddialog-state-src-mq3-platform-null-runtime-ml-851922971"></a>
### CL_CDDialog

```ml
function CL_CDDialog(state)
```

Returns `void` for the `mq3.platform.null_runtime.CL_CDDialog` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L104)

<a id="function-function-mq3-platform-null-runtime-cl-cdkeyvalidate-function-cl-cdkeyvalidate-key-checksum-src-mq3-platform-null-runtime-ml-420314408"></a>
### CL_CDKeyValidate

```ml
function CL_CDKeyValidate(key, checksum)
```

Returns `true` for the `mq3.platform.null_runtime.CL_CDKeyValidate` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `checksum` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L56)

<a id="function-function-mq3-platform-null-runtime-cl-charevent-function-cl-charevent-state-key-src-mq3-platform-null-runtime-ml-1058630898"></a>
### CL_CharEvent

```ml
function CL_CharEvent(state, key)
```

Returns `void` for the `mq3.platform.null_runtime.CL_CharEvent` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `key` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L69)

<a id="function-function-mq3-platform-null-runtime-cl-consoleprint-function-cl-consoleprint-state-text-src-mq3-platform-null-runtime-ml-1316280094"></a>
### CL_ConsolePrint

```ml
function CL_ConsolePrint(state, text)
```

Updates `state.consoleText` in `mq3.platform.null_runtime.CL_ConsolePrint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.consoleText`. |
| `text` | `dynamic` | — | Input used by `state.consoleText=state.consoleText+text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L60)

<a id="function-function-mq3-platform-null-runtime-cl-disconnect-function-cl-disconnect-state-showmainmenu-src-mq3-platform-null-runtime-ml-946229586"></a>
### CL_Disconnect

```ml
function CL_Disconnect(state, showMainMenu)
```

Returns `void` for the `mq3.platform.null_runtime.CL_Disconnect` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `showMainMenu` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L73)

<a id="function-function-mq3-platform-null-runtime-cl-flushmemory-function-cl-flushmemory-state-src-mq3-platform-null-runtime-ml-1431977169"></a>
### CL_FlushMemory

```ml
function CL_FlushMemory(state)
```

Returns `void` for the `mq3.platform.null_runtime.CL_FlushMemory` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L107)

<a id="function-function-mq3-platform-null-runtime-cl-forwardcommandtoserver-function-cl-forwardcommandtoserver-state-text-src-mq3-platform-null-runtime-ml-1265795814"></a>
### CL_ForwardCommandToServer

```ml
function CL_ForwardCommandToServer(state, text)
```

Returns `void` for the `mq3.platform.null_runtime.CL_ForwardCommandToServer` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `text` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L98)

<a id="function-function-mq3-platform-null-runtime-cl-frame-function-cl-frame-state-msec-src-mq3-platform-null-runtime-ml-1032731153"></a>
### CL_Frame

```ml
function CL_Frame(state, msec)
```

Updates `state.frames` in `mq3.platform.null_runtime.CL_Frame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.frames`. |
| `msec` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L46)

<a id="function-function-mq3-platform-null-runtime-cl-gamecommand-function-cl-gamecommand-state-src-mq3-platform-null-runtime-ml-316130337"></a>
### CL_GameCommand

```ml
function CL_GameCommand(state)
```

Returns `false` for the `mq3.platform.null_runtime.CL_GameCommand` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L49)

<a id="function-function-mq3-platform-null-runtime-cl-init-function-cl-init-state-src-mq3-platform-null-runtime-ml-1476503425"></a>
### CL_Init

```ml
function CL_Init(state)
```

Updates `state.clientInitialized` in `mq3.platform.null_runtime.CL_Init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.clientInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L36)

<a id="function-function-mq3-platform-null-runtime-cl-initkeycommands-function-cl-initkeycommands-state-src-mq3-platform-null-runtime-ml-790922033"></a>
### CL_InitKeyCommands

```ml
function CL_InitKeyCommands(state)
```

Returns `void` for the `mq3.platform.null_runtime.CL_InitKeyCommands` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L101)

<a id="function-function-mq3-platform-null-runtime-cl-joystickevent-function-cl-joystickevent-state-axis-value-time-src-mq3-platform-null-runtime-ml-180179118"></a>
### CL_JoystickEvent

```ml
function CL_JoystickEvent(state, axis, value, time)
```

Returns `void` for the `mq3.platform.null_runtime.CL_JoystickEvent` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `axis` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `value` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `time` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L94)

<a id="function-function-mq3-platform-null-runtime-cl-keyevent-function-cl-keyevent-state-key-down-time-src-mq3-platform-null-runtime-ml-410432505"></a>
### CL_KeyEvent

```ml
function CL_KeyEvent(state, key, down, time)
```

Returns `void` for the `mq3.platform.null_runtime.CL_KeyEvent` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `key` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `down` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `time` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L82)

<a id="function-function-mq3-platform-null-runtime-cl-maploading-function-cl-maploading-state-src-mq3-platform-null-runtime-ml-1812597065"></a>
### CL_MapLoading

```ml
function CL_MapLoading(state)
```

Returns `void` for the `mq3.platform.null_runtime.CL_MapLoading` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L76)

<a id="function-function-mq3-platform-null-runtime-cl-mouseevent-function-cl-mouseevent-state-dx-dy-time-src-mq3-platform-null-runtime-ml-628105765"></a>
### CL_MouseEvent

```ml
function CL_MouseEvent(state, dx, dy, time)
```

Returns `void` for the `mq3.platform.null_runtime.CL_MouseEvent` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `dx` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `dy` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `time` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L88)

<a id="function-function-mq3-platform-null-runtime-cl-packetevent-function-cl-packetevent-state-source-message-src-mq3-platform-null-runtime-ml-1747412805"></a>
### CL_PacketEvent

```ml
function CL_PacketEvent(state, source, message)
```

Returns `void` for the `mq3.platform.null_runtime.CL_PacketEvent` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `source` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `message` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L65)

<a id="function-function-mq3-platform-null-runtime-cl-shutdown-function-cl-shutdown-state-src-mq3-platform-null-runtime-ml-1653480189"></a>
### CL_Shutdown

```ml
function CL_Shutdown(state)
```

Updates `state.clientInitialized` in `mq3.platform.null_runtime.CL_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.clientInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L39)

<a id="function-function-mq3-platform-null-runtime-cl-shutdownall-function-cl-shutdownall-state-src-mq3-platform-null-runtime-ml-1244749521"></a>
### CL_ShutdownAll

```ml
function CL_ShutdownAll(state)
```

Calls `mq3.platform.null_runtime.CL_Shutdown` with `(state)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.platform.null_runtime.CL_Shutdown`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L42)

<a id="function-function-mq3-platform-null-runtime-cl-starthunkusers-function-cl-starthunkusers-state-src-mq3-platform-null-runtime-ml-1856709453"></a>
### CL_StartHunkUsers

```ml
function CL_StartHunkUsers(state)
```

Returns `void` for the `mq3.platform.null_runtime.CL_StartHunkUsers` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L110)

<a id="function-function-mq3-platform-null-runtime-create-function-create-src-mq3-platform-null-runtime-ml-660297822"></a>
### create

```ml
function create()
```

Constructs `mq3.platform.null_runtime.State` with `clientInitialized` = `false`, `inputInitialized` = `false`, `glInitialized` = `false`, `qglInitialized` = `false` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L32)

<a id="function-function-mq3-platform-null-runtime-glimp-enablelogging-function-glimp-enablelogging-state-enabled-src-mq3-platform-null-runtime-ml-739822680"></a>
### GLimp_EnableLogging

```ml
function GLimp_EnableLogging(state, enabled)
```

Updates `state.logging` in `mq3.platform.null_runtime.GLimp_EnableLogging`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.logging`. |
| `enabled` | `dynamic` | — | Value assigned to `state.logging`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L128)

<a id="function-function-mq3-platform-null-runtime-glimp-endframe-function-glimp-endframe-state-src-mq3-platform-null-runtime-ml-863471277"></a>
### GLimp_EndFrame

```ml
function GLimp_EndFrame(state)
```

Updates `state.glFrames` in `mq3.platform.null_runtime.GLimp_EndFrame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.glFrames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L124)

<a id="function-function-mq3-platform-null-runtime-glimp-init-function-glimp-init-state-src-mq3-platform-null-runtime-ml-510010701"></a>
### GLimp_Init

```ml
function GLimp_Init(state)
```

Updates `state.glInitialized` in `mq3.platform.null_runtime.GLimp_Init`; returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.glInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L118)

<a id="function-function-mq3-platform-null-runtime-glimp-logcomment-function-glimp-logcomment-state-comment-src-mq3-platform-null-runtime-ml-1177069120"></a>
### GLimp_LogComment

```ml
function GLimp_LogComment(state, comment)
```

Updates `state.consoleText` in `mq3.platform.null_runtime.GLimp_LogComment`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.consoleText`. |
| `comment` | `dynamic` | — | Input tested by `state.logging`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L132)

<a id="function-function-mq3-platform-null-runtime-glimp-shutdown-function-glimp-shutdown-state-src-mq3-platform-null-runtime-ml-266676917"></a>
### GLimp_Shutdown

```ml
function GLimp_Shutdown(state)
```

Updates `state.glInitialized` in `mq3.platform.null_runtime.GLimp_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.glInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L121)

<a id="function-function-mq3-platform-null-runtime-headlessmain-function-headlessmain-state-framecount-framefn-context-src-mq3-platform-null-runtime-ml-515220201"></a>
### headlessMain

```ml
function headlessMain(state, frameCount, frameFn, context)
```

Bounded equivalent of the original endless headless main loop.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.quitRequested`, `state.frames`. |
| `frameCount` | `dynamic` | — | Input tested by `state==void or frameCount<0 or frameFn==void`. |
| `frameFn` | `dynamic` | — | Input tested by `state==void or frameCount<0 or frameFn==void`. |
| `context` | `dynamic` | — | Argument 1 supplied to `frameFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L279)

<a id="function-function-mq3-platform-null-runtime-in-frame-function-in-frame-state-src-mq3-platform-null-runtime-ml-354527425"></a>
### IN_Frame

```ml
function IN_Frame(state)
```

Updates `state.inputFrames` in `mq3.platform.null_runtime.IN_Frame`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.inputFrames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L146)

<a id="function-function-mq3-platform-null-runtime-in-init-function-in-init-state-src-mq3-platform-null-runtime-ml-974523577"></a>
### IN_Init

```ml
function IN_Init(state)
```

Updates `state.inputInitialized` in `mq3.platform.null_runtime.IN_Init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.inputInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L143)

<a id="function-function-mq3-platform-null-runtime-in-shutdown-function-in-shutdown-state-src-mq3-platform-null-runtime-ml-646849077"></a>
### IN_Shutdown

```ml
function IN_Shutdown(state)
```

Updates `state.inputInitialized` in `mq3.platform.null_runtime.IN_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.inputInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L149)

<a id="function-function-mq3-platform-null-runtime-key-writebindings-function-key-writebindings-state-file-src-mq3-platform-null-runtime-ml-1789738045"></a>
### Key_WriteBindings

```ml
function Key_WriteBindings(state, file)
```

Returns `void` for the `mq3.platform.null_runtime.Key_WriteBindings` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `file` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L114)

<a id="function-function-mq3-platform-null-runtime-macnetsymbols-function-macnetsymbols-src-mq3-platform-null-runtime-ml-2042372864"></a>
### macNetSymbols

```ml
function macNetSymbols()
```

Lists the 3 declared names for `mq3.platform.null_runtime.macNetSymbols`, including `NET_StringToAdr`, `Sys_GetPacket`, `Sys_SendPacket`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L17)

<a id="constant-constant-mq3-platform-null-runtime-na-bad-const-na-bad-1-src-mq3-platform-null-runtime-ml-315302280"></a>
### NA_BAD

```ml
const NA_BAD = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L13)

<a id="constant-constant-mq3-platform-null-runtime-na-loopback-const-na-loopback-2-src-mq3-platform-null-runtime-ml-718578639"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L14)

<a id="function-function-mq3-platform-null-runtime-net-stringtoadr-function-net-stringtoadr-text-src-mq3-platform-null-runtime-ml-1930757579"></a>
### NET_StringToAdr

```ml
function NET_StringToAdr(text)
```

Returns `void` from `mq3.platform.null_runtime.NET_StringToAdr`; earlier branches return `Address(NA_LOOPBACK,"localhost",0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Input tested by `text=="localhost"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L156)

<a id="function-function-mq3-platform-null-runtime-nullclientsymbols-function-nullclientsymbols-src-mq3-platform-null-runtime-ml-939236084"></a>
### nullClientSymbols

```ml
function nullClientSymbols()
```

Lists the 21 declared names for `mq3.platform.null_runtime.nullClientSymbols`, including `CL_CDDialog`, `CL_CDKeyValidate`, `CL_CharEvent`, `CL_ConsolePrint`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L19)

<a id="function-function-mq3-platform-null-runtime-nullglimpsymbols-function-nullglimpsymbols-src-mq3-platform-null-runtime-ml-851279426"></a>
### nullGlimpSymbols

```ml
function nullGlimpSymbols()
```

Lists the 7 declared names for `mq3.platform.null_runtime.nullGlimpSymbols`, including `GLimp_EnableLogging`, `GLimp_EndFrame`, `GLimp_Init`, `GLimp_LogComment`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L21)

<a id="function-function-mq3-platform-null-runtime-nullinputsymbols-function-nullinputsymbols-src-mq3-platform-null-runtime-ml-1804178494"></a>
### nullInputSymbols

```ml
function nullInputSymbols()
```

Lists the 4 declared names for `mq3.platform.null_runtime.nullInputSymbols`, including `IN_Frame`, `IN_Init`, `IN_Shutdown`, `Sys_SendKeyEvents`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L23)

<a id="function-function-mq3-platform-null-runtime-nullmainsymbols-function-nullmainsymbols-src-mq3-platform-null-runtime-ml-1548706380"></a>
### nullMainSymbols

```ml
function nullMainSymbols()
```

Lists the 18 declared names for `mq3.platform.null_runtime.nullMainSymbols`, including `Sys_BeginStreamedFile`, `Sys_EarlyOutput`, `Sys_EndStreamedFile`, `Sys_Error`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L25)

<a id="function-function-mq3-platform-null-runtime-nullnetsymbols-function-nullnetsymbols-src-mq3-platform-null-runtime-ml-221741378"></a>
### nullNetSymbols

```ml
function nullNetSymbols()
```

Lists the 3 declared names for `mq3.platform.null_runtime.nullNetSymbols`, including `NET_StringToAdr`, `Sys_GetPacket`, `Sys_SendPacket`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L27)

<a id="function-function-mq3-platform-null-runtime-nullsoundsymbols-function-nullsoundsymbols-src-mq3-platform-null-runtime-ml-486927650"></a>
### nullSoundSymbols

```ml
function nullSoundSymbols()
```

Lists the 8 declared names for `mq3.platform.null_runtime.nullSoundSymbols`, including `SNDDMA_BeginPainting`, `SNDDMA_GetDMAPos`, `SNDDMA_Init`, `SNDDMA_Shutdown`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L29)

- [mq3.platform.null_runtime.Packet](Type-mq3-platform-null-runtime-packet-607746055.md) — struct
<a id="function-function-mq3-platform-null-runtime-qgl-init-function-qgl-init-state-dllname-src-mq3-platform-null-runtime-ml-437375330"></a>
### QGL_Init

```ml
function QGL_Init(state, dllname)
```

Updates `state.qglInitialized` in `mq3.platform.null_runtime.QGL_Init`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.qglInitialized`. |
| `dllname` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L136)

<a id="function-function-mq3-platform-null-runtime-qgl-shutdown-function-qgl-shutdown-state-src-mq3-platform-null-runtime-ml-1040270065"></a>
### QGL_Shutdown

```ml
function QGL_Shutdown(state)
```

Updates `state.qglInitialized` in `mq3.platform.null_runtime.QGL_Shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.qglInitialized`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L139)

<a id="function-function-mq3-platform-null-runtime-s-clearsoundbuffer-function-s-clearsoundbuffer-state-src-mq3-platform-null-runtime-ml-496517461"></a>
### S_ClearSoundBuffer

```ml
function S_ClearSoundBuffer(state)
```

Returns `void` for the `mq3.platform.null_runtime.S_ClearSoundBuffer` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L200)

<a id="function-function-mq3-platform-null-runtime-s-registersound-function-s-registersound-state-name-compressed-src-mq3-platform-null-runtime-ml-1776897231"></a>
### S_RegisterSound

```ml
function S_RegisterSound(state, name, compressed)
```

Updates `state.soundRegistrations` in `mq3.platform.null_runtime.S_RegisterSound`; returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.soundRegistrations`. |
| `name` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `compressed` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L192)

<a id="function-function-mq3-platform-null-runtime-s-startlocalsound-function-s-startlocalsound-state-handle-channel-src-mq3-platform-null-runtime-ml-1074736548"></a>
### S_StartLocalSound

```ml
function S_StartLocalSound(state, handle, channel)
```

Updates `state.localSounds` in `mq3.platform.null_runtime.S_StartLocalSound`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.localSounds`. |
| `handle` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `channel` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L197)

<a id="function-function-mq3-platform-null-runtime-snddma-beginpainting-function-snddma-beginpainting-state-src-mq3-platform-null-runtime-ml-1947349041"></a>
### SNDDMA_BeginPainting

```ml
function SNDDMA_BeginPainting(state)
```

Returns `void` for the `mq3.platform.null_runtime.SNDDMA_BeginPainting` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L184)

<a id="function-function-mq3-platform-null-runtime-snddma-getdmapos-function-snddma-getdmapos-state-src-mq3-platform-null-runtime-ml-251548345"></a>
### SNDDMA_GetDMAPos

```ml
function SNDDMA_GetDMAPos(state)
```

Returns `0` for the `mq3.platform.null_runtime.SNDDMA_GetDMAPos` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L178)

<a id="function-function-mq3-platform-null-runtime-snddma-init-function-snddma-init-state-src-mq3-platform-null-runtime-ml-1869731661"></a>
### SNDDMA_Init

```ml
function SNDDMA_Init(state)
```

Returns `false` for the `mq3.platform.null_runtime.SNDDMA_Init` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L175)

<a id="function-function-mq3-platform-null-runtime-snddma-shutdown-function-snddma-shutdown-state-src-mq3-platform-null-runtime-ml-1008890585"></a>
### SNDDMA_Shutdown

```ml
function SNDDMA_Shutdown(state)
```

Returns `void` for the `mq3.platform.null_runtime.SNDDMA_Shutdown` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L181)

<a id="function-function-mq3-platform-null-runtime-snddma-submit-function-snddma-submit-state-src-mq3-platform-null-runtime-ml-131095965"></a>
### SNDDMA_Submit

```ml
function SNDDMA_Submit(state)
```

Returns `void` for the `mq3.platform.null_runtime.SNDDMA_Submit` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L187)

- [mq3.platform.null_runtime.State](Type-mq3-platform-null-runtime-state-476158860.md) — struct
<a id="function-function-mq3-platform-null-runtime-sys-beginstreamedfile-function-sys-beginstreamedfile-state-file-readahead-src-mq3-platform-null-runtime-ml-1692226054"></a>
### Sys_BeginStreamedFile

```ml
function Sys_BeginStreamedFile(state, file, readAhead)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_BeginStreamedFile` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `file` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `readAhead` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L206)

<a id="function-function-mq3-platform-null-runtime-sys-earlyoutput-function-sys-earlyoutput-state-text-src-mq3-platform-null-runtime-ml-139767926"></a>
### Sys_EarlyOutput

```ml
function Sys_EarlyOutput(state, text)
```

Updates `state.consoleText` in `mq3.platform.null_runtime.Sys_EarlyOutput`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.consoleText`. |
| `text` | `dynamic` | — | Input used by `state.consoleText=state.consoleText+text`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L272)

<a id="function-function-mq3-platform-null-runtime-sys-endstreamedfile-function-sys-endstreamedfile-state-file-src-mq3-platform-null-runtime-ml-7042607"></a>
### Sys_EndStreamedFile

```ml
function Sys_EndStreamedFile(state, file)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_EndStreamedFile` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `file` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L210)

<a id="function-function-mq3-platform-null-runtime-sys-error-function-sys-error-state-message-src-mq3-platform-null-runtime-ml-811884334"></a>
### Sys_Error

```ml
function Sys_Error(state, message)
```

Updates `state.errors` in `mq3.platform.null_runtime.Sys_Error`; returns `error(7979,"Sys_Error: "+message)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.errors`. |
| `message` | `dynamic` | — | Input used by `state.errors=state.errors+[message]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L235)

<a id="function-function-mq3-platform-null-runtime-sys-findclose-function-sys-findclose-state-src-mq3-platform-null-runtime-ml-1762945547"></a>
### Sys_FindClose

```ml
function Sys_FindClose(state)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_FindClose` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L265)

<a id="function-function-mq3-platform-null-runtime-sys-findfirst-function-sys-findfirst-state-path-musthave-canthave-src-mq3-platform-null-runtime-ml-538987691"></a>
### Sys_FindFirst

```ml
function Sys_FindFirst(state, path, mustHave, cantHave)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_FindFirst` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `path` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `mustHave` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `cantHave` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L257)

<a id="function-function-mq3-platform-null-runtime-sys-findnext-function-sys-findnext-state-musthave-canthave-src-mq3-platform-null-runtime-ml-1769512850"></a>
### Sys_FindNext

```ml
function Sys_FindNext(state, mustHave, cantHave)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_FindNext` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `mustHave` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `cantHave` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L262)

<a id="function-function-mq3-platform-null-runtime-sys-getclipboarddata-function-sys-getclipboarddata-state-src-mq3-platform-null-runtime-ml-506921761"></a>
### Sys_GetClipboardData

```ml
function Sys_GetClipboardData(state)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_GetClipboardData` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L248)

<a id="function-function-mq3-platform-null-runtime-sys-getgameapi-function-sys-getgameapi-state-parameters-src-mq3-platform-null-runtime-ml-1181311845"></a>
### Sys_GetGameAPI

```ml
function Sys_GetGameAPI(state, parameters)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_GetGameAPI` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `parameters` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L245)

<a id="function-function-mq3-platform-null-runtime-sys-getpacket-function-sys-getpacket-state-src-mq3-platform-null-runtime-ml-1773277933"></a>
### Sys_GetPacket

```ml
function Sys_GetPacket(state)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_GetPacket` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L171)

<a id="function-function-mq3-platform-null-runtime-sys-init-function-sys-init-state-src-mq3-platform-null-runtime-ml-1737972105"></a>
### Sys_Init

```ml
function Sys_Init(state)
```

Computes `state` for `mq3.platform.null_runtime.Sys_Init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Input used in the result expression `state`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L268)

<a id="function-function-mq3-platform-null-runtime-sys-milliseconds-function-sys-milliseconds-state-src-mq3-platform-null-runtime-ml-403292617"></a>
### Sys_Milliseconds

```ml
function Sys_Milliseconds(state)
```

Returns `0` for the `mq3.platform.null_runtime.Sys_Milliseconds` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L251)

<a id="function-function-mq3-platform-null-runtime-sys-mkdir-function-sys-mkdir-state-path-src-mq3-platform-null-runtime-ml-314771108"></a>
### Sys_Mkdir

```ml
function Sys_Mkdir(state, path)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_Mkdir` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `path` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L231)

<a id="function-function-mq3-platform-null-runtime-sys-mkdir-function-sys-mkdir-state-path-src-mq3-platform-null-runtime-ml-2133351588"></a>
### Sys_mkdir

```ml
function Sys_mkdir(state, path)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_mkdir` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `path` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L227)

<a id="function-function-mq3-platform-null-runtime-sys-quit-function-sys-quit-state-src-mq3-platform-null-runtime-ml-111745245"></a>
### Sys_Quit

```ml
function Sys_Quit(state)
```

Updates `state.quitRequested` in `mq3.platform.null_runtime.Sys_Quit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.quitRequested`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L238)

<a id="function-function-mq3-platform-null-runtime-sys-sendkeyevents-function-sys-sendkeyevents-state-src-mq3-platform-null-runtime-ml-777645217"></a>
### Sys_SendKeyEvents

```ml
function Sys_SendKeyEvents(state)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_SendKeyEvents` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L152)

<a id="function-function-mq3-platform-null-runtime-sys-sendpacket-function-sys-sendpacket-state-length-data-destination-src-mq3-platform-null-runtime-ml-459277901"></a>
### Sys_SendPacket

```ml
function Sys_SendPacket(state, length, data, destination)
```

Updates `state.sentPackets` in `mq3.platform.null_runtime.Sys_SendPacket`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.sentPackets`. |
| `length` | `dynamic` | — | Input used by `count=length`. |
| `data` | `dynamic` | — | Argument 1 supplied to `slice`. |
| `destination` | `dynamic` | — | Value used for `mq3.platform.null_runtime.Packet.destination`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L165)

<a id="function-function-mq3-platform-null-runtime-sys-streamedread-function-sys-streamedread-state-buffer-size-count-file-src-mq3-platform-null-runtime-ml-1049121329"></a>
### Sys_StreamedRead

```ml
function Sys_StreamedRead(state, buffer, size, count, file)
```

Returns `0` for the `mq3.platform.null_runtime.Sys_StreamedRead` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `buffer` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `size` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `count` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `file` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L217)

<a id="function-function-mq3-platform-null-runtime-sys-streamseek-function-sys-streamseek-state-file-offset-origin-src-mq3-platform-null-runtime-ml-1916675842"></a>
### Sys_StreamSeek

```ml
function Sys_StreamSeek(state, file, offset, origin)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_StreamSeek` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `file` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `offset` | `dynamic` | — | Unused compatibility argument retained by this entry point. |
| `origin` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L223)

<a id="function-function-mq3-platform-null-runtime-sys-unloadgame-function-sys-unloadgame-state-src-mq3-platform-null-runtime-ml-931122669"></a>
### Sys_UnloadGame

```ml
function Sys_UnloadGame(state)
```

Returns `void` for the `mq3.platform.null_runtime.Sys_UnloadGame` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L241)

<a id="function-function-mq3-platform-null-runtime-ui-gamecommand-function-ui-gamecommand-state-src-mq3-platform-null-runtime-ml-904735909"></a>
### UI_GameCommand

```ml
function UI_GameCommand(state)
```

Returns `false` for the `mq3.platform.null_runtime.UI_GameCommand` compatibility entry point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/null_runtime.ml#L52)
