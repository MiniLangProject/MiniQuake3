# `src/mq3/qcommon/common.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.common`](Package-mq3-qcommon-common-135583411.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/engine_loop.ml` as `engine` → [src/mq3/platform/engine_loop.ml](File-src-mq3-platform-engine-loop-ml-224472914.md)
- `mq3/qcommon/command_buffer.ml` as `command` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/config_persistence.ml` as `config` → [src/mq3/qcommon/config_persistence.ml](File-src-mq3-qcommon-config-persistence-ml-1954559630.md)
- `mq3/qcommon/headers.ml` as `qcommonHeaders` → [src/mq3/qcommon/headers.ml](File-src-mq3-qcommon-headers-ml-405080448.md)
- `mq3/qcommon/network_pump.ml` as `network` → [src/mq3/qcommon/network_pump.ml](File-src-mq3-qcommon-network-pump-ml-493477247.md)
- `mq3/qcommon/startup_commands.ml` as `startup` → [src/mq3/qcommon/startup_commands.ml](File-src-mq3-qcommon-startup-commands-ml-835791996.md)

## Declarations

<a id="function-function-mq3-qcommon-common-copydword-function-copydword-destination-constant-count-src-mq3-qcommon-common-ml-1661372085"></a>
### _copyDWord

```ml
function _copyDWord(destination, constant, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `constant` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L206)

<a id="extern_function-extern-function-mq3-qcommon-common-acos-extern-function-acos-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-qcommon-common-ml-940443332"></a>
### acos

```ml
extern function acos(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L14)

- [mq3.qcommon.common.Allocation](Type-mq3-qcommon-common-allocation-426269833.md) — struct
<a id="function-function-mq3-qcommon-common-com-addstartupcommands-function-com-addstartupcommands-state-src-mq3-qcommon-common-ml-500948637"></a>
### Com_AddStartupCommands

```ml
function Com_AddStartupCommands(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L75)

<a id="function-function-mq3-qcommon-common-com-appendcdkey-function-com-appendcdkey-state-filename-src-mq3-qcommon-common-ml-1843292686"></a>
### Com_AppendCDKey

```ml
function Com_AppendCDKey(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L182)

<a id="function-function-mq3-qcommon-common-com-beginredirect-function-com-beginredirect-state-capacity-flushfn-context-src-mq3-qcommon-common-ml-1262307128"></a>
### Com_BeginRedirect

```ml
function Com_BeginRedirect(state, capacity, flushFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |
| `flushFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L53)

<a id="function-function-mq3-qcommon-common-com-crash-f-function-com-crash-f-state-src-mq3-qcommon-common-ml-1860329901"></a>
### Com_Crash_f

```ml
function Com_Crash_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L70)

<a id="function-function-mq3-qcommon-common-com-dprintf-function-com-dprintf-state-text-src-mq3-qcommon-common-ml-1299848722"></a>
### Com_DPrintf

```ml
function Com_DPrintf(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L60)

<a id="function-function-mq3-qcommon-common-com-endredirect-function-com-endredirect-state-src-mq3-qcommon-common-ml-1556994939"></a>
### Com_EndRedirect

```ml
function Com_EndRedirect(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L54)

<a id="function-function-mq3-qcommon-common-com-error-function-com-error-state-code-message-src-mq3-qcommon-common-ml-751490809"></a>
### Com_Error

```ml
function Com_Error(state, code, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `code` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L61)

<a id="function-function-mq3-qcommon-common-com-error-f-function-com-error-f-state-src-mq3-qcommon-common-ml-1177997583"></a>
### Com_Error_f

```ml
function Com_Error_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L68)

<a id="function-function-mq3-qcommon-common-com-eventloop-function-com-eventloop-state-maxevents-src-mq3-qcommon-common-ml-477465252"></a>
### Com_EventLoop

```ml
function Com_EventLoop(state, maxEvents)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `maxEvents` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L162)

<a id="function-function-mq3-qcommon-common-com-filter-function-com-filter-filter-name-casesensitive-src-mq3-qcommon-common-ml-134727631"></a>
### Com_Filter

```ml
function Com_Filter(filter, name, casesensitive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filter` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `casesensitive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L85)

<a id="function-function-mq3-qcommon-common-com-filterpath-function-com-filterpath-filter-name-casesensitive-src-mq3-qcommon-common-ml-805807651"></a>
### Com_FilterPath

```ml
function Com_FilterPath(filter, name, casesensitive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filter` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `casesensitive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L100)

<a id="function-function-mq3-qcommon-common-com-frame-function-com-frame-state-src-mq3-qcommon-common-ml-495495919"></a>
### Com_Frame

```ml
function Com_Frame(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L195)

<a id="function-function-mq3-qcommon-common-com-freeze-f-function-com-freeze-f-state-seconds-src-mq3-qcommon-common-ml-759930354"></a>
### Com_Freeze_f

```ml
function Com_Freeze_f(state, seconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `seconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L69)

<a id="function-function-mq3-qcommon-common-com-getevent-function-com-getevent-state-src-mq3-qcommon-common-ml-284979893"></a>
### Com_GetEvent

```ml
function Com_GetEvent(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L160)

<a id="function-function-mq3-qcommon-common-com-getrealevent-function-com-getrealevent-state-src-mq3-qcommon-common-ml-2083650181"></a>
### Com_GetRealEvent

```ml
function Com_GetRealEvent(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L156)

<a id="function-function-mq3-qcommon-common-com-hashkey-function-com-hashkey-text-maxlength-src-mq3-qcommon-common-ml-146329117"></a>
### Com_HashKey

```ml
function Com_HashKey(text, maxLength)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `maxLength` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L101)

<a id="function-function-mq3-qcommon-common-com-init-function-com-init-state-commandline-src-mq3-qcommon-common-ml-1820424472"></a>
### Com_Init

```ml
function Com_Init(state, commandLine)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `commandLine` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L184)

<a id="function-function-mq3-qcommon-common-com-inithunkmemory-function-com-inithunkmemory-state-src-mq3-qcommon-common-ml-1991194397"></a>
### Com_InitHunkMemory

```ml
function Com_InitHunkMemory(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L130)

<a id="function-function-mq3-qcommon-common-com-initjournaling-function-com-initjournaling-state-mode-path-src-mq3-qcommon-common-ml-390882085"></a>
### Com_InitJournaling

```ml
function Com_InitJournaling(state, mode, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L153)

<a id="function-function-mq3-qcommon-common-com-initpushevent-function-com-initpushevent-state-src-mq3-qcommon-common-ml-979329157"></a>
### Com_InitPushEvent

```ml
function Com_InitPushEvent(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L154)

<a id="function-function-mq3-qcommon-common-com-initsmallzonememory-function-com-initsmallzonememory-state-src-mq3-qcommon-common-ml-700338781"></a>
### Com_InitSmallZoneMemory

```ml
function Com_InitSmallZoneMemory(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L125)

<a id="function-function-mq3-qcommon-common-com-initzonememory-function-com-initzonememory-state-src-mq3-qcommon-common-ml-1354916973"></a>
### Com_InitZoneMemory

```ml
function Com_InitZoneMemory(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L126)

<a id="function-function-mq3-qcommon-common-com-memcmp-function-com-memcmp-left-right-count-src-mq3-qcommon-common-ml-1014765392"></a>
### Com_Memcmp

```ml
function Com_Memcmp(left, right, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L205)

<a id="function-function-mq3-qcommon-common-com-memcpy-function-com-memcpy-destination-source-count-src-mq3-qcommon-common-ml-1100489764"></a>
### Com_Memcpy

```ml
function Com_Memcpy(destination, source, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L203)

<a id="function-function-mq3-qcommon-common-com-meminfo-f-function-com-meminfo-f-state-src-mq3-qcommon-common-ml-1199001085"></a>
### Com_Meminfo_f

```ml
function Com_Meminfo_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L127)

<a id="function-function-mq3-qcommon-common-com-memset-function-com-memset-destination-value-count-src-mq3-qcommon-common-ml-1336103902"></a>
### Com_Memset

```ml
function Com_Memset(destination, value, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L204)

<a id="function-function-mq3-qcommon-common-com-milliseconds-function-com-milliseconds-state-src-mq3-qcommon-common-ml-152733361"></a>
### Com_Milliseconds

```ml
function Com_Milliseconds(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L166)

<a id="function-function-mq3-qcommon-common-com-modifymsec-function-com-modifymsec-state-msec-src-mq3-qcommon-common-ml-2132431737"></a>
### Com_ModifyMsec

```ml
function Com_ModifyMsec(state, msec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L188)

<a id="function-function-mq3-qcommon-common-com-parsecommandline-function-com-parsecommandline-state-text-src-mq3-qcommon-common-ml-522555640"></a>
### Com_ParseCommandLine

```ml
function Com_ParseCommandLine(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L72)

<a id="function-function-mq3-qcommon-common-com-prefetch-function-com-prefetch-source-count-type-src-mq3-qcommon-common-ml-143289122"></a>
### Com_Prefetch

```ml
function Com_Prefetch(source, count, type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L207)

<a id="function-function-mq3-qcommon-common-com-printf-function-com-printf-state-text-src-mq3-qcommon-common-ml-1708056400"></a>
### Com_Printf

```ml
function Com_Printf(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L55)

<a id="function-function-mq3-qcommon-common-com-pushevent-function-com-pushevent-state-event-src-mq3-qcommon-common-ml-1312120113"></a>
### Com_PushEvent

```ml
function Com_PushEvent(state, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L155)

<a id="function-function-mq3-qcommon-common-com-quit-f-function-com-quit-f-state-src-mq3-qcommon-common-ml-914238021"></a>
### Com_Quit_f

```ml
function Com_Quit_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L67)

<a id="function-function-mq3-qcommon-common-com-readcdkey-function-com-readcdkey-state-filename-src-mq3-qcommon-common-ml-1371921206"></a>
### Com_ReadCDKey

```ml
function Com_ReadCDKey(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L181)

<a id="function-function-mq3-qcommon-common-com-realtime-function-com-realtime-state-target-src-mq3-qcommon-common-ml-868237158"></a>
### Com_RealTime

```ml
function Com_RealTime(state, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L102)

<a id="function-function-mq3-qcommon-common-com-runandtimeserverpacket-function-com-runandtimeserverpacket-state-address-data-src-mq3-qcommon-common-ml-194363597"></a>
### Com_RunAndTimeServerPacket

```ml
function Com_RunAndTimeServerPacket(state, address, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L161)

<a id="function-function-mq3-qcommon-common-com-safemode-function-com-safemode-state-src-mq3-qcommon-common-ml-442002001"></a>
### Com_SafeMode

```ml
function Com_SafeMode(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L73)

<a id="function-function-mq3-qcommon-common-com-shutdown-function-com-shutdown-state-src-mq3-qcommon-common-ml-410589181"></a>
### Com_Shutdown

```ml
function Com_Shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L201)

<a id="function-function-mq3-qcommon-common-com-startupvariable-function-com-startupvariable-state-match-src-mq3-qcommon-common-ml-866884860"></a>
### Com_StartupVariable

```ml
function Com_StartupVariable(state, match)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `match` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L74)

<a id="function-function-mq3-qcommon-common-com-stringcontains-function-com-stringcontains-str1-str2-casesensitive-src-mq3-qcommon-common-ml-1441546563"></a>
### Com_StringContains

```ml
function Com_StringContains(str1, str2, casesensitive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `str1` | `dynamic` | — |  |
| `str2` | `dynamic` | — |  |
| `casesensitive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L81)

<a id="function-function-mq3-qcommon-common-com-touchmemory-function-com-touchmemory-state-src-mq3-qcommon-common-ml-1963908433"></a>
### Com_TouchMemory

```ml
function Com_TouchMemory(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L128)

<a id="function-function-mq3-qcommon-common-com-writecdkey-function-com-writecdkey-state-filename-key-src-mq3-qcommon-common-ml-1428432017"></a>
### Com_WriteCDKey

```ml
function Com_WriteCDKey(state, filename, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L183)

<a id="function-function-mq3-qcommon-common-com-writeconfig-f-function-com-writeconfig-f-state-src-mq3-qcommon-common-ml-1015110469"></a>
### Com_WriteConfig_f

```ml
function Com_WriteConfig_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L187)

<a id="function-function-mq3-qcommon-common-com-writeconfigtofile-function-com-writeconfigtofile-state-filename-src-mq3-qcommon-common-ml-1528636406"></a>
### Com_WriteConfigToFile

```ml
function Com_WriteConfigToFile(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L185)

<a id="function-function-mq3-qcommon-common-com-writeconfiguration-function-com-writeconfiguration-state-src-mq3-qcommon-common-ml-1235806657"></a>
### Com_WriteConfiguration

```ml
function Com_WriteConfiguration(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L186)

- [mq3.qcommon.common.CommonError](Type-mq3-qcommon-common-commonerror-423548968.md) — struct
<a id="function-function-mq3-qcommon-common-concatremaining-function-concatremaining-state-source-start-src-mq3-qcommon-common-ml-301874252"></a>
### ConcatRemaining

```ml
function ConcatRemaining(state, source, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L215)

<a id="function-function-mq3-qcommon-common-copystring-function-copystring-state-text-src-mq3-qcommon-common-ml-307098868"></a>
### CopyString

```ml
function CopyString(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L124)

<a id="function-function-mq3-qcommon-common-create-function-create-host-commandstate-src-mq3-qcommon-common-ml-1874013200"></a>
### create

```ml
function create(host, commandState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `commandState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L44)

<a id="function-function-mq3-qcommon-common-createhunk-function-createhunk-capacity-src-mq3-qcommon-common-ml-1345908444"></a>
### createHunk

```ml
function createHunk(capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L43)

<a id="function-function-mq3-qcommon-common-createzone-function-createzone-capacity-src-mq3-qcommon-common-ml-1192129176"></a>
### createZone

```ml
function createZone(capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L42)

<a id="function-function-mq3-qcommon-common-emit-function-emit-state-text-src-mq3-qcommon-common-ml-896776172"></a>
### emit

```ml
function emit(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L51)

<a id="constant-constant-mq3-qcommon-common-err-disconnect-const-err-disconnect-3-src-mq3-qcommon-common-ml-1738535026"></a>
### ERR_DISCONNECT

```ml
const ERR_DISCONNECT = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L19)

<a id="constant-constant-mq3-qcommon-common-err-drop-const-err-drop-1-src-mq3-qcommon-common-ml-726164074"></a>
### ERR_DROP

```ml
const ERR_DROP = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L17)

<a id="constant-constant-mq3-qcommon-common-err-fatal-const-err-fatal-0-src-mq3-qcommon-common-ml-1560198233"></a>
### ERR_FATAL

```ml
const ERR_FATAL = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L16)

<a id="constant-constant-mq3-qcommon-common-err-need-cd-const-err-need-cd-4-src-mq3-qcommon-common-ml-136278545"></a>
### ERR_NEED_CD

```ml
const ERR_NEED_CD = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L20)

<a id="constant-constant-mq3-qcommon-common-err-serverdisconnect-const-err-serverdisconnect-2-src-mq3-qcommon-common-ml-1461881603"></a>
### ERR_SERVERDISCONNECT

```ml
const ERR_SERVERDISCONNECT = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L18)

- [mq3.qcommon.common.Field](Type-mq3-qcommon-common-field-55104153.md) — struct
<a id="function-function-mq3-qcommon-common-field-clear-function-field-clear-edit-src-mq3-qcommon-common-ml-193387480"></a>
### Field_Clear

```ml
function Field_Clear(edit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `edit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L210)

<a id="function-function-mq3-qcommon-common-field-completecommand-function-field-completecommand-state-field-commandnames-cvarnames-src-mq3-qcommon-common-ml-105816386"></a>
### Field_CompleteCommand

```ml
function Field_CompleteCommand(state, field, commandNames, cvarNames)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `field` | `dynamic` | — |  |
| `commandNames` | `dynamic` | — |  |
| `cvarNames` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L216)

<a id="function-function-mq3-qcommon-common-findallocation-function-findallocation-zone-handle-src-mq3-qcommon-common-ml-1686999376"></a>
### findAllocation

```ml
function findAllocation(zone, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `zone` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L104)

<a id="function-function-mq3-qcommon-common-findmatches-function-findmatches-state-value-src-mq3-qcommon-common-ml-2125535746"></a>
### FindMatches

```ml
function FindMatches(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L211)

- [mq3.qcommon.common.Hunk](Type-mq3-qcommon-common-hunk-2027410891.md) — struct
<a id="function-function-mq3-qcommon-common-hunk-alloc-function-hunk-alloc-state-size-preference-src-mq3-qcommon-common-ml-818829389"></a>
### Hunk_Alloc

```ml
function Hunk_Alloc(state, size, preference)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `preference` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L145)

<a id="function-function-mq3-qcommon-common-hunk-allocatetempmemory-function-hunk-allocatetempmemory-state-size-src-mq3-qcommon-common-ml-1900214428"></a>
### Hunk_AllocateTempMemory

```ml
function Hunk_AllocateTempMemory(state, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L146)

<a id="function-function-mq3-qcommon-common-hunk-checkmark-function-hunk-checkmark-state-src-mq3-qcommon-common-ml-1202974997"></a>
### Hunk_CheckMark

```ml
function Hunk_CheckMark(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L134)

<a id="function-function-mq3-qcommon-common-hunk-clear-function-hunk-clear-state-src-mq3-qcommon-common-ml-551766005"></a>
### Hunk_Clear

```ml
function Hunk_Clear(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L135)

<a id="function-function-mq3-qcommon-common-hunk-cleartempmemory-function-hunk-cleartempmemory-state-src-mq3-qcommon-common-ml-1698618077"></a>
### Hunk_ClearTempMemory

```ml
function Hunk_ClearTempMemory(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L148)

<a id="function-function-mq3-qcommon-common-hunk-cleartomark-function-hunk-cleartomark-state-src-mq3-qcommon-common-ml-1093216917"></a>
### Hunk_ClearToMark

```ml
function Hunk_ClearToMark(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L133)

<a id="function-function-mq3-qcommon-common-hunk-freetempmemory-function-hunk-freetempmemory-state-value-src-mq3-qcommon-common-ml-275366846"></a>
### Hunk_FreeTempMemory

```ml
function Hunk_FreeTempMemory(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L147)

<a id="constant-constant-mq3-qcommon-common-hunk-high-const-hunk-high-1-src-mq3-qcommon-common-ml-1760851522"></a>
### HUNK_HIGH

```ml
const HUNK_HIGH = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L29)

<a id="function-function-mq3-qcommon-common-hunk-log-function-hunk-log-state-src-mq3-qcommon-common-ml-1768456489"></a>
### Hunk_Log

```ml
function Hunk_Log(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L149)

<a id="constant-constant-mq3-qcommon-common-hunk-low-const-hunk-low-0-src-mq3-qcommon-common-ml-1491755985"></a>
### HUNK_LOW

```ml
const HUNK_LOW = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L28)

<a id="function-function-mq3-qcommon-common-hunk-memoryremaining-function-hunk-memoryremaining-state-src-mq3-qcommon-common-ml-2018993301"></a>
### Hunk_MemoryRemaining

```ml
function Hunk_MemoryRemaining(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L131)

<a id="function-function-mq3-qcommon-common-hunk-setmark-function-hunk-setmark-state-src-mq3-qcommon-common-ml-1007432429"></a>
### Hunk_SetMark

```ml
function Hunk_SetMark(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L132)

<a id="function-function-mq3-qcommon-common-hunk-smalllog-function-hunk-smalllog-state-src-mq3-qcommon-common-ml-1294793413"></a>
### Hunk_SmallLog

```ml
function Hunk_SmallLog(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L150)

<a id="function-function-mq3-qcommon-common-hunk-swapbanks-function-hunk-swapbanks-state-src-mq3-qcommon-common-ml-1606264309"></a>
### Hunk_SwapBanks

```ml
function Hunk_SwapBanks(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L136)

<a id="function-function-mq3-qcommon-common-hunk-trash-function-hunk-trash-state-src-mq3-qcommon-common-ml-465420717"></a>
### Hunk_Trash

```ml
function Hunk_Trash(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L151)

<a id="function-function-mq3-qcommon-common-info-print-function-info-print-state-text-src-mq3-qcommon-common-ml-1098671828"></a>
### Info_Print

```ml
function Info_Print(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L76)

<a id="function-function-mq3-qcommon-common-keyconcatargs-function-keyconcatargs-state-src-mq3-qcommon-common-ml-1176361621"></a>
### keyConcatArgs

```ml
function keyConcatArgs(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L214)

<a id="function-function-mq3-qcommon-common-lower-function-lower-value-src-mq3-qcommon-common-ml-741304187"></a>
### lower

```ml
function lower(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L49)

<a id="constant-constant-mq3-qcommon-common-max-edit-line-const-max-edit-line-qcommonheaders-max-edit-line-src-mq3-qcommon-common-ml-1417981251"></a>
### MAX_EDIT_LINE

```ml
const MAX_EDIT_LINE = qcommonHeaders.MAX_EDIT_LINE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L22)

<a id="constant-constant-mq3-qcommon-common-max-pushed-events-const-max-pushed-events-1024-src-mq3-qcommon-common-ml-1782985328"></a>
### MAX_PUSHED_EVENTS

```ml
const MAX_PUSHED_EVENTS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L21)

<a id="constant-constant-mq3-qcommon-common-max-token-chars-const-max-token-chars-1024-src-mq3-qcommon-common-ml-607454052"></a>
### MAX_TOKEN_CHARS

```ml
const MAX_TOKEN_CHARS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L23)

<a id="function-function-mq3-qcommon-common-normalizepath-function-normalizepath-value-src-mq3-qcommon-common-ml-1909128297"></a>
### normalizePath

```ml
function normalizePath(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L99)

<a id="function-function-mq3-qcommon-common-padkey-function-padkey-src-mq3-qcommon-common-ml-1587054828"></a>
### padKey

```ml
function padKey()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L168)

<a id="function-function-mq3-qcommon-common-permanent-function-permanent-state-size-preference-src-mq3-qcommon-common-ml-1044129481"></a>
### permanent

```ml
function permanent(state, size, preference)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `preference` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L220)

<a id="function-function-mq3-qcommon-common-printmatches-function-printmatches-state-value-src-mq3-qcommon-common-ml-1973113118"></a>
### PrintMatches

```ml
function PrintMatches(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L212)

<a id="function-function-mq3-qcommon-common-q-acos-function-q-acos-value-src-mq3-qcommon-common-ml-1669102049"></a>
### Q_acos

```ml
function Q_acos(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L208)

<a id="function-function-mq3-qcommon-common-quotearg-function-quotearg-value-src-mq3-qcommon-common-ml-608669241"></a>
### quoteArg

```ml
function quoteArg(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L213)

<a id="function-function-mq3-qcommon-common-readkey-function-readkey-state-filename-src-mq3-qcommon-common-ml-996149572"></a>
### readKey

```ml
function readKey(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L170)

- [mq3.qcommon.common.Redirect](Type-mq3-qcommon-common-redirect-587251143.md) — struct
<a id="function-function-mq3-qcommon-common-s-malloc-function-s-malloc-state-size-src-mq3-qcommon-common-ml-1711004594"></a>
### S_Malloc

```ml
function S_Malloc(state, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L115)

<a id="function-function-mq3-qcommon-common-s-mallocdebug-function-s-mallocdebug-state-size-label-file-line-src-mq3-qcommon-common-ml-706434636"></a>
### S_MallocDebug

```ml
function S_MallocDebug(state, size, label, file, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L114)

<a id="function-function-mq3-qcommon-common-sameprefix-function-sameprefix-left-right-count-casesensitive-src-mq3-qcommon-common-ml-2054127142"></a>
### samePrefix

```ml
function samePrefix(left, right, count, casesensitive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `casesensitive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L50)

<a id="function-function-mq3-qcommon-common-services-function-services-context-src-mq3-qcommon-common-ml-1923402619"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L41)

- [mq3.qcommon.common.Services](Type-mq3-qcommon-common-services-1183297755.md) — struct
- [mq3.qcommon.common.State](Type-mq3-qcommon-common-state-41417224.md) — struct
- [mq3.qcommon.common.SysEvent](Type-mq3-qcommon-common-sysevent-1699934460.md) — struct
<a id="constant-constant-mq3-qcommon-common-tag-botlib-const-tag-botlib-2-src-mq3-qcommon-common-ml-1328593859"></a>
### TAG_BOTLIB

```ml
const TAG_BOTLIB = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L26)

<a id="constant-constant-mq3-qcommon-common-tag-free-const-tag-free-0-src-mq3-qcommon-common-ml-1060078321"></a>
### TAG_FREE

```ml
const TAG_FREE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L24)

<a id="constant-constant-mq3-qcommon-common-tag-general-const-tag-general-1-src-mq3-qcommon-common-ml-1460866942"></a>
### TAG_GENERAL

```ml
const TAG_GENERAL = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L25)

<a id="constant-constant-mq3-qcommon-common-tag-renderer-const-tag-renderer-3-src-mq3-qcommon-common-ml-1383579030"></a>
### TAG_RENDERER

```ml
const TAG_RENDERER = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L27)

<a id="function-function-mq3-qcommon-common-validkey-function-validkey-state-key-src-mq3-qcommon-common-ml-1689131672"></a>
### validKey

```ml
function validKey(state, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L169)

<a id="function-function-mq3-qcommon-common-visible-function-visible-text-src-mq3-qcommon-common-ml-1124340281"></a>
### visible

```ml
function visible(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L48)

<a id="function-function-mq3-qcommon-common-z-availablememory-function-z-availablememory-state-src-mq3-qcommon-common-ml-937293619"></a>
### Z_AvailableMemory

```ml
function Z_AvailableMemory(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L107)

<a id="function-function-mq3-qcommon-common-z-availablezonememory-function-z-availablezonememory-zone-src-mq3-qcommon-common-ml-1213818792"></a>
### Z_AvailableZoneMemory

```ml
function Z_AvailableZoneMemory(zone)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `zone` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L106)

<a id="function-function-mq3-qcommon-common-z-checkheap-function-z-checkheap-state-src-mq3-qcommon-common-ml-1146204395"></a>
### Z_CheckHeap

```ml
function Z_CheckHeap(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L121)

<a id="function-function-mq3-qcommon-common-z-clearzone-function-z-clearzone-zone-size-src-mq3-qcommon-common-ml-468800729"></a>
### Z_ClearZone

```ml
function Z_ClearZone(zone, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `zone` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L105)

<a id="function-function-mq3-qcommon-common-z-free-function-z-free-state-value-src-mq3-qcommon-common-ml-2061193678"></a>
### Z_Free

```ml
function Z_Free(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L116)

<a id="function-function-mq3-qcommon-common-z-freetags-function-z-freetags-state-tag-src-mq3-qcommon-common-ml-2037615277"></a>
### Z_FreeTags

```ml
function Z_FreeTags(state, tag)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `tag` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L120)

<a id="function-function-mq3-qcommon-common-z-logheap-function-z-logheap-state-src-mq3-qcommon-common-ml-530650031"></a>
### Z_LogHeap

```ml
function Z_LogHeap(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L123)

<a id="function-function-mq3-qcommon-common-z-logzoneheap-function-z-logzoneheap-state-zone-name-src-mq3-qcommon-common-ml-1797015232"></a>
### Z_LogZoneHeap

```ml
function Z_LogZoneHeap(state, zone, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `zone` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L122)

<a id="function-function-mq3-qcommon-common-z-malloc-function-z-malloc-state-size-src-mq3-qcommon-common-ml-1743034678"></a>
### Z_Malloc

```ml
function Z_Malloc(state, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L113)

<a id="function-function-mq3-qcommon-common-z-mallocdebug-function-z-mallocdebug-state-size-label-file-line-src-mq3-qcommon-common-ml-989484002"></a>
### Z_MallocDebug

```ml
function Z_MallocDebug(state, size, label, file, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L112)

<a id="function-function-mq3-qcommon-common-z-tagmalloc-function-z-tagmalloc-state-size-tag-src-mq3-qcommon-common-ml-492338018"></a>
### Z_TagMalloc

```ml
function Z_TagMalloc(state, size, tag)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `tag` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L111)

<a id="function-function-mq3-qcommon-common-z-tagmallocdebug-function-z-tagmallocdebug-state-size-tag-label-file-line-src-mq3-qcommon-common-ml-2025716620"></a>
### Z_TagMallocDebug

```ml
function Z_TagMallocDebug(state, size, tag, label, file, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `tag` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |
| `file` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L108)

- [mq3.qcommon.common.Zone](Type-mq3-qcommon-common-zone-1187699781.md) — struct
